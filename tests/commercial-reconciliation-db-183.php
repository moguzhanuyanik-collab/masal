<?php
declare(strict_types=1);

function fail_183(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_183(bool $condition,string $message): void { if(!$condition) fail_183($message); }

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
}catch(Throwable $e){ fail_183('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/ticari_belgeler.php';
require __DIR__.'/../src/ticari_mutabakat.php';

$tables=[
    'ticari_belge_gecmisi','ticari_belge_tahsilat_eslemeleri','ticari_belgeler',
    'kurum_tahsilatlari','kurum_sozlesmeleri','kurumlar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

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

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");

function contract_183(PDO $pdo,int $institutionId,string $number,string $currency,string $amount): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?, ?, CURDATE(), DATE_ADD(CURDATE(),INTERVAL 1 YEAR), DATE_ADD(CURDATE(),INTERVAL 30 DAY), ?, ?, 'aktif')");
    $stmt->execute([$institutionId,$number,$amount,$currency]);
    return (int)$pdo->lastInsertId();
}
function document_183(PDO $pdo,int $contractId,int $institutionId,string $number,string $currency,string $amount): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_belgeler
        (sozlesme_id,kurum_id,belge_turu,belge_no,belge_tarihi,tutar,para_birimi,durum)
        VALUES (?,?,'tahakkuk',?,CURDATE(),?,?,'aktif')");
    $stmt->execute([$contractId,$institutionId,$number,$amount,$currency]);
    return (int)$pdo->lastInsertId();
}
function payment_183(PDO $pdo,int $contractId,int $institutionId,string $currency,string $amount,string $ref): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,referans_no,durum)
        VALUES (?,?,CURDATE(),?,?,'havale',?,'aktif')");
    $stmt->execute([$contractId,$institutionId,$amount,$currency,$ref]);
    return (int)$pdo->lastInsertId();
}
function map_183(PDO $pdo,int $documentId,int $paymentId,int $contractId,int $institutionId,string $amount): void {
    $pdo->prepare("INSERT INTO ticari_belge_tahsilat_eslemeleri
        (belge_id,tahsilat_id,sozlesme_id,kurum_id,tutar,durum)
        VALUES (?,?,?,?,?,'aktif')")->execute([$documentId,$paymentId,$contractId,$institutionId,$amount]);
}

$perfect=contract_183($pdo,10,'PERFECT','TRY','1000');
$pd1=document_183($pdo,$perfect,10,'PERF-1','TRY','600');
$pd2=document_183($pdo,$perfect,10,'PERF-2','TRY','400');
$pp1=payment_183($pdo,$perfect,10,'TRY','500','PERF-P1');
$pp2=payment_183($pdo,$perfect,10,'TRY','500','PERF-P2');
map_183($pdo,$pd1,$pp1,$perfect,10,'500');
map_183($pdo,$pd1,$pp2,$perfect,10,'100');
map_183($pdo,$pd2,$pp2,$perfect,10,'400');

$error=contract_183($pdo,10,'ERROR','TRY','1000');
$ed=document_183($pdo,$error,10,'ERR-DOC','TRY','1200');
$ep=payment_183($pdo,$error,10,'TRY','200','ERR-PAY');
map_183($pdo,$ed,$ep,$error,10,'200');

$gap=contract_183($pdo,10,'GAP','TRY','1000');
$gd=document_183($pdo,$gap,10,'GAP-DOC','TRY','600');
$gp=payment_183($pdo,$gap,10,'TRY','500','GAP-PAY');
map_183($pdo,$gd,$gp,$gap,10,'300');

$usd=contract_183($pdo,20,'USD-GAP','USD','1000');
$ud=document_183($pdo,$usd,20,'USD-DOC','USD','1000');
$up=payment_183($pdo,$usd,20,'USD','250','USD-PAY');
map_183($pdo,$ud,$up,$usd,20,'250');

$lateNormal=contract_183($pdo,10,'LATE-NORMAL','TRY','100');
$ld=document_183($pdo,$lateNormal,10,'LATE-DOC','TRY','100');
$lp=payment_183($pdo,$lateNormal,10,'TRY','100','LATE-PAY');
map_183($pdo,$ld,$lp,$lateNormal,10,'100');

$badDoc=document_183($pdo,$perfect,20,'BAD-DOC','TRY','50');
$badPay=payment_183($pdo,$perfect,10,'USD','50','BAD-PAY');
$pdo->prepare("INSERT INTO ticari_belge_tahsilat_eslemeleri
    (belge_id,tahsilat_id,sozlesme_id,kurum_id,tutar,durum)
    VALUES (?,?,?,20,25,'aktif')")->execute([$gd,$pp1,$perfect]);

$summary=tm_currency_summary($pdo);
ok_183(count($summary)===2,'TRY and USD reconciliation summaries must remain separate.');
$currency=[];
foreach($summary as $row)$currency[(string)$row['para_birimi']]=$row;
ok_183(isset($currency['TRY'],$currency['USD']),'TRY/USD summary rows missing.');

$try=$currency['TRY'];
ok_183((string)$try['sozlesme_toplami']==='3100.00','TRY contract total must include all valid active contracts exactly once.');
ok_183((string)$try['belge_toplami']==='2900.00','TRY document total must exclude wrong-tenant document.');
ok_183((string)$try['tahsilat_toplami']==='1800.00','TRY payment total must exclude wrong-currency payment.');
ok_183((string)$try['eslesen_tutar']==='1500.00','TRY effective allocation total must exclude bad mapping.');
ok_183((int)$try['hata_sayisi']===1,'one TRY capacity error expected.');
ok_183((int)$try['eksik_sayisi']===1,'one TRY operational gap expected.');
ok_183((int)$try['tam_sayisi']===2,'two TRY reconciled contracts expected.');

$usdSummary=$currency['USD'];
ok_183((string)$usdSummary['sozlesme_toplami']==='1000.00','USD contract total mismatch.');
ok_183((string)$usdSummary['belge_toplami']==='1000.00','USD document total mismatch.');
ok_183((string)$usdSummary['tahsilat_toplami']==='250.00','USD payment total mismatch.');
ok_183((string)$usdSummary['eslesen_tutar']==='250.00','USD allocation total mismatch.');

$all=tm_contract_rows($pdo,[],100);
$status=[];
foreach($all as $row)$status[(string)$row['sozlesme_no']]=$row;
ok_183((string)$status['PERFECT']['mutabakat_durumu']==='tam','perfect contract must reconcile.');
ok_183((string)$status['ERROR']['mutabakat_durumu']==='hata','over-documented contract must be data-control error.');
ok_183((string)$status['GAP']['mutabakat_durumu']==='eksik','normal document/payment gap must be operational gap.');
ok_183((string)$status['USD-GAP']['mutabakat_durumu']==='eksik','USD unpaid document must be operational gap.');
ok_183((string)$status['LATE-NORMAL']['mutabakat_durumu']==='tam','later normal contract must reconcile.');

$gapRow=$status['GAP'];
ok_183((string)$gapRow['belgesiz_tutar']==='400.00','GAP unbilled amount mismatch.');
ok_183((string)$gapRow['acik_belge_tutari']==='300.00','GAP open-document amount mismatch.');
ok_183((string)$gapRow['dagitilmamis_tahsilat']==='200.00','GAP unallocated-payment amount mismatch.');

$errorFiltered=tm_contract_rows($pdo,['mutabakat'=>'hata'],1);
ok_183(count($errorFiltered)===1 && (string)$errorFiltered[0]['sozlesme_no']==='ERROR',
    'reconciliation status filter must apply before LIMIT.');

$institutionFiltered=tm_contract_rows($pdo,['kurum_id'=>20],100);
ok_183(count($institutionFiltered)===1 && (string)$institutionFiltered[0]['sozlesme_no']==='USD-GAP',
    'institution filter must exclude wrong-tenant legacy document/payment anomalies.');

$openDocs=tm_open_documents($pdo,[],100);
$openDocIds=array_map(static fn(array $row):int=>(int)$row['belge_id'],$openDocs);
ok_183(in_array($gd,$openDocIds,true),'partially allocated GAP document must be in open-document queue.');
ok_183(in_array($ud,$openDocIds,true),'partially allocated USD document must be in open-document queue.');
ok_183(!in_array($badDoc,$openDocIds,true),'wrong-tenant document must not appear as a valid open document.');

$unallocated=tm_unallocated_payments($pdo,[],100);
$unallocatedById=[];
foreach($unallocated as $row)$unallocatedById[(int)$row['tahsilat_id']=$row;
ok_183(isset($unallocatedById[$gp]),'partially allocated GAP payment must be visible.');
ok_183((string)$unallocatedById[$gp]['dagitilmamis_tutar']==='200.00','GAP unallocated payment mismatch.');
ok_183(!isset($unallocatedById[$badPay]),'wrong-currency payment must not appear as valid distributable payment.');

$issues=tm_integrity_issues($pdo,100);
$codes=array_column($issues,'kod');
ok_183(in_array('belge_kimlik_uyumsuz',$codes,true),'wrong-tenant document integrity issue missing.');
ok_183(in_array('tahsilat_kimlik_uyumsuz',$codes,true),'wrong-currency payment integrity issue missing.');
ok_183(in_array('esleme_kimlik_uyumsuz',$codes,true),'bad mapping integrity issue missing.');
ok_183(in_array('limit_asimi',$codes,true),'over-documented contract capacity issue missing.');

$before=[
    'contracts'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri")->fetchColumn(),
    'documents'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belgeler")->fetchColumn(),
    'payments'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_tahsilatlari")->fetchColumn(),
    'maps'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belge_tahsilat_eslemeleri")->fetchColumn(),
];
tm_currency_summary($pdo);
tm_contract_rows($pdo,[],100);
tm_open_documents($pdo,[],100);
tm_unallocated_payments($pdo,[],100);
tm_integrity_issues($pdo,100);
$after=[
    'contracts'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri")->fetchColumn(),
    'documents'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belgeler")->fetchColumn(),
    'payments'=>(int)$pdo->query("SELECT COUNT(*) FROM kurum_tahsilatlari")->fetchColumn(),
    'maps'=>(int)$pdo->query("SELECT COUNT(*) FROM ticari_belge_tahsilat_eslemeleri")->fetchColumn(),
];
ok_183($before===$after,'read-only reconciliation queries must not mutate financial records.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reconciliation states, currency isolation, valid effective allocation, anomaly detection and read-only behavior\n";
