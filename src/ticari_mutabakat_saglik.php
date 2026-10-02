<?php
declare(strict_types=1);

function mhs_tables_ready(PDO $pdo): bool {
    return ma_tables_ready($pdo);
}

function mhs_age_bucket(int $days): array {
    $days=max(0,$days);
    if($days<=1) return ['kod'=>'0_1','etiket'=>'0–1 gün'];
    if($days<=3) return ['kod'=>'2_3','etiket'=>'2–3 gün'];
    if($days<=7) return ['kod'=>'4_7','etiket'=>'4–7 gün'];
    return ['kod'=>'8_plus','etiket'=>'8+ gün'];
}

function mhs_cycle_expr(string $alias='v'): string {
    return "COALESCE(
        (SELECT MAX(gx.olusturulma_tarihi)
         FROM ticari_mutabakat_vaka_gecmisi gx
         WHERE gx.vaka_id={$alias}.id AND gx.kod='vaka_yeniden_acildi'),
        {$alias}.olusturulma_tarihi
    )";
}

function mhs_intervention_exists_expr(string $alias='v'): string {
    $cycle=mhs_cycle_expr($alias);
    return "EXISTS(
        SELECT 1
        FROM ticari_mutabakat_vaka_gecmisi gi
        WHERE gi.vaka_id={$alias}.id
          AND gi.olusturulma_tarihi>={$cycle}
          AND (gi.kod='takip_notu' OR gi.kod LIKE 'asama_%')
    )";
}

function mhs_case_rows(PDO $pdo,array $filters=[],int $limit=700): array {
    if(!mhs_tables_ready($pdo)) return [];
    $limit=max(1,min(1500,$limit));

    $where=["v.durum IN ('acik','incelemede','beklemede')"];
    $params=[];

    $type=trim((string)($filters['sorun_turu']??''));
    if(in_array($type,['operasyon','butunluk'],true)){
        $where[]='v.sorun_turu=?';
        $params[]=$type;
    }

    $age=trim((string)($filters['yas']??''));
    $cycle=mhs_cycle_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";
    if($age==='0_1') $where[]="{$ageExpr} BETWEEN 0 AND 1";
    elseif($age==='2_3') $where[]="{$ageExpr} BETWEEN 2 AND 3";
    elseif($age==='4_7') $where[]="{$ageExpr} BETWEEN 4 AND 7";
    elseif($age==='8_plus') $where[]="{$ageExpr}>=8";

    $health=trim((string)($filters['saglik']??''));
    if($health==='aksiyon_gecikti'){
        $where[]='v.sonraki_aksiyon_tarihi<CURDATE()';
    }elseif($health==='aksiyon_bugun'){
        $where[]='v.sonraki_aksiyon_tarihi=CURDATE()';
    }elseif($health==='sahipsiz'){
        $where[]='(v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0)';
    }elseif($health==='aksiyon_tarihi_yok'){
        $where[]='v.sonraki_aksiyon_tarihi IS NULL';
    }elseif($health==='ilk_mudahale_yok'){
        $where[]='NOT '.mhs_intervention_exists_expr('v');
    }elseif($health==='beklemede'){
        $where[]="v.durum='beklemede'";
    }

    $ownerId=max(0,(int)($filters['sorumlu_kullanici_id']??0));
    if($ownerId>0){
        $where[]='v.sorumlu_kullanici_id=?';
        $params[]=$ownerId;
    }elseif((string)($filters['sorumlu_kullanici_id']??'')==='unassigned'){
        $where[]='(v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0)';
    }

    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $like='%'.$query.'%';
        $where[]='(k.ad LIKE ? OR k.kod LIKE ? OR s.sozlesme_no LIKE ? OR v.son_aciklama LIKE ?)';
        array_push($params,$like,$like,$like,$like);
    }

    $stmt=$pdo->prepare("SELECT
        v.id,v.anahtar,v.kaynak_turu,v.kaynak_kodu,v.kaynak_id,v.kaynak_alt_id,
        v.sozlesme_id,v.kurum_id,v.para_birimi,v.sorun_turu,v.durum,
        v.sorumlu_kullanici_id,v.sonraki_aksiyon_tarihi,v.son_tespit_tarihi,
        v.son_aciklama,v.olusturulma_tarihi,v.guncellenme_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(k.kod,'—') kurum_kodu,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        {$cycle} dongu_baslangic_tarihi,
        {$ageExpr} acik_gun,
        (SELECT MIN(gi2.olusturulma_tarihi)
         FROM ticari_mutabakat_vaka_gecmisi gi2
         WHERE gi2.vaka_id=v.id
           AND gi2.olusturulma_tarihi>={$cycle}
           AND (gi2.kod='takip_notu' OR gi2.kod LIKE 'asama_%')
        ) ilk_mudahale_tarihi,
        (SELECT MAX(gi3.olusturulma_tarihi)
         FROM ticari_mutabakat_vaka_gecmisi gi3
         WHERE gi3.vaka_id=v.id
           AND gi3.olusturulma_tarihi>={$cycle}
           AND (gi3.kod='takip_notu' OR gi3.kod LIKE 'asama_%')
        ) son_operasyon_tarihi,
        (SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi gh WHERE gh.vaka_id=v.id) gecmis_sayisi
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 0
               WHEN v.sonraki_aksiyon_tarihi=CURDATE() THEN 1
               ELSE 2 END,
          CASE WHEN v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0 THEN 0 ELSE 1 END,
          CASE v.sorun_turu WHEN 'butunluk' THEN 0 ELSE 1 END,
          {$ageExpr} DESC,
          v.guncellenme_tarihi DESC,v.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $bucket=mhs_age_bucket((int)$row['acik_gun']);
        $row['yas_kodu']=$bucket['kod'];
        $row['yas_etiketi']=$bucket['etiket'];
        $next=(string)($row['sonraki_aksiyon_tarihi']??'');
        $row['aksiyon_gecikti']=$next!=='' && $next<date('Y-m-d');
        $row['aksiyon_bugun']=$next!=='' && $next===date('Y-m-d');
        $row['sahipsiz']=(int)($row['sorumlu_kullanici_id']??0)<=0;
        $row['aksiyon_tarihi_yok']=$next==='';
        $row['ilk_mudahale_yok']=empty($row['ilk_mudahale_tarihi']);
    }
    unset($row);
    return $rows;
}

