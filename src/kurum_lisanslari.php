<?php
declare(strict_types=1);

function kl_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'paketler')
        && auth_runtime_table_exists($pdo,'kurum_lisanslari');
}

function kl_history_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'kurum_lisans_gecmisi');
}

function kl_license_state(PDO $pdo,int $institutionId,bool $forUpdate=false): ?array {
    if($institutionId<=0 || !kl_tables_ready($pdo)) return null;
    $sql="SELECT
        kl.id,kl.kurum_id,kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi,kl.durum,kl.notlar,
        p.id paket_var,p.kod paket_kodu,p.ad paket_adi,p.ai_aylik_kota,p.aktif paket_aktif
        FROM kurum_lisanslari kl
        LEFT JOIN paketler p ON p.id=kl.paket_id
        WHERE kl.kurum_id=? LIMIT 1".($forUpdate?' FOR UPDATE':'');
    $stmt=$pdo->prepare($sql);
    $stmt->execute([$institutionId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;
    $row['etkin_durum']=kl_effective_status($row);
    return $row;
}

function kl_license_history_snapshot(?array $row): array {
    if(!$row) return [
        'paket_id'=>null,'durum'=>null,'baslangic_tarihi'=>null,'bitis_tarihi'=>null,'not_hash'=>null
    ];
    $note=(string)($row['notlar']??'');
    return [
        'paket_id'=>isset($row['paket_id'])?(int)$row['paket_id']:null,
        'durum'=>(string)($row['durum']??''),
        'baslangic_tarihi'=>$row['baslangic_tarihi']??null,
        'bitis_tarihi'=>$row['bitis_tarihi']??null,
        'not_hash'=>$note!==''?hash('sha256',$note):null,
    ];
}

function kl_record_license_history(
    PDO $pdo,
    int $licenseId,
    int $institutionId,
    ?array $before,
    ?array $after,
    int $userId,
    string $action,
    string $description=''
): void {
    if($licenseId<=0 || $institutionId<=0 || !kl_history_ready($pdo)) return;
    $old=kl_license_history_snapshot($before);
    $new=kl_license_history_snapshot($after);
    if($before!==null && $old===$new) return;

    $stmt=$pdo->prepare("INSERT INTO kurum_lisans_gecmisi
        (lisans_id,kurum_id,islem,eski_paket_id,yeni_paket_id,eski_durum,yeni_durum,
         eski_baslangic_tarihi,yeni_baslangic_tarihi,eski_bitis_tarihi,yeni_bitis_tarihi,
         eski_not_hash,yeni_not_hash,kullanici_id,aciklama)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    $stmt->execute([
        $licenseId,$institutionId,mb_substr($action,0,40),
        $old['paket_id'],$new['paket_id'],$old['durum']?:null,$new['durum']?:null,
        $old['baslangic_tarihi'],$new['baslangic_tarihi'],$old['bitis_tarihi'],$new['bitis_tarihi'],
        $old['not_hash'],$new['not_hash'],$userId>0?$userId:null,
        $description!==''?mb_substr($description,0,500):null
    ]);
    $stmt->closeCursor();
}

function kl_license_history_rows(PDO $pdo,int $institutionId,int $limit=100): array {
    if($institutionId<=0 || !kl_history_ready($pdo)) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.*,COALESCE(u.ad_soyad,'Sistem') kullanici_adi,
        ep.ad eski_paket_adi,yp.ad yeni_paket_adi
        FROM kurum_lisans_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        LEFT JOIN paketler ep ON ep.id=g.eski_paket_id
        LEFT JOIN paketler yp ON yp.id=g.yeni_paket_id
        WHERE g.kurum_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
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
        $started=false;
        try{
            if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
            $lock=$pdo->prepare('SELECT id FROM paketler WHERE id=? LIMIT 1 FOR UPDATE');
            $lock->execute([$id]);
            $exists=(int)($lock->fetchColumn()?:0);
            $lock->closeCursor();
            if($exists<=0) throw new RuntimeException('Paket bulunamadı.');

            $stmt=$pdo->prepare("UPDATE paketler
                SET kod=?,ad=?,aciklama=?,ogrenci_limiti=?,ogretmen_limiti=?,veli_limiti=?,ai_aylik_kota=?,aylik_fiyat=?,para_birimi=?
                WHERE id=?");
            $stmt->execute([
                $code,$name,$description!==''?$description:null,
                $limits['ogrenci_limiti'],$limits['ogretmen_limiti'],$limits['veli_limiti'],$limits['ai_aylik_kota'],
                number_format($price,2,'.',''),$currency,$id
            ]);
            $stmt->closeCursor();
            if($started)$pdo->commit();
        }catch(Throwable $e){
            if($started && $pdo->inTransaction())$pdo->rollBack();
            throw $e;
        }
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
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $lock=$pdo->prepare('SELECT id,aktif FROM paketler WHERE id=? LIMIT 1 FOR UPDATE');
        $lock->execute([$packageId]);
        $row=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($row)) throw new RuntimeException('Paket bulunamadı.');

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

        $desired=$active?1:0;
        if((int)$row['aktif']!==$desired){
            $stmt=$pdo->prepare('UPDATE paketler SET aktif=? WHERE id=? AND aktif<>?');
            $stmt->execute([$desired,$packageId,$desired]);
            $changed=$stmt->rowCount();
            $stmt->closeCursor();
            if($changed!==1) throw new RuntimeException('Paket aktiflik durumu güncellenemedi.');
        }
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
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

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $before=kl_license_state($pdo,$institutionId,true);

        if($before){
            $id=(int)$before['id'];
            $stmt=$pdo->prepare("UPDATE kurum_lisanslari
                SET paket_id=?,baslangic_tarihi=?,bitis_tarihi=?,durum=?,notlar=?
                WHERE id=?");
            $stmt->execute([$packageId,$start,$end,$status,$notes!==''?$notes:null,$id]);
            $stmt->closeCursor();
            $historyAction='guncelle';
        }else{
            $stmt=$pdo->prepare("INSERT INTO kurum_lisanslari
                (kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum,notlar)
                VALUES (?,?,?,?,?,?)");
            $stmt->execute([$institutionId,$packageId,$start,$end,$status,$notes!==''?$notes:null]);
            $id=(int)$pdo->lastInsertId();
            $stmt->closeCursor();
            if($id<=0) throw new RuntimeException('Kurum lisansı oluşturulamadı.');
            $historyAction='olustur';
        }

        $after=kl_license_state($pdo,$institutionId,false);
        if(!$after || (int)$after['id']!==$id) throw new RuntimeException('Kurum lisansı doğrulanamadı.');
        kl_record_license_history(
            $pdo,$id,$institutionId,$before,$after,(int)$actor['id'],$historyAction,
            'Paket #'.$packageId.' durum '.$status
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'kurum_lisans_guncelle','Kurum #'.$institutionId.' paket #'.$packageId.' durum '.$status);
    return $id;
}


function kl_ai_access_from_license(?array $license): array {
    if($license===null) return ['allowed'=>true,'has_license'=>false,'reason'=>'legacy_unlicensed','license'=>null];
    if(empty($license['paket_var'])) return ['allowed'=>false,'has_license'=>true,'reason'=>'license_package_missing','license'=>$license];
    if((int)($license['paket_aktif']??0)!==1) return ['allowed'=>false,'has_license'=>true,'reason'=>'package_inactive','license'=>$license];

    $effective=(string)($license['etkin_durum']??kl_effective_status($license));
    if(in_array($effective,['aktif','deneme'],true)){
        return ['allowed'=>true,'has_license'=>true,'reason'=>'licensed','license'=>$license];
    }
    $reason=match($effective){
        'askida'=>'license_suspended',
        'iptal'=>'license_cancelled',
        'suresi_doldu'=>'license_expired',
        'bekliyor'=>'license_not_started',
        default=>'license_inactive',
    };
    return ['allowed'=>false,'has_license'=>true,'reason'=>$reason,'license'=>$license];
}

function kl_ai_entitlement(PDO $pdo,int $userId): array {
    $ids=kl_student_institution_ids($pdo,$userId);
    if(!$ids){
        return ['allowed'=>true,'blocked'=>false,'institution_id'=>null,'license'=>null,'reason'=>'institution_unresolved'];
    }

    if(count($ids)===1){
        $institutionId=$ids[0];
        $access=kl_ai_access_from_license(kl_license_state($pdo,$institutionId,false));
        return [
            'allowed'=>(bool)$access['allowed'],
            'blocked'=>!(bool)$access['allowed'],
            'institution_id'=>$institutionId,
            'license'=>$access['license'],
            'reason'=>(string)$access['reason'],
        ];
    }

    $eligible=[];
    $licensedSeen=false;
    foreach($ids as $institutionId){
        $access=kl_ai_access_from_license(kl_license_state($pdo,$institutionId,false));
        if((bool)$access['has_license'])$licensedSeen=true;
        if((bool)$access['allowed'] && (bool)$access['has_license']){
            $eligible[]=[
                'institution_id'=>$institutionId,
                'license'=>$access['license'],
                'reason'=>(string)$access['reason'],
            ];
        }
    }

    if(count($eligible)===1){
        return [
            'allowed'=>true,'blocked'=>false,
            'institution_id'=>(int)$eligible[0]['institution_id'],
            'license'=>$eligible[0]['license'],
            'reason'=>'licensed',
        ];
    }

    return [
        'allowed'=>false,'blocked'=>true,'institution_id'=>null,'license'=>null,
        'reason'=>count($eligible)>1?'ambiguous_active_licenses':($licensedSeen?'no_eligible_license':'ambiguous_institutions'),
    ];
}

function kl_license_integrity_issues(PDO $pdo): array {
    if(!kl_tables_ready($pdo)) return [];
    $issues=[];

    $stmt=$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari kl LEFT JOIN paketler p ON p.id=kl.paket_id WHERE p.id IS NULL");
    $missingPackage=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($missingPackage>0)$issues[]=[
        'kod'=>'missing_package','adet'=>$missingPackage,
        'mesaj'=>'Paket kaydı bulunmayan kurum lisansı var.'
    ];

    $stmt=$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari kl
        INNER JOIN paketler p ON p.id=kl.paket_id
        WHERE kl.durum IN ('aktif','deneme') AND p.aktif=0
          AND kl.baslangic_tarihi<=CURDATE()
          AND (kl.bitis_tarihi IS NULL OR kl.bitis_tarihi>=CURDATE())");
    $inactivePackage=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($inactivePackage>0)$issues[]=[
        'kod'=>'inactive_package_live_license','adet'=>$inactivePackage,
        'mesaj'=>'Aktif/deneme lisansında pasif paket kullanılıyor.'
    ];

    $stmt=$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari kl
        INNER JOIN kurumlar k ON k.id=kl.kurum_id
        WHERE kl.durum IN ('aktif','deneme') AND k.aktif=0");
    $inactiveInstitution=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($inactiveInstitution>0)$issues[]=[
        'kod'=>'inactive_institution_live_license','adet'=>$inactiveInstitution,
        'mesaj'=>'Pasif kurum üzerinde aktif/deneme lisansı var.'
    ];

    return $issues;
}

function kl_ai_usage_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'adimbot_ai_kullanimlari');
}

function kl_student_institution_ids(PDO $pdo,int $userId): array {
    if($userId<=0 || !auth_runtime_table_exists($pdo,'kurum_kullanicilari')) return [];
    try{
        $stmt=$pdo->prepare("SELECT DISTINCT kk.kurum_id
            FROM kurum_kullanicilari kk
            INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1
            WHERE kk.kullanici_id=?
              AND kk.kurum_rolu='ogrenci'
              AND kk.aktif=1
            ORDER BY kk.kurum_id");
        $stmt->execute([$userId]);
        $ids=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
        $stmt->closeCursor();
        return array_values(array_filter(array_unique($ids),static fn(int $id):bool=>$id>0));
    }catch(Throwable){
        return [];
    }
}

function kl_ai_quota_institution(PDO $pdo,int $userId): ?int {
    $entitlement=kl_ai_entitlement($pdo,$userId);
    if(($entitlement['allowed']??false)!==true) return null;
    $institutionId=$entitlement['institution_id']??null;
    return is_int($institutionId) && $institutionId>0?$institutionId:null;
}

function kl_ai_period_start(?string $date=null): string {
    $date=$date?:date('Y-m-d');
    $parsed=DateTimeImmutable::createFromFormat('!Y-m-d',$date);
    if(!$parsed) $parsed=new DateTimeImmutable('first day of this month');
    return $parsed->format('Y-m-01');
}

function kl_ai_usage_summary(PDO $pdo,int $institutionId,?string $periodStart=null): array {
    $periodStart=kl_ai_period_start($periodStart);
    $used=0;
    $lastProvider='';
    $lastModel='';
    $lastUsage=null;
    if($institutionId>0 && kl_ai_usage_ready($pdo)){
        try{
            $stmt=$pdo->prepare("SELECT kullanim_sayisi,son_saglayici,son_model,son_kullanim
                FROM adimbot_ai_kullanimlari
                WHERE kurum_id=? AND donem_baslangici=?
                LIMIT 1");
            $stmt->execute([$institutionId,$periodStart]);
            $row=$stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
            if(is_array($row)){
                $used=max(0,(int)($row['kullanim_sayisi']??0));
                $lastProvider=(string)($row['son_saglayici']??'');
                $lastModel=(string)($row['son_model']??'');
                $lastUsage=$row['son_kullanim']??null;
            }
        }catch(Throwable){}
    }
    return [
        'period_start'=>$periodStart,
        'used'=>$used,
        'last_provider'=>$lastProvider,
        'last_model'=>$lastModel,
        'last_usage'=>$lastUsage,
    ];
}

function kl_ai_quota_public(array $result): array {
    return [
        'tracked'=>(bool)($result['tracked']??false),
        'enforced'=>(bool)($result['enforced']??false),
        'period'=>(string)($result['period_start']??date('Y-m-01')),
        'used'=>max(0,(int)($result['used']??0)),
        'limit'=>max(0,(int)($result['limit']??0)),
        'remaining'=>isset($result['remaining']) && $result['remaining']!==null
            ?max(0,(int)$result['remaining'])
            :null,
    ];
}

function kl_ai_quota_reserve(
    PDO $pdo,
    int $userId,
    int $studentId,
    string $provider,
    string $model
): array {
    $entitlement=kl_ai_entitlement($pdo,$userId);
    $periodStart=kl_ai_period_start();
    if(($entitlement['blocked']??false)===true){
        return [
            'tracked'=>false,'enforced'=>true,'blocked'=>true,
            'institution_id'=>$entitlement['institution_id']??null,'period_start'=>$periodStart,
            'used'=>0,'limit'=>0,'remaining'=>0,'reason'=>(string)($entitlement['reason']??'license_inactive')
        ];
    }

    $institutionId=$entitlement['institution_id']??null;
    if(!is_int($institutionId) || $institutionId<=0){
        return [
            'tracked'=>false,'enforced'=>false,'blocked'=>false,
            'institution_id'=>null,'period_start'=>$periodStart,
            'used'=>0,'limit'=>0,'remaining'=>null,'reason'=>'institution_unresolved'
        ];
    }

    if(!kl_ai_usage_ready($pdo)){
        return [
            'tracked'=>false,'enforced'=>false,'blocked'=>false,
            'institution_id'=>$institutionId,'period_start'=>$periodStart,
            'used'=>0,'limit'=>0,'remaining'=>null,'reason'=>'usage_table_missing'
        ];
    }

    $provider=mb_substr(strtolower(trim($provider)),0,20);
    $model=mb_substr(trim($model),0,120);
    $studentId=max(0,$studentId);
    $started=false;

    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        $license=is_array($entitlement['license']??null)?$entitlement['license']:null;
        $limit=$license?max(0,(int)($license['ai_aylik_kota']??0)):0;
        $enforced=$license!==null && $limit>0;

        $ensure=$pdo->prepare("INSERT IGNORE INTO adimbot_ai_kullanimlari
            (kurum_id,donem_baslangici,kullanim_sayisi,son_ogrenci_id,son_saglayici,son_model,son_kullanim)
            VALUES (?,?,0,NULL,NULL,NULL,NULL)");
        $ensure->execute([$institutionId,$periodStart]);
        $ensure->closeCursor();

        $select=$pdo->prepare("SELECT kullanim_sayisi
            FROM adimbot_ai_kullanimlari
            WHERE kurum_id=? AND donem_baslangici=?
            LIMIT 1 FOR UPDATE");
        $select->execute([$institutionId,$periodStart]);
        $used=(int)($select->fetchColumn()?:0);
        $select->closeCursor();
        $used=max(0,$used);

        if($enforced && $used>=$limit){
            if($started) $pdo->commit();
            return [
                'tracked'=>true,'enforced'=>true,'blocked'=>true,
                'institution_id'=>$institutionId,'period_start'=>$periodStart,
                'used'=>$used,'limit'=>$limit,'remaining'=>0,
                'package_name'=>(string)($license['paket_adi']??''),
                'reason'=>'quota_exhausted'
            ];
        }

        $next=$used+1;
        $update=$pdo->prepare("UPDATE adimbot_ai_kullanimlari
            SET kullanim_sayisi=?,
                son_ogrenci_id=?,
                son_saglayici=?,
                son_model=?,
                son_kullanim=NOW()
            WHERE kurum_id=? AND donem_baslangici=?");
        $update->execute([
            $next,
            $studentId>0?$studentId:null,
            $provider!==''?$provider:null,
            $model!==''?$model:null,
            $institutionId,
            $periodStart,
        ]);
        $update->closeCursor();

        if($started) $pdo->commit();
        return [
            'tracked'=>true,'enforced'=>$enforced,'blocked'=>false,
            'institution_id'=>$institutionId,'period_start'=>$periodStart,
            'used'=>$next,'limit'=>$limit,
            'remaining'=>$enforced?max(0,$limit-$next):null,
            'package_name'=>$license?(string)($license['paket_adi']??''):'',
            'reason'=>'reserved'
        ];
    }catch(Throwable $e){
        if($started && $pdo->inTransaction()) $pdo->rollBack();
        error_log('[IlkAdim][ai-quota] '.$e->getMessage());
        return [
            'tracked'=>false,'enforced'=>false,'blocked'=>false,
            'institution_id'=>$institutionId,'period_start'=>$periodStart,
            'used'=>0,'limit'=>0,'remaining'=>null,'reason'=>'quota_error'
        ];
    }
}
