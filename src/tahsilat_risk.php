<?php
declare(strict_types=1);

function tr_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_tahsilat_takipleri')
        && auth_runtime_table_exists($pdo,'ticari_tahsilat_takip_gecmisi');
}

function tr_stage_labels(): array {
    return [
        'acik'=>'Açık',
        'temas'=>'Temas Edildi',
        'odeme_sozu'=>'Ödeme Sözü',
        'ihtilaf'=>'İhtilaf / İnceleme',
        'kapali'=>'Kapalı',
    ];
}

function tr_open_stages(): array {
    return ['acik','temas','odeme_sozu','ihtilaf'];
}

function tr_history_add(
    PDO $pdo,
    int $contractId,
    int $institutionId,
    ?int $userId,
    string $type,
    ?string $code=null,
    ?string $note=null
): void {
    if(!tr_tables_ready($pdo) || $contractId<=0 || $institutionId<=0) return;
    $type=trim($type);
    $code=$code!==null?trim($code):null;
    $note=$note!==null?trim($note):null;
    if($type==='' || mb_strlen($type)>20) throw new RuntimeException('Takip geçmiş türü geçersiz.');
    if($code!==null && mb_strlen($code)>40) throw new RuntimeException('Takip geçmiş kodu geçersiz.');
    if($note!==null && mb_strlen($note)>2000) throw new RuntimeException('Takip notu çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO ticari_tahsilat_takip_gecmisi
        (sozlesme_id,kurum_id,kullanici_id,tur,kod,not_metni)
        VALUES (?,?,?,?,?,?)");
    $stmt->execute([
        $contractId,$institutionId,
        $userId && $userId>0?$userId:null,
        $type,$code!==''?$code:null,$note!==''?$note:null
    ]);
    $stmt->closeCursor();
}

function tr_contract_financial_state(PDO $pdo,int $contractId,bool $forUpdate=false): ?array {
    if(!tf_tables_ready($pdo) || $contractId<=0) return null;
    $sql="SELECT
        s.id sozlesme_id,s.kurum_id,s.sozlesme_no,s.paket_id,s.vade_tarihi,s.bitis_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum sozlesme_durum,
        k.ad kurum_adi,
        p.ad paket_adi,
        COALESCE(pay.tahsil_edilen,0) tahsil_edilen,
        COALESCE(pay.tahsilat_gecmisi,0) tahsilat_gecmisi,
        COALESCE(pay.aktif_tahsilat_sayisi,0) aktif_tahsilat_sayisi
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN paketler p ON p.id=s.paket_id
        LEFT JOIN (
          SELECT
            sozlesme_id,
            SUM(CASE WHEN durum='aktif' THEN tutar ELSE 0 END) tahsil_edilen,
            COUNT(*) tahsilat_gecmisi,
            SUM(CASE WHEN durum='aktif' THEN 1 ELSE 0 END) aktif_tahsilat_sayisi
          FROM kurum_tahsilatlari
          GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        WHERE s.id=?
        LIMIT 1".($forUpdate?' FOR UPDATE':'');
    $stmt=$pdo->prepare($sql);
    $stmt->execute([$contractId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;
    $total=(float)$row['toplam_tutar'];
    $paid=(float)$row['tahsil_edilen'];
    $row['tahsil_edilen']=number_format($paid,2,'.','');
    $row['kalan_tutar']=number_format(max(0,$total-$paid),2,'.','');
    return $row;
}

function tr_risk_bucket(?string $dueDate,?string $today=null): array {
    $today=$today?:date('Y-m-d');
    if($dueDate===null || trim($dueDate)===''){
        return ['kod'=>'vade_yok','etiket'=>'Vade tarihi eksik','seviye'=>'orta','gecikme_gunu'=>null];
    }

    $due=DateTimeImmutable::createFromFormat('!Y-m-d',$dueDate);
    $base=DateTimeImmutable::createFromFormat('!Y-m-d',$today);
    if(!$due || !$base){
        return ['kod'=>'vade_yok','etiket'=>'Vade tarihi geçersiz','seviye'=>'orta','gecikme_gunu'=>null];
    }

    $days=(int)$due->diff($base)->format('%r%a');
    if($days<0){
        return [
            'kod'=>'yaklasan',
            'etiket'=>abs($days).' gün içinde vade',
            'seviye'=>'dusuk',
            'gecikme_gunu'=>$days
        ];
    }
    if($days<=7) return ['kod'=>'0_7','etiket'=>'0–7 gün gecikme','seviye'=>'dusuk','gecikme_gunu'=>$days];
    if($days<=15) return ['kod'=>'8_15','etiket'=>'8–15 gün gecikme','seviye'=>'orta','gecikme_gunu'=>$days];
    if($days<=30) return ['kod'=>'16_30','etiket'=>'16–30 gün gecikme','seviye'=>'yuksek','gecikme_gunu'=>$days];
    return ['kod'=>'31_plus','etiket'=>'31+ gün gecikme','seviye'=>'kritik','gecikme_gunu'=>$days];
}

function tr_should_track(array $financial,?string $today=null): bool {
    $today=$today?:date('Y-m-d');
    if((string)($financial['sozlesme_durum']??'')!=='aktif') return false;
    if((float)($financial['kalan_tutar']??0)<=0.009) return false;

    $due=trim((string)($financial['vade_tarihi']??''));
    if($due==='') return true;

    $dueDate=DateTimeImmutable::createFromFormat('!Y-m-d',$due);
    $base=DateTimeImmutable::createFromFormat('!Y-m-d',$today);
    if(!$dueDate || !$base) return true;

    $daysUntil=(int)$base->diff($dueDate)->format('%r%a');
    return $daysUntil<=7;
}

function tr_sync_cases(PDO $pdo,?array $actor=null): array {
    if(!tr_tables_ready($pdo)) return ['created'=>0,'reopened'=>0,'closed'=>0];
    $userId=is_array($actor)?max(0,(int)($actor['id']??0)):0;
    $created=0;
    $reopened=0;
    $closed=0;

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->query("SELECT s.id
            FROM kurum_sozlesmeleri s
            WHERE s.durum='aktif'
              AND s.toplam_tutar-COALESCE((
                SELECT SUM(t.tutar)
                FROM kurum_tahsilatlari t
                WHERE t.sozlesme_id=s.id AND t.durum='aktif'
              ),0)>0.009
              AND (
                s.vade_tarihi IS NULL
                OR s.vade_tarihi<=DATE_ADD(CURDATE(),INTERVAL 7 DAY)
              )
            ORDER BY s.id
            FOR UPDATE");
        $candidateIds=$stmt?$stmt->fetchAll(PDO::FETCH_COLUMN):[];
        if($stmt)$stmt->closeCursor();

        $insert=$pdo->prepare("INSERT IGNORE INTO ticari_tahsilat_takipleri
            (sozlesme_id,kurum_id,durum,olusturan_kullanici_id,guncelleyen_kullanici_id)
            SELECT id,kurum_id,'acik',?,?
            FROM kurum_sozlesmeleri
            WHERE id=?");
        foreach($candidateIds as $candidateId){
            $contractId=(int)$candidateId;
            $financial=tr_contract_financial_state($pdo,$contractId,true);
            if(!$financial || !tr_should_track($financial)) continue;

            $insert->execute([$userId>0?$userId:null,$userId>0?$userId:null,$contractId]);
            if($insert->rowCount()>0){
                $created++;
                tr_history_add(
                    $pdo,$contractId,(int)$financial['kurum_id'],$userId>0?$userId:null,
                    'durum','vaka_acildi','Tahsilat takip vakası finansal risk penceresine girince açıldı.'
                );
                continue;
            }

            $lock=$pdo->prepare("SELECT durum FROM ticari_tahsilat_takipleri WHERE sozlesme_id=? LIMIT 1 FOR UPDATE");
            $lock->execute([$contractId]);
            $current=(string)($lock->fetchColumn()?:'');
            $lock->closeCursor();
            if($current==='kapali'){
                $stmt=$pdo->prepare("UPDATE ticari_tahsilat_takipleri
                    SET durum='acik',kapanma_kodu=NULL,kapanma_tarihi=NULL,
                        sonraki_aksiyon_tarihi=NULL,guncelleyen_kullanici_id=?
                    WHERE sozlesme_id=? AND durum='kapali'");
                $stmt->execute([$userId>0?$userId:null,$contractId]);
                if($stmt->rowCount()===1){
                    $reopened++;
                    tr_history_add(
                        $pdo,$contractId,(int)$financial['kurum_id'],$userId>0?$userId:null,
                        'durum','vaka_yeniden_acildi','Sözleşme yeniden tahsilat risk penceresine girdi.'
                    );
                }
                $stmt->closeCursor();
            }
        }
        $insert->closeCursor();

        $stmt=$pdo->query("SELECT sozlesme_id,kurum_id
            FROM ticari_tahsilat_takipleri
            WHERE durum IN ('acik','temas','odeme_sozu','ihtilaf')
            ORDER BY sozlesme_id
            FOR UPDATE");
        $openRows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
        if($stmt)$stmt->closeCursor();

        $close=$pdo->prepare("UPDATE ticari_tahsilat_takipleri
            SET durum='kapali',kapanma_kodu=?,kapanma_tarihi=NOW(),
                sonraki_aksiyon_tarihi=NULL,guncelleyen_kullanici_id=?
            WHERE sozlesme_id=? AND durum IN ('acik','temas','odeme_sozu','ihtilaf')");
        foreach($openRows as $row){
            $contractId=(int)$row['sozlesme_id'];
            $financial=tr_contract_financial_state($pdo,$contractId,true);
            $closeCode=null;
            $closeNote=null;

            if(!$financial){
                $closeCode='sozlesme_kaydi_yok';
                $closeNote='Sözleşme kaydı bulunamadığı için takip vakası kapatıldı.';
            }elseif((string)$financial['sozlesme_durum']==='tamamlandi' || (float)$financial['kalan_tutar']<=0.009){
                $closeCode='tahsilat_tamamlandi';
                $closeNote='Sözleşmenin açık bakiyesi kalmadığı için takip vakası otomatik kapatıldı.';
            }elseif((string)$financial['sozlesme_durum']==='iptal'){
                $closeCode='sozlesme_iptal';
                $closeNote='Sözleşme iptal edildiği için takip vakası otomatik kapatıldı.';
            }elseif((string)$financial['sozlesme_durum']==='taslak'){
                $closeCode='sozlesme_taslak';
                $closeNote='Sözleşme taslak duruma alındığı için tahsilat takip vakası kapatıldı.';
            }elseif(!tr_should_track($financial)){
                $closeCode='risk_penceresi_disinda';
                $closeNote='Vade tarihi tahsilat risk penceresinin dışına taşındığı için takip vakası kapatıldı.';
            }

            if($closeCode!==null){
                $close->execute([$closeCode,$userId>0?$userId:null,$contractId]);
                if($close->rowCount()===1){
                    $closed++;
                    tr_history_add(
                        $pdo,$contractId,(int)$row['kurum_id'],$userId>0?$userId:null,
                        'durum',$closeCode,$closeNote
                    );
                }
            }
        }
        $close->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    return ['created'=>$created,'reopened'=>$reopened,'closed'=>$closed];
}

function tr_queue_rows(PDO $pdo,array $filters=[],int $limit=500): array {
    if(!tr_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=['1=1'];
    $params=[];

    $stage=trim((string)($filters['durum']??'open'));
    if($stage==='open'){
        $where[]="f.durum IN ('acik','temas','odeme_sozu','ihtilaf')";
    }elseif($stage!=='' && array_key_exists($stage,tr_stage_labels())){
        $where[]='f.durum=?';
        $params[]=$stage;
    }

    $renewalJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ?"LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.sozlesme_id=s.id AND lys.kurum_id=s.kurum_id"
        :"LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL yenileme_id) lys ON 1=0";

    $stmt=$pdo->prepare("SELECT
        f.sozlesme_id,f.kurum_id,f.durum,f.sorumlu_kullanici_id,f.son_temas_tarihi,
        f.sonraki_aksiyon_tarihi,f.kapanma_kodu,f.kapanma_tarihi,
        f.olusturulma_tarihi,f.guncellenme_tarihi,
        s.sozlesme_no,s.paket_id,s.vade_tarihi,s.bitis_tarihi,s.toplam_tutar,s.para_birimi,s.durum sozlesme_durum,
        k.ad kurum_adi,p.ad paket_adi,
        COALESCE(pay.tahsil_edilen,0) tahsil_edilen,
        lys.yenileme_id,
        COALESCE(u.ad_soyad,'—') sorumlu_adi,
        (SELECT COUNT(*) FROM ticari_tahsilat_takip_gecmisi g WHERE g.sozlesme_id=f.sozlesme_id) gecmis_sayisi
        FROM ticari_tahsilat_takipleri f
        LEFT JOIN kurum_sozlesmeleri s ON s.id=f.sozlesme_id AND s.kurum_id=f.kurum_id
        LEFT JOIN kurumlar k ON k.id=f.kurum_id
        LEFT JOIN paketler p ON p.id=s.paket_id
        LEFT JOIN (
          SELECT sozlesme_id,SUM(CASE WHEN durum='aktif' THEN tutar ELSE 0 END) tahsil_edilen
          FROM kurum_tahsilatlari
          GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$renewalJoin}
        LEFT JOIN kullanicilar u ON u.id=f.sorumlu_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE WHEN f.durum='kapali' THEN 1 ELSE 0 END,
          CASE
            WHEN s.vade_tarihi IS NULL THEN 1
            WHEN s.vade_tarihi<CURDATE() THEN 0
            ELSE 2
          END,
          s.vade_tarihi,
          f.sozlesme_id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    $riskFilter=trim((string)($filters['risk']??''));
    $renewalOnly=(string)($filters['yenileme']??'')==='1';
    $out=[];
    $today=date('Y-m-d');
    foreach($rows as $row){
        $total=(float)($row['toplam_tutar']??0);
        $paid=(float)($row['tahsil_edilen']??0);
        $remaining=max(0,$total-$paid);
        $risk=tr_risk_bucket(($row['vade_tarihi']??null)!==null?(string)$row['vade_tarihi']:null,$today);
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $row['risk_kodu']=$risk['kod'];
        $row['risk_etiketi']=$risk['etiket'];
        $row['risk_seviyesi']=$risk['seviye'];
        $row['gecikme_gunu']=$risk['gecikme_gunu'];
        $row['yenileme_baglantili']=(int)($row['yenileme_id']??0)>0;
        $row['yenileme_gecikmis']=$row['yenileme_baglantili']
            && in_array((string)$risk['kod'],['0_7','8_15','16_30','31_plus'],true)
            && $remaining>0.009;

        if($riskFilter!=='' && (string)$risk['kod']!==$riskFilter) continue;
        if($renewalOnly && !$row['yenileme_gecikmis']) continue;
        $out[]=$row;
    }
    return $out;
}

function tr_summary(PDO $pdo): array {
    $out=[
        'open'=>0,'yaklasan'=>0,'0_7'=>0,'8_15'=>0,'16_30'=>0,'31_plus'=>0,'vade_yok'=>0,
        'yenileme_gecikmis'=>0,'aksiyon_bekleyen'=>0
    ];
    if(!tr_tables_ready($pdo)) return $out;
    foreach(tr_queue_rows($pdo,['durum'=>'open'],1000) as $row){
        $out['open']++;
        $risk=(string)($row['risk_kodu']??'');
        if(array_key_exists($risk,$out)) $out[$risk]++;
        if(!empty($row['yenileme_gecikmis'])) $out['yenileme_gecikmis']++;
        $next=(string)($row['sonraki_aksiyon_tarihi']??'');
        if($next!=='' && $next<=date('Y-m-d')) $out['aksiyon_bekleyen']++;
    }
    return $out;
}

function tr_currency_exposure(PDO $pdo): array {
    if(!tr_tables_ready($pdo)) return [];
    $rows=tr_queue_rows($pdo,['durum'=>'open'],1000);
    $out=[];
    foreach($rows as $row){
        $currency=(string)($row['para_birimi']??'TRY');
        if(!isset($out[$currency])){
            $out[$currency]=[
                'para_birimi'=>$currency,'acik_bakiye'=>0.0,'gecikmis_bakiye'=>0.0,
                'kritik_bakiye'=>0.0,'sozlesme_sayisi'=>0
            ];
        }
        $remaining=(float)$row['kalan_tutar'];
        $out[$currency]['acik_bakiye']+=$remaining;
        $out[$currency]['sozlesme_sayisi']++;
        if(in_array((string)$row['risk_kodu'],['0_7','8_15','16_30','31_plus'],true)){
            $out[$currency]['gecikmis_bakiye']+=$remaining;
        }
        if((string)$row['risk_kodu']==='31_plus'){
            $out[$currency]['kritik_bakiye']+=$remaining;
        }
    }
    foreach($out as &$row){
        $row['acik_bakiye']=number_format((float)$row['acik_bakiye'],2,'.','');
        $row['gecikmis_bakiye']=number_format((float)$row['gecikmis_bakiye'],2,'.','');
        $row['kritik_bakiye']=number_format((float)$row['kritik_bakiye'],2,'.','');
    }
    unset($row);
    return array_values($out);
}

function tr_case_row(PDO $pdo,int $contractId,bool $forUpdate=false): ?array {
    if(!tr_tables_ready($pdo) || $contractId<=0) return null;
    $stmt=$pdo->prepare("SELECT * FROM ticari_tahsilat_takipleri
        WHERE sozlesme_id=? LIMIT 1".($forUpdate?' FOR UPDATE':''));
    $stmt->execute([$contractId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function tr_case_detail(PDO $pdo,int $contractId): ?array {
    if(!tr_tables_ready($pdo) || $contractId<=0) return null;
    $case=tr_case_row($pdo,$contractId,false);
    if(!$case) return null;
    $financial=tr_contract_financial_state($pdo,$contractId,false);

    $row=array_merge($case,$financial??[
        'sozlesme_id'=>$contractId,'kurum_id'=>(int)$case['kurum_id'],'sozlesme_no'=>'—',
        'paket_id'=>null,'vade_tarihi'=>null,'bitis_tarihi'=>null,'toplam_tutar'=>'0.00',
        'para_birimi'=>'TRY','sozlesme_durum'=>'kayit_yok','kurum_adi'=>'—','paket_adi'=>'—',
        'tahsil_edilen'=>'0.00','kalan_tutar'=>'0.00'
    ]);

    $risk=tr_risk_bucket(($row['vade_tarihi']??null)!==null?(string)$row['vade_tarihi']:null);
    $row['risk_kodu']=$risk['kod'];
    $row['risk_etiketi']=$risk['etiket'];
    $row['risk_seviyesi']=$risk['seviye'];
    $row['gecikme_gunu']=$risk['gecikme_gunu'];
    $row['yenileme_id']=null;

    if(auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')){
        $stmt=$pdo->prepare("SELECT yenileme_id
            FROM lisans_yenileme_sozlesmeleri
            WHERE sozlesme_id=? AND kurum_id=? LIMIT 1");
        $stmt->execute([$contractId,(int)$row['kurum_id']]);
        $renewalId=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        if($renewalId>0)$row['yenileme_id']=$renewalId;
    }

    $row['sorumlu_adi']='—';
    if((int)($case['sorumlu_kullanici_id']??0)>0){
        $stmt=$pdo->prepare('SELECT ad_soyad FROM kullanicilar WHERE id=? LIMIT 1');
        $stmt->execute([(int)$case['sorumlu_kullanici_id']]);
        $row['sorumlu_adi']=(string)($stmt->fetchColumn()?:'—');
        $stmt->closeCursor();
    }

    return $row;
}

function tr_history_rows(PDO $pdo,int $contractId,int $limit=200): array {
    if(!tr_tables_ready($pdo) || $contractId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.id,g.tur,g.kod,g.not_metni,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM ticari_tahsilat_takip_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        WHERE g.sozlesme_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$contractId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tr_set_stage(PDO $pdo,array $actor,int $contractId,string $stage): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!in_array($stage,['acik','temas','odeme_sozu','ihtilaf'],true)) throw new RuntimeException('Takip aşaması geçersiz.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=tr_case_row($pdo,$contractId,true);
        if(!$case) throw new RuntimeException('Tahsilat takip vakası bulunamadı.');
        if((string)$case['durum']==='kapali') throw new RuntimeException('Finansal risk devam etmeyen kapalı vaka değiştirilemez.');

        if((string)$case['durum']!==$stage){
            $stmt=$pdo->prepare("UPDATE ticari_tahsilat_takipleri
                SET durum=?,sorumlu_kullanici_id=COALESCE(sorumlu_kullanici_id,?),
                    guncelleyen_kullanici_id=? WHERE sozlesme_id=?");
            $stmt->execute([$stage,(int)$actor['id'],(int)$actor['id'],$contractId]);
            $stmt->closeCursor();
            tr_history_add(
                $pdo,$contractId,(int)$case['kurum_id'],(int)$actor['id'],
                'durum','asama_'.$stage,'Tahsilat takip aşaması '.(tr_stage_labels()[$stage]??$stage).' olarak değiştirildi.'
            );
        }
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
}

function tr_add_note(PDO $pdo,array $actor,int $contractId,string $note,?string $nextActionDate=null,?string $stage=null): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $note=trim($note);
    if(mb_strlen($note)<2 || mb_strlen($note)>2000) throw new RuntimeException('Takip notu 2 ile 2000 karakter arasında olmalı.');
    $next=kl_validate_date((string)($nextActionDate??''),false);
    if($next!==null && $next<date('Y-m-d')) throw new RuntimeException('Sonraki aksiyon tarihi geçmişte olamaz.');
    $stage=$stage!==null?trim($stage):null;
    if($stage!==null && $stage!=='' && !in_array($stage,['acik','temas','odeme_sozu','ihtilaf'],true)){
        throw new RuntimeException('Takip aşaması geçersiz.');
    }

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $case=tr_case_row($pdo,$contractId,true);
        if(!$case) throw new RuntimeException('Tahsilat takip vakası bulunamadı.');
        if((string)$case['durum']==='kapali') throw new RuntimeException('Kapalı tahsilat takip vakasına yeni operasyon notu eklenemez.');

        $newStage=$stage!==null && $stage!==''?$stage:((string)$case['durum']==='acik'?'temas':(string)$case['durum']);
        $stmt=$pdo->prepare("UPDATE ticari_tahsilat_takipleri
            SET durum=?,sorumlu_kullanici_id=COALESCE(sorumlu_kullanici_id,?),
                son_temas_tarihi=CURDATE(),sonraki_aksiyon_tarihi=?,guncelleyen_kullanici_id=?
            WHERE sozlesme_id=?");
        $stmt->execute([$newStage,(int)$actor['id'],$next,(int)$actor['id'],$contractId]);
        $stmt->closeCursor();

        tr_history_add(
            $pdo,$contractId,(int)$case['kurum_id'],(int)$actor['id'],
            'not','takip_notu',$note
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'tahsilat_risk_not','Sözleşme #'.$contractId);
}
