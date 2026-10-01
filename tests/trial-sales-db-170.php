<?php
declare(strict_types=1);

function fail_170(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_170(bool $condition,string $message): void { if(!$condition) fail_170($message); }

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
}catch(Throwable $e){ fail_170('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_runtime_column_exists(PDO $pdo,string $table,string $column): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name=?');
    $stmt->execute([$table,$column]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurumlar_modulu.php';
require __DIR__.'/../src/deneme_satis.php';

$tables=[
    'kurum_satis_notlari','kurum_deneme_satislari','kurum_lisanslari',
    'paketler','kurumlar','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    email VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

$pdo->exec("CREATE TABLE kurumlar(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    tur VARCHAR(30) NOT NULL DEFAULT 'okul',
    icerik_kaynagi VARCHAR(30) NOT NULL DEFAULT 'kurum',
    email VARCHAR(190) NULL,
    telefon VARCHAR(30) NULL,
    adres VARCHAR(3000) NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_kod(kod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

$pdo->exec("CREATE TABLE paketler(
    id BIGINT UNSIGNED NOT NULL,
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
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_lisans(kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_deneme_satislari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    deneme_paket_id BIGINT UNSIGNED NOT NULL,
    deneme_baslangic_tarihi DATE NOT NULL,
    deneme_bitis_tarihi DATE NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'deneme',
    kaynak VARCHAR(80) NULL,
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    donusum_paket_id BIGINT UNSIGNED NULL,
    donusum_tarihi DATETIME NULL,
    kayip_nedeni VARCHAR(500) NULL,
    son_temas_tarihi DATE NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NOT NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_deneme_satis_kurum(kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_satis_notlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    satis_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    tur VARCHAR(20) NOT NULL DEFAULT 'not',
    not_metni VARCHAR(2000) NOT NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,email,ana_rol,aktif)
    VALUES (1,'Süper Admin','admin@example.com','super_admin',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,ogrenci_limiti,ogretmen_limiti,veli_limiti,ai_aylik_kota,aylik_fiyat,para_birimi,aktif) VALUES
    (10,'demo','Demo Paket',25,5,25,100,'0.00','TRY',1),
    (20,'pro','Pro Paket',500,50,500,5000,'1999.00','TRY',1),
    (30,'pasif','Pasif Paket',100,10,100,100,'999.00','TRY',0)");

$actor=['id'=>1,'role'=>'super_admin'];

function trial_input_170(string $name,string $code,int $days=5,string $note='İlk görüşme olumlu.'): array {
    return [
        'ad'=>$name,'kod'=>$code,'tur'=>'okul','icerik_kaynagi'=>'kurum',
        'email'=>strtolower(str_replace(' ','',$code)).'@example.com',
        'telefon'=>'05550000000','adres'=>'Konya',
        'paket_id'=>10,'deneme_gun'=>$days,'kaynak'=>'web','satis_notu'=>$note,
    ];
}

$sales1=st_create_trial($pdo,$actor,trial_input_170('A Demo Okulu','a-demo',5));
ok_170($sales1>0,'trial sales row should be created.');

$row1=st_sales_row($pdo,$sales1);
ok_170(is_array($row1),'created trial should be readable.');
$institution1=(int)$row1['kurum_id'];
ok_170((string)$row1['durum']==='deneme','new sales lifecycle should start in trial state.');
ok_170((string)$row1['lisans_durum']==='deneme','new institution license should start as trial.');
ok_170((int)((new DateTimeImmutable((string)$row1['deneme_baslangic_tarihi']))
    ->diff(new DateTimeImmutable((string)$row1['deneme_bitis_tarihi']))->days)===4,
    '5-day trial should have inclusive start/end span of 4 date differences.');

$noteCount=(int)$pdo->query("SELECT COUNT(*) FROM kurum_satis_notlari WHERE satis_id={$sales1}")->fetchColumn();
ok_170($noteCount===2,'trial create should append system lifecycle note plus optional sales note.');

$warnings=st_trial_warning_rows($pdo,7);
ok_170(count($warnings)===1 && (int)$warnings[0]['id']===$sales1,'5-day trial should appear in 7-day warning radar.');

$summary=st_summary($pdo);
ok_170((int)$summary['toplam']===1 && (int)$summary['deneme']===1,'summary should count one active trial.');
ok_170((float)$summary['genel_donusum_orani']===0.0,'fresh trial should not count as converted.');

$beforeInstitutions=(int)$pdo->query("SELECT COUNT(*) FROM kurumlar")->fetchColumn();
$beforeLicenses=(int)$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari")->fetchColumn();
$beforeSales=(int)$pdo->query("SELECT COUNT(*) FROM kurum_deneme_satislari")->fetchColumn();
$duplicateBlocked=false;
try{st_create_trial($pdo,$actor,trial_input_170('Başka Demo','a-demo',5));}catch(RuntimeException){$duplicateBlocked=true;}
ok_170($duplicateBlocked,'duplicate institution code must fail trial creation.');
ok_170((int)$pdo->query("SELECT COUNT(*) FROM kurumlar")->fetchColumn()===$beforeInstitutions,
    'failed atomic trial creation must not leave orphan institution.');
ok_170((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari")->fetchColumn()===$beforeLicenses,
    'failed atomic trial creation must not leave orphan license.');
ok_170((int)$pdo->query("SELECT COUNT(*) FROM kurum_deneme_satislari")->fetchColumn()===$beforeSales,
    'failed atomic trial creation must not leave orphan sales row.');

st_add_note($pdo,$actor,$sales1,'Karar vericiyle ikinci görüşme yapıldı.');
$noteCount2=(int)$pdo->query("SELECT COUNT(*) FROM kurum_satis_notlari WHERE satis_id={$sales1}")->fetchColumn();
ok_170($noteCount2===3,'sales note must append without replacing history.');

$pdo->prepare("UPDATE kurum_deneme_satislari SET deneme_bitis_tarihi=DATE_SUB(CURDATE(),INTERVAL 1 DAY) WHERE id=?")
    ->execute([$sales1]);
$pdo->prepare("UPDATE kurum_lisanslari SET bitis_tarihi=DATE_SUB(CURDATE(),INTERVAL 1 DAY) WHERE kurum_id=?")
    ->execute([$institution1]);
$expired=st_sales_row($pdo,$sales1);
ok_170((string)$expired['etkin_durum']==='suresi_doldu','expired open trial must be represented as effective expired state.');

$invalidConversionBlocked=false;
try{st_convert($pdo,$actor,$sales1,30,null,'Pasif pakete dönüşmemeli.');}catch(RuntimeException){$invalidConversionBlocked=true;}
ok_170($invalidConversionBlocked,'inactive paid package must not convert trial.');
$afterInvalid=st_sales_row($pdo,$sales1);
ok_170((string)$afterInvalid['durum']==='deneme' && (string)$afterInvalid['lisans_durum']==='deneme',
    'failed conversion must leave sales and license lifecycle unchanged.');

$paidEnd=(new DateTimeImmutable('+1 year'))->format('Y-m-d');
st_convert($pdo,$actor,$sales1,20,$paidEnd,'Yıllık Pro paket kabul edildi.');
$converted=st_sales_row($pdo,$sales1);
ok_170((string)$converted['durum']==='donustu','expired trial should still convert to paid.');
ok_170((int)$converted['donusum_paket_id']===20,'conversion package should be stored in sales lifecycle.');
ok_170((string)$converted['lisans_durum']==='aktif' && (int)$converted['lisans_paket_id']===20,
    'existing trial license must become active paid license.');
ok_170((string)$converted['lisans_bitis']===$paidEnd,'paid license end date should be applied.');

$doubleConvert=false;
try{st_convert($pdo,$actor,$sales1,20,null,'İkinci kez dönüşmemeli.');}catch(RuntimeException){$doubleConvert=true;}
ok_170($doubleConvert,'converted opportunity must not convert twice.');

$sales2=st_create_trial($pdo,$actor,trial_input_170('B Demo Okulu','b-demo',14,'Fiyat hassasiyeti var.'));
$row2=st_sales_row($pdo,$sales2);
$institution2=(int)$row2['kurum_id'];
st_mark_lost($pdo,$actor,$sales2,'Bütçe onayı çıkmadı');
$lost=st_sales_row($pdo,$sales2);
ok_170((string)$lost['durum']==='kaybedildi','trial opportunity should move to lost.');
ok_170((string)$lost['kayip_nedeni']==='Bütçe onayı çıkmadı','lost reason must be retained.');
ok_170((string)$lost['lisans_durum']==='iptal','lost opportunity must cancel trial license.');

$doubleLost=false;
try{st_mark_lost($pdo,$actor,$sales2,'Tekrar kapatma');}catch(RuntimeException){$doubleLost=true;}
ok_170($doubleLost,'lost opportunity must not close twice.');

$summary2=st_summary($pdo);
ok_170((int)$summary2['toplam']===2,'summary should include both started trials.');
ok_170((int)$summary2['donustu']===1 && (int)$summary2['kaybedildi']===1,'summary should split converted and lost opportunities.');
ok_170((float)$summary2['genel_donusum_orani']===50.0,'overall conversion should be converted / all started trials.');
ok_170((float)$summary2['karar_verilen_donusum_orani']===50.0,'decided conversion should be converted / converted+lost.');

$sales3=st_create_trial($pdo,$actor,trial_input_170('C Demo Okulu','c-demo',3,'Takip bekleniyor.'));
$row3=st_sales_row($pdo,$sales3);
$institution3=(int)$row3['kurum_id'];

$pdo->prepare("UPDATE kurum_lisanslari SET durum='aktif' WHERE kurum_id=?")->execute([$institution3]);
$reconcileConvert=false;
try{st_convert($pdo,$actor,$sales3,20,null,'Manuel lisans bozuldu.');}catch(RuntimeException){$reconcileConvert=true;}
ok_170($reconcileConvert,'sales conversion must stop when trial sales state and license state diverge.');
$reconcileLost=false;
try{st_mark_lost($pdo,$actor,$sales3,'Manuel lisans bozuk');}catch(RuntimeException){$reconcileLost=true;}
ok_170($reconcileLost,'lost flow must stop when trial sales state and license state diverge.');

$notesBefore=(int)$pdo->query("SELECT COUNT(*) FROM kurum_satis_notlari")->fetchColumn();
st_add_note($pdo,$actor,$sales1,'Dönüşüm sonrası onboarding takip notu.');
$notesAfter=(int)$pdo->query("SELECT COUNT(*) FROM kurum_satis_notlari")->fetchColumn();
ok_170($notesAfter===$notesBefore+1,'converted opportunity must still accept append-only follow-up sales notes.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: atomic trial creation, expiry radar, paid conversion, lost flow, lifecycle reconciliation and conversion metrics\n";
