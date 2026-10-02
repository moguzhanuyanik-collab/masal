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

function mi_target_risk_labels(): array {
    return [
        ''=>'Tüm Hedef Riskleri',
        'hedef_disinda'=>'Hedef Dışında',
        'yuzde_75'=>'Süre %75+',
        'yuzde_50'=>'Süre %50–74',
        'politika_yok'=>'Politika Yok',
        'okunmamis'=>'Güncel Bildirim Okunmadı',
        'bildirim_bekleyen'=>'Güncel Bildirim Bekliyor',
    ];
}

function mi_target_risk_ready(PDO $pdo): bool {
    if(!function_exists('mhr_rows')) return false;
    foreach([
        'ticari_mutabakat_hedef_risk_bildirimleri',
        'kurum_duyuru_alicilari',
        'ticari_mutabakat_hedef_politikalari',
    ] as $table){
        if(!auth_runtime_table_exists($pdo,$table)) return false;
    }
    return true;
}

function mi_target_risk_map(PDO $pdo,array $actor,array $caseIds): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mi_target_risk_ready($pdo)) return [];
    $caseIds=array_values(array_unique(array_filter(array_map('intval',$caseIds),static fn(int $id):bool=>$id>0)));
    if(!$caseIds) return [];
    $wanted=array_fill_keys($caseIds,true);
    $map=[];

    foreach(mhr_rows($pdo,$actor,['scope'=>'team'],1500) as $risk){
        $caseId=(int)($risk['id']??0);
        if($caseId<=0 || !isset($wanted[$caseId])) continue;

        $riskCode=(string)($risk['hedef_risk_kodu']??'');
        $cycleStart=(string)($risk['dongu_baslangic_tarihi']??'');
        $expectedSignal=$riskCode==='hedef_disinda'
            ?'hedef_disinda'
            :($riskCode==='yuzde_75'?'hedef_75':null);

        $map[$caseId]=[
            'hedef_risk_kodu'=>$riskCode,
            'hedef_risk_etiketi'=>(string)($risk['hedef_risk_etiketi']??''),
            'hedef_sure_kullanim_orani'=>$risk['hedef_sure_kullanim_orani']??null,
            'hedef_politika_id'=>$risk['hedef_politika_id']??null,
            'dongu_baslangic_tarihi'=>$cycleStart,
            'dongu_anahtari'=>$cycleStart!==''?hash('sha256',$caseId.'|'.trim($cycleStart)):'',
            'sorumlu_kullanici_id'=>(int)($risk['sorumlu_kullanici_id']??0),
            'beklenen_esik_kodu'=>$expectedSignal,
            'hedef_bildirim_id'=>null,
            'hedef_duyuru_id'=>null,
            'hedef_bildirim_okundu_tarihi'=>null,
            'hedef_bildirim_durumu'=>$expectedSignal===null?'uygulanmaz':'bekliyor',
        ];
    }

    if(!$map) return [];

    $ids=array_keys($map);
    $marks=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT
        b.id,b.vaka_id,b.alici_kullanici_id,b.dongu_anahtari,b.esik_kodu,
        b.duyuru_id,b.olusturulma_tarihi,da.okundu_tarihi
        FROM ticari_mutabakat_hedef_risk_bildirimleri b
        LEFT JOIN kurum_duyuru_alicilari da
          ON da.duyuru_id=b.duyuru_id
         AND da.kullanici_id=b.alici_kullanici_id
        WHERE b.vaka_id IN ({$marks})
        ORDER BY b.id DESC");
    $stmt->execute($ids);
    $notifications=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

    foreach($notifications as $notification){
        $caseId=(int)$notification['vaka_id'];
        if(!isset($map[$caseId])) continue;
        $current=&$map[$caseId];
        if($current['hedef_bildirim_id']!==null){
            unset($current);
            continue;
        }
        if((int)$notification['alici_kullanici_id']!==(int)$current['sorumlu_kullanici_id']
            || (string)$notification['dongu_anahtari']!==(string)$current['dongu_anahtari']
            || (string)$notification['esik_kodu']!==(string)($current['beklenen_esik_kodu']??'')){
            unset($current);
            continue;
        }

        $readAt=trim((string)($notification['okundu_tarihi']??''));
        $current['hedef_bildirim_id']=(int)$notification['id'];
        $current['hedef_duyuru_id']=(int)($notification['duyuru_id']??0);
        $current['hedef_bildirim_okundu_tarihi']=$readAt!==''?$readAt:null;
        $current['hedef_bildirim_durumu']=$readAt!==''?'okundu':'okunmadi';
        unset($current);
    }

    return $map;
}

