<?php
declare(strict_types=1);

function thd_teacher_profile_id(PDO $pdo,int $teacherUserId): int {
    if($teacherUserId<=0) return 0;
    $stmt=$pdo->prepare("SELECT og.id
        FROM ogretmenler og
        INNER JOIN kullanicilar u ON u.id=og.kullanici_id AND u.aktif=1
        WHERE og.kullanici_id=? AND og.aktif=1
        LIMIT 1");
    $stmt->execute([$teacherUserId]);
    $id=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    return $id;
}

function thd_teacher_institutions(PDO $pdo,int $teacherUserId): array {
    if($teacherUserId<=0) return [];
    $stmt=$pdo->prepare("SELECT DISTINCT k.id,k.ad
        FROM kurum_kullanicilari kk
        INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1
        WHERE kk.kullanici_id=?
          AND kk.kurum_rolu='ogretmen'
          AND kk.aktif=1
        ORDER BY k.ad,k.id");
    $stmt->execute([$teacherUserId]);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function thd_homework_progress_state(array $row): string {
    $target=max(0,(int)($row['hedef_sayisi']??0));
    $completed=max(0,(int)($row['tamamlanan_sayisi']??0));
    $overdue=max(0,(int)($row['geciken_sayisi']??0));
    $pending=max(0,(int)($row['bekleyen_sayisi']??($target-$completed-$overdue)));

    if($target<=0) return 'no_target';
    if($completed>=$target) return 'completed';
    if($overdue>0) return 'overdue';
    if($pending>0) return 'pending';
    return 'pending';
}

function thd_homework_progress_label(string $state): string {
    return match($state){
        'completed'=>'Tümü tamamlandı',
        'overdue'=>'Gecikme var',
        'no_target'=>'Hedef öğrenci yok',
        default=>'Devam ediyor',
    };
}

function thd_teacher_homeworks(
    PDO $pdo,
    int $teacherUserId,
    int $institutionId=0,
    string $publication='tum',
    string $delivery='tum'
): array {
    $teacherId=thd_teacher_profile_id($pdo,$teacherUserId);
    if($teacherId<=0) return [];

    if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';
    if(!in_array($delivery,['tum','pending','overdue','completed','no_target'],true)) $delivery='tum';

    $sql="SELECT oi.id,oi.kurum_id,oi.baslik,oi.icerik_metni,oi.hedef_turu,
        oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,
        k.ad kurum_adi,d.ad ders_adi,
        COUNT(DISTINCT CASE
            WHEN os.id IS NOT NULL
             AND sk.kullanici_id IS NOT NULL
             AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
            THEN os.id END) hedef_sayisi,
        COUNT(DISTINCT CASE
            WHEN os.id IS NOT NULL
             AND sk.kullanici_id IS NOT NULL
             AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
             AND COALESCE(od.tamamlandi,0)=1
            THEN os.id END) tamamlanan_sayisi,
        COUNT(DISTINCT CASE
            WHEN os.id IS NOT NULL
             AND sk.kullanici_id IS NOT NULL
             AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
             AND COALESCE(od.tamamlandi,0)=0
             AND oi.teslim_tarihi IS NOT NULL
             AND oi.teslim_tarihi<NOW()
            THEN os.id END) geciken_sayisi
        FROM ogretmen_icerikleri oi
        INNER JOIN kurumlar k
          ON k.id=oi.kurum_id
         AND k.aktif=1
        INNER JOIN dersler d
          ON d.id=oi.ders_id
         AND d.aktif=1
        INNER JOIN kurum_kullanicilari tk
          ON tk.kurum_id=oi.kurum_id
         AND tk.kullanici_id=?
         AND tk.kurum_rolu='ogretmen'
         AND tk.aktif=1
        LEFT JOIN ogretmen_ogrenci oo
          ON oo.ogretmen_id=oi.ogretmen_id
         AND oo.kurum_id=oi.kurum_id
        LEFT JOIN ogrenciler os
          ON os.id=oo.ogrenci_id
         AND os.aktif=1
        LEFT JOIN kullanicilar su
          ON su.id=os.kullanici_id
         AND su.aktif=1
        LEFT JOIN kurum_kullanicilari sk
          ON sk.kurum_id=oi.kurum_id
         AND sk.kullanici_id=os.kullanici_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        LEFT JOIN ogretmen_icerik_hedefleri h
          ON h.icerik_id=oi.id
         AND h.ogrenci_id=os.id
        LEFT JOIN ogrenci_odev_durumlari od
          ON od.icerik_id=oi.id
         AND od.ogrenci_id=os.id
        WHERE oi.ogretmen_id=?
          AND oi.icerik_turu='odev'";
    $params=[$teacherUserId,$teacherId];

    if($institutionId>0){
        $sql.=' AND oi.kurum_id=?';
        $params[]=$institutionId;
    }
    if($publication!=='tum'){
        $sql.=' AND oi.aktif=?';
        $params[]=$publication==='aktif'?1:0;
    }

    $sql.=" GROUP BY oi.id,oi.kurum_id,oi.baslik,oi.icerik_metni,oi.hedef_turu,
        oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,k.ad,d.ad
        ORDER BY oi.olusturulma_tarihi DESC,oi.id DESC";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    if(!is_array($rows)) $rows=[];

    foreach($rows as &$row){
        $target=max(0,(int)$row['hedef_sayisi']);
        $completed=max(0,(int)$row['tamamlanan_sayisi']);
        $overdue=max(0,(int)$row['geciken_sayisi']);
        $row['bekleyen_sayisi']=max(0,$target-$completed-$overdue);
        $row['teslim_durumu']=thd_homework_progress_state($row);
    }
    unset($row);

    if($delivery!=='tum'){
        $rows=array_values(array_filter(
            $rows,
            static fn(array $row): bool => (string)$row['teslim_durumu']===$delivery
        ));
    }
    return $rows;
}

function thd_dashboard_summary(array $rows): array {
    $summary=[
        'total'=>count($rows),
        'active'=>0,
        'completed'=>0,
        'overdue'=>0,
        'pending'=>0,
        'no_target'=>0,
    ];
    foreach($rows as $row){
        if((int)($row['aktif']??0)===1) $summary['active']++;
        $state=(string)($row['teslim_durumu']??thd_homework_progress_state($row));
        if(isset($summary[$state])) $summary[$state]++;
    }
    return $summary;
}

function thd_filter_homeworks(array $rows,string $delivery): array {
    if(!in_array($delivery,['pending','overdue','completed','no_target'],true)) return array_values($rows);
    return array_values(array_filter(
        $rows,
        static fn(array $row): bool => (string)($row['teslim_durumu']??thd_homework_progress_state($row))===$delivery
    ));
}

