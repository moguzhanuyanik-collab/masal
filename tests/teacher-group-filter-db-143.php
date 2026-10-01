<?php
declare(strict_types=1);

function fail_143(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_143(bool $condition,string $message): void { if(!$condition) fail_143($message); }

require __DIR__.'/../src/ogretmen_ogrenci_listesi.php';

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
}catch(Throwable $e){ fail_143('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
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

$pdo->exec("CREATE TABLE kurum_siniflari (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(120) NOT NULL,
 tur VARCHAR(20) NOT NULL, sinif_seviyesi TINYINT UNSIGNED NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sinif_ogrencileri (
 kurum_sinif_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(kurum_sinif_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(1001,'Ada',1),(1002,'Bora',1),(1003,'Derya',1),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1),(20,'Okul B',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3001,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(10,1003,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,sinif_seviyesi,aktif) VALUES
 (101,1001,'Ada','ada@example.com',4,1),
 (102,1002,'Bora','bora@example.com',5,1),
 (103,1003,'Derya','derya@example.com',4,1),
 (201,2001,'Cem','cem@example.com',4,1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(301,201,20)");

$pdo->exec("INSERT INTO kurum_siniflari(id,kurum_id,ad,tur,sinif_seviyesi,aktif) VALUES
 (501,10,'4-A','sinif',4,1),
 (502,10,'Destek','grup',NULL,1),
 (503,10,'Sadece Derya','grup',4,1),
 (601,20,'4-X','sinif',4,1)");
$pdo->exec("INSERT INTO kurum_sinif_ogrencileri(kurum_sinif_id,kurum_id,ogrenci_id) VALUES
 (501,10,101),(502,10,102),(503,10,103),(601,20,201)");

$institutions=tol_teacher_institutions($pdo,3001);
$institutionIds=array_map('intval',array_column($institutions,'id'));
sort($institutionIds);
ok_143($institutionIds===[10,20],'öğretmenin iki aktif kurumu görünmeli.');

$groups=tol_teacher_groups($pdo,3001,10);
$groupIds=array_map('intval',array_column($groups,'id'));
sort($groupIds);
ok_143($groupIds===[501,502],'yalnız öğretmene bağlı aktif öğrencilerin bulunduğu gruplar görünmeli.');

$all=tol_teacher_students($pdo,3001,10,0,0);
$allIds=array_map(static fn(array $row):int=>(int)$row['id'],$all);
sort($allIds);
ok_143($allIds===[101,102],'Okul A listesinde yalnız öğretmene bağlı Ada ve Bora olmalı.');

$grade4=tol_teacher_students($pdo,3001,10,4,0);
ok_143(count($grade4)===1 && (int)$grade4[0]['id']===101,'4. sınıf filtresi yalnız Ada öğrencisini getirmeli.');

$group501=tol_teacher_students($pdo,3001,10,0,501);
ok_143(count($group501)===1 && (int)$group501[0]['id']===101,'4-A grup filtresi yalnız Ada öğrencisini getirmeli.');

$group502=tol_teacher_students($pdo,3001,10,0,502);
ok_143(count($group502)===1 && (int)$group502[0]['id']===102,'Destek grubu yalnız Bora öğrencisini getirmeli.');

$foreignGroup=tol_teacher_students($pdo,3001,10,0,601);
ok_143($foreignGroup===[],'başka kurum grup kimliği Okul A öğrencilerine filtre olarak uygulanamamalı.');

$map=tol_student_group_map($pdo,10,[101,102]);
ok_143(isset($map[101],$map[102]),'Ada ve Bora grup etiketleri bulunmalı.');
ok_143((int)$map[101][0]['id']===501,'Ada 4-A grubunda görünmeli.');
ok_143((int)$map[102][0]['id']===502,'Bora Destek grubunda görünmeli.');
ok_143(!isset($map[103]),'istenmeyen öğrenci grup haritasına eklenmemeli.');

$context=tol_teacher_report_context($pdo,3001,101,10);
ok_143(is_array($context),'Ada için Okul A öğretmen rapor bağlamı doğrulanmalı.');
ok_143((string)$context['institution_name']==='Okul A','rapor kurum adı doğru olmalı.');
ok_143((string)$context['back']==='ogretmen-ogrencilerim.php?kurum_id=10','rapor geri bağlantısı doğru olmalı.');

$wrongContext=tol_teacher_report_context($pdo,3001,101,20);
ok_143($wrongContext===null,'öğretmen Ada ile Okul B ilişkisi yoksa rapor bağlamı doğrulanmamalı.');

$pdo->exec("UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=10 AND kullanici_id=3001 AND kurum_rolu='ogretmen'");
ok_143(tol_teacher_students($pdo,3001,10,0,0)===[],'öğretmen kurum üyeliği pasif olunca öğrenci listesi kapanmalı.');
ok_143(tol_teacher_report_context($pdo,3001,101,10)===null,'öğretmen kurum üyeliği pasif olunca rapor bağlamı kapanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher class/group filter and report context DB integration\n";
