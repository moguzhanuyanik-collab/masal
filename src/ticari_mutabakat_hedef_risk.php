<?php
declare(strict_types=1);

function mhr_tables_ready(PDO $pdo): bool {
    return mh_tables_ready($pdo);
}

function mhr_scope_labels(): array {
    return [
        'team'=>'Tüm Ekip',
        'mine'=>'Bana Atanan',
        'unassigned'=>'Sahipsiz',
    ];
}

function mhr_risk_labels(): array {
    return [
        'hedef_disinda'=>'Hedef Dışında',
        'yuzde_75'=>'Süre %75+',
        'yuzde_50'=>'Süre %50–74',
        'hedef_icinde'=>'Hedef İçinde',
        'politika_yok'=>'Politika Yok',
    ];
}

function mhr_enrich_row(array $row,?int $nowTs=null): array {
    $nowTs=$nowTs??time();
    $row['hedef_risk_kodu']='politika_yok';
    $row['hedef_risk_etiketi']='Politika Yok';
    $row['hedef_sure_kullanim_orani']=null;
    $row['cevrim_kullanim_orani']=null;
    $row['ilk_mudahale_kullanim_orani']=null;
    $row['cevrim_kalan_saat']=null;
    $row['ilk_mudahale_kalan_saat']=null;
    $row['hedef_kalan_saat']=null;
    $row['ilk_mudahale_bekliyor']=empty($row['ilk_mudahale_tarihi']);

    if(empty($row['hedef_politika_id'])) return $row;

    $cycleTs=strtotime((string)($row['dongu_baslangic_tarihi']??''));
    if($cycleTs===false) return $row;

    $cycleTargetHours=max(1,(int)($row['hedef_cevrim_gun']??0)*24);
    $firstTargetHours=max(1,(int)($row['hedef_ilk_mudahale_saat']??0));
    $ageHours=max(0,($nowTs-$cycleTs)/3600);

    $cycleRatio=($ageHours/$cycleTargetHours)*100;
    $row['cevrim_kullanim_orani']=round($cycleRatio,1);
    $row['cevrim_kalan_saat']=round(max(0,$cycleTargetHours-$ageHours),1);

    $firstTs=!empty($row['ilk_mudahale_tarihi'])
        ?strtotime((string)$row['ilk_mudahale_tarihi'])
        :false;

    if($firstTs!==false){
        $firstHours=max(0,($firstTs-$cycleTs)/3600);
        $firstRatio=($firstHours/$firstTargetHours)*100;
        $row['ilk_mudahale_kullanim_orani']=round($firstRatio,1);
        $row['ilk_mudahale_kalan_saat']=0.0;
        $row['ilk_mudahale_bekliyor']=false;
    }else{
        $firstRatio=($ageHours/$firstTargetHours)*100;
        $row['ilk_mudahale_kullanim_orani']=round($firstRatio,1);
        $row['ilk_mudahale_kalan_saat']=round(max(0,$firstTargetHours-$ageHours),1);
        $row['ilk_mudahale_bekliyor']=true;
    }

    $cycleOutside=(string)($row['hedef_cevrim_durumu']??'')==='hedef_disinda';
    $firstOutside=(string)($row['hedef_ilk_mudahale_durumu']??'')==='hedef_disinda';

    if($cycleOutside || $firstOutside){
        $row['hedef_risk_kodu']='hedef_disinda';
        $row['hedef_risk_etiketi']='Hedef Dışında';
        $row['hedef_sure_kullanim_orani']=round(max($cycleRatio,$firstRatio),1);
        $row['hedef_kalan_saat']=0.0;
        return $row;
    }

    $activeRatios=[$cycleRatio];
    $activeRemaining=[max(0,$cycleTargetHours-$ageHours)];
    if($firstTs===false){
        $activeRatios[]=$firstRatio;
        $activeRemaining[]=max(0,$firstTargetHours-$ageHours);
    }
    $usage=max($activeRatios);
    $remaining=min($activeRemaining);

    $row['hedef_sure_kullanim_orani']=round($usage,1);
    $row['hedef_kalan_saat']=round($remaining,1);

    if($usage>=75){
        $row['hedef_risk_kodu']='yuzde_75';
        $row['hedef_risk_etiketi']='Süre %75+';
    }elseif($usage>=50){
        $row['hedef_risk_kodu']='yuzde_50';
        $row['hedef_risk_etiketi']='Süre %50–74';
    }else{
        $row['hedef_risk_kodu']='hedef_icinde';
        $row['hedef_risk_etiketi']='Hedef İçinde';
    }
    return $row;
}

