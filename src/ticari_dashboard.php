<?php
declare(strict_types=1);

function td_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo);
}

function td_currency_kpis(PDO $pdo): array {
    if(!td_tables_ready($pdo)) return [];

    $renewalJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ? "LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.sozlesme_id=s.id AND lys.kurum_id=s.kurum_id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL yenileme_id) lys ON 1=0";

    $sql="SELECT
        s.para_birimi,
        COUNT(*) sozlesme_sayisi,
        COUNT(DISTINCT s.kurum_id) kurum_sayisi,
        SUM(CASE WHEN s.durum='aktif' THEN 1 ELSE 0 END) aktif_sozlesme,
        SUM(CASE WHEN s.durum='tamamlandi' THEN 1 ELSE 0 END) tamamlanan_sozlesme,
        COALESCE(SUM(CASE WHEN s.durum='aktif' THEN s.toplam_tutar ELSE 0 END),0) aktif_sozlesme_toplami,
        COALESCE(SUM(CASE WHEN s.durum='tamamlandi' THEN s.toplam_tutar ELSE 0 END),0) tamamlanan_sozlesme_toplami,
        COALESCE(SUM(s.toplam_tutar),0) sozlesme_toplami,
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
        COALESCE(SUM(s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)),0) kalan_bakiye,
        SUM(
          CASE
            WHEN s.durum='aktif'
             AND s.vade_tarihi IS NOT NULL
             AND s.vade_tarihi<CURDATE()
             AND s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)>0.009
            THEN 1 ELSE 0
          END
        ) gecikmis_sozlesme,
        SUM(CASE WHEN lys.yenileme_id IS NOT NULL THEN 1 ELSE 0 END) yenileme_sozlesmesi,
        COALESCE(SUM(CASE WHEN lys.yenileme_id IS NOT NULL THEN s.toplam_tutar ELSE 0 END),0) yenileme_sozlesme_toplami,
        COALESCE(SUM(CASE WHEN lys.yenileme_id IS NOT NULL THEN COALESCE(pay.tahsil_edilen,0) ELSE 0 END),0) yenileme_tahsil_edilen
        FROM kurum_sozlesmeleri s
        LEFT JOIN (
            SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen
            FROM kurum_tahsilatlari
            WHERE durum='aktif'
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$renewalJoin}
        WHERE s.durum IN ('aktif','tamamlandi')
        GROUP BY s.para_birimi
        ORDER BY FIELD(s.para_birimi,'TRY','USD','EUR'),s.para_birimi";

    $stmt=$pdo->query($sql);
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $total=(float)$row['sozlesme_toplami'];
        $paid=(float)$row['tahsil_edilen'];
        $remaining=max(0,$total-$paid);
        $renewalTotal=(float)$row['yenileme_sozlesme_toplami'];
        $renewalPaid=(float)$row['yenileme_tahsil_edilen'];

        $row['aktif_sozlesme_toplami']=number_format((float)$row['aktif_sozlesme_toplami'],2,'.','');
        $row['tamamlanan_sozlesme_toplami']=number_format((float)$row['tamamlanan_sozlesme_toplami'],2,'.','');
        $row['sozlesme_toplami']=number_format($total,2,'.','');
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format($remaining,2,'.','');
        $row['gecikmis_bakiye']=number_format((float)$row['gecikmis_bakiye'],2,'.','');
        $row['yenileme_sozlesme_toplami']=number_format($renewalTotal,2,'.','');
        $row['yenileme_tahsil_edilen']=number_format($renewalPaid,2,'.','');
        $row['yenileme_kalan_tutar']=number_format(max(0,$renewalTotal-$renewalPaid),2,'.','');
        $row['tahsilat_orani']=$total>0?round(min(100,max(0,($paid/$total)*100)),1):0.0;
        $row['yenileme_tahsilat_orani']=$renewalTotal>0?round(min(100,max(0,($renewalPaid/$renewalTotal)*100)),1):0.0;
    }
    unset($row);
    return $rows;
}

