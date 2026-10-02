<?php
declare(strict_types=1);

function tm_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo) && tb_tables_ready($pdo);
}

function tm_contract_rows(PDO $pdo,array $filters=[],int $limit=500): array {
    if(!tm_tables_ready($pdo)) return [];
    $limit=max(1,min(2000,$limit));

    $where=["s.durum IN ('aktif','tamamlandi')"];
    $params=[];

    $institutionId=max(0,(int)($filters['kurum_id']??0));
    if($institutionId>0){
        $where[]='s.kurum_id=?';
        $params[]=$institutionId;
    }

    $currency=mb_strtoupper(trim((string)($filters['para_birimi']??'')),'UTF-8');
    if($currency!=='' && in_array($currency,['TRY','USD','EUR'],true)){
        $where[]='s.para_birimi=?';
        $params[]=$currency;
    }

    $query=trim((string)($filters['q']??''));
    if($query!==''){
        $like='%'.$query.'%';
        $where[]='(s.sozlesme_no LIKE ? OR k.ad LIKE ? OR k.kod LIKE ?)';
        array_push($params,$like,$like,$like);
    }

    $sql="SELECT
        s.id sozlesme_id,s.kurum_id,s.sozlesme_no,s.toplam_tutar,s.para_birimi,s.durum sozlesme_durum,
        k.ad kurum_adi,k.kod kurum_kodu,
        COALESCE(d.belge_toplami,0) belge_toplami,
        COALESCE(d.belge_sayisi,0) belge_sayisi,
        COALESCE(p.tahsilat_toplami,0) tahsilat_toplami,
        COALESCE(p.tahsilat_sayisi,0) tahsilat_sayisi,
        COALESCE(a.eslesen_tutar,0) eslesen_tutar,
        COALESCE(a.esleme_sayisi,0) esleme_sayisi
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN (
          SELECT b.sozlesme_id,b.kurum_id,b.para_birimi,
                 SUM(b.tutar) belge_toplami,COUNT(*) belge_sayisi
          FROM ticari_belgeler b
          WHERE b.durum='aktif'
          GROUP BY b.sozlesme_id,b.kurum_id,b.para_birimi
        ) d
          ON d.sozlesme_id=s.id
         AND d.kurum_id=s.kurum_id
         AND d.para_birimi=s.para_birimi
        LEFT JOIN (
          SELECT t.sozlesme_id,t.kurum_id,t.para_birimi,
                 SUM(t.tutar) tahsilat_toplami,COUNT(*) tahsilat_sayisi
          FROM kurum_tahsilatlari t
          WHERE t.durum='aktif'
          GROUP BY t.sozlesme_id,t.kurum_id,t.para_birimi
        ) p
          ON p.sozlesme_id=s.id
         AND p.kurum_id=s.kurum_id
         AND p.para_birimi=s.para_birimi
        LEFT JOIN (
          SELECT
            e.sozlesme_id,e.kurum_id,b.para_birimi,
            SUM(e.tutar) eslesen_tutar,COUNT(*) esleme_sayisi
          FROM ticari_belge_tahsilat_eslemeleri e
          INNER JOIN ticari_belgeler b
            ON b.id=e.belge_id
           AND b.sozlesme_id=e.sozlesme_id
           AND b.kurum_id=e.kurum_id
           AND b.durum='aktif'
          INNER JOIN kurum_tahsilatlari t
            ON t.id=e.tahsilat_id
           AND t.sozlesme_id=e.sozlesme_id
           AND t.kurum_id=e.kurum_id
           AND t.para_birimi=b.para_birimi
           AND t.durum='aktif'
          WHERE e.durum='aktif'
          GROUP BY e.sozlesme_id,e.kurum_id,b.para_birimi
        ) a
          ON a.sozlesme_id=s.id
         AND a.kurum_id=s.kurum_id
         AND a.para_birimi=s.para_birimi
        WHERE ".implode(' AND ',$where)."
        ORDER BY s.kurum_id,s.id DESC
        LIMIT {$limit}";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    $statusFilter=trim((string)($filters['mutabakat']??''));
    $out=[];
    foreach($rows as $row){
        $contract=(float)$row['toplam_tutar'];
        $documents=(float)$row['belge_toplami'];
        $payments=(float)$row['tahsilat_toplami'];
        $allocated=(float)$row['eslesen_tutar'];

        $row['belgesiz_tutar']=number_format(max(0,$contract-$documents),2,'.','');
        $row['belge_asimi']=number_format(max(0,$documents-$contract),2,'.','');
        $row['acik_belge_tutari']=number_format(max(0,$documents-$allocated),2,'.','');
        $row['dagitilmamis_tahsilat']=number_format(max(0,$payments-$allocated),2,'.','');
        $row['belge_esleme_asimi']=number_format(max(0,$allocated-$documents),2,'.','');
        $row['tahsilat_esleme_asimi']=number_format(max(0,$allocated-$payments),2,'.','');
        $row['finansal_bakiye']=number_format($contract-$payments,2,'.','');

        $hasError=(float)$row['belge_asimi']>0.009
            || (float)$row['belge_esleme_asimi']>0.009
            || (float)$row['tahsilat_esleme_asimi']>0.009;
        $hasGap=(float)$row['belgesiz_tutar']>0.009
            || (float)$row['acik_belge_tutari']>0.009
            || (float)$row['dagitilmamis_tahsilat']>0.009;

        $row['mutabakat_durumu']=$hasError?'hata':($hasGap?'eksik':'tam');
        $row['mutabakat_etiketi']=$hasError?'Veri Kontrolü Gerekli':($hasGap?'Operasyon Açığı':'Mutabık');

        if($statusFilter!=='' && in_array($statusFilter,['hata','eksik','tam'],true)
            && $row['mutabakat_durumu']!==$statusFilter) continue;
        $out[]=$row;
    }

    usort($out,static function(array $a,array $b): int {
        $rank=['hata'=>0,'eksik'=>1,'tam'=>2];
        $ar=$rank[(string)$a['mutabakat_durumu']]??3;
        $br=$rank[(string)$b['mutabakat_durumu']]??3;
        if($ar!==$br) return $ar<=>$br;
        $gapA=(float)$a['belgesiz_tutar']+(float)$a['acik_belge_tutari']+(float)$a['dagitilmamis_tahsilat'];
        $gapB=(float)$b['belgesiz_tutar']+(float)$b['acik_belge_tutari']+(float)$b['dagitilmamis_tahsilat'];
        return $gapB<=>$gapA;
    });

    return $out;
}

