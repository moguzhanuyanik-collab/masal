<?php
declare(strict_types=1);

function fail_153(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_153(bool $condition,string $message): void { if(!$condition) fail_153($message); }

require __DIR__.'/../src/kurum_icerik_dashboard.php';

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
}catch(Throwable $e){ fail_153('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(3002,'Öğretmen B',1),(3003,'Öğretmen C',1),
 (1001,'Ada',1),(1002,'Bora',1),(1003,'Cem',1),(1004,'Pasif',0)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1),(303,3003,'Öğretmen C',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(10,3002,'ogretmen',1),(20,3003,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1004,'ogrenci',1),(20,1003,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES
 (101,1001,'Ada','ada@example.com',1),(102,1002,'Bora','bora@example.com',1),
 (103,1003,'Cem','cem@example.com',1),(104,1004,'Pasif','pasif@example.com',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,104,10),(302,101,10),(303,103,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,yildiz_degeri,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Yanlışlı Soru',NULL,'2+2?',5,'tum_ogrenciler',NULL,1,'2026-09-10 10:00:00'),
 (702,10,301,1,11,'Toplama','soru','Tam Doğru',NULL,'3+3?',5,'secili_ogrenciler',NULL,1,'2026-09-11 10:00:00'),
 (703,10,301,1,11,'Toplama','odev','Geciken Ödev','A',NULL,0,'tum_ogrenciler','2026-09-20 18:00:00',1,'2026-09-12 10:00:00'),
 (704,10,302,1,11,'Toplama','odev','Tamamlanan Ödev','B',NULL,0,'secili_ogrenciler','2026-09-25 18:00:00',1,'2026-09-13 10:00:00'),
 (705,10,302,1,11,'Toplama','not','Bilgi Notu','C',NULL,0,'tum_ogrenciler',NULL,1,'2026-09-14 10:00:00'),
 (706,10,302,1,11,'Toplama','soru','Hedefsiz',NULL,'4+4?',0,'secili_ogrenciler',NULL,0,'2026-09-15 10:00:00'),
 (801,20,303,1,11,'Toplama','soru','Başka Kurum',NULL,'1+1?',0,'tum_ogrenciler',NULL,1,'2026-09-16 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES
 (702,101),(704,101),(706,103)");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi) VALUES
 (701,101,1,1,1),(701,102,0,0,1),(702,101,1,1,1),(801,103,1,1,1)");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (703,101,1,'2026-09-18 10:00:00'),(704,101,1,'2026-09-20 10:00:00')");

$rows=kic_contents($pdo,10,0,'tum','tum');
ok_153(count($rows)===6,'Okul A altı öğretmen içeriğini getirmeli.');
$ids=array_map(static fn(array $r):int=>(int)$r['id'],$rows);
ok_153(!in_array(801,$ids,true),'başka kurum içeriği sızmamalı.');

$byId=[];
foreach($rows as $row)$byId[(int)$row['id']]=$row;

ok_153((int)$byId[701]['hedef_sayisi']===2,'pasif kullanıcı hedef sayısından çıkarılmalı.');
ok_153((int)$byId[701]['cevaplayan_sayisi']===2,'iki aktif öğrenci cevaplamış olmalı.');
ok_153((int)$byId[701]['dogru_sayisi']===1 && (int)$byId[701]['yanlis_sayisi']===1,'soru doğru/yanlış sayıları 1/1 olmalı.');
ok_153((string)$byId[701]['performans_durumu']==='attention','yanlış cevap içeren soru attention olmalı.');

ok_153((int)$byId[702]['hedef_sayisi']===1,'seçili hedef yalnız Ada olmalı.');
ok_153((int)$byId[702]['dogru_sayisi']===1,'seçili soru doğru tamamlanmış olmalı.');
ok_153((string)$byId[702]['performans_durumu']==='completed','tek hedef doğruysa soru completed olmalı.');

ok_153((int)$byId[703]['hedef_sayisi']===2,'ödevde iki aktif hedef olmalı.');
ok_153((int)$byId[703]['tamamlayan_sayisi']===1,'geciken ödevde bir tamamlayan olmalı.');
ok_153((int)$byId[703]['geciken_sayisi']===1,'tamamlamayan Bora gecikmiş olmalı.');
ok_153((string)$byId[703]['performans_durumu']==='attention','geciken ödev attention olmalı.');

ok_153((int)$byId[704]['hedef_sayisi']===1 && (int)$byId[704]['tamamlayan_sayisi']===1,'seçili ödev tamamlanmış olmalı.');
ok_153((string)$byId[704]['performans_durumu']==='completed','tamamlanan ödev completed olmalı.');

ok_153((string)$byId[705]['performans_durumu']==='info','not içeriği info olmalı.');
ok_153((int)$byId[706]['hedef_sayisi']===0,'başka kurum öğrencisine seçili soru geçerli hedef üretmemeli.');
ok_153((string)$byId[706]['performans_durumu']==='no_target','geçerli hedefi olmayan soru no_target olmalı.');

$attention=kic_filter_performance($rows,'attention');
$attentionIds=array_map(static fn(array $r):int=>(int)$r['id'],$attention);
sort($attentionIds);
ok_153($attentionIds===[701,703],'attention filtresi yanlış soru + geciken ödevi getirmeli.');

$completed=kic_filter_performance($rows,'completed');
$completedIds=array_map(static fn(array $r):int=>(int)$r['id'],$completed);
sort($completedIds);
ok_153($completedIds===[702,704],'completed filtresi tam doğru soru + tamamlanan ödevi getirmeli.');

$noTarget=kic_filter_performance($rows,'no_target');
ok_153(count($noTarget)===1 && (int)$noTarget[0]['id']===706,'no_target filtresi hedefsiz soruyu getirmeli.');

$teacher301=kic_contents($pdo,10,301,'tum','tum');
ok_153(count($teacher301)===3,'öğretmen filtresi yalnız Öğretmen A içeriklerini getirmeli.');

$questions=kic_contents($pdo,10,0,'soru','tum');
ok_153(count($questions)===3,'tür filtresi üç soru getirmeli.');

$active=kic_contents($pdo,10,0,'tum','aktif');
ok_153(count($active)===5,'aktif yayın filtresi beş içerik getirmeli.');
$passive=kic_contents($pdo,10,0,'tum','pasif');
ok_153(count($passive)===1 && (int)$passive[0]['id']===706,'pasif filtre hedefsiz pasif soruyu getirmeli.');

$summary=kic_summary($rows);
ok_153($summary['total']===6,'özet toplamı altı olmalı.');
ok_153($summary['attention_contents']===2,'iki attention yayın olmalı.');
ok_153($summary['completed_contents']===2,'iki completed yayın olmalı.');
ok_153($summary['no_target_contents']===1,'bir hedefsiz yayın olmalı.');
ok_153($summary['question_wrong']===1,'toplam yanlış öğrenci cevabı bir olmalı.');
ok_153($summary['homework_overdue']===1,'toplam geciken öğrenci ödevi bir olmalı.');
ok_153($summary['question_accuracy']===67,'soru doğruluk oranı 2/3 = yüzde 67 olmalı.');
ok_153($summary['homework_completion']===67,'ödev tamamlama oranı 2/3 = yüzde 67 olmalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
$afterTeacher=kic_contents($pdo,10,0,'tum','tum');
$afterIds=array_map(static fn(array $r):int=>(int)$r['id'],$afterTeacher);
ok_153(!in_array(701,$afterIds,true) && !in_array(702,$afterIds,true) && !in_array(703,$afterIds,true),'öğretmen kurum üyeliği pasif olunca yayınları dashboarddan düşmeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution content performance tenant/filter/status DB integration\n";
