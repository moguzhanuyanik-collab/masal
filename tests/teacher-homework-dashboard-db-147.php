<?php
declare(strict_types=1);

function fail_147(string $message): never {
    fwrite(STDERR,"FAIL: {$message}\n");
    exit(1);
}
function ok_147(bool $condition,string $message): void {
    if(!$condition) fail_147($message);
}

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
}catch(Throwable $e){
    fail_147('MariaDB bağlantısı kurulamadı: '.$e->getMessage());
}

$tables=[
    'ogrenci_odev_durumlari','ogretmen_icerik_hedefleri','ogretmen_icerikleri',
    'dersler','ogretmen_ogrenci','ogrenciler','kurum_kullanicilari',
    'kurumlar','ogretmenler','kullanicilar'
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
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_ogrenci (
 ogretmen_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE dersler (
 id BIGINT UNSIGNED NOT NULL, kod VARCHAR(50) NOT NULL, ad VARCHAR(190) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL,
 icerik_metni TEXT NULL, hedef_turu VARCHAR(30) NOT NULL, teslim_tarihi DATETIME NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, olusturulma_tarihi DATETIME NOT NULL,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 tamamlandi TINYINT(1) NOT NULL DEFAULT 0, tamamlanma_tarihi DATETIME NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),
 (1001,'Ada',1),(1002,'Bora',1),(1003,'Derya',1),(1004,'Ece',0),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3001,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),(10,1004,'ogrenci',1),
 (20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,aktif) VALUES
 (101,1001,'Ada',1),(102,1002,'Bora',1),(103,1003,'Derya',1),(104,1004,'Ece',1),(201,2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,104,10),(301,201,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,aktif) VALUES (1,'mat','Matematik',1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,icerik_turu,baslik,icerik_metni,hedef_turu,teslim_tarihi,aktif,olusturulma_tarihi)
 VALUES
 (701,10,301,1,'odev','Karışık Durum','A','tum_ogrenciler','2020-01-01 10:00:00',1,'2026-09-01 10:00:00'),
 (702,10,301,1,'odev','Bekleyen','B','secili_ogrenciler','2099-01-01 10:00:00',1,'2026-09-02 10:00:00'),
 (703,10,301,1,'odev','Tamamlanan','C','secili_ogrenciler','2020-01-01 10:00:00',0,'2026-09-03 10:00:00'),
 (704,10,301,1,'odev','Hedefsiz','D','secili_ogrenciler','2020-01-01 10:00:00',1,'2026-09-04 10:00:00'),
 (801,20,301,1,'odev','Okul B Ödevi','E','tum_ogrenciler','2099-01-01 10:00:00',1,'2026-09-05 10:00:00')");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES
 (702,101),(703,102),(704,103)");
$pdo->exec("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi) VALUES
 (701,101,1,'2026-09-10 10:00:00'),
 (703,102,1,'2026-09-11 10:00:00')");

$institutions=thd_teacher_institutions($pdo,3001);
$institutionIds=array_map('intval',array_column($institutions,'id'));
sort($institutionIds);
ok_147($institutionIds===[10,20],'öğretmenin iki aktif kurumu görünmeli.');

$rows=thd_teacher_homeworks($pdo,3001,10,'tum','tum');
ok_147(count($rows)===4,'Okul A için dört ödev dönmeli.');
$byId=[];
foreach($rows as $row)$byId[(int)$row['id']]=$row;

ok_147((int)$byId[701]['hedef_sayisi']===2,'tüm öğrencilere ödevde pasif kullanıcı Ece hedef sayılmamalı.');
ok_147((int)$byId[701]['tamamlanan_sayisi']===1,'karışık ödevde Ada tamamlamış olmalı.');
ok_147((int)$byId[701]['geciken_sayisi']===1,'karışık ödevde Bora gecikmiş olmalı.');
ok_147((int)$byId[701]['bekleyen_sayisi']===0,'karışık ödevde bekleyen kalmamalı.');
ok_147((string)$byId[701]['teslim_durumu']==='overdue','en az bir gecikme varsa ödev durumu overdue olmalı.');

ok_147((int)$byId[702]['hedef_sayisi']===1,'seçili Ada hedefi sayılmalı.');
ok_147((int)$byId[702]['bekleyen_sayisi']===1,'gelecek tarihli Ada ödevi bekliyor olmalı.');
ok_147((string)$byId[702]['teslim_durumu']==='pending','bekleyen ödev pending olmalı.');

ok_147((int)$byId[703]['hedef_sayisi']===1 && (int)$byId[703]['tamamlanan_sayisi']===1,'Bora ödevi tamamen tamamlanmış olmalı.');
ok_147((string)$byId[703]['teslim_durumu']==='completed','tüm hedef tamamladıysa completed olmalı.');

ok_147((int)$byId[704]['hedef_sayisi']===0,'öğretmene bağlı olmayan Derya seçili hedef olsa da sayılmamalı.');
ok_147((string)$byId[704]['teslim_durumu']==='no_target','geçerli hedefi olmayan ödev no_target olmalı.');

$active=thd_teacher_homeworks($pdo,3001,10,'aktif','tum');
ok_147(count($active)===3,'aktif yayın filtresi pasif ödevi çıkarmalı.');

$passive=thd_teacher_homeworks($pdo,3001,10,'pasif','tum');
ok_147(count($passive)===1 && (int)$passive[0]['id']===703,'pasif filtre yalnız pasif ödevi getirmeli.');

$overdue=thd_teacher_homeworks($pdo,3001,10,'tum','overdue');
ok_147(count($overdue)===1 && (int)$overdue[0]['id']===701,'gecikme filtresi yalnız gecikmeli ödevi getirmeli.');

$completed=thd_teacher_homeworks($pdo,3001,10,'tum','completed');
ok_147(count($completed)===1 && (int)$completed[0]['id']===703,'tamamlandı filtresi yalnız tüm hedefleri tamamlayan ödevi getirmeli.');

$noTarget=thd_teacher_homeworks($pdo,3001,10,'tum','no_target');
ok_147(count($noTarget)===1 && (int)$noTarget[0]['id']===704,'hedefsiz filtre yalnız geçerli hedefi olmayan ödevi getirmeli.');

$schoolB=thd_teacher_homeworks($pdo,3001,20,'tum','tum');
ok_147(count($schoolB)===1 && (int)$schoolB[0]['id']===801,'Okul B filtresi tenant sınırını korumalı.');
ok_147((int)$schoolB[0]['hedef_sayisi']===1,'Okul B ödevi yalnız Cem öğrencisini hedef saymalı.');

$summary=thd_dashboard_summary($rows);
ok_147($summary['total']===4,'dashboard toplamı dört olmalı.');
ok_147($summary['active']===3,'üç aktif yayın olmalı.');
ok_147($summary['completed']===1,'bir tümü tamamlanmış ödev olmalı.');
ok_147($summary['overdue']===1,'bir gecikmeli ödev olmalı.');
ok_147($summary['pending']===1,'bir devam eden ödev olmalı.');
ok_147($summary['no_target']===1,'bir hedefsiz ödev olmalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
ok_147(thd_teacher_homeworks($pdo,3001,10,'tum','tum')===[],'öğretmenin kurum üyeliği pasif olunca Okul A ödevleri kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher homework dashboard tenant/progress DB integration\n";
