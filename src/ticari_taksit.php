<?php
declare(strict_types=1);

function tp_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'kurum_sozlesme_taksit_planlari')
        && auth_runtime_table_exists($pdo,'kurum_sozlesme_taksitleri')
        && auth_runtime_table_exists($pdo,'kurum_sozlesme_taksit_gecmisi');
}

function tp_plan_row(PDO $pdo,int $contractId,bool $forUpdate=false): ?array {
    if(!tp_tables_ready($pdo) || $contractId<=0) return null;
    $stmt=$pdo->prepare("SELECT
        p.sozlesme_id,p.kurum_id,p.durum,p.aktif_surum,
        p.olusturan_kullanici_id,p.guncelleyen_kullanici_id,
        p.olusturulma_tarihi,p.guncellenme_tarihi,
        s.sozlesme_no,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum sozlesme_durum
        FROM kurum_sozlesme_taksit_planlari p
        INNER JOIN kurum_sozlesmeleri s ON s.id=p.sozlesme_id AND s.kurum_id=p.kurum_id
        WHERE p.sozlesme_id=? LIMIT 1".($forUpdate?' FOR UPDATE':''));
    $stmt->execute([$contractId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function tp_history_add(
    PDO $pdo,int $contractId,int $institutionId,?int $userId,
    string $type,?string $code=null,?int $version=null,?string $note=null
): void {
    if(!tp_tables_ready($pdo) || $contractId<=0 || $institutionId<=0) return;
    $type=trim($type);
    $code=$code!==null?trim($code):null;
    $note=$note!==null?trim($note):null;
    if($type==='' || mb_strlen($type)>20) throw new RuntimeException('Taksit planı geçmiş türü geçersiz.');
    if($code!==null && mb_strlen($code)>40) throw new RuntimeException('Taksit planı geçmiş kodu geçersiz.');
    if($note!==null && mb_strlen($note)>2000) throw new RuntimeException('Taksit planı geçmiş notu çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesme_taksit_gecmisi
        (sozlesme_id,kurum_id,kullanici_id,tur,kod,surum_no,not_metni)
        VALUES (?,?,?,?,?,?,?)");
    $stmt->execute([
        $contractId,$institutionId,$userId && $userId>0?$userId:null,
        $type,$code!==''?$code:null,$version && $version>0?$version:null,$note!==''?$note:null
    ]);
    $stmt->closeCursor();
}

function tp_current_rows(PDO $pdo,int $contractId): array {
    $plan=tp_plan_row($pdo,$contractId,false);
    if(!$plan) return [];
    $stmt=$pdo->prepare("SELECT
        id,sozlesme_id,kurum_id,surum_no,sira_no,vade_tarihi,tutar,aciklama,
        olusturan_kullanici_id,olusturulma_tarihi
        FROM kurum_sozlesme_taksitleri
        WHERE sozlesme_id=? AND surum_no=?
        ORDER BY sira_no,id");
    $stmt->execute([$contractId,(int)$plan['aktif_surum']]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tp_parse_rows(array $input,array $contract): array {
    $dates=is_array($input['taksit_vade']??null)?$input['taksit_vade']:[];
    $amounts=is_array($input['taksit_tutar']??null)?$input['taksit_tutar']:[];
    $notes=is_array($input['taksit_aciklama']??null)?$input['taksit_aciklama']:[];
    $count=max(count($dates),count($amounts),count($notes));
    if($count>24) throw new RuntimeException('Bir sözleşmede en fazla 24 taksit olabilir.');

    $rows=[];
    for($i=0;$i<$count;$i++){
        $date=trim((string)($dates[$i]??''));
        $rawAmount=trim((string)($amounts[$i]??''));
        $note=trim((string)($notes[$i]??''));
        if($date==='' && $rawAmount==='' && $note==='') continue;
        $due=kl_validate_date($date,true);
        $amount=tf_money($rawAmount,'Taksit tutarı');
        if((float)$amount<=0) throw new RuntimeException('Taksit tutarı sıfırdan büyük olmalı.');
        if(mb_strlen($note)>500) throw new RuntimeException('Taksit açıklaması çok uzun.');
        if($due<(string)$contract['baslangic_tarihi']) throw new RuntimeException('Taksit vadesi sözleşme başlangıcından önce olamaz.');
        $rows[]=[
            'sira_no'=>count($rows)+1,
            'vade_tarihi'=>$due,
            'tutar'=>$amount,
            'aciklama'=>$note,
        ];
    }

    if(count($rows)<2) throw new RuntimeException('Taksit planı için en az 2 vade satırı gerekli.');

    $prev=null;
    $sum=0.0;
    foreach($rows as $row){
        if($prev!==null && (string)$row['vade_tarihi']<=$prev){
            throw new RuntimeException('Taksit vadeleri artan sırada ve birbirinden farklı olmalı.');
        }
        $prev=(string)$row['vade_tarihi'];
        $sum+=round((float)$row['tutar'],2);
    }
    $sum=round($sum,2);
    $contractTotal=round((float)$contract['toplam_tutar'],2);
    if(abs($sum-$contractTotal)>0.009){
        throw new RuntimeException('Taksit toplamı sözleşme toplamına eşit olmalı.');
    }

    return $rows;
}

function tp_payment_history_count(PDO $pdo,int $contractId): int {
    if($contractId<=0) return 0;
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM kurum_tahsilatlari WHERE sozlesme_id=?');
    $stmt->execute([$contractId]);
    $count=(int)$stmt->fetchColumn();
    $stmt->closeCursor();
    return max(0,$count);
}

function tp_save_plan(PDO $pdo,array $actor,int $contractId,array $input): int {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tp_tables_ready($pdo)) throw new RuntimeException('Taksit planı migrationı henüz kurulmamış.');
    if($contractId<=0) throw new RuntimeException('Sözleşme bulunamadı.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $lock=$pdo->prepare("SELECT
            id,kurum_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,
            toplam_tutar,para_birimi,durum
            FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $lock->execute([$contractId]);
        $contract=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($contract)) throw new RuntimeException('Sözleşme bulunamadı.');
        if((string)$contract['durum']==='iptal') throw new RuntimeException('İptal sözleşmeye taksit planı oluşturulamaz.');
        if(tp_payment_history_count($pdo,$contractId)>0){
            throw new RuntimeException('Tahsilat geçmişi başlayan sözleşmenin taksit planı değiştirilemez.');
        }

        $rows=tp_parse_rows($input,$contract);

        $planLock=$pdo->prepare('SELECT aktif_surum,durum FROM kurum_sozlesme_taksit_planlari WHERE sozlesme_id=? LIMIT 1 FOR UPDATE');
        $planLock->execute([$contractId]);
        $existing=$planLock->fetch(PDO::FETCH_ASSOC);
        $planLock->closeCursor();

        $version=is_array($existing)?((int)$existing['aktif_surum']+1):1;
        if($version>999999) throw new RuntimeException('Taksit planı sürüm sınırına ulaştı.');

        if(is_array($existing)){
            $stmt=$pdo->prepare("UPDATE kurum_sozlesme_taksit_planlari
                SET kurum_id=?,durum='taslak',aktif_surum=?,guncelleyen_kullanici_id=?
                WHERE sozlesme_id=?");
            $stmt->execute([(int)$contract['kurum_id'],$version,(int)$actor['id'],$contractId]);
            $stmt->closeCursor();
        }else{
            $stmt=$pdo->prepare("INSERT INTO kurum_sozlesme_taksit_planlari
                (sozlesme_id,kurum_id,durum,aktif_surum,olusturan_kullanici_id,guncelleyen_kullanici_id)
                VALUES (?,?,'taslak',1,?,?)");
            $stmt->execute([$contractId,(int)$contract['kurum_id'],(int)$actor['id'],(int)$actor['id']]);
            $stmt->closeCursor();
        }

        $insert=$pdo->prepare("INSERT INTO kurum_sozlesme_taksitleri
            (sozlesme_id,kurum_id,surum_no,sira_no,vade_tarihi,tutar,aciklama,olusturan_kullanici_id)
            VALUES (?,?,?,?,?,?,?,?)");
        foreach($rows as $row){
            $insert->execute([
                $contractId,(int)$contract['kurum_id'],$version,(int)$row['sira_no'],
                (string)$row['vade_tarihi'],(string)$row['tutar'],
                (string)$row['aciklama']!==''?(string)$row['aciklama']:null,(int)$actor['id']
            ]);
        }
        $insert->closeCursor();

        tp_history_add(
            $pdo,$contractId,(int)$contract['kurum_id'],(int)$actor['id'],
            'plan','surum_kaydet',$version,
            'Taksit planı sürüm '.$version.' kaydedildi. Taksit sayısı: '.count($rows)
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_taksit_plan_kaydet','Sözleşme #'.$contractId.' sürüm '.$version);
    return $version;
}

function tp_activate_plan(PDO $pdo,array $actor,int $contractId): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tp_tables_ready($pdo)) throw new RuntimeException('Taksit planı migrationı henüz kurulmamış.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $contractLock=$pdo->prepare("SELECT
            id,kurum_id,baslangic_tarihi,toplam_tutar,para_birimi,durum
            FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $contractLock->execute([$contractId]);
        $contract=$contractLock->fetch(PDO::FETCH_ASSOC);
        $contractLock->closeCursor();
        if(!is_array($contract)) throw new RuntimeException('Sözleşme bulunamadı.');
        if((string)$contract['durum']==='iptal') throw new RuntimeException('İptal sözleşmenin taksit planı aktifleştirilemez.');
        if(tp_payment_history_count($pdo,$contractId)>0){
            throw new RuntimeException('Tahsilat geçmişi başlayan sözleşmenin taksit planı değiştirilemez.');
        }

        $plan=tp_plan_row($pdo,$contractId,true);
        if(!$plan) throw new RuntimeException('Kaydedilmiş taksit planı bulunamadı.');
        $rows=tp_current_rows($pdo,$contractId);
        if(count($rows)<2) throw new RuntimeException('Aktifleştirmek için en az 2 taksit gerekli.');

        $sum=0.0;
        foreach($rows as $row)$sum+=round((float)$row['tutar'],2);
        if(abs(round($sum,2)-round((float)$contract['toplam_tutar'],2))>0.009){
            throw new RuntimeException('Taksit toplamı sözleşme toplamıyla artık eşleşmiyor. Planı yeniden kaydet.');
        }

        $stmt=$pdo->prepare("UPDATE kurum_sozlesme_taksit_planlari
            SET durum='aktif',guncelleyen_kullanici_id=?
            WHERE sozlesme_id=?");
        $stmt->execute([(int)$actor['id'],$contractId]);
        $stmt->closeCursor();

        tp_history_add(
            $pdo,$contractId,(int)$contract['kurum_id'],(int)$actor['id'],
            'plan','plan_aktif',(int)$plan['aktif_surum'],
            'Taksit planı aktif edildi.'
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_taksit_plan_aktif','Sözleşme #'.$contractId);
}

function tp_deactivate_plan(PDO $pdo,array $actor,int $contractId): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tp_tables_ready($pdo)) throw new RuntimeException('Taksit planı migrationı henüz kurulmamış.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $contractLock=$pdo->prepare("SELECT id,kurum_id,durum FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $contractLock->execute([$contractId]);
        $contract=$contractLock->fetch(PDO::FETCH_ASSOC);
        $contractLock->closeCursor();
        if(!is_array($contract)) throw new RuntimeException('Sözleşme bulunamadı.');
        if(tp_payment_history_count($pdo,$contractId)>0){
            throw new RuntimeException('Tahsilat geçmişi başlayan sözleşmenin aktif taksit planı kapatılamaz.');
        }

        $plan=tp_plan_row($pdo,$contractId,true);
        if(!$plan) throw new RuntimeException('Taksit planı bulunamadı.');
        if((string)$plan['durum']!=='aktif') throw new RuntimeException('Yalnız aktif taksit planı kapatılabilir.');

        $stmt=$pdo->prepare("UPDATE kurum_sozlesme_taksit_planlari
            SET durum='pasif',guncelleyen_kullanici_id=? WHERE sozlesme_id=?");
        $stmt->execute([(int)$actor['id'],$contractId]);
        $stmt->closeCursor();

        tp_history_add(
            $pdo,$contractId,(int)$contract['kurum_id'],(int)$actor['id'],
            'plan','plan_pasif',(int)$plan['aktif_surum'],
            'Taksit planı pasif duruma alındı. Sözleşme tek vade davranışına döndü.'
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_taksit_plan_pasif','Sözleşme #'.$contractId);
}

function tp_schedule_state(PDO $pdo,int $contractId): ?array {
    $plan=tp_plan_row($pdo,$contractId,false);
    if(!$plan || (string)$plan['durum']!=='aktif') return null;

    $rows=tp_current_rows($pdo,$contractId);
    if(!$rows) return null;

    $paid=(float)tf_contract_paid($pdo,$contractId);
    $remainingPaid=max(0,$paid);
    $today=date('Y-m-d');
    $outRows=[];
    $nextDue=null;
    $overdueAmount=0.0;
    $dueTodayAmount=0.0;
    $remainingPlan=0.0;

    foreach($rows as $row){
        $amount=round((float)$row['tutar'],2);
        $allocated=min($amount,$remainingPaid);
        $remainingPaid=max(0,$remainingPaid-$allocated);
        $remaining=max(0,$amount-$allocated);
        $due=(string)$row['vade_tarihi'];

        if($remaining<=0.009){
            $status='odendi';
        }elseif($allocated>0.009){
            $status=$due<$today?'gecikmis_kismi':'kismi';
        }elseif($due<$today){
            $status='gecikmis';
        }elseif($due===$today){
            $status='bugun';
        }else{
            $status='bekliyor';
        }

        if($remaining>0.009 && $nextDue===null)$nextDue=$due;
        if($remaining>0.009 && $due<$today)$overdueAmount+=$remaining;
        if($remaining>0.009 && $due===$today)$dueTodayAmount+=$remaining;
        $remainingPlan+=$remaining;

        $row['tahsis_edilen']=number_format($allocated,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $row['durum_hesap']=$status;
        $outRows[]=$row;
    }

    return [
        'sozlesme_id'=>$contractId,
        'kurum_id'=>(int)$plan['kurum_id'],
        'durum'=>(string)$plan['durum'],
        'surum_no'=>(int)$plan['aktif_surum'],
        'para_birimi'=>(string)$plan['para_birimi'],
        'toplam_tutar'=>(string)$plan['toplam_tutar'],
        'tahsil_edilen'=>number_format($paid,2,'.',''),
        'kalan_plan'=>number_format(max(0,$remainingPlan),2,'.',''),
        'sonraki_vade'=>$nextDue,
        'gecikmis_tutar'=>number_format(max(0,$overdueAmount),2,'.',''),
        'bugun_tutar'=>number_format(max(0,$dueTodayAmount),2,'.',''),
        'taksitler'=>$outRows,
    ];
}

function tp_plan_summaries(PDO $pdo,array $contractIds): array {
    if(!tp_tables_ready($pdo)) return [];
    $ids=array_values(array_unique(array_filter(array_map('intval',$contractIds),static fn(int $id):bool=>$id>0)));
    if(!$ids) return [];
    $out=[];
    foreach($ids as $id){
        $plan=tp_plan_row($pdo,$id,false);
        if(!$plan) continue;
        $state=tp_schedule_state($pdo,$id);
        $out[$id]=[
            'durum'=>(string)$plan['durum'],
            'surum_no'=>(int)$plan['aktif_surum'],
            'sonraki_vade'=>$state['sonraki_vade']??null,
            'gecikmis_tutar'=>$state['gecikmis_tutar']??'0.00',
            'kalan_plan'=>$state['kalan_plan']??null,
            'taksit_sayisi'=>count(tp_current_rows($pdo,$id)),
            'kilitli'=>tp_payment_history_count($pdo,$id)>0,
        ];
    }
    return $out;
}

function tp_history_rows(PDO $pdo,int $contractId,int $limit=100): array {
    if(!tp_tables_ready($pdo) || $contractId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.id,g.tur,g.kod,g.surum_no,g.not_metni,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM kurum_sozlesme_taksit_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        WHERE g.sozlesme_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$contractId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}
