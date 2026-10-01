<?php
declare(strict_types=1);

function fail_173(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_173(bool $condition,string $message): void { if(!$condition) fail_173($message); }

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
}catch(Throwable $e){ fail_173('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_lisanslari.php';
require __DIR__.'/../src/bildirimler.php';
require __DIR__.'/../src/lisans_yenileme.php';

$tables=[
    'kurum_duyuru_alicilari','kurum_duyurulari',
    'kurum_lisans_yenileme_gecmisi','kurum_lisans_yenilemeleri',
    'kurum_lisans_gecmisi','kurum_lisanslari','paketler',
    'kurum_kullanicilari','kullanicilar','kurumlar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
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
    PRIMARY KEY(id)
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

$pdo->exec("CREATE TABLE kurum_lisans_yenilemeleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    hedef_bitis_tarihi DATE NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'acik',
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    son_temas_tarihi DATE NULL,
    sonraki_takip_tarihi DATE NULL,
    sonuc_paket_id BIGINT UNSIGNED NULL,
    sonuc_bitis_tarihi DATE NULL,
    kapanma_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_lisans_yenileme_donem(lisans_id,hedef_bitis_tarihi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisans_yenileme_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    yenileme_id BIGINT UNSIGNED NOT NULL,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    not_metni VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyurulari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NOT NULL,
    tur VARCHAR(20) NOT NULL DEFAULT 'duyuru',
    kaynak_turu VARCHAR(40) NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    baslik VARCHAR(190) NOT NULL,
    mesaj VARCHAR(4000) NOT NULL,
    onem VARCHAR(20) NOT NULL DEFAULT 'normal',
    hedef_roller VARCHAR(120) NOT NULL,
    baglanti VARCHAR(255) NULL,
    son_gosterim_tarihi DATE NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_duyuru_kaynak(kurum_id,kaynak_turu,kaynak_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    okundu_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Süper Admin',1),
    (101,'A Yönetici',1),(102,'B Yönetici',1),(103,'C Yönetici',1),
    (104,'D Yönetici',1),(105,'E Yönetici',1)");

$pdo->exec("INSERT INTO paketler(id,kod,ad,aylik_fiyat,para_birimi,aktif) VALUES
    (1,'pro','Pro Paket',1000,'TRY',1),
    (2,'plus','Plus Paket',2000,'TRY',1)");

for($i=1;$i<=7;$i++){
    $id=$i*10;
    $pdo->prepare("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (?,?,?,1)")
        ->execute([$id,'k'.$id,'Kurum '.$id]);
}
for($i=1;$i<=5;$i++){
    $pdo->prepare("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif)
        VALUES (?,?, 'yonetici',1)")->execute([$i*10,100+$i]);
}

$today=new DateTimeImmutable('today');
$ends=[
    10=>$today->modify('+30 days')->format('Y-m-d'),
    20=>$today->modify('+14 days')->format('Y-m-d'),
    30=>$today->modify('+6 days')->format('Y-m-d'),
    40=>$today->modify('+1 day')->format('Y-m-d'),
    50=>$today->modify('-2 days')->format('Y-m-d'),
    60=>$today->modify('+60 days')->format('Y-m-d'),
];
$licenseIds=[];
foreach($ends as $institutionId=>$end){
    $stmt=$pdo->prepare("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum,notlar)
        VALUES (?,1,CURDATE(),?,'aktif','Test')");
    $stmt->execute([$institutionId,$end]);
    $licenseIds[$institutionId]=(int)$pdo->lastInsertId();
}
$stmt=$pdo->prepare("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum,notlar)
    VALUES (70,1,CURDATE(),NULL,'aktif','Süresiz')");
$stmt->execute();
$licenseIds[70]=(int)$pdo->lastInsertId();

$actor=['id'=>1,'role'=>'super_admin'];

$sync1=ly_sync_cases($pdo,$actor,30);
ok_173((int)$sync1['created']===5,'30-day sync should create five due/expired renewal cases.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisans_yenilemeleri")->fetchColumn()===5,
    'only <=30 day finite licenses should enter renewal queue.');

$sync2=ly_sync_cases($pdo,$actor,30);
ok_173((int)$sync2['created']===0,'renewal queue sync must be idempotent.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisans_yenilemeleri")->fetchColumn()===5,
    'idempotent sync must not duplicate renewal cases.');

$summary=ly_summary($pdo);
ok_173((int)$summary['acik']===5,'five renewal cases should be open.');
ok_173((int)$summary['expired']===1,'one renewal case should be expired.');
ok_173((int)$summary['gun_1']===1,'one renewal case should be in 0-1 day bucket.');
ok_173((int)$summary['gun_7']===1,'one renewal case should be in 2-7 day bucket.');
ok_173((int)$summary['gun_15']===1,'one renewal case should be in 8-15 day bucket.');
ok_173((int)$summary['gun_30']===1,'one renewal case should be in 16-30 day bucket.');

ok_173(ly_notification_milestone(31)===null,'31 days should have no manager milestone.');
ok_173(ly_notification_milestone(30)===30,'30-day milestone mismatch.');
ok_173(ly_notification_milestone(15)===15,'15-day milestone mismatch.');
ok_173(ly_notification_milestone(7)===7,'7-day milestone mismatch.');
ok_173(ly_notification_milestone(1)===1,'1-day milestone mismatch.');
ok_173(ly_notification_milestone(0)===0 && ly_notification_milestone(-4)===0,'expired milestone mismatch.');

$notify1=ly_sync_manager_notifications($pdo,$actor);
ok_173((int)$notify1['sent']===5,'first manager notification sync should send all five milestone alerts.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari")->fetchColumn()===5,
    'five manager system announcements expected.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE kurum_rolu='yonetici'")->fetchColumn()===5,
    'manager system notification recipients must use yonetici role.');

$notify2=ly_sync_manager_notifications($pdo,$actor);
ok_173((int)$notify2['sent']===0,'same milestone notification sync must be deduplicated.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari")->fetchColumn()===5,
    'dedupe must prevent duplicate manager announcements.');

$case20=(int)$pdo->query("SELECT id FROM kurum_lisans_yenilemeleri WHERE kurum_id=20")->fetchColumn();
$follow=$today->modify('+2 days')->format('Y-m-d');
ly_add_note($pdo,$actor,$case20,'Kurum yöneticisiyle görüşüldü.',$follow);
$row20=ly_case_row($pdo,$case20);
ok_173((string)$row20['durum']==='temas','adding first follow-up note should move open case to temas.');
ok_173((string)$row20['sonraki_takip_tarihi']===$follow,'next follow-up date should be stored.');

ly_set_stage($pdo,$actor,$case20,'teklif');
$row20=ly_case_row($pdo,$case20);
ok_173((string)$row20['durum']==='teklif','renewal stage should move to teklif.');

$renewEnd=$today->modify('+365 days')->format('Y-m-d');
$license20Before=(int)$row20['lisans_id'];
ly_renew($pdo,$actor,$case20,2,$renewEnd,'Plus paket yıllık yenileme.');
$row20=ly_case_row($pdo,$case20);
ok_173((string)$row20['durum']==='yenilendi','renewed case must close as yenilendi.');
ok_173((string)$row20['guncel_bitis_tarihi']===$renewEnd,'renewal must extend the actual institution license.');
ok_173((int)$row20['paket_id']===2,'renewal must switch package when selected.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari WHERE kurum_id=20")->fetchColumn()===1,
    'renewal must update existing license instead of creating a second license.');
ok_173((int)$pdo->query("SELECT id FROM kurum_lisanslari WHERE kurum_id=20")->fetchColumn()===$license20Before,
    'renewal must preserve the institution license id.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisans_gecmisi WHERE lisans_id={$license20Before} AND islem='yenileme'")->fetchColumn()===1,
    'real renewal must append core license history.');

$case30=(int)$pdo->query("SELECT id FROM kurum_lisans_yenilemeleri WHERE kurum_id=30")->fetchColumn();
$license30End=(string)$pdo->query("SELECT bitis_tarihi FROM kurum_lisanslari WHERE kurum_id=30")->fetchColumn();
ly_mark_not_renewed($pdo,$actor,$case30,'Kurum bu dönem hizmete devam etmeyecek.');
$row30=ly_case_row($pdo,$case30);
ok_173((string)$row30['durum']==='yenilenmedi','not-renewed case must close with explicit state.');
ok_173((string)$pdo->query("SELECT bitis_tarihi FROM kurum_lisanslari WHERE kurum_id=30")->fetchColumn()===$license30End,
    'not-renewed close must not shorten current license.');
ok_173((string)$pdo->query("SELECT durum FROM kurum_lisanslari WHERE kurum_id=30")->fetchColumn()==='aktif',
    'not-renewed close must not prematurely cancel current license.');

$case40=(int)$pdo->query("SELECT id FROM kurum_lisans_yenilemeleri WHERE kurum_id=40")->fetchColumn();
$externalEnd=$today->modify('+200 days')->format('Y-m-d');
$pdo->prepare("UPDATE kurum_lisanslari SET bitis_tarihi=? WHERE kurum_id=40")->execute([$externalEnd]);
$sync3=ly_sync_cases($pdo,$actor,30);
ok_173((int)$sync3['reconciled']>=1,'external license extension should reconcile an open renewal case.');
$row40=ly_case_row($pdo,$case40);
ok_173((string)$row40['durum']==='yenilendi' && (string)$row40['sonuc_bitis_tarihi']===$externalEnd,
    'external extension should close case as renewed with resulting end date.');

$case10=(int)$pdo->query("SELECT id FROM kurum_lisans_yenilemeleri WHERE kurum_id=10")->fetchColumn();
$currentFar=$today->modify('+400 days')->format('Y-m-d');
$shorter=$today->modify('+100 days')->format('Y-m-d');
$pdo->prepare("UPDATE kurum_lisanslari SET bitis_tarihi=? WHERE kurum_id=10")->execute([$currentFar]);
$shortenBlocked=false;
try{ly_renew($pdo,$actor,$case10,1,$shorter,'Geri çekmemeli');}catch(RuntimeException){$shortenBlocked=true;}
ok_173($shortenBlocked,'stale renewal case must not shorten an already-extended current license.');
ok_173((string)$pdo->query("SELECT bitis_tarihi FROM kurum_lisanslari WHERE kurum_id=10")->fetchColumn()===$currentFar,
    'blocked stale renewal must leave current license end unchanged.');

$history20=ly_history_rows($pdo,$case20);
ok_173(count($history20)>=4,'renewal history should retain case open, note, stage and renewal events.');
ok_173((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisans_yenileme_gecmisi WHERE yenileme_id={$case20} AND tur='not'")->fetchColumn()>=2,
    'follow-up and renewal notes should remain append-only.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: renewal queue idempotency, milestone notifications, notes, real extension, external reconciliation and no-early-cancel semantics\n";
