<?php
declare(strict_types=1);

function fail_152(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_152(bool $condition,string $message): void { if(!$condition) fail_152($message); }

require __DIR__.'/../src/ogretmen_icerik.php';
require __DIR__.'/../src/ogrenci_ogretmenim_dashboard.php';

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
}catch(Throwable $e){ fail_152('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL,
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, hedef_turu VARCHAR(30) NOT NULL,
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
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,secenekler_json,dogru_cevap_indeksi,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Doğru Soru',NULL,'2+2?','[\"3\",\"4\"]',1,'tum_ogrenciler',NULL,1,'2026-09-10 10:00:00'),
 (702,10,301,1,11,'Toplama','soru','Yanlış Soru',NULL,'3+3?','[\"5\",\"6\"]',1,'tum_ogrenciler',NULL,1,'2026-09-11 10:00:00'),
 (703,10,301,1,11,'Toplama','soru','Bekleyen Soru',NULL,'4+4?','[\"8\",\"9\"]',0,'tum_ogrenciler',NULL,1,'2026-09-12 10:00:00'),
 (704,10,301,1,11,'Toplama','odev','Geciken Ödev','A',NULL,NULL,NULL,'tum_ogrenciler','2026-09-20 18:00:00',1,'2026-09-13 10:00:00'),
 (705,10,301,1,11,'Toplama','odev','Tamamlanan Ödev','B',NULL,NULL,NULL,'tum_ogrenciler','2026-09-30 18:00:00',1,'2026-09-14 10:00:00'),
 (706,10,301,1,11,'Toplama','tekrar','Tekrar','C',NULL,NULL,NULL,'tum_ogrenciler',NULL,1,'2026-09-15 10:00:00'),
 (707,10,301,1,11,'Toplama','not','Bora Notu','D',NULL,NULL,NULL,'secili_ogrenciler',NULL,1,'2026-09-16 10:00:00'),
 (801,20,302,1,11,'Toplama','odev','Bekleyen B','E',NULL,NULL,NULL,'tum_ogrenciler','2026-10-10 18:00:00',1,'2026-09-17 10:00:00'),
 (802,20,302,1,11,'Toplama','soru','Pasif B',NULL,'1+1?','[\"1\",\"2\"]',1,'tum_ogrenciler',NULL,0,'2026-09-18 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES (707,102)");
$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi) VALUES
 (701,101,1,1,1),(702,101,0,0,1)");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (705,101,1,'2026-09-25 10:00:00')");

$contents=oi_student_contents($pdo,101);
ok_152(count($contents)===7,'Ada yalnız erişebildiği yedi aktif içeriği görmeli.');
$ids=array_map(static fn(array $row):int=>(int)$row['id'],$contents);
sort($ids);
ok_152($ids===[701,702,703,704,705,706,801],'başka öğrenci hedefi ve pasif içerik sızmamalı.');

$institutions=std_institutions($contents);
$institutionIds=array_map('intval',array_column($institutions,'id'));
sort($institutionIds);
ok_152($institutionIds===[10,20],'iki erişilebilir kurum filtresi oluşmalı.');

$now=new DateTimeImmutable('2026-10-01 12:00:00');
$schoolA=std_filter_contents($contents,10,'tum','tum',$now);
ok_152(count($schoolA)===6,'Okul A kapsamında altı içerik olmalı.');

$questions=std_filter_contents($schoolA,0,'soru','tum',$now);
ok_152(count($questions)===3,'Okul A üç soru içermeli.');

$attention=std_filter_contents($schoolA,0,'tum','attention',$now);
$attentionIds=array_map(static fn(array $row):int=>(int)$row['id'],$attention);
sort($attentionIds);
ok_152($attentionIds===[702,704],'yanlış soru ve geciken ödev dikkat filtresine girmeli.');

$waiting=std_filter_contents($schoolA,0,'tum','waiting',$now);
ok_152(count($waiting)===1 && (int)$waiting[0]['id']===703,'yalnız bekleyen soru waiting filtresinde olmalı.');

$completed=std_filter_contents($schoolA,0,'tum','completed',$now);
$completedIds=array_map(static fn(array $row):int=>(int)$row['id'],$completed);
sort($completedIds);
ok_152($completedIds===[701,705],'doğru soru ve tamamlanan ödev completed filtresinde olmalı.');

$info=std_filter_contents($schoolA,0,'tum','info',$now);
ok_152(count($info)===1 && (int)$info[0]['id']===706,'tekrar içeriği bilgi filtresinde olmalı.');

$summary=std_summary($schoolA,$now);
ok_152($summary['total']===6,'özet toplamı altı olmalı.');
ok_152($summary['questions']===3 && $summary['question_answered']===2,'üç sorudan ikisi cevaplanmış olmalı.');
ok_152($summary['question_correct']===1 && $summary['question_wrong']===1 && $summary['question_waiting']===1,'soru durumları 1/1/1 olmalı.');
ok_152($summary['question_accuracy']===50,'soru doğruluğu yüzde 50 olmalı.');
ok_152($summary['homeworks']===2 && $summary['homework_completed']===1 && $summary['homework_overdue']===1,'ödev durumları doğru olmalı.');
ok_152($summary['homework_completion']===50,'ödev tamamlama oranı yüzde 50 olmalı.');
ok_152($summary['attention']===2,'dikkat toplamı yanlış soru + geciken ödev = 2 olmalı.');

$schoolB=std_filter_contents($contents,20,'tum','tum',$now);
ok_152(count($schoolB)===1 && (int)$schoolB[0]['id']===801,'Okul B yalnız kendi erişilebilir aktif içeriğini getirmeli.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=20 AND kullanici_id=1001 AND kurum_rolu='ogrenci'");
$after=oi_student_contents($pdo,101);
$afterInstitutions=std_institutions($after);
ok_152(!in_array(20,array_map('intval',array_column($afterInstitutions,'id')),true),'öğrenci kurum üyeliği pasif olunca Okul B filtreden kalkmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: student teacher-content dashboard tenant/filter/status DB integration\n";
