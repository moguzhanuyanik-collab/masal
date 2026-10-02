<?php
declare(strict_types=1);

function kt360_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo) && auth_runtime_table_exists($pdo,'kurumlar');
}

function kt360_institution(PDO $pdo,int $institutionId): ?array {
    if(!kt360_ready($pdo) || $institutionId<=0) return null;
    $stmt=$pdo->prepare("SELECT id,kod,ad,aktif FROM kurumlar WHERE id=? LIMIT 1");
    $stmt->execute([$institutionId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function kt360_currency_summary(PDO $pdo,int $institutionId): array {
    if(!kt360_ready($pdo) || $institutionId<=0) return [];

    $renewalJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ? "LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.sozlesme_id=s.id AND lys.kurum_id=s.kurum_id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL yenileme_id) lys ON 1=0";

    $stmt=$pdo->prepare("SELECT
        s.para_birimi,
        COUNT(*) sozlesme_sayisi,
        SUM(CASE WHEN s.durum='aktif' THEN 1 ELSE 0 END) aktif_sozlesme,
        SUM(CASE WHEN s.durum='tamamlandi' THEN 1 ELSE 0 END) tamamlanan_sozlesme,
        COALESCE(SUM(CASE WHEN s.durum='aktif' THEN s.toplam_tutar ELSE 0 END),0) aktif_sozlesme_toplami,
        COALESCE(SUM(s.toplam_tutar),0) portfoy_toplami,
        COALESCE(SUM(COALESCE(pay.tahsil_edilen,0)),0) tahsil_edilen,
        COALESCE(SUM(
          CASE
            WHEN s.durum='aktif'
             AND s.vade_tarihi IS NOT NULL
             AND s.vade_tarihi<CURDATE()
             AND s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)>0.009
            THEN s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)
            ELSE 0
          END
        ),0) gecikmis_bakiye,
        SUM(CASE WHEN lys.yenileme_id IS NOT NULL THEN 1 ELSE 0 END) yenileme_sozlesmesi
        FROM kurum_sozlesmeleri s
        LEFT JOIN (
            SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen
            FROM kurum_tahsilatlari
            WHERE durum='aktif'
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$renewalJoin}
        WHERE s.kurum_id=?
          AND s.durum IN ('aktif','tamamlandi')
        GROUP BY s.para_birimi
        ORDER BY FIELD(s.para_birimi,'TRY','USD','EUR'),s.para_birimi");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $total=(float)$row['portfoy_toplami'];
        $paid=(float)$row['tahsil_edilen'];
        $row['aktif_sozlesme_toplami']=number_format((float)$row['aktif_sozlesme_toplami'],2,'.','');
        $row['portfoy_toplami']=number_format($total,2,'.','');
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format(max(0,$total-$paid),2,'.','');
        $row['gecikmis_bakiye']=number_format((float)$row['gecikmis_bakiye'],2,'.','');
        $row['tahsilat_orani']=$total>0?round(min(100,max(0,($paid/$total)*100)),1):0.0;
    }
    unset($row);
    return $rows;
}

function kt360_contract_rows(PDO $pdo,int $institutionId): array {
    if(!kt360_ready($pdo) || $institutionId<=0) return [];

    $renewalJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ? "LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.sozlesme_id=s.id AND lys.kurum_id=s.kurum_id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL yenileme_id) lys ON 1=0";

    $riskJoin=auth_runtime_table_exists($pdo,'ticari_tahsilat_takipleri')
        ? "LEFT JOIN ticari_tahsilat_takipleri tr ON tr.sozlesme_id=s.id AND tr.kurum_id=s.kurum_id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL durum,NULL sonraki_aksiyon_tarihi) tr ON 1=0";

    $reminderJoin=auth_runtime_table_exists($pdo,'ticari_tahsilat_hatirlatmalari')
        ? "LEFT JOIN (
            SELECT sozlesme_id,COUNT(*) hatirlatma_sayisi,MAX(olusturulma_tarihi) son_hatirlatma_tarihi
            FROM ticari_tahsilat_hatirlatmalari
            GROUP BY sozlesme_id
          ) th ON th.sozlesme_id=s.id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,0 hatirlatma_sayisi,NULL son_hatirlatma_tarihi) th ON 1=0";

    $stmt=$pdo->prepare("SELECT
        s.id,s.kurum_id,s.paket_id,s.sozlesme_no,s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum,s.notlar,s.olusturulma_tarihi,s.guncellenme_tarihi,
        p.ad paket_adi,
        COALESCE(pay.tahsil_edilen,0) tahsil_edilen,
        COALESCE(pay.aktif_tahsilat_sayisi,0) aktif_tahsilat_sayisi,
        COALESCE(pay.tahsilat_gecmisi,0) tahsilat_gecmisi,
        pay.son_tahsilat_tarihi,
        lys.yenileme_id,
        tr.durum risk_durumu,
        tr.sonraki_aksiyon_tarihi,
        COALESCE(th.hatirlatma_sayisi,0) hatirlatma_sayisi,
        th.son_hatirlatma_tarihi
        FROM kurum_sozlesmeleri s
        LEFT JOIN paketler p ON p.id=s.paket_id
        LEFT JOIN (
            SELECT
              sozlesme_id,
              COALESCE(SUM(CASE WHEN durum='aktif' THEN tutar ELSE 0 END),0) tahsil_edilen,
              SUM(CASE WHEN durum='aktif' THEN 1 ELSE 0 END) aktif_tahsilat_sayisi,
              COUNT(*) tahsilat_gecmisi,
              MAX(CASE WHEN durum='aktif' THEN tahsilat_tarihi ELSE NULL END) son_tahsilat_tarihi
            FROM kurum_tahsilatlari
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$renewalJoin}
        {$riskJoin}
        {$reminderJoin}
        WHERE s.kurum_id=?
        ORDER BY
          CASE s.durum WHEN 'aktif' THEN 0 WHEN 'taslak' THEN 1 WHEN 'tamamlandi' THEN 2 ELSE 3 END,
          s.vade_tarihi DESC,s.id DESC");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $total=(float)$row['toplam_tutar'];
        $paid=(float)$row['tahsil_edilen'];
        $remaining=max(0,$total-$paid);
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $row['gecikmis']=(
            (string)$row['durum']==='aktif'
            && (string)($row['vade_tarihi']??'')!==''
            && (string)$row['vade_tarihi']<date('Y-m-d')
            && $remaining>0.009
        );
    }
    unset($row);
    return $rows;
}