function mi_target_risk_case(PDO $pdo,array $actor,int $caseId): ?array {
    if($caseId<=0 || (string)(auth_effective_role($actor)??'')!=='super_admin') return null;
    $map=mi_target_risk_map($pdo,$actor,[$caseId]);
    $row=$map[$caseId]??null;
    return is_array($row)?$row:null;
}

function mi_send_target_risk_case(PDO $pdo,array $actor,int $caseId): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if($caseId<=0) throw new RuntimeException('Mutabakat vakası bulunamadı.');
    if(!function_exists('mrb_tables_ready') || !mrb_tables_ready($pdo) || !function_exists('mrb_sync_case')){
        throw new RuntimeException('Hedef-risk bildirim altyapısı henüz hazır değil.');
    }

    $context=mi_target_risk_case($pdo,$actor,$caseId);
    if(!$context){
        return ['status'=>'no_context','context'=>null,'result'=>null];
    }
    if((string)($context['hedef_bildirim_durumu']??'')!=='bekliyor'){
        return ['status'=>'not_pending','context'=>$context,'result'=>null];
    }

    $result=mrb_sync_case($pdo,$actor,$caseId);
    $status='skipped';
    if((int)($result['sent']??0)===1) $status='sent';
    elseif((int)($result['invalid_owner']??0)>0) $status='invalid_owner';
    elseif((int)($result['no_institution']??0)>0) $status='no_institution';
    elseif((int)($result['stale_source']??0)>0) $status='stale_source';
    elseif((int)($result['failed']??0)>0) $status='failed';
    elseif((int)($result['candidate_count']??0)===0) $status='no_longer_required';

    return ['status'=>$status,'context'=>$context,'result'=>$result];
}

function mi_pending_case_ids(array $rows): array {
    $out=[];
    foreach($rows as $row){
        $caseId=(int)($row['id']??0);
        if($caseId<=0 || empty($row['hedef_bildirim_bekliyor'])) continue;
        $out[$caseId]=$caseId;
    }
    return array_values($out);
}

function mi_send_target_risk_cases(
    PDO $pdo,
    array $actor,
    array $caseIds,
    array $allowedCaseIds,
    int $maxCases=50
): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }

    $maxCases=max(1,min(100,$maxCases));
    $normalized=[];
    foreach($caseIds as $value){
        $caseId=(int)$value;
        if($caseId<=0) continue;
        $normalized[$caseId]=$caseId;
    }
    $caseIds=array_values($normalized);
    if(!$caseIds) throw new RuntimeException('Toplu gönderim için en az bir vaka seç.');
    if(count($caseIds)>$maxCases){
        throw new RuntimeException('Tek toplu işlemde en fazla '.$maxCases.' vaka seçilebilir.');
    }

    $allowed=[];
    foreach($allowedCaseIds as $value){
        $caseId=(int)$value;
        if($caseId>0)$allowed[$caseId]=true;
    }

    $out=[
        'selected'=>count($caseIds),
        'eligible'=>0,
        'sent'=>0,
        'not_pending'=>0,
        'no_context'=>0,
        'invalid_owner'=>0,
        'no_institution'=>0,
        'stale_source'=>0,
        'no_longer_required'=>0,
        'skipped'=>0,
        'failed'=>0,
        'not_visible'=>0,
    ];

    foreach($caseIds as $caseId){
        if(!isset($allowed[$caseId])){
            $out['not_visible']++;
            continue;
        }
        $out['eligible']++;

        try{
            $result=mi_send_target_risk_case($pdo,$actor,$caseId);
            $status=(string)($result['status']??'failed');
        }catch(Throwable $e){
            $status='failed';
        }

        if(!array_key_exists($status,$out))$status='failed';
        $out[$status]++;
    }

    return $out;
}

