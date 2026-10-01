<?php
declare(strict_types=1);

function tf_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'kurum_sozlesmeleri')
        && auth_runtime_table_exists($pdo,'kurum_tahsilatlari');
}

function tf_currency(string $value): string {
    $currency=mb_strtoupper(trim($value),'UTF-8');
    if(!in_array($currency,['TRY','USD','EUR'],true)) throw new RuntimeException('Para birimi geçersiz.');
    return $currency;
}

function tf_money(mixed $value,string $label='Tutar'): string {
    $raw=str_replace([' ','₺'],['',''],trim((string)$value));
    if(str_contains($raw,',') && str_contains($raw,'.')){
        $raw=str_replace('.','',$raw);
        $raw=str_replace(',','.',$raw);
    }else{
        $raw=str_replace(',','.',$raw);
    }
    if($raw==='' || !is_numeric($raw)) throw new RuntimeException($label.' geçersiz.');
    $amount=round((float)$raw,2);
    if($amount<0 || $amount>999999999999.99) throw new RuntimeException($label.' geçersiz.');
    return number_format($amount,2,'.','');
}

function tf_decimal_compare(string $a,string $b): int {
    $af=(float)$a;
    $bf=(float)$b;
    return $af<=>$bf;
}

function tf_contract_paid(PDO $pdo,int $contractId): string {
    $stmt=$pdo->prepare("SELECT COALESCE(SUM(tutar),0)
        FROM kurum_tahsilatlari
        WHERE sozlesme_id=? AND durum='aktif'");
    $stmt->execute([$contractId]);
    $paid=number_format((float)($stmt->fetchColumn()?:0),2,'.','');
    $stmt->closeCursor();
    return $paid;
}

function tf_contract_payment_counts(PDO $pdo,int $contractId): array {
    $stmt=$pdo->prepare("SELECT
        COUNT(*) toplam,
        SUM(CASE WHEN durum='aktif' THEN 1 ELSE 0 END) aktif
        FROM kurum_tahsilatlari
        WHERE sozlesme_id=?");
    $stmt->execute([$contractId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return [
        'toplam'=>max(0,(int)($row['toplam']??0)),
        'aktif'=>max(0,(int)($row['aktif']??0)),
    ];
}

function tf_normalize_contract_status(string $requested,string $total,string $paid,array $paymentCounts): string {
    $history=max(0,(int)($paymentCounts['toplam']??0));
    $active=max(0,(int)($paymentCounts['aktif']??0));
    $isFullyPaid=tf_decimal_compare($paid,$total)>=0;

    if($requested==='iptal'){
        if($active>0) throw new RuntimeException('Aktif tahsilatı olan sözleşme iptal edilemez. Önce aktif tahsilatları iptal et.');
        return 'iptal';
    }

    if($requested==='taslak'){
        if($history>0) throw new RuntimeException('Tahsilat geçmişi olan sözleşme taslak durumuna alınamaz.');
        return 'taslak';
    }

    return $isFullyPaid?'tamamlandi':'aktif';
}

function tf_contract_rows(PDO $pdo,int $limit=200): array {
    if(!tf_tables_ready($pdo)) return [];
    $limit=max(1,min(500,$limit));
    $sql="SELECT
        s.id,s.kurum_id,s.paket_id,s.sozlesme_no,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum,s.notlar,s.olusturulma_tarihi,s.guncellenme_tarihi,
        k.ad kurum_adi,k.kod kurum_kodu,
        p.ad paket_adi,p.kod paket_kodu,
        COALESCE(SUM(CASE WHEN t.durum='aktif' THEN t.tutar ELSE 0 END),0) tahsil_edilen
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN paketler p ON p.id=s.paket_id
        LEFT JOIN kurum_tahsilatlari t ON t.sozlesme_id=s.id
        GROUP BY s.id,s.kurum_id,s.paket_id,s.sozlesme_no,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
            s.toplam_tutar,s.para_birimi,s.durum,s.notlar,s.olusturulma_tarihi,s.guncellenme_tarihi,
            k.ad,k.kod,p.ad,p.kod
        ORDER BY
          CASE s.durum WHEN 'aktif' THEN 0 WHEN 'taslak' THEN 1 WHEN 'tamamlandi' THEN 2 ELSE 3 END,
          COALESCE(s.vade_tarihi,s.bitis_tarihi,'9999-12-31'),
          s.id DESC
        LIMIT {$limit}";
    $stmt=$pdo->query($sql);
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    if(!is_array($rows)) return [];
    $today=date('Y-m-d');
    foreach($rows as &$row){
        $total=round((float)$row['toplam_tutar'],2);
        $paid=round((float)$row['tahsil_edilen'],2);
        $remaining=max(0,$total-$paid);
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $due=(string)($row['vade_tarihi']??'');
        $row['gecikmis']=$row['durum']==='aktif' && $remaining>0.009 && $due!=='' && $due<$today;
    }
    unset($row);
    return $rows;
}

function tf_payment_rows(PDO $pdo,int $limit=100): array {
    if(!tf_tables_ready($pdo)) return [];
    $limit=max(1,min(500,$limit));
    $sql="SELECT
        t.id,t.sozlesme_id,t.kurum_id,t.tahsilat_tarihi,t.tutar,t.para_birimi,t.odeme_yontemi,
        t.referans_no,t.notlar,t.durum,t.iptal_nedeni,t.iptal_tarihi,t.olusturulma_tarihi,
        s.sozlesme_no,k.ad kurum_adi,
        CASE WHEN s.kurum_id<>t.kurum_id THEN 1 ELSE 0 END kurum_tutarsiz
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        ORDER BY t.tahsilat_tarihi DESC,t.id DESC
        LIMIT {$limit}";
    $stmt=$pdo->query($sql);
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tf_financial_summary(PDO $pdo): array {
    if(!tf_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        s.para_birimi,
        COALESCE(SUM(s.toplam_tutar),0) sozlesme_toplami,
        COALESCE(SUM(COALESCE(p.tahsil_edilen,0)),0) tahsil_edilen
        FROM kurum_sozlesmeleri s
        LEFT JOIN (
            SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen
            FROM kurum_tahsilatlari
            WHERE durum='aktif'
            GROUP BY sozlesme_id
        ) p ON p.sozlesme_id=s.id
        WHERE s.durum IN ('aktif','tamamlandi')
        GROUP BY s.para_birimi
        ORDER BY FIELD(s.para_birimi,'TRY','USD','EUR'),s.para_birimi");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt) $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $contract=(float)$row['sozlesme_toplami'];
        $paid=(float)$row['tahsil_edilen'];
        $row['sozlesme_toplami']=number_format($contract,2,'.','');
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format(max(0,$contract-$paid),2,'.','');
    }
    unset($row);
    return $rows;
}

function tf_integrity_issues(PDO $pdo): array {
    if(!tf_tables_ready($pdo)) return [];
    $issues=[];

    $stmt=$pdo->query("SELECT COUNT(*)
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id
        WHERE t.kurum_id<>s.kurum_id");
    $mismatch=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($mismatch>0)$issues[]=[
        'kod'=>'payment_institution_mismatch',
        'adet'=>$mismatch,
        'mesaj'=>'Tahsilat kurumu ile sözleşme kurumu eşleşmeyen geçmiş kayıt var.',
    ];

    $stmt=$pdo->query("SELECT COUNT(DISTINCT s.id)
        FROM kurum_sozlesmeleri s
        INNER JOIN kurum_tahsilatlari t ON t.sozlesme_id=s.id AND t.durum='aktif'
        WHERE s.durum='iptal'");
    $cancelledWithActive=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($cancelledWithActive>0)$issues[]=[
        'kod'=>'cancelled_contract_active_payment',
        'adet'=>$cancelledWithActive,
        'mesaj'=>'İptal durumda olup aktif tahsilatı bulunan sözleşme var.',
    ];

    $stmt=$pdo->query("SELECT COUNT(*) FROM (
        SELECT s.id,s.durum,s.toplam_tutar,
               COALESCE(SUM(CASE WHEN t.durum='aktif' THEN t.tutar ELSE 0 END),0) paid
        FROM kurum_sozlesmeleri s
        LEFT JOIN kurum_tahsilatlari t ON t.sozlesme_id=s.id
        WHERE s.durum IN ('aktif','tamamlandi')
        GROUP BY s.id,s.durum,s.toplam_tutar
        HAVING (s.durum='tamamlandi' AND paid+0.009<s.toplam_tutar)
            OR (s.durum='aktif' AND paid+0.009>=s.toplam_tutar)
    ) x");
    $statusMismatch=(int)($stmt?$stmt->fetchColumn():0);
    if($stmt)$stmt->closeCursor();
    if($statusMismatch>0)$issues[]=[
        'kod'=>'contract_status_balance_mismatch',
        'adet'=>$statusMismatch,
        'mesaj'=>'Tahsilat bakiyesi ile sözleşme durumu uyuşmayan kayıt var.',
    ];

    return $issues;
}

function tf_license_renewal_rows(PDO $pdo,int $days=30): array {
    if(!auth_runtime_table_exists($pdo,'kurum_lisanslari')) return [];
    $days=max(1,min(365,$days));
    $stmt=$pdo->prepare("SELECT
        kl.id,kl.kurum_id,kl.bitis_tarihi,kl.durum,
        k.ad kurum_adi,p.ad paket_adi,
        DATEDIFF(kl.bitis_tarihi,CURDATE()) kalan_gun
        FROM kurum_lisanslari kl
        INNER JOIN kurumlar k ON k.id=kl.kurum_id
        INNER JOIN paketler p ON p.id=kl.paket_id
        WHERE kl.bitis_tarihi IS NOT NULL
          AND kl.durum IN ('aktif','deneme')
          AND DATEDIFF(kl.bitis_tarihi,CURDATE())<=?
        ORDER BY kl.bitis_tarihi,k.ad");
    $stmt->execute([$days]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tf_validate_contract(array $input): array {
    $institutionId=max(0,(int)($input['kurum_id']??0));
    $packageId=max(0,(int)($input['paket_id']??0));
    $number=trim((string)($input['sozlesme_no']??''));
    $start=kl_validate_date((string)($input['baslangic_tarihi']??''),true);
    $end=kl_validate_date((string)($input['bitis_tarihi']??''),false);
    $due=kl_validate_date((string)($input['vade_tarihi']??''),false);
    $total=tf_money($input['toplam_tutar']??'0','Sözleşme tutarı');
    $currency=tf_currency((string)($input['para_birimi']??'TRY'));
    $status=(string)($input['durum']??'aktif');
    $notes=trim((string)($input['notlar']??''));

    if($institutionId<=0) throw new RuntimeException('Kurum seç.');
    if(mb_strlen($number)<2 || mb_strlen($number)>80) throw new RuntimeException('Sözleşme numarasını kontrol et.');
    if($end!==null && $start!==null && $end<$start) throw new RuntimeException('Bitiş tarihi başlangıç tarihinden önce olamaz.');
    if($due!==null && $start!==null && $due<$start) throw new RuntimeException('Vade tarihi başlangıç tarihinden önce olamaz.');
    if((float)$total<=0) throw new RuntimeException('Sözleşme tutarı sıfırdan büyük olmalı.');
    if(!in_array($status,['taslak','aktif','tamamlandi','iptal'],true)) throw new RuntimeException('Sözleşme durumu geçersiz.');
    if(mb_strlen($notes)>2000) throw new RuntimeException('Sözleşme notu çok uzun.');

    return [$institutionId,$packageId,$number,$start,$end,$due,$total,$currency,$status,$notes];
}

function tf_save_contract(PDO $pdo,array $actor,array $input): int {
    if(!tf_tables_ready($pdo)) throw new RuntimeException('Ticari finans migrationı henüz kurulmamış.');
    [$institutionId,$packageId,$number,$start,$end,$due,$total,$currency,$status,$notes]=tf_validate_contract($input);
    $id=max(0,(int)($input['sozlesme_id']??0));

    $stmt=$pdo->prepare('SELECT 1 FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$institutionId]);
    $institutionOk=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$institutionOk) throw new RuntimeException('Aktif kurum bulunamadı.');

    if($packageId>0){
        $stmt=$pdo->prepare('SELECT 1 FROM paketler WHERE id=? LIMIT 1');
        $stmt->execute([$packageId]);
        $packageOk=(bool)$stmt->fetchColumn();
        $stmt->closeCursor();
        if(!$packageOk) throw new RuntimeException('Paket bulunamadı.');
    }

    $started=false;
    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        if($id>0){
            $lock=$pdo->prepare('SELECT id,kurum_id,para_birimi,durum,toplam_tutar FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE');
            $lock->execute([$id]);
            $old=$lock->fetch(PDO::FETCH_ASSOC);
            $lock->closeCursor();
            if(!is_array($old)) throw new RuntimeException('Sözleşme bulunamadı.');

            $paid=tf_contract_paid($pdo,$id);
            $paymentCounts=tf_contract_payment_counts($pdo,$id);
            if(tf_decimal_compare($total,$paid)<0) throw new RuntimeException('Sözleşme tutarı, tahsil edilmiş tutarın altına indirilemez.');
            if((int)$paymentCounts['toplam']>0 && (int)$old['kurum_id']!==$institutionId) throw new RuntimeException('Tahsilat geçmişi olan sözleşmenin kurumu değiştirilemez.');
            if((int)$paymentCounts['toplam']>0 && (string)$old['para_birimi']!==$currency) throw new RuntimeException('Tahsilat geçmişi olan sözleşmenin para birimi değiştirilemez.');
            $status=tf_normalize_contract_status($status,$total,$paid,$paymentCounts);

            $stmt=$pdo->prepare("UPDATE kurum_sozlesmeleri
                SET kurum_id=?,paket_id=?,sozlesme_no=?,baslangic_tarihi=?,bitis_tarihi=?,vade_tarihi=?,
                    toplam_tutar=?,para_birimi=?,durum=?,notlar=?
                WHERE id=?");
            $stmt->execute([
                $institutionId,$packageId>0?$packageId:null,$number,$start,$end,$due,
                $total,$currency,$status,$notes!==''?$notes:null,$id
            ]);
            $stmt->closeCursor();
            $action='ticari_sozlesme_guncelle';
        }else{
            $status=tf_normalize_contract_status($status,$total,'0.00',['toplam'=>0,'aktif'=>0]);
            $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
                (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum,notlar)
                VALUES (?,?,?,?,?,?,?,?,?,?)");
            $stmt->execute([
                $institutionId,$packageId>0?$packageId:null,$number,$start,$end,$due,
                $total,$currency,$status,$notes!==''?$notes:null
            ]);
            $id=(int)$pdo->lastInsertId();
            $stmt->closeCursor();
            $action='ticari_sozlesme_olustur';
        }

        if($started) $pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,$action,'Sözleşme #'.$id.' '.$number.' kurum #'.$institutionId);
    return $id;
}

function tf_record_payment(PDO $pdo,array $actor,array $input): int {
    if(!tf_tables_ready($pdo)) throw new RuntimeException('Ticari finans migrationı henüz kurulmamış.');
    $contractId=max(0,(int)($input['sozlesme_id']??0));
    $date=kl_validate_date((string)($input['tahsilat_tarihi']??''),true);
    $amount=tf_money($input['tutar']??'0','Tahsilat tutarı');
    $method=(string)($input['odeme_yontemi']??'havale');
    $reference=trim((string)($input['referans_no']??''));
    $notes=trim((string)($input['notlar']??''));

    if($contractId<=0) throw new RuntimeException('Sözleşme seç.');
    if((float)$amount<=0) throw new RuntimeException('Tahsilat tutarı sıfırdan büyük olmalı.');
    if(!in_array($method,['havale','kredi_karti','nakit','cek','diger'],true)) throw new RuntimeException('Ödeme yöntemi geçersiz.');
    if(mb_strlen($reference)>120) throw new RuntimeException('Referans numarası çok uzun.');
    if(mb_strlen($notes)>1000) throw new RuntimeException('Tahsilat notu çok uzun.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        $lock=$pdo->prepare("SELECT id,kurum_id,sozlesme_no,toplam_tutar,para_birimi,durum
            FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $lock->execute([$contractId]);
        $contract=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($contract)) throw new RuntimeException('Sözleşme bulunamadı.');
        if(in_array((string)$contract['durum'],['iptal','taslak'],true)) throw new RuntimeException('Taslak veya iptal sözleşmeye tahsilat girilemez.');

        $paid=tf_contract_paid($pdo,$contractId);
        $remaining=max(0,(float)$contract['toplam_tutar']-(float)$paid);
        if((float)$amount>$remaining+0.009) throw new RuntimeException('Tahsilat sözleşmenin kalan tutarını aşamaz.');

        $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
            (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,referans_no,notlar,durum)
            VALUES (?,?,?,?,?,?,?,?, 'aktif')");
        $stmt->execute([
            $contractId,(int)$contract['kurum_id'],$date,$amount,(string)$contract['para_birimi'],$method,
            $reference!==''?$reference:null,$notes!==''?$notes:null
        ]);
        $id=(int)$pdo->lastInsertId();
        $stmt->closeCursor();

        $newPaid=(float)$paid+(float)$amount;
        $newStatus=$newPaid+0.009>=(float)$contract['toplam_tutar']?'tamamlandi':'aktif';
        $stmt=$pdo->prepare("UPDATE kurum_sozlesmeleri
            SET durum=?
            WHERE id=? AND durum IN ('aktif','tamamlandi')");
        $stmt->execute([$newStatus,$contractId]);
        $stmt->closeCursor();

        if($started) $pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_tahsilat_ekle','Tahsilat #'.$id.' sözleşme #'.$contractId.' tutar '.$amount);
    return $id;
}

function tf_cancel_payment(PDO $pdo,array $actor,int $paymentId,string $reason): void {
    if(!tf_tables_ready($pdo)) throw new RuntimeException('Ticari finans migrationı henüz kurulmamış.');
    $paymentId=max(0,$paymentId);
    $reason=trim($reason);
    if($paymentId<=0) throw new RuntimeException('Tahsilat bulunamadı.');
    if(mb_strlen($reason)<3 || mb_strlen($reason)>500) throw new RuntimeException('İptal nedenini kontrol et.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        $stmt=$pdo->prepare("SELECT id,sozlesme_id,durum FROM kurum_tahsilatlari WHERE id=? LIMIT 1 FOR UPDATE");
        $stmt->execute([$paymentId]);
        $row=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(!is_array($row)) throw new RuntimeException('Tahsilat bulunamadı.');
        if((string)$row['durum']!=='aktif') throw new RuntimeException('Tahsilat zaten iptal edilmiş.');

        $stmt=$pdo->prepare("UPDATE kurum_tahsilatlari
            SET durum='iptal',iptal_nedeni=?,iptal_tarihi=NOW()
            WHERE id=? AND durum='aktif'");
        $stmt->execute([$reason,$paymentId]);
        $stmt->closeCursor();

        $contractId=(int)$row['sozlesme_id'];
        $stmt=$pdo->prepare("SELECT toplam_tutar,durum FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $stmt->execute([$contractId]);
        $contract=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(is_array($contract) && in_array((string)$contract['durum'],['aktif','tamamlandi'],true)){
            $remainingPaid=(float)tf_contract_paid($pdo,$contractId);
            $newStatus=$remainingPaid+0.009>=(float)$contract['toplam_tutar']?'tamamlandi':'aktif';
            $stmt=$pdo->prepare("UPDATE kurum_sozlesmeleri SET durum=? WHERE id=? AND durum IN ('aktif','tamamlandi')");
            $stmt->execute([$newStatus,$contractId]);
            $stmt->closeCursor();
        }

        if($started) $pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_tahsilat_iptal','Tahsilat #'.$paymentId.' neden '.$reason);
}
