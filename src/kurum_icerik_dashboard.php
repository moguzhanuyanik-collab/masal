<?php
declare(strict_types=1);

function kic_contents(
    PDO $pdo,
    int $institutionId,
    int $teacherId=0,
    string $type='tum',
    string $publication='tum'
): array {
    if($institutionId<=0) return [];
    if(!in_array($type,['tum','soru','tekrar','odev','not','diger'],true)) $type='tum';
    if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';

    $where=['oi.kurum_id=?'];
    $params=[$institutionId];

    if($teacherId>0){
        $where[]='oi.ogretmen_id=?';
        $params[]=$teacherId;
    }
    if($type!=='tum'){
        $where[]='oi.icerik_turu=?';
        $params[]=$type;
    }
    if($publication==='aktif') $where[]='oi.aktif=1';
    elseif($publication==='pasif') $where[]='oi.aktif=0';

    $validTarget="o.id IS NOT NULL
      AND su.id IS NOT NULL
      AND sk.kullanici_id IS NOT NULL
      AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)";

    $sql="SELECT oi.id,oi.kurum_id,oi.ogretmen_id,oi.ders_id,oi.ders_modulu_id,oi.konu_basligi,
      oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.yildiz_degeri,oi.hedef_turu,
      oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,
      COALESCE(NULLIF(TRIM(og.ad_soyad),''),u.ad_soyad) ogretmen_adi,
      d.ad ders_adi,d.emoji ders_emoji,
      COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
      COUNT(DISTINCT CASE WHEN {$validTarget} THEN o.id END) hedef_sayisi,
      COUNT(DISTINCT CASE WHEN {$validTarget}
        AND c.secilen_cevap_indeksi IS NOT NULL THEN o.id END) cevaplayan_sayisi,
      COUNT(DISTINCT CASE WHEN {$validTarget}
        AND c.dogru=1 THEN o.id END) dogru_sayisi,
      COUNT(DISTINCT CASE WHEN {$validTarget}
        AND c.secilen_cevap_indeksi IS NOT NULL
        AND c.dogru=0 THEN o.id END) yanlis_sayisi,
      COUNT(DISTINCT CASE WHEN {$validTarget}
        AND od.tamamlandi=1 THEN o.id END) tamamlayan_sayisi,
      COUNT(DISTINCT CASE WHEN {$validTarget}
        AND oi.icerik_turu='odev'
        AND COALESCE(od.tamamlandi,0)=0
        AND oi.teslim_tarihi IS NOT NULL
        AND oi.teslim_tarihi<NOW()
        THEN o.id END) geciken_sayisi
      FROM ogretmen_icerikleri oi
      INNER JOIN kurumlar k
        ON k.id=oi.kurum_id
       AND k.aktif=1
      INNER JOIN ogretmenler og
        ON og.id=oi.ogretmen_id
       AND og.aktif=1
      INNER JOIN kullanicilar u
        ON u.id=og.kullanici_id
       AND u.aktif=1
      INNER JOIN kurum_kullanicilari tk
        ON tk.kullanici_id=u.id
       AND tk.kurum_id=oi.kurum_id
       AND tk.kurum_rolu='ogretmen'
       AND tk.aktif=1
      INNER JOIN dersler d
        ON d.id=oi.ders_id
       AND d.aktif=1
      LEFT JOIN ders_modulleri dm
        ON dm.id=oi.ders_modulu_id
      LEFT JOIN ogretmen_ogrenci oo
        ON oo.ogretmen_id=oi.ogretmen_id
       AND oo.kurum_id=oi.kurum_id
      LEFT JOIN ogrenciler o
        ON o.id=oo.ogrenci_id
       AND o.aktif=1
      LEFT JOIN kullanicilar su
        ON su.id=o.kullanici_id
       AND su.aktif=1
      LEFT JOIN kurum_kullanicilari sk
        ON sk.kullanici_id=o.kullanici_id
       AND sk.kurum_id=oi.kurum_id
       AND sk.kurum_rolu='ogrenci'
       AND sk.aktif=1
      LEFT JOIN ogretmen_icerik_hedefleri h
        ON h.icerik_id=oi.id
       AND h.ogrenci_id=o.id
      LEFT JOIN ogretmen_icerik_cevaplari c
        ON c.icerik_id=oi.id
       AND c.ogrenci_id=o.id
      LEFT JOIN ogrenci_odev_durumlari od
        ON od.icerik_id=oi.id
       AND od.ogrenci_id=o.id
      WHERE ".implode(' AND ',$where)."
      GROUP BY oi.id,oi.kurum_id,oi.ogretmen_id,oi.ders_id,oi.ders_modulu_id,oi.konu_basligi,
        oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.yildiz_degeri,oi.hedef_turu,
        oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,og.ad_soyad,u.ad_soyad,d.ad,d.emoji,dm.baslik
      ORDER BY oi.aktif DESC,oi.olusturulma_tarihi DESC,oi.id DESC";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $target=(int)($row['hedef_sayisi']??0);
        $typeValue=(string)($row['icerik_turu']??'');

        if($typeValue==='soru'){
            $answered=(int)($row['cevaplayan_sayisi']??0);
            $correct=(int)($row['dogru_sayisi']??0);
            $row['bekleyen_sayisi']=max(0,$target-$answered);
            $row['cevaplanma_orani']=$target>0?(int)round($answered*100/$target):0;
            $row['performans_orani']=$answered>0?(int)round($correct*100/$answered):0;
        }elseif($typeValue==='odev'){
            $completed=(int)($row['tamamlayan_sayisi']??0);
            $overdue=(int)($row['geciken_sayisi']??0);
            $row['bekleyen_sayisi']=max(0,$target-$completed-$overdue);
            $row['cevaplanma_orani']=0;
            $row['performans_orani']=$target>0?(int)round($completed*100/$target):0;
        }else{
            $row['bekleyen_sayisi']=0;
            $row['cevaplanma_orani']=0;
            $row['performans_orani']=0;
        }

        $row['performans_durumu']=kic_performance_state($row);
    }
    unset($row);

    return $rows;
}

