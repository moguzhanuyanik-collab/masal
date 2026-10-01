<?php
declare(strict_types=1);

function fail_138(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_138(bool $condition,string $message): void { if(!$condition) fail_138($message); }

require __DIR__.'/../src/ogrenci_rapor_detay.php';

$contents=[
    [
        'id'=>1,'kurum_id'=>10,'icerik_turu'=>'soru','secilen_cevap_indeksi'=>1,'cevap_dogru'=>1,
        'olusturulma_tarihi'=>'2026-09-20 10:00:00'
    ],
    [
        'id'=>2,'kurum_id'=>10,'icerik_turu'=>'soru','secilen_cevap_indeksi'=>0,'cevap_dogru'=>0,
        'olusturulma_tarihi'=>'2026-09-21 10:00:00'
    ],
    [
        'id'=>3,'kurum_id'=>10,'icerik_turu'=>'soru','secilen_cevap_indeksi'=>null,'cevap_dogru'=>null,
        'olusturulma_tarihi'=>'2026-09-22 10:00:00'
    ],
    [
        'id'=>4,'kurum_id'=>10,'icerik_turu'=>'odev','odev_tamamlandi'=>1,
        'teslim_tarihi'=>'2026-09-25 18:00:00','olusturulma_tarihi'=>'2026-09-18 10:00:00'
    ],
    [
        'id'=>5,'kurum_id'=>10,'icerik_turu'=>'odev','odev_tamamlandi'=>0,
        'teslim_tarihi'=>'2026-09-28 18:00:00','olusturulma_tarihi'=>'2026-09-19 10:00:00'
    ],
    [
        'id'=>6,'kurum_id'=>10,'icerik_turu'=>'odev','odev_tamamlandi'=>0,
        'teslim_tarihi'=>'2026-10-20 18:00:00','olusturulma_tarihi'=>'2026-09-23 10:00:00'
    ],
    [
        'id'=>7,'kurum_id'=>20,'icerik_turu'=>'soru','secilen_cevap_indeksi'=>1,'cevap_dogru'=>1,
        'olusturulma_tarihi'=>'2026-09-24 10:00:00'
    ],
    [
        'id'=>8,'kurum_id'=>20,'icerik_turu'=>'odev','odev_tamamlandi'=>0,
        'teslim_tarihi'=>'2026-09-20 18:00:00','olusturulma_tarihi'=>'2026-09-24 11:00:00'
    ],
];

$scoped=ord_scope_teacher_contents($contents,10);
ok_138(count($scoped)===6,'kurum 10 kapsamı yalnız altı içerik içermeli.');
foreach($scoped as $row) ok_138((int)$row['kurum_id']===10,'başka kurum içeriği kapsamdan sızmamalı.');

$all=ord_scope_teacher_contents($contents,0);
ok_138(count($all)===8,'kurum kapsamı yoksa tüm erişilebilir içerikler korunmalı.');

$summary=ord_teacher_content_summary($scoped,new DateTimeImmutable('2026-10-01 12:00:00'));
ok_138($summary['questions']===3,'üç öğretmen sorusu olmalı.');
ok_138($summary['questions_answered']===2,'iki öğretmen sorusu yanıtlanmış olmalı.');
ok_138($summary['questions_correct']===1,'bir öğretmen sorusu doğru olmalı.');
ok_138($summary['homeworks']===3,'üç ödev olmalı.');
ok_138($summary['homeworks_completed']===1,'bir ödev tamamlanmış olmalı.');
ok_138($summary['homeworks_overdue']===1,'yalnız bir bekleyen ödev gecikmiş olmalı.');

$homeworks=ord_recent_homeworks($scoped,2);
ok_138(count($homeworks)===2,'son iki ödev dönmeli.');
ok_138((int)$homeworks[0]['id']===6,'en yeni ödev ilk sırada olmalı.');
ok_138((int)$homeworks[1]['id']===5,'ikinci en yeni ödev ikinci sırada olmalı.');

$questions=ord_recent_questions($scoped,2);
ok_138(count($questions)===2,'son iki soru dönmeli.');
ok_138((int)$questions[0]['id']===3,'en yeni soru ilk sırada olmalı.');
ok_138((int)$questions[1]['id']===2,'ikinci en yeni soru ikinci sırada olmalı.');

echo "PASS: detailed student report scope and summary behavior\n";
