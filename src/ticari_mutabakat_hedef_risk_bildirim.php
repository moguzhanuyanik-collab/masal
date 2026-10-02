<?php
declare(strict_types=1);

function mrb_tables_ready(PDO $pdo): bool {
    return mhr_tables_ready($pdo)
        && bd_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_hedef_risk_bildirimleri');
}

function mrb_signal(array $row): ?array {
    if(empty($row['hedef_politika_id'])) return null;
    $risk=(string)($row['hedef_risk_kodu']??'');
    if($risk==='hedef_disinda'){
        return [
            'kod'=>'hedef_disinda',
            'etiket'=>'Hedef dışında',
            'onem'=>'acil',
        ];
    }
    if($risk==='yuzde_75'){
        return [
            'kod'=>'hedef_75',
            'etiket'=>'Hedef süresinin %75+ bölümü kullanıldı',
            'onem'=>'onemli',
        ];
    }
    return null;
}

function mrb_cycle_key(int $caseId,string $cycleStart): string {
    return hash('sha256',$caseId.'|'.trim($cycleStart));
}

function mrb_owner(PDO $pdo,int $userId): ?array {
    if($userId<=0) return null;
    $user=auth_fetch_user($pdo,$userId);
    if(!$user || !auth_user_has_role($user,'super_admin')) return null;
    return $user;
}

function mrb_history_exists(
    PDO $pdo,
    int $caseId,
    string $cycleKey,
    int $policyId,
    string $signalCode,
    int $recipientId
): bool {
    if(!mrb_tables_ready($pdo) || $caseId<=0 || $cycleKey==='' || $policyId<=0 || $signalCode==='' || $recipientId<=0){
        return false;
    }
    $stmt=$pdo->prepare("SELECT id
        FROM ticari_mutabakat_hedef_risk_bildirimleri
        WHERE vaka_id=? AND dongu_anahtari=? AND hedef_politika_id=? AND esik_kodu=? AND alici_kullanici_id=?
        LIMIT 1");
    $stmt->execute([$caseId,$cycleKey,$policyId,$signalCode,$recipientId]);
    $exists=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $exists;
}

function mrb_case_state(PDO $pdo,array $actor,int $caseId): ?array {
    if($caseId<=0) return null;
    foreach(mhr_rows($pdo,$actor,['scope'=>'team'],1500) as $row){
        if((int)($row['id']??0)===$caseId) return $row;
    }
    return null;
}

function mrb_candidate_rows(PDO $pdo,array $actor,int $limit=1200): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrb_tables_ready($pdo)) return [];
    $limit=max(1,min(1500,$limit));
    $out=[];
    foreach(mhr_rows($pdo,$actor,['scope'=>'team'],1500) as $row){
        $signal=mrb_signal($row);
        if(!$signal) continue;

        $caseId=(int)($row['id']??0);
        $ownerId=(int)($row['sorumlu_kullanici_id']??0);
        $institutionId=(int)($row['kurum_id']??0);
        $policyId=(int)($row['hedef_politika_id']??0);
        $cycleStart=(string)($row['dongu_baslangic_tarihi']??'');
        if($caseId<=0 || $policyId<=0 || $cycleStart==='') continue;

        $cycleKey=mrb_cycle_key($caseId,$cycleStart);
        $owner=mrb_owner($pdo,$ownerId);
        $row['vaka_id']=$caseId;
        $row['esik_kodu']=$signal['kod'];
        $row['esik_etiketi']=$signal['etiket'];
        $row['bildirim_onemi']=$signal['onem'];
        $row['dongu_anahtari']=$cycleKey;
        $row['alici_gecerli']=$owner!==null;
        $row['kurum_gecerli']=$institutionId>0;
        $row['gonderildi']=$owner!==null
            && $institutionId>0
            && mrb_history_exists($pdo,$caseId,$cycleKey,$policyId,(string)$signal['kod'],$ownerId);
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}

