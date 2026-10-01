<?php
declare(strict_types=1);

function fail_155(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_155(bool $condition,string $message): void { if(!$condition) fail_155($message); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ogretmen_icerik.php';

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
}catch(Throwable $e){ fail_155('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
    'ogretmen_icerik_hedef_gruplari','ogretmen_icerik_hedefleri','ogretmen_icerikleri','ders_modulleri','dersler',
    'kurum_sinif_ogrencileri','kurum_siniflari','ogretmen_ogrenci',
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
$pdo->exec("CREATE TABLE kurum_siniflari (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(120) NOT NULL,
 tur VARCHAR(20) NOT NULL, sinif_seviyesi TINYINT UNSIGNED NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
 kurum_sinif_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(kurum_sinif_id,ogrenci_id)
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
$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, ders_modulu_id BIGINT UNSIGNED NULL, konu_basligi VARCHAR(190) NULL,
 icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL, icerik_metni TEXT NULL, soru TEXT NULL,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL, yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,
 hedef_turu VARCHAR(30) NOT NULL, teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(1001,'Ada',1),(1002,'Bora',1),(1003,'Derya',1),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,kod,tur,aktif) VALUES
 (10,'Okul A','A','okul',1),(20,'Okul B','B','okul',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3001,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES
 (101,1001,'Ada','ada@example.com',1),
 (102,1002,'Bora','bora@example.com',1),
 (103,1003,'Derya','derya@example.com',1),
 (201,2001,'Cem','cem@example.com',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,201,20)");

$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif) VALUES
 (501,10,'4-A','sinif',4,1),
 (502,10,'Destek','grup',NULL,1),
 (503,10,'Karma','grup',NULL,1),
 (504,10,'Sadece Derya','grup',4,1),
 (601,20,'4-X','sinif',4,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id) VALUES
 (501,10,101),(501,10,103),
 (502,10,102),
 (503,10,101),(503,10,102),
 (504,10,103),
 (601,20,201)");

$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,alt_baslik,sira,aktif) VALUES (11,1,'Toplama',NULL,1,1)");

$groups=oi_teacher_target_groups($pdo,301,10);
$groupIds=array_map('intval',array_column($groups,'id'));
sort($groupIds);
ok_155($groupIds===[501,502,503],'yalnız öğretmene bağlı öğrencisi bulunan Okul A grupları görünmeli.');

$counts=[];
foreach($groups as $group)$counts[(int)$group['id']]=(int)$group['ogrenci_sayisi'];
ok_155($counts[501]===1,'4-A grubunda yalnız öğretmene bağlı Ada sayılmalı.');
ok_155($counts[502]===1,'Destek grubunda Bora sayılmalı.');
ok_155($counts[503]===2,'Karma grubunda Ada ve Bora sayılmalı.');

ok_155(oi_teacher_group_student_ids($pdo,301,10,501)===[101],'4-A hedef çözümü yalnız Ada olmalı.');
ok_155(oi_teacher_group_student_ids($pdo,301,10,504)===[],'öğretmene bağlı olmayan Derya grubu hedef üretmemeli.');
ok_155(oi_teacher_group_student_ids($pdo,301,10,601)===[],'başka kurum grubu Okul A hedefi üretmemeli.');

$resolved=oi_resolve_content_target_ids($pdo,301,10,['hedef_gruplar'=>[501,502]],[102]);
ok_155($resolved===[101,102],'iki grup + tekil öğrenci hedefi birleşip tekilleştirilmeli.');

$invalid=false;
try{
    oi_resolve_content_target_ids($pdo,301,10,['hedef_gruplar'=>[504]],[]);
}catch(RuntimeException $e){
    $invalid=str_contains($e->getMessage(),'bağlı aktif öğrenci içermiyor');
}
ok_155($invalid,'öğretmene bağlı öğrencisi olmayan grup fail-closed olmalı.');

$actor=['id'=>3001];
$contentId=oi_create_content($pdo,$actor,[
    'kurum_id'=>10,
    'ders_id'=>1,
    'ders_modulu_id'=>11,
    'konu_basligi'=>'Toplama',
    'icerik_turu'=>'not',
    'baslik'=>'Grup Notu',
    'icerik_metni'=>'Bugünkü çalışmayı tekrar edin.',
    'hedef_gruplar'=>[501,502],
],[]);
ok_155($contentId>0,'grup hedefli içerik oluşturulmalı.');

$content=$pdo->query('SELECT hedef_turu FROM ogretmen_icerikleri WHERE id='.(int)$contentId)->fetch();
ok_155((string)$content['hedef_turu']==='secili_ogrenciler','grup hedefi seçili öğrenci snapshotına dönüşmeli.');
$targets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id='.(int)$contentId.' ORDER BY ogrenci_id')->fetchAll(PDO::FETCH_COLUMN);
ok_155(array_map('intval',$targets)===[101,102],'grup hedefleri Ada ve Bora olarak snapshot yazılmalı.');

$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES (301,103,10)");
ok_155(oi_teacher_group_student_ids($pdo,301,10,501)===[101,103],'grup üyeliği sonradan yeni bağlı öğrenciyle genişleyebilmeli.');
$oldTargets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id='.(int)$contentId.' ORDER BY ogrenci_id')->fetchAll(PDO::FETCH_COLUMN);
ok_155(array_map('intval',$oldTargets)===[101,102],'eski yayın hedef snapshotı grup değişiminden etkilenmemeli.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
ok_155(oi_teacher_target_groups($pdo,301,10)===[],'öğretmen kurum üyeliği pasif olunca hedef gruplar kapanmalı.');
ok_155(oi_teacher_group_student_ids($pdo,301,10,501)===[],'öğretmen kurum üyeliği pasif olunca grup hedef çözümü kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher class/group content targeting DB integration\n";
