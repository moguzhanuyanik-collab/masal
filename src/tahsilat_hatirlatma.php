<?php
declare(strict_types=1);

function th_tables_ready(PDO $pdo): bool {
    return tr_tables_ready($pdo)
        && bd_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_tahsilat_hatirlatmalari');
}

function th_milestone(?string $dueDate,?string $today=null): ?array {
    $dueDate=trim((string)$dueDate);
    if($dueDate==='') return null;
    $today=$today?:date('Y-m-d');

    $due=DateTimeImmutable::createFromFormat('!Y-m-d',$dueDate);
    $base=DateTimeImmutable::createFromFormat('!Y-m-d',$today);
    if(!$due || !$base) return null;

    $late=(int)$due->diff($base)->format('%r%a');
    if($late<0){
        $daysUntil=abs($late);
        if($daysUntil<=7){
            return [
                'kod'=>'vade_7',
                'etiket'=>'Vade yaklaşıyor',
                'onem'=>'normal',
                'gecikme_gunu'=>$late,
            ];
        }
        return null;
    }
    if($late<7){
        return [
            'kod'=>'vade_0',
            'etiket'=>$late===0?'Vade bugün':'Vade geçti',
            'onem'=>'onemli',
            'gecikme_gunu'=>$late,
        ];
    }
    if($late<15){
        return [
            'kod'=>'gecikme_7',
            'etiket'=>'7+ gün gecikme',
            'onem'=>'onemli',
            'gecikme_gunu'=>$late,
        ];
    }
    if($late<30){
        return [
            'kod'=>'gecikme_15',
            'etiket'=>'15+ gün gecikme',
            'onem'=>'acil',
            'gecikme_gunu'=>$late,
        ];
    }
    return [
        'kod'=>'gecikme_30',
        'etiket'=>'30+ gün gecikme',
        'onem'=>'acil',
        'gecikme_gunu'=>$late,
    ];
}

