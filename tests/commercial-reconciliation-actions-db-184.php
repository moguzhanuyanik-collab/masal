<?php
declare(strict_types=1);

function fail_184(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_184(bool $condition,string $message): void { if(!$condition) fail_184($message); }

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
}catch(Throwable $e){ fail_184('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/ticari_belgeler.php';
require __DIR__.'/../src/ticari_mutabakat.php';
require __DIR__.'/../src/ticari_mutabakat_aksiyon.php';

$tables=[
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'ticari_belge_gecmisi','ticari_belge_tahsilat_eslemeleri','ticari_belgeler',
    'kurum_tahsilatlari','kurum_sozlesmeleri','kullanicilar','kurumlar'
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

$pdo->exec("CREATE TABLE ticari_belgeler(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    belge_turu VARCHAR(30) NOT NULL,
    belge_no VARCHAR(120) NOT NULL,
    belge_tarihi DATE NOT NULL,
    tutar DECIMAL(14,2) NOT NULL,
    para_birimi CHAR(3) NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    notlar VARCHAR(2000) NULL,
    iptal_nedeni VARCHAR(500) NULL,
    iptal_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_ticari_belge_no(kurum_id,belge_turu,belge_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_belge_tahsilat_eslemeleri(
    belge_id BIGINT UNSIGNED NOT NULL,
    tahsilat_id BIGINT UNSIGNED NOT NULL,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    tutar DECIMAL(14,2) NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    iptal_nedeni VARCHAR(500) NULL,
    iptal_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(belge_id,tahsilat_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_belge_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    belge_id BIGINT UNSIGNED NOT NULL,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(30) NOT NULL,
    kod VARCHAR(40) NULL,
    detay VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vakalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    anahtar CHAR(64) NOT NULL,
    kaynak_turu VARCHAR(30) NOT NULL,
    kaynak_kodu VARCHAR(40) NOT NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    kaynak_alt_id BIGINT UNSIGNED NULL,
    sozlesme_id BIGINT UNSIGNED NULL,
    kurum_id BIGINT UNSIGNED NULL,
    para_birimi CHAR(3) NULL,
    sorun_turu VARCHAR(20) NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'acik',
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    sonraki_aksiyon_tarihi DATE NULL,
    son_tespit_tarihi DATETIME NULL,
    son_aciklama VARCHAR(2000) NULL,
    kapanma_kodu VARCHAR(40) NULL,
    kapanma_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_mutabakat_vaka_anahtar(anahtar)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vaka_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    not_metni VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1,'Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");

function contract_184(PDO $pdo,int $institutionId,string $number,string $currency,string $amount): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?, ?, CURDATE(), DATE_ADD(CURDATE(),INTERVAL 1 YEAR), DATE_ADD(CURDATE(),INTERVAL 30 DAY), ?, ?, 'aktif')");
    $stmt->execute([$institutionId,$number,$amount,$currency]);
    return (int)$pdo->lastInsertId();
}
function document_184(PDO $pdo,int $contractId,int $institutionId,string $number,string $currency,string $amount,string $status='aktif'): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_belgeler
        (sozlesme_id,kurum_id,belge_turu,belge_no,belge_tarihi,tutar,para_birimi,durum)
        VALUES (?,?,'tahakkuk',?,CURDATE(),?,?,?)");
    $stmt->execute([$contractId,$institutionId,$number,$amount,$currency,$status]);
    return (int)$pdo->lastInsertId();
}
function payment_184(PDO $pdo,int $contractId,int $institutionId,string $currency,string $amount,string $ref,string $status='aktif'): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,referans_no,durum)
        VALUES (?,?,CURDATE(),?,?,'havale',?,?)");
    $stmt->execute([$contractId,$institutionId,$amount,$currency,$ref,$status]);
    return (int)$pdo->lastInsertId();
}
function map_184(PDO $pdo,int $documentId,int $paymentId,int $contractId,int $institutionId,string $amount,string $status='aktif'): void {
    $pdo->prepare("INSERT INTO ticari_belge_tahsilat_eslemeleri
        (belge_id,tahsilat_id,sozlesme_id,kurum_id,tutar,durum)
        VALUES (?,?,?,?,?,?)")->execute([$documentId,$paymentId,$contractId,$institutionId,$amount,$status]);
}

$perfect=contract_184($pdo,10,'PERFECT','TRY','1000');
$pd=document_184($pdo,$perfect,10,'PERF-DOC','TRY','1000');
$pp=payment_184($pdo,$perfect,10,'TRY','1000','PERF-PAY');
map_184($pdo,$pd,$pp,$perfect,10,'1000');

$gap=contract_184($pdo,10,'GAP','TRY','1000');

$error=contract_184($pdo,10,'ERROR','TRY','1000');
$ed=document_184($pdo,$error,10,'ERR-DOC','TRY','1200');

$badDoc=document_184($pdo,$perfect,20,'BAD-DOC','TRY','50');
$badPay=payment_184($pdo,$perfect,10,'USD','50','BAD-PAY');
map_184($pdo,$badDoc,$badPay,$perfect,20,'25');

$actor=['id'=>1,'role'=>'super_admin'];

$sourceBefore=[
    'contracts'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri")->fetchColumn(),
    'documents'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belgeler")->fetchColumn(),
    'payments'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_tahsilatlari")->fetchColumn(),
    'maps'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belge_tahsilat_eslemeleri")->fetchColumn(),
];

$sync1=ma_sync_cases($pdo,$actor);
ok_184((int)$sync1['created']===5,'initial sync should create gap, capacity-error and three identity cases.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vakalari")->fetchColumn()===5,
    'five unique reconciliation cases expected.');

$sourceAfter=[
    'contracts'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri")->fetchColumn(),
    'documents'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belgeler")->fetchColumn(),
    'payments'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_tahsilatlari")->fetchColumn(),
    'maps'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belge_tahsilat_eslemeleri")->fetchColumn(),
];
ok_184($sourceBefore===$sourceAfter,'case sync must not mutate financial source record counts.');

$summary=ma_summary($pdo);
ok_184((int)$summary['open']===5,'five reconciliation cases should be open.');
ok_184((int)$summary['operasyon']===1,'one operational-gap case expected initially.');
ok_184((int)$summary['butunluk']===4,'capacity error plus three identity anomalies should be integrity cases.');

$sync2=ma_sync_cases($pdo,$actor);
ok_184((int)$sync2['created']===0 && (int)$sync2['reopened']===0 && (int)$sync2['closed']===0,
    'repeated reconciliation sync must be idempotent.');

$gapCase=(int)$pdo->query("SELECT id FROM ticari_mutabakat_vakalari
    WHERE kaynak_turu='sozlesme_mutabakat' AND kaynak_id={$gap}")->fetchColumn();
$errorCase=(int)$pdo->query("SELECT id FROM ticari_mutabakat_vakalari
    WHERE kaynak_turu='sozlesme_mutabakat' AND kaynak_id={$error}")->fetchColumn();
ok_184($gapCase>0 && $errorCase>0,'contract reconciliation cases missing.');

$tomorrow=(new DateTimeImmutable('tomorrow'))->format('Y-m-d');
ma_set_stage($pdo,$actor,$gapCase,'incelemede');
ma_add_note($pdo,$actor,$gapCase,'Belgeleme ve ödeme eşleme süreci kurum muhasebesiyle kontrol ediliyor.',$tomorrow,'beklemede');
$gapCaseRow=ma_case_row($pdo,$gapCase);
ok_184((string)$gapCaseRow['durum']==='beklemede','follow-up note must update selected case stage.');
ok_184((int)$gapCaseRow['sorumlu_kullanici_id']===1,'first action must assign Super Admin as case owner.');
ok_184((string)$gapCaseRow['sonraki_aksiyon_tarihi']===$tomorrow,'next action date must be stored.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE vaka_id={$gapCase} AND kod='takip_notu'")->fetchColumn()===1,
    'follow-up note must be append-only history.');

$pdo->prepare("UPDATE ticari_belgeler SET tutar='600.00' WHERE id=?")->execute([$ed]);
$sync3=ma_sync_cases($pdo,$actor);
$errorRow=ma_case_row($pdo,$errorCase);
ok_184((int)$sync3['created']===0,'classification change must not create a second contract case.');
ok_184((string)$errorRow['sorun_turu']==='operasyon' && (string)$errorRow['kaynak_kodu']==='eksik',
    'same contract case must change from integrity error to operational gap.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE vaka_id={$errorCase} AND kod='sinif_degisti'")->fetchColumn()===1,
    'classification change must be recorded in history.');

$gd=document_184($pdo,$gap,10,'GAP-DOC','TRY','1000');
$gp=payment_184($pdo,$gap,10,'TRY','1000','GAP-PAY');
map_184($pdo,$gd,$gp,$gap,10,'1000');
$sync4=ma_sync_cases($pdo,$actor);
$closedGap=ma_case_row($pdo,$gapCase);
ok_184((int)$sync4['closed']>=1,'source reconciliation must auto-close resolved contract case.');
ok_184((string)$closedGap['durum']==='kapali' && (string)$closedGap['kapanma_kodu']==='kaynak_cozuldu',
    'resolved contract case must close with source-resolved code.');

$manualCloseBypass=false;
try{ ma_set_stage($pdo,$actor,$gapCase,'acik'); }catch(RuntimeException){ $manualCloseBypass=true; }
ok_184($manualCloseBypass,'closed source-resolved case must not be manually reopened by stage change.');

$pdo->prepare("UPDATE ticari_belge_tahsilat_eslemeleri SET durum='iptal' WHERE belge_id=? AND tahsilat_id=?")
    ->execute([$gd,$gp]);
$sync5=ma_sync_cases($pdo,$actor);
$reopenedGap=ma_case_row($pdo,$gapCase);
ok_184((int)$sync5['reopened']>=1,'recurring source gap must reopen existing case.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vakalari
    WHERE kaynak_turu='sozlesme_mutabakat' AND kaynak_id={$gap}")->fetchColumn()===1,
    'recurring gap must reuse same case instead of creating duplicate.');
ok_184((string)$reopenedGap['durum']==='acik','reopened source issue must return to open stage.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE vaka_id={$gapCase} AND kod='vaka_yeniden_acildi'")->fetchColumn()===1,
    'reopen event must remain in append-only history.');

$pdo->prepare("UPDATE ticari_belgeler SET kurum_id=10,durum='iptal' WHERE id=?")->execute([$badDoc]);
$pdo->prepare("UPDATE kurum_tahsilatlari SET para_birimi='TRY',durum='iptal' WHERE id=?")->execute([$badPay]);
$pdo->prepare("UPDATE ticari_belge_tahsilat_eslemeleri
    SET kurum_id=10,durum='iptal' WHERE belge_id=? AND tahsilat_id=?")->execute([$badDoc,$badPay]);
$sync6=ma_sync_cases($pdo,$actor);
ok_184((int)$sync6['closed']>=3,'corrected identity anomalies must auto-close their cases.');
ok_184((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vakalari
    WHERE kaynak_turu IN ('belge_kimlik','tahsilat_kimlik','esleme_kimlik') AND durum='kapali'")->fetchColumn()===3,
    'all three identity anomaly cases must be source-resolved and closed.');

$pdo->prepare("UPDATE ticari_belgeler SET tutar='1000.00' WHERE id=?")->execute([$ed]);
$ep=payment_184($pdo,$error,10,'TRY','1000','ERR-PAY');
map_184($pdo,$ed,$ep,$error,10,'1000');
$sync7=ma_sync_cases($pdo,$actor);
$resolvedError=ma_case_row($pdo,$errorCase);
ok_184((int)$sync7['closed']>=1 && (string)$resolvedError['durum']==='kapali',
    'contract case must auto-close after document/payment/allocation reconciliation.');

$pdo->prepare("UPDATE ticari_belge_tahsilat_eslemeleri SET durum='aktif' WHERE belge_id=? AND tahsilat_id=?")
    ->execute([$gd,$gp]);
$sync8=ma_sync_cases($pdo,$actor);
ok_184((int)$sync8['closed']>=1,'reopened GAP case must close again when source is reconciled.');
ok_184((int)ma_summary($pdo)['open']===0,'all source issues should be closed after final reconciliation.');

$closedRows=ma_queue_rows($pdo,['durum'=>'kapali'],100);
ok_184(count($closedRows)===5,'closed queue must retain all historical cases.');

$targeted=tm_contract_rows($pdo,['sozlesme_id'=>$perfect],1,0);
ok_184(count($targeted)===1 && (int)$targeted[0]['sozlesme_id']===$perfect,
    'targeted reconciliation contract read must resolve exact contract.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reconciliation action lifecycle, classification change, source auto-close, same-case reopen and identity anomaly resolution\n";
