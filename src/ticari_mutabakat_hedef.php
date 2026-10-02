<?php
declare(strict_types=1);

function mh_tables_ready(PDO $pdo): bool {
    return mhs_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_hedef_politikalari');
}

function mh_scope_labels(): array {
    return [
        'genel'=>'Genel',
        'operasyon'=>'Operasyon Açığı',
        'butunluk'=>'Veri Bütünlüğü',
    ];
}

function mh_policy_versions(PDO $pdo): array {
    if(!mh_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        h.id,h.kapsam,h.ilk_mudahale_saat,h.cevrim_gun,h.aciklama,
        h.olusturan_kullanici_id,h.gecerlilik_baslangici,h.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') olusturan_adi
        FROM ticari_mutabakat_hedef_politikalari h
        LEFT JOIN kullanicilar u ON u.id=h.olusturan_kullanici_id
        ORDER BY h.gecerlilik_baslangici DESC,h.id DESC");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mh_resolve_policy(array $versions,string $issueType,string $cycleStart): ?array {
    if(!in_array($issueType,['operasyon','butunluk'],true) || trim($cycleStart)==='') return null;
    $cycleTs=strtotime($cycleStart);
    if($cycleTs===false) return null;

    $specific=null;
    $general=null;
    foreach($versions as $row){
        $scope=(string)($row['kapsam']??'');
        if(!in_array($scope,['genel',$issueType],true)) continue;
        $startTs=strtotime((string)($row['gecerlilik_baslangici']??''));
        if($startTs===false || $startTs>$cycleTs) continue;

        if($scope===$issueType && $specific===null) $specific=$row;
        if($scope==='genel' && $general===null) $general=$row;
        if($specific!==null && $general!==null) break;
    }
    return $specific??$general;
}

function mh_current_policy(PDO $pdo,string $scope): ?array {
    if(!mh_tables_ready($pdo) || !array_key_exists($scope,mh_scope_labels())) return null;
    $stmt=$pdo->prepare("SELECT
        h.id,h.kapsam,h.ilk_mudahale_saat,h.cevrim_gun,h.aciklama,
        h.olusturan_kullanici_id,h.gecerlilik_baslangici,h.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') olusturan_adi
        FROM ticari_mutabakat_hedef_politikalari h
        LEFT JOIN kullanicilar u ON u.id=h.olusturan_kullanici_id
        WHERE h.kapsam=? AND h.gecerlilik_baslangici<=NOW()
        ORDER BY h.gecerlilik_baslangici DESC,h.id DESC
        LIMIT 1");
    $stmt->execute([$scope]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function mh_effective_current_policies(PDO $pdo): array {
    if(!mh_tables_ready($pdo)) return [];
    $out=[];
    foreach(['genel','operasyon','butunluk'] as $scope){
        $row=mh_current_policy($pdo,$scope);
        if($row)$out[$scope]=$row;
    }
    return $out;
}

function mh_publish_policy(
    PDO $pdo,
    array $actor,
    string $scope,
    int|string $firstInterventionHours,
    int|string $cycleDays,
    string $note=''
): int {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!mh_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat hedef politikası migrationı henüz kurulmamış.');
    }
    if(!array_key_exists($scope,mh_scope_labels())){
        throw new RuntimeException('Hedef kapsamı geçersiz.');
    }

    $first=(int)$firstInterventionHours;
    $cycle=(int)$cycleDays;
    $note=trim($note);

    if($first<1 || $first>720) throw new RuntimeException('İlk müdahale hedefi 1 ile 720 saat arasında olmalı.');
    if($cycle<1 || $cycle>365) throw new RuntimeException('Çevrim hedefi 1 ile 365 gün arasında olmalı.');
    if(mb_strlen($note)>1000) throw new RuntimeException('Hedef politika notu çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_hedef_politikalari
        (kapsam,ilk_mudahale_saat,cevrim_gun,aciklama,olusturan_kullanici_id,gecerlilik_baslangici)
        VALUES (?,?,?,?,?,NOW())");
    $stmt->execute([
        $scope,$first,$cycle,$note!==''?$note:null,(int)$actor['id']
    ]);
    if($stmt->rowCount()!==1){
        $stmt->closeCursor();
        throw new RuntimeException('Hedef politikası yayınlanamadı.');
    }
    $id=(int)$pdo->lastInsertId();
    $stmt->closeCursor();

    auth_audit(
        $pdo,(int)$actor['id'],null,'mutabakat_hedef_politikasi',
        'Kapsam '.$scope.' · ilk müdahale '.$first.' saat · çevrim '.$cycle.' gün · politika #'.$id
    );
    return $id;
}

function mh_closed_cycles(PDO $pdo,int $days=30,int $limit=4000): array {
    if(!mh_tables_ready($pdo)) return [];
    $days=mp_window_days($days);
    $limit=max(1,min(5000,$limit));
    $cycle=mhs_cycle_expr('v');
    $first=mp_first_intervention_expr('v');

    $stmt=$pdo->query("SELECT
        v.id vaka_id,v.sorun_turu,v.kapanma_tarihi,
        {$cycle} dongu_baslangic_tarihi,
        {$first} ilk_mudahale_tarihi
        FROM ticari_mutabakat_vakalari v
        WHERE v.durum='kapali'
          AND v.kapanma_tarihi>=DATE_SUB(NOW(),INTERVAL {$days} DAY)
        ORDER BY v.kapanma_tarihi DESC,v.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function mh_closed_target_summary(PDO $pdo,int $days=30): array {
    $days=mp_window_days($days);
    $out=[
        'window_days'=>$days,
        'closed_total'=>0,
        'policy_evaluable'=>0,
        'no_policy'=>0,
        'cycle_within'=>0,
        'cycle_outside'=>0,
        'cycle_within_rate'=>0.0,
        'first_within'=>0,
        'first_outside'=>0,
        'first_within_rate'=>0.0,
    ];
    if(!mh_tables_ready($pdo)) return $out;

    $versions=mh_policy_versions($pdo);
    foreach(mh_closed_cycles($pdo,$days,4000) as $row){
        $out['closed_total']++;
        $cycleStart=(string)$row['dongu_baslangic_tarihi'];
        $policy=mh_resolve_policy($versions,(string)$row['sorun_turu'],$cycleStart);
        if(!$policy){
            $out['no_policy']++;
            continue;
        }

        $out['policy_evaluable']++;
        $startTs=strtotime($cycleStart);
        $closeTs=strtotime((string)$row['kapanma_tarihi']);
        $cycleDays=($startTs!==false && $closeTs!==false)
            ?max(0,($closeTs-$startTs)/86400)
            :0.0;
        if($cycleDays<=(int)$policy['cevrim_gun']) $out['cycle_within']++;
        else $out['cycle_outside']++;

        $firstTs=!empty($row['ilk_mudahale_tarihi'])
            ?strtotime((string)$row['ilk_mudahale_tarihi'])
            :false;
        $firstHours=($startTs!==false && $firstTs!==false)
            ?max(0,($firstTs-$startTs)/3600)
            :null;
        if($firstHours!==null && $firstHours<=(int)$policy['ilk_mudahale_saat']){
            $out['first_within']++;
        }else{
            $out['first_outside']++;
        }
    }

    if($out['policy_evaluable']>0){
        $out['cycle_within_rate']=round(($out['cycle_within']/$out['policy_evaluable'])*100,1);
        $out['first_within_rate']=round(($out['first_within']/$out['policy_evaluable'])*100,1);
    }
    return $out;
}

function mh_open_target_rows(PDO $pdo,int $limit=1500): array {
    if(!mh_tables_ready($pdo)) return [];
    $versions=mh_policy_versions($pdo);
    $rows=mhs_case_rows($pdo,[],min(1500,max(1,$limit)));
    $now=time();

    foreach($rows as &$row){
        $cycleStart=(string)($row['dongu_baslangic_tarihi']??'');
        $policy=mh_resolve_policy($versions,(string)($row['sorun_turu']??''),$cycleStart);
        $row['hedef_politika_id']=$policy?(int)$policy['id']:null;
        $row['hedef_kapsam']=$policy?(string)$policy['kapsam']:null;
        $row['hedef_ilk_mudahale_saat']=$policy?(int)$policy['ilk_mudahale_saat']:null;
        $row['hedef_cevrim_gun']=$policy?(int)$policy['cevrim_gun']:null;
        $row['hedef_cevrim_durumu']='tanimsiz';
        $row['hedef_ilk_mudahale_durumu']='tanimsiz';

        if(!$policy) continue;
        $cycleTs=strtotime($cycleStart);
        if($cycleTs===false) continue;

        $ageHours=max(0,($now-$cycleTs)/3600);
        $row['hedef_cevrim_durumu']=($ageHours/24)<=(int)$policy['cevrim_gun']
            ?'hedef_icinde'
            :'hedef_disinda';

        $firstTs=!empty($row['ilk_mudahale_tarihi'])
            ?strtotime((string)$row['ilk_mudahale_tarihi'])
            :false;
        if($firstTs!==false){
            $responseHours=max(0,($firstTs-$cycleTs)/3600);
            $row['hedef_ilk_mudahale_durumu']=$responseHours<=(int)$policy['ilk_mudahale_saat']
                ?'hedef_icinde'
                :'hedef_disinda';
        }else{
            $row['hedef_ilk_mudahale_durumu']=$ageHours<=(int)$policy['ilk_mudahale_saat']
                ?'bekliyor'
                :'hedef_disinda';
        }
    }
    unset($row);
    return $rows;
}

function mh_open_target_summary(PDO $pdo): array {
    $out=[
        'open'=>0,
        'policy_evaluable'=>0,
        'no_policy'=>0,
        'cycle_outside'=>0,
        'first_outside'=>0,
        'first_waiting'=>0,
    ];
    if(!mh_tables_ready($pdo)) return $out;

    foreach(mh_open_target_rows($pdo,1500) as $row){
        $out['open']++;
        if(empty($row['hedef_politika_id'])){
            $out['no_policy']++;
            continue;
        }
        $out['policy_evaluable']++;
        if((string)$row['hedef_cevrim_durumu']==='hedef_disinda') $out['cycle_outside']++;
        if((string)$row['hedef_ilk_mudahale_durumu']==='hedef_disinda') $out['first_outside']++;
        if((string)$row['hedef_ilk_mudahale_durumu']==='bekliyor') $out['first_waiting']++;
    }
    return $out;
}

function mh_issue_target_summary(PDO $pdo,int $days=30): array {
    if(!mh_tables_ready($pdo)) return [];
    $days=mp_window_days($days);
    $versions=mh_policy_versions($pdo);
    $out=[
        'operasyon'=>[
            'sorun_turu'=>'operasyon','eligible'=>0,'cycle_within'=>0,'first_within'=>0,
            'cycle_rate'=>0.0,'first_rate'=>0.0
        ],
        'butunluk'=>[
            'sorun_turu'=>'butunluk','eligible'=>0,'cycle_within'=>0,'first_within'=>0,
            'cycle_rate'=>0.0,'first_rate'=>0.0
        ],
    ];

    foreach(mh_closed_cycles($pdo,$days,4000) as $row){
        $type=(string)$row['sorun_turu'];
        if(!isset($out[$type])) continue;
        $cycleStart=(string)$row['dongu_baslangic_tarihi'];
        $policy=mh_resolve_policy($versions,$type,$cycleStart);
        if(!$policy) continue;

        $out[$type]['eligible']++;
        $startTs=strtotime($cycleStart);
        $closeTs=strtotime((string)$row['kapanma_tarihi']);
        $cycleDays=($startTs!==false && $closeTs!==false)
            ?max(0,($closeTs-$startTs)/86400)
            :0.0;
        if($cycleDays<=(int)$policy['cevrim_gun']) $out[$type]['cycle_within']++;

        $firstTs=!empty($row['ilk_mudahale_tarihi'])
            ?strtotime((string)$row['ilk_mudahale_tarihi'])
            :false;
        $firstHours=($startTs!==false && $firstTs!==false)
            ?max(0,($firstTs-$startTs)/3600)
            :null;
        if($firstHours!==null && $firstHours<=(int)$policy['ilk_mudahale_saat']){
            $out[$type]['first_within']++;
        }
    }

    foreach($out as &$row){
        if($row['eligible']>0){
            $row['cycle_rate']=round(($row['cycle_within']/$row['eligible'])*100,1);
            $row['first_rate']=round(($row['first_within']/$row['eligible'])*100,1);
        }
    }
    unset($row);
    return array_values($out);
}