function mhs_summary(PDO $pdo): array {
    $out=[
        'open'=>0,'operasyon'=>0,'butunluk'=>0,
        'yas_0_1'=>0,'yas_2_3'=>0,'yas_4_7'=>0,'yas_8_plus'=>0,
        'aksiyon_gecikti'=>0,'aksiyon_bugun'=>0,'sahipsiz'=>0,
        'aksiyon_tarihi_yok'=>0,'ilk_mudahale_yok'=>0,'beklemede'=>0
    ];
    if(!mhs_tables_ready($pdo)) return $out;

    $cycle=mhs_cycle_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";
    $intervention=mhs_intervention_exists_expr('v');

    $stmt=$pdo->query("SELECT
        COUNT(*) open_count,
        SUM(CASE WHEN v.sorun_turu='operasyon' THEN 1 ELSE 0 END) operasyon_count,
        SUM(CASE WHEN v.sorun_turu='butunluk' THEN 1 ELSE 0 END) butunluk_count,
        SUM(CASE WHEN {$ageExpr} BETWEEN 0 AND 1 THEN 1 ELSE 0 END) age_0_1,
        SUM(CASE WHEN {$ageExpr} BETWEEN 2 AND 3 THEN 1 ELSE 0 END) age_2_3,
        SUM(CASE WHEN {$ageExpr} BETWEEN 4 AND 7 THEN 1 ELSE 0 END) age_4_7,
        SUM(CASE WHEN {$ageExpr}>=8 THEN 1 ELSE 0 END) age_8_plus,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 1 ELSE 0 END) overdue_action,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi=CURDATE() THEN 1 ELSE 0 END) action_today,
        SUM(CASE WHEN v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0 THEN 1 ELSE 0 END) unassigned_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi IS NULL THEN 1 ELSE 0 END) no_action_date,
        SUM(CASE WHEN NOT {$intervention} THEN 1 ELSE 0 END) no_intervention,
        SUM(CASE WHEN v.durum='beklemede' THEN 1 ELSE 0 END) waiting_count
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum IN ('acik','incelemede','beklemede')");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(!is_array($row)) return $out;

    $out['open']=(int)($row['open_count']??0);
    $out['operasyon']=(int)($row['operasyon_count']??0);
    $out['butunluk']=(int)($row['butunluk_count']??0);
    $out['yas_0_1']=(int)($row['age_0_1']??0);
    $out['yas_2_3']=(int)($row['age_2_3']??0);
    $out['yas_4_7']=(int)($row['age_4_7']??0);
    $out['yas_8_plus']=(int)($row['age_8_plus']??0);
    $out['aksiyon_gecikti']=(int)($row['overdue_action']??0);
    $out['aksiyon_bugun']=(int)($row['action_today']??0);
    $out['sahipsiz']=(int)($row['unassigned_count']??0);
    $out['aksiyon_tarihi_yok']=(int)($row['no_action_date']??0);
    $out['ilk_mudahale_yok']=(int)($row['no_intervention']??0);
    $out['beklemede']=(int)($row['waiting_count']??0);
    return $out;
}

