<?php
declare(strict_types=1);

function tsd_teacher_questions(
    PDO $pdo,
    int $teacherUserId,
    int $institutionId=0,
    string $publication='tum'
): array {
    if($teacherUserId<=0) return [];
    if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';

    $teacher=oi_teacher_profile($pdo,$teacherUserId);
    if(!$teacher) return [];
    $teacherId=(int)$teacher['id'];

    $where=["oi.ogretmen_id=?","oi.icerik_turu='soru'"];
    $params=[$teacherId];

    if($institutionId>0){
        if(!oi_teacher_can_use_institution($pdo,$teacherUserId,$institutionId)) return [];
        $where[]='oi.kurum_id=?';
        $params[]=$institutionId;
    }
    if($publication==='aktif') $where[]='oi.aktif=1';
    elseif($publication==='pasif') $where[]='oi.aktif=0';

    $rewardSelect=oi_table_exists($pdo,'ogretmen_icerik_yildiz_odulleri')
        ?",COUNT(DISTINCT CASE WHEN yr.ogrenci_id IS NOT NULL THEN o.id END) odullendirilen_sayisi,
           COALESCE(SUM(CASE WHEN o.id IS NOT NULL THEN yr.yildiz_degeri ELSE 0 END),0) dagitilan_yildiz"
        :",0 odullendirilen_sayisi,0 dagitilan_yildiz";
    $rewardJoin=oi_table_exists($pdo,'ogretmen_icerik_yildiz_odulleri')
        ?"LEFT JOIN ogretmen_icerik_yildiz_odulleri yr
            ON yr.icerik_id=oi.id
           AND yr.ogrenci_id=o.id"
        :"";

    $sql="SELECT oi.id,oi.kurum_id,oi.baslik,oi.soru,oi.yildiz_degeri,oi.aktif,oi.olusturulma_tarihi,
        k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
        COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
        COUNT(DISTINCT CASE
          WHEN o.id IS NOT NULL
           AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
          THEN o.id END) hedef_sayisi,
        COUNT(DISTINCT CASE
          WHEN o.id IS NOT NULL
           AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
           AND c.secilen_cevap_indeksi IS NOT NULL
          THEN o.id END) cevaplayan_sayisi,
        COUNT(DISTINCT CASE
          WHEN o.id IS NOT NULL
           AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
           AND c.dogru=1
          THEN o.id END) dogru_sayisi,
        COUNT(DISTINCT CASE
          WHEN o.id IS NOT NULL
           AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
           AND c.secilen_cevap_indeksi IS NOT NULL
           AND c.dogru=0
          THEN o.id END) yanlis_sayisi
        {$rewardSelect}
        FROM ogretmen_icerikleri oi
        INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
        INNER JOIN dersler d ON d.id=oi.ders_id AND d.aktif=1
        LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
        INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
        INNER JOIN kullanicilar tu ON tu.id=og.kullanici_id AND tu.aktif=1
        INNER JOIN kurum_kullanicilari tk
          ON tk.kullanici_id=tu.id
         AND tk.kurum_id=oi.kurum_id
         AND tk.kurum_rolu='ogretmen'
         AND tk.aktif=1
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
        {$rewardJoin}
        WHERE ".implode(' AND ',$where)."
          AND (o.id IS NULL OR (su.id IS NOT NULL AND sk.kullanici_id IS NOT NULL))
        GROUP BY oi.id,oi.kurum_id,oi.baslik,oi.soru,oi.yildiz_degeri,oi.aktif,oi.olusturulma_tarihi,
                 k.ad,d.ad,d.emoji,dm.baslik,oi.konu_basligi
        ORDER BY oi.aktif DESC,oi.olusturulma_tarihi DESC,oi.id DESC";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$row){
        $target=(int)$row['hedef_sayisi'];
        $answered=(int)$row['cevaplayan_sayisi'];
        $correct=(int)$row['dogru_sayisi'];
        $row['bekleyen_sayisi']=max(0,$target-$answered);
        $row['cevaplanma_orani']=$target>0?(int)round($answered*100/$target):0;
        $row['dogruluk_orani']=$answered>0?(int)round($correct*100/$answered):0;
        $row['performans_durumu']=tsd_question_state($row);
    }
    unset($row);

    return $rows;
}

function tsd_question_state(array $row): string {
    $target=(int)($row['hedef_sayisi']??0);
    $answered=(int)($row['cevaplayan_sayisi']??0);
    $correct=(int)($row['dogru_sayisi']??0);
    $wrong=(int)($row['yanlis_sayisi']??0);
    $waiting=max(0,$target-$answered);

    if($target<=0) return 'no_target';
    if($correct===$target) return 'all_correct';
    if($wrong>0) return 'wrong';
    if($waiting>0) return 'waiting';
    return 'waiting';
}

function tsd_filter_questions(array $rows,string $performance='tum'): array {
    if(!in_array($performance,['tum','waiting','wrong','all_correct','no_target'],true)) $performance='tum';
    if($performance==='tum') return array_values($rows);
    return array_values(array_filter(
        $rows,
        static fn(array $row): bool => (string)($row['performans_durumu']??'')===$performance
    ));
}

function tsd_dashboard_summary(array $rows): array {
    $summary=[
        'total'=>count($rows),
        'active'=>0,
        'targets'=>0,
        'answered'=>0,
        'correct'=>0,
        'wrong'=>0,
        'waiting'=>0,
        'all_correct'=>0,
        'reward_stars'=>0,
    ];

    foreach($rows as $row){
        if((int)($row['aktif']??0)===1) $summary['active']++;
        $summary['targets']+=(int)($row['hedef_sayisi']??0);
        $summary['answered']+=(int)($row['cevaplayan_sayisi']??0);
        $summary['correct']+=(int)($row['dogru_sayisi']??0);
        $summary['wrong']+=(int)($row['yanlis_sayisi']??0);
        $summary['waiting']+=(int)($row['bekleyen_sayisi']??0);
        $summary['reward_stars']+=(int)($row['dagitilan_yildiz']??0);
        if((string)($row['performans_durumu']??'')==='all_correct') $summary['all_correct']++;
    }

    $summary['answer_rate']=$summary['targets']>0
        ?(int)round($summary['answered']*100/$summary['targets'])
        :0;
    $summary['accuracy']=$summary['answered']>0
        ?(int)round($summary['correct']*100/$summary['answered'])
        :0;

    return $summary;
}

function tsd_state_label(string $state): string {
    return match($state){
        'all_correct'=>'Tümü doğru',
        'wrong'=>'Yanlış cevap var',
        'no_target'=>'Hedef öğrenci yok',
        default=>'Cevap bekliyor',
    };
}
