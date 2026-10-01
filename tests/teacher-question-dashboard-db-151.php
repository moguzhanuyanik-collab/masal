<?php
declare(strict_types=1);

function fail_151(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_151(bool $condition,string $message): void { if(!$condition) fail_151($message); }

require __DIR__.'/../src/ogretmen_icerik.php';
require __DIR__.'/../src/ogretmen_soru_dashboard.php';

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
}catch(Throwable $e){ fail_151('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogretmen_icerik_yildiz_odulleri','ogretmen_icerik_cevaplari','ogretmen_icerik_hedefleri',
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
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, kod VARCHAR(60) NULL, tur VARCHAR(30) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
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
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 secilen_cevap_indeksi INT NULL, dogru TINYINT(1) NOT NULL DEFAULT 0,
 deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_yildiz_odulleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(1001,'Ada',1),(1002,'Bora',1),(1003,'Derya',0),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,kod,tur,aktif) VALUES (10,'Okul A','A','okul',1),(20,'Okul B','B','okul',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3001,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES
 (101,1001,'Ada','ada@example.com',1),(102,1002,'Bora','bora@example.com',1),
 (103,1003,'Derya','derya@example.com',1),(201,2001,'Cem','cem@example.com',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,103,10),(301,201,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,soru,
  secenekler_json,dogru_cevap_indeksi,yildiz_degeri,hedef_turu,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Karışık Sonuç','2+2?','[\"3\",\"4\"]',1,5,'tum_ogrenciler',1,'2026-09-10 10:00:00'),
 (702,10,301,1,11,'Toplama','soru','Cevap Bekliyor','3+3?','[\"5\",\"6\"]',1,3,'secili_ogrenciler',1,'2026-09-11 10:00:00'),
 (703,10,301,1,11,'Toplama','soru','Tümü Doğru','4+4?','[\"8\",\"9\"]',0,2,'tum_ogrenciler',1,'2026-09-12 10:00:00'),
 (704,10,301,1,11,'Toplama','soru','Hedefsiz','5+5?','[\"10\",\"11\"]',0,0,'secili_ogrenciler',1,'2026-09-13 10:00:00'),
 (705,10,301,1,11,'Toplama','soru','Pasif Soru','6+6?','[\"12\",\"13\"]',0,0,'tum_ogrenciler',0,'2026-09-14 10:00:00'),
 (801,20,301,1,11,'Toplama','soru','Okul B','7+7?','[\"14\",\"15\"]',0,0,'tum_ogrenciler',1,'2026-09-15 10:00:00'),
 (900,10,301,1,11,'Toplama','odev','Soru Değil',NULL,NULL,NULL,0,'tum_ogrenciler',1,'2026-09-16 10:00:00')");

$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES
 (702,101),(704,103)");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi) VALUES
 (701,101,1,1,1),(701,102,0,0,1),
 (703,101,0,1,1),(703,102,0,1,1),
 (705,101,0,1,1),(801,201,0,1,1)");
$pdo->exec("INSERT INTO ogretmen_icerik_yildiz_odulleri(icerik_id,ogrenci_id,yildiz_degeri) VALUES
 (701,101,5),(703,101,2),(703,102,2),(801,201,4)");

$rows=tsd_teacher_questions($pdo,3001,10,'tum');
ok_151(count($rows)===5,'Okul A için dört aktif/pasif soru + hedefsiz soru görünmeli; ödev görünmemeli.');

$byId=[];
foreach($rows as $row)$byId[(int)$row['id']]=$row;

ok_151(isset($byId[701],$byId[702],$byId[703],$byId[704],$byId[705]),'Okul A soru kimlikleri eksik.');
ok_151(!isset($byId[801],$byId[900]),'başka kurum sorusu veya ödev sızmamalı.');

ok_151((int)$byId[701]['hedef_sayisi']===2,'pasif kullanıcı Derya hedef sayısına girmemeli.');
ok_151((int)$byId[701]['cevaplayan_sayisi']===2,'Karışık Sonuç için iki cevap olmalı.');
ok_151((int)$byId[701]['dogru_sayisi']===1 && (int)$byId[701]['yanlis_sayisi']===1,'Karışık Sonuç 1 doğru 1 yanlış olmalı.');
ok_151((string)$byId[701]['performans_durumu']==='wrong','yanlış cevap bulunan soru wrong olmalı.');
ok_151((int)$byId[701]['dogruluk_orani']===50,'Karışık Sonuç doğruluğu yüzde 50 olmalı.');
ok_151((int)$byId[701]['dagitilan_yildiz']===5,'Karışık Sonuç 5 yıldız dağıtmış olmalı.');

ok_151((int)$byId[702]['hedef_sayisi']===1 && (int)$byId[702]['bekleyen_sayisi']===1,'seçili Ada cevap bekliyor olmalı.');
ok_151((string)$byId[702]['performans_durumu']==='waiting','cevap bekleyen soru waiting olmalı.');

ok_151((int)$byId[703]['hedef_sayisi']===2 && (int)$byId[703]['dogru_sayisi']===2,'Tümü Doğru iki hedefte iki doğru olmalı.');
ok_151((string)$byId[703]['performans_durumu']==='all_correct','Tümü Doğru all_correct olmalı.');
ok_151((int)$byId[703]['dagitilan_yildiz']===4,'Tümü Doğru toplam 4 yıldız dağıtmış olmalı.');

ok_151((int)$byId[704]['hedef_sayisi']===0,'yalnız pasif kullanıcıya seçili soru hedef 0 olmalı.');
ok_151((string)$byId[704]['performans_durumu']==='no_target','geçerli hedefi kalmayan soru no_target olmalı.');

$active=tsd_teacher_questions($pdo,3001,10,'aktif');
$activeIds=array_map(static fn(array $r):int=>(int)$r['id'],$active);
ok_151(!in_array(705,$activeIds,true),'aktif filtre pasif soruyu dışarıda bırakmalı.');

$passive=tsd_teacher_questions($pdo,3001,10,'pasif');
ok_151(count($passive)===1 && (int)$passive[0]['id']===705,'pasif filtre yalnız Pasif Soru yu getirmeli.');

$wrong=tsd_filter_questions($rows,'wrong');
ok_151(count($wrong)===1 && (int)$wrong[0]['id']===701,'wrong filtresi yalnız Karışık Sonuç olmalı.');
$allCorrect=tsd_filter_questions($rows,'all_correct');
ok_151(count($allCorrect)===1 && (int)$allCorrect[0]['id']===703,'all_correct filtresi yalnız tüm hedefleri doğru tamamlayan soruyu getirmeli.');
$noTarget=tsd_filter_questions($rows,'no_target');
ok_151(count($noTarget)===1 && (int)$noTarget[0]['id']===704,'no_target filtresi yalnız Hedefsiz olmalı.');

$summary=tsd_dashboard_summary($rows);
ok_151($summary['total']===5,'dashboard toplam soru 5 olmalı.');
ok_151($summary['active']===4,'dashboard aktif soru 4 olmalı.');
ok_151($summary['targets']===7,'toplam geçerli hedef sayısı 7 olmalı.');
ok_151($summary['answered']===5,'toplam cevaplanan hedef 5 olmalı.');
ok_151($summary['correct']===4,'toplam doğru 4 olmalı.');
ok_151($summary['wrong']===1,'toplam yanlış 1 olmalı.');
ok_151($summary['waiting']===2,'toplam bekleyen 2 olmalı.');
ok_151($summary['reward_stars']===9,'Okul A dağıtılan toplam yıldız 9 olmalı.');
ok_151($summary['answer_rate']===71,'toplam cevaplanma oranı yüzde 71 olmalı.');
ok_151($summary['accuracy']===80,'toplam doğruluk oranı yüzde 80 olmalı.');

$schoolB=tsd_teacher_questions($pdo,3001,20,'tum');
ok_151(count($schoolB)===1 && (int)$schoolB[0]['id']===801,'Okul B ayrı tenant kapsamında tek soru getirmeli.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=20 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
ok_151(tsd_teacher_questions($pdo,3001,20,'tum')===[],'öğretmen Okul B üyeliği pasif olunca dashboard erişimi kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher question dashboard tenant/performance/reward DB integration\n";