function kic_performance_state(array $row): string {
    $type=(string)($row['icerik_turu']??'');
    $target=(int)($row['hedef_sayisi']??0);

    if(in_array($type,['tekrar','not','diger'],true)) return 'info';
    if($target<=0) return 'no_target';

    if($type==='soru'){
        if((int)($row['yanlis_sayisi']??0)>0) return 'attention';
        if((int)($row['bekleyen_sayisi']??0)>0) return 'waiting';
        if((int)($row['dogru_sayisi']??0)===$target) return 'completed';
        return 'waiting';
    }

    if($type==='odev'){
        if((int)($row['geciken_sayisi']??0)>0) return 'attention';
        if((int)($row['bekleyen_sayisi']??0)>0) return 'waiting';
        if((int)($row['tamamlayan_sayisi']??0)===$target) return 'completed';
        return 'waiting';
    }

    return 'info';
}

function kic_filter_performance(array $rows,string $performance='tum'): array {
    if(!in_array($performance,['tum','attention','waiting','completed','no_target','info'],true)){
        $performance='tum';
    }
    if($performance==='tum') return array_values($rows);

    return array_values(array_filter(
        $rows,
        static fn(array $row): bool => (string)($row['performans_durumu']??'')===$performance
    ));
}

function kic_summary(array $rows): array {
    $summary=[
        'total'=>count($rows),
        'active'=>0,
        'target_assignments'=>0,
        'question_answers'=>0,
        'question_correct'=>0,
        'question_wrong'=>0,
        'question_waiting'=>0,
        'homework_completed'=>0,
        'homework_overdue'=>0,
        'homework_waiting'=>0,
        'attention_contents'=>0,
        'completed_contents'=>0,
        'no_target_contents'=>0,
    ];

    foreach($rows as $row){
        if((int)($row['aktif']??0)===1) $summary['active']++;
        $summary['target_assignments']+=(int)($row['hedef_sayisi']??0);

        if((string)($row['icerik_turu']??'')==='soru'){
            $summary['question_answers']+=(int)($row['cevaplayan_sayisi']??0);
            $summary['question_correct']+=(int)($row['dogru_sayisi']??0);
            $summary['question_wrong']+=(int)($row['yanlis_sayisi']??0);
            $summary['question_waiting']+=(int)($row['bekleyen_sayisi']??0);
        }elseif((string)($row['icerik_turu']??'')==='odev'){
            $summary['homework_completed']+=(int)($row['tamamlayan_sayisi']??0);
            $summary['homework_overdue']+=(int)($row['geciken_sayisi']??0);
            $summary['homework_waiting']+=(int)($row['bekleyen_sayisi']??0);
        }

        $state=(string)($row['performans_durumu']??'');
        if($state==='attention') $summary['attention_contents']++;
        elseif($state==='completed') $summary['completed_contents']++;
        elseif($state==='no_target') $summary['no_target_contents']++;
    }

    $summary['question_accuracy']=$summary['question_answers']>0
        ?(int)round($summary['question_correct']*100/$summary['question_answers'])
        :0;

    $homeworkTotal=$summary['homework_completed']+$summary['homework_overdue']+$summary['homework_waiting'];
    $summary['homework_completion']=$homeworkTotal>0
        ?(int)round($summary['homework_completed']*100/$homeworkTotal)
        :0;

    return $summary;
}

function kic_performance_label(string $state): string {
    return match($state){
        'attention'=>'Dikkat gerekiyor',
        'waiting'=>'Bekliyor',
        'completed'=>'Tümü tamamlandı',
        'no_target'=>'Hedef öğrenci yok',
        'info'=>'Bilgi içeriği',
        default=>'Tümü',
    };
}
