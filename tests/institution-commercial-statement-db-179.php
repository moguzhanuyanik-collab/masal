<?php
declare(strict_types=1);

function fail_179(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_179(bool $condition,string $message): void { if(!$condition) fail_179($message); }

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
}catch(Throwable $e){ fail_179('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/kurum_ticari_360.php';

$tables=['kurum_tahsilatlari','kurum_sozlesmeleri','paketler','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

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

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'kurum-a','Kurum A',1),(20,'kurum-b','Kurum B',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro Paket',1)");

function c179(PDO $pdo,int $institutionId,string $no,string $date,string $currency,string $status,string $total): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?, ?,DATE_ADD(?,INTERVAL 1 YEAR),DATE_ADD(?,INTERVAL 30 DAY),?,?,?)");
    $stmt->execute([$institutionId,$no,$date,$date,$date,$total,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

function p179(PDO $pdo,int $contractId,int $institutionId,string $date,string $currency,string $amount,string $status,string $ref): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,referans_no,durum,iptal_nedeni,iptal_tarihi)
        VALUES (?,?,?, ?,?,'havale',?,?,?,?)");
    $reason=$status==='iptal'?'İptal':null;
    $cancelled=$status==='iptal'?$date.' 12:00:00':null;
    $stmt->execute([$contractId,$institutionId,$date,$amount,$currency,$ref,$status,$reason,$cancelled]);
    return (int)$pdo->lastInsertId();
}

$tryOpening=c179($pdo,10,'TRY-OPEN','2026-01-10','TRY','aktif','1000');
p179($pdo,$tryOpening,10,'2026-02-10','TRY','300','aktif','=OPEN');
$tryPeriod=c179($pdo,10,'TRY-PERIOD','2026-04-05','TRY','aktif','500');
p179($pdo,$tryOpening,10,'2026-04-10','TRY','200','aktif','TRY-P1');
p179($pdo,$tryPeriod,10,'2026-04-20','TRY','100','aktif','TRY-P2');
p179($pdo,$tryPeriod,10,'2026-04-21','TRY','999','iptal','TRY-CANCEL');

$usdOpening=c179($pdo,10,'USD-OPEN','2026-01-15','USD','tamamlandi','1000');
p179($pdo,$usdOpening,10,'2026-02-15','USD','200','aktif','USD-OPEN-P');
p179($pdo,$usdOpening,10,'2026-04-15','USD','100','aktif','+USD-P');

$draft=c179($pdo,10,'TRY-DRAFT','2026-04-07','TRY','taslak','7000');
$cancelled=c179($pdo,10,'TRY-CANCELLED','2026-04-08','TRY','iptal','8000');
p179($pdo,$draft,10,'2026-04-12','TRY','4000','aktif','DRAFT-P');
p179($pdo,$cancelled,10,'2026-04-13','TRY','5000','aktif','CANCELLED-P');

$other=c179($pdo,20,'OTHER','2026-04-06','TRY','aktif','9000');
p179($pdo,$other,20,'2026-04-11','TRY','1000','aktif','OTHER-P');

$filters=kt360_statement_filters([
    'baslangic'=>'2026-04-01',
    'bitis'=>'2026-04-30',
    'para_birimi'=>'',
    'hareket_turu'=>'tum',
]);
ok_179($filters['baslangic']==='2026-04-01' && $filters['bitis']==='2026-04-30',
    'statement date filters mismatch.');

$invalidOrder=false;
try{
    kt360_statement_filters(['baslangic'=>'2026-05-01','bitis'=>'2026-04-01']);
}catch(RuntimeException){$invalidOrder=true;}
ok_179($invalidOrder,'statement must reject start date after end date.');

$tooWide=false;
try{
    kt360_statement_filters(['baslangic'=>'2020-01-01','bitis'=>'2026-04-01']);
}catch(RuntimeException){$tooWide=true;}
ok_179($tooWide,'statement must reject ranges wider than three years.');

$badCurrency=false;
try{
    kt360_statement_filters(['baslangic'=>'2026-04-01','bitis'=>'2026-04-30','para_birimi'=>'GBP']);
}catch(RuntimeException){$badCurrency=true;}
ok_179($badCurrency,'statement must reject unsupported currency.');

$statement=kt360_statement($pdo,10,$filters,5000);
ok_179(count($statement['summary'])===2,'statement summary must keep TRY and USD separate.');
$sum=[];
foreach($statement['summary'] as $row)$sum[(string)$row['para_birimi']]=$row;

ok_179((string)$sum['TRY']['acilis_bakiyesi']==='700.00','TRY opening balance mismatch.');
ok_179((string)$sum['TRY']['donem_borcu']==='500.00','TRY period debit mismatch.');
ok_179((string)$sum['TRY']['donem_tahsilati']==='300.00','TRY period collection mismatch.');
ok_179((string)$sum['TRY']['kapanis_bakiyesi']==='900.00','TRY closing balance mismatch.');

ok_179((string)$sum['USD']['acilis_bakiyesi']==='800.00','USD opening balance mismatch.');
ok_179((string)$sum['USD']['donem_borcu']==='0.00','USD period debit mismatch.');
ok_179((string)$sum['USD']['donem_tahsilati']==='100.00','USD period collection mismatch.');
ok_179((string)$sum['USD']['kapanis_bakiyesi']==='700.00','USD closing balance mismatch.');

ok_179(count($statement['rows'])===4,'statement must contain one contract debit and three valid payment movements.');
foreach($statement['rows'] as $row){
    ok_179((int)$row['sozlesme_id']!==$draft && (int)$row['sozlesme_id']!==$cancelled,
        'draft/cancelled contract anomaly leaked into statement.');
    ok_179((string)$row['referans']!=='TRY-CANCEL','cancelled payment leaked into financial statement.');
}

$tryRows=array_values(array_filter($statement['rows'],static fn(array $row):bool=>(string)$row['para_birimi']==='TRY'));
ok_179(count($tryRows)===3,'TRY statement movement count mismatch.');
ok_179((string)$tryRows[0]['hareket_turu']==='sozlesme' && (string)$tryRows[0]['bakiye']==='1200.00',
    'TRY contract debit running balance mismatch.');
ok_179((string)$tryRows[1]['hareket_turu']==='tahsilat' && (string)$tryRows[1]['bakiye']==='1000.00',
    'TRY first payment running balance mismatch.');
ok_179((string)$tryRows[2]['bakiye']==='900.00','TRY closing running balance mismatch.');

$paymentOnly=kt360_statement($pdo,10,[
    'baslangic'=>'2026-04-01','bitis'=>'2026-04-30','para_birimi'=>'TRY','hareket_turu'=>'tahsilat'
],5000);
ok_179(count($paymentOnly['rows'])===2,'payment-only display filter mismatch.');
ok_179((string)$paymentOnly['rows'][0]['bakiye']==='1000.00',
    'payment-only filter must preserve hidden contract debit in running balance.');
ok_179((string)$paymentOnly['rows'][1]['bakiye']==='900.00',
    'payment-only final running balance mismatch.');

$usdOnly=kt360_statement($pdo,10,[
    'baslangic'=>'2026-04-01','bitis'=>'2026-04-30','para_birimi'=>'USD','hareket_turu'=>'tum'
],5000);
ok_179(count($usdOnly['summary'])===1 && (string)$usdOnly['summary'][0]['para_birimi']==='USD',
    'currency filter summary mismatch.');
ok_179(count($usdOnly['rows'])===1 && (string)$usdOnly['rows'][0]['bakiye']==='700.00',
    'USD filtered statement mismatch.');

$otherStatement=kt360_statement($pdo,20,$filters,5000);
ok_179(count($otherStatement['rows'])===2,'other institution fixture sanity mismatch.');
foreach($statement['rows'] as $row){
    ok_179((int)$row['sozlesme_id']!==$other,'statement leaked another institution contract.');
}

ok_179(kt360_csv_safe_cell('Normal metin')==='Normal metin','normal CSV cell should remain unchanged.');
ok_179(kt360_csv_safe_cell('=SUM(A1:A2)')==="'=SUM(A1:A2)",'equals formula must be neutralized.');
ok_179(kt360_csv_safe_cell('+CMD')==="' +CMD" ? false : true,'guard sanity placeholder');
ok_179(kt360_csv_safe_cell('+CMD')==="'+CMD",'plus formula must be neutralized.');
ok_179(kt360_csv_safe_cell('-10+20')==="'-10+20",'minus formula must be neutralized.');
ok_179(kt360_csv_safe_cell('@SUM(A1)')==="'@SUM(A1)",'at formula must be neutralized.');
ok_179(strpos(kt360_csv_safe_cell("A\0B"),"\0")===false,'NUL byte must be stripped from CSV cell.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: account statement opening/period/closing balances, filters, tenant isolation and CSV formula guard\n";