function tm_currency_summary(PDO $pdo): array {
    if(!tm_tables_ready($pdo)) return [];
    $rows=tm_contract_rows($pdo,[],2000);
    $out=[];
    foreach($rows as $row){
        $currency=(string)$row['para_birimi'];
        if(!isset($out[$currency])){
            $out[$currency]=[
                'para_birimi'=>$currency,
                'sozlesme_toplami'=>0.0,
                'belge_toplami'=>0.0,
                'tahsilat_toplami'=>0.0,
                'eslesen_tutar'=>0.0,
                'belgesiz_tutar'=>0.0,
                'acik_belge_tutari'=>0.0,
                'dagitilmamis_tahsilat'=>0.0,
                'hata_sayisi'=>0,
                'eksik_sayisi'=>0,
                'tam_sayisi'=>0,
            ];
        }
        $out[$currency]['sozlesme_toplami']+=(float)$row['toplam_tutar'];
        $out[$currency]['belge_toplami']+=(float)$row['belge_toplami'];
        $out[$currency]['tahsilat_toplami']+=(float)$row['tahsilat_toplami'];
        $out[$currency]['eslesen_tutar']+=(float)$row['eslesen_tutar'];
        $out[$currency]['belgesiz_tutar']+=(float)$row['belgesiz_tutar'];
        $out[$currency]['acik_belge_tutari']+=(float)$row['acik_belge_tutari'];
        $out[$currency]['dagitilmamis_tahsilat']+=(float)$row['dagitilmamis_tahsilat'];
        $status=(string)$row['mutabakat_durumu'];
        if(isset($out[$currency][$status.'_sayisi'])) $out[$currency][$status.'_sayisi']++;
    }

    foreach($out as &$row){
        foreach([
            'sozlesme_toplami','belge_toplami','tahsilat_toplami','eslesen_tutar',
            'belgesiz_tutar','acik_belge_tutari','dagitilmamis_tahsilat'
        ] as $key){
            $row[$key]=number_format((float)$row[$key],2,'.','');
        }
    }
    unset($row);

    uksort($out,static function(string $a,string $b): int {
        $rank=['TRY'=>0,'USD'=>1,'EUR'=>2];
        return ($rank[$a]??99)<=>($rank[$b]??99);
    });
    return array_values($out);
}

