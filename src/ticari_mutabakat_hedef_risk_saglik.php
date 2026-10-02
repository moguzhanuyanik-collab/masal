<?php
declare(strict_types=1);

function mrh_tables_ready(PDO $pdo): bool {
    foreach([
        'ticari_mutabakat_hedef_risk_bildirimleri',
        'ticari_mutabakat_vakalari',
        'ticari_mutabakat_vaka_gecmisi',
        'ticari_mutabakat_hedef_politikalari',
        'kurum_duyurulari',
        'kurum_duyuru_alicilari',
        'kullanicilar',
        'kurumlar',
        'kurum_sozlesmeleri',
    ] as $table){
        if(!auth_runtime_table_exists($pdo,$table)) return false;
    }
    return true;
}

function mrh_cycle_expr(string $alias='v'): string {
    return "COALESCE(
        (SELECT MAX(gx.olusturulma_tarihi)
         FROM ticari_mutabakat_vaka_gecmisi gx
         WHERE gx.vaka_id={$alias}.id AND gx.kod='vaka_yeniden_acildi'),
        {$alias}.olusturulma_tarihi
    )";
}

function mrh_cycle_key(int $caseId,string $cycleStart): string {
    return hash('sha256',$caseId.'|'.trim($cycleStart));
}

function mrh_window_days(int|string|null $value): int {
    $days=(int)$value;
    return in_array($days,[7,30,90,180,365],true)?$days:30;
}

function mrh_rows(PDO $pdo,array $filters=[],int $limit=1200): array {
    if(!mrh_tables_ready($pdo)) return [];
    $limit=max(1,min(2000,$limit));
    $days=mrh_window_days($filters['days']??30);
    $cycle=mrh_cycle_expr('v');

    $where=["b.olusturulma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)"];
    $params=[];

    $signal=trim((string)($filters['signal']??''));
    if(in_array($signal,['hedef_75','hedef_disinda'],true)){
        $where[]='b.esik_kodu=?';
        $params[]=$signal;
    }

    $ownerId=max(0,(int)($filters['owner_id']??0));
    if($ownerId>0){
        $where[]='b.alici_kullanici_id=?';
        $params[]=$ownerId;
    }

    $stmt=$pdo->prepare("SELECT
        b.id,b.vaka_id,b.kurum_id,b.hedef_politika_id,b.alici_kullanici_id,
        b.dongu_anahtari,b.esik_kodu,b.risk_kodu,b.kullanim_orani,b.duyuru_id,
        b.gonderen_kullanici_id,b.olusturulma_tarihi,
        da.okundu_tarihi,
        d.aktif duyuru_aktif,
        v.durum vaka_durumu,v.sorumlu_kullanici_id,v.sorun_turu,
        v.sonraki_aksiyon_tarihi,v.kapanma_tarihi,v.sozlesme_id,
        {$cycle} guncel_dongu_baslangici,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'—') alici_adi,
        COALESCE(p.kapsam,'—') politika_kapsami,
        p.ilk_mudahale_saat politika_ilk_mudahale_saat,
        p.cevrim_gun politika_cevrim_gun
        FROM ticari_mutabakat_hedef_risk_bildirimleri b
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=b.vaka_id
        LEFT JOIN kurum_duyurulari d ON d.id=b.duyuru_id
        LEFT JOIN kurum_duyuru_alicilari da
          ON da.duyuru_id=b.duyuru_id
         AND da.kullanici_id=b.alici_kullanici_id
        LEFT JOIN kurumlar k ON k.id=b.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=b.alici_kullanici_id
        LEFT JOIN ticari_mutabakat_hedef_politikalari p ON p.id=b.hedef_politika_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY b.olusturulma_tarihi DESC,b.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    $readFilter=trim((string)($filters['read']??''));
    $stateFilter=trim((string)($filters['state']??''));
    $out=[];
    foreach($rows as $row){
        $caseId=(int)$row['vaka_id'];
        $currentCycleStart=(string)$row['guncel_dongu_baslangici'];
        $currentCycleKey=mrh_cycle_key($caseId,$currentCycleStart);
        $isOpen=in_array((string)$row['vaka_durumu'],['acik','incelemede','beklemede'],true);
        $isCurrentCycle=hash_equals((string)$row['dongu_anahtari'],$currentCycleKey);
        $isRead=(string)($row['okundu_tarihi']??'')!=='';

        $row['guncel_dongu_anahtari']=$currentCycleKey;
        $row['guncel_dongu_bildirimi']=$isCurrentCycle;
        $row['guncel_acik_vaka']=$isOpen && $isCurrentCycle;
        $row['eski_dongu_bildirimi']=$isOpen && !$isCurrentCycle;
        $row['okundu']=$isRead;
        $row['acik_hedef_disinda']=$row['guncel_acik_vaka'] && (string)$row['esik_kodu']==='hedef_disinda';

        $sentTs=strtotime((string)$row['olusturulma_tarihi']);
        $readTs=$isRead?strtotime((string)$row['okundu_tarihi']):false;
        $closeTs=(string)($row['kapanma_tarihi']??'')!==''?strtotime((string)$row['kapanma_tarihi']):false;
        $row['okunma_dakika']=($sentTs!==false && $readTs!==false && $readTs>=$sentTs)
            ?(int)floor(($readTs-$sentTs)/60)
            :null;
        $row['kapanma_dakika']=(!$isOpen && $sentTs!==false && $closeTs!==false && $closeTs>=$sentTs)
            ?(int)floor(($closeTs-$sentTs)/60)
            :null;
        $row['acik_saat']=($row['guncel_acik_vaka'] && $sentTs!==false)
            ?max(0,(int)floor((time()-$sentTs)/3600))
            :null;

        if($readFilter==='okundu' && !$isRead) continue;
        if($readFilter==='okunmadi' && $isRead) continue;
        if($stateFilter==='guncel_acik' && !$row['guncel_acik_vaka']) continue;
        if($stateFilter==='guncel_acik_okunmadi' && !($row['guncel_acik_vaka'] && !$isRead)) continue;
        if($stateFilter==='guncel_hedef_disinda' && !$row['acik_hedef_disinda']) continue;
        if($stateFilter==='kapali' && $isOpen) continue;
        if($stateFilter==='eski_dongu' && !$row['eski_dongu_bildirimi']) continue;

        $out[]=$row;
    }
    return $out;
}

