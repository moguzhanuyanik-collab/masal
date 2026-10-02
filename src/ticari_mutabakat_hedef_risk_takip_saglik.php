<?php
declare(strict_types=1);

function mrts_tables_ready(PDO $pdo): bool {
    return function_exists('mrt_tables_ready')
        && function_exists('mi_target_risk_map')
        && function_exists('mrh_cycle_key')
        && mrt_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_hedef_risk_bildirimleri')
        && auth_runtime_table_exists($pdo,'kurum_duyuru_alicilari');
}

function mrts_state_labels(): array {
    return [
        'owner_degisti'=>'Owner Değişti',
        'dongu_degisti'=>'Reopen Döngüsü Değişti',
        'sinyal_degisti'=>'Hedef-Risk Sinyali Değişti',
        'bildirim_degisti'=>'Güncel Bildirim Değişti',
        'aksiyon_gecikmis'=>'Aksiyon Gecikmiş',
        'aksiyon_bugun'=>'Aksiyon Bugün',
        'aksiyon_tarihi_yok'=>'Aksiyon Tarihi Yok',
        'planli_okunmadi'=>'Planlı · Okunmadı',
        'okundu'=>'Bildirim Okundu',
        'risk_cozuldu'=>'Hedef-Risk Çözüldü',
        'vaka_kapandi'=>'Vaka Kapandı',
        'plan_bildirimi_yok'=>'Plan Bildirimi Bulunamadı',
    ];
}

function mrts_state_priority(string $state): int {
    return match($state){
        'owner_degisti'=>0,
        'dongu_degisti'=>1,
        'sinyal_degisti'=>2,
        'bildirim_degisti'=>3,
        'aksiyon_gecikmis'=>4,
        'aksiyon_bugun'=>5,
        'aksiyon_tarihi_yok'=>6,
        'planli_okunmadi'=>7,
        'plan_bildirimi_yok'=>8,
        'okundu'=>9,
        'risk_cozuldu'=>10,
        'vaka_kapandi'=>11,
        default=>99,
    };
}

function mrts_is_open_stage(string $stage): bool {
    return in_array($stage,['acik','incelemede','beklemede'],true);
}

