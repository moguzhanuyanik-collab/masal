<?php
declare(strict_types=1);

function fail_141(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_141(bool $condition,string $message): void { if(!$condition) fail_141($message); }

require __DIR__.'/../src/kurum_icerik_detay.php';

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
}catch(Throwable $e){ fail_141('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogrenci_odev_durumlari','ogretmen_icerik_cevaplari','ogretmen_icerik_hedefleri',
 'ogretmen_icerikleri','ders_modulleri','dersler','ogretmen_ogrenci','ogrenciler',
 'kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmenler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurumlar (
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_kullanicilari (
 kurum_id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, kurum_rolu VARCHAR(30) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenciler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL,
 email VARCHAR(190) NULL, sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_ogrenci (
 ogretmen_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE dersler (
 id BIGINT UNSIGNED NOT NULL, kod VARCHAR(50) NOT NULL, ad VARCHAR(190) NOT NULL, emoji VARCHAR(20) NULL,
 sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ders_modulleri (
 id BIGINT UNSIGNED NOT NULL, ders_id BIGINT UNSIGNED NOT NULL, baslik VARCHAR(190) NOT NULL,
 sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, ders_modulu_id BIGINT UNSIGNED NULL, konu_basligi VARCHAR(190) NULL,
 icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL, icerik_metni TEXT NULL, soru TEXT NULL,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL, hedef_turu VARCHAR(30) NOT NULL,
 teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, secilen_cevap_indeksi INT NULL,
 dogru TINYINT(1) NOT NULL DEFAULT 0, deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(3002,'Öğretmen B',1),(1001,'Ada',1),(1002,'Bora',1),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3002,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1),(102,1002,'Bora','bora@example.com',4,1),(201,2001,'Cem','cem@example.com',4,1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(302,201,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");
$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,soru,secenekler_json,dogru_cevap_indeksi,hedef_turu,teslim_tarihi,aktif)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Soru 1','2+2?','[\"3\",\"4\"]',1,'tum_ogrenciler',NULL,1),
 (702,10,301,1,11,'Toplama','odev','Ödev 1',NULL,NULL,NULL,'secili_ogrenciler','2026-09-20 18:00:00',1),
 (801,20,302,1,11,'Toplama','soru','Başka Kurum','1+1?','[\"1\",\"2\"]',1,'tum_ogrenciler',NULL,1)");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES (702,101)");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi,cevap_tarihi) VALUES
 (701,101,1,1,2,'2026-09-10 10:00:00'),
 (701,102,0,0,1,'2026-09-11 10:00:00'),
 (801,201,1,1,1,'2026-09-10 10:00:00')");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (702,101,0,NULL)");

$q=kid_content_detail($pdo,10,701);
ok_141(is_array($q),'kurum kendi soru içeriğini görebilmeli.');
ok_141((int)$q['summary']['targeted']===2,'iki hedef öğrenci olmalı.');
ok_141((int)$q['summary']['answered']===2,'iki öğrenci cevaplamış olmalı.');
ok_141((int)$q['summary']['correct']===1,'bir doğru cevap olmalı.');
ok_141((int)$q['summary']['wrong']===1,'bir yanlış cevap olmalı.');
ok_141((int)$q['summary']['waiting']===0,'bekleyen öğrenci kalmamalı.');
$ids=array_map(static fn(array $r):int=>(int)$r['id'],$q['students']);
sort($ids);
ok_141($ids===[101,102],'başka kurum öğrencisi soru detayına sızmamalı.');

$hw=kid_content_detail($pdo,10,702);
ok_141(is_array($hw),'kurum kendi ödev detayını görebilmeli.');
ok_141((int)$hw['summary']['targeted']===1,'seçili hedef yalnız Ada olmalı.');
ok_141((int)$hw['students'][0]['id']===101,'ödev hedefi Ada olmalı.');
ok_141((int)$hw['summary']['overdue']===1,'geçmiş teslim tarihli tamamlanmamış ödev gecikmiş olmalı.');

$other=kid_content_detail($pdo,10,801);
ok_141($other===null,'başka kuruma ait içerik institution scope ile okunamamalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
$teacherInactive=kid_content_detail($pdo,10,701);
ok_141($teacherInactive===null,'öğretmen aktif kurum üyeliği yoksa içerik detaydan düşmeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution content detail tenant/student-status DB integration\n";
