<?php
declare(strict_types=1);

function fail_134(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_134(bool $condition,string $message): void { if(!$condition) fail_134($message); }

$host=getenv('ILKADIM_DB_HOST') ?: '127.0.0.1';
$port=(int)(getenv('ILKADIM_DB_PORT') ?: 3306);
$name=getenv('ILKADIM_DB_NAME') ?: 'ilkadim_ci';
$user=getenv('ILKADIM_DB_USER') ?: 'root';
$pass=getenv('ILKADIM_DB_PASSWORD') ?: 'root';

try{
    $pdo=new PDO("mysql:host={$host};port={$port};dbname={$name};charset=utf8mb4",$user,$pass,[
        PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES=>false,
        PDO::MYSQL_ATTR_USE_BUFFERED_QUERY=>true,
    ]);
}catch(Throwable $e){ fail_134('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$pdo->exec('DROP TABLE IF EXISTS kurum_sinif_ogrencileri');
$pdo->exec('DROP TABLE IF EXISTS kurum_siniflari');
$pdo->exec('DROP TABLE IF EXISTS ogrenciler');
$pdo->exec('DROP TABLE IF EXISTS kurumlar');

$pdo->exec("CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

function run_068(PDO $pdo): void {
    $path=__DIR__.'/../database/migrations/068_kurum_siniflari_ve_gruplar.sql';
    $raw=file_get_contents($path);
    if(!is_string($raw)) fail_134('068 migration okunamadı.');
    $buffer='';
    foreach(preg_split('/\\R/',$raw) as $line){
        $trim=trim($line);
        if($trim==='' || str_starts_with($trim,'--')) continue;
        $buffer.=$line."\n";
        if(str_ends_with(rtrim($line),';')){
            $sql=trim($buffer);
            $buffer='';
            if($sql!=='') $pdo->exec($sql);
        }
    }
    if(trim($buffer)!=='') $pdo->exec(trim($buffer));
}

run_068($pdo);
run_068($pdo);

$tables=(int)$pdo->query("SELECT COUNT(*) FROM information_schema.tables
    WHERE table_schema=DATABASE() AND table_name IN ('kurum_siniflari','kurum_sinif_ogrencileri')")->fetchColumn();
ok_134($tables===2,'068 iki tabloyu da oluşturmalı.');

$kurumType=(string)$pdo->query("SELECT COLUMN_TYPE FROM information_schema.columns
    WHERE table_schema=DATABASE() AND table_name='kurum_siniflari' AND column_name='kurum_id'")->fetchColumn();
$studentType=(string)$pdo->query("SELECT COLUMN_TYPE FROM information_schema.columns
    WHERE table_schema=DATABASE() AND table_name='kurum_sinif_ogrencileri' AND column_name='ogrenci_id'")->fetchColumn();
ok_134(str_contains(strtolower($kurumType),'bigint') && str_contains(strtolower($kurumType),'unsigned'),
    'kurum_siniflari.kurum_id canlı kurum id tipiyle uyumlu olmalı; gelen: '.$kurumType);
ok_134(str_contains(strtolower($studentType),'int') && !str_contains(strtolower($studentType),'bigint') && str_contains(strtolower($studentType),'unsigned'),
    'üyelik ogrenci_id canlı öğrenci id tipiyle uyumlu olmalı; gelen: '.$studentType);

$unique=(int)$pdo->query("SELECT COUNT(DISTINCT index_name) FROM information_schema.statistics
    WHERE table_schema=DATABASE() AND table_name='kurum_siniflari'
      AND index_name='uk_kurum_sinif_ad' AND non_unique=0")->fetchColumn();
ok_134($unique===1,'kurum içi sınıf/grup adı unique olmalı.');

$pk=(string)$pdo->query("SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
    FROM information_schema.statistics
    WHERE table_schema=DATABASE() AND table_name='kurum_sinif_ogrencileri' AND index_name='PRIMARY'")->fetchColumn();
ok_134($pk==='kurum_sinif_id,ogrenci_id','üyelik primary key sınıf+öğrenci olmalı.');

$pdo->exec('INSERT INTO kurumlar(id) VALUES (10)');
$pdo->exec('INSERT INTO ogrenciler(id,sinif_seviyesi) VALUES (101,4),(102,4)');
$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif)
    VALUES (501,10,'4-A','sinif',4,1),(502,10,'Matematik Destek','grup',4,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id)
    VALUES (501,10,101),(501,10,102),(502,10,101)");

$count=(int)$pdo->query('SELECT COUNT(*) FROM kurum_sinif_ogrencileri WHERE kurum_id=10')->fetchColumn();
ok_134($count===3,'sınıf ve grup üyelikleri birlikte saklanabilmeli.');

$pdo->exec('DROP TABLE kurum_sinif_ogrencileri');
$pdo->exec('DROP TABLE kurum_siniflari');
$pdo->exec('DROP TABLE ogrenciler');
$pdo->exec('DROP TABLE kurumlar');

echo "PASS: institution classes/groups migration DB integration\n";
