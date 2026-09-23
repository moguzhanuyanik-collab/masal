<?php
declare(strict_types=1);

function km_slug(string $value): string {
    $value=mb_strtolower(trim($value),'UTF-8');
    $value=strtr($value,['ç'=>'c','ğ'=>'g','ı'=>'i','ö'=>'o','ş'=>'s','ü'=>'u']);
    $value=preg_replace('/[^a-z0-9]+/','-',$value)??'';
    return trim($value,'-');
}

function km_sections(): array {
    return [
        'kurumlar'=>['label'=>'Kurumlar','icon'=>'🏫','role'=>null],
        'yoneticiler'=>['label'=>'Yöneticiler','icon'=>'🧑‍💼','role'=>'yonetici'],
        'ogretmenler'=>['label'=>'Öğretmenler','icon'=>'👩‍🏫','role'=>'ogretmen'],
        'veliler'=>['label'=>'Veliler','icon'=>'👪','role'=>'veli'],
        'ogrenciler'=>['label'=>'Öğrenciler','icon'=>'🎒','role'=>'ogrenci'],
    ];
}

function km_section_role(string $section): ?string {
    $sections=km_sections();
    return isset($sections[$section])?$sections[$section]['role']:null;
}

function km_active_institutions(PDO $pdo): array {
    $stmt=$pdo->query("SELECT id,ad,kod,tur FROM kurumlar WHERE aktif=1 ORDER BY (kod='ilkadim') DESC,ad,id");
    $rows=$stmt?$stmt->fetchAll():[];
    if($stmt) $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function km_institution_rows(PDO $pdo): array {
    $stmt=$pdo->query("SELECT k.id,k.kod,k.ad,k.tur,k.icerik_kaynagi,k.logo,k.email,k.telefon,k.adres,k.aktif,
      COUNT(DISTINCT CASE WHEN kk.kurum_rolu='yonetici' AND kk.aktif=1 THEN kk.kullanici_id END) yonetici_sayisi,
      COUNT(DISTINCT CASE WHEN kk.kurum_rolu='ogretmen' AND kk.aktif=1 THEN kk.kullanici_id END) ogretmen_sayisi,
      COUNT(DISTINCT CASE WHEN kk.kurum_rolu='veli' AND kk.aktif=1 THEN kk.kullanici_id END) veli_sayisi,
      COUNT(DISTINCT CASE WHEN kk.kurum_rolu='ogrenci' AND kk.aktif=1 THEN kk.kullanici_id END) ogrenci_sayisi
      FROM kurumlar k
      LEFT JOIN kurum_kullanicilari kk ON kk.kurum_id=k.id
      GROUP BY k.id,k.kod,k.ad,k.tur,k.icerik_kaynagi,k.logo,k.email,k.telefon,k.adres,k.aktif
      ORDER BY k.aktif DESC,(k.kod='ilkadim') DESC,k.ad,k.id");
    $rows=$stmt?$stmt->fetchAll():[];
    if($stmt) $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function km_member_rows(PDO $pdo,string $role,int $institutionId=0): array {
    if(!in_array($role,['yonetici','ogretmen','veli','ogrenci'],true)) return [];
    $params=[$role];
    $where="kk.kurum_rolu=? AND kk.aktif=1";
    if($institutionId>0){
        $where.=" AND kk.kurum_id=?";
        $params[]=$institutionId;
    }

    $phoneExpr='NULL';
    $join='';
    if($role==='ogretmen'){
        $join="LEFT JOIN ogretmenler p ON p.kullanici_id=u.id";
        $phoneExpr='p.telefon';
    }elseif($role==='veli'){
        $join="LEFT JOIN veliler p ON p.kullanici_id=u.id";
        $phoneExpr='p.telefon';
    }elseif($role==='ogrenci'){
        $join="LEFT JOIN ogrenciler p ON p.kullanici_id=u.id";
    }

    $sql="SELECT kk.kurum_id,k.ad kurum_adi,k.kod kurum_kodu,
      u.id kullanici_id,u.ad_soyad,u.email,u.ana_rol,u.aktif,
      {$phoneExpr} telefon
      FROM kurum_kullanicilari kk
      INNER JOIN kurumlar k ON k.id=kk.kurum_id
      INNER JOIN kullanicilar u ON u.id=kk.kullanici_id
      {$join}
      WHERE {$where}
      ORDER BY k.ad,u.ad_soyad,u.id";
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function km_validate_institution_input(array $input): array {
    $ad=trim((string)($input['ad']??''));
    $kod=km_slug((string)($input['kod']??$ad));
    $tur=(string)($input['tur']??'okul');
    $icerik=(string)($input['icerik_kaynagi']??'kurum');
    $email=mb_strtolower(trim((string)($input['email']??'')));
    $telefon=trim((string)($input['telefon']??''));
    $adres=trim((string)($input['adres']??''));

    if(mb_strlen($ad)<2 || mb_strlen($ad)>190) throw new RuntimeException('Kurum adını kontrol et.');
    if($kod==='' || mb_strlen($kod)>80) throw new RuntimeException('Kurum kodunu kontrol et.');
    if(!in_array($tur,['okul','kurs','platform'],true)) $tur='okul';
    if(!in_array($icerik,['sistem','kurum'],true)) $icerik='kurum';
    if($email!=='' && !filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Kurum e-posta adresini kontrol et.');
    if(mb_strlen($telefon)>30) throw new RuntimeException('Telefon bilgisi çok uzun.');
    if(mb_strlen($adres)>3000) throw new RuntimeException('Adres bilgisi çok uzun.');

    return [$ad,$kod,$tur,$icerik,$email,$telefon,$adres];
}

function km_create_institution(PDO $pdo,array $actor,array $input): int {
    [$ad,$kod,$tur,$icerik,$email,$telefon,$adres]=km_validate_institution_input($input);
    $stmt=$pdo->prepare('INSERT INTO kurumlar (kod,ad,tur,icerik_kaynagi,email,telefon,adres,aktif) VALUES (?,?,?,?,?,?,?,1)');
    $stmt->execute([$kod,$ad,$tur,$icerik,$email!==''?$email:null,$telefon!==''?$telefon:null,$adres!==''?$adres:null]);
    $id=(int)$pdo->lastInsertId();
    $stmt->closeCursor();
    auth_audit($pdo,(int)$actor['id'],null,'kurum_olustur','Kurum #'.$id.' '.$ad);
    return $id;
}

function km_update_institution(PDO $pdo,array $actor,int $institutionId,array $input): void {
    if($institutionId<=0) throw new RuntimeException('Kurum bulunamadı.');
    $stmt=$pdo->prepare('SELECT kod FROM kurumlar WHERE id=? LIMIT 1');
    $stmt->execute([$institutionId]);
    $current=(string)($stmt->fetchColumn()?:'');
    $stmt->closeCursor();
    if($current==='') throw new RuntimeException('Kurum bulunamadı.');

    [$ad,$kod,$tur,$icerik,$email,$telefon,$adres]=km_validate_institution_input($input);
    if($current==='ilkadim'){
        $kod='ilkadim';
        $tur='platform';
        $icerik='sistem';
    }

    $stmt=$pdo->prepare('UPDATE kurumlar SET kod=?,ad=?,tur=?,icerik_kaynagi=?,email=?,telefon=?,adres=? WHERE id=?');
    $stmt->execute([$kod,$ad,$tur,$icerik,$email!==''?$email:null,$telefon!==''?$telefon:null,$adres!==''?$adres:null,$institutionId]);
    $stmt->closeCursor();
    auth_audit($pdo,(int)$actor['id'],null,'kurum_guncelle','Kurum #'.$institutionId.' '.$ad);
}

function km_deactivate_profiles(PDO $pdo,array $userIds): void {
    if(!$userIds) return;
    $ids=array_values(array_unique(array_filter(array_map('intval',$userIds),static fn(int $id):bool=>$id>0)));
    if(!$ids) return;
    $ph=implode(',',array_fill(0,count($ids),'?'));

    foreach(['ogrenciler','veliler','ogretmenler'] as $table){
        if(!auth_runtime_table_exists($pdo,$table)
            || !auth_runtime_column_exists($pdo,$table,'kullanici_id')
            || !auth_runtime_column_exists($pdo,$table,'aktif')) continue;
        $stmt=$pdo->prepare("UPDATE {$table} SET aktif=0 WHERE kullanici_id IN ({$ph})");
        $stmt->execute($ids);
        $stmt->closeCursor();
    }

    if(auth_runtime_table_exists($pdo,'kullanici_oturum_tokenlari')){
        $stmt=$pdo->prepare("DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id IN ({$ph})");
        $stmt->execute($ids);
        $stmt->closeCursor();
    }
}

function km_delete_institution(PDO $pdo,array $actor,int $institutionId): array {
    if($institutionId<=0) throw new RuntimeException('Kurum bulunamadı.');

    $pdo->beginTransaction();
    try{
        $stmt=$pdo->prepare('SELECT id,kod,ad,aktif FROM kurumlar WHERE id=? LIMIT 1 FOR UPDATE');
        $stmt->execute([$institutionId]);
        $institution=$stmt->fetch();
        $stmt->closeCursor();
        if(!is_array($institution)) throw new RuntimeException('Kurum bulunamadı.');
        if((string)$institution['kod']==='ilkadim') throw new RuntimeException('İlkAdım sistem kurumu silinemez.');
        if((int)$institution['aktif']!==1) throw new RuntimeException('Kurum zaten pasif.');

        $stmt=$pdo->prepare('SELECT DISTINCT kullanici_id FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id IS NOT NULL');
        $stmt->execute([$institutionId]);
        $memberIds=array_values(array_filter(array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]),static fn(int $id):bool=>$id>0));
        $stmt->closeCursor();

        $stmt=$pdo->prepare('UPDATE kurumlar SET aktif=0 WHERE id=?');
        $stmt->execute([$institutionId]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare('UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=?');
        $stmt->execute([$institutionId]);
        $stmt->closeCursor();

        $deactivate=[];
        if($memberIds){
            $ph=implode(',',array_fill(0,count($memberIds),'?'));
            $stmt=$pdo->prepare("SELECT u.id
              FROM kullanicilar u
              WHERE u.id IN ({$ph})
                AND NOT EXISTS (
                  SELECT 1 FROM kurum_kullanicilari kk
                  INNER JOIN kurumlar k ON k.id=kk.kurum_id
                  WHERE kk.kullanici_id=u.id AND kk.aktif=1 AND k.aktif=1
                )
                AND NOT EXISTS (
                  SELECT 1 FROM kullanici_rolleri r
                  WHERE r.kullanici_id=u.id AND r.rol='super_admin'
                )");
            $stmt->execute($memberIds);
            $deactivate=array_values(array_filter(array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]),static fn(int $id):bool=>$id>0));
            $stmt->closeCursor();

            if($deactivate){
                $uph=implode(',',array_fill(0,count($deactivate),'?'));
                $stmt=$pdo->prepare("UPDATE kullanicilar SET aktif=0 WHERE id IN ({$uph})");
                $stmt->execute($deactivate);
                $stmt->closeCursor();
                km_deactivate_profiles($pdo,$deactivate);
            }
        }

        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'kurum_sil','Kurum #'.$institutionId.' / pasife alınan hesap '.count($deactivate));
    return ['members'=>count($memberIds),'users'=>count($deactivate)];
}

function km_validate_member_input(array $input,bool $creating): array {
    $institutionId=(int)($input['kurum_id']??0);
    $name=trim((string)($input['ad_soyad']??''));
    $email=mb_strtolower(trim((string)($input['email']??'')));
    $password=(string)($input['sifre']??'');
    $telefon=trim((string)($input['telefon']??''));

    if($institutionId<=0) throw new RuntimeException('Kurum seç.');
    if(mb_strlen($name)<2 || mb_strlen($name)>190) throw new RuntimeException('Ad soyad bilgisini kontrol et.');
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Geçerli bir e-posta yaz.');
    if($creating && mb_strlen($password)<8) throw new RuntimeException('Şifre en az 8 karakter olmalı.');
    if(!$creating && $password!=='' && mb_strlen($password)<8) throw new RuntimeException('Yeni şifre en az 8 karakter olmalı.');
    if(mb_strlen($telefon)>30) throw new RuntimeException('Telefon bilgisi çok uzun.');
    return [$institutionId,$name,$email,$password,$telefon];
}

function km_create_member(PDO $pdo,array $actor,string $role,array $input): int {
    [$institutionId,$name,$email,$password,$telefon]=km_validate_member_input($input,true);
    $stmt=$pdo->prepare('SELECT 1 FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$institutionId]);
    $ok=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$ok) throw new RuntimeException('Seçilen kurum aktif değil.');

    $userId=ky_create_user($pdo,$actor,$role,$name,$email,$password,$institutionId);
    if($telefon!=='' && in_array($role,['ogretmen','veli'],true)){
        $table=$role==='ogretmen'?'ogretmenler':'veliler';
        if(auth_runtime_column_exists($pdo,$table,'telefon')){
            $stmt=$pdo->prepare("UPDATE {$table} SET telefon=? WHERE kullanici_id=?");
            $stmt->execute([$telefon,$userId]);
            $stmt->closeCursor();
        }
    }
    return $userId;
}

function km_update_member(PDO $pdo,array $actor,string $role,int $userId,int $oldInstitutionId,array $input): void {
    if($userId<=0 || $oldInstitutionId<=0) throw new RuntimeException('Kullanıcı bulunamadı.');
    [$institutionId,$name,$email,$password,$telefon]=km_validate_member_input($input,false);

    $stmt=$pdo->prepare('SELECT 1 FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id=? AND kurum_rolu=? AND aktif=1 LIMIT 1');
    $stmt->execute([$oldInstitutionId,$userId,$role]);
    $membership=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$membership) throw new RuntimeException('Kurum üyeliği bulunamadı.');

    $stmt=$pdo->prepare('SELECT 1 FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$institutionId]);
    $activeInstitution=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$activeInstitution) throw new RuntimeException('Hedef kurum aktif değil.');

    $pdo->beginTransaction();
    try{
        if($password!==''){
            $hash=password_hash($password,PASSWORD_DEFAULT);
            if(!is_string($hash) || $hash==='') throw new RuntimeException('Şifre oluşturulamadı.');
            $stmt=$pdo->prepare('UPDATE kullanicilar SET ad_soyad=?,email=?,sifre_hash=? WHERE id=?');
            $stmt->execute([$name,$email,$hash,$userId]);
            $stmt->closeCursor();
        }else{
            $stmt=$pdo->prepare('UPDATE kullanicilar SET ad_soyad=?,email=? WHERE id=?');
            $stmt->execute([$name,$email,$userId]);
            $stmt->closeCursor();
            $hash=null;
        }

        if($role==='ogrenci' && auth_runtime_table_exists($pdo,'ogrenciler')){
            $sets=['ad=?'];
            $values=[$name];
            if(auth_runtime_column_exists($pdo,'ogrenciler','email')){$sets[]='email=?';$values[]=$email;}
            if($password!=='' && auth_runtime_column_exists($pdo,'ogrenciler','sifre_hash')){$sets[]='sifre_hash=?';$values[]=$hash;}
            $values[]=$userId;
            $stmt=$pdo->prepare('UPDATE ogrenciler SET '.implode(',',$sets).' WHERE kullanici_id=?');
            $stmt->execute($values);
            $stmt->closeCursor();
        }elseif($role==='ogretmen' && auth_runtime_table_exists($pdo,'ogretmenler')){
            $sets=['ad_soyad=?'];$values=[$name];
            if(auth_runtime_column_exists($pdo,'ogretmenler','telefon')){$sets[]='telefon=?';$values[]=$telefon!==''?$telefon:null;}
            $values[]=$userId;
            $stmt=$pdo->prepare('UPDATE ogretmenler SET '.implode(',',$sets).' WHERE kullanici_id=?');
            $stmt->execute($values);
            $stmt->closeCursor();
        }elseif($role==='veli' && auth_runtime_table_exists($pdo,'veliler')){
            $sets=['ad_soyad=?'];$values=[$name];
            if(auth_runtime_column_exists($pdo,'veliler','telefon')){$sets[]='telefon=?';$values[]=$telefon!==''?$telefon:null;}
            $values[]=$userId;
            $stmt=$pdo->prepare('UPDATE veliler SET '.implode(',',$sets).' WHERE kullanici_id=?');
            $stmt->execute($values);
            $stmt->closeCursor();
        }

        if($institutionId!==$oldInstitutionId){
            $stmt=$pdo->prepare("INSERT INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif)
              VALUES (?,?,?,1)
              ON DUPLICATE KEY UPDATE aktif=1");
            $stmt->execute([$institutionId,$userId,$role]);
            $stmt->closeCursor();

            $stmt=$pdo->prepare('UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=? AND kullanici_id=? AND kurum_rolu=?');
            $stmt->execute([$oldInstitutionId,$userId,$role]);
            $stmt->closeCursor();
        }

        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],$userId,'kurum_kullanici_guncelle','Rol '.$role.' / kurum '.$oldInstitutionId.' -> '.$institutionId);
}

function km_delete_member(PDO $pdo,array $actor,string $role,int $userId,int $institutionId): array {
    if($userId<=0 || $institutionId<=0) throw new RuntimeException('Kullanıcı bulunamadı.');
    if($role==='yonetici'){
        $stmt=$pdo->prepare("SELECT 1 FROM kullanici_rolleri WHERE kullanici_id=? AND rol='super_admin' LIMIT 1");
        $stmt->execute([$userId]);
        $isSuper=(bool)$stmt->fetchColumn();
        $stmt->closeCursor();
        if($isSuper) throw new RuntimeException('Süper Admin hesabı kurum kullanıcılarından silinemez.');
    }

    $pdo->beginTransaction();
    try{
        $stmt=$pdo->prepare('UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=? AND kullanici_id=? AND kurum_rolu=? AND aktif=1');
        $stmt->execute([$institutionId,$userId,$role]);
        $changed=$stmt->rowCount();
        $stmt->closeCursor();
        if($changed<1) throw new RuntimeException('Aktif kurum üyeliği bulunamadı.');

        $stmt=$pdo->prepare("SELECT 1
          FROM kurum_kullanicilari kk
          INNER JOIN kurumlar k ON k.id=kk.kurum_id
          WHERE kk.kullanici_id=? AND kk.aktif=1 AND k.aktif=1
          LIMIT 1");
        $stmt->execute([$userId]);
        $hasOther=(bool)$stmt->fetchColumn();
        $stmt->closeCursor();

        $deactivated=false;
        if(!$hasOther){
            $stmt=$pdo->prepare('UPDATE kullanicilar SET aktif=0 WHERE id=?');
            $stmt->execute([$userId]);
            $stmt->closeCursor();
            km_deactivate_profiles($pdo,[$userId]);
            $deactivated=true;
        }
        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],$userId,'kurum_kullanici_sil','Rol '.$role.' / kurum '.$institutionId.' / hesap pasif '.($deactivated?'1':'0'));
    return ['account_deactivated'=>$deactivated];
}
