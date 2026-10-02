<?php
declare(strict_types=1);

function mrtm_tables_ready(PDO $pdo): bool {
    return function_exists('mrts_tables_ready')
        && function_exists('mrt_rows')
        && function_exists('map_bulk_reschedule_preserve_owners')
        && mrts_tables_ready($pdo)
        && mrt_tables_ready($pdo);
}

function mrtm_allowed_states(): array {
    return ['aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok'];
}

function mrtm_state_labels(): array {
    $all=mrts_state_labels();
    $out=[];
    foreach(mrtm_allowed_states() as $state)$out[$state]=$all[$state]??$state;
    return $out;
}

function mrtm_normalize_case_ids(array $caseIds): array {
    $ids=[];
    foreach($caseIds as $value){
        $id=(int)$value;
        if($id>0)$ids[$id]=$id;
    }
    $ids=array_values($ids);
    sort($ids,SORT_NUMERIC);
    if(!$ids) throw new RuntimeException('En az bir müdahale gerektiren takip planı seçilmelidir.');
    if(count($ids)>50) throw new RuntimeException('Tek sağlık müdahalesinde en fazla 50 vaka seçilebilir.');
    return $ids;
}

function mrtm_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrtm_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $days=mrh_window_days($filters['days']??30);
    $state=trim((string)($filters['state']??''));

    $healthFilters=[
        'days'=>$days,
        'owner_id'=>(int)($filters['owner_id']??0),
        'signal'=>(string)($filters['signal']??''),
        'q'=>(string)($filters['q']??''),
    ];
    if(in_array($state,mrtm_allowed_states(),true))$healthFilters['state']=$state;

    $rows=mrts_rows($pdo,$actor,$healthFilters,1200);
    $out=[];
    foreach($rows as $row){
        if(!in_array((string)($row['takip_durumu']??''),mrtm_allowed_states(),true)) continue;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}

function mrtm_visible_case_ids(array $rows): array {
    $out=[];
    foreach($rows as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$out[$id]=$id;
    }
    return array_values($out);
}

function mrtm_summary(PDO $pdo,array $actor,int $days=30): array {
    $out=['total'=>0,'overdue'=>0,'today'=>0,'no_date'=>0];
    foreach(mrtm_rows($pdo,$actor,['days'=>$days],1000) as $row){
        $out['total']++;
        $state=(string)$row['takip_durumu'];
        if($state==='aksiyon_gecikmis')$out['overdue']++;
        if($state==='aksiyon_bugun')$out['today']++;
        if($state==='aksiyon_tarihi_yok')$out['no_date']++;
    }
    return $out;
}

function mrtm_reschedule_selected(
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
    if(!mrtm_tables_ready($pdo)){
        throw new RuntimeException('Hedef-risk takip sağlığı müdahale altyapısı henüz hazır değil.');
    }

    $ids=mrtm_normalize_case_ids($caseIds);

    if(function_exists('ma_sync_cases')) ma_sync_cases($pdo,$actor);

    $healthRows=mrtm_rows($pdo,$actor,$filters,1000);
    $healthAllowed=array_fill_keys(mrtm_visible_case_ids($healthRows),true);

    $days=mrh_window_days($filters['days']??30);
    $currentRows=mrt_rows($pdo,$actor,['days'=>$days],1500);
    $currentAllowed=array_fill_keys(mrtm_visible_case_ids($currentRows),true);

    foreach($ids as $id){
        if(!isset($healthAllowed[$id])){
            throw new RuntimeException('Seçilen vakalardan biri artık gecikmiş, bugün veya tarihsiz current-context takip müdahale allowlistinde değil.');
        }
        if(!isset($currentAllowed[$id])){
            throw new RuntimeException('Seçilen vakalardan biri artık exact current owner/döngü/sinyal/bildirim okunmamış allowlistinde değil.');
        }
    }

    $prefixedNote='Takip sağlığı müdahalesi';
    $note=trim($note);
    if($note!=='')$prefixedNote.=': '.$note;

    $result=map_bulk_reschedule_preserve_owners(
        $pdo,$actor,$ids,$nextActionDate,$prefixedNote
    );
    $result['selected']=count($ids);
    return $result;
}
