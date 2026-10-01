<?php
declare(strict_types=1);

function fail_160(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_160(bool $condition,string $message): void { if(!$condition) fail_160($message); }

require __DIR__.'/../src/kurum_hazirlik.php';

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
}catch(Throwable $e){ fail_160('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=['ogretmen_icerikleri','ogretmenler','kurum_sinif_ogrencileri','kurum_siniflari','kurum_kullanicilari'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_siniflari (
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(120) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
    kurum_sinif_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmenler (
    id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerikleri (
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ogretmen_id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,3001,'ogretmen',1),(10,1001,'ogrenci',1),(10,2001,'veli',1),
    (20,4001,'ogretmen',1),(20,5001,'ogrenci',1),
    (20,6001,'veli',0)");
$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,aktif) VALUES
    (501,10,'4-A',1),(601,20,'4-X',0)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id) VALUES
    (501,10,101),(601,20,201)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,aktif) VALUES
    (301,3001,1),(401,4001,1)");
$pdo->exec("INSERT INTO ogretmen_icerikleri(id,kurum_id,ogretmen_id,aktif) VALUES
    (701,10,301,1),(801,20,401,0)");

$status10=kh_status($pdo,10);
ok_160($status10['done']===6,'kurum 10 tüm onboarding adımlarını tamamlamış olmalı.');
ok_160($status10['percent']===100,'kurum 10 hazırlık yüzdesi 100 olmalı.');
ok_160($status10['metrics']['ogretmen']===1,'kurum 10 öğretmen sayısı bir olmalı.');
ok_160($status10['metrics']['ogrenci']===1,'kurum 10 öğrenci sayısı bir olmalı.');
ok_160($status10['metrics']['veli']===1,'kurum 10 veli sayısı bir olmalı.');
ok_160($status10['metrics']['sinif']===1,'kurum 10 aktif sınıf sayısı bir olmalı.');
ok_160($status10['metrics']['sinif_ogrenci']===1,'kurum 10 sınıf ataması bir olmalı.');
ok_160($status10['metrics']['icerik']===1,'kurum 10 aktif öğretmen içeriği bir olmalı.');

$status20=kh_status($pdo,20);
ok_160($status20['metrics']['ogretmen']===1,'kurum 20 kendi öğretmenini görmeli.');
ok_160($status20['metrics']['ogrenci']===1,'kurum 20 kendi öğrencisini görmeli.');
ok_160($status20['metrics']['veli']===0,'pasif veli readiness hesabına girmemeli.');
ok_160($status20['metrics']['sinif']===0,'pasif sınıf readiness hesabına girmemeli.');
ok_160($status20['metrics']['sinif_ogrenci']===0,'pasif sınıfa bağlı öğrenci readiness hesabına girmemeli.');
ok_160($status20['metrics']['icerik']===0,'pasif içerik readiness hesabına girmemeli.');
ok_160($status20['done']===2,'kurum 20 yalnız öğretmen ve öğrenci adımlarını tamamlamış olmalı.');
ok_160($status20['percent']===33,'kurum 20 hazırlık yüzdesi 33 olmalı.');

$status0=kh_status($pdo,0);
ok_160($status0['percent']===0 && $status0['done']===0,'geçersiz kurum readiness üretmemeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution readiness tenant-scoped DB integration\n";
