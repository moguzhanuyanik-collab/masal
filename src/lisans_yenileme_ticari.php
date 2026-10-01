<?php
declare(strict_types=1);

function lyt_tables_ready(PDO $pdo): bool {
    return ly_tables_ready($pdo)
        && tf_tables_ready($pdo)
        && auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri');
}

function lyt_contract_relation(PDO $pdo,int $renewalId): ?array {
    if(!lyt_tables_ready($pdo) || $renewalId<=0) return null;
    $stmt=$pdo->prepare("SELECT
        m.yenileme_id,m.sozlesme_id,m.kurum_id,m.olusturan_kullanici_id,m.olusturulma_tarihi,
        s.sozlesme_no,s.paket_id,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum,s.notlar,
        COALESCE(SUM(CASE WHEN t.durum='aktif' THEN t.tutar ELSE 0 END),0) tahsil_edilen,
        COUNT(t.id) tahsilat_gecmisi,
        SUM(CASE WHEN t.durum='aktif' THEN 1 ELSE 0 END) aktif_tahsilat_sayisi
        FROM lisans_yenileme_sozlesmeleri m
        INNER JOIN kurum_sozlesmeleri s ON s.id=m.sozlesme_id AND s.kurum_id=m.kurum_id
        LEFT JOIN kurum_tahsilatlari t ON t.sozlesme_id=s.id
        WHERE m.yenileme_id=?
        GROUP BY m.yenileme_id,m.sozlesme_id,m.kurum_id,m.olusturan_kullanici_id,m.olusturulma_tarihi,
            s.sozlesme_no,s.paket_id,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
            s.toplam_tutar,s.para_birimi,s.durum,s.notlar
        LIMIT 1");
    $stmt->execute([$renewalId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;
    $total=(float)$row['toplam_tutar'];
    $paid=(float)$row['tahsil_edilen'];
    $row['tahsil_edilen']=number_format($paid,2,'.','');
    $row['kalan_tutar']=number_format(max(0,$total-$paid),2,'.','');
    return $row;
}

function lyt_contract_start_date(string $targetEnd): string {
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$targetEnd);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$targetEnd){
        throw new RuntimeException('Yenileme hedef bitiş tarihi geçersiz.');
    }
    return $date->modify('+1 day')->format('Y-m-d');
}

function lyt_create_contract_draft(PDO $pdo,array $actor,int $renewalId,array $input): int {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!lyt_tables_ready($pdo)) throw new RuntimeException('Yenileme/ticari bağlantı migrationı henüz kurulmamış.');
    if($renewalId<=0) throw new RuntimeException('Yenileme vakası bulunamadı.');

    $number=trim((string)($input['sozlesme_no']??''));
    $total=(string)($input['toplam_tutar']??'');
    $currency=(string)($input['para_birimi']??'TRY');
    $due=(string)($input['vade_tarihi']??'');
    $note=trim((string)($input['notlar']??''));

    if(mb_strlen($number)<2 || mb_strlen($number)>80) throw new RuntimeException('Sözleşme numarasını kontrol et.');
    if(mb_strlen($note)>1600) throw new RuntimeException('Sözleşme notu çok uzun.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $case=ly_case_row($pdo,$renewalId,true);
        if(!$case) throw new RuntimeException('Yenileme vakası bulunamadı.');
        if((string)$case['durum']!=='yenilendi') throw new RuntimeException('Ticari sözleşme yalnız yenilenmiş lisans vakasından oluşturulabilir.');
        if(empty($case['sonuc_bitis_tarihi'])) throw new RuntimeException('Yenilemenin sonuç bitiş tarihi bulunamadı.');

        $map=$pdo->prepare('SELECT sozlesme_id FROM lisans_yenileme_sozlesmeleri WHERE yenileme_id=? LIMIT 1 FOR UPDATE');
        $map->execute([$renewalId]);
        $existing=(int)($map->fetchColumn()?:0);
        $map->closeCursor();
        if($existing>0) throw new RuntimeException('Bu yenileme vakası zaten bir sözleşmeye bağlı.');

        $packageId=max(0,(int)($case['sonuc_paket_id']??0));
        if($packageId<=0) $packageId=max(0,(int)($case['paket_id']??0));
        if($packageId<=0) throw new RuntimeException('Yenileme paket bilgisi bulunamadı.');

        $start=lyt_contract_start_date((string)$case['hedef_bitis_tarihi']);
        $end=(string)$case['sonuc_bitis_tarihi'];

        $contractNote='Lisans yenileme #'.$renewalId.' için oluşturulan sözleşme taslağı.';
        if($note!=='') $contractNote.=' '.$note;

        $contractId=tf_save_contract($pdo,$actor,[
            'kurum_id'=>(int)$case['kurum_id'],
            'paket_id'=>$packageId,
            'sozlesme_no'=>$number,
            'baslangic_tarihi'=>$start,
            'bitis_tarihi'=>$end,
            'vade_tarihi'=>$due,
            'toplam_tutar'=>$total,
            'para_birimi'=>$currency,
            'durum'=>'taslak',
            'notlar'=>$contractNote,
        ]);

        $stmt=$pdo->prepare("INSERT INTO lisans_yenileme_sozlesmeleri
            (yenileme_id,sozlesme_id,kurum_id,olusturan_kullanici_id)
            VALUES (?,?,?,?)");
        $stmt->execute([$renewalId,$contractId,(int)$case['kurum_id'],(int)$actor['id']]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Yenileme-sözleşme bağlantısı oluşturulamadı.');
        $stmt->closeCursor();

        ly_add_history(
            $pdo,$renewalId,(int)$case['lisans_id'],(int)$case['kurum_id'],(int)$actor['id'],
            'ticari','sozlesme_taslak','Sözleşme taslağı oluşturuldu: '.$number.' (#'.$contractId.')'
        );

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$actor['id'],null,'yenileme_sozlesme_taslak','Yenileme #'.$renewalId.' sözleşme #'.$contractId);
    return $contractId;
}

function lyt_contract_links(PDO $pdo,array $contractIds): array {
    if(!lyt_tables_ready($pdo)) return [];
    $ids=array_values(array_unique(array_filter(array_map('intval',$contractIds),static fn(int $id):bool=>$id>0)));
    if(!$ids) return [];
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT
        m.sozlesme_id,m.yenileme_id,m.kurum_id,
        y.hedef_bitis_tarihi,y.sonuc_bitis_tarihi,y.durum yenileme_durum
        FROM lisans_yenileme_sozlesmeleri m
        INNER JOIN kurum_lisans_yenilemeleri y ON y.id=m.yenileme_id AND y.kurum_id=m.kurum_id
        WHERE m.sozlesme_id IN ($ph)");
    $stmt->execute($ids);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    $out=[];
    foreach($rows as $row)$out[(int)$row['sozlesme_id']]=$row;
    return $out;
}

function lyt_revenue_summary(PDO $pdo): array {
    if(!lyt_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        s.para_birimi,
        COUNT(DISTINCT y.id) yenileme_sayisi,
        COUNT(DISTINCT s.id) sozlesme_sayisi,
        COALESCE(SUM(s.toplam_tutar),0) sozlesme_toplami,
        COALESCE(SUM(COALESCE(pay.tahsil_edilen,0)),0) tahsil_edilen
        FROM lisans_yenileme_sozlesmeleri m
        INNER JOIN kurum_lisans_yenilemeleri y
          ON y.id=m.yenileme_id AND y.kurum_id=m.kurum_id AND y.durum='yenilendi'
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=m.sozlesme_id AND s.kurum_id=m.kurum_id
        LEFT JOIN (
            SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen
            FROM kurum_tahsilatlari
            WHERE durum='aktif'
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        WHERE s.durum<>'iptal'
        GROUP BY s.para_birimi
        ORDER BY FIELD(s.para_birimi,'TRY','USD','EUR'),s.para_birimi");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $total=(float)$row['sozlesme_toplami'];
        $paid=(float)$row['tahsil_edilen'];
        $row['sozlesme_toplami']=number_format($total,2,'.','');
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format(max(0,$total-$paid),2,'.','');
    }
    unset($row);
    return $rows;
}

function lyt_gap_rows(PDO $pdo,int $limit=300): array {
    if(!lyt_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->query("SELECT
        y.id yenileme_id,y.kurum_id,y.hedef_bitis_tarihi,y.sonuc_bitis_tarihi,y.kapanma_tarihi,
        k.ad kurum_adi,
        COALESCE(rp.ad,p.ad,'—') paket_adi,
        m.sozlesme_id,
        s.sozlesme_no,s.durum sozlesme_durum,s.toplam_tutar,s.para_birimi,
        COALESCE(pay.tahsil_edilen,0) tahsil_edilen,
        CASE
          WHEN m.sozlesme_id IS NULL THEN 'sozlesme_yok'
          WHEN s.id IS NULL THEN 'sozlesme_kaydi_yok'
          WHEN s.durum='iptal' THEN 'sozlesme_iptal'
          WHEN s.durum='taslak' THEN 'sozlesme_taslak'
          WHEN COALESCE(pay.tahsil_edilen,0)<=0 THEN 'tahsilat_yok'
          WHEN COALESCE(pay.tahsil_edilen,0)+0.009<s.toplam_tutar THEN 'kismi_tahsilat'
          ELSE 'tamam'
        END ticari_durum
        FROM kurum_lisans_yenilemeleri y
        INNER JOIN kurumlar k ON k.id=y.kurum_id
        INNER JOIN kurum_lisanslari kl ON kl.id=y.lisans_id AND kl.kurum_id=y.kurum_id
        LEFT JOIN paketler p ON p.id=kl.paket_id
        LEFT JOIN paketler rp ON rp.id=y.sonuc_paket_id
        LEFT JOIN lisans_yenileme_sozlesmeleri m ON m.yenileme_id=y.id AND m.kurum_id=y.kurum_id
        LEFT JOIN kurum_sozlesmeleri s ON s.id=m.sozlesme_id AND s.kurum_id=y.kurum_id
        LEFT JOIN (
          SELECT sozlesme_id,SUM(CASE WHEN durum='aktif' THEN tutar ELSE 0 END) tahsil_edilen
          FROM kurum_tahsilatlari
          GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        WHERE y.durum='yenilendi'
        ORDER BY
          CASE
            WHEN m.sozlesme_id IS NULL THEN 0
            WHEN s.id IS NULL THEN 1
            WHEN s.durum='taslak' THEN 2
            WHEN COALESCE(pay.tahsil_edilen,0)<=0 THEN 3
            WHEN COALESCE(pay.tahsil_edilen,0)+0.009<s.toplam_tutar THEN 4
            ELSE 5
          END,
          y.kapanma_tarihi DESC,y.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function lyt_gap_summary(PDO $pdo): array {
    $out=[
        'sozlesme_yok'=>0,'sozlesme_kaydi_yok'=>0,'sozlesme_iptal'=>0,'sozlesme_taslak'=>0,
        'tahsilat_yok'=>0,'kismi_tahsilat'=>0,'tamam'=>0
    ];
    foreach(lyt_gap_rows($pdo,1000) as $row){
        $key=(string)($row['ticari_durum']??'');
        if(array_key_exists($key,$out)) $out[$key]++;
    }
    return $out;
}

function lyt_gap_label(string $status): string {
    return match($status){
        'sozlesme_yok'=>'Sözleşme yok',
        'sozlesme_kaydi_yok'=>'Bağlı sözleşme kaydı bulunamıyor',
        'sozlesme_iptal'=>'Sözleşme iptal',
        'sozlesme_taslak'=>'Sözleşme taslak',
        'tahsilat_yok'=>'Tahsilat yok',
        'kismi_tahsilat'=>'Kısmi tahsilat',
        'tamam'=>'Ticari akış tamam',
        default=>'Bilinmiyor',
    };
}
