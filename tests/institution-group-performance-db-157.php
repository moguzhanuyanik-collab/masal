<?php
declare(strict_types=1);

function fail_157(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_157(bool $condition,string $message): void { if(!$condition) fail_157($message); }

require __DIR__.'/../src/kurum_icerik_dashboard.php';
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
}catch(Throwable $e){ fail_157('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogrenci_odev_durumlari','ogretmen_icerik_cevaplari','ogretmen_icerik_hedef_gruplari',
 'ogretmen_icerik_hedefleri','ogretmen_icerikleri','ders_modulleri','dersler',
 'ogretmen_ogrenci','ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurumlar (
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmenler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
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
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, hedef_turu VARCHAR(30) NOT NULL,
 teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedef_gruplari (
 icerik_id BIGINT UNSIGNED NOT NULL, kurum_sinif_id BIGINT UNSIGNED NOT NULL,
 kurum_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 grup_adi VARCHAR(120) NOT NULL, grup_turu VARCHAR(20) NOT NULL, sinif_seviyesi TINYINT UNSIGNED NULL,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 secilen_cevap_indeksi INT NULL, dogru TINYINT(1) NOT NULL DEFAULT 0,
 deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 tamamlandi TINYINT(1) NOT NULL DEFAULT 0, tamamlanma_tarihi DATETIME NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(3002,'Öğretmen B',1),
 (1001,'Ada',1),(1002,'Bora',1),(1003,'Cem',1),(2001,'Derya',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3002,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1),(102,1002,'Bora','bora@example.com',4,1),
 (103,1003,'Cem','cem@example.com',4,1),(201,2001,'Derya','derya@example.com',4,1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,103,10),(302,201,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,yildiz_degeri,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi,secenekler_json,dogru_cevap_indeksi)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Soru 1',NULL,'2+2?',2,'secili_ogrenciler',NULL,1,'2026-09-10 10:00:00','[\"3\",\"4\"]',1),
 (702,10,301,1,11,'Toplama','odev','Ödev 1','Çalışma yap.',NULL,0,'secili_ogrenciler','2020-09-20 18:00:00',1,'2026-09-11 10:00:00',NULL,NULL),
 (703,10,301,1,11,'Toplama','not','Not 1','Hatırlatma',NULL,0,'secili_ogrenciler',NULL,1,'2026-09-12 10:00:00',NULL,NULL),
 (704,10,301,1,11,'Toplama','soru','Eski Snapshot Yok',NULL,'1+1?',0,'secili_ogrenciler',NULL,1,'2026-09-09 10:00:00','[\"1\",\"2\"]',1),
 (801,20,302,1,11,'Toplama','soru','Başka Kurum',NULL,'3+3?',0,'secili_ogrenciler',NULL,1,'2026-09-10 10:00:00','[\"5\",\"6\"]',1)");

$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES
 (701,101),(701,102),(701,103),
 (702,101),(702,102),(702,103),
 (703,101),(703,102),
 (704,101),
 (801,201)");

$pdo->exec("INSERT INTO ogretmen_icerik_hedef_gruplari
 (icerik_id,kurum_sinif_id,kurum_id,ogrenci_id,grup_adi,grup_turu,sinif_seviyesi,olusturulma_tarihi) VALUES
 (701,501,10,101,'4-A','sinif',4,'2026-09-10 10:00:00'),
 (701,501,10,102,'4-A','sinif',4,'2026-09-10 10:00:00'),
 (701,502,10,102,'Destek','grup',NULL,'2026-09-10 10:00:00'),
 (701,502,10,103,'Destek','grup',NULL,'2026-09-10 10:00:00'),
 (702,501,10,101,'4-A','sinif',4,'2026-09-11 10:00:00'),
 (702,501,10,102,'4-A','sinif',4,'2026-09-11 10:00:00'),
 (702,502,10,102,'Destek','grup',NULL,'2026-09-11 10:00:00'),
 (702,502,10,103,'Destek','grup',NULL,'2026-09-11 10:00:00'),
 (703,501,10,101,'4-A','sinif',4,'2026-09-12 10:00:00'),
 (703,501,10,102,'4-A','sinif',4,'2026-09-12 10:00:00'),
 (801,601,20,201,'4-X','sinif',4,'2026-09-10 10:00:00')");

$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari
 (icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi,cevap_tarihi,guncellenme_tarihi) VALUES
 (701,101,1,1,1,'2026-09-15 10:00:00','2026-09-15 10:00:00'),
 (701,102,0,0,1,'2026-09-15 11:00:00','2026-09-15 11:00:00')");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (702,101,1,'2026-09-15 12:00:00'),
 (702,102,0,NULL),
 (702,103,0,NULL)");

$groups=kic_group_options($pdo,10,0);
$groupIds=array_map('intval',array_column($groups,'id'));
sort($groupIds);
ok_157($groupIds===[501,502],'Okul A yalnız kendi snapshot gruplarını göstermeli.');

$byGroup=[];
foreach($groups as $group)$byGroup[(int)$group['id']]=$group;
ok_157((int)$byGroup[501]['icerik_sayisi']===3,'4-A üç yayında snapshotlanmış olmalı.');
ok_157((int)$byGroup[501]['ogrenci_sayisi']===2,'4-A iki farklı snapshot öğrencisine sahip olmalı.');
ok_157((int)$byGroup[502]['icerik_sayisi']===2,'Destek iki yayında snapshotlanmış olmalı.');

$all=kic_contents($pdo,10,0,'tum','tum',0);
$allIds=array_map(static fn(array $r):int=>(int)$r['id'],$all);
sort($allIds);
ok_157($allIds===[701,702,703,704],'snapshotı olmayan eski yayın genel görünümde korunmalı.');

$g501=kic_contents($pdo,10,0,'tum','tum',501);
$g501ById=[];
foreach($g501 as $row)$g501ById[(int)$row['id']]=$row;
$g501Ids=array_keys($g501ById); sort($g501Ids);
ok_157($g501Ids===[701,702,703],'4-A filtresi yalnız snapshot ilişkili üç yayını getirmeli.');
ok_157((int)$g501ById[701]['hedef_sayisi']===2,'4-A soru hedefi iki olmalı.');
ok_157((int)$g501ById[701]['cevaplayan_sayisi']===2,'4-A iki soru cevabı olmalı.');
ok_157((int)$g501ById[701]['dogru_sayisi']===1 && (int)$g501ById[701]['yanlis_sayisi']===1,'4-A doğru/yanlış ayrımı 1/1 olmalı.');
ok_157((int)$g501ById[701]['bekleyen_sayisi']===0,'4-A soru bekleyeni olmamalı.');
ok_157((int)$g501ById[702]['hedef_sayisi']===2,'4-A ödev hedefi iki olmalı.');
ok_157((int)$g501ById[702]['tamamlayan_sayisi']===1,'4-A bir ödev tamamlayan olmalı.');
ok_157((int)$g501ById[702]['geciken_sayisi']===1,'4-A bir geciken olmalı.');

$g502=kic_contents($pdo,10,0,'tum','tum',502);
$g502ById=[];
foreach($g502 as $row)$g502ById[(int)$row['id']]=$row;
$g502Ids=array_keys($g502ById); sort($g502Ids);
ok_157($g502Ids===[701,702],'Destek filtresi yalnız soru ve ödevi getirmeli.');
ok_157((int)$g502ById[701]['hedef_sayisi']===2,'Destek soru hedefi iki olmalı.');
ok_157((int)$g502ById[701]['cevaplayan_sayisi']===1,'Destek yalnız Bora cevabını saymalı.');
ok_157((int)$g502ById[701]['dogru_sayisi']===0 && (int)$g502ById[701]['yanlis_sayisi']===1,'Destek soru sonucu 0 doğru / 1 yanlış olmalı.');
ok_157((int)$g502ById[701]['bekleyen_sayisi']===1,'Destek Cem cevabını bekliyor olmalı.');
ok_157((int)$g502ById[702]['tamamlayan_sayisi']===0,'Destek ödevinde tamamlayan olmamalı.');
ok_157((int)$g502ById[702]['geciken_sayisi']===2,'Destek iki geciken ödev öğrencisi göstermeli.');

ok_157(kic_contents($pdo,10,0,'tum','tum',601)===[],'başka kurum snapshot grubu Okul A dashboarduna sızmamalı.');

$d501=kid_content_detail($pdo,10,701,501);
ok_157(is_array($d501),'4-A soru detayı açılmalı.');
$ids501=array_map(static fn(array $r):int=>(int)$r['id'],$d501['students']);
sort($ids501);
ok_157($ids501===[101,102],'4-A detay yalnız Ada ve Bora göstermeli.');
ok_157((int)$d501['summary']['correct']===1 && (int)$d501['summary']['wrong']===1,'4-A detay özeti dashboard ile aynı olmalı.');
ok_157((int)$d501['group']['id']===501,'detay grup bağlamı 4-A olmalı.');

$d502=kid_content_detail($pdo,10,701,502);
$ids502=array_map(static fn(array $r):int=>(int)$r['id'],$d502['students']);
sort($ids502);
ok_157($ids502===[102,103],'Destek detay yalnız Bora ve Cem göstermeli.');
ok_157((int)$d502['summary']['wrong']===1 && (int)$d502['summary']['waiting']===1,'Destek detay özeti dashboard ile aynı olmalı.');

ok_157(kid_content_detail($pdo,10,701,601)===null,'başka kurum grup bağlamıyla detay açılamamalı.');
ok_157(kid_content_detail($pdo,10,704,501)===null,'snapshotı olmayan eski yayın belirli grup detayında açılamamalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution group performance snapshot DB integration\n";