function mrts_classify(array $row,?array $ctx=null,?string $today=null): array {
    $today=$today?:date('Y-m-d');
    $caseId=(int)($row['vaka_id']??0);
    $stage=(string)($row['vaka_durumu']??'');
    if(!mrts_is_open_stage($stage)){
        return ['state'=>'vaka_kapandi','attention'=>false,'reason'=>'Vaka artık açık değil.'];
    }

    $plannedNoticeId=(int)($row['plan_bildirim_id']??0);
    if($plannedNoticeId<=0){
        return ['state'=>'plan_bildirimi_yok','attention'=>true,'reason'=>'Plan anındaki hedef-risk bildirimi çözümlenemedi.'];
    }

    $currentCycleStart=(string)($row['guncel_dongu_baslangici']??'');
    $plannedCycleKey=(string)($row['plan_dongu_anahtari']??'');
    $currentCycleKey=$caseId>0 && $currentCycleStart!==''?mrh_cycle_key($caseId,$currentCycleStart):'';
    if($currentCycleKey==='' || $plannedCycleKey==='' || !hash_equals($plannedCycleKey,$currentCycleKey)){
        return ['state'=>'dongu_degisti','attention'=>true,'reason'=>'Planlandıktan sonra vaka reopen döngüsü değişti.'];
    }

    $plannedOwner=(int)($row['plan_alici_kullanici_id']??0);
    $currentOwner=(int)($row['sorumlu_kullanici_id']??0);
    if($plannedOwner<=0 || $currentOwner<=0 || $plannedOwner!==$currentOwner){
        return ['state'=>'owner_degisti','attention'=>true,'reason'=>'Plan anındaki bildirim alıcısı artık güncel vaka sorumlusu değil.'];
    }

    if(!is_array($ctx)){
        return ['state'=>'risk_cozuldu','attention'=>false,'reason'=>'Güncel hedef-risk bağlamı artık bildirim gerektirmiyor.'];
    }

    $expectedSignal=(string)($ctx['beklenen_esik_kodu']??'');
    if(!in_array($expectedSignal,['hedef_75','hedef_disinda'],true)){
        return ['state'=>'risk_cozuldu','attention'=>false,'reason'=>'Güncel hedef-risk seviyesi artık bildirim eşiğinde değil.'];
    }

    $plannedSignal=(string)($row['plan_esik_kodu']??'');
    if($plannedSignal!==$expectedSignal){
        return ['state'=>'sinyal_degisti','attention'=>true,'reason'=>'Plan anındaki hedef-risk sinyali artık güncel sinyal değil.'];
    }

    $currentNoticeId=(int)($ctx['hedef_bildirim_id']??0);
    if($currentNoticeId!==$plannedNoticeId){
        return ['state'=>'bildirim_degisti','attention'=>true,'reason'=>'Exact current notification artık plan anındaki bildirim değil.'];
    }

    $read=(string)($row['plan_okundu_tarihi']??'')!==''
        || (string)($ctx['hedef_bildirim_durumu']??'')==='okundu';
    if($read){
        return ['state'=>'okundu','attention'=>false,'reason'=>'Planlanan hedef-risk bildirimi okundu.'];
    }

    if((string)($ctx['hedef_bildirim_durumu']??'')!=='okunmadi'){
        return ['state'=>'bildirim_degisti','attention'=>true,'reason'=>'Planlanan bildirim artık exact current okunmamış durumda değil.'];
    }

    $next=trim((string)($row['sonraki_aksiyon_tarihi']??''));
    if($next===''){
        return ['state'=>'aksiyon_tarihi_yok','attention'=>true,'reason'=>'Vaka açık ve bildirim okunmamış; güncel sonraki aksiyon tarihi yok.'];
    }
    if($next<$today){
        return ['state'=>'aksiyon_gecikmis','attention'=>true,'reason'=>'Planlanan aksiyon tarihi geçti ve bildirim hâlâ okunmadı.'];
    }
    if($next===$today){
        return ['state'=>'aksiyon_bugun','attention'=>true,'reason'=>'Planlanan aksiyon bugün ve bildirim hâlâ okunmadı.'];
    }

    return ['state'=>'planli_okunmadi','attention'=>false,'reason'=>'Güncel owner/döngü/sinyal korunuyor; bildirim okunmamış ve aksiyon gelecekte planlı.'];
}

