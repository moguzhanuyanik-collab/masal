<?php
declare(strict_types=1);

function fail_176(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_176(bool $condition,string $message): void { if(!$condition) fail_176($message); }

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
}catch(Throwable $e){ fail_176('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/tahsilat_risk.php';
require __DIR__.'/../src/bildirimler.php';
require __DIR__.'/../src/tahsilat_hatirlatma.php';

$tables=[
    'ticari_tahsilat_hatirlatmalari',
    'kurum_duyuru_alicilari','kurum_duyurulari',
    'ticari_tahsilat_takip_gecmisi','ticari_tahsilat_takipleri',
    'kurum_tahsilatlari','kurum_sozlesmeleri','paketler',
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

$pdo->exec("CREATE TABLE kurum_sozlesmeleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    paket_id BIGINT UNSIGNED NULL,
    sozlesme_no VARCHAR(80) NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NULL,
    vade_tarihi DATE NULL,
    toplam_tutar DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    para_birimi CHAR(3) NOT NULL DEFAULT 'TRY',
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    notlar VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_sozlesme_no(sozlesme_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_tahsilatlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    tahsilat_tarihi DATE NOT NULL,
    tutar DECIMAL(14,2) NOT NULL,
    para_birimi CHAR(3) NOT NULL,
    odeme_yontemi VARCHAR(30) NOT NULL DEFAULT 'havale',
    referans_no VARCHAR(120) NULL,
    notlar VARCHAR(1000) NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    iptal_nedeni VARCHAR(500) NULL,
    iptal_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_tahsilat_takipleri(
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'acik',
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    son_temas_tarihi DATE NULL,
    sonraki_aksiyon_tarihi DATE NULL,
    kapanma_kodu VARCHAR(40) NULL,
    kapanma_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(sozlesme_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_tahsilat_takip_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
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

$pdo->exec("CREATE TABLE ticari_tahsilat_hatirlatmalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    vade_tarihi DATE NOT NULL,
    esik_kodu VARCHAR(30) NOT NULL,
    acik_tutar DECIMAL(14,2) NOT NULL,
    para_birimi CHAR(3) NOT NULL,
    duyuru_id BIGINT UNSIGNED NULL,
    alici_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
    gonderen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_tahsilat_hatirlatma(sozlesme_id,vade_tarihi,esik_kodu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Süper Admin',1),
    (101,'A Yönetici',1),(102,'B Yönetici 1',1),(103,'B Yönetici 2',1),
    (104,'C Yönetici',1),(105,'D Yönetici',1),(106,'E Yönetici',1),
    (107,'F Yönetici',1),(108,'Pasif Yönetici',0),(109,'H Yönetici',1)");

$institutions=[
    10=>'A Kurumu',20=>'B Kurumu',30=>'C Kurumu',40=>'D Kurumu',
    50=>'E Kurumu',60=>'F Kurumu',70=>'G Kurumu',80=>'H Kurumu'
];
foreach($institutions as $id=>$name){
    $pdo->prepare("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (?,?,?,1)")
        ->execute([$id,'k'.$id,$name]);
}

$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,101,'yonetici',1),
    (20,102,'yonetici',1),(20,103,'yonetici',1),
    (30,104,'yonetici',1),(40,105,'yonetici',1),(50,106,'yonetici',1),
    (60,107,'yonetici',1),(60,108,'yonetici',1),
    (80,109,'yonetici',1)");

$pdo->exec("INSERT INTO paketler(id,kod,ad,aylik_fiyat,para_birimi,aktif)
    VALUES (1,'pro','Pro Paket',1000,'TRY',1)");

$today=new DateTimeImmutable('today');

function add_contract_176(PDO $pdo,int $institutionId,string $number,?string $due,string $total='1000'): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?,DATE_SUB(CURDATE(),INTERVAL 1 YEAR),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,?,'TRY','aktif')");
    $stmt->execute([$institutionId,$number,$due,$total]);
    return (int)$pdo->lastInsertId();
}

$cA=add_contract_176($pdo,10,'REM-A',$today->modify('+5 days')->format('Y-m-d'));
$cB=add_contract_176($pdo,20,'REM-B',$today->format('Y-m-d'));
$cC=add_contract_176($pdo,30,'REM-C',$today->modify('-10 days')->format('Y-m-d'));
$cD=add_contract_176($pdo,40,'REM-D',$today->modify('-20 days')->format('Y-m-d'));
$cE=add_contract_176($pdo,50,'REM-E',$today->modify('-35 days')->format('Y-m-d'));
$cF=add_contract_176($pdo,60,'REM-F',null);
$cG=add_contract_176($pdo,70,'REM-G',$today->modify('-10 days')->format('Y-m-d'));
$cH=add_contract_176($pdo,80,'REM-H',$today->modify('-20 days')->format('Y-m-d'));

$actor=['id'=>1,'role'=>'super_admin'];

$p=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$cH,'tahsilat_tarihi'=>$today->format('Y-m-d'),'tutar'=>'1000',
    'odeme_yontemi'=>'havale','referans_no'=>'FULL','notlar'=>'Tam tahsilat'
]);
ok_176($p>0,'fully-paid setup failed.');

ok_176(th_milestone($today->modify('+8 days')->format('Y-m-d'),$today->format('Y-m-d'))===null,
    'more than seven days before due must not notify.');
ok_176((string)th_milestone($today->modify('+7 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='vade_7',
    'seven-day pre-due milestone mismatch.');
ok_176((string)th_milestone($today->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='vade_0',
    'due-day milestone mismatch.');
ok_176((string)th_milestone($today->modify('-6 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='vade_0',
    'early-overdue milestone mismatch.');
ok_176((string)th_milestone($today->modify('-7 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_7',
    '7+ milestone mismatch.');
ok_176((string)th_milestone($today->modify('-15 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_15',
    '15+ milestone mismatch.');
ok_176((string)th_milestone($today->modify('-30 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_30',
    '30+ milestone mismatch.');

$sync=tr_sync_cases($pdo,$actor);
ok_176((int)$sync['created']===7,'seven unpaid near/overdue or missing-due contracts should enter risk queue.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cH}")->fetchColumn()===0,
    'fully paid contract must not enter risk queue.');

$notify1=th_sync_manager_reminders($pdo,$actor);
ok_176((int)$notify1['sent']===5,'five contracts with dated milestones and active managers should notify.');
ok_176((int)$notify1['no_recipient']===1,'one institution without active manager should be reported.');
ok_176((int)$notify1['failed']===0,'first reminder sync should not fail.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_hatirlatmalari")->fetchColumn()===5,
    'five reminder history records expected.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='tahsilat_hatirlatma'")->fetchColumn()===5,
    'five central system announcements expected.');

$roles=$pdo->query("SELECT DISTINCT kurum_rolu FROM kurum_duyuru_alicilari ORDER BY kurum_rolu")->fetchAll(PDO::FETCH_COLUMN);
ok_176($roles===['yonetici'],'collection reminders must only snapshot manager recipients.');

$bReminder=(int)$pdo->query("SELECT id FROM ticari_tahsilat_hatirlatmalari WHERE sozlesme_id={$cB}")->fetchColumn();
ok_176($bReminder>0,'B reminder history missing.');
$bAnnouncement=(int)$pdo->query("SELECT duyuru_id FROM ticari_tahsilat_hatirlatmalari WHERE id={$bReminder}")->fetchColumn();
ok_176((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE duyuru_id={$bAnnouncement}")->fetchColumn()===2,
    'all active managers in institution must receive reminder.');
ok_176((int)$pdo->query("SELECT alici_sayisi FROM ticari_tahsilat_hatirlatmalari WHERE id={$bReminder}")->fetchColumn()===2,
    'recipient count snapshot must match actual manager recipients.');

$gHistory=(int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_hatirlatmalari WHERE sozlesme_id={$cG}")->fetchColumn();
ok_176($gHistory===0,'institution without active manager must not create false sent-history row.');

$notify2=th_sync_manager_reminders($pdo,$actor);
ok_176((int)$notify2['sent']===0,'same contract/due/milestone must not notify twice.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_hatirlatmalari")->fetchColumn()===5,
    'dedup sync must not duplicate history.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='tahsilat_hatirlatma'")->fetchColumn()===5,
    'dedup sync must not duplicate central announcements.');

$cSnapshot=(string)$pdo->query("SELECT acik_tutar FROM ticari_tahsilat_hatirlatmalari WHERE sozlesme_id={$cC}")->fetchColumn();
ok_176($cSnapshot==='1000.00','initial reminder amount snapshot mismatch.');

$partial=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$cC,'tahsilat_tarihi'=>$today->format('Y-m-d'),'tutar'=>'300',
    'odeme_yontemi'=>'havale','referans_no'=>'PARTIAL','notlar'=>'Kısmi tahsilat'
]);
ok_176($partial>0,'partial payment setup failed.');
tr_sync_cases($pdo,$actor);
$notify3=th_sync_manager_reminders($pdo,$actor);
ok_176((int)$notify3['sent']===0,'payment change inside same milestone must not resend same threshold.');
ok_176((string)$pdo->query("SELECT acik_tutar FROM ticari_tahsilat_hatirlatmalari WHERE sozlesme_id={$cC}")->fetchColumn()==='1000.00',
    'historical reminder amount snapshot must not change after payment.');

$newDue=$today->format('Y-m-d');
$pdo->prepare("UPDATE kurum_sozlesmeleri SET vade_tarihi=? WHERE id=?")->execute([$newDue,$cA]);
tr_sync_cases($pdo,$actor);
$notify4=th_sync_manager_reminders($pdo,$actor);
ok_176((int)$notify4['sent']===1,'changed due period should allow its current milestone reminder.');
ok_176((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_hatirlatmalari WHERE sozlesme_id={$cA}")->fetchColumn()===2,
    'changed due date should create a separate reminder period, not overwrite history.');

$summary=th_summary($pdo);
ok_176((int)$summary['vade_7']===1,'one pre-due reminder expected after A due-date revision.');
ok_176((int)$summary['vade_0']===2,'B due-day plus revised A due-day reminders expected.');
ok_176((int)$summary['gecikme_7']===1,'one 7+ reminder expected.');
ok_176((int)$summary['gecikme_15']===1,'one 15+ reminder expected.');
ok_176((int)$summary['gecikme_30']===1,'one 30+ reminder expected.');

$contractHistory=th_contract_history($pdo,$cA);
ok_176(count($contractHistory)===2,'per-contract reminder history must retain both due periods.');

ok_176(!array_key_exists('yonetici',bd_recipient_roles()),
    'manual announcement role list must remain unchanged.');
ok_176(array_key_exists('yonetici',bd_supported_recipient_roles()),
    'system notification role list must support manager recipients.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: manager-only collection reminders, threshold dedup, recipient snapshots, amount history and changed-due cycle\n";
