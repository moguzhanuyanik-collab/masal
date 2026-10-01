<?php
declare(strict_types=1);

function fail_137(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_137(bool $condition,string $message): void { if(!$condition) fail_137($message); }

require __DIR__.'/../src/kurum_raporlari.php';

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
}catch(Throwable $e){ fail_137('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
    'ogrenci_odev_durumlari','ogretmen_icerik_hedefleri','ogretmen_icerik_cevaplari',
    'ogretmen_ogrenci','ogretmen_icerikleri','ogretmenler','ogrenci_cevaplari',
    'kurum_sinif_ogrencileri','kurum_siniflari','ogrenciler','kurum_kullanicilari','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
    id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(190) NOT NULL,
    email VARCHAR(190) NULL,
    sinif_seviyesi TINYINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_siniflari (
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(120) NOT NULL,
    tur VARCHAR(20) NOT NULL,
    sinif_seviyesi TINYINT UNSIGNED NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
    kurum_sinif_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenci_cevaplari (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    dogru TINYINT(1) NOT NULL DEFAULT 0,
    cevap_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
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
    icerik_turu VARCHAR(30) NOT NULL,
    hedef_turu VARCHAR(30) NOT NULL,
    teslim_tarihi DATETIME NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_ogrenci (
    ogretmen_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
    icerik_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    dogru TINYINT(1) NOT NULL DEFAULT 0,
    cevap_tarihi DATETIME NOT NULL,
    PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
    icerik_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
    icerik_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,aktif) VALUES (1001,1),(1002,1),(2001,1),(3001,1),(4001,1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
    (101,1001,'Ada','ada@example.com',4,1),
    (102,1002,'Bora','bora@example.com',4,1),
    (201,2001,'Cem','cem@example.com',4,1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(20,2001,'ogrenci',1),
    (10,3001,'ogretmen',1),(20,4001,'ogretmen',1)");

$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif) VALUES
    (501,10,'4-A','sinif',4,1),(502,10,'Destek','grup',NULL,1),(601,20,'4-X','sinif',4,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id) VALUES
    (501,10,101),(502,10,102),(601,20,201)");

$pdo->exec("INSERT INTO ogrenci_cevaplari(ogrenci_id,dogru,cevap_tarihi) VALUES
    (101,1,'2026-09-10 10:00:00'),(101,0,'2026-09-11 10:00:00'),
    (102,1,'2026-09-12 10:00:00'),(201,1,'2026-09-13 10:00:00'),
    (101,1,'2026-08-01 10:00:00')");

$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,aktif) VALUES (301,3001,1),(401,4001,1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
    (301,101,10),(301,102,10),(401,201,20)");

$pdo->exec("INSERT INTO ogretmen_icerikleri(id,kurum_id,ogretmen_id,icerik_turu,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi) VALUES
    (701,10,301,'soru','tum_ogrenciler',NULL,1,'2026-09-05 09:00:00'),
    (702,10,301,'odev','tum_ogrenciler','2026-09-20 18:00:00',1,'2026-09-06 09:00:00'),
    (703,10,301,'odev','secili_ogrenciler','2026-09-21 18:00:00',1,'2026-09-07 09:00:00'),
    (801,20,401,'soru','tum_ogrenciler',NULL,1,'2026-09-05 09:00:00'),
    (802,20,401,'odev','tum_ogrenciler','2026-09-20 18:00:00',1,'2026-09-06 09:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,dogru,cevap_tarihi) VALUES
    (701,101,1,'2026-09-14 10:00:00'),(701,102,0,'2026-09-15 10:00:00'),
    (801,201,1,'2026-09-14 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES (703,101)");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi) VALUES
    (702,101,1),(702,102,0),(703,101,0),(802,201,1)");

$groups=kr_active_groups($pdo,10);
ok_137(count($groups)===2,'kurum 10 yalnız kendi aktif sınıf/gruplarını görmeli.');

$rows=kr_report_rows($pdo,10,4,0,'2026-09-01','2026-09-30');
ok_137(count($rows)===2,'kurum 10 raporunda iki aktif öğrenci olmalı.');
$byId=[];
foreach($rows as $row)$byId[(int)$row['id']]=$row;

ok_137(isset($byId[101],$byId[102]),'kurum 10 öğrenci kimlikleri eksik.');
ok_137(!isset($byId[201]),'başka kurum öğrencisi rapora sızmamalı.');

ok_137((int)$byId[101]['sistem_yanit']===2,'Ada için tarih aralığında iki sistem yanıtı olmalı.');
ok_137((int)$byId[101]['sistem_dogru']===1,'Ada için bir doğru sistem yanıtı olmalı.');
ok_137((int)$byId[101]['ogretmen_yanit']===1 && (int)$byId[101]['ogretmen_dogru']===1,
    'Ada öğretmen sorusu performansı doğru olmalı.');
ok_137((int)$byId[102]['ogretmen_yanit']===1 && (int)$byId[102]['ogretmen_dogru']===0,
    'Bora öğretmen sorusu performansı doğru olmalı.');

ok_137((int)$byId[101]['odev_atanan']===2,'Ada tüm + seçili iki ödevi görmeli.');
ok_137((int)$byId[101]['odev_tamamlanan']===1,'Ada bir ödevi tamamlamış olmalı.');
ok_137((int)$byId[101]['odev_geciken']===1,'Ada bir süresi geçmiş bekleyen ödeve sahip olmalı.');
ok_137((int)$byId[102]['odev_atanan']===1,'Bora yalnız tüm öğrencilere verilen ödevi görmeli.');
ok_137((int)$byId[102]['odev_tamamlanan']===0,'Bora ödevi tamamlamamış olmalı.');
ok_137((int)$byId[102]['odev_geciken']===1,'Bora ödevi gecikmiş olmalı.');

$groupRows=kr_report_rows($pdo,10,0,501,'2026-09-01','2026-09-30');
ok_137(count($groupRows)===1 && (int)$groupRows[0]['id']===101,'4-A grup filtresi yalnız Ada öğrencisini getirmeli.');

$otherGroupBlocked=false;
try{
    kr_report_rows($pdo,10,0,601,'2026-09-01','2026-09-30');
}catch(RuntimeException){
    $otherGroupBlocked=true;
}
ok_137($otherGroupBlocked,'başka kuruma ait grup filtresi reddedilmeli.');

$totals=kr_totals($rows);
ok_137($totals['students']===2,'toplam öğrenci sayısı iki olmalı.');
ok_137($totals['system_answers']===3,'toplam sistem yanıtı üç olmalı.');
ok_137($totals['teacher_answers']===2,'toplam öğretmen yanıtı iki olmalı.');
ok_137($totals['homework_assigned']===3,'toplam atanmış ödev üç olmalı.');
ok_137($totals['homework_completed']===1,'toplam tamamlanan ödev bir olmalı.');
ok_137($totals['homework_overdue']===2,'toplam geciken ödev iki olmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution reporting tenant/group/question/homework DB integration\n";
