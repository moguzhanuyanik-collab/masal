<?php
declare(strict_types=1);

function fail_124(string $message): never {
    fwrite(STDERR,"FAIL: {$message}\n");
    exit(1);
}
function ok_124(bool $condition,string $message): void {
    if(!$condition) fail_124($message);
}

$host=getenv('ILKADIM_DB_HOST') ?: '127.0.0.1';
$port=(int)(getenv('ILKADIM_DB_PORT') ?: 3306);
$name=getenv('ILKADIM_DB_NAME') ?: 'ilkadim_ci';
$user=getenv('ILKADIM_DB_USER') ?: 'root';
$pass=getenv('ILKADIM_DB_PASSWORD') ?: 'root';

try{
    $pdo=new PDO(
        "mysql:host={$host};port={$port};dbname={$name};charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES=>false,
        ]
    );
}catch(Throwable $e){
    fail_124('MariaDB bağlantısı kurulamadı: '.$e->getMessage());
}

require_once __DIR__.'/../src/updater.php';

$pdo->exec('DROP TABLE IF EXISTS adimbot_rate_limitleri');
$pdo->exec('DROP TABLE IF EXISTS sistem_migrations');
$pdo->exec('CREATE TABLE sistem_migrations (
    migration VARCHAR(255) NOT NULL,
    PRIMARY KEY(migration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$root=dirname(__DIR__);
$retired=retired_automatic_migrations();
$expected=[];
foreach(glob($root.'/database/migrations/*.sql')?:[] as $file){
    $migration=basename($file,'.sql');
    $number=migration_sequence_number($migration);
    if($number<1 || $number>63 || isset($retired[$migration])) continue;
    $expected[$migration]=true;
}
ok(count($expected)>0,'001-063 beklenen migration kümesi oluşturulamadı.');

$insert=$pdo->prepare('INSERT INTO sistem_migrations(migration) VALUES (?)');
foreach(array_keys($expected) as $migration) $insert->execute([$migration]);
$insert->closeCursor();

$applied=recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$root,'1.1.97');
ok(auth_table_exists($pdo,'adimbot_rate_limitleri'),'064 eksikken rate-limit tablosu oluşturulmalı.');
ok($pdo->query("SELECT COUNT(*) FROM sistem_migrations WHERE migration='064_adimbot_rate_limit_ve_migration_checkpoint'")->fetchColumn()===1,
    '064 migration kaydı ilk recovery sonrası tam bir kez bulunmalı.');
ok(in_array('064_adimbot_rate_limit_ve_migration_checkpoint',$applied,true),
    'İlk 064 recovery uygulanan migrationı raporlamalı.');

$pdo->exec('DROP TABLE adimbot_rate_limitleri');
ok(!auth_table_exists($pdo,'adimbot_rate_limitleri'),'Bozuk legacy fixture hazırlanamadı.');

$repaired=recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$root,'1.1.97');
ok(auth_table_exists($pdo,'adimbot_rate_limitleri'),
    '064 kaydı mevcut ama tablo eksik olduğunda idempotent şema onarımı çalışmalı.');
ok($repaired===[],'Kayıt zaten mevcutken ikinci recovery migrationı yeniden uygulanmış saymamalı.');
ok((int)$pdo->query("SELECT COUNT(*) FROM sistem_migrations WHERE migration='064_adimbot_rate_limit_ve_migration_checkpoint'")===1,
    '064 migration kaydı ikinci recoveryde çoğalmamalı.');

$pdo->exec('DROP TABLE adimbot_rate_limitleri');
$pdo->exec('DROP TABLE sistem_migrations');

echo "PASS: 064 checkpoint/table integrity recovery contract\n";
