<?php
declare(strict_types=1);

function fail_172(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_172(bool $condition,string $message): void { if(!$condition) fail_172($message); }

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
}catch(Throwable $e){ fail_172('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function db(): PDO { global $pdo; return $pdo; }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/auth.php';
require __DIR__.'/../src/kurum_yonetimi.php';

$tables=['kurum_lisanslari','paketler','kurum_kullanicilari','kullanici_rolleri','kullanicilar','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanici_rolleri(
    kullanici_id BIGINT UNSIGNED NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY(kullanici_id,rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurumlar(
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    tur VARCHAR(30) NOT NULL DEFAULT 'okul',
    icerik_kaynagi VARCHAR(30) NOT NULL DEFAULT 'kurum',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari(
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE paketler(
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(120) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisanslari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    paket_id BIGINT UNSIGNED NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NULL,
    durum VARCHAR(20) NOT NULL,
    notlar VARCHAR(2000) NULL,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_lisans(kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES
    (1,'aktif','Aktif Paket',1),
    (2,'pasif','Pasif Paket',0)");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'legacy','Legacy Kurum',1),
    (20,'aktif','Aktif Kurum',1),
    (30,'aski','Askı Kurum',1),
    (40,'expired','Süresi Dolmuş Kurum',1),
    (50,'future','Başlamamış Kurum',1),
    (60,'passive-package','Pasif Paket Kurumu',1),
    (70,'cancelled','İptal Kurum',1),
    (80,'inactive','Pasif Kurum',0)");

$today=date('Y-m-d');
$past=(new DateTimeImmutable('-1 day'))->format('Y-m-d');
$future=(new DateTimeImmutable('+2 day'))->format('Y-m-d');
$futureEnd=(new DateTimeImmutable('+1 year'))->format('Y-m-d');

$insert=$pdo->prepare("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum)
    VALUES (?,?,?,?,?)");
$insert->execute([20,1,$today,$futureEnd,'aktif']);
$insert->execute([30,1,$today,$futureEnd,'askida']);
$insert->execute([40,1,'2026-01-01',$past,'aktif']);
$insert->execute([50,1,$future,$futureEnd,'aktif']);
$insert->execute([60,2,$today,$futureEnd,'aktif']);
$insert->execute([70,1,$today,$futureEnd,'iptal']);
$insert->execute([80,1,$today,$futureEnd,'aktif']);

$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif) VALUES
    (101,'student-suspended@example.com','Askı Öğrenci','ogrenci',1),
    (102,'teacher-multi@example.com','Çoklu Öğretmen','ogretmen',1),
    (103,'parent-legacy@example.com','Legacy Veli','veli',1),
    (104,'manager@example.com','Kurum Yöneticisi','yonetici',1),
    (105,'student-expired@example.com','Expired Öğrenci','ogrenci',1),
    (106,'student-future@example.com','Future Öğrenci','ogrenci',1),
    (107,'student-passive-package@example.com','Pasif Paket Öğrenci','ogrenci',1),
    (108,'student-cancelled@example.com','İptal Öğrenci','ogrenci',1),
    (109,'student-inactive-inst@example.com','Pasif Kurum Öğrenci','ogrenci',1)");

$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES
    (101,'ogrenci'),(102,'ogretmen'),(103,'veli'),(104,'yonetici'),
    (105,'ogrenci'),(106,'ogrenci'),(107,'ogrenci'),(108,'ogrenci'),(109,'ogrenci')");

$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (30,101,'ogrenci',1),
    (20,102,'ogretmen',1),(30,102,'ogretmen',1),
    (10,103,'veli',1),
    (30,104,'yonetici',1),
    (40,105,'ogrenci',1),
    (50,106,'ogrenci',1),
    (60,107,'ogrenci',1),
    (70,108,'ogrenci',1),
    (80,109,'ogrenci',1)");

$studentSusp=['id'=>101,'ana_rol'=>'ogrenci','roles'=>['ogrenci']];
$teacherMulti=['id'=>102,'ana_rol'=>'ogretmen','roles'=>['ogretmen']];
$parentLegacy=['id'=>103,'ana_rol'=>'veli','roles'=>['veli']];
$manager=['id'=>104,'ana_rol'=>'yonetici','roles'=>['yonetici']];
$super=['id'=>999,'ana_rol'=>'super_admin','roles'=>['super_admin']];

$legacy=auth_institution_license_access($pdo,10);
ok_172(($legacy['allowed']??false)===true && (string)$legacy['reason']==='legacy_unlicensed',
    'institution with no license must remain legacy-compatible.');

$active=auth_institution_license_access($pdo,20);
ok_172(($active['allowed']??false)===true && (string)$active['reason']==='licensed',
    'active current license must allow operations.');

$suspended=auth_institution_license_access($pdo,30);
ok_172(($suspended['allowed']??true)===false && (string)$suspended['reason']==='license_suspended',
    'suspended license must close operations.');

$expired=auth_institution_license_access($pdo,40);
ok_172(($expired['allowed']??true)===false && (string)$expired['reason']==='license_expired',
    'expired license must close operations.');

$notStarted=auth_institution_license_access($pdo,50);
ok_172(($notStarted['allowed']??true)===false && (string)$notStarted['reason']==='license_not_started',
    'future-start license must close operations.');

$inactivePackage=auth_institution_license_access($pdo,60);
ok_172(($inactivePackage['allowed']??true)===false && (string)$inactivePackage['reason']==='package_inactive',
    'inactive package must close operations.');

$cancelled=auth_institution_license_access($pdo,70);
ok_172(($cancelled['allowed']??true)===false && (string)$cancelled['reason']==='license_cancelled',
    'cancelled license must close operations.');

$inactiveInstitution=auth_institution_license_access($pdo,80);
ok_172(($inactiveInstitution['allowed']??true)===false && (string)$inactiveInstitution['reason']==='institution_inactive',
    'inactive institution must close operations.');

$studentSummary=auth_operational_access_summary($pdo,$studentSusp);
ok_172(($studentSummary['restricted']??false)===true,'user whose only institution is suspended must be restricted.');
ok_172(auth_user_institution_ids_raw($pdo,101,'ogrenci')===[30],'raw membership must remain available for support.');
ok_172(auth_user_institution_ids($pdo,101,'ogrenci')===[],'operational membership must exclude suspended institution.');
ok_172(auth_user_in_institution_raw($pdo,101,30,'ogrenci')===true,'raw institution membership should remain true.');
ok_172(auth_user_in_institution($pdo,101,30,'ogrenci')===false,'operational institution membership should be false when suspended.');

$teacherSummary=auth_operational_access_summary($pdo,$teacherMulti);
ok_172(($teacherSummary['restricted']??true)===false,'teacher with one active institution must keep account access.');
ok_172($teacherSummary['allowed_ids']===[20],'teacher operational scope must include only active institution.');
ok_172(auth_user_institution_ids_raw($pdo,102,'ogretmen')===[20,30],'teacher raw scope must retain both memberships.');
ok_172(auth_user_institution_ids($pdo,102,'ogretmen')===[20],'teacher operational scope must remove suspended institution.');

$parentSummary=auth_operational_access_summary($pdo,$parentLegacy);
ok_172(($parentSummary['restricted']??true)===false && $parentSummary['allowed_ids']===[10],
    'single legacy no-license institution must remain operationally allowed.');

$managerRaw=auth_manageable_institution_ids($pdo,$manager);
ok_172($managerRaw===[30],'manager panel must retain suspended institution visibility.');
$managerOperational=auth_operational_manageable_institution_ids($pdo,$manager);
ok_172($managerOperational===[],'manager operational scope must exclude suspended institution.');

$managerDenied=false;
try{ky_assert_manageable($pdo,$manager,30);}catch(RuntimeException $e){
    $managerDenied=str_contains($e->getMessage(),'lisansı operasyonel kullanıma açık değil');
}
ok_172($managerDenied,'manager direct institution operations must be denied while license is suspended.');

$superAllowed=ky_assert_manageable($pdo,$super,30);
ok_172((int)$superAllowed['id']===30,'Super Admin must remain able to manage suspended institution.');

foreach([[105,'license_expired'],[106,'license_not_started'],[107,'package_inactive'],[108,'license_cancelled'],[109,'institution_inactive']] as [$uid,$reason]){
    $u=auth_fetch_user($pdo,(int)$uid);
    ok_172(is_array($u),'test user should resolve.');
    $summary=auth_operational_access_summary($pdo,$u);
    ok_172(($summary['restricted']??false)===true,'restricted state expected for user '.$uid);
    $actual=(string)($summary['institutions'][0]['reason']??'');
    ok_172($actual===$reason,'expected '.$reason.' for user '.$uid.', got '.$actual);
}

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution license access states, raw/support scope, multi-institution filtering and manager operational restriction\n";
