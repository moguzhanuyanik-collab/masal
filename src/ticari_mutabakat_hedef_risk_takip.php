<?php
declare(strict_types=1);

function mrt_tables_ready(PDO $pdo): bool {
    return function_exists('mrh_tables_ready')
        && function_exists('map_tables_ready')
        && function_exists('mi_target_risk_map')
        && mrh_tables_ready($pdo)
        && map_tables_ready($pdo);
}

function mrt_normalize_case_ids(array $caseIds): array {
    $ids=[];
    foreach($caseIds as $value){
        $id=(int)$value;
        if($id>0)$ids[$id]=$id;
    }
    $ids=array_values($ids);
    sort($ids,SORT_NUMERIC);
    if(!$ids) throw new RuntimeException('En az bir güncel okunmamış hedef-risk vakası seçilmelidir.');
    if(count($ids)>50) throw new RuntimeException('Tek takip planlama işleminde en fazla 50 vaka seçilebilir.');
    return $ids;
}

function mrt_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrt_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $days=mrh_window_days($filters['days']??30);
    $healthFilters=[
        'days'=>$days,
        'signal'=>(string)($filters['signal']??''),
        'read'=>'okunmadi',
        'state'=>'guncel_acik_okunmadi',
        'owner_id'=>(int)($filters['owner_id']??0),
    ];
    $healthRows=mrh_rows($pdo,$healthFilters,2000);
    if(!$healthRows) return [];

    $caseIds=[];
    foreach($healthRows as $row){
        $caseId=(int)($row['vaka_id']??0);
        if($caseId>0)$caseIds[$caseId]=$caseId;
    }
    if(!$caseIds) return [];

    $current=mi_target_risk_map($pdo,$actor,array_values($caseIds));
    $out=[];
    $seen=[];
    foreach($healthRows as $row){
        $caseId=(int)($row['vaka_id']??0);
        if($caseId<=0 || isset($seen[$caseId])) continue;
        if(empty($row['guncel_acik_vaka'])
            || !empty($row['okundu'])
            || empty($row['guncel_sorumlu_bildirimi'])){
            continue;
        }

        $ctx=$current[$caseId]??null;
        if(!is_array($ctx)
            || (string)($ctx['hedef_bildirim_durumu']??'')!=='okunmadi'
            || (int)($ctx['hedef_bildirim_id']??0)!==(int)$row['id']
            || (int)($ctx['sorumlu_kullanici_id']??0)!==(int)$row['alici_kullanici_id']){
            continue;
        }

        $row['hedef_risk_kodu']=(string)($ctx['hedef_risk_kodu']??'');
        $row['hedef_risk_etiketi']=(string)($ctx['hedef_risk_etiketi']??'');
        $row['hedef_sure_kullanim_orani']=$ctx['hedef_sure_kullanim_orani']??null;
        $row['beklenen_esik_kodu']=$ctx['beklenen_esik_kodu']??null;
        $seen[$caseId]=true;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}

function mrt_summary(PDO $pdo,array $actor,int $days=30): array {
    $out=['total'=>0,'outside'=>0,'target_75'=>0,'overdue_action'=>0,'no_action_date'=>0];
    foreach(mrt_rows($pdo,$actor,['days'=>$days],1000) as $row){
        $out['total']++;
        if((string)$row['esik_kodu']==='hedef_disinda')$out['outside']++;
        if((string)$row['esik_kodu']==='hedef_75')$out['target_75']++;
        $next=(string)($row['sonraki_aksiyon_tarihi']??'');
        if($next==='')$out['no_action_date']++;
        elseif($next<date('Y-m-d'))$out['overdue_action']++;
    }
    return $out;
}

function mrt_visible_case_ids(array $rows): array {
    $out=[];
    foreach($rows as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$out[$id]=$id;
    }
    return array_values($out);
}

function mrt_plan_selected(
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
    if(!mrt_tables_ready($pdo)){
        throw new RuntimeException('Hedef-risk takip planlama altyapısı henüz hazır değil.');
    }

    $ids=mrt_normalize_case_ids($caseIds);

    if(function_exists('ma_sync_cases')) ma_sync_cases($pdo,$actor);

    $rows=mrt_rows($pdo,$actor,$filters,1000);
    $allowed=array_fill_keys(mrt_visible_case_ids($rows),true);
    foreach($ids as $id){
        if(!isset($allowed[$id])){
            throw new RuntimeException('Seçilen vakalardan biri artık güncel açık ve okunmamış hedef-risk allowlistinde değil. Listeyi yenileyip tekrar dene.');
        }
    }

    $result=map_bulk_reschedule_preserve_owners(
        $pdo,$actor,$ids,$nextActionDate,$note
    );
    $result['selected']=count($ids);
    return $result;
}
