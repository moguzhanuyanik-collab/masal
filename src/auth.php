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
        if ($studentId!==null && auth_user_has_role($user,'ogrenci')) {
            $_SESSION['ogrenci_id']=$studentId;
        } else {
            unset($_SESSION['ogrenci_id']);
        }
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
                if ($user) return $user;
                unset($_SESSION['kullanici_id'],$_SESSION['ogrenci_id']);
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
        if (!$user || !auth_user_has_role($user,'ogrenci')) return null;
        try {
            return auth_student_id_for_user(db(),(int)$user['id']);
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('require_login')) {
    function require_login(): array {
        $user=authenticated_user();
        if ($user) return $user;
        header('Location: login.php');
        exit;
    }
}

if (!function_exists('require_role')) {
    function require_role(string|array $roles): array {
        $user=require_login();
        if (auth_user_has_role($user,$roles)) return $user;
        http_response_code(403);
        echo 'Bu sayfayı görüntüleme yetkiniz yok.';
        exit;
    }
}

if (!function_exists('require_student_login')) {
    function require_student_login(): int {
        $id=authenticated_student_id();
        if ($id!==null) return $id;
        $user=authenticated_user();
        if ($user) {
            header('Location: rol-paneli.php');
            exit;
        }
        header('Location: login.php');
        exit;
    }
}

if (!function_exists('require_api_student')) {
    function require_api_student(): int {
        $id=authenticated_student_id();
        if ($id!==null) return $id;
        if (function_exists('json_response')) {
            json_response([
                'ok'=>false,
                'message'=>'Bu işlem yalnızca öğrenci hesabıyla yapılabilir.',
                'auth_required'=>authenticated_user()===null
            ], authenticated_user()===null ? 401 : 403);
        }
        http_response_code(403);
        exit;
    }
}

if (!function_exists('auth_accessible_student_ids')) {
    function auth_accessible_student_ids(PDO $pdo, int $userId): array {
        $user=auth_fetch_user($pdo,$userId);
        if (!$user) return [];

        if (auth_user_has_role($user,['super_admin','yonetici'])) {
            $rows=$pdo->query('SELECT id FROM ogrenciler WHERE aktif=1 ORDER BY id')->fetchAll(PDO::FETCH_COLUMN);
            return array_values(array_map('intval',$rows?:[]));
        }

        $ids=[];
        if (auth_user_has_role($user,'ogrenci')) {
            $studentId=auth_student_id_for_user($pdo,$userId);
            if ($studentId) $ids[]=$studentId;
        }

        if (auth_user_has_role($user,'veli')
            && auth_runtime_table_exists($pdo,'veli_ogrenci')
            && auth_runtime_table_exists($pdo,'veliler')
            && auth_runtime_column_exists($pdo,'veliler','kullanici_id')) {
            try {
                $stmt=$pdo->prepare('SELECT vo.ogrenci_id FROM veli_ogrenci vo INNER JOIN veliler v ON v.id=vo.veli_id WHERE v.kullanici_id=? AND v.aktif=1');
                $stmt->execute([$userId]);
                foreach ($stmt->fetchAll(PDO::FETCH_COLUMN) as $id) $ids[]=(int)$id;
                $stmt->closeCursor();
            } catch (Throwable) {}
        }

        if (auth_user_has_role($user,'ogretmen')
            && auth_runtime_table_exists($pdo,'ogretmen_ogrenci')
            && auth_runtime_table_exists($pdo,'ogretmenler')
            && auth_runtime_column_exists($pdo,'ogretmenler','kullanici_id')) {
            try {
                $stmt=$pdo->prepare('SELECT oo.ogrenci_id FROM ogretmen_ogrenci oo INNER JOIN ogretmenler o ON o.id=oo.ogretmen_id WHERE o.kullanici_id=? AND o.aktif=1');
                $stmt->execute([$userId]);
                foreach ($stmt->fetchAll(PDO::FETCH_COLUMN) as $id) $ids[]=(int)$id;
                $stmt->closeCursor();
            } catch (Throwable) {}
        }

        return array_values(array_unique(array_filter($ids,static fn(int $id):bool=>$id>0)));
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
        return auth_user_has_role($user,'ogrenci') && (string)($user['ana_rol']??'')==='ogrenci'
            ? 'index.php'
            : 'rol-paneli.php';
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