function tm_open_documents(PDO $pdo,array $filters=[],int $limit=300): array {
    if(!tm_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=["b.durum='aktif'","s.durum IN ('aktif','tamamlandi')"];
    $params=[];

    $institutionId=max(0,(int)($filters['kurum_id']??0));
    if($institutionId>0){
        $where[]='b.kurum_id=?';
        $params[]=$institutionId;
    }

    $stmt=$pdo->prepare("SELECT
        b.id belge_id,b.sozlesme_id,b.kurum_id,b.belge_no,b.belge_turu,b.belge_tarihi,
        b.tutar,b.para_birimi,s.sozlesme_no,k.ad kurum_adi,
        COALESCE(a.eslesen_tutar,0) eslesen_tutar
        FROM ticari_belgeler b
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=b.sozlesme_id
         AND s.kurum_id=b.kurum_id
         AND s.para_birimi=b.para_birimi
        INNER JOIN kurumlar k ON k.id=b.kurum_id
        LEFT JOIN (
          SELECT
            e.belge_id,
            SUM(e.tutar) eslesen_tutar
          FROM ticari_belge_tahsilat_eslemeleri e
          INNER JOIN kurum_tahsilatlari t
            ON t.id=e.tahsilat_id
           AND t.sozlesme_id=e.sozlesme_id
           AND t.kurum_id=e.kurum_id
           AND t.durum='aktif'
          INNER JOIN ticari_belgeler bx
            ON bx.id=e.belge_id
           AND bx.durum='aktif'
          WHERE e.durum='aktif'
          GROUP BY e.belge_id
        ) a ON a.belge_id=b.id
        WHERE ".implode(' AND ',$where)."
          AND b.tutar-COALESCE(a.eslesen_tutar,0)>0.009
        ORDER BY b.belge_tarihi,b.id
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $allocated=(float)$row['eslesen_tutar'];
        $row['eslesen_tutar']=number_format($allocated,2,'.','');
        $row['acik_tutar']=number_format(max(0,(float)$row['tutar']-$allocated),2,'.','');
    }
    unset($row);
    return $rows;
}

function tm_unallocated_payments(PDO $pdo,array $filters=[],int $limit=300): array {
    if(!tm_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $where=["t.durum='aktif'","s.durum IN ('aktif','tamamlandi')"];
    $params=[];

    $institutionId=max(0,(int)($filters['kurum_id']??0));
    if($institutionId>0){
        $where[]='t.kurum_id=?';
        $params[]=$institutionId;
    }

    $stmt=$pdo->prepare("SELECT
        t.id tahsilat_id,t.sozlesme_id,t.kurum_id,t.tahsilat_tarihi,t.tutar,t.para_birimi,
        t.odeme_yontemi,t.referans_no,s.sozlesme_no,k.ad kurum_adi,
        COALESCE(a.eslesen_tutar,0) eslesen_tutar
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=t.sozlesme_id
         AND s.kurum_id=t.kurum_id
         AND s.para_birimi=t.para_birimi
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        LEFT JOIN (
          SELECT
            e.tahsilat_id,
            SUM(e.tutar) eslesen_tutar
          FROM ticari_belge_tahsilat_eslemeleri e
          INNER JOIN ticari_belgeler b
            ON b.id=e.belge_id
           AND b.sozlesme_id=e.sozlesme_id
           AND b.kurum_id=e.kurum_id
           AND b.durum='aktif'
          INNER JOIN kurum_tahsilatlari tx
            ON tx.id=e.tahsilat_id
           AND tx.durum='aktif'
          WHERE e.durum='aktif'
          GROUP BY e.tahsilat_id
        ) a ON a.tahsilat_id=t.id
        WHERE ".implode(' AND ',$where)."
          AND t.tutar-COALESCE(a.eslesen_tutar,0)>0.009
        ORDER BY t.tahsilat_tarihi,t.id
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];
    foreach($rows as &$row){
        $allocated=(float)$row['eslesen_tutar'];
        $row['eslesen_tutar']=number_format($allocated,2,'.','');
        $row['dagitilmamis_tutar']=number_format(max(0,(float)$row['tutar']-$allocated),2,'.','');
    }
    unset($row);
    return $rows;
}

function tm_integrity_issues(PDO $pdo,int $limit=300): array {
    if(!tm_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $issues=[];

    $stmt=$pdo->query("SELECT
        'belge_kimlik_uyumsuz' kod,
        b.id kayit_id,b.sozlesme_id,b.kurum_id,
        b.belge_no referans,b.para_birimi,
        CASE
          WHEN s.id IS NULL THEN 'Belgenin bağlı sözleşmesi bulunamıyor.'
          WHEN s.kurum_id<>b.kurum_id THEN 'Belge kurum kimliği sözleşmeyle uyuşmuyor.'
          WHEN s.para_birimi<>b.para_birimi THEN 'Belge para birimi sözleşmeyle uyuşmuyor.'
          ELSE 'Belge kimlik bütünlüğü bozuk.'
        END aciklama
        FROM ticari_belgeler b
        LEFT JOIN kurum_sozlesmeleri s ON s.id=b.sozlesme_id
        WHERE s.id IS NULL OR s.kurum_id<>b.kurum_id OR s.para_birimi<>b.para_birimi
        ORDER BY b.id
        LIMIT {$limit}");
    if($stmt){
        foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row)$issues[]=$row;
        $stmt->closeCursor();
    }

    if(count($issues)<$limit){
        $remaining=$limit-count($issues);
        $stmt=$pdo->query("SELECT
            'tahsilat_kimlik_uyumsuz' kod,
            t.id kayit_id,t.sozlesme_id,t.kurum_id,
            COALESCE(t.referans_no,CONCAT('#',t.id)) referans,t.para_birimi,
            CASE
              WHEN s.id IS NULL THEN 'Tahsilatın bağlı sözleşmesi bulunamıyor.'
              WHEN s.kurum_id<>t.kurum_id THEN 'Tahsilat kurum kimliği sözleşmeyle uyuşmuyor.'
              WHEN s.para_birimi<>t.para_birimi THEN 'Tahsilat para birimi sözleşmeyle uyuşmuyor.'
              ELSE 'Tahsilat kimlik bütünlüğü bozuk.'
            END aciklama
            FROM kurum_tahsilatlari t
            LEFT JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id
            WHERE s.id IS NULL OR s.kurum_id<>t.kurum_id OR s.para_birimi<>t.para_birimi
            ORDER BY t.id
            LIMIT {$remaining}");
        if($stmt){
            foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row)$issues[]=$row;
            $stmt->closeCursor();
        }
    }

    if(count($issues)<$limit){
        $remaining=$limit-count($issues);
        $stmt=$pdo->query("SELECT
            'esleme_kimlik_uyumsuz' kod,
            e.belge_id kayit_id,e.sozlesme_id,e.kurum_id,
            CONCAT('Belge #',e.belge_id,' / Tahsilat #',e.tahsilat_id) referans,
            COALESCE(b.para_birimi,t.para_birimi,'') para_birimi,
            'Belge-tahsilat eşlemesinin kurum/sözleşme/para birimi ilişkisi uyuşmuyor.' aciklama
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
            ORDER BY e.belge_id,e.tahsilat_id
            LIMIT {$remaining}");
        if($stmt){
            foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row)$issues[]=$row;
            $stmt->closeCursor();
        }
    }

    if(count($issues)<$limit){
        foreach(tm_contract_rows($pdo,['mutabakat'=>'hata'],$limit-count($issues)) as $row){
            $issues[]=[
                'kod'=>'limit_asimi',
                'kayit_id'=>(int)$row['sozlesme_id'],
                'sozlesme_id'=>(int)$row['sozlesme_id'],
                'kurum_id'=>(int)$row['kurum_id'],
                'referans'=>(string)$row['sozlesme_no'],
                'para_birimi'=>(string)$row['para_birimi'],
                'aciklama'=>'Sözleşme/belge/tahsilat eşleme toplamlarından biri izin verilen kapasiteyi aşıyor.',
            ];
            if(count($issues)>=$limit) break;
        }
    }

    return $issues;
}

function tm_status_label(string $status): string {
    return match($status){
        'hata'=>'Veri Kontrolü Gerekli',
        'eksik'=>'Operasyon Açığı',
        'tam'=>'Mutabık',
        default=>'Bilinmiyor',
    };
}
