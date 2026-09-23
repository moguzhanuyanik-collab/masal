<?php
declare(strict_types=1);

function ky_h(string $v): string {
    return htmlspecialchars($v,ENT_QUOTES,'UTF-8');
}

function ky_institution(PDO $pdo,int $institutionId): ?array {
    if($institutionId<=0) return null;
    try{
        $s=$pdo->prepare('SELECT id,kod,ad,tur,icerik_kaynagi,aktif FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
        $s->execute([$institutionId]);
        $row=$s->fetch();
        $s->closeCursor();
        return is_array($row)?$row:null;
    }catch(Throwable){
        return null;
    }
}

function ky_assert_manageable(PDO $pdo,array $user,int $institutionId): array {
    $institution=ky_institution($pdo,$institutionId);
    if(!$institution) throw new RuntimeException('Kurum bulunamadı.');
    if(auth_user_has_role($user,'super_admin')) return $institution;
    if(auth_user_has_role($user,'yonetici') && in_array($institutionId,auth_manageable_institution_ids($pdo,$user),true)) return $institution;
    throw new RuntimeException('Bu kurumu yönetme yetkin yok.');
}

function ky_validate_new_account(string $name,string $email,string $password): array {
    $name=trim($name);
    $email=mb_strtolower(trim($email));
    if(mb_strlen($name)<2 || mb_strlen($name)>190) throw new RuntimeException('Ad soyad bilgisini kontrol et.');
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Geçerli bir e-posta yaz.');
    if(mb_strlen($password)<8) throw new RuntimeException('Şifre en az 8 karakter olmalı.');
    $hash=password_hash($password,PASSWORD_DEFAULT);
    if(!is_string($hash)||$hash==='') throw new RuntimeException('Şifre oluşturulamadı.');
    return [$name,$email,$hash];
}

function ky_create_user(PDO $pdo,array $actor,string $role,string $name,string $email,string $password,?int $institutionId=null): int {
    if(!in_array($role,['ogrenci','veli','ogretmen','yonetici'],true)) throw new RuntimeException('Geçersiz kullanıcı rolü.');
    [$name,$email,$hash]=ky_validate_new_account($name,$email,$password);

    if($institutionId!==null){
        $institution=ky_assert_manageable($pdo,$actor,$institutionId);
        if($role==='yonetici' && !auth_user_has_role($actor,'super_admin')){
            throw new RuntimeException('Kurum yöneticisini yalnızca Süper Admin ekleyebilir.');
        }
    }elseif(!auth_user_has_role($actor,'super_admin')){
        throw new RuntimeException('Global kullanıcıları yalnızca Süper Admin oluşturabilir.');
    }

    $pdo->beginTransaction();
    try{
        $s=$pdo->prepare('INSERT INTO kullanicilar (email,sifre_hash,ad_soyad,ana_rol,aktif) VALUES (?,?,?,?,1)');
        $s->execute([$email,$hash,$name,$role]);
        $userId=(int)$pdo->lastInsertId();

        $pdo->prepare('INSERT INTO kullanici_rolleri (kullanici_id,rol) VALUES (?,?)')
            ->execute([$userId,$role]);

        if($institutionId!==null){
            $institutionRole=$role==='yonetici'?'yonetici':$role;
            $pdo->prepare('INSERT INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif) VALUES (?,?,?,1)')
                ->execute([$institutionId,$userId,$institutionRole]);
        }

        if($role==='ogrenci'){
            $pdo->prepare("INSERT INTO ogrenciler (kullanici_id,ad,email,sifre_hash,avatar,aktif) VALUES (?,?,?,?,?,1)")
                ->execute([$userId,$name,$email,$hash,'🌞']);
        }elseif($role==='veli'){
            $pdo->prepare('INSERT INTO veliler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')
                ->execute([$userId,$name]);
        }elseif($role==='ogretmen'){
            $pdo->prepare('INSERT INTO ogretmenler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')
                ->execute([$userId,$name]);
        }

        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit(
        $pdo,
        (int)$actor['id'],
        $userId,
        $institutionId===null?'global_kullanici_olustur':'kurum_kullanici_olustur',
        'Rol: '.$role.($institutionId!==null?' Kurum: '.$institutionId:'')
    );

    return $userId;
}

function ky_role_members(PDO $pdo,int $institutionId,string $role): array {
    if($institutionId<=0 || !in_array($role,['yonetici','ogretmen','veli','ogrenci'],true)) return [];
    try{
        if($role==='ogrenci'){
            $s=$pdo->prepare("SELECT k.id kullanici_id,k.ad_soyad,k.email,k.aktif,o.id ogrenci_id,o.ad
                FROM kurum_kullanicilari kk
                INNER JOIN kullanicilar k ON k.id=kk.kullanici_id
                INNER JOIN ogrenciler o ON o.kullanici_id=k.id
                WHERE kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1
                ORDER BY o.ad,o.id");
            $s->execute([$institutionId]);
        }else{
            $s=$pdo->prepare("SELECT k.id kullanici_id,k.ad_soyad,k.email,k.aktif,NULL ogrenci_id,k.ad_soyad ad
                FROM kurum_kullanicilari kk
                INNER JOIN kullanicilar k ON k.id=kk.kullanici_id
                WHERE kk.kurum_id=? AND kk.kurum_rolu=? AND kk.aktif=1
                ORDER BY k.ad_soyad,k.id");
            $s->execute([$institutionId,$role]);
        }
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function ky_global_students(PDO $pdo): array {
    try{
        $s=$pdo->query("SELECT k.id kullanici_id,k.ad_soyad,k.email,k.aktif,o.id ogrenci_id,o.ad,
          GROUP_CONCAT(DISTINCT pv.ad_soyad ORDER BY pv.ad_soyad SEPARATOR ', ') veli_adlari
          FROM kullanicilar k
          INNER JOIN ogrenciler o ON o.kullanici_id=k.id
          LEFT JOIN veli_ogrenci vo ON vo.ogrenci_id=o.id
          LEFT JOIN veliler v ON v.id=vo.veli_id
          LEFT JOIN kullanicilar pv ON pv.id=v.kullanici_id
          WHERE k.aktif=1 AND o.aktif=1
            AND NOT EXISTS (
              SELECT 1 FROM kurum_kullanicilari kk
              WHERE kk.kullanici_id=k.id AND kk.aktif=1
            )
          GROUP BY k.id,k.ad_soyad,k.email,k.aktif,o.id,o.ad
          ORDER BY o.ad,o.id");
        $rows=$s?$s->fetchAll():[];
        if($s)$s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function ky_global_parents(PDO $pdo): array {
    try{
        $s=$pdo->query("SELECT k.id kullanici_id,k.ad_soyad,k.email,k.aktif,v.id veli_id,
          GROUP_CONCAT(DISTINCT o.ad ORDER BY o.ad SEPARATOR ', ') ogrenci_adlari
          FROM kullanicilar k
          INNER JOIN veliler v ON v.kullanici_id=k.id
          LEFT JOIN veli_ogrenci vo ON vo.veli_id=v.id
          LEFT JOIN ogrenciler o ON o.id=vo.ogrenci_id
          WHERE k.aktif=1 AND v.aktif=1
            AND NOT EXISTS (
              SELECT 1 FROM kurum_kullanicilari kk
              WHERE kk.kullanici_id=k.id AND kk.aktif=1
            )
          GROUP BY k.id,k.ad_soyad,k.email,k.aktif,v.id
          ORDER BY k.ad_soyad,k.id");
        $rows=$s?$s->fetchAll():[];
        if($s)$s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function ky_link_global_parent_student(PDO $pdo,array $actor,int $parentUserId,int $studentId): void {
    if(!auth_user_has_role($actor,'super_admin')) throw new RuntimeException('Bu işlem yalnızca Süper Admin içindir.');
    if($parentUserId<=0 || $studentId<=0) throw new RuntimeException('Veli ve öğrenci seç.');

    $p=$pdo->prepare("SELECT v.id
      FROM veliler v
      INNER JOIN kullanicilar k ON k.id=v.kullanici_id
      WHERE v.kullanici_id=? AND v.aktif=1 AND k.aktif=1
        AND NOT EXISTS (
          SELECT 1 FROM kurum_kullanicilari kk
          WHERE kk.kullanici_id=k.id AND kk.aktif=1
        )
      LIMIT 1");
    $p->execute([$parentUserId]);
    $parentProfileId=(int)($p->fetchColumn()?:0);
    $p->closeCursor();
    if($parentProfileId<=0) throw new RuntimeException('Seçilen veli global veli değil.');

    $s=$pdo->prepare("SELECT o.id
      FROM ogrenciler o
      INNER JOIN kullanicilar k ON k.id=o.kullanici_id
      WHERE o.id=? AND o.aktif=1 AND k.aktif=1
        AND NOT EXISTS (
          SELECT 1 FROM kurum_kullanicilari kk
          WHERE kk.kullanici_id=k.id AND kk.aktif=1
        )
      LIMIT 1");
    $s->execute([$studentId]);
    $validStudent=(int)($s->fetchColumn()?:0);
    $s->closeCursor();
    if($validStudent<=0) throw new RuntimeException('Seçilen öğrenci global öğrenci değil.');

    $pdo->prepare('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id) VALUES (?,?)')
        ->execute([$parentProfileId,$studentId]);

    auth_audit($pdo,(int)$actor['id'],$parentUserId,'global_veli_ogrenci_eslestir','Öğrenci: '.$studentId);
}
