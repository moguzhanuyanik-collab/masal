<?php
declare(strict_types=1);

function st_tables_ready(PDO $pdo): bool {
    return kl_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'kurum_deneme_satislari')
        && auth_runtime_table_exists($pdo,'kurum_satis_notlari');
}

function st_status_labels(): array {
    return [
        'deneme'=>'Deneme',
        'donustu'=>'Ücretliye Dönüştü',
        'kaybedildi'=>'Kaybedildi',
    ];
}

function st_sources(): array {
    return [
        'saha'=>'Saha Satışı',
        'referans'=>'Referans',
        'web'=>'Web',
        'sosyal_medya'=>'Sosyal Medya',
        'telefon'=>'Telefon',
        'etkinlik'=>'Etkinlik / Fuar',
        'diger'=>'Diğer',
    ];
}

function st_trial_days(mixed $value): int {
    $days=(int)$value;
    if($days<1 || $days>90) throw new RuntimeException('Deneme süresi 1 ile 90 gün arasında olmalı.');
    return $days;
}

function st_validate_end_date(string $value,bool $required=false): ?string {
    $date=kl_validate_date($value,$required);
    if($date!==null && $date<date('Y-m-d')) throw new RuntimeException('Lisans bitiş tarihi geçmişte olamaz.');
    return $date;
}