function mrh_summary(PDO $pdo,int $days=30): array {
    $days=mrh_window_days($days);
    $out=[
        'days'=>$days,
        'total'=>0,'read'=>0,'unread'=>0,'read_rate'=>0.0,
        'current_open'=>0,'current_open_unread'=>0,'current_outside_open'=>0,
        'closed_after'=>0,'old_cycle'=>0,
        'avg_read_minutes'=>null,'avg_close_minutes'=>null,
    ];
    if(!mrh_tables_ready($pdo)) return $out;

    $readMinutes=[];
    $closeMinutes=[];
    foreach(mrh_rows($pdo,['days'=>$days],2000) as $row){
        $out['total']++;
        if(!empty($row['okundu'])){
            $out['read']++;
            if($row['okunma_dakika']!==null)$readMinutes[]=(int)$row['okunma_dakika'];
        }else{
            $out['unread']++;
        }
        if(!empty($row['guncel_acik_vaka'])){
            $out['current_open']++;
            if(empty($row['okundu']))$out['current_open_unread']++;
        }
        if(!empty($row['acik_hedef_disinda']))$out['current_outside_open']++;
        if($row['kapanma_dakika']!==null){
            $out['closed_after']++;
            $closeMinutes[]=(int)$row['kapanma_dakika'];
        }
        if(!empty($row['eski_dongu_bildirimi']))$out['old_cycle']++;
    }

    if($out['total']>0)$out['read_rate']=round(($out['read']/$out['total'])*100,1);
    if($readMinutes)$out['avg_read_minutes']=round(array_sum($readMinutes)/count($readMinutes),1);
    if($closeMinutes)$out['avg_close_minutes']=round(array_sum($closeMinutes)/count($closeMinutes),1);
    return $out;
}

