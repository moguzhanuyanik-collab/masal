<?php
declare(strict_types=1);

function mi_tables_ready(PDO $pdo): bool {
    return mhs_tables_ready($pdo);
}

function mi_scope_labels(): array {
    return ['mine'=>'Bana Atanan','unassigned'=>'Sahipsiz','team'=>'Tüm Ekip'];
}

function mi_window_labels(): array {
    return [
        'overdue'=>'Gecikmiş',
        'today'=>'Bugün',
        'next3'=>'Önümüzdeki 3 Gün',
        'next7'=>'Önümüzdeki 7 Gün',
        'no_date'=>'Aksiyon Tarihi Yok',
        'all'=>'Tüm Açık',
    ];
}

function mi_case_rows(PDO $pdo,array $actor,array $filters=[],int $limit=600): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    if(!mi_tables_ready($pdo)) return [];
    $limit=max(1,min(1500,$limit));

    $where=["v.durum IN ('acik','incelemede','beklemede')"];
    $params=[];

    $scope=(string)($filters['scope']??'mine');
    if(!array_key_exists($scope,mi_scope_labels())) $scope='mine';
    if($scope==='mine'){
        $where[]='v.sorumlu_kullanici_id=?';
        $params[]=(int)$actor['id'];
    }elseif($scope==='unassigned'){
        $where[]='(v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0)';
    }

    $window=(string)($filters['window']??'all');
    if(!array_key_exists($window,mi_window_labels())) $window='all';
    if($window==='overdue') $where[]='v.sonraki_aksiyon_tarihi<CURDATE()';
    elseif($window==='today') $where[]='v.sonraki_aksiyon_tarihi=CURDATE()';
    elseif($window==='next3') $where[]='v.sonraki_aksiyon_tarihi BETWEEN DATE_ADD(CURDATE(),INTERVAL 1 DAY) AND DATE_ADD(CURDATE(),INTERVAL 3 DAY)';
    elseif($window==='next7') $where[]='v.sonraki_aksiyon_tarihi BETWEEN DATE_ADD(CURDATE(),INTERVAL 1 DAY) AND DATE_ADD(CURDATE(),INTERVAL 7 DAY)';
    elseif($window==='no_date') $where[]='v.sonraki_aksiyon_tarihi IS NULL';

    $type=(string)($filters['sorun_turu']??'');
    if(in_array($type,['operasyon','butunluk'],true)){
        $where[]='v.sorun_turu=?';
        $params[]=$type;
    }

    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $like='%'.$query.'%';
        $where[]='(k.ad LIKE ? OR k.kod LIKE ? OR s.sozlesme_no LIKE ? OR v.son_aciklama LIKE ?)';
        array_push($params,$like,$like,$like,$like);
    }

    $cycle=mhs_cycle_expr('v');
    $ageExpr="GREATEST(0,DATEDIFF(CURDATE(),DATE({$cycle})))";
    $intervention=mhs_intervention_exists_expr('v');

    $stmt=$pdo->prepare("SELECT
        v.id,v.sozlesme_id,v.kurum_id,v.para_birimi,v.sorun_turu,v.durum,
        v.sorumlu_kullanici_id,v.sonraki_aksiyon_tarihi,v.son_aciklama,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(k.kod,'—') kurum_kodu,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        {$ageExpr} acik_gun,
        NOT {$intervention} ilk_mudahale_yok
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 0
               WHEN v.sonraki_aksiyon_tarihi=CURDATE() THEN 1
               WHEN v.sonraki_aksiyon_tarihi IS NULL THEN 3 ELSE 2 END,
          CASE v.sorun_turu WHEN 'butunluk' THEN 0 ELSE 1 END,
          v.sonraki_aksiyon_tarihi,
          {$ageExpr} DESC,
          v.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $bucket=mhs_age_bucket((int)$row['acik_gun']);
        $row['yas_etiketi']=$bucket['etiket'];
        $next=(string)($row['sonraki_aksiyon_tarihi']??'');
        $row['aksiyon_gecikti']=$next!=='' && $next<date('Y-m-d');
        $row['aksiyon_bugun']=$next!=='' && $next===date('Y-m-d');
        $row['aksiyon_tarihi_yok']=$next==='';
    }
    unset($row);
    return $rows;
}

function mi_summary(PDO $pdo,array $actor): array {
    $out=[
        'mine_open'=>0,'mine_overdue'=>0,'mine_today'=>0,'mine_next3'=>0,'mine_next7'=>0,
        'mine_no_date'=>0,'mine_waiting'=>0,'unassigned'=>0
    ];
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mi_tables_ready($pdo)) return $out;
    $userId=(int)$actor['id'];

    $stmt=$pdo->prepare("SELECT
        SUM(CASE WHEN v.sorumlu_kullanici_id=? THEN 1 ELSE 0 END) mine_open,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.sonraki_aksiyon_tarihi<CURDATE() THEN 1 ELSE 0 END) mine_overdue,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.sonraki_aksiyon_tarihi=CURDATE() THEN 1 ELSE 0 END) mine_today,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.sonraki_aksiyon_tarihi BETWEEN DATE_ADD(CURDATE(),INTERVAL 1 DAY) AND DATE_ADD(CURDATE(),INTERVAL 3 DAY) THEN 1 ELSE 0 END) mine_next3,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.sonraki_aksiyon_tarihi BETWEEN DATE_ADD(CURDATE(),INTERVAL 1 DAY) AND DATE_ADD(CURDATE(),INTERVAL 7 DAY) THEN 1 ELSE 0 END) mine_next7,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.sonraki_aksiyon_tarihi IS NULL THEN 1 ELSE 0 END) mine_no_date,
        SUM(CASE WHEN v.sorumlu_kullanici_id=? AND v.durum='beklemede' THEN 1 ELSE 0 END) mine_waiting,
        SUM(CASE WHEN v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0 THEN 1 ELSE 0 END) unassigned_count
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum IN ('acik','incelemede','beklemede')");
    $stmt->execute([$userId,$userId,$userId,$userId,$userId,$userId,$userId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return $out;

    foreach(array_keys($out) as $key){
        $source=$key==='unassigned'?'unassigned_count':$key;
        $out[$key]=(int)($row[$source]??0);
    }
    return $out;
}

function mi_team_workload(PDO $pdo,int $limit=100): array {
    if(!mi_tables_ready($pdo)) return [];
    $limit=max(1,min(300,$limit));
    $stmt=$pdo->query("SELECT
        COALESCE(v.sorumlu_kullanici_id,0) sorumlu_kullanici_id,
        COALESCE(u.ad_soyad,'Atanmamış') sorumlu_adi,
        COUNT(*) open_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 1 ELSE 0 END) overdue_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi=CURDATE() THEN 1 ELSE 0 END) today_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi BETWEEN DATE_ADD(CURDATE(),INTERVAL 1 DAY) AND DATE_ADD(CURDATE(),INTERVAL 7 DAY) THEN 1 ELSE 0 END) next7_count,
        SUM(CASE WHEN v.sonraki_aksiyon_tarihi IS NULL THEN 1 ELSE 0 END) no_date_count,
        SUM(CASE WHEN v.sorun_turu='butunluk' THEN 1 ELSE 0 END) integrity_count
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.durum IN ('acik','incelemede','beklemede')
        GROUP BY COALESCE(v.sorumlu_kullanici_id,0),COALESCE(u.ad_soyad,'Atanmamış')
        ORDER BY overdue_count DESC,today_count DESC,integrity_count DESC,open_count DESC,sorumlu_adi
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
