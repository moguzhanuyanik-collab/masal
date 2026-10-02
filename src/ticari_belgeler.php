<?php
declare(strict_types=1);

function tb_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'ticari_belgeler')
        && auth_runtime_table_exists($pdo,'ticari_belge_tahsilat_eslemeleri')
        && auth_runtime_table_exists($pdo,'ticari_belge_gecmisi');
}

function tb_document_types(): array {
    return [
        'fatura_referansi'=>'Harici Fatura / e-Belge Referansı',
        'tahakkuk'=>'İç Tahakkuk',
        'diger'=>'Diğer Ticari Belge',
    ];
}

function tb_history_add(
    PDO $pdo,int $documentId,int $contractId,int $institutionId,?int $userId,
    string $type,?string $code=null,?string $detail=null
): void {
    if(!tb_tables_ready($pdo) || $documentId<=0 || $contractId<=0 || $institutionId<=0) return;
    $type=trim($type);
    $code=$code!==null?trim($code):null;
    $detail=$detail!==null?trim($detail):null;
    if($type==='' || mb_strlen($type)>30) throw new RuntimeException('Belge geçmiş türü geçersiz.');
    if($code!==null && mb_strlen($code)>40) throw new RuntimeException('Belge geçmiş kodu geçersiz.');
    if($detail!==null && mb_strlen($detail)>2000) throw new RuntimeException('Belge geçmiş detayı çok uzun.');

    $stmt=$pdo->prepare("INSERT INTO ticari_belge_gecmisi
        (belge_id,sozlesme_id,kurum_id,kullanici_id,tur,kod,detay)
        VALUES (?,?,?,?,?,?,?)");
    $stmt->execute([
        $documentId,$contractId,$institutionId,$userId && $userId>0?$userId:null,
        $type,$code!==''?$code:null,$detail!==''?$detail:null
    ]);
    $stmt->closeCursor();
}

function tb_contract_document_total(PDO $pdo,int $contractId,?int $excludeDocumentId=null): string {
    if(!tb_tables_ready($pdo) || $contractId<=0) return '0.00';
    $sql="SELECT COALESCE(SUM(tutar),0)
        FROM ticari_belgeler
        WHERE sozlesme_id=? AND durum='aktif'";
    $params=[$contractId];
    if($excludeDocumentId!==null && $excludeDocumentId>0){
        $sql.=' AND id<>?';
        $params[]=$excludeDocumentId;
    }
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $total=number_format((float)($stmt->fetchColumn()?:0),2,'.','');
    $stmt->closeCursor();
    return $total;
}

function tb_document_mapping_count(PDO $pdo,int $documentId): int {
    if(!tb_tables_ready($pdo) || $documentId<=0) return 0;
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM ticari_belge_tahsilat_eslemeleri WHERE belge_id=?');
    $stmt->execute([$documentId]);
    $count=(int)$stmt->fetchColumn();
    $stmt->closeCursor();
    return max(0,$count);
}

function tb_document_effective_allocated(PDO $pdo,int $documentId): string {
    if(!tb_tables_ready($pdo) || $documentId<=0) return '0.00';
    $stmt=$pdo->prepare("SELECT COALESCE(SUM(e.tutar),0)
        FROM ticari_belge_tahsilat_eslemeleri e
        INNER JOIN kurum_tahsilatlari t
          ON t.id=e.tahsilat_id
         AND t.sozlesme_id=e.sozlesme_id
         AND t.kurum_id=e.kurum_id
         AND t.durum='aktif'
        WHERE e.belge_id=? AND e.durum='aktif'");
    $stmt->execute([$documentId]);
    $amount=number_format((float)($stmt->fetchColumn()?:0),2,'.','');
    $stmt->closeCursor();
    return $amount;
}

function tb_payment_effective_allocated(PDO $pdo,int $paymentId): string {
    if(!tb_tables_ready($pdo) || $paymentId<=0) return '0.00';
    $stmt=$pdo->prepare("SELECT COALESCE(SUM(e.tutar),0)
        FROM ticari_belge_tahsilat_eslemeleri e
        INNER JOIN ticari_belgeler b
          ON b.id=e.belge_id
         AND b.sozlesme_id=e.sozlesme_id
         AND b.kurum_id=e.kurum_id
         AND b.durum='aktif'
        WHERE e.tahsilat_id=? AND e.durum='aktif'");
    $stmt->execute([$paymentId]);
    $amount=number_format((float)($stmt->fetchColumn()?:0),2,'.','');
    $stmt->closeCursor();
    return $amount;
}

function tb_contract_options(PDO $pdo,int $limit=500): array {
    if(!tb_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        s.id,s.kurum_id,s.sozlesme_no,s.toplam_tutar,s.para_birimi,s.durum,
        k.ad kurum_adi,
        COALESCE(d.belgelenen_tutar,0) belgelenen_tutar
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN (
          SELECT sozlesme_id,SUM(tutar) belgelenen_tutar
          FROM ticari_belgeler
          WHERE durum='aktif'
          GROUP BY sozlesme_id
        ) d ON d.sozlesme_id=s.id
        WHERE s.durum IN ('aktif','tamamlandi')
        ORDER BY k.ad,s.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $total=(float)$row['toplam_tutar'];
        $billed=(float)$row['belgelenen_tutar'];
        $row['belgelenen_tutar']=number_format($billed,2,'.','');
        $row['belgesiz_tutar']=number_format(max(0,$total-$billed),2,'.','');
    }
    unset($row);
    return $rows;
}

function tb_document_rows(PDO $pdo,array $filters=[],int $limit=500): array {
    if(!tb_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=['1=1'];
    $params=[];

    $status=trim((string)($filters['durum']??''));
    if($status!=='' && in_array($status,['aktif','iptal'],true)){
        $where[]='b.durum=?';
        $params[]=$status;
    }
    $type=trim((string)($filters['belge_turu']??''));
    if($type!=='' && array_key_exists($type,tb_document_types())){
        $where[]='b.belge_turu=?';
        $params[]=$type;
    }
    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $where[]='(b.belge_no LIKE ? OR s.sozlesme_no LIKE ? OR k.ad LIKE ? OR k.kod LIKE ?)';
        $like='%'.$query.'%';
        array_push($params,$like,$like,$like,$like);
    }

    $stmt=$pdo->prepare("SELECT
        b.id,b.sozlesme_id,b.kurum_id,b.belge_turu,b.belge_no,b.belge_tarihi,b.tutar,b.para_birimi,
        b.durum,b.notlar,b.iptal_nedeni,b.iptal_tarihi,b.olusturulma_tarihi,b.guncellenme_tarihi,
        s.sozlesme_no,k.ad kurum_adi,k.kod kurum_kodu,
        COALESCE(a.eslesen_tutar,0) eslesen_tutar,
        COALESCE(a.esleme_sayisi,0) esleme_sayisi
        FROM ticari_belgeler b
        INNER JOIN kurum_sozlesmeleri s ON s.id=b.sozlesme_id AND s.kurum_id=b.kurum_id
        INNER JOIN kurumlar k ON k.id=b.kurum_id
        LEFT JOIN (
          SELECT
            e.belge_id,
            SUM(CASE WHEN e.durum='aktif' AND t.durum='aktif' THEN e.tutar ELSE 0 END) eslesen_tutar,
            SUM(CASE WHEN e.durum='aktif' AND t.durum='aktif' THEN 1 ELSE 0 END) esleme_sayisi
          FROM ticari_belge_tahsilat_eslemeleri e
          LEFT JOIN kurum_tahsilatlari t
            ON t.id=e.tahsilat_id
           AND t.sozlesme_id=e.sozlesme_id
           AND t.kurum_id=e.kurum_id
          GROUP BY e.belge_id
        ) a ON a.belge_id=b.id
        WHERE ".implode(' AND ',$where)."
        ORDER BY CASE b.durum WHEN 'aktif' THEN 0 ELSE 1 END,b.belge_tarihi DESC,b.id DESC
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $total=(float)$row['tutar'];
        $allocated=(float)$row['eslesen_tutar'];
        $remaining=max(0,$total-$allocated);
        $row['eslesen_tutar']=number_format($allocated,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $row['odeme_durumu']=$row['durum']!=='aktif'
            ?'iptal'
            :($allocated<=0.009?'odenmedi':($remaining<=0.009?'odendi':'kismi'));
    }
    unset($row);
    return $rows;
}

function tb_document_row(PDO $pdo,int $documentId,bool $forUpdate=false): ?array {
    if(!tb_tables_ready($pdo) || $documentId<=0) return null;
    $stmt=$pdo->prepare("SELECT
        b.*,s.sozlesme_no,s.toplam_tutar sozlesme_toplami,s.durum sozlesme_durum,
        k.ad kurum_adi,k.kod kurum_kodu
        FROM ticari_belgeler b
        INNER JOIN kurum_sozlesmeleri s ON s.id=b.sozlesme_id AND s.kurum_id=b.kurum_id
        INNER JOIN kurumlar k ON k.id=b.kurum_id
        WHERE b.id=? LIMIT 1".($forUpdate?' FOR UPDATE':''));
    $stmt->execute([$documentId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;

    $allocated=(float)tb_document_effective_allocated($pdo,$documentId);
    $total=(float)$row['tutar'];
    $row['eslesen_tutar']=number_format($allocated,2,'.','');
    $row['kalan_tutar']=number_format(max(0,$total-$allocated),2,'.','');
    $row['odeme_durumu']=$row['durum']!=='aktif'
        ?'iptal'
        :($allocated<=0.009?'odenmedi':(($total-$allocated)<=0.009?'odendi':'kismi'));
    return $row;
}

function tb_save_document(PDO $pdo,array $actor,array $input): int {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tb_tables_ready($pdo)) throw new RuntimeException('Ticari belge migrationı henüz kurulmamış.');

    $id=max(0,(int)($input['belge_id']??0));
    $contractId=max(0,(int)($input['sozlesme_id']??0));
    $type=trim((string)($input['belge_turu']??''));
    $number=trim((string)($input['belge_no']??''));
    $date=kl_validate_date((string)($input['belge_tarihi']??''),true);
    $amount=tf_money($input['tutar']??'0','Belge tutarı');
    $notes=trim((string)($input['notlar']??''));

    if($contractId<=0) throw new RuntimeException('Sözleşme seç.');
    if(!array_key_exists($type,tb_document_types())) throw new RuntimeException('Belge türü geçersiz.');
    if(mb_strlen($number)<2 || mb_strlen($number)>120) throw new RuntimeException('Belge numarası / referansını kontrol et.');
    if((float)$amount<=0) throw new RuntimeException('Belge tutarı sıfırdan büyük olmalı.');
    if(mb_strlen($notes)>2000) throw new RuntimeException('Belge notu çok uzun.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $contractLock=$pdo->prepare("SELECT id,kurum_id,sozlesme_no,toplam_tutar,para_birimi,durum
            FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE");
        $contractLock->execute([$contractId]);
        $contract=$contractLock->fetch(PDO::FETCH_ASSOC);
        $contractLock->closeCursor();
        if(!is_array($contract)) throw new RuntimeException('Sözleşme bulunamadı.');
        if(!in_array((string)$contract['durum'],['aktif','tamamlandi'],true))
            throw new RuntimeException('Yalnız aktif veya tamamlanmış sözleşmeye ticari belge bağlanabilir.');

        $institutionId=(int)$contract['kurum_id'];
        $currency=(string)$contract['para_birimi'];

        $old=null;
        if($id>0){
            $stmt=$pdo->prepare('SELECT * FROM ticari_belgeler WHERE id=? LIMIT 1 FOR UPDATE');
            $stmt->execute([$id]);
            $old=$stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
            if(!is_array($old)) throw new RuntimeException('Ticari belge bulunamadı.');
            if((string)$old['durum']!=='aktif') throw new RuntimeException('İptal edilmiş ticari belge düzenlenemez.');
            if((int)$old['sozlesme_id']!==$contractId) throw new RuntimeException('Ticari belgenin bağlı sözleşmesi değiştirilemez.');

            if(tb_document_mapping_count($pdo,$id)>0){
                if((string)$old['belge_turu']!==$type
                    || (string)$old['belge_no']!==$number
                    || (string)$old['belge_tarihi']!==$date
                    || tf_decimal_compare((string)$old['tutar'],$amount)!==0){
                    throw new RuntimeException('Tahsilat eşleme geçmişi olan belgenin türü, numarası, tarihi veya tutarı değiştirilemez.');
                }
            }
        }

        $otherTotal=(float)tb_contract_document_total($pdo,$contractId,$id>0?$id:null);
        if($otherTotal+(float)$amount>(float)$contract['toplam_tutar']+0.009)
            throw new RuntimeException('Aktif belge toplamı sözleşme toplam tutarını aşamaz.');

        if($id>0){
            $stmt=$pdo->prepare("UPDATE ticari_belgeler
                SET belge_turu=?,belge_no=?,belge_tarihi=?,tutar=?,notlar=?,guncelleyen_kullanici_id=?
                WHERE id=?");
            $stmt->execute([
                $type,$number,$date,$amount,$notes!==''?$notes:null,(int)$actor['id'],$id
            ]);
            $stmt->closeCursor();
            tb_history_add(
                $pdo,$id,$contractId,$institutionId,(int)$actor['id'],
                'belge','guncellendi','Ticari belge bilgileri güncellendi: '.$number
            );
            $action='ticari_belge_guncelle';
        }else{
            $stmt=$pdo->prepare("INSERT INTO ticari_belgeler
                (sozlesme_id,kurum_id,belge_turu,belge_no,belge_tarihi,tutar,para_birimi,durum,notlar,
                 olusturan_kullanici_id,guncelleyen_kullanici_id)
                VALUES (?,?,?,?,?,?,?,'aktif',?,?,?)");
            $stmt->execute([
                $contractId,$institutionId,$type,$number,$date,$amount,$currency,$notes!==''?$notes:null,
                (int)$actor['id'],(int)$actor['id']
            ]);
            $id=(int)$pdo->lastInsertId();
            $stmt->closeCursor();
            tb_history_add(
                $pdo,$id,$contractId,$institutionId,(int)$actor['id'],
                'belge','olusturuldu','Ticari belge kaydı oluşturuldu: '.$number
            );
            $action='ticari_belge_olustur';
        }

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,$action,'Belge #'.$id.' sözleşme #'.$contractId);
    return $id;
}

function tb_cancel_document(PDO $pdo,array $actor,int $documentId,string $reason): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tb_tables_ready($pdo)) throw new RuntimeException('Ticari belge migrationı henüz kurulmamış.');
    $reason=trim($reason);
    if($documentId<=0) throw new RuntimeException('Ticari belge bulunamadı.');
    if(mb_strlen($reason)<3 || mb_strlen($reason)>500) throw new RuntimeException('İptal nedenini kontrol et.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $doc=tb_document_row($pdo,$documentId,true);
        if(!$doc) throw new RuntimeException('Ticari belge bulunamadı.');
        if((string)$doc['durum']!=='aktif') throw new RuntimeException('Ticari belge zaten iptal edilmiş.');
        if((float)$doc['eslesen_tutar']>0.009)
            throw new RuntimeException('Aktif tahsilat eşlemesi olan belge iptal edilemez. Önce eşlemeleri kaldır.');

        $stmt=$pdo->prepare("UPDATE ticari_belgeler
            SET durum='iptal',iptal_nedeni=?,iptal_tarihi=NOW(),guncelleyen_kullanici_id=?
            WHERE id=? AND durum='aktif'");
        $stmt->execute([$reason,(int)$actor['id'],$documentId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Ticari belge iptal edilemedi.');
        $stmt->closeCursor();

        tb_history_add(
            $pdo,$documentId,(int)$doc['sozlesme_id'],(int)$doc['kurum_id'],(int)$actor['id'],
            'belge','iptal',$reason
        );
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_belge_iptal','Belge #'.$documentId);
}

function tb_available_payments(PDO $pdo,int $documentId,int $limit=200): array {
    $doc=tb_document_row($pdo,$documentId,false);
    if(!$doc || (string)$doc['durum']!=='aktif') return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        t.id,t.tahsilat_tarihi,t.tutar,t.para_birimi,t.odeme_yontemi,t.referans_no,
        COALESCE(a.ayrilan_tutar,0) ayrilan_tutar
        FROM kurum_tahsilatlari t
        LEFT JOIN (
          SELECT
            e.tahsilat_id,
            SUM(CASE WHEN e.durum='aktif' AND b.durum='aktif' THEN e.tutar ELSE 0 END) ayrilan_tutar
          FROM ticari_belge_tahsilat_eslemeleri e
          INNER JOIN ticari_belgeler b ON b.id=e.belge_id
          GROUP BY e.tahsilat_id
        ) a ON a.tahsilat_id=t.id
        WHERE t.sozlesme_id=? AND t.kurum_id=? AND t.durum='aktif'
          AND t.tutar-COALESCE(a.ayrilan_tutar,0)>0.009
        ORDER BY t.tahsilat_tarihi,t.id
        LIMIT {$limit}");
    $stmt->execute([(int)$doc['sozlesme_id'],(int)$doc['kurum_id']]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $amount=(float)$row['tutar'];
        $allocated=(float)$row['ayrilan_tutar'];
        $row['ayrilan_tutar']=number_format($allocated,2,'.','');
        $row['kullanilabilir_tutar']=number_format(max(0,$amount-$allocated),2,'.','');
    }
    unset($row);
    return $rows;
}

function tb_allocate_payment(PDO $pdo,array $actor,int $documentId,int $paymentId,mixed $amountInput): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tb_tables_ready($pdo)) throw new RuntimeException('Ticari belge migrationı henüz kurulmamış.');
    $amount=tf_money($amountInput,'Eşleme tutarı');
    if($documentId<=0 || $paymentId<=0) throw new RuntimeException('Belge veya tahsilat bulunamadı.');
    if((float)$amount<=0) throw new RuntimeException('Eşleme tutarı sıfırdan büyük olmalı.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $doc=tb_document_row($pdo,$documentId,true);
        if(!$doc) throw new RuntimeException('Ticari belge bulunamadı.');
        if((string)$doc['durum']!=='aktif') throw new RuntimeException('İptal edilmiş belgeye tahsilat eşlenemez.');

        $paymentLock=$pdo->prepare("SELECT id,sozlesme_id,kurum_id,tutar,para_birimi,durum
            FROM kurum_tahsilatlari WHERE id=? LIMIT 1 FOR UPDATE");
        $paymentLock->execute([$paymentId]);
        $payment=$paymentLock->fetch(PDO::FETCH_ASSOC);
        $paymentLock->closeCursor();
        if(!is_array($payment)) throw new RuntimeException('Tahsilat bulunamadı.');
        if((string)$payment['durum']!=='aktif') throw new RuntimeException('İptal edilmiş tahsilat belgeye eşlenemez.');
        if((int)$payment['sozlesme_id']!==(int)$doc['sozlesme_id']
            || (int)$payment['kurum_id']!==(int)$doc['kurum_id'])
            throw new RuntimeException('Belge ve tahsilat aynı kurum ve sözleşmeye ait olmalı.');
        if((string)$payment['para_birimi']!==(string)$doc['para_birimi'])
            throw new RuntimeException('Belge ve tahsilat para birimi eşleşmiyor.');

        $mapLock=$pdo->prepare("SELECT durum FROM ticari_belge_tahsilat_eslemeleri
            WHERE belge_id=? AND tahsilat_id=? LIMIT 1 FOR UPDATE");
        $mapLock->execute([$documentId,$paymentId]);
        $mapStatus=(string)($mapLock->fetchColumn()?:'');
        $mapLock->closeCursor();
        if($mapStatus==='aktif') throw new RuntimeException('Bu tahsilat belgeye zaten eşlenmiş.');

        $docAllocated=(float)tb_document_effective_allocated($pdo,$documentId);
        $paymentAllocated=(float)tb_payment_effective_allocated($pdo,$paymentId);
        $docRemaining=max(0,(float)$doc['tutar']-$docAllocated);
        $paymentRemaining=max(0,(float)$payment['tutar']-$paymentAllocated);

        if((float)$amount>$docRemaining+0.009)
            throw new RuntimeException('Eşleme tutarı belgenin kalan tutarını aşamaz.');
        if((float)$amount>$paymentRemaining+0.009)
            throw new RuntimeException('Eşleme tutarı tahsilatın kullanılabilir tutarını aşamaz.');

        if($mapStatus==='iptal'){
            $stmt=$pdo->prepare("UPDATE ticari_belge_tahsilat_eslemeleri
                SET tutar=?,durum='aktif',iptal_nedeni=NULL,iptal_tarihi=NULL,
                    guncelleyen_kullanici_id=?
                WHERE belge_id=? AND tahsilat_id=? AND durum='iptal'");
            $stmt->execute([$amount,(int)$actor['id'],$documentId,$paymentId]);
        }else{
            $stmt=$pdo->prepare("INSERT INTO ticari_belge_tahsilat_eslemeleri
                (belge_id,tahsilat_id,sozlesme_id,kurum_id,tutar,durum,olusturan_kullanici_id,guncelleyen_kullanici_id)
                VALUES (?,?,?,?,?,'aktif',?,?)");
            $stmt->execute([
                $documentId,$paymentId,(int)$doc['sozlesme_id'],(int)$doc['kurum_id'],$amount,
                (int)$actor['id'],(int)$actor['id']
            ]);
        }
        if($stmt->rowCount()!==1) throw new RuntimeException('Tahsilat eşlemesi kaydedilemedi.');
        $stmt->closeCursor();

        tb_history_add(
            $pdo,$documentId,(int)$doc['sozlesme_id'],(int)$doc['kurum_id'],(int)$actor['id'],
            'esleme','tahsilat_eslendi','Tahsilat #'.$paymentId.' belgeye '.$amount.' '.(string)$doc['para_birimi'].' eşlendi.'
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_belge_tahsilat_esle','Belge #'.$documentId.' tahsilat #'.$paymentId);
}

function tb_unallocate_payment(PDO $pdo,array $actor,int $documentId,int $paymentId,string $reason): void {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!tb_tables_ready($pdo)) throw new RuntimeException('Ticari belge migrationı henüz kurulmamış.');
    $reason=trim($reason);
    if($documentId<=0 || $paymentId<=0) throw new RuntimeException('Belge veya tahsilat eşlemesi bulunamadı.');
    if(mb_strlen($reason)<3 || mb_strlen($reason)>500) throw new RuntimeException('Eşleme kaldırma nedenini kontrol et.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $doc=tb_document_row($pdo,$documentId,true);
        if(!$doc) throw new RuntimeException('Ticari belge bulunamadı.');

        $stmt=$pdo->prepare("SELECT tutar,durum FROM ticari_belge_tahsilat_eslemeleri
            WHERE belge_id=? AND tahsilat_id=? LIMIT 1 FOR UPDATE");
        $stmt->execute([$documentId,$paymentId]);
        $mapping=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(!is_array($mapping) || (string)$mapping['durum']!=='aktif')
            throw new RuntimeException('Aktif tahsilat eşlemesi bulunamadı.');

        $stmt=$pdo->prepare("UPDATE ticari_belge_tahsilat_eslemeleri
            SET durum='iptal',iptal_nedeni=?,iptal_tarihi=NOW(),guncelleyen_kullanici_id=?
            WHERE belge_id=? AND tahsilat_id=? AND durum='aktif'");
        $stmt->execute([$reason,(int)$actor['id'],$documentId,$paymentId]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Tahsilat eşlemesi kaldırılamadı.');
        $stmt->closeCursor();

        tb_history_add(
            $pdo,$documentId,(int)$doc['sozlesme_id'],(int)$doc['kurum_id'],(int)$actor['id'],
            'esleme','tahsilat_esleme_iptal',
            'Tahsilat #'.$paymentId.' eşlemesi kaldırıldı. Neden: '.$reason
        );
        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'ticari_belge_tahsilat_esleme_iptal','Belge #'.$documentId.' tahsilat #'.$paymentId);
}

function tb_document_mappings(PDO $pdo,int $documentId): array {
    if(!tb_tables_ready($pdo) || $documentId<=0) return [];
    $stmt=$pdo->prepare("SELECT
        e.belge_id,e.tahsilat_id,e.tutar esleme_tutari,e.durum esleme_durumu,
        e.iptal_nedeni,e.iptal_tarihi,e.olusturulma_tarihi,e.guncellenme_tarihi,
        t.tahsilat_tarihi,t.tutar tahsilat_tutari,t.para_birimi,t.odeme_yontemi,t.referans_no,t.durum tahsilat_durumu
        FROM ticari_belge_tahsilat_eslemeleri e
        LEFT JOIN kurum_tahsilatlari t
          ON t.id=e.tahsilat_id
         AND t.sozlesme_id=e.sozlesme_id
         AND t.kurum_id=e.kurum_id
        WHERE e.belge_id=?
        ORDER BY e.guncellenme_tarihi DESC,e.tahsilat_id DESC");
    $stmt->execute([$documentId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tb_history_rows(PDO $pdo,int $documentId,int $limit=200): array {
    if(!tb_tables_ready($pdo) || $documentId<=0) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        g.id,g.tur,g.kod,g.detay,g.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') kullanici_adi
        FROM ticari_belge_gecmisi g
        LEFT JOIN kullanicilar u ON u.id=g.kullanici_id
        WHERE g.belge_id=?
        ORDER BY g.id DESC
        LIMIT {$limit}");
    $stmt->execute([$documentId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tb_currency_summary(PDO $pdo): array {
    if(!tb_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        b.para_birimi,
        COUNT(*) belge_sayisi,
        COALESCE(SUM(b.tutar),0) belge_toplami,
        COALESCE(SUM(COALESCE(a.eslesen_tutar,0)),0) eslesen_tutar
        FROM ticari_belgeler b
        LEFT JOIN (
          SELECT
            e.belge_id,
            SUM(CASE WHEN e.durum='aktif' AND t.durum='aktif' THEN e.tutar ELSE 0 END) eslesen_tutar
          FROM ticari_belge_tahsilat_eslemeleri e
          LEFT JOIN kurum_tahsilatlari t
            ON t.id=e.tahsilat_id
           AND t.sozlesme_id=e.sozlesme_id
           AND t.kurum_id=e.kurum_id
          GROUP BY e.belge_id
        ) a ON a.belge_id=b.id
        WHERE b.durum='aktif'
        GROUP BY b.para_birimi
        ORDER BY FIELD(b.para_birimi,'TRY','USD','EUR'),b.para_birimi");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $total=(float)$row['belge_toplami'];
        $allocated=(float)$row['eslesen_tutar'];
        $row['belge_toplami']=number_format($total,2,'.','');
        $row['eslesen_tutar']=number_format($allocated,2,'.','');
        $row['acik_belge_tutari']=number_format(max(0,$total-$allocated),2,'.','');
        $row['esleme_orani']=$total>0?round(min(100,max(0,($allocated/$total)*100)),1):0.0;
    }
    unset($row);
    return $rows;
}
