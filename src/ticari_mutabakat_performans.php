<?php
declare(strict_types=1);

function mp_tables_ready(PDO $pdo): bool {
    return mhs_tables_ready($pdo);
}

function mp_window_days(int|string|null $value): int {
    $days=(int)$value;
    return in_array($days,[7,30,90],true)?$days:30;
}

function mp_first_intervention_expr(string $alias='v'): string {
    $cycle=mhs_cycle_expr($alias);
    return "(SELECT MIN(gf.olusturulma_tarihi)
        FROM ticari_mutabakat_vaka_gecmisi gf
        WHERE gf.vaka_id={$alias}.id
          AND gf.olusturulma_tarihi>={$cycle}
          AND (gf.kod='takip_notu' OR gf.kod LIKE 'asama_%'))";
}

function mp_summary(PDO $pdo,int $days=30): array {
    $days=mp_window_days($days);
    $out=[
        'window_days'=>$days,
        'open'=>0,
        'open_age_8_plus'=>0,
        'open_overdue_action'=>0,
        'open_no_first_intervention'=>0,
        'closed'=>0,
        'avg_cycle_days'=>0.0,
        'max_cycle_days'=>0,
        'reopened_closed'=>0,
        'reopen_rate'=>0.0,
        'responded_closed'=>0,
        'avg_first_response_hours'=>0.0,
        'max_first_response_hours'=>0.0,
        'opened_cycles'=>0,
        'reminders'=>0,
        'escalations'=>0,
    ];
    if(!mp_tables_ready($pdo)) return $out;

    $health=mhs_summary($pdo);
    $out['open']=(int)($health['open']??0);
    $out['open_age_8_plus']=(int)($health['yas_8_plus']??0);
    $out['open_overdue_action']=(int)($health['aksiyon_gecikti']??0);
    $out['open_no_first_intervention']=(int)($health['ilk_mudahale_yok']??0);

    $cycle=mhs_cycle_expr('v');
    $first=mp_first_intervention_expr('v');

    $stmt=$pdo->query("SELECT
        COUNT(*) closed_count,
        COALESCE(AVG(GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},v.kapanma_tarihi))/1440),0) avg_cycle_days,
        COALESCE(MAX(GREATEST(0,TIMESTAMPDIFF(DAY,DATE({$cycle}),DATE(v.kapanma_tarihi)))),0) max_cycle_days,
        SUM(CASE WHEN EXISTS(
            SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gr
            WHERE gr.vaka_id=v.id
              AND gr.kod='vaka_yeniden_acildi'
              AND gr.olusturulma_tarihi>={$cycle}
        ) THEN 1 ELSE 0 END) reopened_closed,
        SUM(CASE WHEN {$first} IS NOT NULL THEN 1 ELSE 0 END) responded_closed,
        COALESCE(AVG(CASE WHEN {$first} IS NOT NULL
            THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},{$first}))/60
            ELSE NULL END),0) avg_first_response_hours,
        COALESCE(MAX(CASE WHEN {$first} IS NOT NULL
            THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},{$first}))/60
            ELSE NULL END),0) max_first_response_hours
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum='kapali'
          AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(is_array($row)){
        $out['closed']=(int)($row['closed_count']??0);
        $out['avg_cycle_days']=round((float)($row['avg_cycle_days']??0),1);
        $out['max_cycle_days']=(int)($row['max_cycle_days']??0);
        $out['reopened_closed']=(int)($row['reopened_closed']??0);
        $out['responded_closed']=(int)($row['responded_closed']??0);
        $out['avg_first_response_hours']=round((float)($row['avg_first_response_hours']??0),1);
        $out['max_first_response_hours']=round((float)($row['max_first_response_hours']??0),1);
        $out['reopen_rate']=$out['closed']>0
            ?round(($out['reopened_closed']/$out['closed'])*100,1)
            :0.0;
    }

    $stmt=$pdo->query("SELECT
        (SELECT COUNT(*) FROM ticari_mutabakat_vakalari vi
         WHERE vi.olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY))
        +
        (SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi vg
         WHERE vg.kod='vaka_yeniden_acildi'
           AND vg.olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY))
        opened_cycles");
    if($stmt){
        $out['opened_cycles']=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
    }

    if(auth_runtime_table_exists($pdo,'ticari_mutabakat_aksiyon_hatirlatmalari')){
        $stmt=$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari
            WHERE olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)");
        if($stmt){
            $out['reminders']=(int)($stmt->fetchColumn()?:0);
            $stmt->closeCursor();
        }
    }

    if(auth_runtime_table_exists($pdo,'ticari_mutabakat_eskalasyonlari')){
        $stmt=$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari
            WHERE olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)");
        if($stmt){
            $out['escalations']=(int)($stmt->fetchColumn()?:0);
            $stmt->closeCursor();
        }
    }

    return $out;
}

