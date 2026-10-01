<?php
declare(strict_types=1);

function kl_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'paketler')
        && auth_runtime_table_exists($pdo,'kurum_lisanslari');
}

function kl_slug(string $value): string {
    $value=mb_strtolower(trim($value),'UTF-8');
    $value=strtr($value,['ç'=>'c','ğ'=>'g','ı'=>'i','ö'=>'o','ş'=>'s','ü'=>'u']);
    $value=preg_replace('/[^a-z0-9]+/','-',$value)??'';
    return trim($value,'-');
}

function kl_validate_date(string $value,bool $required=false): ?string {
    $value=trim($value);
    if($value===''){
        if($required) throw new RuntimeException('Başlangıç tarihi zorunlu.');
        return null;
    }
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value){
        throw new RuntimeException('Geçerli bir tarih gir.');
    }
    return $value;
}

function kl_package_rows(PDO $pdo,bool $includeInactive=true): array {
    if(!kl_tables_ready($pdo)) return [];
    $where=$includeInactive?'1=1':'aktif=1';
    $stmt=$pdo->query("SELECT id,kod,ad,aciklama,ogrenci_limiti,ogretmen_limiti,veli_limiti,ai_aylik_kota,aylik_fiyat,para_birimi,aktif
        FROM paketler WHERE {$where} ORDER BY aktif DESC,aylik_fiyat,ad,id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kl_active_institutions(PDO $pdo): array {
    $stmt=$pdo->query("SELECT id,ad,kod FROM kurumlar WHERE aktif=1 ORDER BY (kod='ilkadim') DESC,ad,id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kl_effective_status(array $row,?string $today=null): string {
    $today=$today?:date('Y-m-d');
    $status=(string)($row['durum']??'aktif');
    $start=(string)($row['baslangic_tarihi']??'');
    $end=(string)($row['bitis_tarihi']??'');
    if(in_array($status,['iptal','askida'],true)) return $status;
    if($start!=='' && $start>$today) return 'bekliyor';
    if($end!=='' && $end<$today) return 'suresi_doldu';
    return $status;
}

function kl_license_rows(PDO $pdo): array {
    if(!kl_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        kl.id,kl.kurum_id,kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi,kl.durum,kl.notlar,
        k.ad kurum_adi,k.kod kurum_kodu,
        p.kod paket_kodu,p.ad paket_adi,p.ogrenci_limiti,p.ogretmen_limiti,p.veli_limiti,p.ai_aylik_kota,p.aylik_fiyat,p.para_birimi,p.aktif paket_aktif,
        (SELECT COUNT(DISTINCT kk.kullanici_id) FROM kurum_kullanicilari kk WHERE kk.kurum_id=kl.kurum_id AND kk.kurum_rolu='ogrenci' AND kk.aktif=1) ogrenci_sayisi,
        (SELECT COUNT(DISTINCT kk.kullanici_id) FROM kurum_kullanicilari kk WHERE kk.kurum_id=kl.kurum_id AND kk.kurum_rolu='ogretmen' AND kk.aktif=1) ogretmen_sayisi,
        (SELECT COUNT(DISTINCT kk.kullanici_id) FROM kurum_kullanicilari kk WHERE kk.kurum_id=kl.kurum_id AND kk.kurum_rolu='veli' AND kk.aktif=1) veli_sayisi
        FROM kurum_lisanslari kl
        INNER JOIN kurumlar k ON k.id=kl.kurum_id
        INNER JOIN paketler p ON p.id=kl.paket_id
        ORDER BY k.aktif DESC,k.ad,kl.id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row) $row['etkin_durum']=kl_effective_status($row);
    unset($row);
    return $rows;
}

function kl_active_license(PDO $pdo,int $institutionId): ?array {
    if($institutionId<=0 || !kl_tables_ready($pdo)) return null;
    $stmt=$pdo->prepare("SELECT
        kl.id,kl.kurum_id,kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi,kl.durum,
        p.kod paket_kodu,p.ad paket_adi,p.ogrenci_limiti,p.ogretmen_limiti,p.veli_limiti,p.ai_aylik_kota,p.aktif paket_aktif
        FROM kurum_lisanslari kl
        INNER JOIN paketler p ON p.id=kl.paket_id
        WHERE kl.kurum_id=?
          AND kl.durum IN ('aktif','deneme')
          AND p.aktif=1
          AND kl.baslangic_tarihi<=CURDATE()
          AND (kl.bitis_tarihi IS NULL OR kl.bitis_tarihi>=CURDATE())
        LIMIT 1");
    $stmt->execute([$institutionId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function kl_member_count(PDO $pdo,int $institutionId,string $role,int $excludeUserId=0): int {
    $params=[$institutionId,$role];
    $sql="SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari
        WHERE kurum_id=? AND kurum_rolu=? AND aktif=1";
    if($excludeUserId>0){
        $sql.=" AND kullanici_id<>?";
        $params[]=$excludeUserId;
    }
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $count=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    return max(0,$count);
}

function kl_assert_member_capacity(PDO $pdo,int $institutionId,string $role,int $excludeUserId=0): void {
    $field=match($role){
        'ogrenci'=>'ogrenci_limiti',
        'ogretmen'=>'ogretmen_limiti',
        'veli'=>'veli_limiti',
        default=>null,
    };
    if($field===null) return;

    $license=kl_active_license($pdo,$institutionId);
    if(!$license) return;

    $limit=max(0,(int)($license[$field]??0));
    if($limit===0) return;

    $count=kl_member_count($pdo,$institutionId,$role,$excludeUserId);
    if($count<$limit) return;

    $label=match($role){
        'ogrenci'=>'öğrenci',
        'ogretmen'=>'öğretmen',
        'veli'=>'veli',
        default=>'kullanıcı',
    };
    throw new RuntimeException(
        'Bu kurumun '.(string)$license['paket_adi'].' paketindeki '.$label.' limiti doldu ('.$count.'/'.$limit.'). Paket veya lisans limitini güncelle.'
    );
}

function kl_validate_package(array $input): array {
    $name=trim((string)($input['ad']??''));
    $code=kl_slug((string)($input['kod']??$name));
    $description=trim((string)($input['aciklama']??''));
    if(mb_strlen($name)<2 || mb_strlen($name)>120) throw new RuntimeException('Paket adını kontrol et.');
    if($code==='' || mb_strlen($code)>80) throw new RuntimeException('Paket kodunu kontrol et.');
    if(mb_strlen($description)>1000) throw new RuntimeException('Paket açıklaması çok uzun.');

    $limits=[];
    foreach(['ogrenci_limiti','ogretmen_limiti','veli_limiti','ai_aylik_kota'] as $field){
        $value=(int)($input[$field]??0);
        if($value<0 || $value>10000000) throw new RuntimeException('Paket limitlerinden biri geçersiz.');
        $limits[$field]=$value;
    }

    $priceRaw=str_replace(',','.',trim((string)($input['aylik_fiyat']??'0')));
    if($priceRaw==='' || !is_numeric($priceRaw)) $priceRaw='0';
    $price=round((float)$priceRaw,2);
    if($price<0 || $price>9999999999) throw new RuntimeException('Aylık fiyatı kontrol et.');

    $currency=mb_strtoupper(trim((string)($input['para_birimi']??'TRY')),'UTF-8');
    if(!in_array($currency,['TRY','USD','EUR'],true)) $currency='TRY';

    return [$code,$name,$description,$limits,$price,$currency];
}

function kl_save_package(PDO $pdo,array $actor,array $input): int {
    if(!kl_tables_ready($pdo)) throw new RuntimeException('Paket / lisans migrationı henüz kurulmamış.');
    [$code,$name,$description,$limits,$price,$currency]=kl_validate_package($input);
    $id=max(0,(int)($input['paket_id']??0));

    if($id>0){
        $stmt=$pdo->prepare("UPDATE paketler
            SET kod=?,ad=?,aciklama=?,ogrenci_limiti=?,ogretmen_limiti=?,veli_limiti=?,ai_aylik_kota=?,aylik_fiyat=?,para_birimi=?
            WHERE id=?");
        $stmt->execute([
            $code,$name,$description!==''?$description:null,
            $limits['ogrenci_limiti'],$limits['ogretmen_limiti'],$limits['veli_limiti'],$limits['ai_aylik_kota'],
            number_format($price,2,'.',''),$currency,$id
        ]);
        $stmt->closeCursor();
        if($id<=0) throw new RuntimeException('Paket bulunamadı.');
        $action='paket_guncelle';
    }else{
        $stmt=$pdo->prepare("INSERT INTO paketler
            (kod,ad,aciklama,ogrenci_limiti,ogretmen_limiti,veli_limiti,ai_aylik_kota,aylik_fiyat,para_birimi,aktif)
            VALUES (?,?,?,?,?,?,?,?,?,1)");
        $stmt->execute([
            $code,$name,$description!==''?$description:null,
            $limits['ogrenci_limiti'],$limits['ogretmen_limiti'],$limits['veli_limiti'],$limits['ai_aylik_kota'],
            number_format($price,2,'.',''),$currency
        ]);
        $id=(int)$pdo->lastInsertId();
        $stmt->closeCursor();
        $action='paket_olustur';
    }

    auth_audit($pdo,(int)$actor['id'],null,$action,'Paket #'.$id.' '.$name);
    return $id;
}

function kl_set_package_active(PDO $pdo,array $actor,int $packageId,bool $active): void {
    if($packageId<=0) throw new RuntimeException('Paket bulunamadı.');
    if(!$active){
        $stmt=$pdo->prepare("SELECT COUNT(*) FROM kurum_lisanslari
            WHERE paket_id=? AND durum IN ('aktif','deneme')
              AND baslangic_tarihi<=CURDATE()
              AND (bitis_tarihi IS NULL OR bitis_tarihi>=CURDATE())");
        $stmt->execute([$packageId]);
        $inUse=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        if($inUse>0) throw new RuntimeException('Bu paket aktif/deneme lisanslarında kullanılıyor. Önce kurum lisanslarını değiştir.');
    }
    $stmt=$pdo->prepare('UPDATE paketler SET aktif=? WHERE id=?');
    $stmt->execute([$active?1:0,$packageId]);
    $stmt->closeCursor();
    auth_audit($pdo,(int)$actor['id'],null,$active?'paket_aktif':'paket_pasif','Paket #'.$packageId);
}

function kl_save_license(PDO $pdo,array $actor,array $input): int {
    if(!kl_tables_ready($pdo)) throw new RuntimeException('Paket / lisans migrationı henüz kurulmamış.');
    $institutionId=max(0,(int)($input['kurum_id']??0));
    $packageId=max(0,(int)($input['paket_id']??0));
    $status=(string)($input['durum']??'aktif');
    $start=kl_validate_date((string)($input['baslangic_tarihi']??''),true);
    $end=kl_validate_date((string)($input['bitis_tarihi']??''),false);
    $notes=trim((string)($input['notlar']??''));

    if($institutionId<=0 || $packageId<=0) throw new RuntimeException('Kurum ve paket seç.');
    if(!in_array($status,['aktif','deneme','askida','iptal'],true)) throw new RuntimeException('Lisans durumu geçersiz.');
    if($end!==null && $start!==null && $end<$start) throw new RuntimeException('Bitiş tarihi başlangıç tarihinden önce olamaz.');
    if(mb_strlen($notes)>2000) throw new RuntimeException('Lisans notu çok uzun.');

    $stmt=$pdo->prepare('SELECT 1 FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$institutionId]);
    $institutionOk=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$institutionOk) throw new RuntimeException('Aktif kurum bulunamadı.');

    $stmt=$pdo->prepare('SELECT 1 FROM paketler WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$packageId]);
    $packageOk=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$packageOk) throw new RuntimeException('Aktif paket bulunamadı.');

    $stmt=$pdo->prepare("INSERT INTO kurum_lisanslari
        (kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum,notlar)
        VALUES (?,?,?,?,?,?)
        ON DUPLICATE KEY UPDATE
          paket_id=VALUES(paket_id),
          baslangic_tarihi=VALUES(baslangic_tarihi),
          bitis_tarihi=VALUES(bitis_tarihi),
          durum=VALUES(durum),
          notlar=VALUES(notlar)");
    $stmt->execute([$institutionId,$packageId,$start,$end,$status,$notes!==''?$notes:null]);
    $stmt->closeCursor();

    $stmt=$pdo->prepare('SELECT id FROM kurum_lisanslari WHERE kurum_id=? LIMIT 1');
    $stmt->execute([$institutionId]);
    $id=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();

    auth_audit($pdo,(int)$actor['id'],null,'kurum_lisans_guncelle','Kurum #'.$institutionId.' paket #'.$packageId.' durum '.$status);
    return $id;
}