function kt360_payment_rows(PDO $pdo,int $institutionId,int $limit=300): array {
    if(!kt360_ready($pdo) || $institutionId<=0) return [];
    $limit=max(1,min(1000,$limit));
    $stmt=$pdo->prepare("SELECT
        t.id,t.sozlesme_id,t.kurum_id,t.tahsilat_tarihi,t.tutar,t.para_birimi,
        t.odeme_yontemi,t.referans_no,t.notlar,t.durum,t.iptal_nedeni,t.iptal_tarihi,
        t.olusturulma_tarihi,s.sozlesme_no
        FROM kurum_tahsilatlari t
        LEFT JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id AND s.kurum_id=t.kurum_id
        WHERE t.kurum_id=?
        ORDER BY t.tahsilat_tarihi DESC,t.id DESC
        LIMIT {$limit}");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kt360_renewal_rows(PDO $pdo,int $institutionId,int $limit=100): array {
    if($institutionId<=0 || !auth_runtime_table_exists($pdo,'kurum_lisans_yenilemeleri')) return [];
    $limit=max(1,min(500,$limit));

    $packageJoin=auth_runtime_table_exists($pdo,'paketler')
        ? "LEFT JOIN paketler p ON p.id=y.sonuc_paket_id"
        : "LEFT JOIN (SELECT NULL id,NULL ad) p ON 1=0";

    $contractJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ? "LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.yenileme_id=y.id AND lys.kurum_id=y.kurum_id"
        : "LEFT JOIN (SELECT NULL yenileme_id,NULL kurum_id,NULL sozlesme_id) lys ON 1=0";

    $stmt=$pdo->prepare("SELECT
        y.id,y.lisans_id,y.kurum_id,y.hedef_bitis_tarihi,y.durum,y.son_temas_tarihi,
        y.sonraki_takip_tarihi,y.sonuc_paket_id,y.sonuc_bitis_tarihi,y.kapanma_tarihi,
        y.olusturulma_tarihi,y.guncellenme_tarihi,
        p.ad sonuc_paket_adi,
        lys.sozlesme_id
        FROM kurum_lisans_yenilemeleri y
        {$packageJoin}
        {$contractJoin}
        WHERE y.kurum_id=?
        ORDER BY y.id DESC
        LIMIT {$limit}");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kt360_reminder_rows(PDO $pdo,int $institutionId,int $limit=100): array {
    if($institutionId<=0 || !auth_runtime_table_exists($pdo,'ticari_tahsilat_hatirlatmalari')) return [];
    $limit=max(1,min(500,$limit));
    $stmt=$pdo->prepare("SELECT
        h.id,h.sozlesme_id,h.vade_tarihi,h.esik_kodu,h.acik_tutar,h.para_birimi,
        h.duyuru_id,h.alici_sayisi,h.olusturulma_tarihi,
        s.sozlesme_no
        FROM ticari_tahsilat_hatirlatmalari h
        LEFT JOIN kurum_sozlesmeleri s ON s.id=h.sozlesme_id AND s.kurum_id=h.kurum_id
        WHERE h.kurum_id=?
        ORDER BY h.id DESC
        LIMIT {$limit}");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kt360_counts(PDO $pdo,int $institutionId): array {
    $contracts=kt360_contract_rows($pdo,$institutionId);
    $payments=kt360_payment_rows($pdo,$institutionId,1000);
    $renewals=kt360_renewal_rows($pdo,$institutionId,500);
    $reminders=kt360_reminder_rows($pdo,$institutionId,1000);

    $out=[
        'sozlesme'=>count($contracts),
        'aktif_sozlesme'=>0,
        'gecikmis_sozlesme'=>0,
        'risk_acik'=>0,
        'tahsilat'=>count($payments),
        'aktif_tahsilat'=>0,
        'iptal_tahsilat'=>0,
        'yenileme'=>count($renewals),
        'acik_yenileme'=>0,
        'hatirlatma'=>count($reminders),
    ];

    foreach($contracts as $row){
        if((string)$row['durum']==='aktif') $out['aktif_sozlesme']++;
        if(!empty($row['gecikmis'])) $out['gecikmis_sozlesme']++;
        if(in_array((string)($row['risk_durumu']??''),['acik','temas','odeme_sozu','ihtilaf'],true)) $out['risk_acik']++;
    }
    foreach($payments as $row){
        if((string)$row['durum']==='aktif') $out['aktif_tahsilat']++;
        elseif((string)$row['durum']==='iptal') $out['iptal_tahsilat']++;
    }
    foreach($renewals as $row){
        if(in_array((string)$row['durum'],['acik','temas','teklif'],true)) $out['acik_yenileme']++;
    }

    return $out;
}


function kt360_statement_filters(array $input): array {
    $defaultStart=date('Y-01-01');
    $defaultEnd=(new DateTimeImmutable('today'))->format('Y-m-d');

    $start=trim((string)($input['baslangic']??$defaultStart));
    $end=trim((string)($input['bitis']??$defaultEnd));
    $currency=mb_strtoupper(trim((string)($input['para_birimi']??'')),'UTF-8');
    $type=trim((string)($input['hareket_turu']??'tum'));

    $validDate=static function(string $value): bool {
        $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
        $errors=DateTimeImmutable::getLastErrors();
        return (bool)$date
            && (!is_array($errors) || (($errors['warning_count']??0)===0 && ($errors['error_count']??0)===0))
            && $date->format('Y-m-d')===$value;
    };

    if(!$validDate($start) || !$validDate($end)) throw new RuntimeException('Ekstre tarih aralığını kontrol et.');
    if($start>$end) throw new RuntimeException('Ekstre başlangıç tarihi bitiş tarihinden sonra olamaz.');

    $startDate=new DateTimeImmutable($start);
    $endDate=new DateTimeImmutable($end);
    if($startDate->diff($endDate)->days>1096) throw new RuntimeException('Ekstre dönemi en fazla 3 yıl olabilir.');

    if($currency!=='' && !in_array($currency,['TRY','USD','EUR'],true)){
        throw new RuntimeException('Ekstre para birimi geçersiz.');
    }
    if(!in_array($type,['tum','sozlesme','tahsilat'],true)) $type='tum';

    return [
        'baslangic'=>$start,
        'bitis'=>$end,
        'para_birimi'=>$currency,
        'hareket_turu'=>$type,
    ];
}

function kt360_statement(PDO $pdo,int $institutionId,array $filters,int $limit=5000): array {
    if(!kt360_ready($pdo) || $institutionId<=0){
        return ['filters'=>$filters,'summary'=>[],'rows'=>[],'truncated'=>false];
    }

    $filters=kt360_statement_filters($filters);
    $limit=max(1,min(10000,$limit));
    $start=(string)$filters['baslangic'];
    $end=(string)$filters['bitis'];
    $currency=(string)$filters['para_birimi'];
    $type=(string)$filters['hareket_turu'];

    $currencySql=$currency!==''?' AND para_birimi=?':'';
    $currencySqlS=$currency!==''?' AND s.para_birimi=?':'';
    $currencySqlT=$currency!==''?' AND t.para_birimi=?':'';

    $opening=[];
    $stmt=$pdo->prepare("SELECT para_birimi,SUM(tutar) tutar FROM (
        SELECT s.para_birimi,SUM(s.toplam_tutar) tutar
        FROM kurum_sozlesmeleri s
        WHERE s.kurum_id=?
          AND s.durum IN ('aktif','tamamlandi')
          AND s.baslangic_tarihi<?
          {$currencySqlS}
        GROUP BY s.para_birimi
        UNION ALL
        SELECT t.para_birimi,-SUM(t.tutar) tutar
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=t.sozlesme_id
         AND s.kurum_id=t.kurum_id
         AND s.durum IN ('aktif','tamamlandi')
        WHERE t.kurum_id=?
          AND t.durum='aktif'
          AND t.tahsilat_tarihi<?
          {$currencySqlT}
        GROUP BY t.para_birimi
    ) x GROUP BY para_birimi");
    $params=[$institutionId,$start];
    if($currency!=='')$params[]=$currency;
    $params[]=$institutionId;
    $params[]=$start;
    if($currency!=='')$params[]=$currency;
    $stmt->execute($params);
    foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row){
        $opening[(string)$row['para_birimi']]=(float)$row['tutar'];
    }
    $stmt->closeCursor();

    $summary=[];
    $stmt=$pdo->prepare("SELECT para_birimi,
        SUM(sozlesme_borcu) sozlesme_borcu,
        SUM(tahsilat) tahsilat
        FROM (
          SELECT s.para_birimi,SUM(s.toplam_tutar) sozlesme_borcu,0 tahsilat
          FROM kurum_sozlesmeleri s
          WHERE s.kurum_id=?
            AND s.durum IN ('aktif','tamamlandi')
            AND s.baslangic_tarihi BETWEEN ? AND ?
            {$currencySqlS}
          GROUP BY s.para_birimi
          UNION ALL
          SELECT t.para_birimi,0 sozlesme_borcu,SUM(t.tutar) tahsilat
          FROM kurum_tahsilatlari t
          INNER JOIN kurum_sozlesmeleri s
            ON s.id=t.sozlesme_id
           AND s.kurum_id=t.kurum_id
           AND s.durum IN ('aktif','tamamlandi')
          WHERE t.kurum_id=?
            AND t.durum='aktif'
            AND t.tahsilat_tarihi BETWEEN ? AND ?
            {$currencySqlT}
          GROUP BY t.para_birimi
        ) x
        GROUP BY para_birimi
        ORDER BY FIELD(para_birimi,'TRY','USD','EUR'),para_birimi");
    $params=[$institutionId,$start,$end];
    if($currency!=='')$params[]=$currency;
    $params[]=$institutionId;
    $params[]=$start;
    $params[]=$end;
    if($currency!=='')$params[]=$currency;
    $stmt->execute($params);
    $periodRows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

    $currencies=array_unique(array_merge(array_keys($opening),array_map(
        static fn(array $row):string=>(string)$row['para_birimi'],
        is_array($periodRows)?$periodRows:[]
    )));
    if($currency!=='' && !in_array($currency,$currencies,true))$currencies[]=$currency;
    $order=['TRY'=>0,'USD'=>1,'EUR'=>2];
    usort($currencies,static fn(string $a,string $b):int=>($order[$a]??99)<=>($order[$b]??99));

    $periodMap=[];
    foreach($periodRows as $row)$periodMap[(string)$row['para_birimi']]=$row;
    foreach($currencies as $ccy){
        $open=(float)($opening[$ccy]??0);
        $debit=(float)($periodMap[$ccy]['sozlesme_borcu']??0);
        $credit=(float)($periodMap[$ccy]['tahsilat']??0);
        $summary[]=[
            'para_birimi'=>$ccy,
            'acilis_bakiyesi'=>number_format($open,2,'.',''),
            'donem_borcu'=>number_format($debit,2,'.',''),
            'donem_tahsilati'=>number_format($credit,2,'.',''),
            'kapanis_bakiyesi'=>number_format($open+$debit-$credit,2,'.',''),
        ];
    }

    $stmt=$pdo->prepare("SELECT * FROM (
        SELECT
          s.baslangic_tarihi hareket_tarihi,
          'sozlesme' hareket_turu,
          s.id kaynak_id,
          s.sozlesme_no referans,
          CONCAT('Sözleşme borcu · ',COALESCE(p.ad,'Paket yok')) aciklama,
          s.para_birimi,
          s.toplam_tutar borc,
          0 tahsilat,
          s.id sozlesme_id,
          NULL odeme_yontemi
        FROM kurum_sozlesmeleri s
        LEFT JOIN paketler p ON p.id=s.paket_id
        WHERE s.kurum_id=?
          AND s.durum IN ('aktif','tamamlandi')
          AND s.baslangic_tarihi BETWEEN ? AND ?
          {$currencySqlS}
        UNION ALL
        SELECT
          t.tahsilat_tarihi hareket_tarihi,
          'tahsilat' hareket_turu,
          t.id kaynak_id,
          COALESCE(NULLIF(t.referans_no,''),CONCAT('TAH-',t.id)) referans,
          CONCAT('Tahsilat · ',s.sozlesme_no) aciklama,
          t.para_birimi,
          0 borc,
          t.tutar tahsilat,
          t.sozlesme_id,
          t.odeme_yontemi
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=t.sozlesme_id
         AND s.kurum_id=t.kurum_id
         AND s.durum IN ('aktif','tamamlandi')
        WHERE t.kurum_id=?
          AND t.durum='aktif'
          AND t.tahsilat_tarihi BETWEEN ? AND ?
          {$currencySqlT}
    ) m
    ORDER BY
      FIELD(para_birimi,'TRY','USD','EUR'),para_birimi,
      hareket_tarihi,
      CASE hareket_turu WHEN 'sozlesme' THEN 0 ELSE 1 END,
      kaynak_id
    LIMIT ".($limit+1));
    $params=[$institutionId,$start,$end];
    if($currency!=='')$params[]=$currency;
    $params[]=$institutionId;
    $params[]=$start;
    $params[]=$end;
    if($currency!=='')$params[]=$currency;
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows))$rows=[];

    $running=[];
    foreach($opening as $ccy=>$amount)$running[$ccy]=(float)$amount;

    $visibleRows=[];
    foreach($rows as $row){
        $ccy=(string)$row['para_birimi'];
        if(!array_key_exists($ccy,$running))$running[$ccy]=0.0;
        $running[$ccy]+=(float)$row['borc']-(float)$row['tahsilat'];

        $row['borc']=number_format((float)$row['borc'],2,'.','');
        $row['tahsilat']=number_format((float)$row['tahsilat'],2,'.','');
        $row['bakiye']=number_format($running[$ccy],2,'.','');

        if($type==='sozlesme' && (string)$row['hareket_turu']!=='sozlesme') continue;
        if($type==='tahsilat' && (string)$row['hareket_turu']!=='tahsilat') continue;
        $visibleRows[]=$row;
    }

    $truncated=count($visibleRows)>$limit;
    if($truncated)$visibleRows=array_slice($visibleRows,0,$limit);

    return [
        'filters'=>$filters,
        'summary'=>$summary,
        'rows'=>$visibleRows,
        'truncated'=>$truncated,
    ];
}