function st_add_note_row(PDO $pdo,int $salesId,int $institutionId,int $userId,string $type,string $note): void {
    $note=trim($note);
    if($note==='' || mb_strlen($note)>2000) throw new RuntimeException('Satış notu 1 ile 2000 karakter arasında olmalı.');
    if(!in_array($type,['not','durum'],true)) $type='not';
    $stmt=$pdo->prepare("INSERT INTO kurum_satis_notlari
        (satis_id,kurum_id,kullanici_id,tur,not_metni)
        VALUES (?,?,?,?,?)");
    $stmt->execute([$salesId,$institutionId,$userId,$type,$note]);
    $stmt->closeCursor();
}

function st_create_trial(PDO $pdo,array $actor,array $input): int {
    if(!st_tables_ready($pdo)) throw new RuntimeException('Demo satış migrationı henüz kurulmamış.');
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');

    [$name,$code,$type,$contentSource,$email,$phone,$address]=km_validate_institution_input($input);
    $packageId=max(0,(int)($input['paket_id']??0));
    $days=st_trial_days($input['deneme_gun']??14);
    $source=(string)($input['kaynak']??'diger');
    $owner=max(0,(int)($input['sorumlu_kullanici_id']??(int)$actor['id']));
    $firstNote=trim((string)($input['satis_notu']??''));

    if($packageId<=0) throw new RuntimeException('Deneme paketi seç.');
    if(!array_key_exists($source,st_sources())) throw new RuntimeException('Satış kaynağını kontrol et.');
    if($firstNote!=='' && mb_strlen($firstNote)>2000) throw new RuntimeException('Satış notu çok uzun.');

    $stmt=$pdo->prepare('SELECT id FROM paketler WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$packageId]);
    $validPackage=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    if($validPackage<=0) throw new RuntimeException('Aktif deneme paketi bulunamadı.');

    $start=date('Y-m-d');
    $end=(new DateTimeImmutable($start))->modify('+'.($days-1).' days')->format('Y-m-d');
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare('INSERT INTO kurumlar
            (kod,ad,tur,icerik_kaynagi,email,telefon,adres,aktif)
            VALUES (?,?,?,?,?,?,?,1)');
        $stmt->execute([
            $code,$name,$type,$contentSource,
            $email!==''?$email:null,$phone!==''?$phone:null,$address!==''?$address:null
        ]);
        $institutionId=(int)$pdo->lastInsertId();
        $stmt->closeCursor();

        $stmt=$pdo->prepare("INSERT INTO kurum_lisanslari
            (kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum,notlar)
            VALUES (?,?,?,?, 'deneme', ?)");
        $stmt->execute([
            $institutionId,$packageId,$start,$end,
            $days.' günlük demo / satış denemesi'
        ]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("INSERT INTO kurum_deneme_satislari
            (kurum_id,deneme_paket_id,deneme_baslangic_tarihi,deneme_bitis_tarihi,durum,kaynak,
             sorumlu_kullanici_id,son_temas_tarihi,olusturan_kullanici_id,guncelleyen_kullanici_id)
            VALUES (?,?,?,?, 'deneme', ?, ?, CURDATE(), ?, ?)");
        $stmt->execute([
            $institutionId,$packageId,$start,$end,$source,
            $owner>0?$owner:null,(int)$actor['id'],(int)$actor['id']
        ]);
        $salesId=(int)$pdo->lastInsertId();
        $stmt->closeCursor();

        st_add_note_row(
            $pdo,$salesId,$institutionId,(int)$actor['id'],'durum',
            $days.' günlük deneme başlatıldı. Paket #'.$packageId.' · '.$start.' → '.$end
        );
        if($firstNote!==''){
            st_add_note_row($pdo,$salesId,$institutionId,(int)$actor['id'],'not',$firstNote);
        }

        if($started)$pdo->commit();
    }catch(PDOException $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        if((string)$e->getCode()==='23000') throw new RuntimeException('Kurum kodu veya demo satış kaydı zaten kullanılıyor.');
        throw $e;
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'demo_kurum_olustur','Demo satış #'.$salesId.' kurum #'.$institutionId.' paket #'.$packageId);
    return $salesId;
}

function st_sales_row(PDO $pdo,int $salesId,bool $forUpdate=false): ?array {
    if($salesId<=0 || !st_tables_ready($pdo)) return null;
    $sql="SELECT
        s.*,k.ad kurum_adi,k.kod kurum_kodu,k.email kurum_email,k.telefon kurum_telefon,k.aktif kurum_aktif,
        dp.ad deneme_paket_adi,dp.aylik_fiyat deneme_paket_fiyati,dp.para_birimi deneme_para_birimi,
        cp.ad donusum_paket_adi,
        kl.id lisans_id,kl.paket_id lisans_paket_id,kl.baslangic_tarihi lisans_baslangic,
        kl.bitis_tarihi lisans_bitis,kl.durum lisans_durum
        FROM kurum_deneme_satislari s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        INNER JOIN paketler dp ON dp.id=s.deneme_paket_id
        LEFT JOIN paketler cp ON cp.id=s.donusum_paket_id
        LEFT JOIN kurum_lisanslari kl ON kl.kurum_id=s.kurum_id
        WHERE s.id=? LIMIT 1".($forUpdate?' FOR UPDATE':'');
    $stmt=$pdo->prepare($sql);
    $stmt->execute([$salesId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;
    $row['etkin_durum']=st_effective_status($row);
    return $row;
}

function st_effective_status(array $row,?string $today=null): string {
    $status=(string)($row['durum']??'deneme');
    if($status!=='deneme') return $status;
    $today=$today?:date('Y-m-d');
    $end=(string)($row['deneme_bitis_tarihi']??'');
    return $end!=='' && $end<$today?'suresi_doldu':'deneme';
}

function st_sales_rows(PDO $pdo,array $filters=[],int $limit=300): array {
    if(!st_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=['1=1'];
    $params=[];

    $status=trim((string)($filters['durum']??''));
    if(in_array($status,['deneme','donustu','kaybedildi'],true)){
        $where[]='s.durum=?';$params[]=$status;
    }elseif($status==='suresi_doldu'){
        $where[]="s.durum='deneme' AND s.deneme_bitis_tarihi<CURDATE()";
    }

    $source=trim((string)($filters['kaynak']??''));
    if($source!=='' && array_key_exists($source,st_sources())){
        $where[]='s.kaynak=?';$params[]=$source;
    }

    $stmt=$pdo->prepare("SELECT
        s.*,k.ad kurum_adi,k.kod kurum_kodu,k.email kurum_email,k.aktif kurum_aktif,
        dp.ad deneme_paket_adi,dp.aylik_fiyat deneme_paket_fiyati,dp.para_birimi deneme_para_birimi,
        cp.ad donusum_paket_adi,
        kl.paket_id lisans_paket_id,kl.durum lisans_durum,kl.bitis_tarihi lisans_bitis,
        DATEDIFF(s.deneme_bitis_tarihi,CURDATE()) kalan_gun,
        (SELECT COUNT(*) FROM kurum_satis_notlari n WHERE n.satis_id=s.id) not_sayisi
        FROM kurum_deneme_satislari s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        INNER JOIN paketler dp ON dp.id=s.deneme_paket_id
        LEFT JOIN paketler cp ON cp.id=s.donusum_paket_id
        LEFT JOIN kurum_lisanslari kl ON kl.kurum_id=s.kurum_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE
            WHEN s.durum='deneme' AND s.deneme_bitis_tarihi<CURDATE() THEN 0
            WHEN s.durum='deneme' THEN 1
            WHEN s.durum='donustu' THEN 2
            ELSE 3
          END,
          CASE WHEN s.durum='deneme' THEN s.deneme_bitis_tarihi ELSE DATE(s.guncellenme_tarihi) END,
          s.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row)$row['etkin_durum']=st_effective_status($row);
    unset($row);
    return $rows;
}

function st_notes(PDO $pdo,int $salesId): array {
    if($salesId<=0 || !st_tables_ready($pdo)) return [];
    $stmt=$pdo->prepare("SELECT
        n.id,n.tur,n.not_metni,n.olusturulma_tarihi,n.kullanici_id,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM kurum_satis_notlari n
        LEFT JOIN kullanicilar u ON u.id=n.kullanici_id
        WHERE n.satis_id=?
        ORDER BY n.id DESC");
    $stmt->execute([$salesId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function st_add_note(PDO $pdo,array $actor,int $salesId,string $note): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $sales=st_sales_row($pdo,$salesId);
    if(!$sales) throw new RuntimeException('Satış kaydı bulunamadı.');
    $note=trim($note);
    if(mb_strlen($note)<2 || mb_strlen($note)>2000) throw new RuntimeException('Satış notu 2 ile 2000 karakter arasında olmalı.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        st_add_note_row($pdo,$salesId,(int)$sales['kurum_id'],(int)$actor['id'],'not',$note);
        $stmt=$pdo->prepare('UPDATE kurum_deneme_satislari
            SET son_temas_tarihi=CURDATE(),guncelleyen_kullanici_id=?
            WHERE id=?');
        $stmt->execute([(int)$actor['id'],$salesId]);
        $stmt->closeCursor();
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'demo_satis_notu','Demo satış #'.$salesId);
}

function st_convert(PDO $pdo,array $actor,int $salesId,int $packageId,?string $licenseEnd=null,string $note=''): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if($salesId<=0 || $packageId<=0) throw new RuntimeException('Satış ve paket seç.');
    $licenseEnd=st_validate_end_date((string)($licenseEnd??''),false);
    $note=trim($note);
    if($note!=='' && mb_strlen($note)>2000) throw new RuntimeException('Dönüşüm notu çok uzun.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $sales=st_sales_row($pdo,$salesId,true);
        if(!$sales) throw new RuntimeException('Satış kaydı bulunamadı.');
        if((string)$sales['durum']!=='deneme') throw new RuntimeException('Yalnız devam eden veya süresi dolmuş deneme ücretliye dönüştürülebilir.');
        if((int)$sales['kurum_aktif']!==1) throw new RuntimeException('Demo kurumu aktif değil.');

        $stmt=$pdo->prepare('SELECT id,ad FROM paketler WHERE id=? AND aktif=1 LIMIT 1');
        $stmt->execute([$packageId]);
        $package=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(!is_array($package)) throw new RuntimeException('Aktif dönüşüm paketi bulunamadı.');

        $stmt=$pdo->prepare('SELECT id FROM kurum_lisanslari WHERE kurum_id=? LIMIT 1 FOR UPDATE');
        $stmt->execute([(int)$sales['kurum_id']]);
        $licenseId=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        if($licenseId<=0) throw new RuntimeException('Demo lisansı bulunamadı.');

        $stmt=$pdo->prepare("UPDATE kurum_lisanslari
            SET paket_id=?,baslangic_tarihi=CURDATE(),bitis_tarihi=?,durum='aktif',
                notlar=?
            WHERE id=?");
        $stmt->execute([
            $packageId,$licenseEnd,
            'Demo satış #'.$salesId.' üzerinden ücretliye dönüştürüldü',
            $licenseId
        ]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("UPDATE kurum_deneme_satislari
            SET durum='donustu',donusum_paket_id=?,donusum_tarihi=NOW(),
                son_temas_tarihi=CURDATE(),guncelleyen_kullanici_id=?
            WHERE id=? AND durum='deneme'");
        $stmt->execute([$packageId,(int)$actor['id'],$salesId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Satış dönüşümü kaydedilemedi.');
        $stmt->closeCursor();

        st_add_note_row(
            $pdo,$salesId,(int)$sales['kurum_id'],(int)$actor['id'],'durum',
            'Ücretliye dönüştürüldü. Paket: '.(string)$package['ad'].' (#'.$packageId.')'
        );
        if($note!==''){
            st_add_note_row($pdo,$salesId,(int)$sales['kurum_id'],(int)$actor['id'],'not',$note);
        }

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'demo_ucretliye_donusum','Demo satış #'.$salesId.' paket #'.$packageId);
}

function st_mark_lost(PDO $pdo,array $actor,int $salesId,string $reason): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $reason=trim($reason);
    if(mb_strlen($reason)<3 || mb_strlen($reason)>500) throw new RuntimeException('Kayıp nedenini 3 ile 500 karakter arasında yaz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $sales=st_sales_row($pdo,$salesId,true);
        if(!$sales) throw new RuntimeException('Satış kaydı bulunamadı.');
        if((string)$sales['durum']!=='deneme') throw new RuntimeException('Yalnız deneme aşamasındaki satış kaybedildi olarak işaretlenebilir.');

        $stmt=$pdo->prepare("UPDATE kurum_lisanslari
            SET durum='iptal',notlar=?
            WHERE kurum_id=? AND durum='deneme'");
        $stmt->execute(['Demo satış kaybedildi: '.$reason,(int)$sales['kurum_id']]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("UPDATE kurum_deneme_satislari
            SET durum='kaybedildi',kayip_nedeni=?,son_temas_tarihi=CURDATE(),
                guncelleyen_kullanici_id=?
            WHERE id=? AND durum='deneme'");
        $stmt->execute([$reason,(int)$actor['id'],$salesId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Kayıp satış durumu kaydedilemedi.');
        $stmt->closeCursor();

        st_add_note_row(
            $pdo,$salesId,(int)$sales['kurum_id'],(int)$actor['id'],'durum',
            'Satış kaybedildi. Neden: '.$reason
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'demo_satis_kayip','Demo satış #'.$salesId.' neden '.$reason);
}

function st_trial_warning_rows(PDO $pdo,int $days=7): array {
    if(!st_tables_ready($pdo)) return [];
    $days=max(0,min(60,$days));
    $stmt=$pdo->prepare("SELECT
        s.id,s.kurum_id,s.deneme_bitis_tarihi,s.son_temas_tarihi,
        k.ad kurum_adi,p.ad paket_adi,
        DATEDIFF(s.deneme_bitis_tarihi,CURDATE()) kalan_gun
        FROM kurum_deneme_satislari s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        INNER JOIN paketler p ON p.id=s.deneme_paket_id
        WHERE s.durum='deneme'
          AND DATEDIFF(s.deneme_bitis_tarihi,CURDATE())<=?
        ORDER BY s.deneme_bitis_tarihi,k.ad,s.id");
    $stmt->execute([$days]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function st_summary(PDO $pdo): array {
    $summary=[
        'toplam'=>0,'deneme'=>0,'suresi_doldu'=>0,'donustu'=>0,'kaybedildi'=>0,
        'genel_donusum_orani'=>0.0,'karar_verilen_donusum_orani'=>0.0,
    ];
    if(!st_tables_ready($pdo)) return $summary;

    $stmt=$pdo->query("SELECT
        COUNT(*) toplam,
        SUM(CASE WHEN durum='deneme' AND deneme_bitis_tarihi>=CURDATE() THEN 1 ELSE 0 END) deneme,
        SUM(CASE WHEN durum='deneme' AND deneme_bitis_tarihi<CURDATE() THEN 1 ELSE 0 END) suresi_doldu,
        SUM(CASE WHEN durum='donustu' THEN 1 ELSE 0 END) donustu,
        SUM(CASE WHEN durum='kaybedildi' THEN 1 ELSE 0 END) kaybedildi
        FROM kurum_deneme_satislari");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(is_array($row)){
        foreach(['toplam','deneme','suresi_doldu','donustu','kaybedildi'] as $key){
            $summary[$key]=max(0,(int)($row[$key]??0));
        }
    }
    $summary['genel_donusum_orani']=$summary['toplam']>0
        ?round(($summary['donustu']/$summary['toplam'])*100,1):0.0;
    $decided=$summary['donustu']+$summary['kaybedildi'];
    $summary['karar_verilen_donusum_orani']=$decided>0
        ?round(($summary['donustu']/$decided)*100,1):0.0;
    return $summary;
}