function mi_risk_priority(array $row): int {
    $risk=(string)($row['hedef_risk_kodu']??'');
    $delivery=(string)($row['hedef_bildirim_durumu']??'');

    if($risk==='hedef_disinda' && $delivery==='okunmadi') return 0;
    if($risk==='hedef_disinda' && $delivery==='bekliyor') return 1;
    if($risk==='hedef_disinda') return 2;
    if($risk==='yuzde_75' && $delivery==='okunmadi') return 3;
    if($risk==='yuzde_75' && $delivery==='bekliyor') return 4;
    if($risk==='yuzde_75') return 5;
    if(!empty($row['aksiyon_gecikti'])) return 6;
    if(!empty($row['aksiyon_bugun'])) return 7;
    if($risk==='yuzde_50') return 8;
    if($risk==='politika_yok') return 9;
    if(empty($row['aksiyon_tarihi_yok'])) return 10;
    return 11;
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

    $ownerId=max(0,(int)($filters['owner_id']??0));
    if($scope==='team' && $ownerId>0){
        $where[]='v.sorumlu_kullanici_id=?';
        $params[]=$ownerId;
    }elseif($scope==='team' && (string)($filters['owner_id']??'')==='unassigned'){
        $where[]='(v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0)';
    }

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
        {$cycle} dongu_baslangic_tarihi,
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
        LIMIT 1500");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    $riskMap=mi_target_risk_map($pdo,$actor,array_column($rows,'id'));
    foreach($rows as &$row){
        $bucket=mhs_age_bucket((int)$row['acik_gun']);
        $row['yas_etiketi']=$bucket['etiket'];
        $next=(string)($row['sonraki_aksiyon_tarihi']??'');
        $row['aksiyon_gecikti']=$next!=='' && $next<date('Y-m-d');
        $row['aksiyon_bugun']=$next!=='' && $next===date('Y-m-d');
        $row['aksiyon_tarihi_yok']=$next==='';

        $risk=$riskMap[(int)$row['id']]??[];
        $row['hedef_risk_kodu']=(string)($risk['hedef_risk_kodu']??'');
        $row['hedef_risk_etiketi']=(string)($risk['hedef_risk_etiketi']??'');
        $row['hedef_sure_kullanim_orani']=$risk['hedef_sure_kullanim_orani']??null;
        $row['hedef_politika_id']=$risk['hedef_politika_id']??null;
        $row['hedef_bildirim_id']=$risk['hedef_bildirim_id']??null;
        $row['hedef_duyuru_id']=$risk['hedef_duyuru_id']??null;
        $row['hedef_bildirim_okundu_tarihi']=$risk['hedef_bildirim_okundu_tarihi']??null;
        $row['hedef_bildirim_durumu']=(string)($risk['hedef_bildirim_durumu']??'yok');
        $row['hedef_bildirim_okunmadi']=$row['hedef_bildirim_durumu']==='okunmadi';
        $row['hedef_bildirim_bekliyor']=$row['hedef_bildirim_durumu']==='bekliyor';
    }
    unset($row);

    $riskFilter=(string)($filters['risk']??'');
    if(!array_key_exists($riskFilter,mi_target_risk_labels())) $riskFilter='';
    if($riskFilter!==''){
        $rows=array_values(array_filter($rows,static function(array $row) use($riskFilter): bool {
            if($riskFilter==='okunmamis') return !empty($row['hedef_bildirim_okunmadi']);
            if($riskFilter==='bildirim_bekleyen') return !empty($row['hedef_bildirim_bekliyor']);
            return (string)($row['hedef_risk_kodu']??'')===$riskFilter;
        }));
    }

    usort($rows,static function(array $a,array $b): int {
        $pa=mi_risk_priority($a);
        $pb=mi_risk_priority($b);
        if($pa!==$pb) return $pa<=>$pb;

        $da=(string)($a['sonraki_aksiyon_tarihi']??'9999-12-31');
        $db=(string)($b['sonraki_aksiyon_tarihi']??'9999-12-31');
        if($da!==$db) return $da<=>$db;

        $aa=(int)($a['acik_gun']??0);
        $ab=(int)($b['acik_gun']??0);
        if($aa!==$ab) return $ab<=>$aa;
        return (int)$b['id']<=>(int)$a['id'];
    });

    return array_slice($rows,0,$limit);
}

