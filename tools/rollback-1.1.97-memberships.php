<?php
declare(strict_types=1);

/**
 * 1.1.97 kurum üyeliği rescue rollback.
 * Yalnız rescue sonrası ve uygulama sürümü hâlâ 1.1.97 ise çalışır.
 */

function rollback197_fail(string $message): never {
    fwrite(STDERR,"HATA: ".$message.PHP_EOL);
    exit(1);
}
function rollback197_table_exists(PDO $pdo,string $table): bool {
    $s=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $s->execute([$table]);
    return (int)$s->fetchColumn()>0;
}
if(PHP_SAPI!=='cli') rollback197_fail('Bu araç yalnız CLI üzerinden çalıştırılır.');
$root=dirname(__DIR__);
$version=is_file($root.'/version.json')?json_decode((string)file_get_contents($root.'/version.json'),true):null;
$installed=is_array($version)?trim((string)($version['version']??'')):'';
if($installed!=='1.1.97') rollback197_fail('Rollback yalnız sürüm hâlâ 1.1.97 iken çalışır.');

$cfg=require $root.'/config/app.php';
$db=$cfg['db']??null;
if(!is_array($db)) rollback197_fail('DB ayarları okunamadı.');
$pdo=new PDO(
    'mysql:host='.(string)($db['host']??'localhost').';port='.(int)($db['port']??3306).';dbname='.(string)($db['name']??'').';charset='.(string)($db['charset']??'utf8mb4'),
    (string)($db['user']??''),(string)($db['pass']??''),
    [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_EMULATE_PREPARES=>false]
);
$backup='kurum_kullanicilari_legacy_backup_1_1_97';
if(!rollback197_table_exists($pdo,$backup)) rollback197_fail('Rescue yedek tablosu bulunamadı.');
if(!rollback197_table_exists($pdo,'kurum_kullanicilari')) rollback197_fail('Canlı kurum_kullanicilari tablosu bulunamadı.');

$failed='kurum_kullanicilari_after_rescue_1_1_97_'.date('Ymd_His');
$pdo->exec("RENAME TABLE kurum_kullanicilari TO {$failed}, {$backup} TO kurum_kullanicilari");
fwrite(STDOUT,"OK: Legacy tablo geri yüklendi. Rescue sonrası tablo korunuyor: {$failed}".PHP_EOL);
