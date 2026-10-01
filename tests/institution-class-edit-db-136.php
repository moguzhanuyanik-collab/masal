<?php
declare(strict_types=1);

function fail_136(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_136(bool $condition,string $message): void { if(!$condition) fail_136($message); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_siniflari.php';

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
    ]);
}catch(Throwable $e){ fail_136('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

foreach(['kurum_sinif_ogrencileri','kurum_siniflari','ogrenciler'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

$pdo->exec("CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL,
    sinif_seviyesi TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_siniflari (
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(120) NOT NULL,
    tur VARCHAR(20) NOT NULL,
    sinif_seviyesi TINYINT UNSIGNED NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_sinif_ad(kurum_id,ad)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
    kurum_sinif_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO ogrenciler(id,sinif_seviyesi) VALUES (101,4),(102,5)");
$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif)
    VALUES (501,10,'Destek Grubu','grup',NULL,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id)
    VALUES (501,10,101),(501,10,102)");

$actor=['id'=>999];
$blocked=false;
try{
    ksg_update($pdo,$actor,10,501,[
        'ad'=>'4-A',
        'tur'=>'sinif',
        'sinif_seviyesi'=>4,
    ]);
}catch(RuntimeException $e){
    $blocked=str_contains($e->getMessage(),'uymayan öğrenciler');
}
ok_136($blocked,'uyumsuz öğrenci varken sınıf seviyesi değişikliği engellenmeli.');

$row=$pdo->query('SELECT ad,tur,sinif_seviyesi FROM kurum_siniflari WHERE id=501')->fetch();
ok_136((string)$row['ad']==='Destek Grubu','engellenen güncellemede ad değişmemeli.');
ok_136((string)$row['tur']==='grup','engellenen güncellemede tür değişmemeli.');
ok_136($row['sinif_seviyesi']===null,'engellenen güncellemede seviye değişmemeli.');

$pdo->exec('DELETE FROM kurum_sinif_ogrencileri WHERE kurum_sinif_id=501 AND ogrenci_id=102');
ksg_update($pdo,$actor,10,501,[
    'ad'=>'4-A',
    'tur'=>'sinif',
    'sinif_seviyesi'=>4,
]);

$row=$pdo->query('SELECT ad,tur,sinif_seviyesi FROM kurum_siniflari WHERE id=501')->fetch();
ok_136((string)$row['ad']==='4-A','uygun üyelerden sonra ad güncellenmeli.');
ok_136((string)$row['tur']==='sinif','uygun üyelerden sonra tür güncellenmeli.');
ok_136((int)$row['sinif_seviyesi']===4,'uygun üyelerden sonra sınıf seviyesi güncellenmeli.');

ksg_update($pdo,$actor,10,501,[
    'ad'=>'Karma Destek',
    'tur'=>'grup',
    'sinif_seviyesi'=>0,
]);
$row=$pdo->query('SELECT ad,tur,sinif_seviyesi FROM kurum_siniflari WHERE id=501')->fetch();
ok_136((string)$row['tur']==='grup','grup türüne dönüş desteklenmeli.');
ok_136($row['sinif_seviyesi']===null,'karma grupta sınıf seviyesi NULL olmalı.');

$invalid=false;
try{
    ksg_validate_input(['ad'=>'X Sınıfı','tur'=>'sinif','sinif_seviyesi'=>0]);
}catch(RuntimeException){
    $invalid=true;
}
ok_136($invalid,'sınıf türünde seviye zorunlu olmalı.');

foreach(['kurum_sinif_ogrencileri','kurum_siniflari','ogrenciler'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

echo "PASS: class/group safe edit DB integration\n";