function mi_summary(PDO $pdo,array $actor): array {
    $out=[
        'mine_open'=>0,'mine_overdue'=>0,'mine_today'=>0,'mine_next3'=>0,'mine_next7'=>0,
        'mine_no_date'=>0,'mine_waiting'=>0,'unassigned'=>0,
        'mine_target_outside'=>0,'mine_target_75'=>0,'mine_target_unread'=>0,'mine_target_pending'=>0
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
    if(is_array($row)){
        foreach(['mine_open','mine_overdue','mine_today','mine_next3','mine_next7','mine_no_date','mine_waiting'] as $key){
            $out[$key]=(int)($row[$key]??0);
        }
        $out['unassigned']=(int)($row['unassigned_count']??0);
    }

    if(mi_target_risk_ready($pdo)){
        foreach(mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'all'],1500) as $case){
            $risk=(string)($case['hedef_risk_kodu']??'');
            if($risk==='hedef_disinda')$out['mine_target_outside']++;
            if($risk==='yuzde_75')$out['mine_target_75']++;
            if(!empty($case['hedef_bildirim_okunmadi']))$out['mine_target_unread']++;
            if(!empty($case['hedef_bildirim_bekliyor']))$out['mine_target_pending']++;
        }
    }
    return $out;
}

function mi_team_workload(PDO $pdo,int $limit=100,?array $actor=null): array {
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
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $row['target_outside_count']=0;
        $row['target_unread_count']=0;
        $row['target_pending_count']=0;
    }
    unset($row);

    if($actor && (string)(auth_effective_role($actor)??'')==='super_admin' && mi_target_risk_ready($pdo)){
        $index=[];
        foreach($rows as $i=>$row)$index[(int)$row['sorumlu_kullanici_id']]=$i;
        foreach(mi_case_rows($pdo,$actor,['scope'=>'team','window'=>'all'],1500) as $case){
            $owner=(int)($case['sorumlu_kullanici_id']??0);
            if(!isset($index[$owner])) continue;
            $i=$index[$owner];
            if((string)($case['hedef_risk_kodu']??'')==='hedef_disinda')$rows[$i]['target_outside_count']++;
            if(!empty($case['hedef_bildirim_okunmadi']))$rows[$i]['target_unread_count']++;
            if(!empty($case['hedef_bildirim_bekliyor']))$rows[$i]['target_pending_count']++;
        }

        usort($rows,static function(array $a,array $b): int {
            return [
                (int)$b['target_outside_count'],(int)$b['target_unread_count'],
                (int)$b['overdue_count'],(int)$b['today_count'],(int)$b['open_count']
            ] <=> [
                (int)$a['target_outside_count'],(int)$a['target_unread_count'],
                (int)$a['overdue_count'],(int)$a['today_count'],(int)$a['open_count']
            ];
        });
    }
    return $rows;
}
