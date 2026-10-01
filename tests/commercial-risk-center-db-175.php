<?php
declare(strict_types=1);

function fail_175(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_175(bool $condition,string $message): void { if(!$condition) fail_175($message); }

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
}catch(Throwable $e){ fail_175('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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

$tables=[
    'ticari_tahsilat_takip_gecmisi','ticari_tahsilat_takipleri',
    'lisans_yenileme_sozlesmeleri','kurum_lisans_yenilemeleri',
    'kurum_tahsilatlari','kurum_sozlesmeleri','paketler',
    'kullanicilar','kurumlar'
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

$pdo->exec("CREATE TABLE kurum_lisans_yenilemeleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    hedef_bitis_tarihi DATE NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'yenilendi',
    sonuc_paket_id BIGINT UNSIGNED NULL,
    sonuc_bitis_tarihi DATE NULL,
    kapanma_tarihi DATETIME NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE lisans_yenileme_sozlesmeleri(
    yenileme_id BIGINT UNSIGNED NOT NULL,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(yenileme_id),
    UNIQUE KEY uk_yenileme_sozlesme(sozlesme_id)
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1,'Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','Kurum A',1),(20,'b','Kurum B',1),(30,'c','Kurum C',1),
    (40,'d','Kurum D',1),(50,'e','Kurum E',1),(60,'f','Kurum F',1),
    (70,'g','Kurum G',1),(80,'h','Kurum H',1),(90,'i','Kurum I',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aylik_fiyat,para_birimi,aktif) VALUES
    (1,'pro','Pro Paket',1000,'TRY',1)");

$today=new DateTimeImmutable('today');

function add_contract_175(PDO $pdo,int $institutionId,string $no,?string $due,string $total='1000',string $currency='TRY'): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,?,?,'aktif')");
    $stmt->execute([$institutionId,$no,$due,$total,$currency]);
    return (int)$pdo->lastInsertId();
}

$cUpcoming=add_contract_175($pdo,10,'RISK-UP',$today->modify('+5 days')->format('Y-m-d'));
$cToday=add_contract_175($pdo,20,'RISK-0',$today->format('Y-m-d'));
$c10=add_contract_175($pdo,30,'RISK-10',$today->modify('-10 days')->format('Y-m-d'));
$c20=add_contract_175($pdo,40,'RISK-20',$today->modify('-20 days')->format('Y-m-d'));
$c40=add_contract_175($pdo,50,'RISK-40',$today->modify('-40 days')->format('Y-m-d'));
$cNoDue=add_contract_175($pdo,60,'RISK-NODUE',null);
$cFuture=add_contract_175($pdo,70,'RISK-FUTURE',$today->modify('+20 days')->format('Y-m-d'));
$cPaid=add_contract_175($pdo,80,'RISK-PAID',$today->modify('-20 days')->format('Y-m-d'));
$cCancel=add_contract_175($pdo,90,'RISK-CANCEL',$today->modify('-5 days')->format('Y-m-d'));

$paid=tf_record_payment($pdo,['id'=>1,'role'=>'super_admin'],[
    'sozlesme_id'=>$cPaid,'tahsilat_tarihi'=>$today->format('Y-m-d'),'tutar'=>'1000',
    'odeme_yontemi'=>'havale','referans_no'=>'PAID','notlar'=>'Tam tahsilat'
]);
ok_175($paid>0,'prepaid contract setup failed.');

$pdo->prepare("INSERT INTO kurum_lisans_yenilemeleri
    (lisans_id,kurum_id,hedef_bitis_tarihi,durum,sonuc_paket_id,sonuc_bitis_tarihi,kapanma_tarihi)
    VALUES (123,40,?,'yenilendi',1,?,NOW())")
    ->execute([$today->modify('-365 days')->format('Y-m-d'),$today->modify('+1 year')->format('Y-m-d')]);
$renewalId=(int)$pdo->lastInsertId();
$pdo->prepare("INSERT INTO lisans_yenileme_sozlesmeleri(yenileme_id,sozlesme_id,kurum_id,olusturan_kullanici_id)
    VALUES (?,?,40,1)")->execute([$renewalId,$c20]);

$actor=['id'=>1,'role'=>'super_admin'];

ok_175(tr_risk_bucket($today->modify('+5 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='yaklasan',
    'future <=7 day bucket mismatch.');
ok_175(tr_risk_bucket($today->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='0_7',
    'today due bucket mismatch.');
ok_175(tr_risk_bucket($today->modify('-10 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='8_15',
    '8-15 day bucket mismatch.');
ok_175(tr_risk_bucket($today->modify('-20 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='16_30',
    '16-30 day bucket mismatch.');
ok_175(tr_risk_bucket($today->modify('-40 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='31_plus',
    '31+ bucket mismatch.');
ok_175(tr_risk_bucket(null,$today->format('Y-m-d'))['kod']==='vade_yok',
    'missing due bucket mismatch.');

$sync1=tr_sync_cases($pdo,$actor);
ok_175((int)$sync1['created']===7,'sync should create seven risk cases: six aging cases plus cancellable overdue case.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takipleri")->fetchColumn()===7,
    'risk table must contain one case per tracked contract.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cFuture}")->fetchColumn()===0,
    'future >7 day contract must not enter risk queue.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cPaid}")->fetchColumn()===0,
    'fully paid completed contract must not enter risk queue.');

$sync2=tr_sync_cases($pdo,$actor);
ok_175((int)$sync2['created']===0 && (int)$sync2['reopened']===0,
    'repeated risk sync must be idempotent.');

$summary=tr_summary($pdo);
ok_175((int)$summary['open']===7,'seven risk cases should be open.');
ok_175((int)$summary['yaklasan']===1,'one upcoming due expected.');
ok_175((int)$summary['0_7']===2,'today and five-day overdue contracts should be in 0-7 bucket.');
ok_175((int)$summary['8_15']===1,'one 8-15 day risk expected.');
ok_175((int)$summary['16_30']===1,'one 16-30 day risk expected.');
ok_175((int)$summary['31_plus']===1,'one 31+ day risk expected.');
ok_175((int)$summary['vade_yok']===1,'one missing-due risk expected.');
ok_175((int)$summary['yenileme_gecikmis']===1,'one renewal-linked overdue contract expected.');

$renewalOnly=tr_queue_rows($pdo,['durum'=>'open','yenileme'=>'1'],100);
ok_175(count($renewalOnly)===1 && (int)$renewalOnly[0]['sozlesme_id']===$c20,
    'renewal overdue filter must isolate linked overdue contract.');

$tomorrow=$today->modify('+1 day')->format('Y-m-d');
tr_add_note($pdo,$actor,$cToday,'Kurum finans birimi yarın ödeme yapacağını bildirdi.',$tomorrow,'odeme_sozu');
$case=tr_case_row($pdo,$cToday);
ok_175((string)$case['durum']==='odeme_sozu','follow-up note should set payment promise stage.');
ok_175((string)$case['sonraki_aksiyon_tarihi']===$tomorrow,'next action date should be stored.');
ok_175((int)$case['sorumlu_kullanici_id']===1,'first follow-up actor must become responsible owner.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takip_gecmisi
    WHERE sozlesme_id={$cToday} AND tur='not' AND kod='takip_notu'")->fetchColumn()===1,
    'follow-up note must be appended to risk history.');

tr_set_stage($pdo,$actor,$c10,'ihtilaf');
ok_175((string)$pdo->query("SELECT durum FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$c10}")->fetchColumn()==='ihtilaf',
    'risk case stage should move to dispute/review.');

$paymentToday=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$cToday,'tahsilat_tarihi'=>$today->format('Y-m-d'),'tutar'=>'1000',
    'odeme_yontemi'=>'havale','referans_no'=>'CLOSE','notlar'=>'Tam tahsilat'
]);
$sync3=tr_sync_cases($pdo,$actor);
ok_175((int)$sync3['closed']>=1,'full collection must close risk case on sync.');
ok_175((string)$pdo->query("SELECT durum FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cToday}")->fetchColumn()==='kapali',
    'fully collected contract risk case must be closed.');
ok_175((string)$pdo->query("SELECT kapanma_kodu FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cToday}")->fetchColumn()==='tahsilat_tamamlandi',
    'full collection close code mismatch.');

tf_cancel_payment($pdo,$actor,$paymentToday,'Tahsilat iade edildi.');
$sync4=tr_sync_cases($pdo,$actor);
ok_175((int)$sync4['reopened']>=1,'payment cancellation must reopen same risk case.');
ok_175((string)$pdo->query("SELECT durum FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cToday}")->fetchColumn()==='acik',
    'reopened risk case should return to open stage.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cToday}")->fetchColumn()===1,
    'reopen must reuse same contract risk case instead of creating duplicate.');
ok_175((int)$pdo->query("SELECT COUNT(*) FROM ticari_tahsilat_takip_gecmisi
    WHERE sozlesme_id={$cToday} AND kod='vaka_yeniden_acildi'")->fetchColumn()===1,
    'reopen event must remain in append-only history.');

tf_save_contract($pdo,$actor,[
    'sozlesme_id'=>$cUpcoming,'kurum_id'=>10,'paket_id'=>1,'sozlesme_no'=>'RISK-UP',
    'baslangic_tarihi'=>$today->format('Y-m-d'),'bitis_tarihi'=>$today->modify('+1 year')->format('Y-m-d'),
    'vade_tarihi'=>$today->modify('+30 days')->format('Y-m-d'),'toplam_tutar'=>'1000',
    'para_birimi'=>'TRY','durum'=>'aktif','notlar'=>'Vade ileri alındı'
]);
$sync5=tr_sync_cases($pdo,$actor);
ok_175((int)$sync5['closed']>=1,'moving due outside seven-day window must close operational risk case.');
ok_175((string)$pdo->query("SELECT kapanma_kodu FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cUpcoming}")->fetchColumn()==='risk_penceresi_disinda',
    'future moved due must use risk-window close code.');

tf_save_contract($pdo,$actor,[
    'sozlesme_id'=>$cCancel,'kurum_id'=>90,'paket_id'=>1,'sozlesme_no'=>'RISK-CANCEL',
    'baslangic_tarihi'=>$today->format('Y-m-d'),'bitis_tarihi'=>$today->modify('+1 year')->format('Y-m-d'),
    'vade_tarihi'=>$today->modify('-5 days')->format('Y-m-d'),'toplam_tutar'=>'1000',
    'para_birimi'=>'TRY','durum'=>'iptal','notlar'=>'Sözleşme iptal'
]);
$sync6=tr_sync_cases($pdo,$actor);
ok_175((int)$sync6['closed']>=1,'cancelled contract must close risk case.');
ok_175((string)$pdo->query("SELECT kapanma_kodu FROM ticari_tahsilat_takipleri WHERE sozlesme_id={$cCancel}")->fetchColumn()==='sozlesme_iptal',
    'cancelled contract close code mismatch.');

$exposure=tr_currency_exposure($pdo);
ok_175(count($exposure)===1 && (string)$exposure[0]['para_birimi']==='TRY',
    'risk exposure must group by currency.');
ok_175((float)$exposure[0]['gecikmis_bakiye']>0,
    'risk exposure must include overdue open balances.');

$detail=tr_case_detail($pdo,$c20);
ok_175(is_array($detail) && (int)$detail['yenileme_id']===$renewalId,
    'risk detail must resolve renewal lineage.');
ok_175((string)$detail['risk_kodu']==='16_30',
    'risk detail must preserve deterministic aging bucket.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: collection aging, idempotent risk sync, renewal overdue isolation, follow-up history, auto-close and payment-cancel reopen\n";
