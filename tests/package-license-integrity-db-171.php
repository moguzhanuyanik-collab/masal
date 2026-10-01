<?php
declare(strict_types=1);

function fail_171(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_171(bool $condition,string $message): void { if(!$condition) fail_171($message); }

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
}catch(Throwable $e){ fail_171('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_lisanslari.php';

$tables=[
    'adimbot_ai_kullanimlari','kurum_lisans_gecmisi','kurum_lisanslari',
    'paketler','kurum_kullanicilari','kurumlar','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurumlar(
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
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
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(120) NOT NULL,
    aciklama VARCHAR(1000) NULL,
    ogrenci_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    ogretmen_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    veli_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    ai_aylik_kota INT UNSIGNED NOT NULL DEFAULT 0,
    aylik_fiyat DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    para_birimi CHAR(3) NOT NULL DEFAULT 'TRY',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_paket_kod(kod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisanslari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    paket_id BIGINT UNSIGNED NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    notlar VARCHAR(2000) NULL,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_lisans(kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisans_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    islem VARCHAR(40) NOT NULL,
    eski_paket_id BIGINT UNSIGNED NULL,
    yeni_paket_id BIGINT UNSIGNED NULL,
    eski_durum VARCHAR(20) NULL,
    yeni_durum VARCHAR(20) NULL,
    eski_baslangic_tarihi DATE NULL,
    yeni_baslangic_tarihi DATE NULL,
    eski_bitis_tarihi DATE NULL,
    yeni_bitis_tarihi DATE NULL,
    eski_not_hash CHAR(64) NULL,
    yeni_not_hash CHAR(64) NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    aciklama VARCHAR(500) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE adimbot_ai_kullanimlari(
    kurum_id BIGINT UNSIGNED NOT NULL,
    donem_baslangici DATE NOT NULL,
    kullanim_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
    son_ogrenci_id BIGINT UNSIGNED NULL,
    son_saglayici VARCHAR(20) NULL,
    son_model VARCHAR(120) NULL,
    son_kullanim DATETIME NULL,
    PRIMARY KEY(kurum_id,donem_baslangici)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES (999,'Süper Admin')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Okulu',1),(20,'b','B Okulu',1),(30,'c','C Okulu',1),(40,'d','D Okulu',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,1001,'ogrenci',1),
    (20,2001,'ogrenci',1),
    (10,3001,'ogrenci',1),(30,3001,'ogrenci',1),
    (20,4001,'ogrenci',1),(40,4001,'ogrenci',1)");

$actor=['id'=>999];

function package_input_171(int $id=0,string $code='pro',string $name='Pro',int $quota=2): array {
    return [
        'paket_id'=>$id,'ad'=>$name,'kod'=>$code,'aciklama'=>'Test paketi',
        'ogrenci_limiti'=>50,'ogretmen_limiti'=>10,'veli_limiti'=>50,
        'ai_aylik_kota'=>$quota,'aylik_fiyat'=>'1000','para_birimi'=>'TRY'
    ];
}
function license_input_171(int $institutionId,int $packageId,string $status='aktif',?string $start=null,?string $end=null,string $note='İlk lisans'): array {
    return [
        'kurum_id'=>$institutionId,'paket_id'=>$packageId,'durum'=>$status,
        'baslangic_tarihi'=>$start??date('Y-m-d'),
        'bitis_tarihi'=>$end??(new DateTimeImmutable('+1 year'))->format('Y-m-d'),
        'notlar'=>$note
    ];
}

$package1=kl_save_package($pdo,$actor,package_input_171());
ok_171($package1>0,'package should be created.');

$missingUpdate=false;
try{kl_save_package($pdo,$actor,package_input_171(9999,'missing','Missing'));}catch(RuntimeException){$missingUpdate=true;}
ok_171($missingUpdate,'nonexistent package update must fail.');
ok_171((int)$pdo->query("SELECT COUNT(*) FROM paketler")->fetchColumn()===1,'failed package update must not create a package.');

$missingToggle=false;
try{kl_set_package_active($pdo,$actor,9999,false);}catch(RuntimeException){$missingToggle=true;}
ok_171($missingToggle,'nonexistent package toggle must fail.');

kl_set_package_active($pdo,$actor,$package1,true);
ok_171((int)$pdo->query("SELECT aktif FROM paketler WHERE id={$package1}")->fetchColumn()===1,
    'same-state package activation should be a valid no-op.');

$license1=kl_save_license($pdo,$actor,license_input_171(10,$package1,'aktif',date('Y-m-d'),(new DateTimeImmutable('+1 year'))->format('Y-m-d'),'Gizli ticari not A'));
ok_171($license1>0,'institution license should be created.');
$history1=kl_license_history_rows($pdo,10);
ok_171(count($history1)===1 && (string)$history1[0]['islem']==='olustur','license create must append history.');
ok_171((string)$history1[0]['yeni_not_hash']===hash('sha256','Gizli ticari not A'),'history must hash license note.');
ok_171(!array_key_exists('yeni_notlar',$history1[0]),'history query/schema must not expose duplicated plaintext note.');

kl_save_license($pdo,$actor,license_input_171(10,$package1,'aktif',date('Y-m-d'),(new DateTimeImmutable('+1 year'))->format('Y-m-d'),'Gizli ticari not A'));
ok_171(count(kl_license_history_rows($pdo,10))===1,'identical license save should not append meaningless history.');

kl_save_license($pdo,$actor,license_input_171(10,$package1,'askida',date('Y-m-d'),(new DateTimeImmutable('+1 year'))->format('Y-m-d'),'Askı nedeni'));
$history2=kl_license_history_rows($pdo,10);
ok_171(count($history2)===2,'license status change must append history.');
ok_171((string)$history2[0]['eski_durum']==='aktif' && (string)$history2[0]['yeni_durum']==='askida',
    'history must preserve old/new license status.');

$suspended=kl_ai_quota_reserve($pdo,1001,501,'groq','model');
ok_171(($suspended['blocked']??false)===true && (string)$suspended['reason']==='license_suspended',
    'suspended license must block AI access.');

$past=(new DateTimeImmutable('-1 day'))->format('Y-m-d');
kl_save_license($pdo,$actor,license_input_171(10,$package1,'aktif','2026-01-01',$past,'Süresi doldu'));
$expired=kl_ai_quota_reserve($pdo,1001,501,'groq','model');
ok_171(($expired['blocked']??false)===true && (string)$expired['reason']==='license_expired',
    'expired license must block AI access.');

$future=(new DateTimeImmutable('+2 day'))->format('Y-m-d');
$futureEnd=(new DateTimeImmutable('+1 year'))->format('Y-m-d');
kl_save_license($pdo,$actor,license_input_171(10,$package1,'aktif',$future,$futureEnd,'Henüz başlamadı'));
$notStarted=kl_ai_quota_reserve($pdo,1001,501,'groq','model');
ok_171(($notStarted['blocked']??false)===true && (string)$notStarted['reason']==='license_not_started',
    'future-start license must block AI access.');

kl_save_license($pdo,$actor,license_input_171(10,$package1,'aktif',date('Y-m-d'),$futureEnd,'Aktif lisans'));
$first=kl_ai_quota_reserve($pdo,1001,501,'groq','model');
ok_171(($first['blocked']??true)===false && (int)$first['used']===1,'valid active license should allow quota reservation.');

$deactivateInUse=false;
try{kl_set_package_active($pdo,$actor,$package1,false);}catch(RuntimeException){$deactivateInUse=true;}
ok_171($deactivateInUse,'package used by current active license must not be deactivated.');

$pdo->exec("UPDATE paketler SET aktif=0 WHERE id={$package1}");
$inactivePackage=kl_ai_quota_reserve($pdo,1001,501,'groq','model');
ok_171(($inactivePackage['blocked']??false)===true && (string)$inactivePackage['reason']==='package_inactive',
    'legacy inactive package with live license must block AI access.');
$issues=kl_license_integrity_issues($pdo);
$codes=array_column($issues,'kod');
ok_171(in_array('inactive_package_live_license',$codes,true),'integrity scanner must flag inactive package on live license.');
$pdo->exec("UPDATE paketler SET aktif=1 WHERE id={$package1}");

$legacy=kl_ai_quota_reserve($pdo,2001,601,'openai','model');
ok_171(($legacy['blocked']??true)===false && ($legacy['enforced']??true)===false,
    'single institution with no license must preserve legacy unmetered compatibility.');
ok_171((int)$legacy['used']===1,'legacy unlicensed single institution should still be tracked.');

$package2=kl_save_package($pdo,$actor,package_input_171(0,'plus','Plus',5));
kl_save_license($pdo,$actor,license_input_171(30,$package2,'aktif',date('Y-m-d'),$futureEnd,'İkinci aktif kurum'));
$ambiguous=kl_ai_quota_reserve($pdo,3001,701,'gemini','model');
ok_171(($ambiguous['blocked']??false)===true && (string)$ambiguous['reason']==='ambiguous_active_licenses',
    'student with two eligible active licenses must be blocked instead of quota bypass.');
ok_171((int)$pdo->query("SELECT COUNT(*) FROM adimbot_ai_kullanimlari WHERE kurum_id=30")->fetchColumn()===0,
    'ambiguous AI request must not write usage to arbitrary second institution.');

$allLegacy=kl_ai_quota_reserve($pdo,4001,801,'openai','model');
ok_171(($allLegacy['blocked']??false)===true && (string)$allLegacy['reason']==='ambiguous_institutions',
    'multi-institution student with no licenses must not bypass tenant resolution.');

$pdo->exec("UPDATE kurumlar SET aktif=0 WHERE id=10");
$issues2=kl_license_integrity_issues($pdo);
$codes2=array_column($issues2,'kod');
ok_171(in_array('inactive_institution_live_license',$codes2,true),
    'integrity scanner must flag live license on inactive institution.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: package target validation, license history, AI entitlement and integrity scanner\n";
