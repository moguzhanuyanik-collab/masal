<?php
declare(strict_types=1);

function fail_149(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_149(bool $condition,string $message): void { if(!$condition) fail_149($message); }

require __DIR__.'/../src/ogretmen_icerik.php';
require __DIR__.'/../src/odev_durumu.php';
require __DIR__.'/../src/ogrenci_odev_dashboard.php';

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
}catch(Throwable $e){ fail_149('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogrenci_odev_durumlari','ogretmen_icerik_cevaplari','ogretmen_icerik_hedefleri',
 'ogretmen_icerikleri','ders_modulleri','dersler','ogretmen_ogrenci',
 'ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
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
 email VARCHAR(190) NULL, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
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
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL, yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,
 hedef_turu VARCHAR(30) NOT NULL, teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
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
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (1001,'Ada',1),(1002,'Bora',1),(3001,'Öğretmen A',1),(3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES
 (101,1001,'Ada','ada@example.com',1),(102,1002,'Bora','bora@example.com',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,1001,'ogrenci',1),(20,1001,'ogrenci',1),(10,1002,'ogrenci',1),
 (10,3001,'ogretmen',1),(20,3002,'ogretmen',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(302,101,20),(301,102,10)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES
 (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES
 (11,1,'Toplama',1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,11,'Toplama','odev','Geciken A','A','tum_ogrenciler','2026-09-20 18:00:00',1,'2026-09-10 10:00:00'),
 (702,10,301,1,11,'Toplama','odev','Bekleyen A','B','secili_ogrenciler','2026-10-20 18:00:00',1,'2026-09-11 10:00:00'),
 (703,10,301,1,11,'Toplama','odev','Tamamlanan A','C','tum_ogrenciler','2026-09-30 18:00:00',1,'2026-09-12 10:00:00'),
 (704,10,301,1,11,'Toplama','odev','Bora Ödevi','D','secili_ogrenciler','2026-10-10 18:00:00',1,'2026-09-13 10:00:00'),
 (801,20,302,1,11,'Toplama','odev','Bekleyen B','E','tum_ogrenciler','2026-10-10 18:00:00',1,'2026-09-14 10:00:00'),
 (802,20,302,1,11,'Toplama','odev','Pasif B','F','tum_ogrenciler','2026-10-11 18:00:00',0,'2026-09-15 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES
 (702,101),(704,102)");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (703,101,1,'2026-09-25 10:00:00')");

$contents=oi_student_contents($pdo,101);
$homeworks=sod_homeworks($contents);
ok_149(count($homeworks)===4,'Ada yalnız erişebildiği dört aktif ödevi görmeli.');
$ids=array_map(static fn(array $r):int=>(int)$r['id'],$homeworks);
sort($ids);
ok_149($ids===[701,702,703,801],'başka öğrenci hedefi ve pasif ödev sızmamalı.');

$institutions=sod_institutions($homeworks);
$institutionIds=array_map('intval',array_column($institutions,'id'));
sort($institutionIds);
ok_149($institutionIds===[10,20],'Ada erişebildiği iki kurum filtresini görmeli.');

$now=new DateTimeImmutable('2026-10-01 12:00:00');
$schoolA=sod_filter($homeworks,10,'tum',$now);
ok_149(count($schoolA)===3,'Okul A filtresinde üç ödev olmalı.');
ok_149((int)$schoolA[0]['id']===701,'geciken ödev listenin başında olmalı.');
ok_149((int)$schoolA[1]['id']===702,'bekleyen ödev gecikenden sonra gelmeli.');
ok_149((int)$schoolA[2]['id']===703,'tamamlanan ödev en sonda olmalı.');

$overdue=sod_filter($homeworks,10,'overdue',$now);
ok_149(count($overdue)===1 && (int)$overdue[0]['id']===701,'geciken filtresi doğru olmalı.');
$pending=sod_filter($homeworks,10,'pending',$now);
ok_149(count($pending)===1 && (int)$pending[0]['id']===702,'bekleyen filtresi doğru olmalı.');
$completed=sod_filter($homeworks,10,'completed',$now);
ok_149(count($completed)===1 && (int)$completed[0]['id']===703,'tamamlanan filtresi doğru olmalı.');

$summary=sod_summary($schoolA,$now);
ok_149($summary['total']===3,'özet toplamı üç olmalı.');
ok_149($summary['overdue']===1,'özet geciken bir olmalı.');
ok_149($summary['pending']===1,'özet bekleyen bir olmalı.');
ok_149($summary['completed']===1,'özet tamamlanan bir olmalı.');
ok_149($summary['completion_rate']===33,'tamamlama oranı yüzde 33 olmalı.');
ok_149($summary['next_due'] instanceof DateTimeImmutable,'sıradaki teslim tarihi bulunmalı.');
ok_149($summary['next_due']->format('Y-m-d H:i:s')==='2026-10-20 18:00:00','sıradaki teslim tarihi Bekleyen A olmalı.');

$schoolB=sod_filter($homeworks,20,'tum',$now);
ok_149(count($schoolB)===1 && (int)$schoolB[0]['id']===801,'Okul B yalnız kendi aktif erişilebilir ödevini getirmeli.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=20 AND kullanici_id=1001 AND kurum_rolu='ogrenci'");
$afterMembership=oi_student_contents($pdo,101);
$afterHomeworks=sod_homeworks($afterMembership);
$afterIds=array_map(static fn(array $r):int=>(int)$r['id'],$afterHomeworks);
ok_149(!in_array(801,$afterIds,true),'öğrenci kurum üyeliği pasif olunca o kurum ödevi kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: student homework dashboard tenant/filter/urgency DB integration\n";
