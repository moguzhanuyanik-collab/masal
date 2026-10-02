<?php
declare(strict_types=1);

function me_tables_ready(PDO $pdo): bool {
    return mhs_tables_ready($pdo)
        && bd_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_eskalasyonlari');
}

function me_owner(PDO $pdo,int $userId): ?array {
    if($userId<=0) return null;
    $user=auth_fetch_user($pdo,$userId);
    if(!$user || !auth_user_has_role($user,'super_admin')) return null;
    return $user;
}

function me_milestone(array $row): ?array {
    $days=max(0,(int)($row['acik_gun']??0));
    $noIntervention=!empty($row['ilk_mudahale_yok']);

    if($days>=30){
        return ['kod'=>'dongu_30','etiket'=>'30+ gün açık','onem'=>'acil','seviye'=>'kritik'];
    }
    if($days>=14){
        return ['kod'=>'dongu_14','etiket'=>'14+ gün açık','onem'=>'acil','seviye'=>'kritik'];
    }
    if($days>=8){
        return ['kod'=>'dongu_8','etiket'=>'8+ gün açık','onem'=>'acil','seviye'=>'yuksek'];
    }
    if($days>=4){
        return ['kod'=>'dongu_4','etiket'=>'4+ gün açık','onem'=>'onemli','seviye'=>'orta'];
    }
    if($days>=2 && $noIntervention){
        return ['kod'=>'ilk_mudahale_2','etiket'=>'2+ gün ilk müdahale yok','onem'=>'onemli','seviye'=>'orta'];
    }
    return null;
}

function me_cycle_key(int $caseId,string $cycleStart): string {
    return hash('sha256',$caseId.'|'.trim($cycleStart));
}