function td_monthly_collections(PDO $pdo,int $months=6): array {
    if(!td_tables_ready($pdo)) return [];
    $months=max(1,min(24,$months));
    $start=(new DateTimeImmutable('first day of this month'))->modify('-'.($months-1).' months')->format('Y-m-d');

    $stmt=$pdo->prepare("SELECT
        DATE_FORMAT(t.tahsilat_tarihi,'%Y-%m') ay,
        t.para_birimi,
        COALESCE(SUM(t.tutar),0) tahsilat_toplami,
        COUNT(*) tahsilat_sayisi,
        COUNT(DISTINCT t.kurum_id) kurum_sayisi
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=t.sozlesme_id
         AND s.kurum_id=t.kurum_id
         AND s.durum IN ('aktif','tamamlandi')
        WHERE t.durum='aktif'
          AND t.tahsilat_tarihi>=?
        GROUP BY DATE_FORMAT(t.tahsilat_tarihi,'%Y-%m'),t.para_birimi
        ORDER BY ay,t.para_birimi");
    $stmt->execute([$start]);
    $raw=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($raw)) $raw=[];

    $map=[];
    foreach($raw as $row){
        $map[(string)$row['ay']][(string)$row['para_birimi']]=$row;
    }

    $out=[];
    $cursor=new DateTimeImmutable($start);
    for($i=0;$i<$months;$i++){
        $month=$cursor->format('Y-m');
        foreach(['TRY','USD','EUR'] as $currency){
            $row=$map[$month][$currency]??null;
            if(!$row) continue;
            $out[]=[
                'ay'=>$month,
                'para_birimi'=>$currency,
                'tahsilat_toplami'=>number_format((float)$row['tahsilat_toplami'],2,'.',''),
                'tahsilat_sayisi'=>(int)$row['tahsilat_sayisi'],
                'kurum_sayisi'=>(int)$row['kurum_sayisi'],
            ];
        }
        $cursor=$cursor->modify('+1 month');
    }
    return $out;
}

function td_institution_rows(PDO $pdo,array $filters=[],int $limit=300): array {
    if(!td_tables_ready($pdo)) return [];
    $limit=max(1,min(1000,$limit));
    $currency=mb_strtoupper(trim((string)($filters['para_birimi']??'')),'UTF-8');
    if($currency!=='' && !in_array($currency,['TRY','USD','EUR'],true)) $currency='';
    $query=trim((string)($filters['q']??''));

    $where=["s.durum IN ('aktif','tamamlandi')"];
    $params=[];
    if($currency!==''){
        $where[]='s.para_birimi=?';
        $params[]=$currency;
    }
    if($query!==''){
        $where[]='(k.ad LIKE ? OR k.kod LIKE ?)';
        $like='%'.$query.'%';
        $params[]=$like;
        $params[]=$like;
    }

    $renewalJoin=auth_runtime_table_exists($pdo,'lisans_yenileme_sozlesmeleri')
        ? "LEFT JOIN lisans_yenileme_sozlesmeleri lys ON lys.sozlesme_id=s.id AND lys.kurum_id=s.kurum_id"
        : "LEFT JOIN (SELECT NULL sozlesme_id,NULL kurum_id,NULL yenileme_id) lys ON 1=0";

    $stmt=$pdo->prepare("SELECT
        s.kurum_id,k.ad kurum_adi,k.kod kurum_kodu,s.para_birimi,
        COUNT(*) sozlesme_sayisi,
        SUM(CASE WHEN s.durum='aktif' THEN 1 ELSE 0 END) aktif_sozlesme,
        COALESCE(SUM(s.toplam_tutar),0) sozlesme_toplami,
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
        COALESCE(SUM(s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)),0) kalan_bakiye,
        SUM(
          CASE
            WHEN s.durum='aktif'
             AND s.vade_tarihi IS NOT NULL
             AND s.vade_tarihi<CURDATE()
             AND s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)>0.009
            THEN 1 ELSE 0
          END
        ) gecikmis_sozlesme,
        SUM(CASE WHEN lys.yenileme_id IS NOT NULL THEN 1 ELSE 0 END) yenileme_sozlesmesi,
        MAX(pay.son_tahsilat_tarihi) son_tahsilat_tarihi
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN (
            SELECT
              sozlesme_id,
              COALESCE(SUM(CASE WHEN durum='aktif' THEN tutar ELSE 0 END),0) tahsil_edilen,
              MAX(CASE WHEN durum='aktif' THEN tahsilat_tarihi ELSE NULL END) son_tahsilat_tarihi
            FROM kurum_tahsilatlari
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$renewalJoin}
        WHERE ".implode(' AND ',$where)."
        GROUP BY s.kurum_id,k.ad,k.kod,s.para_birimi
        ORDER BY
          gecikmis_bakiye DESC,
          kalan_bakiye DESC,
          k.ad,s.para_birimi
        LIMIT {$limit}");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $total=(float)$row['sozlesme_toplami'];
        $paid=(float)$row['tahsil_edilen'];
        $row['sozlesme_toplami']=number_format($total,2,'.','');
        $row['tahsil_edilen']=number_format($paid,2,'.','');
        $row['kalan_tutar']=number_format(max(0,$total-$paid),2,'.','');
        $row['gecikmis_bakiye']=number_format((float)$row['gecikmis_bakiye'],2,'.','');
        $row['tahsilat_orani']=$total>0?round(min(100,max(0,($paid/$total)*100)),1):0.0;
    }
    unset($row);
    return $rows;
}