function mp_owner_rows(PDO $pdo,int $days=30,int $limit=100): array {
    if(!mp_tables_ready($pdo)) return [];
    $days=mp_window_days($days);
    $limit=max(1,min(500,$limit));

    $cycle=mhs_cycle_expr('v');
    $first=mp_first_intervention_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";

    $stmt=$pdo->query("SELECT
        COALESCE(v.sorumlu_kullanici_id,0) sorumlu_kullanici_id,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        SUM(CASE WHEN v.durum IN ('acik','incelemede','beklemede') THEN 1 ELSE 0 END) open_count,
        SUM(CASE WHEN v.durum IN ('acik','incelemede','beklemede')
                   AND v.sonraki_aksiyon_tarihi<CURDATE() THEN 1 ELSE 0 END) overdue_action,
        SUM(CASE WHEN v.durum IN ('acik','incelemede','beklemede')
                   AND {$ageExpr}>=8 THEN 1 ELSE 0 END) age_8_plus,
        SUM(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                 THEN 1 ELSE 0 END) closed_count,
        COALESCE(AVG(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                 THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},v.kapanma_tarihi))/1440
                 ELSE NULL END),0) avg_cycle_days,
        SUM(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                   AND EXISTS(
                       SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gr
                       WHERE gr.vaka_id=v.id
                         AND gr.kod='vaka_yeniden_acildi'
                         AND gr.olusturulma_tarihi>={$cycle}
                   )
                 THEN 1 ELSE 0 END) reopened_closed,
        SUM(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                   AND {$first} IS NOT NULL
                 THEN 1 ELSE 0 END) responded_closed,
        COALESCE(AVG(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                   AND {$first} IS NOT NULL
                 THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},{$first}))/60
                 ELSE NULL END),0) avg_first_response_hours
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.durum IN ('acik','incelemede','beklemede')
           OR (v.durum='kapali' AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY))
        GROUP BY COALESCE(v.sorumlu_kullanici_id,0),COALESCE(u.ad_soyad,'Atanmamış')
        ORDER BY
          overdue_action DESC,
          age_8_plus DESC,
          open_count DESC,
          closed_count DESC,
          sorumlu_adi
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];

    $reminders=[];
    if(auth_runtime_table_exists($pdo,'ticari_mutabakat_aksiyon_hatirlatmalari')){
        $stmt=$pdo->query("SELECT alici_kullanici_id,COUNT(*) adet
            FROM ticari_mutabakat_aksiyon_hatirlatmalari
            WHERE olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
            GROUP BY alici_kullanici_id");
        foreach(($stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[]) as $row){
            $reminders[(int)$row['alici_kullanici_id']]=(int)$row['adet'];
        }
        if($stmt)$stmt->closeCursor();
    }

    $escalations=[];
    if(auth_runtime_table_exists($pdo,'ticari_mutabakat_eskalasyonlari')){
        $stmt=$pdo->query("SELECT alici_kullanici_id,COUNT(*) adet
            FROM ticari_mutabakat_eskalasyonlari
            WHERE olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
            GROUP BY alici_kullanici_id");
        foreach(($stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[]) as $row){
            $escalations[(int)$row['alici_kullanici_id']]=(int)$row['adet'];
        }
        if($stmt)$stmt->closeCursor();
    }

    foreach($rows as &$row){
        $ownerId=(int)$row['sorumlu_kullanici_id'];
        $row['open_count']=(int)$row['open_count'];
        $row['overdue_action']=(int)$row['overdue_action'];
        $row['age_8_plus']=(int)$row['age_8_plus'];
        $row['closed_count']=(int)$row['closed_count'];
        $row['avg_cycle_days']=round((float)$row['avg_cycle_days'],1);
        $row['reopened_closed']=(int)$row['reopened_closed'];
        $row['responded_closed']=(int)$row['responded_closed'];
        $row['avg_first_response_hours']=round((float)$row['avg_first_response_hours'],1);
        $row['reminders']=$ownerId>0?(int)($reminders[$ownerId]??0):0;
        $row['escalations']=$ownerId>0?(int)($escalations[$ownerId]??0):0;
    }
    unset($row);
    return $rows;
}

function mp_issue_rows(PDO $pdo,int $days=30): array {
    if(!mp_tables_ready($pdo)) return [];
    $days=mp_window_days($days);
    $cycle=mhs_cycle_expr('v');
    $first=mp_first_intervention_expr('v');

    $stmt=$pdo->query("SELECT
        v.sorun_turu,
        SUM(CASE WHEN v.durum IN ('acik','incelemede','beklemede') THEN 1 ELSE 0 END) open_count,
        SUM(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                 THEN 1 ELSE 0 END) closed_count,
        COALESCE(AVG(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                 THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},v.kapanma_tarihi))/1440
                 ELSE NULL END),0) avg_cycle_days,
        COALESCE(AVG(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                   AND {$first} IS NOT NULL
                 THEN GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},{$first}))/60
                 ELSE NULL END),0) avg_first_response_hours,
        SUM(CASE WHEN v.durum='kapali'
                   AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
                   AND EXISTS(
                       SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gr
                       WHERE gr.vaka_id=v.id
                         AND gr.kod='vaka_yeniden_acildi'
                         AND gr.olusturulma_tarihi>={$cycle}
                   )
                 THEN 1 ELSE 0 END) reopened_closed
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum IN ('acik','incelemede','beklemede')
           OR (v.durum='kapali' AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY))
        GROUP BY v.sorun_turu
        ORDER BY FIELD(v.sorun_turu,'butunluk','operasyon'),v.sorun_turu");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $row['open_count']=(int)$row['open_count'];
        $row['closed_count']=(int)$row['closed_count'];
        $row['avg_cycle_days']=round((float)$row['avg_cycle_days'],1);
        $row['avg_first_response_hours']=round((float)$row['avg_first_response_hours'],1);
        $row['reopened_closed']=(int)$row['reopened_closed'];
    }
    unset($row);
    return $rows;
}