function mhs_owner_workload(PDO $pdo,int $limit=100): array {
    if(!mhs_tables_ready($pdo)) return [];
    $limit=max(1,min(500,$limit));
    $cycle=mhs_cycle_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";

    $stmt=$pdo->query("SELECT
        COALESCE(v.sorumlu_kullanici_id,0) sorumlu_kullanici_id,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        COUNT(*) open_count,
        SUM(CASE WHEN v.sorun_turu='butunluk' THEN 1 ELSE 0 END) butunluk_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 1 ELSE 0 END) overdue_action,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi IS NULL THEN 1 ELSE 0 END) no_action_date,
        SUM(CASE WHEN {$ageExpr}>=8 THEN 1 ELSE 0 END) age_8_plus,
        SUM(CASE WHEN v.durum='beklemede' THEN 1 ELSE 0 END) waiting_count
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.durum IN ('acik','incelemede','beklemede')
        GROUP BY COALESCE(v.sorumlu_kullanici_id,0),COALESCE(u.ad_soyad,'Atanmamış')
        ORDER BY
          overdue_action DESC,
          butunluk_count DESC,
          age_8_plus DESC,
          open_count DESC,
          sorumlu_adi
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mhs_recent_closed_metrics(PDO $pdo,int $days=30): array {
    $out=['closed'=>0,'avg_cycle_days'=>0.0,'max_cycle_days'=>0,'reopened_closed'=>0];
    if(!mhs_tables_ready($pdo)) return $out;
    $days=max(1,min(365,$days));
    $cycle=mhs_cycle_expr('v');

    $stmt=$pdo->query("SELECT
        COUNT(*) closed_count,
        COALESCE(AVG(GREATEST(0,TIMESTAMPDIFF(HOUR,{$cycle},v.kapanma_tarihi))/24),0) avg_cycle_days,
        COALESCE(MAX(GREATEST(0,TIMESTAMPDIFF(DAY,DATE({$cycle}),DATE(v.kapanma_tarihi)))),0) max_cycle_days,
        SUM(CASE WHEN EXISTS(
            SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gr
            WHERE gr.vaka_id=v.id AND gr.kod='vaka_yeniden_acildi'
        ) THEN 1 ELSE 0 END) reopened_closed
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum='kapali'
          AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(!is_array($row)) return $out;
    $out['closed']=(int)($row['closed_count']??0);
    $out['avg_cycle_days']=round((float)($row['avg_cycle_days']??0),1);
    $out['max_cycle_days']=(int)($row['max_cycle_days']??0);
    $out['reopened_closed']=(int)($row['reopened_closed']??0);
    return $out;
}
