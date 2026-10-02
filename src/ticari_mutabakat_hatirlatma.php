<?php
declare(strict_types=1);

function mr_tables_ready(PDO $pdo): bool {
    return mi_tables_ready($pdo)
        && bd_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_aksiyon_hatirlatmalari');
}

function mr_milestone(?string $actionDate,?string $today=null): ?array {
    $actionDate=trim((string)$actionDate);
    if($actionDate==='') return null;
    $today=$today?:date('Y-m-d');

    $due=DateTimeImmutable::createFromFormat('!Y-m-d',$actionDate);
    $base=DateTimeImmutable::createFromFormat('!Y-m-d',$today);
    if(!$due || !$base) return null;

    $late=(int)$due->diff($base)->format('%r%a');
    if($late<0) return null;
    if($late===0){
        return ['kod'=>'bugun','etiket'=>'Bugün','onem'=>'onemli','gecikme_gunu'=>0];
    }
    if($late<3){
        return ['kod'=>'gecikme_1','etiket'=>'1+ gün gecikme','onem'=>'onemli','gecikme_gunu'=>$late];
    }
    if($late<7){
        return ['kod'=>'gecikme_3','etiket'=>'3+ gün gecikme','onem'=>'onemli','gecikme_gunu'=>$late];
    }
    if($late<14){
        return ['kod'=>'gecikme_7','etiket'=>'7+ gün gecikme','onem'=>'acil','gecikme_gunu'=>$late];
    }
    if($late<30){
        return ['kod'=>'gecikme_14','etiket'=>'14+ gün gecikme','onem'=>'acil','gecikme_gunu'=>$late];
    }
    return ['kod'=>'gecikme_30','etiket'=>'30+ gün gecikme','onem'=>'acil','gecikme_gunu'=>$late];
}

function mr_owner(PDO $pdo,int $userId): ?array {
    if($userId<=0) return null;
    $user=auth_fetch_user($pdo,$userId);
    if(!$user || !auth_user_has_role($user,'super_admin')) return null;
    return $user;
}

function mr_candidate_rows(PDO $pdo,int $limit=1000): array {
    if(!mr_tables_ready($pdo)) return [];
    $limit=max(1,min(2000,$limit));
    $stmt=$pdo->query("SELECT
        v.id vaka_id,v.kurum_id,v.sozlesme_id,v.sorun_turu,v.durum,
        v.sorumlu_kullanici_id,v.sonraki_aksiyon_tarihi,v.son_aciklama,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'—') sorumlu_adi
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.durum IN ('acik','incelemede','beklemede')
          AND v.sorumlu_kullanici_id IS NOT NULL
          AND v.sorumlu_kullanici_id>0
          AND v.sonraki_aksiyon_tarihi IS NOT NULL
          AND v.sonraki_aksiyon_tarihi<=CURDATE()
        ORDER BY
          v.sonraki_aksiyon_tarihi,
          CASE v.sorun_turu WHEN 'butunluk' THEN 0 ELSE 1 END,
          v.id
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $milestone=mr_milestone((string)$row['sonraki_aksiyon_tarihi']);
        $row['esik_kodu']=$milestone['kod']??null;
        $row['esik_etiketi']=$milestone['etiket']??null;
        $row['gecikme_gunu']=$milestone['gecikme_gunu']??null;
        $row['alici_gecerli']=mr_owner($pdo,(int)$row['sorumlu_kullanici_id'])!==null;
        $row['kurum_gecerli']=(int)$row['kurum_id']>0;
        $row['gonderildi']=false;
        if($row['esik_kodu']!==null && $row['alici_gecerli'] && $row['kurum_gecerli']){
            $stmt=$pdo->prepare("SELECT id FROM ticari_mutabakat_aksiyon_hatirlatmalari
                WHERE vaka_id=? AND aksiyon_tarihi=? AND esik_kodu=? AND alici_kullanici_id=?
                LIMIT 1");
            $stmt->execute([
                (int)$row['vaka_id'],(string)$row['sonraki_aksiyon_tarihi'],
                (string)$row['esik_kodu'],(int)$row['sorumlu_kullanici_id']
            ]);
            $row['gonderildi']=(bool)$stmt->fetchColumn();
            $stmt->closeCursor();
        }
    }
    unset($row);
    return $rows;
}

function mr_notification_text(array $case,array $milestone): array {
    $institution=trim((string)($case['kurum_adi']??'Kurum'));
    $contract=trim((string)($case['sozlesme_no']??('#'.(int)($case['sozlesme_id']??0))));
    $actionDate=(string)($case['sonraki_aksiyon_tarihi']??'');
    $issue=(string)($case['sorun_turu']??'')==='butunluk'?'Veri bütünlüğü':'Operasyon açığı';
    $late=(int)($milestone['gecikme_gunu']??0);

    if($late===0){
        $title='Mutabakat aksiyonu bugün';
        $message=$institution.' · '.$contract.' için mutabakat aksiyonu bugün planlı. Sorun türü: '.$issue.'.';
    }else{
        $title='Mutabakat aksiyonu gecikti';
        $message=$institution.' · '.$contract.' için '.$actionDate.' tarihli mutabakat aksiyonu '.$late
            .' gün gecikti. Sorun türü: '.$issue.'.';
    }

    $description=trim((string)($case['son_aciklama']??''));
    if($description!==''){
        if(mb_strlen($description)>240) $description=mb_substr($description,0,237).'...';
        $message.=' Son teşhis: '.$description;
    }
    return [$title,$message];
}

