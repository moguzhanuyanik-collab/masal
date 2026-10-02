<?php
declare(strict_types=1);

function ma_tables_ready(PDO $pdo): bool {
    return tm_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vakalari')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi');
}

function ma_stage_labels(): array {
    return [
        'acik'=>'Açık',
        'incelemede'=>'İncelemede',
        'beklemede'=>'Dış Aksiyon Bekleniyor',
        'kapali'=>'Kapalı',
    ];
}

function ma_open_stages(): array {
    return ['acik','incelemede','beklemede'];
}

function ma_validate_date(?string $value): ?string {
    $value=trim((string)$value);
    if($value==='') return null;
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value){
        throw new RuntimeException('Takip tarihi geçersiz.');
    }
    return $value;
}

function ma_issue_key(array $issue): string {
    $source=(string)($issue['kaynak_turu']??'');
    if($source==='sozlesme_mutabakat'){
        return hash('sha256','sozlesme_mutabakat|'.(int)($issue['sozlesme_id']??0));
    }
    return hash('sha256',implode('|',[
        $source,
        (string)($issue['kaynak_kodu']??''),
        (string)(int)($issue['kaynak_id']??0),
        (string)(int)($issue['kaynak_alt_id']??0),
        (string)(int)($issue['sozlesme_id']??0),
    ]));
}

function ma_contract_issue(array $row): ?array {
    $status=(string)($row['mutabakat_durumu']??'');
    if(!in_array($status,['eksik','hata'],true)) return null;

    $contractId=(int)($row['sozlesme_id']??0);
    if($contractId<=0) return null;

    $parts=[];
    if((float)($row['belgesiz_tutar']??0)>0.009) $parts[]='belgesiz '.number_format((float)$row['belgesiz_tutar'],2,',','.');
    if((float)($row['acik_belge_tutari']??0)>0.009) $parts[]='açık belge '.number_format((float)$row['acik_belge_tutari'],2,',','.');
    if((float)($row['dagitilmamis_tahsilat']??0)>0.009) $parts[]='dağıtılmamış tahsilat '.number_format((float)$row['dagitilmamis_tahsilat'],2,',','.');
    if((float)($row['belge_asimi']??0)>0.009) $parts[]='belge kapasite aşımı '.number_format((float)$row['belge_asimi'],2,',','.');
    if((float)($row['belge_esleme_asimi']??0)>0.009) $parts[]='belge eşleme aşımı '.number_format((float)$row['belge_esleme_asimi'],2,',','.');
    if((float)($row['tahsilat_esleme_asimi']??0)>0.009) $parts[]='tahsilat eşleme aşımı '.number_format((float)$row['tahsilat_esleme_asimi'],2,',','.');

    $issue=[
        'kaynak_turu'=>'sozlesme_mutabakat',
        'kaynak_kodu'=>$status,
        'kaynak_id'=>$contractId,
        'kaynak_alt_id'=>null,
        'sozlesme_id'=>$contractId,
        'kurum_id'=>(int)($row['kurum_id']??0),
        'para_birimi'=>(string)($row['para_birimi']??''),
        'sorun_turu'=>$status==='hata'?'butunluk':'operasyon',
        'aciklama'=>(string)($row['sozlesme_no']??('#'.$contractId)).' · '.implode(' · ',$parts),
    ];
    $issue['anahtar']=ma_issue_key($issue);
    return $issue;
}

function ma_contract_issues(PDO $pdo): array {
    if(!tm_tables_ready($pdo)) return [];
    $out=[];
    $offset=0;
    $pageSize=1000;

    do{
        $rows=tm_contract_rows($pdo,[],$pageSize,$offset);
        foreach($rows as $row){
            $issue=ma_contract_issue($row);
            if($issue)$out[]=$issue;
        }
        $count=count($rows);
        $offset+=$count;
    }while($count===$pageSize);

    return $out;
}