function me_case_health(PDO $pdo,int $caseId): ?array {
    if(!mhs_tables_ready($pdo) || $caseId<=0) return null;

    $cycle=mhs_cycle_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";
    $intervention=mhs_intervention_exists_expr('v');

    $stmt=$pdo->prepare("SELECT
        v.id vaka_id,v.kurum_id,v.sozlesme_id,v.sorun_turu,v.durum,
        v.sorumlu_kullanici_id,v.sonraki_aksiyon_tarihi,v.son_aciklama,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        {$cycle} dongu_baslangic_tarihi,
        {$ageExpr} acik_gun,
        NOT {$intervention} ilk_mudahale_yok
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        WHERE v.id=?
        LIMIT 1");
    $stmt->execute([$caseId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;

    $next=trim((string)($row['sonraki_aksiyon_tarihi']??''));
    $row['aksiyon_gecikti']=$next!=='' && $next<date('Y-m-d');
    $row['aksiyon_tarihi_yok']=$next==='';
    return $row;
}

function me_history_exists(
    PDO $pdo,
    int $caseId,
    string $cycleKey,
    string $code,
    int $recipientId
): bool {
    if(!me_tables_ready($pdo) || $caseId<=0 || $cycleKey==='' || $code==='' || $recipientId<=0) return false;
    $stmt=$pdo->prepare("SELECT id
        FROM ticari_mutabakat_eskalasyonlari
        WHERE vaka_id=? AND dongu_anahtari=? AND esik_kodu=? AND alici_kullanici_id=?
        LIMIT 1");
    $stmt->execute([$caseId,$cycleKey,$code,$recipientId]);
    $exists=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $exists;
}

function me_candidate_rows(PDO $pdo,int $limit=1200): array {
    if(!me_tables_ready($pdo)) return [];
    $limit=max(1,min(2000,$limit));

    $rows=mhs_case_rows($pdo,[],min(1500,$limit));
    $out=[];
    foreach($rows as $row){
        $milestone=me_milestone($row);
        if(!$milestone) continue;

        $caseId=(int)($row['id']??0);
        $ownerId=(int)($row['sorumlu_kullanici_id']??0);
        $cycleStart=(string)($row['dongu_baslangic_tarihi']??'');
        if($caseId<=0 || $cycleStart==='') continue;

        $owner=me_owner($pdo,$ownerId);
        $cycleKey=me_cycle_key($caseId,$cycleStart);
        $row['vaka_id']=$caseId;
        $row['esik_kodu']=$milestone['kod'];
        $row['esik_etiketi']=$milestone['etiket'];
        $row['eskalasyon_seviyesi']=$milestone['seviye'];
        $row['alici_gecerli']=$owner!==null;
        $row['kurum_gecerli']=(int)($row['kurum_id']??0)>0;
        $row['dongu_anahtari']=$cycleKey;
        $row['gonderildi']=$owner!==null
            && $row['kurum_gecerli']
            && me_history_exists($pdo,$caseId,$cycleKey,(string)$milestone['kod'],$ownerId);
        $out[]=$row;
    }
    return $out;
}

function me_notification_text(array $case,array $milestone): array {
    $institution=trim((string)($case['kurum_adi']??'Kurum'));
    $contract=trim((string)($case['sozlesme_no']??('#'.(int)($case['sozlesme_id']??0))));
    $days=max(0,(int)($case['acik_gun']??0));
    $issue=(string)($case['sorun_turu']??'')==='butunluk'?'Veri bütünlüğü':'Operasyon açığı';

    $title='Mutabakat operasyon eskalasyonu';
    $message=$institution.' · '.$contract.' mutabakat vakası mevcut açık döngüde '.$days
        .' gündür açık. Eşik: '.(string)$milestone['etiket'].'. Sorun türü: '.$issue.'.';

    $flags=[];
    if(!empty($case['ilk_mudahale_yok'])) $flags[]='ilk müdahale yok';
    if(!empty($case['aksiyon_tarihi_yok'])) $flags[]='aksiyon tarihi yok';
    if(!empty($case['aksiyon_gecikti'])) $flags[]='aksiyon tarihi gecikmiş';
    if($flags) $message.=' Sağlık göstergeleri: '.implode(', ',$flags).'.';

    $description=trim((string)($case['son_aciklama']??''));
    if($description!==''){
        if(mb_strlen($description)>220) $description=mb_substr($description,0,217).'...';
        $message.=' Son teşhis: '.$description;
    }
    return [$title,$message];
}

function me_sync(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!me_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat eskalasyon migrationı henüz kurulmamış.');
    }

    $sent=0;
    $skipped=0;
    $invalidOwner=0;
    $noInstitution=0;
    $staleSource=0;
    $failed=0;

    foreach(me_candidate_rows($pdo,1500) as $candidate){
        $caseId=(int)$candidate['vaka_id'];
        $ownerId=(int)($candidate['sorumlu_kullanici_id']??0);
        $institutionId=(int)($candidate['kurum_id']??0);

        if($institutionId<=0){
            $noInstitution++;
            continue;
        }
        if(!me_owner($pdo,$ownerId)){
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

            $owner=me_owner($pdo,$ownerId);
            if(!$owner){
                if($started)$pdo->commit();
                $invalidOwner++;
                continue;
            }

            if(!ma_case_source_still_open($pdo,$case)){
                if($started)$pdo->commit();
                $staleSource++;
                continue;
            }

            $fresh=me_case_health($pdo,$caseId);
            if(!$fresh){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $milestone=me_milestone($fresh);
            if(!$milestone){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $cycleStart=(string)$fresh['dongu_baslangic_tarihi'];
            $cycleKey=me_cycle_key($caseId,$cycleStart);
            $code=(string)$milestone['kod'];

            $find=$pdo->prepare("SELECT id
                FROM ticari_mutabakat_eskalasyonlari
                WHERE vaka_id=? AND dongu_anahtari=? AND esik_kodu=? AND alici_kullanici_id=?
                LIMIT 1 FOR UPDATE");
            $find->execute([$caseId,$cycleKey,$code,$ownerId]);
            $existing=(int)($find->fetchColumn()?:0);
            $find->closeCursor();
            if($existing>0){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $insert=$pdo->prepare("INSERT IGNORE INTO ticari_mutabakat_eskalasyonlari
                (vaka_id,kurum_id,alici_kullanici_id,dongu_anahtari,dongu_baslangic_tarihi,
                 esik_kodu,acik_gun,gonderen_kullanici_id)
                VALUES (?,?,?,?,?,?,?,?)");
            $insert->execute([
                $caseId,$institutionId,$ownerId,$cycleKey,$cycleStart,$code,
                max(0,(int)$fresh['acik_gun']),(int)$actor['id']
            ]);
            if($insert->rowCount()!==1){
                $insert->closeCursor();
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $escalationId=(int)$pdo->lastInsertId();
            $insert->closeCursor();

            [$title,$message]=me_notification_text($fresh,$milestone);
            $announcementId=bd_insert_announcement(
                $pdo,$institutionId,(int)$actor['id'],'sistem',
                $title,$message,(string)$milestone['onem'],'super_admin',
                [['kullanici_id'=>$ownerId,'kurum_rolu'=>'super_admin']],
                'ticari-mutabakat-aksiyon.php?vaka_id='.$caseId,
                null,'mutabakat_operasyon_eskalasyon',$escalationId
            );
            if($announcementId<=0) throw new RuntimeException('Mutabakat eskalasyon bildirimi oluşturulamadı.');

            $update=$pdo->prepare("UPDATE ticari_mutabakat_eskalasyonlari
                SET duyuru_id=? WHERE id=?");
            $update->execute([$announcementId,$escalationId]);
            $update->closeCursor();

            ma_history_add(
                $pdo,$caseId,(int)$actor['id'],
                'bildirim','eskalasyon_'.$code,
                'Sorumlu Süper Admin #'.$ownerId.' için '.(string)$milestone['etiket'].' operasyon eskalasyonu gönderildi.'
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

function me_summary(PDO $pdo): array {
    $out=[
        'toplam'=>0,'ilk_mudahale_2'=>0,'dongu_4'=>0,'dongu_8'=>0,'dongu_14'=>0,'dongu_30'=>0
    ];
    if(!me_tables_ready($pdo)) return $out;

    $stmt=$pdo->query("SELECT esik_kodu,COUNT(*) adet
        FROM ticari_mutabakat_eskalasyonlari
        GROUP BY esik_kodu");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    foreach($rows as $row){
        $code=(string)$row['esik_kodu'];
        $count=(int)$row['adet'];
        $out['toplam']+=$count;
        if(array_key_exists($code,$out)) $out[$code]+=$count;
    }
    return $out;
}

function me_history_rows(PDO $pdo,int $limit=250): array {
    if(!me_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        e.id,e.vaka_id,e.kurum_id,e.alici_kullanici_id,e.dongu_baslangic_tarihi,
        e.esik_kodu,e.acik_gun,e.duyuru_id,e.gonderen_kullanici_id,e.olusturulma_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(a.ad_soyad,'—') alici_adi,
        COALESCE(g.ad_soyad,'Sistem') gonderen_adi,
        v.sorun_turu
        FROM ticari_mutabakat_eskalasyonlari e
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=e.vaka_id
        LEFT JOIN kurumlar k ON k.id=e.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar a ON a.id=e.alici_kullanici_id
        LEFT JOIN kullanicilar g ON g.id=e.gonderen_kullanici_id
        ORDER BY e.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function me_case_history(PDO $pdo,int $caseId,int $limit=100): array {
    if(!me_tables_ready($pdo) || $caseId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        e.id,e.alici_kullanici_id,e.dongu_baslangic_tarihi,e.esik_kodu,e.acik_gun,
        e.duyuru_id,e.olusturulma_tarihi,
        COALESCE(a.ad_soyad,'—') alici_adi,
        COALESCE(g.ad_soyad,'Sistem') gonderen_adi
        FROM ticari_mutabakat_eskalasyonlari e
        LEFT JOIN kullanicilar a ON a.id=e.alici_kullanici_id
        LEFT JOIN kullanicilar g ON g.id=e.gonderen_kullanici_id
        WHERE e.vaka_id=?
        ORDER BY e.id DESC
        LIMIT {$limit}");
    $stmt->execute([$caseId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
