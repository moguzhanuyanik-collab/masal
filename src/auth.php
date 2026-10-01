<?php
declare(strict_types=1);

if (!function_exists('app_session_start')) {
    function app_session_start(): void {
        if (session_status() === PHP_SESSION_ACTIVE) return;
        $secure = (!empty($_SERVER['HTTPS']) && strtolower((string)$_SERVER['HTTPS']) !== 'off')
            || strtolower((string)($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '')) === 'https';
        session_name('ilkadim_session');
        session_set_cookie_params([
            'lifetime'=>0,
            'path'=>'/',
            'secure'=>$secure,
            'httponly'=>true,
            'samesite'=>'Lax'
        ]);
        session_start();
    }
}

if (!function_exists('auth_cookie_secure')) {
    function auth_cookie_secure(): bool {
        return (!empty($_SERVER['HTTPS']) && strtolower((string)$_SERVER['HTTPS']) !== 'off')
            || strtolower((string)($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '')) === 'https';
    }
}

if (!function_exists('csrf_token')) {
    function csrf_token(): string {
        app_session_start();
        if (empty($_SESSION['csrf_token']) || !is_string($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
        return $_SESSION['csrf_token'];
    }
}

if (!function_exists('verify_csrf')) {
    function verify_csrf(?string $token): bool {
        app_session_start();
        return is_string($token)
            && isset($_SESSION['csrf_token'])
            && is_string($_SESSION['csrf_token'])
            && hash_equals($_SESSION['csrf_token'], $token);
    }
}

if (!function_exists('auth_runtime_table_exists')) {
    function auth_runtime_table_exists(PDO $pdo, string $table): bool {
        try {
            $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
            $stmt->execute([$table]);
            $exists=(int)$stmt->fetchColumn()>0;
            $stmt->closeCursor();
            return $exists;
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('auth_runtime_column_exists')) {
    function auth_runtime_column_exists(PDO $pdo, string $table, string $column): bool {
        try {
            $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name=?');
            $stmt->execute([$table,$column]);
            $exists=(int)$stmt->fetchColumn()>0;
            $stmt->closeCursor();
            return $exists;
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('auth_session_version')) {
    function auth_session_version(PDO $pdo, int $userId): int {
        if ($userId<=0 || !auth_runtime_table_exists($pdo,'kullanicilar')
            || !auth_runtime_column_exists($pdo,'kullanicilar','oturum_surumu')) return 1;
        try {
            $stmt=$pdo->prepare('SELECT oturum_surumu FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
            $stmt->execute([$userId]);
            $version=max(1,(int)($stmt->fetchColumn()?:1));
            $stmt->closeCursor();
            return $version;
        } catch (Throwable) {
            return 1;
        }
    }
}

if (!function_exists('auth_security_log_once')) {
    function auth_security_log_once(string $code): void {
        static $logged=[];
        if(isset($logged[$code])) return;
        $logged[$code]=true;
        error_log('[IlkAdim][security] '.$code);
    }
}

if (!function_exists('auth_login_rate_scopes')) {
    function auth_login_rate_scopes(string $email, string $ip): array {
        $normalizedEmail=mb_strtolower(trim($email),'UTF-8');
        $emailHash=hash('sha256',$normalizedEmail);
        $cleanIp=trim($ip);
        $scopes=[['email',$emailHash]];
        if($cleanIp!==''){
            $scopes[]=['email_ip',hash('sha256',$normalizedEmail."\n".$cleanIp)];
            $scopes[]=['ip',hash('sha256',$cleanIp)];
        }
        return $scopes;
    }
}

if (!function_exists('auth_login_rate_status')) {
    function auth_login_rate_status(PDO $pdo, string $email, string $ip): array {
        if (!auth_runtime_table_exists($pdo,'giris_guvenlik')) return ['blocked'=>false,'retry_after'=>0];
        $retryAfter=0;
        try {
            $stmt=$pdo->prepare("SELECT UNIX_TIMESTAMP(engel_bitis) engel_bitis
                FROM giris_guvenlik
                WHERE kapsam=? AND kapsam_hash=?
                LIMIT 1");
            $now=(int)($pdo->query('SELECT UNIX_TIMESTAMP(NOW())')->fetchColumn()?:time());
            foreach(auth_login_rate_scopes($email,$ip) as [$scope,$hash]){
                $stmt->execute([$scope,$hash]);
                $until=(int)($stmt->fetchColumn()?:0);
                $stmt->closeCursor();
                if($until>$now) $retryAfter=max($retryAfter,$until-$now);
            }
        } catch (Throwable) {
            auth_security_log_once('login_rate_status_failed');
            return ['blocked'=>false,'retry_after'=>0];
        }
        return ['blocked'=>$retryAfter>0,'retry_after'=>min(3600,$retryAfter)];
    }
}

if (!function_exists('auth_login_rate_failure')) {
    function auth_login_rate_failure(PDO $pdo, string $email, string $ip): void {
        if (!auth_runtime_table_exists($pdo,'giris_guvenlik')) return;
        $started=false;
        try {
            if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
            $now=(int)($pdo->query('SELECT UNIX_TIMESTAMP(NOW())')->fetchColumn()?:time());
            $ensure=$pdo->prepare("INSERT IGNORE INTO giris_guvenlik
                (kapsam,kapsam_hash,deneme_sayisi,pencere_baslangici,engel_bitis,son_deneme)
                VALUES (?,?,0,FROM_UNIXTIME(?),NULL,FROM_UNIXTIME(?))");
            $select=$pdo->prepare("SELECT deneme_sayisi,UNIX_TIMESTAMP(pencere_baslangici) pencere_baslangici
                FROM giris_guvenlik WHERE kapsam=? AND kapsam_hash=? LIMIT 1 FOR UPDATE");
            $update=$pdo->prepare("UPDATE giris_guvenlik
                SET deneme_sayisi=?,pencere_baslangici=FROM_UNIXTIME(?),
                    engel_bitis=FROM_UNIXTIME(?),son_deneme=FROM_UNIXTIME(?)
                WHERE kapsam=? AND kapsam_hash=?");
            foreach(auth_login_rate_scopes($email,$ip) as [$scope,$hash]){
                // Önce satırı oluştur, sonra FOR UPDATE ile kilitle. Böylece ilk eşzamanlı
                // başarısız denemelerde olmayan satır üzerinde yarış oluşmaz.
                $ensure->execute([$scope,$hash,$now,$now]);
                $select->execute([$scope,$hash]);
                $row=$select->fetch(PDO::FETCH_ASSOC);
                $select->closeCursor();
                if(!is_array($row)) throw new RuntimeException('Giriş güvenlik sayacı oluşturulamadı.');

                $count=1;
                $windowStart=$now;
                $oldStart=(int)($row['pencere_baslangici']??0);
                if($oldStart>0 && $oldStart>=$now-900){
                    $count=max(0,(int)($row['deneme_sayisi']??0))+1;
                    $windowStart=$oldStart;
                }

                [$threshold,$blockSeconds]=match($scope){
                    'email_ip'=>[5,600],
                    'email'=>[20,600],
                    'ip'=>[30,900],
                    default=>[30,600],
                };
                $blockUntil=$count>=$threshold ? $now+$blockSeconds : 0;
                $blockValue=$blockUntil>0 ? $blockUntil : null;
                $update->execute([$count,$windowStart,$blockValue,$now,$scope,$hash]);
            }
            if($started)$pdo->commit();
        } catch (Throwable) {
            if($started && $pdo->inTransaction())$pdo->rollBack();
            auth_security_log_once('login_rate_failure_failed');
        }
    }
}

if (!function_exists('auth_login_rate_success')) {
    function auth_login_rate_success(PDO $pdo, string $email, string $ip): void {
        if (!auth_runtime_table_exists($pdo,'giris_guvenlik')) return;
        try {
            $normalizedEmail=mb_strtolower(trim($email),'UTF-8');
            $emailHash=hash('sha256',$normalizedEmail);
            $cleanIp=trim($ip);
            if($cleanIp===''){
                $stmt=$pdo->prepare("DELETE FROM giris_guvenlik WHERE kapsam='email' AND kapsam_hash=?");
                $stmt->execute([$emailHash]);
                return;
            }
            $emailIpHash=hash('sha256',$normalizedEmail."\n".$cleanIp);
            $stmt=$pdo->prepare("DELETE FROM giris_guvenlik
                WHERE (kapsam='email' AND kapsam_hash=?)
                   OR (kapsam='email_ip' AND kapsam_hash=?)");
            $stmt->execute([$emailHash,$emailIpHash]);
        } catch (Throwable) {
            auth_security_log_once('login_rate_success_failed');
        }
    }
}

if (!function_exists('auth_user_id_by_email')) {
    function auth_user_id_by_email(PDO $pdo, string $email): ?int {
        $email=mb_strtolower(trim($email));
        if ($email==='' || !auth_runtime_table_exists($pdo,'kullanicilar')) return null;
        try {
            $stmt=$pdo->prepare("SELECT id FROM kullanicilar
                WHERE (email COLLATE utf8mb4_turkish_ci)=(CONVERT(? USING utf8mb4) COLLATE utf8mb4_turkish_ci)
                  AND aktif=1
                LIMIT 1");
            $stmt->execute([$email]);
            $id=(int)($stmt->fetchColumn()?:0);
            $stmt->closeCursor();
            return $id>0?$id:null;
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('auth_allowed_roles')) {
    function auth_allowed_roles(): array {
        return ['ogrenci','veli','ogretmen','yonetici','super_admin'];
    }
}

if (!function_exists('auth_user_roles')) {
    function auth_user_roles(PDO $pdo, int $userId, ?string $primaryRole=null): array {
        $roles=[];
        try {
            if (auth_runtime_table_exists($pdo,'kullanici_rolleri')) {
                $stmt=$pdo->prepare('SELECT rol FROM kullanici_rolleri WHERE kullanici_id=? ORDER BY rol');
                $stmt->execute([$userId]);
                foreach ($stmt->fetchAll(PDO::FETCH_COLUMN) as $role) {
                    $role=(string)$role;
                    if (in_array($role,auth_allowed_roles(),true)) $roles[]=$role;
                }
            }
        } catch (Throwable) {}
        if ($primaryRole && in_array($primaryRole,auth_allowed_roles(),true)) $roles[]=$primaryRole;
        return array_values(array_unique($roles));
    }
}

if (!function_exists('auth_fetch_user')) {
    function auth_fetch_user(PDO $pdo, int $userId): ?array {
        if ($userId<=0 || !auth_runtime_table_exists($pdo,'kullanicilar')) return null;
        $stmt=$pdo->prepare('SELECT id,email,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
        $stmt->execute([$userId]);
        $row=$stmt->fetch();
        if (!is_array($row)) return null;
        $row['id']=(int)$row['id'];
        $row['roles']=auth_user_roles($pdo,(int)$row['id'],(string)$row['ana_rol']);
        return $row;
    }
}

if (!function_exists('auth_user_has_role')) {
    function auth_user_has_role(?array $user, string|array $roles): bool {
        if (!$user) return false;
        $wanted=is_array($roles)?$roles:[$roles];
        $actual=is_array($user['roles']??null)?$user['roles']:[];
        foreach ($wanted as $role) {
            if (in_array((string)$role,$actual,true)) return true;
        }
        return false;
    }
}

if (!function_exists('auth_effective_role')) {
    function auth_effective_role(?array $user): ?string {
        if (!$user) return null;
        $roles=is_array($user['roles']??null)?$user['roles']:[];
        $primary=(string)($user['ana_rol']??'');
        if ($primary!=='' && !in_array($primary,$roles,true)) $roles[]=$primary;

        foreach (['super_admin','yonetici','ogretmen','veli','ogrenci'] as $role) {
            if (in_array($role,$roles,true)) return $role;
        }
        return null;
    }
}

if (!function_exists('auth_role_home')) {
    function auth_role_home(?array $user): string {
        return match(auth_effective_role($user)) {
            'super_admin' => 'super-admin.php',
            'yonetici' => 'yonetici-paneli.php',
            'ogretmen' => 'ogretmen-paneli.php',
            'veli' => 'veli-paneli.php',
            'ogrenci' => 'index.php',
            default => 'login.php',
        };
    }
}

if (!function_exists('auth_is_effective_role')) {
    function auth_is_effective_role(?array $user, string|array $roles): bool {
        $effective=auth_effective_role($user);
        if ($effective===null) return false;
        $wanted=is_array($roles)?$roles:[$roles];
        return in_array($effective,array_map('strval',$wanted),true);
    }
}

if (!function_exists('auth_redirect_to_role_home')) {
    function auth_redirect_to_role_home(array $user): never {
        header('Location: '.auth_role_home($user));
        exit;
    }
}

if (!function_exists('auth_user_institution_ids_raw')) {
    function auth_user_institution_ids_raw(PDO $pdo, int $userId, ?string $institutionRole=null): array {
        if ($userId<=0 || !auth_runtime_table_exists($pdo,'kurum_kullanicilari')) return [];
        try {
            if ($institutionRole!==null) {
                $stmt=$pdo->prepare('SELECT DISTINCT kurum_id FROM kurum_kullanicilari WHERE kullanici_id=? AND kurum_rolu=? AND aktif=1 ORDER BY kurum_id');
                $stmt->execute([$userId,$institutionRole]);
            } else {
                $stmt=$pdo->prepare('SELECT DISTINCT kurum_id FROM kurum_kullanicilari WHERE kullanici_id=? AND aktif=1 ORDER BY kurum_id');
                $stmt->execute([$userId]);
            }
            $ids=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
            $stmt->closeCursor();
            return array_values(array_filter(array_unique($ids),static fn(int $id):bool=>$id>0));
        } catch (Throwable) {
            return [];
        }
    }
}

if (!function_exists('auth_institution_license_access')) {
    function auth_institution_license_access(PDO $pdo, int $institutionId): array {
        $base=[
            'institution_id'=>$institutionId,'institution_name'=>'','allowed'=>true,'has_license'=>false,
            'reason'=>'legacy_unlicensed','status'=>'','package_name'=>'','start'=>null,'end'=>null
        ];
        if($institutionId<=0) return array_replace($base,['allowed'=>false,'reason'=>'institution_missing']);
        if(!auth_runtime_table_exists($pdo,'kurumlar')) {
            return array_replace($base,['reason'=>'license_policy_unavailable']);
        }

        try {
            $stmt=$pdo->prepare('SELECT id,ad,aktif FROM kurumlar WHERE id=? LIMIT 1');
            $stmt->execute([$institutionId]);
            $institution=$stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
            if(!is_array($institution)) return array_replace($base,['allowed'=>false,'reason'=>'institution_missing']);
            $base['institution_name']=(string)($institution['ad']??'');
            if((int)($institution['aktif']??0)!==1){
                return array_replace($base,['allowed'=>false,'reason'=>'institution_inactive']);
            }

            if(!auth_runtime_table_exists($pdo,'kurum_lisanslari') || !auth_runtime_table_exists($pdo,'paketler')){
                return array_replace($base,['reason'=>'license_policy_unavailable']);
            }

            $stmt=$pdo->prepare("SELECT
                kl.id,kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi,kl.durum,
                p.id paket_var,p.ad paket_adi,p.aktif paket_aktif
                FROM kurum_lisanslari kl
                LEFT JOIN paketler p ON p.id=kl.paket_id
                WHERE kl.kurum_id=?
                LIMIT 1");
            $stmt->execute([$institutionId]);
            $license=$stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            if(!is_array($license)) return $base;

            $base['has_license']=true;
            $base['status']=(string)($license['durum']??'');
            $base['package_name']=(string)($license['paket_adi']??'');
            $base['start']=$license['baslangic_tarihi']??null;
            $base['end']=$license['bitis_tarihi']??null;

            if(empty($license['paket_var'])){
                return array_replace($base,['allowed'=>false,'reason'=>'license_package_missing']);
            }
            if((int)($license['paket_aktif']??0)!==1){
                return array_replace($base,['allowed'=>false,'reason'=>'package_inactive']);
            }

            $today=date('Y-m-d');
            $status=(string)($license['durum']??'aktif');
            $start=(string)($license['baslangic_tarihi']??'');
            $end=(string)($license['bitis_tarihi']??'');

            if($status==='askida') return array_replace($base,['allowed'=>false,'reason'=>'license_suspended']);
            if($status==='iptal') return array_replace($base,['allowed'=>false,'reason'=>'license_cancelled']);
            if($start!=='' && $start>$today) return array_replace($base,['allowed'=>false,'reason'=>'license_not_started']);
            if($end!=='' && $end<$today) return array_replace($base,['allowed'=>false,'reason'=>'license_expired']);
            if(!in_array($status,['aktif','deneme'],true)){
                return array_replace($base,['allowed'=>false,'reason'=>'license_inactive']);
            }
            return array_replace($base,['allowed'=>true,'reason'=>'licensed']);
        } catch (Throwable) {
            auth_security_log_once('institution_license_access_failed');
            return array_replace($base,['reason'=>'license_policy_unavailable']);
        }
    }
}

if (!function_exists('auth_license_reason_label')) {
    function auth_license_reason_label(string $reason): string {
        return match($reason){
            'licensed'=>'Lisans aktif',
            'legacy_unlicensed'=>'Eski / lisans tanımlanmamış kurum',
            'license_suspended'=>'Lisans askıda',
            'license_cancelled'=>'Lisans iptal edildi',
            'license_expired'=>'Lisans süresi doldu',
            'license_not_started'=>'Lisans henüz başlamadı',
            'package_inactive'=>'Paket pasif',
            'license_package_missing'=>'Lisans paket kaydı bulunamıyor',
            'institution_inactive'=>'Kurum pasif',
            'institution_missing'=>'Kurum bulunamadı',
            'license_inactive'=>'Lisans kullanıma açık değil',
            'license_policy_unavailable'=>'Lisans politikası henüz uygulanamıyor',
            default=>'Lisans durumu doğrulanamadı',
        };
    }
}

if (!function_exists('auth_user_institution_ids')) {
    function auth_user_institution_ids(PDO $pdo, int $userId, ?string $institutionRole=null): array {
        $ids=auth_user_institution_ids_raw($pdo,$userId,$institutionRole);
        if(!$ids) return [];

        $role=$institutionRole;
        if($role===null){
            $user=auth_fetch_user($pdo,$userId);
            $role=(string)(auth_effective_role($user)??'');
        }
        if(!in_array($role,['ogrenci','veli','ogretmen'],true)) return $ids;

        $allowed=[];
        foreach($ids as $institutionId){
            $access=auth_institution_license_access($pdo,$institutionId);
            if(($access['allowed']??false)===true) $allowed[]=$institutionId;
        }
        return $allowed;
    }
}

if (!function_exists('auth_user_in_institution_raw')) {
    function auth_user_in_institution_raw(PDO $pdo, int $userId, int $institutionId, ?string $institutionRole=null): bool {
        if ($userId<=0 || $institutionId<=0 || !auth_runtime_table_exists($pdo,'kurum_kullanicilari')) return false;
        try {
            if ($institutionRole!==null) {
                $stmt=$pdo->prepare('SELECT 1 FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id=? AND kurum_rolu=? AND aktif=1 LIMIT 1');
                $stmt->execute([$institutionId,$userId,$institutionRole]);
            } else {
                $stmt=$pdo->prepare('SELECT 1 FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id=? AND aktif=1 LIMIT 1');
                $stmt->execute([$institutionId,$userId]);
            }
            $ok=(bool)$stmt->fetchColumn();
            $stmt->closeCursor();
            return $ok;
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('auth_user_in_institution')) {
    function auth_user_in_institution(PDO $pdo, int $userId, int $institutionId, ?string $institutionRole=null): bool {
        if(!auth_user_in_institution_raw($pdo,$userId,$institutionId,$institutionRole)) return false;
        $role=$institutionRole;
        if($role===null){
            $user=auth_fetch_user($pdo,$userId);
            $role=(string)(auth_effective_role($user)??'');
        }
        if(!in_array($role,['ogrenci','veli','ogretmen'],true)) return true;
        return (auth_institution_license_access($pdo,$institutionId)['allowed']??false)===true;
    }
}

if (!function_exists('auth_operational_access_summary')) {
    function auth_operational_access_summary(PDO $pdo, array $user): array {
        $role=(string)(auth_effective_role($user)??'');
        if(!in_array($role,['ogrenci','veli','ogretmen'],true)){
            return ['restricted'=>false,'allowed'=>true,'role'=>$role,'raw_ids'=>[],'allowed_ids'=>[],'institutions'=>[]];
        }

        $raw=auth_user_institution_ids_raw($pdo,(int)$user['id'],$role);
        if(!$raw){
            return ['restricted'=>false,'allowed'=>true,'role'=>$role,'raw_ids'=>[],'allowed_ids'=>[],'institutions'=>[],'reason'=>'direct_user'];
        }

        $allowed=[];
        $rows=[];
        foreach($raw as $institutionId){
            $access=auth_institution_license_access($pdo,$institutionId);
            $rows[]=$access;
            if(($access['allowed']??false)===true) $allowed[]=$institutionId;
        }

        return [
            'restricted'=>count($allowed)===0,
            'allowed'=>count($allowed)>0,
            'role'=>$role,
            'raw_ids'=>$raw,
            'allowed_ids'=>$allowed,
            'institutions'=>$rows,
            'reason'=>count($allowed)>0?'institution_available':'no_operational_institution',
        ];
    }
}

if (!function_exists('auth_manageable_institution_ids')) {
    function auth_manageable_institution_ids(PDO $pdo, array $user): array {
        $effective=auth_effective_role($user);
        if ($effective==='super_admin') {
            if (!auth_runtime_table_exists($pdo,'kurumlar')) return [];
            try {
                $stmt=$pdo->query('SELECT id FROM kurumlar WHERE aktif=1 ORDER BY id');
                $ids=$stmt?array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]):[];
                if ($stmt) $stmt->closeCursor();
                return array_values(array_filter($ids,static fn(int $id):bool=>$id>0));
            } catch (Throwable) {
                return [];
            }
        }
        if ($effective==='yonetici') {
            return auth_user_institution_ids($pdo,(int)$user['id'],'yonetici');
        }
        return [];
    }
}

if (!function_exists('auth_institution_content_source')) {
    function auth_institution_content_source(PDO $pdo, int $institutionId): string {
        if ($institutionId<=0 || !auth_runtime_table_exists($pdo,'kurumlar')) return 'sistem';
        try {
            $stmt=$pdo->prepare('SELECT icerik_kaynagi FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
            $stmt->execute([$institutionId]);
            $value=(string)($stmt->fetchColumn()?:'sistem');
            $stmt->closeCursor();
            return $value==='kurum'?'kurum':'sistem';
        } catch (Throwable) {
            return 'sistem';
        }
    }
}

if (!function_exists('auth_student_id_for_user')) {
    function auth_student_id_for_user(PDO $pdo, int $userId): ?int {
        if ($userId<=0 || !auth_runtime_table_exists($pdo,'ogrenciler')) return null;

        try {
            if (auth_runtime_column_exists($pdo,'ogrenciler','kullanici_id')) {
                $stmt=$pdo->prepare('SELECT id FROM ogrenciler WHERE kullanici_id=? AND aktif=1 LIMIT 1');
                $stmt->execute([$userId]);
                $id=(int)($stmt->fetchColumn()?:0);
                $stmt->closeCursor();
                if ($id>0) return $id;
            }

            if (!auth_runtime_table_exists($pdo,'kullanicilar')) return null;
            $u=$pdo->prepare('SELECT email FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
            $u->execute([$userId]);
            $email=trim((string)($u->fetchColumn()?:''));
            $u->closeCursor();
            if ($email==='') return null;

            $s=$pdo->prepare("SELECT id FROM ogrenciler
                WHERE (email COLLATE utf8mb4_turkish_ci)=(CONVERT(? USING utf8mb4) COLLATE utf8mb4_turkish_ci)
                  AND aktif=1
                ORDER BY id
                LIMIT 1");
            $s->execute([$email]);
            $studentId=(int)($s->fetchColumn()?:0);
            $s->closeCursor();

            if ($studentId>0 && auth_runtime_column_exists($pdo,'ogrenciler','kullanici_id')) {
                try {
                    $pdo->prepare('UPDATE ogrenciler SET kullanici_id=? WHERE id=? AND kullanici_id IS NULL')
                        ->execute([$userId,$studentId]);
                } catch (Throwable) {}
            }

            return $studentId>0?$studentId:null;
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('auth_set_user_session')) {
    function auth_set_user_session(PDO $pdo, int $userId, bool $regenerate=true): ?array {
        $user=auth_fetch_user($pdo,$userId);
        if (!$user) return null;
        app_session_start();
        if ($regenerate) session_regenerate_id(true);
        $_SESSION['kullanici_id']=$userId;
        $_SESSION['csrf_token']=bin2hex(random_bytes(32));
        $studentId=auth_student_id_for_user($pdo,$userId);
        if ($studentId!==null && auth_effective_role($user)==='ogrenci') {
            $_SESSION['ogrenci_id']=$studentId;
        } else {
            unset($_SESSION['ogrenci_id']);
        }
        $_SESSION['aktif_rol']=auth_effective_role($user);
        $_SESSION['auth_version']=auth_session_version($pdo,$userId);
        return $user;
    }
}

if (!function_exists('auth_accounts_ready')) {
    function auth_accounts_ready(PDO $pdo): bool {
        try {
            if (auth_runtime_table_exists($pdo,'kullanicilar')) {
                $q=$pdo->query("SELECT COUNT(*) FROM kullanicilar WHERE aktif=1 AND email<>'' AND sifre_hash<>''");
                return (int)$q->fetchColumn()>0;
            }
            $q=$pdo->query("SELECT COUNT(*) FROM ogrenciler WHERE aktif=1 AND email IS NOT NULL AND email<>'' AND sifre_hash IS NOT NULL AND sifre_hash<>''");
            return (int)$q->fetchColumn()>0;
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('remember_user')) {
    function remember_user(PDO $pdo, int $userId): void {
        if (!auth_runtime_table_exists($pdo,'kullanici_oturum_tokenlari')) return;
        $raw=bin2hex(random_bytes(32));
        $hash=hash('sha256',$raw);
        $expires=(new DateTimeImmutable('+30 days'))->format('Y-m-d H:i:s');
        $stmt=$pdo->prepare('INSERT INTO kullanici_oturum_tokenlari (kullanici_id,token_hash,son_kullanma_tarihi) VALUES (?,?,?)');
        $stmt->execute([$userId,$hash,$expires]);
        setcookie('ilkadim_remember',$raw,[
            'expires'=>time()+30*86400,
            'path'=>'/',
            'secure'=>auth_cookie_secure(),
            'httponly'=>true,
            'samesite'=>'Lax'
        ]);
    }
}

if (!function_exists('remember_student')) {
    function remember_student(PDO $pdo, int $studentId): void {
        try {
            $stmt=$pdo->prepare('SELECT kullanici_id FROM ogrenciler WHERE id=? LIMIT 1');
            $stmt->execute([$studentId]);
            $userId=(int)($stmt->fetchColumn()?:0);
            if ($userId>0) remember_user($pdo,$userId);
        } catch (Throwable) {}
    }
}

if (!function_exists('clear_remember_cookie')) {
    function clear_remember_cookie(?PDO $pdo=null): void {
        $raw=(string)($_COOKIE['ilkadim_remember']??'');
        if ($raw!=='' && $pdo instanceof PDO) {
            $hash=hash('sha256',$raw);
            foreach ([
                ['kullanici_oturum_tokenlari','token_hash'],
                ['ogrenci_oturum_tokenlari','token_hash']
            ] as [$table,$column]) {
                try {
                    if (!auth_runtime_table_exists($pdo,$table)) continue;
                    $stmt=$pdo->prepare("DELETE FROM {$table} WHERE {$column}=?");
                    $stmt->execute([$hash]);
                } catch (Throwable) {}
            }
        }
        setcookie('ilkadim_remember','',[
            'expires'=>time()-3600,
            'path'=>'/',
            'secure'=>auth_cookie_secure(),
            'httponly'=>true,
            'samesite'=>'Lax'
        ]);
        unset($_COOKIE['ilkadim_remember']);
    }
}

if (!function_exists('authenticated_user')) {
    function authenticated_user(): ?array {
        app_session_start();
        try {
            $pdo=db();

            $userId=(int)($_SESSION['kullanici_id']??0);
            if ($userId>0) {
                $user=auth_fetch_user($pdo,$userId);
                if ($user) {
                    $currentVersion=auth_session_version($pdo,$userId);
                    $sessionVersion=array_key_exists('auth_version',$_SESSION)
                        ? max(1,(int)$_SESSION['auth_version'])
                        : 1;
                    if ($sessionVersion===$currentVersion) {
                        $_SESSION['auth_version']=$currentVersion;
                        return $user;
                    }
                    unset($_SESSION['kullanici_id'],$_SESSION['ogrenci_id'],$_SESSION['aktif_rol'],$_SESSION['auth_version']);
                    clear_remember_cookie($pdo);
                } else {
                    unset($_SESSION['kullanici_id'],$_SESSION['ogrenci_id'],$_SESSION['aktif_rol'],$_SESSION['auth_version']);
                }
            }

            $legacyStudent=(int)($_SESSION['ogrenci_id']??0);
            if ($legacyStudent>0 && auth_runtime_table_exists($pdo,'ogrenciler') && auth_runtime_table_exists($pdo,'kullanicilar')) {
                $legacyUser=0;

                if (auth_runtime_column_exists($pdo,'ogrenciler','kullanici_id')) {
                    try {
                        $stmt=$pdo->prepare('SELECT kullanici_id FROM ogrenciler WHERE id=? AND aktif=1 LIMIT 1');
                        $stmt->execute([$legacyStudent]);
                        $legacyUser=(int)($stmt->fetchColumn()?:0);
                        $stmt->closeCursor();
                    } catch (Throwable) {}
                }

                if ($legacyUser<=0) {
                    try {
                        $stmt=$pdo->prepare('SELECT email FROM ogrenciler WHERE id=? AND aktif=1 LIMIT 1');
                        $stmt->execute([$legacyStudent]);
                        $legacyEmail=trim((string)($stmt->fetchColumn()?:''));
                        $stmt->closeCursor();
                        if ($legacyEmail!=='') {
                            $legacyUser=(int)(auth_user_id_by_email($pdo,$legacyEmail)??0);
                            if ($legacyUser>0 && auth_runtime_column_exists($pdo,'ogrenciler','kullanici_id')) {
                                try {
                                    $pdo->prepare('UPDATE ogrenciler SET kullanici_id=? WHERE id=? AND kullanici_id IS NULL')
                                        ->execute([$legacyUser,$legacyStudent]);
                                } catch (Throwable) {}
                            }
                        }
                    } catch (Throwable) {}
                }

                if ($legacyUser>0) {
                    $user=auth_set_user_session($pdo,$legacyUser,false);
                    if ($user) return $user;
                }
            }

            $raw=(string)($_COOKIE['ilkadim_remember']??'');
            if ($raw==='') return null;
            $hash=hash('sha256',$raw);

            if (auth_runtime_table_exists($pdo,'kullanici_oturum_tokenlari')) {
                $stmt=$pdo->prepare("SELECT t.kullanici_id
                    FROM kullanici_oturum_tokenlari t
                    INNER JOIN kullanicilar k ON k.id=t.kullanici_id
                    WHERE t.token_hash=? AND t.son_kullanma_tarihi>NOW() AND k.aktif=1
                    LIMIT 1");
                $stmt->execute([$hash]);
                $remembered=(int)($stmt->fetchColumn()?:0);
                if ($remembered>0) return auth_set_user_session($pdo,$remembered,true);
            }

            if (auth_runtime_table_exists($pdo,'ogrenci_oturum_tokenlari')) {
                $stmt=$pdo->prepare("SELECT o.kullanici_id
                    FROM ogrenci_oturum_tokenlari t
                    INNER JOIN ogrenciler o ON o.id=t.ogrenci_id
                    WHERE t.token_hash=? AND t.son_kullanma_tarihi>NOW() AND o.aktif=1
                    LIMIT 1");
                $stmt->execute([$hash]);
                $legacyUser=(int)($stmt->fetchColumn()?:0);
                if ($legacyUser>0) {
                    clear_remember_cookie($pdo);
                    $user=auth_set_user_session($pdo,$legacyUser,true);
                    if ($user) remember_user($pdo,$legacyUser);
                    return $user;
                }
            }

            clear_remember_cookie($pdo);
            return null;
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('authenticated_student_id')) {
    function authenticated_student_id(): ?int {
        $user=authenticated_user();
        if (!$user || auth_effective_role($user)!=='ogrenci') return null;
        try {
            return auth_student_id_for_user(db(),(int)$user['id']);
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('auth_legal_pending_count')) {
    function auth_legal_pending_count(PDO $pdo, int $userId, string $role): int {
        if ($userId<=0 || $role==='' || !auth_runtime_table_exists($pdo,'yasal_belgeler')
            || !auth_runtime_table_exists($pdo,'yasal_belge_onaylari')) return 0;
        try {
            $stmt=$pdo->prepare("SELECT COUNT(*)
                FROM yasal_belgeler b
                WHERE b.durum='yayinda'
                  AND b.zorunlu=1
                  AND (b.yururluk_tarihi IS NULL OR b.yururluk_tarihi<=CURDATE())
                  AND FIND_IN_SET(?,b.hedef_roller)>0
                  AND NOT EXISTS (
                    SELECT 1 FROM yasal_belge_onaylari o
                    WHERE o.belge_id=b.id AND o.kullanici_id=? AND o.belge_hash=b.icerik_hash
                  )");
            $stmt->execute([$role,$userId]);
            $count=max(0,(int)($stmt->fetchColumn()?:0));
            $stmt->closeCursor();
            return $count;
        } catch (Throwable) {
            auth_security_log_once('legal_consent_check_failed');
            return 0;
        }
    }
}

if (!function_exists('auth_enforce_legal_consent')) {
    function auth_enforce_legal_consent(array $user): void {
        $script=basename((string)($_SERVER['SCRIPT_NAME']??''));
        if (in_array($script,['yasal-onay.php','logout.php','login.php','sifremi-unuttum.php','sifre-sifirla.php'],true)) return;
        try {
            $role=(string)(auth_effective_role($user)??'');
            if (auth_legal_pending_count(db(),(int)$user['id'],$role)>0) {
                header('Location: yasal-onay.php');
                exit;
            }
        } catch (Throwable) {
            auth_security_log_once('legal_consent_enforce_failed');
        }
    }
}

if (!function_exists('auth_enforce_institution_license_access')) {
    function auth_enforce_institution_license_access(array $user): void {
        $role=(string)(auth_effective_role($user)??'');
        if(!in_array($role,['ogrenci','veli','ogretmen'],true)) return;

        $script=basename((string)($_SERVER['SCRIPT_NAME']??''));
        if(in_array($script,[
            'lisans-erisim.php','destek.php','hesap-guvenligi.php','yasal-onay.php',
            'logout.php','login.php','sifremi-unuttum.php','sifre-sifirla.php'
        ],true)) return;

        try{
            $summary=auth_operational_access_summary(db(),$user);
            if(($summary['restricted']??false)===true){
                header('Location: lisans-erisim.php');
                exit;
            }
        }catch(Throwable){
            auth_security_log_once('institution_license_enforce_failed');
        }
    }
}

if (!function_exists('require_login')) {
    function require_login(): array {
        $user=authenticated_user();
        if ($user) {
            auth_enforce_legal_consent($user);
            auth_enforce_institution_license_access($user);
            return $user;
        }
        header('Location: login.php');
        exit;
    }
}

if (!function_exists('require_role')) {
    function require_role(string|array $roles): array {
        $user=require_login();
        if (auth_is_effective_role($user,$roles)) return $user;
        auth_redirect_to_role_home($user);
    }
}

if (!function_exists('require_student_login')) {
    function require_student_login(): int {
        $user=authenticated_user();
        if ($user && auth_effective_role($user)==='ogrenci') {
            auth_enforce_legal_consent($user);
            auth_enforce_institution_license_access($user);
            $id=auth_student_id_for_user(db(),(int)$user['id']);
            if ($id!==null) return $id;
        }
        if ($user) auth_redirect_to_role_home($user);
        header('Location: login.php');
        exit;
    }
}

if (!function_exists('require_api_student')) {
    function require_api_student(): int {
        $user=authenticated_user();
        if ($user && auth_effective_role($user)==='ogrenci') {
            $pending=auth_legal_pending_count(db(),(int)$user['id'],'ogrenci');
            if ($pending>0) {
                if (function_exists('json_response')) {
                    json_response([
                        'ok'=>false,
                        'message'=>'Devam etmek için güncel yasal belgeleri onaylaman gerekiyor.',
                        'legal_consent_required'=>true,
                        'pending_legal_documents'=>$pending
                    ],428);
                }
                http_response_code(428);
                exit;
            }
            $licenseAccess=auth_operational_access_summary(db(),$user);
            if(($licenseAccess['restricted']??false)===true){
                $reasons=[];
                foreach(($licenseAccess['institutions']??[]) as $institution){
                    $reason=(string)($institution['reason']??'license_inactive');
                    if($reason!=='') $reasons[]=$reason;
                }
                $reasons=array_values(array_unique($reasons));
                if (function_exists('json_response')) {
                    json_response([
                        'ok'=>false,
                        'message'=>'Kurum lisansın operasyonel kullanıma açık değil. Kurum yöneticin veya destek ekibiyle iletişime geç.',
                        'institution_license_required'=>true,
                        'license_reasons'=>$reasons
                    ],403);
                }
                http_response_code(403);
                exit;
            }
            $id=auth_student_id_for_user(db(),(int)$user['id']);
            if ($id!==null) return $id;
        }
        if (function_exists('json_response')) {
            json_response([
                'ok'=>false,
                'message'=>'Bu işlem yalnızca öğrenci hesabıyla yapılabilir.',
                'auth_required'=>$user===null
            ], $user===null ? 401 : 403);
        }
        http_response_code(403);
        exit;
    }
}

if (!function_exists('auth_accessible_student_ids')) {
    function auth_accessible_student_ids(PDO $pdo, int $userId): array {
        $user=auth_fetch_user($pdo,$userId);
        if (!$user) return [];
        $effective=auth_effective_role($user);

        if ($effective==='super_admin') {
            $stmt=$pdo->query('SELECT id FROM ogrenciler WHERE aktif=1 ORDER BY id');
            $rows=$stmt?$stmt->fetchAll(PDO::FETCH_COLUMN):[];
            if ($stmt) $stmt->closeCursor();
            return array_values(array_map('intval',$rows?:[]));
        }

        if ($effective==='yonetici') {
            $institutionIds=auth_user_institution_ids($pdo,$userId,'yonetici');
            if (!$institutionIds || !auth_runtime_table_exists($pdo,'kurum_kullanicilari')) return [];
            $placeholders=implode(',',array_fill(0,count($institutionIds),'?'));
            $stmt=$pdo->prepare("SELECT DISTINCT o.id
                FROM ogrenciler o
                INNER JOIN kurum_kullanicilari kk ON kk.kullanici_id=o.kullanici_id
                  AND kk.kurum_rolu='ogrenci' AND kk.aktif=1
                WHERE o.aktif=1 AND kk.kurum_id IN ({$placeholders})
                ORDER BY o.id");
            $stmt->execute($institutionIds);
            $rows=$stmt->fetchAll(PDO::FETCH_COLUMN);
            $stmt->closeCursor();
            return array_values(array_map('intval',$rows?:[]));
        }

        // Kurum izolasyonu: ilişki satırının kendi kurum_id kapsamı ile aktör ve
        // öğrencinin aktif kurum üyeliği aynı olmalıdır. Global (kurum_id=0)
        // ilişkiler yalnızca kurum üyeliği olmayan global hesaplarda kullanılabilir.
        // Böylece eski bir eşleştirme yeni kuruma taşındığında erişim açılmaz.
        if ($effective==='ogretmen'
            && auth_runtime_table_exists($pdo,'ogretmen_ogrenci')
            && auth_runtime_table_exists($pdo,'ogretmenler')
            && auth_runtime_table_exists($pdo,'kurum_kullanicilari')
            && auth_runtime_table_exists($pdo,'kurumlar')
            && auth_runtime_column_exists($pdo,'ogretmenler','kullanici_id')) {
            try {
                $stmt=$pdo->prepare("SELECT DISTINCT oo.ogrenci_id
                    FROM ogretmen_ogrenci oo
                    INNER JOIN ogretmenler o
                      ON o.id=oo.ogretmen_id
                     AND o.kullanici_id=?
                     AND o.aktif=1
                    INNER JOIN kurum_kullanicilari kt
                      ON kt.kullanici_id=o.kullanici_id
                     AND kt.kurum_rolu='ogretmen'
                     AND kt.aktif=1
                    INNER JOIN kurumlar k
                      ON k.id=kt.kurum_id
                     AND k.aktif=1
                    INNER JOIN ogrenciler s
                      ON s.id=oo.ogrenci_id
                     AND s.aktif=1
                    INNER JOIN kullanicilar su
                      ON su.id=s.kullanici_id
                     AND su.aktif=1
                    INNER JOIN kurum_kullanicilari ks
                      ON ks.kullanici_id=s.kullanici_id
                     AND ks.kurum_id=kt.kurum_id
                     AND ks.kurum_rolu='ogrenci'
                     AND ks.aktif=1
                    WHERE oo.kurum_id=kt.kurum_id
                    ORDER BY oo.ogrenci_id");
                $stmt->execute([$userId]);
                $ids=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
                $stmt->closeCursor();
                return array_values(array_filter($ids,static fn(int $id):bool=>$id>0));
            } catch (Throwable) {
                return [];
            }
        }

        if ($effective==='veli'
            && auth_runtime_table_exists($pdo,'veli_ogrenci')
            && auth_runtime_table_exists($pdo,'veliler')
            && auth_runtime_table_exists($pdo,'kurum_kullanicilari')
            && auth_runtime_table_exists($pdo,'kurumlar')
            && auth_runtime_column_exists($pdo,'veliler','kullanici_id')) {
            try {
                // Kuruma bağlı veliler yalnızca çocuklarıyla ortak aktif kurumda
                // erişebilir. Eski/bağımsız platform hesapları için, hem veli hem
                // öğrenci hiçbir aktif kuruma bağlı değilse doğrudan eşleştirme
                // korunur; bu, kurumlar arası erişim sağlamaz.
                $stmt=$pdo->prepare("SELECT DISTINCT vo.ogrenci_id
                    FROM veli_ogrenci vo
                    INNER JOIN veliler v
                      ON v.id=vo.veli_id
                     AND v.kullanici_id=?
                     AND v.aktif=1
                    INNER JOIN ogrenciler s
                      ON s.id=vo.ogrenci_id
                     AND s.aktif=1
                    INNER JOIN kullanicilar su
                      ON su.id=s.kullanici_id
                     AND su.aktif=1
                    WHERE (
                        EXISTS (
                            SELECT 1
                            FROM kurum_kullanicilari vk
                            INNER JOIN kurum_kullanicilari sk
                              ON sk.kurum_id=vk.kurum_id
                             AND sk.kullanici_id=s.kullanici_id
                             AND sk.kurum_rolu='ogrenci'
                             AND sk.aktif=1
                            INNER JOIN kurumlar k
                              ON k.id=vk.kurum_id
                             AND k.aktif=1
                            WHERE vk.kullanici_id=v.kullanici_id
                              AND vk.kurum_rolu='veli'
                              AND vk.aktif=1
                              AND vo.kurum_id=vk.kurum_id
                        )
                        OR (
                            NOT EXISTS (
                                SELECT 1
                                FROM kurum_kullanicilari vk0
                                INNER JOIN kurumlar k0
                                  ON k0.id=vk0.kurum_id
                                 AND k0.aktif=1
                                WHERE vk0.kullanici_id=v.kullanici_id
                                  AND vk0.kurum_rolu='veli'
                                  AND vk0.aktif=1
                            )
                            AND NOT EXISTS (
                                SELECT 1
                                FROM kurum_kullanicilari sk0
                                INNER JOIN kurumlar k1
                                  ON k1.id=sk0.kurum_id
                                 AND k1.aktif=1
                                WHERE sk0.kullanici_id=s.kullanici_id
                                  AND sk0.kurum_rolu='ogrenci'
                                  AND sk0.aktif=1
                            )
                            AND vo.kurum_id=0
                        )
                    )
                    ORDER BY vo.ogrenci_id");
                $stmt->execute([$userId]);
                $ids=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
                $stmt->closeCursor();
                return array_values(array_filter($ids,static fn(int $id):bool=>$id>0));
            } catch (Throwable) {
                return [];
            }
        }
        if ($effective==='ogrenci') {
            $studentId=auth_student_id_for_user($pdo,$userId);
            return $studentId?[$studentId]:[];
        }

        return [];
    }
}

if (!function_exists('can_access_student')) {
    function can_access_student(int $userId, int $studentId): bool {
        if ($userId<=0 || $studentId<=0) return false;
        try {
            return in_array($studentId,auth_accessible_student_ids(db(),$userId),true);
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('require_api_student_access')) {
    function require_api_student_access(PDO $pdo, ?int $requestedStudentId=null): int {
        $user=authenticated_user();
        if (!$user) {
            if (function_exists('json_response')) json_response(['ok'=>false,'message'=>'Oturum süresi doldu.','auth_required'=>true],401);
            http_response_code(401); exit;
        }
        $ids=auth_accessible_student_ids($pdo,(int)$user['id']);
        $studentId=$requestedStudentId && $requestedStudentId>0 ? $requestedStudentId : ($ids[0]??0);
        if ($studentId<=0 || !in_array($studentId,$ids,true)) {
            if (function_exists('json_response')) json_response(['ok'=>false,'message'=>'Bu öğrenciye erişim yetkiniz yok.'],403);
            http_response_code(403); exit;
        }
        return $studentId;
    }
}

if (!function_exists('auth_post_login_url')) {
    function auth_post_login_url(array $user): string {
        return auth_role_home($user);
    }
}

if (!function_exists('auth_audit')) {
    function auth_audit(PDO $pdo, ?int $actorId, ?int $targetId, string $action, string $detail=''): void {
        try {
            if (!auth_runtime_table_exists($pdo,'yetki_loglari')) return;
            $ip=mb_substr((string)($_SERVER['REMOTE_ADDR']??''),0,45);
            $stmt=$pdo->prepare('INSERT INTO yetki_loglari (yapan_kullanici_id,hedef_kullanici_id,islem,detay,ip) VALUES (?,?,?,?,?)');
            $stmt->execute([$actorId?:null,$targetId?:null,mb_substr($action,0,80),$detail!==''?$detail:null,$ip!==''?$ip:null]);
        } catch (Throwable) {}
    }
}