function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=700): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    if(!mhr_tables_ready($pdo)) return [];
    $limit=max(1,min(1500,$limit));

    $scope=(string)($filters['scope']??'team');
    if(!array_key_exists($scope,mhr_scope_labels())) $scope='team';

    $risk=(string)($filters['risk']??'');
    if($risk!=='' && !array_key_exists($risk,mhr_risk_labels())) $risk='';

    $type=(string)($filters['sorun_turu']??'');
    if(!in_array($type,['operasyon','butunluk'],true)) $type='';

    $ownerFilter=(string)($filters['owner_id']??'');
    $query=mb_strtolower(trim((string)($filters['q']??'')),'UTF-8');

    $rows=[];
    foreach(mh_open_target_rows($pdo,1500) as $row){
        $row=mhr_enrich_row($row);

        $ownerId=(int)($row['sorumlu_kullanici_id']??0);
        if($scope==='mine' && $ownerId!==(int)$actor['id']) continue;
        if($scope==='unassigned' && $ownerId>0) continue;
        if($scope==='team' && $ownerFilter!==''){
            if($ownerFilter==='unassigned'){
                if($ownerId>0) continue;
            }elseif($ownerId!==(int)$ownerFilter){
                continue;
            }
        }

        if($type!=='' && (string)$row['sorun_turu']!==$type) continue;
        if($risk!=='' && (string)$row['hedef_risk_kodu']!==$risk) continue;

        if($query!==''){
            $haystack=mb_strtolower(
                (string)($row['kurum_adi']??'').' '.
                (string)($row['kurum_kodu']??'').' '.
                (string)($row['sozlesme_no']??'').' '.
                (string)($row['son_aciklama']??'').' '.
                (string)($row['sorumlu_adi']??''),
                'UTF-8'
            );
            if(!str_contains($haystack,$query)) continue;
        }

        $rows[]=$row;
    }

    $rank=['hedef_disinda'=>0,'yuzde_75'=>1,'yuzde_50'=>2,'politika_yok'=>3,'hedef_icinde'=>4];
    usort($rows,static function(array $a,array $b) use($rank): int {
        $ra=$rank[(string)($a['hedef_risk_kodu']??'politika_yok')]??9;
        $rb=$rank[(string)($b['hedef_risk_kodu']??'politika_yok')]??9;
        if($ra!==$rb) return $ra<=>$rb;

        $oa=!empty($a['aksiyon_gecikti'])?0:(!empty($a['aksiyon_bugun'])?1:2);
        $ob=!empty($b['aksiyon_gecikti'])?0:(!empty($b['aksiyon_bugun'])?1:2);
        if($oa!==$ob) return $oa<=>$ob;

        $ua=(float)($a['hedef_sure_kullanim_orani']??0);
        $ub=(float)($b['hedef_sure_kullanim_orani']??0);
        if(abs($ua-$ub)>0.001) return $ua<$ub?1:-1;

        return (int)($b['id']??0)<=>(int)($a['id']??0);
    });

    return array_slice($rows,0,$limit);
}

function mhr_summary(PDO $pdo,array $actor): array {
    $out=[
        'open'=>0,
        'policy_evaluable'=>0,
        'policy_missing'=>0,
        'outside'=>0,
        'cycle_outside'=>0,
        'first_outside'=>0,
        'near_75'=>0,
        'watch_50'=>0,
        'inside'=>0,
        'mine_outside'=>0,
        'unassigned_outside'=>0,
        'outside_overdue_action'=>0,
    ];
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mhr_tables_ready($pdo)) return $out;

    foreach(mhr_rows($pdo,$actor,['scope'=>'team'],1500) as $row){
        $out['open']++;
        $code=(string)$row['hedef_risk_kodu'];
        if($code==='politika_yok'){
            $out['policy_missing']++;
            continue;
        }

        $out['policy_evaluable']++;
        if($code==='hedef_disinda'){
            $out['outside']++;
            if((string)$row['hedef_cevrim_durumu']==='hedef_disinda') $out['cycle_outside']++;
            if((string)$row['hedef_ilk_mudahale_durumu']==='hedef_disinda') $out['first_outside']++;
            if((int)($row['sorumlu_kullanici_id']??0)===(int)$actor['id']) $out['mine_outside']++;
            if((int)($row['sorumlu_kullanici_id']??0)<=0) $out['unassigned_outside']++;
            if(!empty($row['aksiyon_gecikti'])) $out['outside_overdue_action']++;
        }elseif($code==='yuzde_75'){
            $out['near_75']++;
        }elseif($code==='yuzde_50'){
            $out['watch_50']++;
        }else{
            $out['inside']++;
        }
    }
    return $out;
}

function mhr_owner_rows(PDO $pdo,array $actor,int $limit=100): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin' || !mhr_tables_ready($pdo)) return [];
    $limit=max(1,min(300,$limit));

    $out=[];
    foreach(mhr_rows($pdo,$actor,['scope'=>'team'],1500) as $row){
        $ownerId=(int)($row['sorumlu_kullanici_id']??0);
        if(!isset($out[$ownerId])){
            $out[$ownerId]=[
                'sorumlu_kullanici_id'=>$ownerId,
                'sorumlu_adi'=>(string)($row['sorumlu_adi']??'Atanmamış'),
                'open'=>0,
                'policy_evaluable'=>0,
                'outside'=>0,
                'near_75'=>0,
                'watch_50'=>0,
                'policy_missing'=>0,
                'overdue_action'=>0,
            ];
        }
        $out[$ownerId]['open']++;
        $code=(string)$row['hedef_risk_kodu'];
        if($code==='politika_yok') $out[$ownerId]['policy_missing']++;
        else $out[$ownerId]['policy_evaluable']++;
        if($code==='hedef_disinda') $out[$ownerId]['outside']++;
        elseif($code==='yuzde_75') $out[$ownerId]['near_75']++;
        elseif($code==='yuzde_50') $out[$ownerId]['watch_50']++;
        if(!empty($row['aksiyon_gecikti'])) $out[$ownerId]['overdue_action']++;
    }

    $rows=array_values($out);
    usort($rows,static function(array $a,array $b): int {
        foreach(['outside','near_75','overdue_action','open'] as $key){
            $cmp=(int)$b[$key]<=>(int)$a[$key];
            if($cmp!==0) return $cmp;
        }
        return strcasecmp((string)$a['sorumlu_adi'],(string)$b['sorumlu_adi']);
    });
    return array_slice($rows,0,$limit);
}

function mhr_remaining_label(?float $hours): string {
    if($hours===null) return '—';
    if($hours<=0) return 'Süre doldu';
    if($hours<24) return number_format($hours,1,',','.').' saat';
    return number_format($hours/24,1,',','.').' gün';
}
