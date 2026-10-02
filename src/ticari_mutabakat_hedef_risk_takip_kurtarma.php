<?php
declare(strict_types=1);

function mrtr_tables_ready(PDO $pdo): bool {
    return function_exists('mrts_tables_ready')
        && function_exists('mrt_rows')
        && function_exists('map_bulk_reschedule_preserve_owners')
        && mrts_tables_ready($pdo)
        && mrt_tables_ready($pdo);
}

function mrtr_allowed_states(): array {
    return [
        'owner_degisti',
        'dongu_degisti',
        'sinyal_degisti',
        'bildirim_degisti',
        'plan_bildirimi_yok',
    ];
}

function mrtr_state_labels(): array {
    $all=mrts_state_labels();
    $out=[];
    foreach(mrtr_allowed_states() as $state)$out[$state]=$all[$state]??$state;
    return $out;
}

function mrtr_normalize_case_ids(array $caseIds): array {
    $ids=[];
    foreach($caseIds as $value){
        $id=(int)$value;
        if($id>0)$ids[$id]=$id;
    }
    $ids=array_values($ids);
    sort($ids,SORT_NUMERIC);
    if(!$ids) throw new RuntimeException('En az bir stale takip planı kurtarma adayı seçilmelidir.');
    if(count($ids)>50) throw new RuntimeException('Tek stale plan kurtarma işleminde en fazla 50 vaka seçilebilir.');
    return $ids;
}

function mrtr_current_map(PDO $pdo,array $actor,array $filters=[]): array {
    $days=mrh_window_days($filters['days']??30);
    $currentFilters=[
        'days'=>$days,
        'signal'=>(string)($filters['signal']??''),
        'owner_id'=>(int)($filters['owner_id']??0),
    ];
    $rows=mrt_rows($pdo,$actor,$currentFilters,2000);
    $out=[];
    foreach($rows as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$out[$id]=$row;
    }
    return $out;
}

function mrtr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrtr_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $days=mrh_window_days($filters['days']??30);
    $state=trim((string)($filters['state']??''));
    $ownerId=max(0,(int)($filters['owner_id']??0));
    $query=mb_strtolower(trim((string)($filters['q']??'')),'UTF-8');

    $healthFilters=[
        'days'=>$days,
        'owner_id'=>$ownerId,
    ];
    if(in_array($state,mrtr_allowed_states(),true))$healthFilters['state']=$state;

    $healthRows=mrts_rows($pdo,$actor,$healthFilters,2000);
    if(!$healthRows) return [];

    $current=mrtr_current_map($pdo,$actor,$filters);
    if(!$current) return [];

    $out=[];
    $seen=[];
    foreach($healthRows as $row){
        $caseId=(int)($row['vaka_id']??0);
        $healthState=(string)($row['takip_durumu']??'');
        if($caseId<=0 || isset($seen[$caseId]) || !in_array($healthState,mrtr_allowed_states(),true)) continue;

        $currentRow=$current[$caseId]??null;
        if(!is_array($currentRow)) continue;

        $row['kurtarma_esik_kodu']=(string)($currentRow['esik_kodu']??$currentRow['beklenen_esik_kodu']??'');
        $row['kurtarma_hedef_risk_kodu']=(string)($currentRow['hedef_risk_kodu']??'');
        $row['kurtarma_hedef_risk_etiketi']=(string)($currentRow['hedef_risk_etiketi']??'');
        $row['kurtarma_alici_kullanici_id']=(int)($currentRow['alici_kullanici_id']??$row['sorumlu_kullanici_id']??0);
        $row['kurtarma_alici_adi']=(string)($currentRow['alici_adi']??$row['guncel_sorumlu_adi']??'—');
        $row['kurtarma_bildirim_id']=(int)($currentRow['id']??$currentRow['hedef_bildirim_id']??0);
        $row['kurtarma_bildirim_tarihi']=(string)($currentRow['olusturulma_tarihi']??'');
        $row['kurtarma_bildirim_durumu']='okunmadi';

        if($query!==''){
            $haystack=mb_strtolower(implode(' ',[
                (string)($row['kurum_adi']??''),
                (string)($row['sozlesme_no']??''),
                (string)($row['guncel_sorumlu_adi']??''),
                (string)($row['plan_alici_adi']??''),
                (string)($row['kurtarma_alici_adi']??''),
                (string)($row['plan_notu']??''),
                (string)($row['takip_durumu_etiketi']??''),
                (string)($row['kurtarma_hedef_risk_etiketi']??''),
            ]),'UTF-8');
            if(!str_contains($haystack,$query)) continue;
        }

        $seen[$caseId]=true;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }

    return $out;
}

function mrtr_visible_case_ids(array $rows): array {
    $out=[];
    foreach($rows as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$out[$id]=$id;
    }
    return array_values($out);
}

function mrtr_summary(PDO $pdo,array $actor,int $days=30): array {
    $out=[
        'total'=>0,
        'owner_changed'=>0,
        'cycle_changed'=>0,
        'signal_changed'=>0,
        'notice_changed'=>0,
        'plan_notice_missing'=>0,
    ];
    foreach(mrtr_rows($pdo,$actor,['days'=>$days],1500) as $row){
        $out['total']++;
        $state=(string)($row['takip_durumu']??'');
        if($state==='owner_degisti')$out['owner_changed']++;
        if($state==='dongu_degisti')$out['cycle_changed']++;
        if($state==='sinyal_degisti')$out['signal_changed']++;
        if($state==='bildirim_degisti')$out['notice_changed']++;
        if($state==='plan_bildirimi_yok')$out['plan_notice_missing']++;
    }
    return $out;
}

function mrtr_recover_selected(
    PDO $pdo,
    array $actor,
    array $caseIds,
    string $nextActionDate,
    string $note,
    array $filters=[]
): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!mrtr_tables_ready($pdo)){
        throw new RuntimeException('Stale hedef-risk takip planı kurtarma altyapısı henüz hazır değil.');
    }

    $ids=mrtr_normalize_case_ids($caseIds);

    if(function_exists('ma_sync_cases')) ma_sync_cases($pdo,$actor);

    $staleRows=mrtr_rows($pdo,$actor,$filters,1500);
    $staleAllowed=array_fill_keys(mrtr_visible_case_ids($staleRows),true);

    $days=mrh_window_days($filters['days']??30);
    $currentRows=mrt_rows($pdo,$actor,[
        'days'=>$days,
        'signal'=>(string)($filters['signal']??''),
        'owner_id'=>(int)($filters['owner_id']??0),
    ],2000);
    $currentAllowed=array_fill_keys(mrt_visible_case_ids($currentRows),true);

    foreach($ids as $id){
        if(!isset($staleAllowed[$id])){
            throw new RuntimeException('Seçilen vakalardan biri artık stale plan kurtarma allowlistinde değil.');
        }
        if(!isset($currentAllowed[$id])){
            throw new RuntimeException('Seçilen vakalardan biri artık exact current owner/döngü/sinyal/bildirim okunmamış allowlistinde değil.');
        }
    }

    $result=map_bulk_reschedule_preserve_owners(
        $pdo,$actor,$ids,$nextActionDate,trim($note)
    );
    $result['selected']=count($ids);
    $result['recovered']=count($ids);
    return $result;
}
