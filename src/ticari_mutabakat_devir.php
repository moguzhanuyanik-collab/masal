<?php
declare(strict_types=1);

function mdv_tables_ready(PDO $pdo): bool {
    return ma_tables_ready($pdo);
}

function mdv_owner_status(PDO $pdo,?int $ownerId): array {
    $ownerId=max(0,(int)$ownerId);
    if($ownerId<=0){
        return [
            'kod'=>'sahipsiz',
            'etiket'=>'Sahipsiz',
            'gecerli'=>false,
            'kullanici_id'=>0,
            'ad_soyad'=>'Atanmamış',
        ];
    }

    if(!auth_runtime_table_exists($pdo,'kullanicilar')){
        return [
            'kod'=>'kullanici_yok',
            'etiket'=>'Kullanıcı kaydı bulunamadı',
            'gecerli'=>false,
            'kullanici_id'=>$ownerId,
            'ad_soyad'=>'Kullanıcı #'.$ownerId,
        ];
    }

    $stmt=$pdo->prepare('SELECT id,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE id=? LIMIT 1');
    $stmt->execute([$ownerId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

    if(!is_array($row)){
        return [
            'kod'=>'kullanici_yok',
            'etiket'=>'Kullanıcı kaydı bulunamadı',
            'gecerli'=>false,
            'kullanici_id'=>$ownerId,
            'ad_soyad'=>'Kullanıcı #'.$ownerId,
        ];
    }

    $name=trim((string)($row['ad_soyad']??'')) ?: ('Kullanıcı #'.$ownerId);
    if((int)($row['aktif']??0)!==1){
        return [
            'kod'=>'pasif',
            'etiket'=>'Pasif kullanıcı',
            'gecerli'=>false,
            'kullanici_id'=>$ownerId,
            'ad_soyad'=>$name,
        ];
    }

    $isSuper=(string)($row['ana_rol']??'')==='super_admin';
    if(!$isSuper && auth_runtime_table_exists($pdo,'kullanici_rolleri')){
        $stmt=$pdo->prepare("SELECT 1 FROM kullanici_rolleri WHERE kullanici_id=? AND rol='super_admin' LIMIT 1");
        $stmt->execute([$ownerId]);
        $isSuper=(bool)$stmt->fetchColumn();
        $stmt->closeCursor();
    }

    if(!$isSuper){
        return [
            'kod'=>'rol_gecersiz',
            'etiket'=>'Artık Süper Admin değil',
            'gecerli'=>false,
            'kullanici_id'=>$ownerId,
            'ad_soyad'=>$name,
        ];
    }

    return [
        'kod'=>'gecerli',
        'etiket'=>'Aktif Süper Admin',
        'gecerli'=>true,
        'kullanici_id'=>$ownerId,
        'ad_soyad'=>$name,
    ];
}

function mdv_rows(PDO $pdo,array $filters=[],int $limit=1000): array {
    if(!mdv_tables_ready($pdo)) return [];
    $limit=max(1,min(1500,$limit));

    $where=["v.durum IN ('acik','incelemede','beklemede')"];
    $params=[];

    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $like='%'.$query.'%';
        $where[]='(k.ad LIKE ? OR k.kod LIKE ? OR s.sozlesme_no LIKE ? OR v.son_aciklama LIKE ?)';
        array_push($params,$like,$like,$like,$like);
    }

    $stmt=$pdo->prepare("SELECT
        v.id,v.kaynak_turu,v.kaynak_kodu,v.kaynak_id,v.kaynak_alt_id,
        v.sozlesme_id,v.kurum_id,v.para_birimi,v.sorun_turu,v.durum,
        v.sorumlu_kullanici_id,v.sonraki_aksiyon_tarihi,v.son_aciklama,
        v.olusturulma_tarihi,v.guncellenme_tarihi,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(k.kod,'—') kurum_kodu,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE WHEN v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0 THEN 0 ELSE 1 END,
          CASE WHEN v.sonraki_aksiyon_tarihi<CURDATE() THEN 0
               WHEN v.sonraki_aksiyon_tarihi=CURDATE() THEN 1
               ELSE 2 END,
          v.guncellenme_tarihi DESC,v.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    $statusFilter=trim((string)($filters['sorumlu_durumu']??''));
    $out=[];
    foreach($rows as $row){
        $owner=mdv_owner_status($pdo,(int)($row['sorumlu_kullanici_id']??0));
        $row['sorumlu_durum_kodu']=$owner['kod'];
        $row['sorumlu_durum_etiketi']=$owner['etiket'];
        $row['sorumlu_adi']=$owner['ad_soyad'];
        $row['sorumlu_gecerli']=$owner['gecerli'];
        $row['aksiyon_gecikti']=!empty($row['sonraki_aksiyon_tarihi'])
            && (string)$row['sonraki_aksiyon_tarihi']<date('Y-m-d');

        if($owner['gecerli']) continue;
        if($statusFilter!=='' && $statusFilter!==(string)$owner['kod']) continue;
        $out[]=$row;
    }
    return $out;
}

function mdv_summary(PDO $pdo): array {
    $out=['toplam'=>0,'sahipsiz'=>0,'pasif'=>0,'rol_gecersiz'=>0,'kullanici_yok'=>0,'aksiyon_gecikti'=>0];
    if(!mdv_tables_ready($pdo)) return $out;
    foreach(mdv_rows($pdo,[],1500) as $row){
        $out['toplam']++;
        $code=(string)$row['sorumlu_durum_kodu'];
        if(array_key_exists($code,$out)) $out[$code]++;
        if(!empty($row['aksiyon_gecikti'])) $out['aksiyon_gecikti']++;
    }
    return $out;
}

function mdv_normalize_case_ids(array $caseIds): array {
    $ids=[];
    foreach($caseIds as $value){
        $id=(int)$value;
        if($id>0)$ids[$id]=$id;
    }
    $ids=array_values($ids);
    sort($ids,SORT_NUMERIC);
    if(!$ids) throw new RuntimeException('En az bir yetim/geçersiz sorumlu vakası seçilmelidir.');
    if(count($ids)>100) throw new RuntimeException('Tek devir işleminde en fazla 100 vaka seçilebilir.');
    return $ids;
}

function mdv_transfer(
    PDO $pdo,
    array $actor,
    array $caseIds,
    int $newOwnerId,
    string $note=''
): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin'){
        throw new RuntimeException('Süper Admin yetkisi gerekli.');
    }
    if(!mdv_tables_ready($pdo)){
        throw new RuntimeException('Mutabakat aksiyon tabloları henüz hazır değil.');
    }

    $ids=mdv_normalize_case_ids($caseIds);
    $newOwner=auth_fetch_user($pdo,$newOwnerId);
    if(!$newOwner || !auth_user_has_role($newOwner,'super_admin')){
        throw new RuntimeException('Yeni sorumlu aktif bir Süper Admin olmalıdır.');
    }

    $note=trim($note);
    if(mb_strlen($note)>600) throw new RuntimeException('Devir notu en fazla 600 karakter olabilir.');

    $actorId=max(0,(int)($actor['id']??0));
    $newOwnerName=trim((string)($newOwner['ad_soyad']??('Kullanıcı #'.$newOwnerId)));
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
            $oldStatus=mdv_owner_status($pdo,(int)($case['sorumlu_kullanici_id']??0));
            if(!empty($oldStatus['gecerli'])){
                throw new RuntimeException('Seçilen vakalardan biri artık geçerli bir Süper Admin sorumlusuna sahip. Normal görev dağılımı için Toplu Planlama kullan.');
            }
        }

        $update=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET sorumlu_kullanici_id=?,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','incelemede','beklemede')");

        foreach($cases as $case){
            $caseId=(int)$case['id'];
            $oldStatus=mdv_owner_status($pdo,(int)($case['sorumlu_kullanici_id']??0));
            $update->execute([$newOwnerId,$actorId>0?$actorId:null,$caseId]);
            if($update->rowCount()>1){
                throw new RuntimeException('Sorumlu devir işlemi beklenmeyen satır sayısı üretti.');
            }

            $parts=[
                'Eski sorumlu: '.$oldStatus['ad_soyad'].' · '.$oldStatus['etiket'],
                'Yeni sorumlu: '.$newOwnerName.' (#'.$newOwnerId.')',
                'Aksiyon tarihi korundu: '.((string)($case['sonraki_aksiyon_tarihi']??'')!==''?(string)$case['sonraki_aksiyon_tarihi']:'Yok'),
            ];
            if($note!=='')$parts[]='Devir notu: '.$note;

            ma_history_add(
                $pdo,$caseId,$actorId>0?$actorId:null,
                'planlama','sorumlu_devir',implode(' · ',$parts)
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
        'mutabakat_sorumlu_devir',
        count($ids).' vaka · yeni sorumlu #'.$newOwnerId
    );

    return [
        'updated'=>count($ids),
        'owner_id'=>$newOwnerId,
        'owner_name'=>$newOwnerName,
    ];
}

function mdv_recent_transfers(PDO $pdo,int $limit=100): array {
    if(!mdv_tables_ready($pdo)) return [];
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
        WHERE g.kod='sorumlu_devir'
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
