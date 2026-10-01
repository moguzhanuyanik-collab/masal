<?php
declare(strict_types=1);

function tol_teacher_profile_id(PDO $pdo,int $teacherUserId): int {
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

function tol_teacher_institutions(PDO $pdo,int $teacherUserId): array {
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

function tol_teacher_groups(PDO $pdo,int $teacherUserId,int $institutionId): array {
    if($teacherUserId<=0 || $institutionId<=0) return [];

    $stmt=$pdo->prepare("SELECT DISTINCT ks.id,ks.ad,ks.tur,ks.sinif_seviyesi
        FROM kurum_siniflari ks
        INNER JOIN kurum_sinif_ogrencileri kso
          ON kso.kurum_sinif_id=ks.id
         AND kso.kurum_id=ks.kurum_id
        INNER JOIN ogretmen_ogrenci oo
          ON oo.ogrenci_id=kso.ogrenci_id
         AND oo.kurum_id=ks.kurum_id
        INNER JOIN ogretmenler og
          ON og.id=oo.ogretmen_id
         AND og.kullanici_id=?
         AND og.aktif=1
        INNER JOIN kullanicilar tu
          ON tu.id=og.kullanici_id
         AND tu.aktif=1
        INNER JOIN kurum_kullanicilari tk
          ON tk.kullanici_id=tu.id
         AND tk.kurum_id=ks.kurum_id
         AND tk.kurum_rolu='ogretmen'
         AND tk.aktif=1
        INNER JOIN ogrenciler o
          ON o.id=kso.ogrenci_id
         AND o.aktif=1
        INNER JOIN kullanicilar su
          ON su.id=o.kullanici_id
         AND su.aktif=1
        INNER JOIN kurum_kullanicilari sk
          ON sk.kullanici_id=o.kullanici_id
         AND sk.kurum_id=ks.kurum_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        WHERE ks.kurum_id=?
          AND ks.aktif=1
        ORDER BY COALESCE(ks.sinif_seviyesi,99),ks.tur,ks.ad,ks.id");
    $stmt->execute([$teacherUserId,$institutionId]);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tol_teacher_students(
    PDO $pdo,
    int $teacherUserId,
    int $institutionId,
    int $grade=0,
    int $groupId=0
): array {
    if($teacherUserId<=0 || $institutionId<=0) return [];
    if($grade<0 || $grade>8) throw new RuntimeException('Sınıf filtresi geçersiz.');

    $where=[
        'oo.kurum_id=?',
        'og.kullanici_id=?'
    ];
    $params=[$institutionId,$teacherUserId];

    if($grade>0){
        $where[]='o.sinif_seviyesi=?';
        $params[]=$grade;
    }

    if($groupId>0){
        $where[]="EXISTS (
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

    $sql="SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi
        FROM ogretmen_ogrenci oo
        INNER JOIN ogretmenler og
          ON og.id=oo.ogretmen_id
         AND og.aktif=1
        INNER JOIN kullanicilar tu
          ON tu.id=og.kullanici_id
         AND tu.aktif=1
        INNER JOIN kurum_kullanicilari tk
          ON tk.kullanici_id=tu.id
         AND tk.kurum_id=oo.kurum_id
         AND tk.kurum_rolu='ogretmen'
         AND tk.aktif=1
        INNER JOIN ogrenciler o
          ON o.id=oo.ogrenci_id
         AND o.aktif=1
        INNER JOIN kullanicilar su
          ON su.id=o.kullanici_id
         AND su.aktif=1
        INNER JOIN kurum_kullanicilari sk
          ON sk.kullanici_id=o.kullanici_id
         AND sk.kurum_id=oo.kurum_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        WHERE ".implode(' AND ',$where)."
        ORDER BY o.sinif_seviyesi,o.ad,o.id";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function tol_student_group_map(PDO $pdo,int $institutionId,array $studentIds): array {
    $studentIds=array_values(array_unique(array_filter(array_map('intval',$studentIds),static fn(int $id):bool=>$id>0)));
    if($institutionId<=0 || !$studentIds) return [];

    $placeholders=implode(',',array_fill(0,count($studentIds),'?'));
    $params=array_merge([$institutionId],$studentIds);
    $stmt=$pdo->prepare("SELECT kso.ogrenci_id,ks.id,ks.ad,ks.tur,ks.sinif_seviyesi
        FROM kurum_sinif_ogrencileri kso
        INNER JOIN kurum_siniflari ks
          ON ks.id=kso.kurum_sinif_id
         AND ks.kurum_id=kso.kurum_id
         AND ks.aktif=1
        WHERE kso.kurum_id=?
          AND kso.ogrenci_id IN ({$placeholders})
        ORDER BY COALESCE(ks.sinif_seviyesi,99),ks.tur,ks.ad,ks.id");
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();

    $map=[];
    foreach($rows as $row){
        $studentId=(int)$row['ogrenci_id'];
        if(!isset($map[$studentId])) $map[$studentId]=[];
        $map[$studentId][]=$row;
    }
    return $map;
}
