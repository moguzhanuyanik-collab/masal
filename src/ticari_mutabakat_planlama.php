<?php
declare(strict_types=1);

function map_tables_ready(PDO $pdo): bool {
    return mhs_tables_ready($pdo);
}

function map_super_admin_rows(PDO $pdo): array {
    if(!auth_runtime_table_exists($pdo,'kullanicilar')) return [];

    if(auth_runtime_table_exists($pdo,'kullanici_rolleri')){
        $stmt=$pdo->query("SELECT DISTINCT u.id,u.ad_soyad,u.email
            FROM kullanicilar u
            LEFT JOIN kullanici_rolleri kr
              ON kr.kullanici_id=u.id AND kr.rol='super_admin'
            WHERE u.aktif=1
              AND (u.ana_rol='super_admin' OR kr.kullanici_id IS NOT NULL)
            ORDER BY u.ad_soyad,u.id");
    }else{
        $stmt=$pdo->query("SELECT u.id,u.ad_soyad,u.email
            FROM kullanicilar u
            WHERE u.aktif=1 AND u.ana_rol='super_admin'
            ORDER BY u.ad_soyad,u.id");
    }

    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function map_validate_owner(PDO $pdo,int $ownerId): array {
    if($ownerId<=0) throw new RuntimeException('Sorumlu Süper Admin seçilmelidir.');
    $owner=auth_fetch_user($pdo,$ownerId);
    if(!$owner || !auth_user_has_role($owner,'super_admin')){
        throw new RuntimeException('Seçilen sorumlu aktif bir Süper Admin değil.');
    }
    return $owner;
}

function map_normalize_case_ids(array $caseIds): array {
    $ids=[];
    foreach($caseIds as $value){
        $id=(int)$value;
        if($id>0)$ids[$id]=$id;
    }
    $ids=array_values($ids);
    sort($ids,SORT_NUMERIC);
    if(!$ids) throw new RuntimeException('En az bir açık mutabakat vakası seçilmelidir.');
    if(count($ids)>100) throw new RuntimeException('Tek toplu planlama işleminde en fazla 100 vaka seçilebilir.');
    return $ids;
}

function map_bulk_plan(
    PDO $pdo,
    array $actor,
    array $caseIds,
    int $ownerId,
    string $nextActionDate,
    string $note=''
): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!map_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat aksiyon tabloları henüz hazır değil.');
    }

    $ids=map_normalize_case_ids($caseIds);
    $owner=map_validate_owner($pdo,$ownerId);
    $next=ma_validate_date($nextActionDate);
    if($next===null) throw new RuntimeException('Sonraki aksiyon tarihi zorunludur.');
    if($next<date('Y-m-d')) throw new RuntimeException('Sonraki aksiyon tarihi geçmişte olamaz.');

    $note=trim($note);
    if(mb_strlen($note)>600) throw new RuntimeException('Toplu planlama notu en fazla 600 karakter olabilir.');

    $actorId=max(0,(int)($actor['id']??0));
    $ownerName=trim((string)($owner['ad_soyad']??('Kullanıcı #'.$ownerId)));
    $ph=implode(',',array_fill(0,count($ids),'?'));

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare("SELECT *
            FROM ticari_mutabakat_vakalari
            WHERE id IN ({$ph})
            ORDER BY id
            FOR UPDATE");
        $stmt->execute($ids);
        $cases=$stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        if(count($cases)!==count($ids)){
            throw new RuntimeException('Seçilen vakalardan biri artık bulunamıyor.');
        }

        foreach($cases as $case){
            if(!in_array((string)$case['durum'],ma_open_stages(),true)){
                throw new RuntimeException('Seçilen vakalardan biri artık açık değil. Listeyi yenileyip tekrar dene.');
            }
            if(!ma_case_source_still_open($pdo,$case)){
                throw new RuntimeException('Seçilen vakalardan birinin kaynak sorunu artık açık değil. Önce vaka senkronizasyonunu çalıştır.');
            }
        }

        $update=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET sorumlu_kullanici_id=?,sonraki_aksiyon_tarihi=?,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','incelemede','beklemede')");

        foreach($cases as $case){
            $caseId=(int)$case['id'];
            $oldOwner=(int)($case['sorumlu_kullanici_id']??0);
            $oldDate=(string)($case['sonraki_aksiyon_tarihi']??'');

            $update->execute([$ownerId,$next,$actorId>0?$actorId:null,$caseId]);
            if($update->rowCount()>1){
                throw new RuntimeException('Toplu planlama güncellemesi beklenmeyen satır sayısı üretti.');
            }

            $parts=[
                'Sorumlu: '.($oldOwner>0?'#'.$oldOwner:'Atanmamış').' → '.$ownerName.' (#'.$ownerId.')',
                'Sonraki aksiyon: '.($oldDate!==''?$oldDate:'Yok').' → '.$next,
            ];
            if($note!=='')$parts[]='Plan notu: '.$note;

            ma_history_add(
                $pdo,$caseId,$actorId>0?$actorId:null,
                'planlama','toplu_planlama',implode(' · ',$parts)
            );
        }
        $update->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit(
        $pdo,$actorId>0?$actorId:null,null,
        'mutabakat_toplu_planlama',
        count($ids).' vaka · sorumlu #'.$ownerId.' · aksiyon '.$next
    );

    return [
        'updated'=>count($ids),
        'owner_id'=>$ownerId,
        'owner_name'=>$ownerName,
        'next_action_date'=>$next,
    ];
}

function map_bulk_reschedule_preserve_owners(
    PDO $pdo,
    array $actor,
    array $caseIds,
    string $nextActionDate,
    string $note=''
): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!map_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat aksiyon tabloları henüz hazır değil.');
    }

    $ids=map_normalize_case_ids($caseIds);
    $next=ma_validate_date($nextActionDate);
    if($next===null) throw new RuntimeException('Sonraki aksiyon tarihi zorunludur.');
    if($next<date('Y-m-d')) throw new RuntimeException('Sonraki aksiyon tarihi geçmişte olamaz.');

    $note=trim($note);
    if(mb_strlen($note)>600) throw new RuntimeException('Toplu takip notu en fazla 600 karakter olabilir.');

    $actorId=max(0,(int)($actor['id']??0));
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $owners=[];

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare("SELECT *
            FROM ticari_mutabakat_vakalari
            WHERE id IN ({$ph})
            ORDER BY id
            FOR UPDATE");
        $stmt->execute($ids);
        $cases=$stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        if(count($cases)!==count($ids)){
            throw new RuntimeException('Seçilen vakalardan biri artık bulunamıyor.');
        }

        foreach($cases as $case){
            if(!in_array((string)$case['durum'],ma_open_stages(),true)){
                throw new RuntimeException('Seçilen vakalardan biri artık açık değil. Listeyi yenileyip tekrar dene.');
            }
            if(!ma_case_source_still_open($pdo,$case)){
                throw new RuntimeException('Seçilen vakalardan birinin kaynak sorunu artık açık değil. Listeyi yenileyip tekrar dene.');
            }
            $ownerId=(int)($case['sorumlu_kullanici_id']??0);
            if($ownerId<=0) throw new RuntimeException('Seçilen vakalardan birinin güncel sorumlusu yok.');
            if(!isset($owners[$ownerId])){
                $owners[$ownerId]=map_validate_owner($pdo,$ownerId);
            }
        }

        $update=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET sonraki_aksiyon_tarihi=?,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','incelemede','beklemede')");

        foreach($cases as $case){
            $caseId=(int)$case['id'];
            $ownerId=(int)$case['sorumlu_kullanici_id'];
            $ownerName=trim((string)($owners[$ownerId]['ad_soyad']??('Kullanıcı #'.$ownerId)));
            $oldDate=(string)($case['sonraki_aksiyon_tarihi']??'');

            $update->execute([$next,$actorId>0?$actorId:null,$caseId]);
            if($update->rowCount()>1){
                throw new RuntimeException('Toplu takip planlama güncellemesi beklenmeyen satır sayısı üretti.');
            }

            $parts=[
                'Sorumlu korunuyor: '.$ownerName.' (#'.$ownerId.')',
                'Sonraki aksiyon: '.($oldDate!==''?$oldDate:'Yok').' → '.$next,
            ];
            if($note!=='')$parts[]='Takip notu: '.$note;

            ma_history_add(
                $pdo,$caseId,$actorId>0?$actorId:null,
                'planlama','toplu_takip_planlama',implode(' · ',$parts)
            );
        }
        $update->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit(
        $pdo,$actorId>0?$actorId:null,null,
        'mutabakat_toplu_takip_planlama',
        count($ids).' vaka · '.count($owners).' mevcut sorumlu · aksiyon '.$next
    );

    return [
        'updated'=>count($ids),
        'owner_count'=>count($owners),
        'next_action_date'=>$next,
    ];
}

function map_recent_planning(PDO $pdo,int $limit=100): array {
    if(!map_tables_ready($pdo)) return [];
    $limit=max(1,min(300,$limit));
    $stmt=$pdo->query("SELECT
        g.id,g.vaka_id,g.not_metni,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi,
        v.sorun_turu,v.durum,v.kurum_id,v.sozlesme_id,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no
        FROM ticari_mutabakat_vaka_gecmisi g
        INNER JOIN ticari_mutabakat_vakalari v ON v.id=g.vaka_id
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        WHERE g.kod='toplu_planlama'
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
