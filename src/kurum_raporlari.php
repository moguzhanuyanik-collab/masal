<?php
declare(strict_types=1);

function kr_validate_date(string $value): string {
    $value=trim($value);
    if($value==='') return '';
    if(!preg_match('/^20\d\d-\d\d-\d\d$/',$value)) throw new RuntimeException('Geçersiz tarih filtresi.');
    $parsed=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$parsed || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $parsed->format('Y-m-d')!==$value){
        throw new RuntimeException('Geçersiz tarih filtresi.');
    }
    return $value;
}

function kr_active_groups(PDO $pdo,int $institutionId): array {
    if($institutionId<=0) return [];
    $stmt=$pdo->prepare("SELECT id,ad,tur,sinif_seviyesi
        FROM kurum_siniflari
        WHERE kurum_id=? AND aktif=1
        ORDER BY COALESCE(sinif_seviyesi,99),tur,ad,id");
    $stmt->execute([$institutionId]);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kr_resolve_group(PDO $pdo,int $institutionId,int $groupId): ?array {
    if($groupId<=0) return null;
    $stmt=$pdo->prepare("SELECT id,ad,tur,sinif_seviyesi
        FROM kurum_siniflari
        WHERE id=? AND kurum_id=? AND aktif=1
        LIMIT 1");
    $stmt->execute([$groupId,$institutionId]);
    $row=$stmt->fetch();
    $stmt->closeCursor();
    if(!is_array($row)) throw new RuntimeException('Seçilen sınıf / grup bu kuruma ait değil veya aktif değil.');
    return $row;
}

function kr_date_sql(string $column,string $start,string $end,array &$params): string {
    $parts=[];
    if($start!==''){
        $parts[]=$column.' >= ?';
        $params[]=$start.' 00:00:00';
    }
    if($end!==''){
        $parts[]=$column.' <= ?';
        $params[]=$end.' 23:59:59';
    }
    return $parts?' AND '.implode(' AND ',$parts):'';
}

function kr_report_rows(
    PDO $pdo,
    int $institutionId,
    int $grade=0,
    int $groupId=0,
    string $start='',
    string $end=''
): array {
    if($institutionId<=0) throw new RuntimeException('Kurum bulunamadı.');
    if($grade<0 || $grade>8) throw new RuntimeException('Sınıf filtresi geçersiz.');
    $start=kr_validate_date($start);
    $end=kr_validate_date($end);
    if($start!=='' && $end!=='' && $start>$end) throw new RuntimeException('Başlangıç tarihi bitişten sonra olamaz.');

    kr_resolve_group($pdo,$institutionId,$groupId);

    $systemParams=[];
    $systemDate=kr_date_sql('cevap_tarihi',$start,$end,$systemParams);

    $teacherParams=[$institutionId];
    $teacherDate=kr_date_sql('c.cevap_tarihi',$start,$end,$teacherParams);

    $homeworkParams=[$institutionId];
    $homeworkDate=kr_date_sql('oi.olusturulma_tarihi',$start,$end,$homeworkParams);

    $sql="SELECT o.id,o.ad,o.email,o.sinif_seviyesi,
        COALESCE(sa.sistem_yanit,0) sistem_yanit,
        COALESCE(sa.sistem_dogru,0) sistem_dogru,
        COALESCE(tq.ogretmen_yanit,0) ogretmen_yanit,
        COALESCE(tq.ogretmen_dogru,0) ogretmen_dogru,
        COALESCE(hw.odev_atanan,0) odev_atanan,
        COALESCE(hw.odev_tamamlanan,0) odev_tamamlanan,
        COALESCE(hw.odev_geciken,0) odev_geciken
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        INNER JOIN ogrenciler o ON o.kullanici_id=u.id AND o.aktif=1

        LEFT JOIN (
            SELECT ogrenci_id,COUNT(*) sistem_yanit,
                SUM(CASE WHEN dogru=1 THEN 1 ELSE 0 END) sistem_dogru
            FROM ogrenci_cevaplari
            WHERE 1=1 {$systemDate}
            GROUP BY ogrenci_id
        ) sa ON sa.ogrenci_id=o.id

        LEFT JOIN (
            SELECT c.ogrenci_id,COUNT(*) ogretmen_yanit,
                SUM(CASE WHEN c.dogru=1 THEN 1 ELSE 0 END) ogretmen_dogru
            FROM ogretmen_icerik_cevaplari c
            INNER JOIN ogretmen_icerikleri oi
              ON oi.id=c.icerik_id
             AND oi.kurum_id=?
             AND oi.icerik_turu='soru'
            WHERE 1=1 {$teacherDate}
            GROUP BY c.ogrenci_id
        ) tq ON tq.ogrenci_id=o.id

        LEFT JOIN (
            SELECT oo.ogrenci_id,
                COUNT(DISTINCT oi.id) odev_atanan,
                COUNT(DISTINCT CASE WHEN COALESCE(od.tamamlandi,0)=1 THEN oi.id END) odev_tamamlanan,
                COUNT(DISTINCT CASE
                    WHEN oi.teslim_tarihi IS NOT NULL
                     AND oi.teslim_tarihi<NOW()
                     AND COALESCE(od.tamamlandi,0)=0
                    THEN oi.id END) odev_geciken
            FROM ogretmen_icerikleri oi
            INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
            INNER JOIN kullanicilar tu ON tu.id=og.kullanici_id AND tu.aktif=1
            INNER JOIN kurum_kullanicilari tk
              ON tk.kullanici_id=tu.id
             AND tk.kurum_id=oi.kurum_id
             AND tk.kurum_rolu='ogretmen'
             AND tk.aktif=1
            INNER JOIN ogretmen_ogrenci oo
              ON oo.ogretmen_id=oi.ogretmen_id
             AND oo.kurum_id=oi.kurum_id
            LEFT JOIN ogretmen_icerik_hedefleri h
              ON h.icerik_id=oi.id
             AND h.ogrenci_id=oo.ogrenci_id
            LEFT JOIN ogrenci_odev_durumlari od
              ON od.icerik_id=oi.id
             AND od.ogrenci_id=oo.ogrenci_id
            WHERE oi.kurum_id=?
              AND oi.aktif=1
              AND oi.icerik_turu='odev'
              AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
              {$homeworkDate}
            GROUP BY oo.ogrenci_id
        ) hw ON hw.ogrenci_id=o.id

        WHERE kk.kurum_id=?
          AND kk.kurum_rolu='ogrenci'
          AND kk.aktif=1";

    $params=array_merge($systemParams,$teacherParams,$homeworkParams,[$institutionId]);

    if($grade>0){
        $sql.=' AND o.sinif_seviyesi=?';
        $params[]=$grade;
    }
    if($groupId>0){
        $sql.=" AND EXISTS (
            SELECT 1
            FROM kurum_sinif_ogrencileri kso
            INNER JOIN kurum_siniflari ks
              ON ks.id=kso.kurum_sinif_id
             AND ks.kurum_id=kso.kurum_id
             AND ks.aktif=1
            WHERE kso.kurum_id=?
              AND kso.kurum_sinif_id=?
              AND kso.ogrenci_id=o.id
        )";
        $params[]=$institutionId;
        $params[]=$groupId;
    }

    $sql.=' ORDER BY o.sinif_seviyesi,o.ad,o.id';

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function kr_totals(array $rows): array {
    $totals=[
        'students'=>count($rows),
        'system_answers'=>0,
        'system_correct'=>0,
        'teacher_answers'=>0,
        'teacher_correct'=>0,
        'homework_assigned'=>0,
        'homework_completed'=>0,
        'homework_overdue'=>0,
    ];

    foreach($rows as $row){
        $totals['system_answers']+=(int)($row['sistem_yanit']??0);
        $totals['system_correct']+=(int)($row['sistem_dogru']??0);
        $totals['teacher_answers']+=(int)($row['ogretmen_yanit']??0);
        $totals['teacher_correct']+=(int)($row['ogretmen_dogru']??0);
        $totals['homework_assigned']+=(int)($row['odev_atanan']??0);
        $totals['homework_completed']+=(int)($row['odev_tamamlanan']??0);
        $totals['homework_overdue']+=(int)($row['odev_geciken']??0);
    }

    $totals['answers']=$totals['system_answers']+$totals['teacher_answers'];
    $totals['correct']=$totals['system_correct']+$totals['teacher_correct'];
    return $totals;
}