function td_recent_payments(PDO $pdo,int $limit=15): array {
    if(!td_tables_ready($pdo)) return [];
    $limit=max(1,min(100,$limit));
    $stmt=$pdo->query("SELECT
        t.id,t.sozlesme_id,t.kurum_id,t.tahsilat_tarihi,t.tutar,t.para_birimi,t.odeme_yontemi,
        t.referans_no,t.olusturulma_tarihi,
        s.sozlesme_no,k.ad kurum_adi
        FROM kurum_tahsilatlari t
        INNER JOIN kurum_sozlesmeleri s
          ON s.id=t.sozlesme_id
         AND s.kurum_id=t.kurum_id
         AND s.durum IN ('aktif','tamamlandi')
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        WHERE t.durum='aktif'
        ORDER BY t.tahsilat_tarihi DESC,t.id DESC
        LIMIT {$limit}");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function td_operational_counts(PDO $pdo): array {
    $out=[
        'risk_open'=>0,
        'risk_critical'=>0,
        'risk_followup_due'=>0,
        'reminder_total'=>0,
        'renewal_open'=>0,
        'renewal_commercial_gap'=>0,
        'reconciliation_open'=>0,
        'reconciliation_overdue'=>0,
        'reconciliation_unassigned'=>0,
    ];

    if(function_exists('tr_tables_ready') && tr_tables_ready($pdo)){
        $risk=tr_summary($pdo);
        $out['risk_open']=(int)($risk['open']??0);
        $out['risk_critical']=(int)($risk['31_plus']??0);
        $out['risk_followup_due']=(int)($risk['aksiyon_bekleyen']??0);
    }

    if(function_exists('th_tables_ready') && th_tables_ready($pdo)){
        $reminders=th_summary($pdo);
        $out['reminder_total']=(int)($reminders['toplam']??0);
    }

    if(function_exists('ly_tables_ready') && ly_tables_ready($pdo)){
        $renewals=ly_summary($pdo);
        $out['renewal_open']=(int)($renewals['acik']??0);
    }

    if(function_exists('lyt_tables_ready') && lyt_tables_ready($pdo)){
        $gaps=lyt_gap_summary($pdo);
        $out['renewal_commercial_gap']=
            (int)($gaps['sozlesme_yok']??0)
            +(int)($gaps['sozlesme_kaydi_yok']??0)
            +(int)($gaps['sozlesme_iptal']??0)
            +(int)($gaps['sozlesme_taslak']??0)
            +(int)($gaps['tahsilat_yok']??0)
            +(int)($gaps['kismi_tahsilat']??0);
    }

    if(function_exists('mhs_tables_ready') && mhs_tables_ready($pdo)){
        $health=mhs_summary($pdo);
        $out['reconciliation_open']=(int)($health['open']??0);
        $out['reconciliation_overdue']=(int)($health['aksiyon_gecikti']??0);
        $out['reconciliation_unassigned']=(int)($health['sahipsiz']??0);
    }

    return $out;
}