function mrts_base_rows(PDO $pdo,int $days=30,int $limit=1500): array {
    if(!mrts_tables_ready($pdo)) return [];
    $days=mrh_window_days($days);
    $limit=max(1,min(2000,$limit));
    $cycle=mrh_cycle_expr('v');

    $stmt=$pdo->query("SELECT
        g.id plan_gecmis_id,
        g.vaka_id,
        g.kullanici_id planlayan_kullanici_id,
        g.not_metni plan_notu,
        g.olusturulma_tarihi plan_tarihi,
        v.durum vaka_durumu,
        v.sorumlu_kullanici_id,
        v.sorun_turu,
        v.sonraki_aksiyon_tarihi,
        v.kapanma_tarihi,
        v.kurum_id,
        v.sozlesme_id,
        {$cycle} guncel_dongu_baslangici,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(cu.ad_soyad,'—') guncel_sorumlu_adi,
        COALESCE(pu.ad_soyad,'—') plan_alici_adi,
        COALESCE(pa.ad_soyad,'Sistem') planlayan_adi,
        b.id plan_bildirim_id,
        b.alici_kullanici_id plan_alici_kullanici_id,
        b.dongu_anahtari plan_dongu_anahtari,
        b.esik_kodu plan_esik_kodu,
        b.risk_kodu plan_risk_kodu,
        b.kullanim_orani plan_kullanim_orani,
        b.duyuru_id plan_duyuru_id,
        b.olusturulma_tarihi plan_bildirim_tarihi,
        da.okundu_tarihi plan_okundu_tarihi
        FROM ticari_mutabakat_vaka_gecmisi g
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=g.vaka_id
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar cu ON cu.id=v.sorumlu_kullanici_id
        LEFT JOIN kullanicilar pa ON pa.id=g.kullanici_id
        LEFT JOIN ticari_mutabakat_hedef_risk_bildirimleri b
          ON b.id=(
            SELECT b2.id
            FROM ticari_mutabakat_hedef_risk_bildirimleri b2
            WHERE b2.vaka_id=g.vaka_id
              AND b2.olusturulma_tarihi<=g.olusturulma_tarihi
            ORDER BY b2.olusturulma_tarihi DESC,b2.id DESC
            LIMIT 1
          )
        LEFT JOIN kullanicilar pu ON pu.id=b.alici_kullanici_id
        LEFT JOIN kurum_duyuru_alicilari da
          ON da.duyuru_id=b.duyuru_id
         AND da.kullanici_id=b.alici_kullanici_id
        WHERE g.kod='toplu_takip_planlama'
          AND g.id=(
            SELECT MAX(g2.id)
            FROM ticari_mutabakat_vaka_gecmisi g2
            WHERE g2.vaka_id=g.vaka_id
              AND g2.kod='toplu_takip_planlama'
          )
          AND g.olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
        ORDER BY g.olusturulma_tarihi DESC,g.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mrts_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mrts_tables_ready($pdo)) return [];
    $limit=max(1,min(2000,$limit));
    $days=mrh_window_days($filters['days']??30);
    $base=mrts_base_rows($pdo,$days,2000);
    if(!$base) return [];

    $caseIds=[];
    foreach($base as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$caseIds[$id]=$id;
    }
    $current=$caseIds?mi_target_risk_map($pdo,$actor,array_values($caseIds)):[];

    $stateFilter=trim((string)($filters['state']??''));
    $ownerFilter=max(0,(int)($filters['owner_id']??0));
    $signalFilter=trim((string)($filters['signal']??''));
    $query=mb_strtolower(trim((string)($filters['q']??'')),'UTF-8');

    $out=[];
    foreach($base as $row){
        $caseId=(int)$row['vaka_id'];
        $ctx=$current[$caseId]??null;
        $classification=mrts_classify($row,is_array($ctx)?$ctx:null);
        $state=(string)$classification['state'];

        $row['takip_durumu']=$state;
        $row['takip_durumu_etiketi']=mrts_state_labels()[$state]??$state;
        $row['takip_attention']=!empty($classification['attention']);
        $row['takip_nedeni']=(string)$classification['reason'];
        $row['guncel_hedef_risk_kodu']=is_array($ctx)?(string)($ctx['hedef_risk_kodu']??''):'';
        $row['guncel_hedef_risk_etiketi']=is_array($ctx)?(string)($ctx['hedef_risk_etiketi']??''):'';
        $row['guncel_beklenen_esik_kodu']=is_array($ctx)?(string)($ctx['beklenen_esik_kodu']??''):'';
        $row['guncel_bildirim_id']=is_array($ctx)?(int)($ctx['hedef_bildirim_id']??0):0;
        $row['guncel_bildirim_durumu']=is_array($ctx)?(string)($ctx['hedef_bildirim_durumu']??''):'';

        if($stateFilter!=='' && array_key_exists($stateFilter,mrts_state_labels()) && $state!==$stateFilter) continue;
        if($ownerFilter>0 && (int)($row['sorumlu_kullanici_id']??0)!==$ownerFilter) continue;
        if(in_array($signalFilter,['hedef_75','hedef_disinda'],true)
            && (string)($row['plan_esik_kodu']??'')!==$signalFilter) continue;

        if($query!==''){
            $haystack=mb_strtolower(implode(' ',[
                (string)($row['kurum_adi']??''),
                (string)($row['sozlesme_no']??''),
                (string)($row['guncel_sorumlu_adi']??''),
                (string)($row['plan_alici_adi']??''),
                (string)($row['plan_notu']??''),
                (string)($row['takip_durumu_etiketi']??''),
            ]),'UTF-8');
            if(!str_contains($haystack,$query)) continue;
        }

        $out[]=$row;
    }

    usort($out,static function(array $a,array $b): int {
        $pa=mrts_state_priority((string)($a['takip_durumu']??''));
        $pb=mrts_state_priority((string)($b['takip_durumu']??''));
        if($pa!==$pb) return $pa<=>$pb;

        $dateA=(string)($a['sonraki_aksiyon_tarihi']??'9999-12-31');
        $dateB=(string)($b['sonraki_aksiyon_tarihi']??'9999-12-31');
        if($dateA!==$dateB) return $dateA<=>$dateB;

        return (int)$b['plan_gecmis_id']<=>(int)$a['plan_gecmis_id'];
    });

    return array_slice($out,0,$limit);
}

