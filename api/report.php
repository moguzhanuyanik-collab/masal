<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';
require dirname(__DIR__) . '/src/normalized.php';

try {
    if ($_SERVER['REQUEST_METHOD']!=='GET') json_response(['ok'=>false,'message'=>'Yalnızca GET desteklenir.'],405);
    $pdo=db();
    $requested=isset($_GET['student_id'])?(int)$_GET['student_id']:null;
    $studentId=require_api_student_access($pdo,$requested);

    $s=$pdo->prepare('SELECT d.kod,d.ad,COUNT(DISTINCT m.id) toplam_modul,SUM(CASE WHEN oi.id IS NOT NULL AND oi.tamamlandi=1 THEN 1 ELSE 0 END) tamamlanan_modul FROM dersler d LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.aktif=1 LEFT JOIN ogrenci_ilerleme oi ON oi.ogrenci_id=? AND oi.ders_kodu=d.kod AND oi.modul_indeksi=m.sira-1 WHERE d.aktif=1 GROUP BY d.id,d.kod,d.ad,d.sira ORDER BY d.sira,d.id');
    $s->execute([$studentId]);
    $lessons=[];
    foreach ($s->fetchAll() as $r) {
        $t=(int)$r['toplam_modul'];
        $d=(int)$r['tamamlanan_modul'];
        $lessons[]=[
            'code'=>(string)$r['kod'],
            'name'=>(string)$r['ad'],
            'completed'=>$d,
            'total'=>$t,
            'percent'=>$t>0?(int)round($d/$t*100):0
        ];
    }

    $b=$pdo->prepare('SELECT r.kod,r.ad,r.emoji,r.aciklama,orr.kazanma_tarihi FROM ogrenci_rozetleri orr INNER JOIN rozetler r ON r.id=orr.rozet_id WHERE orr.ogrenci_id=? ORDER BY r.sira,r.id');
    $b->execute([$studentId]);

    json_response([
        'ok'=>true,
        'student_id'=>$studentId,
        'summary'=>normalized_summary($pdo,$studentId),
        'lessons'=>$lessons,
        'badges'=>$b->fetchAll()
    ]);
} catch (Throwable $e) {
    error_log('IlkAdim report: '.$e->getMessage());
    json_response(['ok'=>false,'message'=>'Rapor verileri alınamadı.'],500);
}
