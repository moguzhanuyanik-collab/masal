<?php
declare(strict_types=1);

function fail_144(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_144(bool $condition,string $message): void { if(!$condition) fail_144($message); }

require __DIR__.'/../src/veli_icerikleri.php';

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
}catch(Throwable $e){ fail_144('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=['veli_ogrenci','veliler','ogrenciler','kurum_kullanicilari','kurumlar','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE veliler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurumlar (
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenciler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL,
 email VARCHAR(190) NULL, sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_kullanicilari (
 kurum_id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, kurum_rolu VARCHAR(30) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE veli_ogrenci (
 veli_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(veli_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (5001,'Veli A',1),(1001,'Ada',1)");
$pdo->exec("INSERT INTO veliler(id,kullanici_id,ad_soyad,aktif) VALUES
 (501,5001,'Veli A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES
 (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,5001,'veli',1),(20,5001,'veli',1),
 (10,1001,'ogrenci',1),(20,1001,'ogrenci',1)");
$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES
 (501,101,10)");

$institutions=vi_parent_child_institutions($pdo,5001,101);
ok_144(count($institutions)===1,'veli yalnız veli_ogrenci ilişkili kurumu rapor seçeneği olarak görmeli.');
ok_144((int)$institutions[0]['id']===10,'tek yetkili rapor kurumu Okul A olmalı.');

$context=vi_parent_report_context($pdo,5001,101,10);
ok_144(is_array($context),'Okul A rapor bağlamı doğrulanmalı.');
ok_144((int)$context['institution_id']===10,'rapor bağlamı kurum id doğru olmalı.');
ok_144((string)$context['institution_name']==='Okul A','rapor bağlamı kurum adı doğru olmalı.');
ok_144((string)$context['back']==='veli-paneli.php#cocuklar','veli raporu geri bağlantısı doğru olmalı.');

$forged=vi_parent_report_context($pdo,5001,101,20);
ok_144($forged===null,'veli ve öğrenci Okul B üyesi olsa bile veli_ogrenci ilişkisi yoksa rapor bağlamı reddedilmeli.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=5001 AND kurum_rolu='veli'");
ok_144(vi_parent_report_context($pdo,5001,101,10)===null,'veli kurum üyeliği pasif olunca rapor bağlamı kapanmalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=1 WHERE kurum_id=10 AND kullanici_id=5001 AND kurum_rolu='veli'");
$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=1001 AND kurum_rolu='ogrenci'");
ok_144(vi_parent_report_context($pdo,5001,101,10)===null,'öğrenci kurum üyeliği pasif olunca rapor bağlamı kapanmalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=1 WHERE kurum_id=10 AND kullanici_id=1001 AND kurum_rolu='ogrenci'");
$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES (501,101,20)");
$contexts=vi_parent_child_institutions($pdo,5001,101);
$ids=array_map('intval',array_column($contexts,'id'));
sort($ids);
ok_144($ids===[10,20],'iki gerçek veli_ogrenci ilişkisi varsa iki rapor kurumu da görünmeli.');
ok_144(is_array(vi_parent_report_context($pdo,5001,101,20)),'ikinci gerçek kurum ilişkisi eklenince Okul B bağlamı doğrulanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: parent student-report strict institution context DB integration\n";
