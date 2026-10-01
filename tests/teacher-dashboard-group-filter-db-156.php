<?php
declare(strict_types=1);

function fail_156(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_156(bool $condition,string $message): void { if(!$condition) fail_156($message); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ogretmen_icerik.php';
require __DIR__.'/../src/ogretmen_soru_dashboard.php';
require __DIR__.'/../src/ogretmen_odev_dashboard.php';

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
}catch(Throwable $e){ fail_156('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogretmen_icerik_yildiz_odulleri','ogrenci_odev_durumlari','ogretmen_icerik_cevaplari',
 'ogretmen_icerik_hedef_gruplari','ogretmen_icerik_hedefleri','ogretmen_icerikleri',
 'kurum_sinif_ogrencileri','kurum_siniflari','ders_modulleri','dersler',
 'ogretmen_ogrenci','ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
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
 alt_baslik VARCHAR(190) NULL, sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_siniflari (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(120) NOT NULL,
 tur VARCHAR(20) NOT NULL, sinif_seviyesi TINYINT UNSIGNED NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
 kurum_sinif_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, ders_modulu_id BIGINT UNSIGNED NULL, konu_basligi VARCHAR(190) NULL,
 icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL, icerik_metni TEXT NULL, soru TEXT NULL,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL,
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, hedef_turu VARCHAR(30) NOT NULL,
 teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedef_gruplari (
 icerik_id BIGINT UNSIGNED NOT NULL, kurum_sinif_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 ogrenci_id BIGINT UNSIGNED NOT NULL, grup_adi VARCHAR(120) NOT NULL, grup_turu VARCHAR(20) NOT NULL,
 sinif_seviyesi TINYINT UNSIGNED NULL, olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, secilen_cevap_indeksi INT NULL,
 dogru TINYINT(1) NOT NULL DEFAULT 0, deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_yildiz_odulleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(1001,'Ada',1),(1002,'Bora',1),(1003,'Cem',1),(2001,'Derya',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),
 (20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1),(102,1002,'Bora','bora@example.com',4,1),
 (103,1003,'Cem','cem@example.com',4,1),(201,2001,'Derya','derya@example.com',4,1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,103,10)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,alt_baslik,sira,aktif) VALUES (11,1,'Toplama',NULL,1,1)");
$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif) VALUES
 (501,10,'4-A','sinif',4,1),(502,10,'Destek','grup',NULL,1),(601,20,'4-X','sinif',4,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id) VALUES
 (501,10,101),(501,10,102),(502,10,102),(502,10,103),(601,20,201)");

$actor=['id'=>3001];

$questionId=oi_create_content($pdo,$actor,[
 'kurum_id'=>10,'ders_id'=>1,'ders_modulu_id'=>11,'konu_basligi'=>'Toplama',
 'icerik_turu'=>'soru','baslik'=>'Grup Sorusu','soru'=>'2+2?',
 'secenekler'=>['3','4'],'dogru_cevap_indeksi'=>1,'yildiz_degeri'=>3,
 'hedef_gruplar'=>[501,502],
],[]);
ok_156($questionId>0,'grup hedefli soru oluşturulmalı.');

$qTargets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id='.(int)$questionId.' ORDER BY ogrenci_id')->fetchAll(PDO::FETCH_COLUMN);
ok_156(array_map('intval',$qTargets)===[101,102,103],'iki grup hedefi öğrenci listesinde tekilleştirilmeli.');

$qSnapshots=$pdo->query('SELECT kurum_sinif_id,ogrenci_id FROM ogretmen_icerik_hedef_gruplari WHERE icerik_id='.(int)$questionId.' ORDER BY kurum_sinif_id,ogrenci_id')->fetchAll();
ok_156(count($qSnapshots)===4,'grup->öğrenci snapshotı dört satır olmalı.');
ok_156((int)$qSnapshots[0]['kurum_sinif_id']===501 && (int)$qSnapshots[0]['ogrenci_id']===101,'4-A Ada snapshotı eksik.');
ok_156((int)$qSnapshots[1]['kurum_sinif_id']===501 && (int)$qSnapshots[1]['ogrenci_id']===102,'4-A Bora snapshotı eksik.');
ok_156((int)$qSnapshots[2]['kurum_sinif_id']===502 && (int)$qSnapshots[2]['ogrenci_id']===102,'Destek Bora snapshotı eksik.');
ok_156((int)$qSnapshots[3]['kurum_sinif_id']===502 && (int)$qSnapshots[3]['ogrenci_id']===103,'Destek Cem snapshotı eksik.');

$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi) VALUES
 ({$questionId},101,1,1,1),({$questionId},102,0,0,1)");
$pdo->exec("INSERT INTO ogretmen_icerik_yildiz_odulleri(icerik_id,ogrenci_id,yildiz_degeri) VALUES ({$questionId},101,3)");

$qAll=tsd_teacher_questions($pdo,3001,10,'tum',0);
ok_156(count($qAll)===1 && (int)$qAll[0]['hedef_sayisi']===3,'tüm soru görünümünde üç hedef olmalı.');
ok_156((int)$qAll[0]['cevaplayan_sayisi']===2 && (int)$qAll[0]['dagitilan_yildiz']===3,'tüm soru performansı doğru olmalı.');

$q501=tsd_teacher_questions($pdo,3001,10,'tum',501);
ok_156(count($q501)===1,'4-A filtresi soruyu getirmeli.');
ok_156((int)$q501[0]['hedef_sayisi']===2,'4-A iki snapshot öğrenci saymalı.');
ok_156((int)$q501[0]['cevaplayan_sayisi']===2,'4-A iki cevap saymalı.');
ok_156((int)$q501[0]['dogru_sayisi']===1 && (int)$q501[0]['yanlis_sayisi']===1,'4-A doğru/yanlış dağılımı doğru olmalı.');
ok_156((int)$q501[0]['dagitilan_yildiz']===3,'4-A yalnız Ada ödülünü saymalı.');

$q502=tsd_teacher_questions($pdo,3001,10,'tum',502);
ok_156(count($q502)===1 && (int)$q502[0]['hedef_sayisi']===2,'Destek iki snapshot öğrenci saymalı.');
ok_156((int)$q502[0]['cevaplayan_sayisi']===1 && (int)$q502[0]['yanlis_sayisi']===1,'Destek yalnız Bora cevabını saymalı.');
ok_156((int)$q502[0]['bekleyen_sayisi']===1,'Destek içinde Cem bekliyor olmalı.');
ok_156((int)$q502[0]['dagitilan_yildiz']===0,'4-A ödülü Destek grubuna sızmamalı.');

$detail501=oi_teacher_content_detail($pdo,$actor,$questionId,501);
$detailIds=array_map(static fn(array $row):int=>(int)$row['id'],$detail501['students']??[]);
sort($detailIds);
ok_156($detailIds===[101,102],'soru detayında 4-A yalnız Ada ve Bora olmalı.');

$editable=oi_teacher_content_for_edit($pdo,$actor,$questionId);
$editGroups=array_map('intval',$editable['hedef_gruplar']??[]);
sort($editGroups);
ok_156($editGroups===[501,502],'edit akışı seçilmiş iki grubu geri yüklemeli.');

$copyId=oi_duplicate_content($pdo,$actor,$questionId);
$copySnapshotCount=(int)$pdo->query('SELECT COUNT(*) FROM ogretmen_icerik_hedef_gruplari WHERE icerik_id='.(int)$copyId)->fetchColumn();
ok_156($copySnapshotCount===4,'kopya grup snapshotlarını korumalı.');

$homeworkId=oi_create_content($pdo,$actor,[
 'kurum_id'=>10,'ders_id'=>1,'ders_modulu_id'=>11,'konu_basligi'=>'Toplama',
 'icerik_turu'=>'odev','baslik'=>'4-A Ödevi','icerik_metni'=>'Çalışmayı tamamla.',
 'teslim_tarihi'=>'2020-09-20T18:00','hedef_gruplar'=>[501],
],[103]);
ok_156($homeworkId>0,'grup + tekil öğrenci ödevi oluşturulmalı.');

$hwTargets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id='.(int)$homeworkId.' ORDER BY ogrenci_id')->fetchAll(PDO::FETCH_COLUMN);
ok_156(array_map('intval',$hwTargets)===[101,102,103],'ödev grup ve tekil hedefleri birleşmeli.');
$hwSnapshots=(int)$pdo->query('SELECT COUNT(*) FROM ogretmen_icerik_hedef_gruplari WHERE icerik_id='.(int)$homeworkId.' AND kurum_sinif_id=501')->fetchColumn();
ok_156($hwSnapshots===2,'ödev 4-A snapshotında yalnız iki grup öğrencisi olmalı.');

$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 ({$homeworkId},101,1,'2020-09-19 10:00:00')");

$hAll=thd_teacher_homeworks($pdo,3001,10,'tum','tum',0);
ok_156(count($hAll)===1 && (int)$hAll[0]['hedef_sayisi']===3,'tüm ödev görünümünde üç hedef olmalı.');
ok_156((int)$hAll[0]['tamamlanan_sayisi']===1 && (int)$hAll[0]['geciken_sayisi']===2,'tüm ödev teslim sayıları doğru olmalı.');

$h501=thd_teacher_homeworks($pdo,3001,10,'tum','tum',501);
ok_156(count($h501)===1 && (int)$h501[0]['hedef_sayisi']===2,'4-A ödev filtresi yalnız iki snapshot öğrenciyi saymalı.');
ok_156((int)$h501[0]['tamamlanan_sayisi']===1 && (int)$h501[0]['geciken_sayisi']===1,'4-A teslim performansı doğru olmalı.');

$qGroups=oi_teacher_dashboard_target_groups($pdo,3001,10,'soru');
$qGroupIds=array_map('intval',array_column($qGroups,'id')); sort($qGroupIds);
ok_156($qGroupIds===[501,502],'soru dashboard grup seçenekleri snapshotlardan gelmeli.');
$hGroups=oi_teacher_dashboard_target_groups($pdo,3001,10,'odev');
ok_156(count($hGroups)===1 && (int)$hGroups[0]['id']===501,'ödev dashboard yalnız ödev snapshot grubunu göstermeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher dashboard group snapshot/filter DB integration\n";