function mp_monthly_closed(PDO $pdo,int $months=6): array {
    if(!mp_tables_ready($pdo)) return [];
    $months=max(1,min(12,$months));
    $start=(new DateTimeImmutable('first day of this month'))->modify('-'.($months-1).' months')->format('Y-m-d');
    $cycle=mhs_cycle_expr('v');

    $stmt=$pdo->prepare("SELECT
        DATE_FORMAT(v.kapanma_tarihi,'%Y-%m') ay,
        v.sorun_turu,
        COUNT(*) closed_count,
        COALESCE(AVG(GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},v.kapanma_tarihi))/1440),0) avg_cycle_days
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum='kapali'
          AND v.kapanma_tarihi>=?
        GROUP BY DATE_FORMAT(v.kapanma_tarihi,'%Y-%m'),v.sorun_turu
        ORDER BY ay,FIELD(v.sorun_turu,'butunluk','operasyon'),v.sorun_turu");
    $stmt->execute([$start]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $row['closed_count']=(int)$row['closed_count'];
        $row['avg_cycle_days']=round((float)$row['avg_cycle_days'],1);
    }
    unset($row);
    return $rows;
}

function mp_recent_closed_rows(PDO $pdo,int $days=30,int $limit=40): array {
    if(!mp_tables_ready($pdo)) return [];
    $days=mp_window_days($days);
    $limit=max(1,min(200,$limit));
    $cycle=mhs_cycle_expr('v');
    $first=mp_first_intervention_expr('v');

    $stmt=$pdo->query("SELECT
        v.id vaka_id,v.kurum_id,v.sozlesme_id,v.sorun_turu,v.kapanma_kodu,
        v.sorumlu_kullanici_id,v.kapanma_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        {$cycle} dongu_baslangic_tarihi,
        {$first} ilk_mudahale_tarihi,
        ROUND(GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},v.kapanma_tarihi))/1440,1) cevrim_gun,
        CASE WHEN {$first} IS NOT NULL
             THEN ROUND(GREATEST(0,TIMESTAMPDIFF(MINUTE,{$cycle},{$first}))/60,1)
             ELSE NULL END ilk_mudahale_saat,
        CASE WHEN EXISTS(
            SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gr
            WHERE gr.vaka_id=v.id
              AND gr.kod='vaka_yeniden_acildi'
              AND gr.olusturulma_tarihi>={$cycle}
        ) THEN 1 ELSE 0 END yeniden_acildi
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.durum='kapali'
          AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
        ORDER BY v.kapanma_tarihi DESC,v.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $row['cevrim_gun']=round((float)$row['cevrim_gun'],1);
        $row['ilk_mudahale_saat']=$row['ilk_mudahale_saat']!==null
            ?round((float)$row['ilk_mudahale_saat'],1)
            :null;
        $row['yeniden_acildi']=(int)$row['yeniden_acildi']===1;
    }
    unset($row);
    return $rows;
}
