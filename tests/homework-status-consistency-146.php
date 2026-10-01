<?php
declare(strict_types=1);

function fail_146(string $message): never {
    fwrite(STDERR,"FAIL: {$message}\n");
    exit(1);
}
function ok_146(bool $condition,string $message): void {
    if(!$condition) fail_146($message);
}

require __DIR__.'/../src/odev_durumu.php';

$now=new DateTimeImmutable('2026-10-01 12:00:00');

$completed=['tamamlandi'=>1,'teslim_tarihi'=>'2026-09-20 18:00:00'];
$overdue=['tamamlandi'=>0,'teslim_tarihi'=>'2026-09-30 18:00:00'];
$pending=['tamamlandi'=>0,'teslim_tarihi'=>'2026-10-02 18:00:00'];
$noDue=['tamamlandi'=>0,'teslim_tarihi'=>null];
$providerCompleted=['odev_tamamlandi'=>1,'teslim_tarihi'=>'2026-09-01 10:00:00'];
$invalidDue=['tamamlandi'=>0,'teslim_tarihi'=>'not-a-date'];

ok_146(hw_status($completed,$now)==='completed','tamamlanan ödev teslim tarihi geçmiş olsa bile completed kalmalı.');
ok_146(hw_status($overdue,$now)==='overdue','teslim tarihi geçmiş tamamlanmamış ödev overdue olmalı.');
ok_146(hw_status($pending,$now)==='pending','gelecek teslim tarihli ödev pending olmalı.');
ok_146(hw_status($noDue,$now)==='pending','teslim tarihi olmayan tamamlanmamış ödev pending olmalı.');
ok_146(hw_status($providerCompleted,$now)==='completed','ortak veli sağlayıcısının odev_tamamlandi alanı desteklenmeli.');
ok_146(hw_status($invalidDue,$now)==='pending','bozuk teslim tarihi güvenli biçimde pending olmalı.');

$studentWithoutOwnDue=['tamamlandi'=>0];
ok_146(
    hw_status($studentWithoutOwnDue,$now,'2026-09-25 12:00:00')==='overdue',
    'öğretmen öğrenci satırında ödevin fallback teslim tarihi kullanılmalı.'
);

$rows=[$completed,$overdue,$pending,$noDue,$providerCompleted];
$summary=hw_summary($rows,$now);
ok_146($summary['total']===5,'toplam ödev sayısı beş olmalı.');
ok_146($summary['completed']===2,'iki tamamlanan ödev olmalı.');
ok_146($summary['overdue']===1,'bir geciken ödev olmalı.');
ok_146($summary['pending']===2,'iki bekleyen ödev olmalı.');

$overdueRows=hw_filter($rows,'overdue',$now);
ok_146(count($overdueRows)===1 && $overdueRows[0]['teslim_tarihi']==='2026-09-30 18:00:00','geciken filtresi yalnız overdue ödevi döndürmeli.');

$completedRows=hw_filter($rows,'completed',$now);
ok_146(count($completedRows)===2,'tamamlanan filtresi iki ödev döndürmeli.');

$allRows=hw_filter($rows,'tum',$now);
ok_146(count($allRows)===5,'bilinmeyen/tüm filtre tüm kayıtları korumalı.');

ok_146(hw_status_label('completed')==='Tamamlandı','completed etiketi doğru olmalı.');
ok_146(hw_status_label('overdue')==='Gecikti','overdue etiketi doğru olmalı.');
ok_146(hw_status_label('pending')==='Bekliyor','pending etiketi doğru olmalı.');

echo "PASS: shared homework status, summary and filter behavior\n";