function th_manager_recipients(PDO $pdo,int $institutionId): array {
    if($institutionId<=0 || !bd_table_exists($pdo,'kurum_kullanicilari')) return [];
    $stmt=$pdo->prepare("SELECT kk.kullanici_id,'yonetici' kurum_rolu
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        WHERE kk.kurum_id=?
          AND kk.aktif=1
          AND kk.kurum_rolu='yonetici'
        GROUP BY kk.kullanici_id
        ORDER BY kk.kullanici_id");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function th_history_exists(PDO $pdo,int $contractId,string $dueDate,string $code): bool {
    if(!th_tables_ready($pdo) || $contractId<=0 || $dueDate==='' || $code==='') return false;
    $stmt=$pdo->prepare("SELECT id FROM ticari_tahsilat_hatirlatmalari
        WHERE sozlesme_id=? AND vade_tarihi=? AND esik_kodu=? LIMIT 1");
    $stmt->execute([$contractId,$dueDate,$code]);
    $exists=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $exists;
}

function th_notification_text(array $row,array $milestone): array {
    $institution=trim((string)($row['kurum_adi']??'Kurum'));
    $contract=trim((string)($row['sozlesme_no']??''));
    $due=(string)($row['vade_tarihi']??'');
    $remaining=number_format((float)($row['kalan_tutar']??0),2,',','.');
    $currency=(string)($row['para_birimi']??'TRY');
    $late=(int)($milestone['gecikme_gunu']??0);

    $installment=!empty($row['taksit_plani_aktif']);
    $dueLabel=$installment?'taksit vadesi':'vade';
    $amountLabel=$installment?'Açık sözleşme bakiyesi':'Açık tutar';

    if((string)$milestone['kod']==='vade_7'){
        $days=abs($late);
        $title=$installment?'Taksit vadesi yaklaşıyor':'Tahsilat vadesi yaklaşıyor';
        $message=$institution.' için '.$contract.' numaralı sözleşmenin '.$due.' tarihli '.$dueLabel.'ne '
            .$days.' gün kaldı. '.$amountLabel.': '.$remaining.' '.$currency.'.';
    }elseif((string)$milestone['kod']==='vade_0'){
        $title=$late===0
            ?($installment?'Taksit vadesi bugün':'Tahsilat vadesi bugün')
            :($installment?'Taksit vadesi geçti':'Tahsilat vadesi geçti');
        $message=$institution.' için '.$contract.' numaralı sözleşmenin '.$dueLabel.' '.$due.'. '.$amountLabel.': '
            .$remaining.' '.$currency.'.';
        if($late>0)$message.=' Gecikme: '.$late.' gün.';
    }else{
        $title=$installment?'Geciken taksit hatırlatması':'Geciken tahsilat hatırlatması';
        $message=$institution.' için '.$contract.' numaralı sözleşmenin '.$due.' tarihli '.$dueLabel.' '
            .$late.' gün gecikti. '.$amountLabel.': '.$remaining.' '.$currency.'.';
    }

    $message.=' Ödeme/tahsilat durumu için kurum yetkilinizle iletişime geçebilirsiniz.';
    return [$title,$message];
}

function th_sync_manager_reminders(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!th_tables_ready($pdo)) throw new RuntimeException('Tahsilat hatırlatma migrationı henüz kurulmamış.');

    $sent=0;
    $skipped=0;
    $noRecipient=0;
    $failed=0;

    $rows=tr_queue_rows($pdo,['durum'=>'open'],1000);
    foreach($rows as $row){
        $contractId=(int)($row['sozlesme_id']??0);
        $institutionId=(int)($row['kurum_id']??0);
        $due=(string)($row['vade_tarihi']??'');
        $remaining=(float)($row['kalan_tutar']??0);
        if($contractId<=0 || $institutionId<=0 || $due==='' || $remaining<=0.009){
            $skipped++;
            continue;
        }

        $milestone=th_milestone($due);
        if(!$milestone){
            $skipped++;
            continue;
        }
        $code=(string)$milestone['kod'];

        if(th_history_exists($pdo,$contractId,$due,$code)){
            $skipped++;
            continue;
        }

        $recipients=th_manager_recipients($pdo,$institutionId);
        if(!$recipients){
            $noRecipient++;
            continue;
        }

        $started=false;
        try{
            if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

            $lock=$pdo->prepare('SELECT id FROM kurum_sozlesmeleri WHERE id=? AND kurum_id=? LIMIT 1 FOR UPDATE');
            $lock->execute([$contractId,$institutionId]);
            $exists=(bool)$lock->fetchColumn();
            $lock->closeCursor();
            if(!$exists) throw new RuntimeException('Sözleşme bulunamadı.');

            $financial=tr_contract_financial_state($pdo,$contractId,false);
            if(!$financial || !tr_should_track($financial)) {
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $freshDue=(string)($financial['vade_tarihi']??'');
            $freshMilestone=th_milestone($freshDue);
            if(!$freshMilestone || (float)$financial['kalan_tutar']<=0.009){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $freshCode=(string)$freshMilestone['kod'];

            $find=$pdo->prepare("SELECT id FROM ticari_tahsilat_hatirlatmalari
                WHERE sozlesme_id=? AND vade_tarihi=? AND esik_kodu=? LIMIT 1 FOR UPDATE");
            $find->execute([$contractId,$freshDue,$freshCode]);
            $existing=(int)($find->fetchColumn()?:0);
            $find->closeCursor();
            if($existing>0){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $insert=$pdo->prepare("INSERT IGNORE INTO ticari_tahsilat_hatirlatmalari
                (sozlesme_id,kurum_id,vade_tarihi,esik_kodu,acik_tutar,para_birimi,gonderen_kullanici_id)
                VALUES (?,?,?,?,?,?,?)");
            $insert->execute([
                $contractId,$institutionId,$freshDue,$freshCode,
                (string)$financial['kalan_tutar'],(string)$financial['para_birimi'],(int)$actor['id']
            ]);
            if($insert->rowCount()!==1){
                $insert->closeCursor();
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $reminderId=(int)$pdo->lastInsertId();
            $insert->closeCursor();

            $notificationRow=array_merge($row,$financial);
            [$title,$message]=th_notification_text($notificationRow,$freshMilestone);
            $announcementId=bd_insert_announcement(
                $pdo,$institutionId,(int)$actor['id'],'sistem',
                $title,$message,(string)$freshMilestone['onem'],'yonetici',
                $recipients,'bildirimler.php',null,'tahsilat_hatirlatma',$reminderId
            );
            if($announcementId<=0) throw new RuntimeException('Tahsilat hatırlatma bildirimi oluşturulamadı.');

            $update=$pdo->prepare("UPDATE ticari_tahsilat_hatirlatmalari
                SET duyuru_id=?,alici_sayisi=? WHERE id=?");
            $update->execute([$announcementId,count($recipients),$reminderId]);
            $update->closeCursor();

            tr_history_add(
                $pdo,$contractId,$institutionId,(int)$actor['id'],
                'bildirim',$freshCode,
                'Kurum yöneticilerine tahsilat hatırlatması gönderildi. Alıcı: '.count($recipients)
            );

            if($started)$pdo->commit();
            $sent++;
        }catch(Throwable $e){
            if($started && $pdo->inTransaction())$pdo->rollBack();
            $failed++;
        }
    }

    return [
        'sent'=>$sent,
        'skipped'=>$skipped,
        'no_recipient'=>$noRecipient,
        'failed'=>$failed,
    ];
}

function th_history_rows(PDO $pdo,int $limit=300): array {
    if(!th_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        h.id,h.sozlesme_id,h.kurum_id,h.vade_tarihi,h.esik_kodu,h.acik_tutar,h.para_birimi,
        h.duyuru_id,h.alici_sayisi,h.gonderen_kullanici_id,h.olusturulma_tarihi,
        s.sozlesme_no,k.ad kurum_adi,
        COALESCE(u.ad_soyad,'Sistem') gonderen_adi
        FROM ticari_tahsilat_hatirlatmalari h
        LEFT JOIN kurum_sozlesmeleri s ON s.id=h.sozlesme_id AND s.kurum_id=h.kurum_id
        LEFT JOIN kurumlar k ON k.id=h.kurum_id
        LEFT JOIN kullanicilar u ON u.id=h.gonderen_kullanici_id
        ORDER BY h.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function th_contract_history(PDO $pdo,int $contractId,int $limit=100): array {
    if(!th_tables_ready($pdo) || $contractId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        h.id,h.vade_tarihi,h.esik_kodu,h.acik_tutar,h.para_birimi,
        h.duyuru_id,h.alici_sayisi,h.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') gonderen_adi
        FROM ticari_tahsilat_hatirlatmalari h
        LEFT JOIN kullanicilar u ON u.id=h.gonderen_kullanici_id
        WHERE h.sozlesme_id=?
        ORDER BY h.id DESC
        LIMIT {$limit}");
    $stmt->execute([$contractId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function th_summary(PDO $pdo): array {
    $out=['toplam'=>0,'vade_7'=>0,'vade_0'=>0,'gecikme_7'=>0,'gecikme_15'=>0,'gecikme_30'=>0];
    if(!th_tables_ready($pdo)) return $out;
    $stmt=$pdo->query("SELECT esik_kodu,COUNT(*) adet
        FROM ticari_tahsilat_hatirlatmalari
        GROUP BY esik_kodu");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    foreach($rows as $row){
        $code=(string)$row['esik_kodu'];
        $count=(int)$row['adet'];
        $out['toplam']+=$count;
        if(array_key_exists($code,$out))$out[$code]+=$count;
    }
    return $out;
}