function mrts_summary(PDO $pdo,array $actor,int $days=30): array {
    $out=[
        'total'=>0,
        'attention'=>0,
        'active_unread'=>0,
        'overdue'=>0,
        'today'=>0,
        'no_date'=>0,
        'read'=>0,
        'owner_changed'=>0,
        'cycle_changed'=>0,
        'signal_changed'=>0,
        'resolved'=>0,
        'closed'=>0,
    ];
    foreach(mrts_rows($pdo,$actor,['days'=>$days],2000) as $row){
        $out['total']++;
        if(!empty($row['takip_attention']))$out['attention']++;
        $state=(string)$row['takip_durumu'];
        if(in_array($state,['planli_okunmadi','aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok'],true))$out['active_unread']++;
        if($state==='aksiyon_gecikmis')$out['overdue']++;
        if($state==='aksiyon_bugun')$out['today']++;
        if($state==='aksiyon_tarihi_yok')$out['no_date']++;
        if($state==='okundu')$out['read']++;
        if($state==='owner_degisti')$out['owner_changed']++;
        if($state==='dongu_degisti')$out['cycle_changed']++;
        if(in_array($state,['sinyal_degisti','bildirim_degisti'],true))$out['signal_changed']++;
        if($state==='risk_cozuldu')$out['resolved']++;
        if($state==='vaka_kapandi')$out['closed']++;
    }
    return $out;
}

function mrts_owner_rows(PDO $pdo,array $actor,int $days=30): array {
    $groups=[];
    foreach(mrts_rows($pdo,$actor,['days'=>$days],2000) as $row){
        $ownerId=(int)($row['sorumlu_kullanici_id']??0);
        $key=$ownerId>0?$ownerId:0;
        if(!isset($groups[$key])){
            $groups[$key]=[
                'owner_id'=>$ownerId,
                'owner_name'=>$ownerId>0?(string)($row['guncel_sorumlu_adi']??'—'):'Sahipsiz',
                'total'=>0,'attention'=>0,'active_unread'=>0,'overdue'=>0,'today'=>0,
                'read'=>0,'context_changed'=>0,
            ];
        }
        $g=&$groups[$key];
        $g['total']++;
        if(!empty($row['takip_attention']))$g['attention']++;
        $state=(string)$row['takip_durumu'];
        if(in_array($state,['planli_okunmadi','aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok'],true))$g['active_unread']++;
        if($state==='aksiyon_gecikmis')$g['overdue']++;
        if($state==='aksiyon_bugun')$g['today']++;
        if($state==='okundu')$g['read']++;
        if(in_array($state,['owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti'],true))$g['context_changed']++;
        unset($g);
    }

    $out=array_values($groups);
    usort($out,static fn(array $a,array $b):int=>
        [$b['attention'],$b['overdue'],$b['active_unread'],$b['total']]
        <=>
        [$a['attention'],$a['overdue'],$a['active_unread'],$a['total']]
    );
    return $out;
}

function mrts_owner_options(PDO $pdo,array $actor,int $days=30): array {
    $out=[];
    foreach(mrts_owner_rows($pdo,$actor,$days) as $row){
        $id=(int)$row['owner_id'];
        if($id>0)$out[$id]=(string)$row['owner_name'];
    }
    return $out;
}