function mrh_owner_rows(PDO $pdo,int $days=30): array {
    $groups=[];
    foreach(mrh_rows($pdo,['days'=>mrh_window_days($days)],2000) as $row){
        $id=(int)$row['alici_kullanici_id'];
        if(!isset($groups[$id])){
            $groups[$id]=[
                'alici_kullanici_id'=>$id,
                'alici_adi'=>(string)$row['alici_adi'],
                'toplam'=>0,'okundu'=>0,'okunmadi'=>0,'guncel_acik'=>0,
                'guncel_acik_okunmadi'=>0,'hedef_disinda_acik'=>0,'okunma_dakika_toplam'=>0,'okunma_adet'=>0,
            ];
        }
        $g=&$groups[$id];
        $g['toplam']++;
        if(!empty($row['okundu'])){
            $g['okundu']++;
            if($row['okunma_dakika']!==null){
                $g['okunma_dakika_toplam']+=(int)$row['okunma_dakika'];
                $g['okunma_adet']++;
            }
        }else $g['okunmadi']++;
        if(!empty($row['guncel_acik_vaka'])){
            $g['guncel_acik']++;
            if(empty($row['okundu']))$g['guncel_acik_okunmadi']++;
        }
        if(!empty($row['acik_hedef_disinda']))$g['hedef_disinda_acik']++;
        unset($g);
    }

    $out=array_values($groups);
    foreach($out as &$row){
        $row['okunma_orani']=$row['toplam']>0?round(($row['okundu']/$row['toplam'])*100,1):0.0;
        $row['ortalama_okunma_dakika']=$row['okunma_adet']>0
            ?round($row['okunma_dakika_toplam']/$row['okunma_adet'],1)
            :null;
        unset($row['okunma_dakika_toplam'],$row['okunma_adet']);
    }
    unset($row);
    usort($out,static function(array $a,array $b): int {
        return [$b['hedef_disinda_acik'],$b['guncel_acik_okunmadi'],$b['guncel_acik'],$b['toplam']]
            <=> [$a['hedef_disinda_acik'],$a['guncel_acik_okunmadi'],$a['guncel_acik'],$a['toplam']];
    });
    return $out;
}

function mrh_policy_rows(PDO $pdo,int $days=30): array {
    $groups=[];
    foreach(mrh_rows($pdo,['days'=>mrh_window_days($days)],2000) as $row){
        $id=(int)$row['hedef_politika_id'];
        if(!isset($groups[$id])){
            $groups[$id]=[
                'hedef_politika_id'=>$id,
                'politika_kapsami'=>(string)$row['politika_kapsami'],
                'ilk_mudahale_saat'=>$row['politika_ilk_mudahale_saat'],
                'cevrim_gun'=>$row['politika_cevrim_gun'],
                'toplam'=>0,'hedef_75'=>0,'hedef_disinda'=>0,'okundu'=>0,'guncel_acik'=>0,
            ];
        }
        $g=&$groups[$id];
        $g['toplam']++;
        if((string)$row['esik_kodu']==='hedef_75')$g['hedef_75']++;
        if((string)$row['esik_kodu']==='hedef_disinda')$g['hedef_disinda']++;
        if(!empty($row['okundu']))$g['okundu']++;
        if(!empty($row['guncel_acik_vaka']))$g['guncel_acik']++;
        unset($g);
    }

    $out=array_values($groups);
    foreach($out as &$row){
        $row['okunma_orani']=$row['toplam']>0?round(($row['okundu']/$row['toplam'])*100,1):0.0;
    }
    unset($row);
    usort($out,static fn(array $a,array $b):int=>$b['toplam']<=>$a['toplam']);
    return $out;
}

function mrh_owner_options(PDO $pdo,int $days=30): array {
    $out=[];
    foreach(mrh_owner_rows($pdo,$days) as $row){
        $out[(int)$row['alici_kullanici_id']]=(string)$row['alici_adi'];
    }
    return $out;
}