function mrb_notification_text(array $row,array $signal): array {
    $institution=trim((string)($row['kurum_adi']??'Kurum'));
    $contract=trim((string)($row['sozlesme_no']??('#'.(int)($row['sozlesme_id']??0))));
    $issue=(string)($row['sorun_turu']??'')==='butunluk'?'Veri bütünlüğü':'Operasyon açığı';
    $usage=$row['hedef_sure_kullanim_orani']!==null
        ?number_format((float)$row['hedef_sure_kullanim_orani'],1,',','.')
        :null;
    $policyId=(int)($row['hedef_politika_id']??0);

    if((string)$signal['kod']==='hedef_disinda'){
        $title='Mutabakat hedef riski: hedef dışında';
        $message=$institution.' · '.$contract.' vakası tarihsel iç operasyon hedefinin dışına çıktı.';
    }else{
        $title='Mutabakat hedef riski: süre %75+';
        $message=$institution.' · '.$contract.' vakası tarihsel iç operasyon hedef süresinin büyük bölümünü kullandı.';
    }

    if($usage!==null) $message.=' Kullanım: %'.$usage.'.';
    $message.=' Politika #'.$policyId.'. Sorun türü: '.$issue.'.';

    $flags=[];
    if((string)($row['hedef_cevrim_durumu']??'')==='hedef_disinda') $flags[]='çevrim hedefi dışında';
    if((string)($row['hedef_ilk_mudahale_durumu']??'')==='hedef_disinda') $flags[]='ilk müdahale hedefi dışında';
    if(!empty($row['ilk_mudahale_bekliyor'])) $flags[]='ilk müdahale bekliyor';
    if(!empty($row['aksiyon_gecikti'])) $flags[]='aksiyon tarihi gecikmiş';
    if(!empty($row['aksiyon_bugun'])) $flags[]='aksiyon bugün';
    if($flags) $message.=' Durum: '.implode(', ',$flags).'.';

    $remaining=$row['hedef_kalan_saat'];
    if($remaining!==null && (float)$remaining>0){
        $message.=' En yakın hedef için yaklaşık '.mhr_remaining_label((float)$remaining).' kaldı.';
    }

    $description=trim((string)($row['son_aciklama']??''));
    if($description!==''){
        if(mb_strlen($description)>180) $description=mb_substr($description,0,177).'...';
        $message.=' Son teşhis: '.$description;
    }
    return [$title,$message];
}

