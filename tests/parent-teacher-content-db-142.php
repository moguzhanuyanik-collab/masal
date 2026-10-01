<?php
declare(strict_types=1);

function fail_142(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_142(bool $condition,string $message): void { if(!$condition) fail_142($message); }

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
}catch(Throwable $e){ fail_142('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogrenci_odev_durumlari','ogretmen_icerik_cevaplari','ogretmen_icerik_hedefleri',
 'ogretmen_icerikleri','ders_modulleri','dersler','ogretmen_ogrenci',
 'veli_ogrenci','veliler','ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE veliler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
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

$pdo->exec("CREATE TABLE veli_ogrenci (
 veli_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(veli_id,ogrenci_id,kurum_id)
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
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (5001,'Veli A',1),(3001,'Öğretmen A',1),(3002,'Öğretmen B',1),
 (1001,'Ada',1),(1002,'Bora',1)");
$pdo->exec("INSERT INTO veliler(id,kullanici_id,ad_soyad,aktif) VALUES (501,5001,'Veli A',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,5001,'veli',1),(20,5001,'veli',1),
 (10,3001,'ogretmen',1),(20,3002,'ogretmen',1),
 (10,1001,'ogrenci',1),(20,1001,'ogrenci',1),(10,1002,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1),(102,1002,'Bora','bora@example.com',4,1)");
$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES (501,101,10)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(302,101,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,secenekler_json,dogru_cevap_indeksi,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Soru A',NULL,'2+2?','[\"3\",\"4\"]',1,'tum_ogrenciler',NULL,1,'2026-09-10 10:00:00'),
 (702,10,301,1,11,'Toplama','odev','Ödev A','Çalışma yap.',NULL,NULL,NULL,'secili_ogrenciler','2020-09-20 18:00:00',1,'2026-09-11 10:00:00'),
 (703,10,301,1,11,'Toplama','tekrar','Tekrar A','Konuyu tekrar et.',NULL,NULL,NULL,'tum_ogrenciler',NULL,1,'2026-09-12 10:00:00'),
 (704,10,301,1,11,'Toplama','soru','Bora Sorusu',NULL,'1+1?','[\"1\",\"2\"]',1,'secili_ogrenciler',NULL,1,'2026-09-13 10:00:00'),
 (801,20,302,1,11,'Toplama','soru','Başka Kurum Sorusu',NULL,'3+3?','[\"5\",\"6\"]',1,'tum_ogrenciler',NULL,1,'2026-09-14 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES (702,101),(704,102)");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi,cevap_tarihi) VALUES
 (701,101,1,1,2,'2026-09-15 10:00:00'),
 (801,101,0,0,1,'2026-09-15 11:00:00')");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (702,101,0,NULL)");

$children=vi_parent_children($pdo,5001);
ok_142(count($children)===1 && (int)$children[0]['id']===101,'veli yalnız kurum eşleştirmesi bulunan Ada çocuğunu görmeli.');

$institutions=vi_parent_child_institutions($pdo,5001,101);
ok_142(count($institutions)===1 && (int)$institutions[0]['id']===10,'Ada için yalnız veli-öğrenci ilişkisi bulunan kurum görünmeli.');

$contents=vi_parent_contents($pdo,5001,101,0,'tum');
ok_142(count($contents)===3,'veli Ada için yalnız Okul A içindeki hedeflenmiş üç aktif içeriği görmeli.');
$ids=array_map(static fn(array $row):int=>(int)$row['id'],$contents);
sort($ids);
ok_142($ids===[701,702,703],'başka kurum veya başka öğrenciye seçili içerik sızmamalı.');

$questions=vi_parent_contents($pdo,5001,101,10,'soru');
ok_142(count($questions)===1 && (int)$questions[0]['id']===701,'soru filtresi yalnız Ada soru içeriğini getirmeli.');
ok_142((int)$questions[0]['cevap_dogru']===1,'Ada soru cevabı doğru görünmeli.');
ok_142((int)$questions[0]['deneme_sayisi']===2,'Ada deneme sayısı korunmalı.');

$otherInstitution=vi_parent_contents($pdo,5001,101,20,'tum');
ok_142(count($otherInstitution)===0,'veli üyeliği olsa bile veli-öğrenci kurum ilişkisi olmayan kurum içeriği görünmemeli.');

$summary=vi_parent_summary($contents,new DateTimeImmutable('2026-10-01 12:00:00'));
ok_142($summary['all']===3,'toplam içerik üç olmalı.');
ok_142($summary['questions']===1 && $summary['answered']===1 && $summary['correct']===1,'soru özeti doğru olmalı.');
ok_142($summary['homeworks']===1 && $summary['completed']===0,'ödev özeti doğru olmalı.');
ok_142($summary['overdue']===1,'geçmiş tarihli tamamlanmamış ödev gecikmiş olmalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=5001 AND kurum_rolu='veli'");
ok_142(vi_parent_contents($pdo,5001,101,10,'tum')===[],'veli kurum üyeliği pasif olunca içerikler kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: parent teacher-content tenant/status DB integration\n";