function mr_sync(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!mr_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat aksiyon hatırlatma migrationı henüz kurulmamış.');
    }

    $sent=0;
    $skipped=0;
    $invalidOwner=0;
    $noInstitution=0;
    $staleSource=0;
    $failed=0;

    foreach(mr_candidate_rows($pdo,1500) as $candidate){
        $caseId=(int)$candidate['vaka_id'];
        $ownerId=(int)$candidate['sorumlu_kullanici_id'];
        $institutionId=(int)$candidate['kurum_id'];

        if($institutionId<=0){
            $noInstitution++;
            continue;
        }
        if(!mr_owner($pdo,$ownerId)){
            $invalidOwner++;
            continue;
        }

        $started=false;
        try{
            if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

            $stmt=$pdo->prepare("SELECT *
                FROM ticari_mutabakat_vakalari
                WHERE id=?
                LIMIT 1 FOR UPDATE");
            $stmt->execute([$caseId]);
            $case=$stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            if(!is_array($case)
                || !in_array((string)$case['durum'],ma_open_stages(),true)
                || (int)$case['sorumlu_kullanici_id']!==$ownerId
                || (int)$case['kurum_id']!==$institutionId){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $actionDate=(string)($case['sonraki_aksiyon_tarihi']??'');
            $milestone=mr_milestone($actionDate);
            if(!$milestone){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $owner=mr_owner($pdo,$ownerId);
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

            $code=(string)$milestone['kod'];
            $find=$pdo->prepare("SELECT id
                FROM ticari_mutabakat_aksiyon_hatirlatmalari
                WHERE vaka_id=? AND aksiyon_tarihi=? AND esik_kodu=? AND alici_kullanici_id=?
                LIMIT 1 FOR UPDATE");
            $find->execute([$caseId,$actionDate,$code,$ownerId]);
            $existing=(int)($find->fetchColumn()?:0);
            $find->closeCursor();
            if($existing>0){
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }

            $insert=$pdo->prepare("INSERT IGNORE INTO ticari_mutabakat_aksiyon_hatirlatmalari
                (vaka_id,kurum_id,alici_kullanici_id,aksiyon_tarihi,esik_kodu,gonderen_kullanici_id)
                VALUES (?,?,?,?,?,?)");
            $insert->execute([$caseId,$institutionId,$ownerId,$actionDate,$code,(int)$actor['id']]);
            if($insert->rowCount()!==1){
                $insert->closeCursor();
                if($started)$pdo->commit();
                $skipped++;
                continue;
            }
            $reminderId=(int)$pdo->lastInsertId();
            $insert->closeCursor();

            $display=array_merge($candidate,$case);
            [$title,$message]=mr_notification_text($display,$milestone);
            $announcementId=bd_insert_announcement(
                $pdo,$institutionId,(int)$actor['id'],'sistem',
                $title,$message,(string)$milestone['onem'],'super_admin',
                [['kullanici_id'=>$ownerId,'kurum_rolu'=>'super_admin']],
                'ticari-mutabakat-aksiyon.php?vaka_id='.$caseId,
                null,'mutabakat_aksiyon_hatirlatma',$reminderId
            );
            if($announcementId<=0) throw new RuntimeException('Mutabakat aksiyon bildirimi oluşturulamadı.');

            $update=$pdo->prepare("UPDATE ticari_mutabakat_aksiyon_hatirlatmalari
                SET duyuru_id=? WHERE id=?");
            $update->execute([$announcementId,$reminderId]);
            $update->closeCursor();

            ma_history_add(
                $pdo,$caseId,(int)$actor['id'],
                'bildirim','hatirlatma_'.$code,
                'Sorumlu Süper Admin #'.$ownerId.' için aksiyon hatırlatması gönderildi.'
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

function mr_summary(PDO $pdo): array {
    $out=[
        'toplam'=>0,'bugun'=>0,'gecikme_1'=>0,'gecikme_3'=>0,
        'gecikme_7'=>0,'gecikme_14'=>0,'gecikme_30'=>0,
    ];
    if(!mr_tables_ready($pdo)) return $out;

    $stmt=$pdo->query("SELECT esik_kodu,COUNT(*) adet
        FROM ticari_mutabakat_aksiyon_hatirlatmalari
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

function mr_history_rows(PDO $pdo,int $limit=250): array {
    if(!mr_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        h.id,h.vaka_id,h.kurum_id,h.alici_kullanici_id,h.aksiyon_tarihi,h.esik_kodu,
        h.duyuru_id,h.gonderen_kullanici_id,h.olusturulma_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(a.ad_soyad,'—') alici_adi,
        COALESCE(g.ad_soyad,'Sistem') gonderen_adi,
        v.sorun_turu
        FROM ticari_mutabakat_aksiyon_hatirlatmalari h
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=h.vaka_id
        LEFT JOIN kurumlar k ON k.id=h.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar a ON a.id=h.alici_kullanici_id
        LEFT JOIN kullanicilar g ON g.id=h.gonderen_kullanici_id
        ORDER BY h.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mr_case_history(PDO $pdo,int $caseId,int $limit=100): array {
    if(!mr_tables_ready($pdo) || $caseId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        h.id,h.alici_kullanici_id,h.aksiyon_tarihi,h.esik_kodu,h.duyuru_id,h.olusturulma_tarihi,
        COALESCE(a.ad_soyad,'—') alici_adi,
        COALESCE(g.ad_soyad,'Sistem') gonderen_adi
        FROM ticari_mutabakat_aksiyon_hatirlatmalari h
        LEFT JOIN kullanicilar a ON a.id=h.alici_kullanici_id
        LEFT JOIN kullanicilar g ON g.id=h.gonderen_kullanici_id
        WHERE h.vaka_id=?
        ORDER BY h.id DESC
        LIMIT {$limit}");
    $stmt->execute([$caseId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