function ma_integrity_issues(PDO $pdo): array {
    if(!tm_tables_ready($pdo)) return [];
    $out=[];

    $stmt=$pdo->query("SELECT
        b.id kaynak_id,NULL kaynak_alt_id,b.sozlesme_id,b.kurum_id,b.para_birimi,
        b.belge_no referans,
        CASE
          WHEN s.id IS NULL THEN 'Belgenin bağlı sözleşmesi bulunamıyor.'
          WHEN s.kurum_id<>b.kurum_id THEN 'Belge kurum kimliği sözleşmeyle uyuşmuyor.'
          WHEN s.para_birimi<>b.para_birimi THEN 'Belge para birimi sözleşmeyle uyuşmuyor.'
          ELSE 'Belge kimlik bütünlüğü bozuk.'
        END aciklama
        FROM ticari_belgeler b
        LEFT JOIN kurum_sozlesmeleri s ON s.id=b.sozlesme_id
        WHERE s.id IS NULL OR s.kurum_id<>b.kurum_id OR s.para_birimi<>b.para_birimi
        ORDER BY b.id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    foreach($rows as $row){
        $issue=[
            'kaynak_turu'=>'belge_kimlik',
            'kaynak_kodu'=>'belge_kimlik_uyumsuz',
            'kaynak_id'=>(int)$row['kaynak_id'],
            'kaynak_alt_id'=>null,
            'sozlesme_id'=>(int)$row['sozlesme_id'],
            'kurum_id'=>(int)$row['kurum_id'],
            'para_birimi'=>(string)$row['para_birimi'],
            'sorun_turu'=>'butunluk',
            'aciklama'=>(string)$row['referans'].' · '.(string)$row['aciklama'],
        ];
        $issue['anahtar']=ma_issue_key($issue);
        $out[]=$issue;
    }

    $stmt=$pdo->query("SELECT
        t.id kaynak_id,NULL kaynak_alt_id,t.sozlesme_id,t.kurum_id,t.para_birimi,
        COALESCE(t.referans_no,CONCAT('#',t.id)) referans,
        CASE
          WHEN s.id IS NULL THEN 'Tahsilatın bağlı sözleşmesi bulunamıyor.'
          WHEN s.kurum_id<>t.kurum_id THEN 'Tahsilat kurum kimliği sözleşmeyle uyuşmuyor.'
          WHEN s.para_birimi<>t.para_birimi THEN 'Tahsilat para birimi sözleşmeyle uyuşmuyor.'
          ELSE 'Tahsilat kimlik bütünlüğü bozuk.'
        END aciklama
        FROM kurum_tahsilatlari t
        LEFT JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id
        WHERE s.id IS NULL OR s.kurum_id<>t.kurum_id OR s.para_birimi<>t.para_birimi
        ORDER BY t.id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    foreach($rows as $row){
        $issue=[
            'kaynak_turu'=>'tahsilat_kimlik',
            'kaynak_kodu'=>'tahsilat_kimlik_uyumsuz',
            'kaynak_id'=>(int)$row['kaynak_id'],
            'kaynak_alt_id'=>null,
            'sozlesme_id'=>(int)$row['sozlesme_id'],
            'kurum_id'=>(int)$row['kurum_id'],
            'para_birimi'=>(string)$row['para_birimi'],
            'sorun_turu'=>'butunluk',
            'aciklama'=>(string)$row['referans'].' · '.(string)$row['aciklama'],
        ];
        $issue['anahtar']=ma_issue_key($issue);
        $out[]=$issue;
    }

    $stmt=$pdo->query("SELECT
        e.belge_id kaynak_id,e.tahsilat_id kaynak_alt_id,e.sozlesme_id,e.kurum_id,
        COALESCE(b.para_birimi,t.para_birimi,'') para_birimi,
        CONCAT('Belge #',e.belge_id,' / Tahsilat #',e.tahsilat_id) referans
        FROM ticari_belge_tahsilat_eslemeleri e
        LEFT JOIN ticari_belgeler b ON b.id=e.belge_id
        LEFT JOIN kurum_tahsilatlari t ON t.id=e.tahsilat_id
        WHERE b.id IS NULL OR t.id IS NULL
           OR b.sozlesme_id<>e.sozlesme_id
           OR t.sozlesme_id<>e.sozlesme_id
           OR b.kurum_id<>e.kurum_id
           OR t.kurum_id<>e.kurum_id
           OR b.para_birimi<>t.para_birimi
           OR e.tutar<=0
        ORDER BY e.belge_id,e.tahsilat_id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    foreach($rows as $row){
        $issue=[
            'kaynak_turu'=>'esleme_kimlik',
            'kaynak_kodu'=>'esleme_kimlik_uyumsuz',
            'kaynak_id'=>(int)$row['kaynak_id'],
            'kaynak_alt_id'=>(int)$row['kaynak_alt_id'],
            'sozlesme_id'=>(int)$row['sozlesme_id'],
            'kurum_id'=>(int)$row['kurum_id'],
            'para_birimi'=>(string)$row['para_birimi'],
            'sorun_turu'=>'butunluk',
            'aciklama'=>(string)$row['referans'].' · Belge-tahsilat eşlemesinin kurum/sözleşme/para birimi ilişkisi uyuşmuyor.',
        ];
        $issue['anahtar']=ma_issue_key($issue);
        $out[]=$issue;
    }

    return $out;
}

function ma_history_add(
    PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null
): void {
    if(!ma_tables_ready($pdo) || $caseId<=0) return;
    $type=trim($type);
    $code=$code!==null?trim($code):null;
    $note=$note!==null?trim($note):null;
    if($type==='' || mb_strlen($type)>20) throw new RuntimeException('Vaka geçmiş türü geçersiz.');
    if($code!==null && mb_strlen($code)>40) throw new RuntimeException('Vaka geçmiş kodu geçersiz.');
    if($note!==null && mb_strlen($note)>2000) throw new RuntimeException('Vaka geçmiş notu çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
        (vaka_id,kullanici_id,tur,kod,not_metni)
        VALUES (?,?,?,?,?)");
    $stmt->execute([
        $caseId,$userId && $userId>0?$userId:null,$type,
        $code!==''?$code:null,$note!==''?$note:null
    ]);
    $stmt->closeCursor();
}

function ma_case_source_still_open(PDO $pdo,array $case): bool {
    $source=(string)($case['kaynak_turu']??'');
    $sourceId=max(0,(int)($case['kaynak_id']??0));
    $altId=max(0,(int)($case['kaynak_alt_id']??0));

    if($source==='sozlesme_mutabakat'){
        $rows=tm_contract_rows($pdo,['sozlesme_id'=>$sourceId],1,0);
        if(!$rows) return false;
        return in_array((string)$rows[0]['mutabakat_durumu'],['eksik','hata'],true);
    }

    if($source==='belge_kimlik'){
        $stmt=$pdo->prepare("SELECT COUNT(*)
            FROM ticari_belgeler b
            LEFT JOIN kurum_sozlesmeleri s ON s.id=b.sozlesme_id
            WHERE b.id=?
              AND (s.id IS NULL OR s.kurum_id<>b.kurum_id OR s.para_birimi<>b.para_birimi)");
        $stmt->execute([$sourceId]);
        $open=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $open;
    }

    if($source==='tahsilat_kimlik'){
        $stmt=$pdo->prepare("SELECT COUNT(*)
            FROM kurum_tahsilatlari t
            LEFT JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id
            WHERE t.id=?
              AND (s.id IS NULL OR s.kurum_id<>t.kurum_id OR s.para_birimi<>t.para_birimi)");
        $stmt->execute([$sourceId]);
        $open=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $open;
    }

    if($source==='esleme_kimlik'){
        $stmt=$pdo->prepare("SELECT COUNT(*)
            FROM ticari_belge_tahsilat_eslemeleri e
            LEFT JOIN ticari_belgeler b ON b.id=e.belge_id
            LEFT JOIN kurum_tahsilatlari t ON t.id=e.tahsilat_id
            WHERE e.belge_id=? AND e.tahsilat_id=?
              AND (
                   b.id IS NULL OR t.id IS NULL
                OR b.sozlesme_id<>e.sozlesme_id
                OR t.sozlesme_id<>e.sozlesme_id
                OR b.kurum_id<>e.kurum_id
                OR t.kurum_id<>e.kurum_id
                OR b.para_birimi<>t.para_birimi
                OR e.tutar<=0
              )");
        $stmt->execute([$sourceId,$altId]);
        $open=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $open;
    }

    return false;
}

function ma_sync_cases(PDO $pdo,array $actor): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!ma_tables_ready($pdo)) throw new RuntimeException('Mutabakat aksiyon migrationı henüz kurulmamış.');

    $userId=max(0,(int)($actor['id']??0));
    $created=0;
    $reopened=0;
    $closed=0;
    $refreshed=0;

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $issues=array_merge(ma_contract_issues($pdo),ma_integrity_issues($pdo));
        $currentKeys=[];

        $insert=$pdo->prepare("INSERT IGNORE INTO ticari_mutabakat_vakalari
            (anahtar,kaynak_turu,kaynak_kodu,kaynak_id,kaynak_alt_id,sozlesme_id,kurum_id,para_birimi,
             sorun_turu,durum,son_tespit_tarihi,son_aciklama,olusturan_kullanici_id,guncelleyen_kullanici_id)
            VALUES (?,?,?,?,?,?,?,?,?,'acik',NOW(),?,?,?)");
        $select=$pdo->prepare("SELECT * FROM ticari_mutabakat_vakalari WHERE anahtar=? LIMIT 1 FOR UPDATE");
        $refresh=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET kaynak_kodu=?,kaynak_id=?,kaynak_alt_id=?,sozlesme_id=?,kurum_id=?,para_birimi=?,
                sorun_turu=?,son_tespit_tarihi=NOW(),son_aciklama=?,guncelleyen_kullanici_id=?
            WHERE id=?");
        $reopen=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET durum='acik',kapanma_kodu=NULL,kapanma_tarihi=NULL,sonraki_aksiyon_tarihi=NULL,
                guncelleyen_kullanici_id=?
            WHERE id=? AND durum='kapali'");

        foreach($issues as $issue){
            $key=(string)$issue['anahtar'];
            $currentKeys[$key]=true;

            $insert->execute([
                $key,(string)$issue['kaynak_turu'],(string)$issue['kaynak_kodu'],
                (int)$issue['kaynak_id'],
                !empty($issue['kaynak_alt_id'])?(int)$issue['kaynak_alt_id']:null,
                !empty($issue['sozlesme_id'])?(int)$issue['sozlesme_id']:null,
                !empty($issue['kurum_id'])?(int)$issue['kurum_id']:null,
                (string)$issue['para_birimi']!==''?(string)$issue['para_birimi']:null,
                (string)$issue['sorun_turu'],
                (string)$issue['aciklama'],
                $userId>0?$userId:null,$userId>0?$userId:null
            ]);

            if($insert->rowCount()===1){
                $caseId=(int)$pdo->lastInsertId();
                $created++;
                ma_history_add(
                    $pdo,$caseId,$userId>0?$userId:null,'durum','vaka_acildi',
                    'Mutabakat kaynağındaki açık sorun için operasyon vakası oluşturuldu.'
                );
                continue;
            }

            $select->execute([$key]);
            $case=$select->fetch(PDO::FETCH_ASSOC);
            $select->closeCursor();
            if(!is_array($case)) continue;

            $caseId=(int)$case['id'];
            $oldType=(string)$case['sorun_turu'];
            $oldCode=(string)$case['kaynak_kodu'];

            $refresh->execute([
                (string)$issue['kaynak_kodu'],
                (int)$issue['kaynak_id'],
                !empty($issue['kaynak_alt_id'])?(int)$issue['kaynak_alt_id']:null,
                !empty($issue['sozlesme_id'])?(int)$issue['sozlesme_id']:null,
                !empty($issue['kurum_id'])?(int)$issue['kurum_id']:null,
                (string)$issue['para_birimi']!==''?(string)$issue['para_birimi']:null,
                (string)$issue['sorun_turu'],
                (string)$issue['aciklama'],
                $userId>0?$userId:null,
                $caseId
            ]);
            $refreshed++;

            if((string)$case['durum']==='kapali'){
                $reopen->execute([$userId>0?$userId:null,$caseId]);
                if($reopen->rowCount()===1){
                    $reopened++;
                    ma_history_add(
                        $pdo,$caseId,$userId>0?$userId:null,'durum','vaka_yeniden_acildi',
                        'Kaynak sorun yeniden tespit edildiği için aynı mutabakat vakası yeniden açıldı.'
                    );
                }
            }elseif($oldType!==(string)$issue['sorun_turu'] || $oldCode!==(string)$issue['kaynak_kodu']){
                ma_history_add(
                    $pdo,$caseId,$userId>0?$userId:null,'durum','sinif_degisti',
                    'Kaynak sorun sınıfı '.$oldType.'/'.$oldCode.' → '.(string)$issue['sorun_turu'].'/'.(string)$issue['kaynak_kodu'].' olarak değişti.'
                );
            }
        }

        $insert->closeCursor();
        $refresh->closeCursor();
        $reopen->closeCursor();

        $stmt=$pdo->query("SELECT *
            FROM ticari_mutabakat_vakalari
            WHERE durum IN ('acik','incelemede','beklemede')
            ORDER BY id
            FOR UPDATE");
        $openCases=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
        if($stmt)$stmt->closeCursor();

        $close=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET durum='kapali',kapanma_kodu='kaynak_cozuldu',kapanma_tarihi=NOW(),
                sonraki_aksiyon_tarihi=NULL,guncelleyen_kullanici_id=?
            WHERE id=? AND durum IN ('acik','incelemede','beklemede')");
        foreach($openCases as $case){
            $key=(string)$case['anahtar'];
            if(isset($currentKeys[$key])) continue;
            if(ma_case_source_still_open($pdo,$case)) continue;

            $close->execute([$userId>0?$userId:null,(int)$case['id']]);
            if($close->rowCount()===1){
                $closed++;
                ma_history_add(
                    $pdo,(int)$case['id'],$userId>0?$userId:null,'durum','kaynak_cozuldu',
                    'Kaynak finans/belge/eşleme verisi artık bu mutabakat sorununu üretmiyor; vaka otomatik kapatıldı.'
                );
            }
        }
        $close->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    return ['created'=>$created,'reopened'=>$reopened,'closed'=>$closed,'refreshed'=>$refreshed];
}

function ma_queue_rows(PDO $pdo,array $filters=[],int $limit=500): array {
    if(!ma_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=['1=1'];
    $params=[];

    $status=trim((string)($filters['durum']??'open'));
    if($status==='open'){
        $where[]="v.durum IN ('acik','incelemede','beklemede')";
    }elseif($status!=='' && array_key_exists($status,ma_stage_labels())){
        $where[]='v.durum=?';
        $params[]=$status;
    }

    $type=trim((string)($filters['sorun_turu']??''));
    if(in_array($type,['operasyon','butunluk'],true)){
        $where[]='v.sorun_turu=?';
        $params[]=$type;
    }

    $institutionId=max(0,(int)($filters['kurum_id']??0));
    if($institutionId>0){
        $where[]='v.kurum_id=?';
        $params[]=$institutionId;
    }

    $contractId=max(0,(int)($filters['sozlesme_id']??0));
    if($contractId>0){
        $where[]='v.sozlesme_id=?';
        $params[]=$contractId;
    }

    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $like='%'.$query.'%';
        $where[]='(k.ad LIKE ? OR k.kod LIKE ? OR s.sozlesme_no LIKE ? OR v.son_aciklama LIKE ?)';
        array_push($params,$like,$like,$like,$like);
    }

    $stmt=$pdo->prepare("SELECT
        v.*,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(k.kod,'—') kurum_kodu,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'—') sorumlu_adi,
        (SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi g WHERE g.vaka_id=v.id) gecmis_sayisi
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE WHEN v.durum='kapali' THEN 1 ELSE 0 END,
          CASE v.sorun_turu WHEN 'butunluk' THEN 0 ELSE 1 END,
          CASE
            WHEN v.sonraki_aksiyon_tarihi IS NOT NULL AND v.sonraki_aksiyon_tarihi<=CURDATE() THEN 0
            WHEN v.sonraki_aksiyon_tarihi IS NOT NULL THEN 1
            ELSE 2
          END,
          v.guncellenme_tarihi DESC,v.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ma_summary(PDO $pdo): array {
    $out=[
        'open'=>0,'operasyon'=>0,'butunluk'=>0,
        'incelemede'=>0,'beklemede'=>0,'aksiyon_bekleyen'=>0,'kapali'=>0
    ];
    if(!ma_tables_ready($pdo)) return $out;

    $stmt=$pdo->query("SELECT
        SUM(CASE WHEN durum IN ('acik','incelemede','beklemede') THEN 1 ELSE 0 END) open_count,
        SUM(CASE WHEN durum IN ('acik','incelemede','beklemede') AND sorun_turu='operasyon' THEN 1 ELSE 0 END) operasyon_count,
        SUM(CASE WHEN durum IN ('acik','incelemede','beklemede') AND sorun_turu='butunluk' THEN 1 ELSE 0 END) butunluk_count,
        SUM(CASE WHEN durum='incelemede' THEN 1 ELSE 0 END) incelemede_count,
        SUM(CASE WHEN durum='beklemede' THEN 1 ELSE 0 END) beklemede_count,
        SUM(CASE WHEN durum IN ('acik','incelemede','beklemede')
                  AND sonraki_aksiyon_tarihi IS NOT NULL
                  AND sonraki_aksiyon_tarihi<=CURDATE() THEN 1 ELSE 0 END) aksiyon_count,
        SUM(CASE WHEN durum='kapali' THEN 1 ELSE 0 END) kapali_count
        FROM ticari_mutabakat_vakalari");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(!is_array($row)) return $out;

    $out['open']=(int)($row['open_count']??0);
    $out['operasyon']=(int)($row['operasyon_count']??0);
    $out['butunluk']=(int)($row['butunluk_count']??0);
    $out['incelemede']=(int)($row['incelemede_count']??0);
    $out['beklemede']=(int)($row['beklemede_count']??0);
    $out['aksiyon_bekleyen']=(int)($row['aksiyon_count']??0);
    $out['kapali']=(int)($row['kapali_count']??0);
    return $out;
}

function ma_case_row(PDO $pdo,int $caseId,bool $forUpdate=false): ?array {
    if(!ma_tables_ready($pdo) || $caseId<=0) return null;
    $stmt=$pdo->prepare("SELECT
        v.*,
        COALESCE(k.ad,'—') kurum_adi,
        COALESCE(k.kod,'—') kurum_kodu,
        COALESCE(s.sozlesme_no,CONCAT('#',v.sozlesme_id)) sozlesme_no,
        COALESCE(u.ad_soyad,'—') sorumlu_adi
        FROM ticari_mutabakat_vakalari v
        LEFT JOIN kurumlar k ON k.id=v.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=v.sozlesme_id
        LEFT JOIN kullanicilar u ON u.id=v.sorumlu_kullanici_id
        WHERE v.id=? LIMIT 1".($forUpdate?' FOR UPDATE':''));
    $stmt->execute([$caseId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function ma_history_rows(PDO $pdo,int $caseId,int $limit=200): array {
    if(!ma_tables_ready($pdo) || $caseId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.id,g.tur,g.kod,g.not_metni,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM ticari_mutabakat_vaka_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        WHERE g.vaka_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$caseId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ma_set_stage(PDO $pdo,array $actor,int $caseId,string $stage): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!in_array($stage,['acik','incelemede','beklemede'],true)) throw new RuntimeException('Vaka aşaması geçersiz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ma_case_row($pdo,$caseId,true);
        if(!$case) throw new RuntimeException('Mutabakat vakası bulunamadı.');
        if((string)$case['durum']==='kapali') throw new RuntimeException('Kaynak sorunu çözülmüş kapalı vaka değiştirilemez.');

        if((string)$case['durum']!==$stage){
            $stmt=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
                SET durum=?,sorumlu_kullanici_id=COALESCE(sorumlu_kullanici_id,?),
                    guncelleyen_kullanici_id=?
                WHERE id=?");
            $stmt->execute([$stage,(int)$actor['id'],(int)$actor['id'],$caseId]);
            $stmt->closeCursor();

            ma_history_add(
                $pdo,$caseId,(int)$actor['id'],'durum','asama_'.$stage,
                'Mutabakat vaka aşaması '.(ma_stage_labels()[$stage]??$stage).' olarak değiştirildi.'
            );
        }
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
}

function ma_add_note(
    PDO $pdo,array $actor,int $caseId,string $note,?string $nextActionDate=null,?string $stage=null
): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $note=trim($note);
    if(mb_strlen($note)<2 || mb_strlen($note)>2000) throw new RuntimeException('Takip notu 2 ile 2000 karakter arasında olmalı.');

    $next=ma_validate_date($nextActionDate);
    if($next!==null && $next<date('Y-m-d')) throw new RuntimeException('Sonraki aksiyon tarihi geçmişte olamaz.');

    $stage=$stage!==null?trim($stage):null;
    if($stage!==null && $stage!=='' && !in_array($stage,['acik','incelemede','beklemede'],true)){
        throw new RuntimeException('Vaka aşaması geçersiz.');
    }

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=ma_case_row($pdo,$caseId,true);
        if(!$case) throw new RuntimeException('Mutabakat vakası bulunamadı.');
        if((string)$case['durum']==='kapali') throw new RuntimeException('Kaynak sorunu çözülmüş kapalı vakaya yeni operasyon notu eklenemez.');

        $newStage=$stage!==null && $stage!==''?$stage:((string)$case['durum']==='acik'?'incelemede':(string)$case['durum']);
        $stmt=$pdo->prepare("UPDATE ticari_mutabakat_vakalari
            SET durum=?,sorumlu_kullanici_id=COALESCE(sorumlu_kullanici_id,?),
                sonraki_aksiyon_tarihi=?,guncelleyen_kullanici_id=?
            WHERE id=?");
        $stmt->execute([$newStage,(int)$actor['id'],$next,(int)$actor['id'],$caseId]);
        $stmt->closeCursor();

        ma_history_add($pdo,$caseId,(int)$actor['id'],'not','takip_notu',$note);

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'mutabakat_vaka_not','Mutabakat vaka #'.$caseId);
}