function mrb_sync(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!mrb_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat hedef-risk bildirim migrationı henüz kurulmamış.');
    }

    $sent=0;
    $skipped=0;
    $invalidOwner=0;
    $noInstitution=0;
    $staleSource=0;
    $failed=0;

    foreach(mrb_candidate_rows($pdo,$actor,1500) as $candidate){
        $caseId=(int)$candidate['vaka_id'];
        $ownerId=(int)($candidate['sorumlu_kullanici_id']??0);
        $institutionId=(int)($candidate['kurum_id']??0);

        if($institutionId<=0){
            $noInstitution++;
            continue;
        }
        if(!mrb_owner($pdo,$ownerId)){
            $invalidOwner++;
            continue;
        }

        $started=false;
        try{
            if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

            $lock=$pdo->prepare("SELECT *
                FROM ticari_mutabakat_vakalari
                WHERE id=?
                LIMIT 1 FOR UPDATE");
            $lock->execute([$caseId]);
            $case=$lock->fetch(PDO::FETCH_ASSOC);
            $lock->closeCursor();

            if(!is_array($case)
                || !in_array((string)$case['durum'],ma_open_stages(),true)
                || (int)($case['sorumlu_kullanici_id']??0)!==$ownerId
                || (int)($case['kurum_id']??0)!==$institutionId){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            if(!mrb_owner($pdo,$ownerId)){
                if($started)$pdo->commit();
                $invalidOwner++;
                continue;
            }

            if(!ma_case_source_still_open($pdo,$case)){
                if($started)$pdo->commit();
                $staleSource++;
                continue;
            }

            $fresh=mrb_case_state($pdo,$actor,$caseId);
            if(!$fresh
                || (int)($fresh['sorumlu_kullanici_id']??0)!==$ownerId
                || (int)($fresh['kurum_id']??0)!==$institutionId){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $signal=mrb_signal($fresh);
            $policyId=(int)($fresh['hedef_politika_id']??0);
            $cycleStart=(string)($fresh['dongu_baslangic_tarihi']??'');
            if(!$signal || $policyId<=0 || $cycleStart===''){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $cycleKey=mrb_cycle_key($caseId,$cycleStart);
            $code=(string)$signal['kod'];

            $find=$pdo->prepare("SELECT id
                FROM ticari_mutabakat_hedef_risk_bildirimleri
                WHERE vaka_id=? AND dongu_anahtari=? AND hedef_politika_id=? AND esik_kodu=? AND alici_kullanici_id=?
                LIMIT 1 FOR UPDATE");
            $find->execute([$caseId,$cycleKey,$policyId,$code,$ownerId]);
            $existing=(int)($find->fetchColumn()?:0);
            $find->closeCursor();
            if($existing>0){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $insert=$pdo->prepare("INSERT IGNORE INTO ticari_mutabakat_hedef_risk_bildirimleri
                (vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,
                 esik_kodu,risk_kodu,kullanim_orani,gonderen_kullanici_id)
                VALUES (?,?,?,?,?,?,?,?,?)");
            $insert->execute([
                $caseId,$institutionId,$policyId,$ownerId,$cycleKey,
                $code,(string)$fresh['hedef_risk_kodu'],
                $fresh['hedef_sure_kullanim_orani']!==null?(float)$fresh['hedef_sure_kullanim_orani']:null,
                (int)$actor['id']
            ]);
            if($insert->rowCount()!==1){
                $insert->closeCursor();
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $notificationId=(int)$pdo->lastInsertId();
            $insert->closeCursor();

            [$title,$message]=mrb_notification_text($fresh,$signal);
            $announcementId=bd_insert_announcement(
                $pdo,$institutionId,(int)$actor['id'],'sistem',
                $title,$message,(string)$signal['onem'],'super_admin',
                [['kullanici_id'=>$ownerId,'kurum_rolu'=>'super_admin']],
                'ticari-mutabakat-aksiyon.php?vaka_id='.$caseId,
                null,'mutabakat_hedef_risk_bildirim',$notificationId
            );
            if($announcementId<=0) throw new RuntimeException('Mutabakat hedef-risk bildirimi oluşturulamadı.');

            $update=$pdo->prepare("UPDATE ticari_mutabakat_hedef_risk_bildirimleri
                SET duyuru_id=? WHERE id=?");
            $update->execute([$announcementId,$notificationId]);
            $update->closeCursor();

            ma_history_add(
                $pdo,$caseId,(int)$actor['id'],'bildirim','hedef_risk_'.$code,
                'Hedef-risk bildirimi sorumlu Süper Admin #'.$ownerId.' kullanıcısına gönderildi. '
                .'Politika #'.$policyId.' · '.(string)$signal['etiket'].'.'
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
        'invalid_owner'=>$invalidOwner,
        'no_institution'=>$noInstitution,
        'stale_source'=>$staleSource,
        'failed'=>$failed,
    ];
}

function mrb_history_rows(PDO $pdo,int $limit=300): array {
    if(!mrb_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        b.id,b.vaka_id,b.kurum_id,b.hedef_politika_id,b.alici_kullanici_id,
        b.dongu_anahtari,b.esik_kodu,b.risk_kodu,b.kullanim_orani,
        b.duyuru_id,b.gonderen_kullanici_id,b.olusturulma_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'—') alici_adi,
        COALESCE(g.ad_soyad,'Sistem') gonderen_adi
        FROM ticari_mutabakat_hedef_risk_bildirimleri b
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=b.vaka_id
        LEFT JOIN kurumlar k ON k.id=b.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=b.alici_kullanici_id
        LEFT JOIN kullanicilar g ON g.id=b.gonderen_kullanici_id
        ORDER BY b.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mrb_summary(PDO $pdo,array $actor): array {
    $out=[
        'pending'=>0,
        'sent_current'=>0,
        'invalid_owner'=>0,
        'no_institution'=>0,
        'history_total'=>0,
        'history_75'=>0,
        'history_outside'=>0,
    ];
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrb_tables_ready($pdo)) return $out;

    foreach(mrb_candidate_rows($pdo,$actor,1500) as $row){
        if(empty($row['kurum_gecerli'])){
            $out['no_institution']++;
        }elseif(empty($row['alici_gecerli'])){
            $out['invalid_owner']++;
        }elseif(!empty($row['gonderildi'])){
            $out['sent_current']++;
        }else{
            $out['pending']++;
        }
    }

    $stmt=$pdo->query("SELECT
        COUNT(*) toplam,
        SUM(esik_kodu='hedef_75') hedef_75,
        SUM(esik_kodu='hedef_disinda') hedef_disinda
        FROM ticari_mutabakat_hedef_risk_bildirimleri");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    $out['history_total']=(int)($row['toplam']??0);
    $out['history_75']=(int)($row['hedef_75']??0);
    $out['history_outside']=(int)($row['hedef_disinda']??0);
    return $out;
}
