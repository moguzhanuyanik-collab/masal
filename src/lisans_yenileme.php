<?php
declare(strict_types=1);

function ly_tables_ready(PDO $pdo): bool {
    return kl_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'kurum_lisans_yenilemeleri')
        && auth_runtime_table_exists($pdo,'kurum_lisans_yenileme_gecmisi');
}

function ly_status_labels(): array {
    return [
        'acik'=>'Açık',
        'temas'=>'Temas Edildi',
        'teklif'=>'Teklif / Yenileme Görüşmesi',
        'yenilendi'=>'Yenilendi',
        'yenilenmedi'=>'Yenilenmedi',
    ];
}

function ly_open_statuses(): array {
    return ['acik','temas','teklif'];
}

function ly_add_history(
    PDO $pdo,
    int $renewalId,
    int $licenseId,
    int $institutionId,
    ?int $userId,
    string $type,
    ?string $code=null,
    ?string $note=null
): void {
    if(!ly_tables_ready($pdo) || $renewalId<=0 || $licenseId<=0 || $institutionId<=0) return;
    $type=trim($type);
    $code=$code!==null?trim($code):null;
    $note=$note!==null?trim($note):null;
    if($type==='' || mb_strlen($type)>20) throw new RuntimeException('Yenileme geçmiş türü geçersiz.');
    if($code!==null && mb_strlen($code)>40) throw new RuntimeException('Yenileme geçmiş kodu geçersiz.');
    if($note!==null && mb_strlen($note)>2000) throw new RuntimeException('Yenileme notu çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO kurum_lisans_yenileme_gecmisi
        (yenileme_id,lisans_id,kurum_id,kullanici_id,tur,kod,not_metni)
        VALUES (?,?,?,?,?,?,?)");
    $stmt->execute([
        $renewalId,$licenseId,$institutionId,
        $userId && $userId>0?$userId:null,
        $type,$code!==''?$code:null,$note!==''?$note:null
    ]);
    $stmt->closeCursor();
}

function ly_history_has_code(PDO $pdo,int $renewalId,string $type,string $code): bool {
    if(!ly_tables_ready($pdo) || $renewalId<=0) return false;
    $stmt=$pdo->prepare("SELECT 1 FROM kurum_lisans_yenileme_gecmisi
        WHERE yenileme_id=? AND tur=? AND kod=? LIMIT 1");
    $stmt->execute([$renewalId,$type,$code]);
    $ok=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $ok;
}

function ly_sync_cases(PDO $pdo,?array $actor=null,int $days=30): array {
    if(!ly_tables_ready($pdo)) return ['created'=>0,'reconciled'=>0];
    $days=max(1,min(365,$days));
    $userId=is_array($actor)?max(0,(int)($actor['id']??0)):0;
    $created=0;
    $reconciled=0;

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare("SELECT kl.id lisans_id,kl.kurum_id,kl.bitis_tarihi
            FROM kurum_lisanslari kl
            INNER JOIN kurumlar k ON k.id=kl.kurum_id AND k.aktif=1
            INNER JOIN paketler p ON p.id=kl.paket_id
            WHERE kl.bitis_tarihi IS NOT NULL
              AND kl.durum IN ('aktif','deneme','askida')
              AND DATEDIFF(kl.bitis_tarihi,CURDATE())<=?
            ORDER BY kl.bitis_tarihi,kl.id
            FOR UPDATE");
        $stmt->execute([$days]);
        $candidates=$stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        $insert=$pdo->prepare("INSERT IGNORE INTO kurum_lisans_yenilemeleri
            (lisans_id,kurum_id,hedef_bitis_tarihi,durum,olusturan_kullanici_id,guncelleyen_kullanici_id)
            VALUES (?,?,?,'acik',?,?)");
        foreach($candidates as $row){
            $insert->execute([
                (int)$row['lisans_id'],(int)$row['kurum_id'],(string)$row['bitis_tarihi'],
                $userId>0?$userId:null,$userId>0?$userId:null
            ]);
            if($insert->rowCount()>0){
                $renewalId=(int)$pdo->lastInsertId();
                $created++;
                ly_add_history(
                    $pdo,$renewalId,(int)$row['lisans_id'],(int)$row['kurum_id'],
                    $userId>0?$userId:null,'durum','vaka_acildi',
                    'Lisans bitiş tarihi yaklaşınca yenileme vakası açıldı: '.(string)$row['bitis_tarihi']
                );
            }
        }
        $insert->closeCursor();

        $stmt=$pdo->query("SELECT y.id,y.lisans_id,y.kurum_id,y.hedef_bitis_tarihi,y.durum,
            kl.bitis_tarihi guncel_bitis,kl.durum lisans_durum
            FROM kurum_lisans_yenilemeleri y
            INNER JOIN kurum_lisanslari kl ON kl.id=y.lisans_id AND kl.kurum_id=y.kurum_id
            WHERE y.durum IN ('acik','temas','teklif')
            FOR UPDATE");
        $open=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
        if($stmt)$stmt->closeCursor();

        $close=$pdo->prepare("UPDATE kurum_lisans_yenilemeleri
            SET durum=?,sonuc_bitis_tarihi=?,kapanma_tarihi=NOW(),guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','temas','teklif')");
        foreach($open as $row){
            $currentEnd=(string)($row['guncel_bitis']??'');
            $target=(string)$row['hedef_bitis_tarihi'];
            $licenseStatus=(string)$row['lisans_durum'];
            $newStatus=null;
            $code=null;
            $note=null;

            if($licenseStatus==='iptal'){
                $newStatus='yenilenmedi';
                $code='lisans_iptal';
                $note='Lisans iptal edildiği için yenileme vakası kapatıldı.';
            }elseif($currentEnd==='' || $currentEnd>$target){
                $newStatus='yenilendi';
                $code='harici_yenileme';
                $note=$currentEnd===''?'Lisans harici işlemle süresiz hale getirildi.':'Lisans harici işlemle '.$currentEnd.' tarihine uzatıldı.';
            }

            if($newStatus!==null){
                $close->execute([
                    $newStatus,$currentEnd!==''?$currentEnd:null,$userId>0?$userId:null,(int)$row['id']
                ]);
                if($close->rowCount()>0){
                    $reconciled++;
                    ly_add_history(
                        $pdo,(int)$row['id'],(int)$row['lisans_id'],(int)$row['kurum_id'],
                        $userId>0?$userId:null,'durum',$code,$note
                    );
                }
            }
        }
        $close->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    return ['created'=>$created,'reconciled'=>$reconciled];
}

function ly_queue_rows(PDO $pdo,array $filters=[],int $limit=300): array {
    if(!ly_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=['1=1'];
    $params=[];

    $status=trim((string)($filters['durum']??''));
    if($status==='open'){
        $where[]="y.durum IN ('acik','temas','teklif')";
    }elseif($status!=='' && array_key_exists($status,ly_status_labels())){
        $where[]='y.durum=?';
        $params[]=$status;
    }

    $urgency=trim((string)($filters['aciliyet']??''));
    if(in_array($urgency,['expired','1','7','15','30'],true)){
        $where[]="y.durum IN ('acik','temas','teklif')";
    }
    if($urgency==='expired') $where[]='y.hedef_bitis_tarihi<CURDATE()';
    elseif($urgency==='1') $where[]='DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) BETWEEN 0 AND 1';
    elseif($urgency==='7') $where[]='DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) BETWEEN 2 AND 7';
    elseif($urgency==='15') $where[]='DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) BETWEEN 8 AND 15';
    elseif($urgency==='30') $where[]='DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) BETWEEN 16 AND 30';

    $stmt=$pdo->prepare("SELECT
        y.id,y.lisans_id,y.kurum_id,y.hedef_bitis_tarihi,y.durum,y.sorumlu_kullanici_id,
        y.son_temas_tarihi,y.sonraki_takip_tarihi,y.sonuc_paket_id,y.sonuc_bitis_tarihi,
        y.kapanma_tarihi,y.olusturulma_tarihi,y.guncellenme_tarihi,
        k.ad kurum_adi,k.kod kurum_kodu,k.aktif kurum_aktif,
        kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi guncel_bitis_tarihi,kl.durum lisans_durum,
        p.ad paket_adi,p.kod paket_kodu,p.aktif paket_aktif,
        DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) kalan_gun,
        COALESCE(u.ad_soyad,'—') sorumlu_adi,
        (SELECT COUNT(*) FROM kurum_lisans_yenileme_gecmisi g WHERE g.yenileme_id=y.id) gecmis_sayisi
        FROM kurum_lisans_yenilemeleri y
        INNER JOIN kurumlar k ON k.id=y.kurum_id
        INNER JOIN kurum_lisanslari kl ON kl.id=y.lisans_id AND kl.kurum_id=y.kurum_id
        LEFT JOIN paketler p ON p.id=kl.paket_id
        LEFT JOIN kullanicilar u ON u.id=y.sorumlu_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE
            WHEN y.durum IN ('acik','temas','teklif') AND y.hedef_bitis_tarihi<CURDATE() THEN 0
            WHEN y.durum IN ('acik','temas','teklif') THEN 1
            WHEN y.durum='yenilendi' THEN 2
            ELSE 3
          END,
          CASE WHEN y.durum IN ('acik','temas','teklif') THEN y.hedef_bitis_tarihi ELSE DATE(y.guncellenme_tarihi) END,
          y.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ly_case_row(PDO $pdo,int $renewalId,bool $forUpdate=false): ?array {
    if(!ly_tables_ready($pdo) || $renewalId<=0) return null;
    $sql="SELECT
        y.*,k.ad kurum_adi,k.kod kurum_kodu,k.aktif kurum_aktif,
        kl.paket_id,kl.baslangic_tarihi,kl.bitis_tarihi guncel_bitis_tarihi,kl.durum lisans_durum,
        p.ad paket_adi,p.aktif paket_aktif,
        DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) kalan_gun
        FROM kurum_lisans_yenilemeleri y
        INNER JOIN kurumlar k ON k.id=y.kurum_id
        INNER JOIN kurum_lisanslari kl ON kl.id=y.lisans_id AND kl.kurum_id=y.kurum_id
        LEFT JOIN paketler p ON p.id=kl.paket_id
        WHERE y.id=? LIMIT 1".($forUpdate?' FOR UPDATE':'');
    $stmt=$pdo->prepare($sql);
    $stmt->execute([$renewalId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function ly_history_rows(PDO $pdo,int $renewalId,int $limit=200): array {
    if(!ly_tables_ready($pdo) || $renewalId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.id,g.tur,g.kod,g.not_metni,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM kurum_lisans_yenileme_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        WHERE g.yenileme_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$renewalId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ly_add_note(PDO $pdo,array $actor,int $renewalId,string $note,?string $followUpDate=null): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $note=trim($note);
    if(mb_strlen($note)<2 || mb_strlen($note)>2000) throw new RuntimeException('Yenileme notu 2 ile 2000 karakter arasında olmalı.');
    $followUpDate=kl_validate_date((string)($followUpDate??''),false);
    if($followUpDate!==null && $followUpDate<date('Y-m-d')) throw new RuntimeException('Sonraki takip tarihi geçmişte olamaz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ly_case_row($pdo,$renewalId,true);
        if(!$case) throw new RuntimeException('Yenileme vakası bulunamadı.');

        $newStatus=in_array((string)$case['durum'],['acik','temas'],true)?'temas':(string)$case['durum'];
        $stmt=$pdo->prepare("UPDATE kurum_lisans_yenilemeleri
            SET durum=?,son_temas_tarihi=CURDATE(),sonraki_takip_tarihi=?,guncelleyen_kullanici_id=?
            WHERE id=?");
        $stmt->execute([$newStatus,$followUpDate,(int)$actor['id'],$renewalId]);
        $stmt->closeCursor();

        ly_add_history(
            $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
            'not','takip_notu',$note
        );
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
    auth_audit($pdo,(int)$actor['id'],null,'lisans_yenileme_not','Yenileme #'.$renewalId);
}

function ly_set_stage(PDO $pdo,array $actor,int $renewalId,string $stage): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!in_array($stage,['acik','temas','teklif'],true)) throw new RuntimeException('Yenileme aşaması geçersiz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ly_case_row($pdo,$renewalId,true);
        if(!$case) throw new RuntimeException('Yenileme vakası bulunamadı.');
        if(!in_array((string)$case['durum'],ly_open_statuses(),true)) throw new RuntimeException('Kapanmış yenileme vakasının aşaması değiştirilemez.');

        if((string)$case['durum']!==$stage){
            $stmt=$pdo->prepare("UPDATE kurum_lisans_yenilemeleri
                SET durum=?,guncelleyen_kullanici_id=? WHERE id=?");
            $stmt->execute([$stage,(int)$actor['id'],$renewalId]);
            $stmt->closeCursor();
            ly_add_history(
                $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
                'durum','asama_'.$stage,'Yenileme aşaması '.(ly_status_labels()[$stage]??$stage).' olarak değiştirildi.'
            );
        }
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
}

function ly_renew(PDO $pdo,array $actor,int $renewalId,int $packageId,string $newEnd,string $note=''): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if($renewalId<=0 || $packageId<=0) throw new RuntimeException('Yenileme vakası ve paket gerekli.');
    $newEnd=kl_validate_date($newEnd,true)??'';
    $note=trim($note);
    if($note!=='' && mb_strlen($note)>2000) throw new RuntimeException('Yenileme notu çok uzun.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ly_case_row($pdo,$renewalId,true);
        if(!$case) throw new RuntimeException('Yenileme vakası bulunamadı.');
        if(!in_array((string)$case['durum'],ly_open_statuses(),true)) throw new RuntimeException('Bu yenileme vakası zaten kapanmış.');
        if($newEnd<date('Y-m-d')) throw new RuntimeException('Yeni lisans bitiş tarihi geçmişte olamaz.');
        if($newEnd<=(string)$case['hedef_bitis_tarihi']) throw new RuntimeException('Yeni bitiş tarihi mevcut yenileme döneminden ileri olmalı.');
        $currentEnd=(string)($case['guncel_bitis_tarihi']??'');
        if($currentEnd!=='' && $currentEnd>(string)$case['hedef_bitis_tarihi'] && $newEnd<$currentEnd){
            throw new RuntimeException('Yenileme mevcut lisans bitiş tarihini geriye çekemez.');
        }

        $stmt=$pdo->prepare('SELECT id,ad FROM paketler WHERE id=? AND aktif=1 LIMIT 1');
        $stmt->execute([$packageId]);
        $package=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(!is_array($package)) throw new RuntimeException('Aktif yenileme paketi bulunamadı.');

        $before=kl_license_state($pdo,(int)$case['kurum_id'],true);
        if(!$before || (int)$before['id']!==(int)$case['lisans_id']) throw new RuntimeException('Kurum lisansı bulunamadı.');

        $stmt=$pdo->prepare("UPDATE kurum_lisanslari
            SET paket_id=?,bitis_tarihi=?,durum='aktif'
            WHERE id=? AND kurum_id=?");
        $stmt->execute([$packageId,$newEnd,(int)$case['lisans_id'],(int)$case['kurum_id']]);
        if($stmt->rowCount()>1) throw new RuntimeException('Lisans yenileme beklenmeyen sayıda kayıt etkiledi.');
        $stmt->closeCursor();

        $after=kl_license_state($pdo,(int)$case['kurum_id'],false);
        if(!$after || (string)$after['bitis_tarihi']!==$newEnd || (int)$after['paket_id']!==$packageId){
            throw new RuntimeException('Lisans yenilemesi doğrulanamadı.');
        }

        kl_record_license_history(
            $pdo,(int)$case['lisans_id'],(int)$case['kurum_id'],$before,$after,(int)$actor['id'],
            'yenileme','Yenileme #'.$renewalId.' · '.(string)$package['ad'].' · '.$newEnd
        );

        $stmt=$pdo->prepare("UPDATE kurum_lisans_yenilemeleri
            SET durum='yenilendi',sonuc_paket_id=?,sonuc_bitis_tarihi=?,kapanma_tarihi=NOW(),
                son_temas_tarihi=CURDATE(),sonraki_takip_tarihi=NULL,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','temas','teklif')");
        $stmt->execute([$packageId,$newEnd,(int)$actor['id'],$renewalId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Yenileme vakası kapatılamadı.');
        $stmt->closeCursor();

        ly_add_history(
            $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
            'durum','yenilendi','Lisans '.(string)$package['ad'].' paketiyle '.$newEnd.' tarihine kadar yenilendi.'
        );
        if($note!==''){
            ly_add_history(
                $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
                'not','yenileme_notu',$note
            );
        }

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'lisans_yenile','Yenileme #'.$renewalId.' paket #'.$packageId.' bitiş '.$newEnd);
}

function ly_mark_not_renewed(PDO $pdo,array $actor,int $renewalId,string $reason): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $reason=trim($reason);
    if(mb_strlen($reason)<3 || mb_strlen($reason)>1000) throw new RuntimeException('Yenilenmeme nedenini 3 ile 1000 karakter arasında yaz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ly_case_row($pdo,$renewalId,true);
        if(!$case) throw new RuntimeException('Yenileme vakası bulunamadı.');
        if(!in_array((string)$case['durum'],ly_open_statuses(),true)) throw new RuntimeException('Bu yenileme vakası zaten kapanmış.');

        $stmt=$pdo->prepare("UPDATE kurum_lisans_yenilemeleri
            SET durum='yenilenmedi',kapanma_tarihi=NOW(),son_temas_tarihi=CURDATE(),
                sonraki_takip_tarihi=NULL,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','temas','teklif')");
        $stmt->execute([(int)$actor['id'],$renewalId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Yenileme vakası kapatılamadı.');
        $stmt->closeCursor();

        ly_add_history(
            $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
            'durum','yenilenmedi','Yenilenmedi: '.$reason
        );
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'lisans_yenilenmedi','Yenileme #'.$renewalId.' neden '.$reason);
}

function ly_summary(PDO $pdo): array {
    $out=[
        'acik'=>0,'expired'=>0,'gun_1'=>0,'gun_7'=>0,'gun_15'=>0,'gun_30'=>0,
        'yenilendi'=>0,'yenilenmedi'=>0,'takip_bekleyen'=>0
    ];
    if(!ly_tables_ready($pdo)) return $out;

    $stmt=$pdo->query("SELECT
        SUM(CASE WHEN durum IN ('acik','temas','teklif') THEN 1 ELSE 0 END) acik,
        SUM(CASE WHEN durum IN ('acik','temas','teklif') AND hedef_bitis_tarihi<CURDATE() THEN 1 ELSE 0 END) expired,
        SUM(CASE WHEN durum IN ('acik','temas','teklif') AND DATEDIFF(hedef_bitis_tarihi,CURDATE()) BETWEEN 0 AND 1 THEN 1 ELSE 0 END) gun_1,
        SUM(CASE WHEN durum IN ('acik','temas','teklif') AND DATEDIFF(hedef_bitis_tarihi,CURDATE()) BETWEEN 2 AND 7 THEN 1 ELSE 0 END) gun_7,
        SUM(CASE WHEN durum IN ('acik','temas','teklif') AND DATEDIFF(hedef_bitis_tarihi,CURDATE()) BETWEEN 8 AND 15 THEN 1 ELSE 0 END) gun_15,
        SUM(CASE WHEN durum IN ('acik','temas','teklif') AND DATEDIFF(hedef_bitis_tarihi,CURDATE()) BETWEEN 16 AND 30 THEN 1 ELSE 0 END) gun_30,
        SUM(CASE WHEN durum='yenilendi' THEN 1 ELSE 0 END) yenilendi,
        SUM(CASE WHEN durum='yenilenmedi' THEN 1 ELSE 0 END) yenilenmedi,
        SUM(CASE WHEN durum IN ('acik','temas','teklif')
                  AND sonraki_takip_tarihi IS NOT NULL
                  AND sonraki_takip_tarihi<=CURDATE() THEN 1 ELSE 0 END) takip_bekleyen
        FROM kurum_lisans_yenilemeleri");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(is_array($row)){
        foreach(array_keys($out) as $key)$out[$key]=max(0,(int)($row[$key]??0));
    }
    return $out;
}

function ly_notification_milestone(int $remainingDays): ?int {
    if($remainingDays>30) return null;
    if($remainingDays<=0) return 0;
    if($remainingDays<=1) return 1;
    if($remainingDays<=7) return 7;
    if($remainingDays<=15) return 15;
    return 30;
}

function ly_manager_recipients(PDO $pdo,int $institutionId): array {
    if($institutionId<=0 || !auth_runtime_table_exists($pdo,'kurum_kullanicilari')) return [];
    $stmt=$pdo->prepare("SELECT DISTINCT kk.kullanici_id,'yonetici' kurum_rolu
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        WHERE kk.kurum_id=? AND kk.kurum_rolu='yonetici' AND kk.aktif=1
        ORDER BY kk.kullanici_id");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ly_sync_manager_notifications(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!ly_tables_ready($pdo)) return ['sent'=>0,'skipped'=>0];
    if(!function_exists('bd_tables_ready') || !function_exists('bd_insert_announcement') || !bd_tables_ready($pdo)){
        return ['sent'=>0,'skipped'=>0];
    }

    $stmt=$pdo->query("SELECT
        y.id,y.lisans_id,y.kurum_id,y.hedef_bitis_tarihi,
        k.ad kurum_adi,p.ad paket_adi,
        DATEDIFF(y.hedef_bitis_tarihi,CURDATE()) kalan_gun
        FROM kurum_lisans_yenilemeleri y
        INNER JOIN kurumlar k ON k.id=y.kurum_id
        INNER JOIN kurum_lisanslari kl ON kl.id=y.lisans_id AND kl.kurum_id=y.kurum_id
        LEFT JOIN paketler p ON p.id=kl.paket_id
        WHERE y.durum IN ('acik','temas','teklif')
        ORDER BY y.hedef_bitis_tarihi,y.id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();

    $sent=0;
    $skipped=0;
    $milestoneIndex=[30=>1,15=>2,7=>3,1=>4,0=>5];
    foreach($rows as $row){
        $remaining=(int)$row['kalan_gun'];
        $milestone=ly_notification_milestone($remaining);
        if($milestone===null){$skipped++;continue;}
        $code='gun_'.$milestone;
        if(ly_history_has_code($pdo,(int)$row['id'],'bildirim',$code)){$skipped++;continue;}

        $recipients=ly_manager_recipients($pdo,(int)$row['kurum_id']);
        if(!$recipients){$skipped++;continue;}

        $isExpired=$milestone===0;
        $title=$isExpired?'Kurum lisansınızın süresi doldu':'Kurum lisansınızın süresi yaklaşıyor';
        if($isExpired){
            $message=(string)$row['kurum_adi'].' kurumunun '.(string)($row['paket_adi']?:'paket').' lisansı '
                .(string)$row['hedef_bitis_tarihi'].' tarihinde sona erdi. Yenileme için İlkAdım destek ekibiyle iletişime geçebilirsiniz.';
            $importance='acil';
        }else{
            $message=(string)$row['kurum_adi'].' kurumunun '.(string)($row['paket_adi']?:'paket').' lisansının bitiş tarihi '
                .(string)$row['hedef_bitis_tarihi'].'. Yaklaşık '.$milestone.' gün kaldı. Yenileme için destek ekibiyle iletişime geçebilirsiniz.';
            $importance=$milestone<=7?'acil':'onemli';
        }

        try{
            $sourceId=((int)$row['id']*10)+(int)$milestoneIndex[$milestone];
            $announcementId=bd_insert_announcement(
                $pdo,(int)$row['kurum_id'],(int)$actor['id'],'sistem',
                $title,$message,$importance,'yonetici',$recipients,
                'destek.php',null,'lisans_yenileme',$sourceId
            );
            if($announcementId>0){
                ly_add_history(
                    $pdo,(int)$row['id'],(int)$row['lisans_id'],(int)$row['kurum_id'],(int)$actor['id'],
                    'bildirim',$code,'Kurum yöneticilerine '.$title.' bildirimi gönderildi.'
                );
                $sent++;
            }else{
                $skipped++;
            }
        }catch(Throwable $e){
            error_log('[IlkAdim][lisans-yenileme] Yönetici bildirimi gönderilemedi: '.$e->getMessage());
            $skipped++;
        }
    }

    return ['sent'=>$sent,'skipped'=>$skipped];
}
