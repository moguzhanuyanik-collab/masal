<?php
declare(strict_types=1);

function kh_scalar(PDO $pdo,string $sql,array $params=[]): int {
    try{
        $stmt=$pdo->prepare($sql);
        $stmt->execute($params);
        $value=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        return max(0,$value);
    }catch(Throwable){
        return 0;
    }
}

function kh_status(PDO $pdo,int $institutionId): array {
    if($institutionId<=0){
        return ['percent'=>0,'done'=>0,'total'=>6,'items'=>[],'metrics'=>[]];
    }

    $metrics=[
        'ogretmen'=>kh_scalar($pdo,"SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari WHERE kurum_id=? AND kurum_rolu='ogretmen' AND aktif=1",[$institutionId]),
        'ogrenci'=>kh_scalar($pdo,"SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari WHERE kurum_id=? AND kurum_rolu='ogrenci' AND aktif=1",[$institutionId]),
        'veli'=>kh_scalar($pdo,"SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari WHERE kurum_id=? AND kurum_rolu='veli' AND aktif=1",[$institutionId]),
        'sinif'=>kh_scalar($pdo,"SELECT COUNT(*) FROM kurum_siniflari WHERE kurum_id=? AND aktif=1",[$institutionId]),
        'sinif_ogrenci'=>kh_scalar($pdo,"SELECT COUNT(DISTINCT kso.ogrenci_id)
            FROM kurum_sinif_ogrencileri kso
            INNER JOIN kurum_siniflari ks
                ON ks.id=kso.kurum_sinif_id
               AND ks.kurum_id=kso.kurum_id
               AND ks.aktif=1
            WHERE kso.kurum_id=?",[$institutionId]),
        'icerik'=>kh_scalar($pdo,"SELECT COUNT(*)
            FROM ogretmen_icerikleri oi
            INNER JOIN ogretmenler o
                ON o.id=oi.ogretmen_id
               AND o.aktif=1
            INNER JOIN kurum_kullanicilari kk
                ON kk.kurum_id=oi.kurum_id
               AND kk.kullanici_id=o.kullanici_id
               AND kk.kurum_rolu='ogretmen'
               AND kk.aktif=1
            WHERE oi.kurum_id=? AND oi.aktif=1",[$institutionId]),
    ];

    $items=[
        ['key'=>'ogretmen','label'=>'Öğretmen eklendi','description'=>'En az bir aktif kurum öğretmeni bulunuyor.','ready'=>$metrics['ogretmen']>0],
        ['key'=>'ogrenci','label'=>'Öğrenci eklendi','description'=>'En az bir aktif kurum öğrencisi bulunuyor.','ready'=>$metrics['ogrenci']>0],
        ['key'=>'veli','label'=>'Veli eklendi','description'=>'En az bir aktif kurum velisi bulunuyor.','ready'=>$metrics['veli']>0],
        ['key'=>'sinif','label'=>'Sınıf / grup oluşturuldu','description'=>'Kurum için en az bir aktif sınıf veya çalışma grubu var.','ready'=>$metrics['sinif']>0],
        ['key'=>'sinif_ogrenci','label'=>'Öğrenci sınıfa / gruba atandı','description'=>'En az bir öğrenci aktif bir kurum sınıfına veya grubuna atanmış.','ready'=>$metrics['sinif_ogrenci']>0],
        ['key'=>'icerik','label'=>'İlk öğretmen içeriği yayınlandı','description'=>'Aktif kurum öğretmeninden en az bir aktif yayın bulunuyor.','ready'=>$metrics['icerik']>0],
    ];

    $done=0;
    foreach($items as $item) if($item['ready']) $done++;
    $total=count($items);
    $percent=$total>0?(int)round($done*100/$total):0;

    return [
        'percent'=>$percent,
        'done'=>$done,
        'total'=>$total,
        'items'=>$items,
        'metrics'=>$metrics,
    ];
}
