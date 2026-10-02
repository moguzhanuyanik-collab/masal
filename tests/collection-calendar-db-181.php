<?php
declare(strict_types=1);

function fail_181(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_181(bool $condition,string $message): void { if(!$condition) fail_181($message); }

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
}catch(Throwable $e){ fail_181('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/tahsilat_takvimi.php';

$tables=[
    'kurum_sozlesme_taksitleri','kurum_sozlesme_taksit_planlari',
    'kurum_tahsilatlari','kurum_sozlesmeleri','paketler','kurumlar'
];
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

$pdo->exec("CREATE TABLE kurum_sozlesme_taksit_planlari(
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'taslak',
    aktif_surum INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY(sozlesme_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sozlesme_taksitleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    surum_no INT UNSIGNED NOT NULL,
    sira_no INT UNSIGNED NOT NULL,
    vade_tarihi DATE NOT NULL,
    tutar DECIMAL(14,2) NOT NULL,
    aciklama VARCHAR(500) NULL,
    PRIMARY KEY(id),
    UNIQUE KEY uk_taksit_surum_sira(sozlesme_id,surum_no,sira_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1),(30,'c','C Kurumu',1),(40,'d','D Kurumu',1),(50,'e','E Kurumu',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro Paket',1)");

$today=new DateTimeImmutable('today');

function add_contract_181(
    PDO $pdo,int $institutionId,string $number,string $currency,string $status,string $total,?string $due
): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?,DATE_SUB(CURDATE(),INTERVAL 1 YEAR),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,?,?,?)");
    $stmt->execute([$institutionId,$number,$due,$total,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

function add_payment_181(PDO $pdo,int $contractId,int $institutionId,string $currency,string $amount,string $status='aktif'): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,durum)
        VALUES (?,?,CURDATE(),?,?,'havale',?)");
    $stmt->execute([$contractId,$institutionId,$amount,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

function add_plan_181(PDO $pdo,int $contractId,int $institutionId,array $rows): void {
    $pdo->prepare("INSERT INTO kurum_sozlesme_taksit_planlari(sozlesme_id,kurum_id,durum,aktif_surum)
        VALUES (?,?,'aktif',1)")->execute([$contractId,$institutionId]);
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesme_taksitleri
        (sozlesme_id,kurum_id,surum_no,sira_no,vade_tarihi,tutar,aciklama)
        VALUES (?,?,1,?,?,?,?)");
    $i=1;
    foreach($rows as $row){
        $stmt->execute([$contractId,$institutionId,$i++,$row[0],$row[1],$row[2]??null]);
    }
}

$cA=add_contract_181($pdo,10,'CAL-A','TRY','aktif','1000',$today->modify('+200 days')->format('Y-m-d'));
add_plan_181($pdo,$cA,10,[
    [$today->modify('-5 days')->format('Y-m-d'),'300','Geçmiş'],
    [$today->modify('+5 days')->format('Y-m-d'),'300','Yakın'],
    [$today->modify('+40 days')->format('Y-m-d'),'400','Orta'],
]);
$payA=add_payment_181($pdo,$cA,10,'TRY','450');

$cB=add_contract_181($pdo,20,'CAL-B','TRY','aktif','500',$today->modify('-10 days')->format('Y-m-d'));
add_payment_181($pdo,$cB,20,'TRY','100');

$cC=add_contract_181($pdo,30,'CAL-C','USD','aktif','1000',$today->modify('+20 days')->format('Y-m-d'));
add_payment_181($pdo,$cC,30,'USD','200');

$cD=add_contract_181($pdo,40,'CAL-D','TRY','aktif','600',null);

$cE=add_contract_181($pdo,50,'CAL-E','TRY','aktif','500',$today->modify('+300 days')->format('Y-m-d'));
add_plan_181($pdo,$cE,50,[
    [$today->modify('-20 days')->format('Y-m-d'),'200','Gecikmiş taksit'],
    [$today->modify('+60 days')->format('Y-m-d'),'300','İleri taksit'],
]);

add_contract_181($pdo,20,'CAL-DRAFT','TRY','taslak','9000',$today->modify('+5 days')->format('Y-m-d'));
add_contract_181($pdo,20,'CAL-CANCEL','TRY','iptal','8000',$today->modify('-30 days')->format('Y-m-d'));

$window=ttk_window($today->format('Y-m-d'),$today->modify('+90 days')->format('Y-m-d'));
ok_181($window['baslangic']===$today->format('Y-m-d'),'window start mismatch.');
ok_181($window['bitis']===$today->modify('+90 days')->format('Y-m-d'),'window end mismatch.');

$tooWide=false;
try{ttk_window($today->format('Y-m-d'),$today->modify('+367 days')->format('Y-m-d'));}catch(RuntimeException){$tooWide=true;}
ok_181($tooWide,'calendar window wider than 366 days must be rejected.');

$reverse=false;
try{ttk_window($today->modify('+10 days')->format('Y-m-d'),$today->format('Y-m-d'));}catch(RuntimeException){$reverse=true;}
ok_181($reverse,'calendar start after end must be rejected.');

$rows=ttk_obligations($pdo);
ok_181(count($rows)===7,'open obligations should contain seven schedule items.');

$aRows=array_values(array_filter($rows,static fn(array $row):bool=>(int)$row['sozlesme_id']===$cA));
ok_181(count($aRows)===2,'FIFO-paid first installment must disappear from A obligations.');
ok_181((int)$aRows[0]['taksit_sira']===2 && (string)$aRows[0]['kalan_tutar']==='150.00',
    'FIFO must partially allocate A second installment.');
ok_181((int)$aRows[1]['taksit_sira']===3 && (string)$aRows[1]['kalan_tutar']==='400.00',
    'A third installment remaining mismatch.');
ok_181((string)$aRows[0]['kaynak']==='taksit','active plan must produce installment obligations.');

$bRows=array_values(array_filter($rows,static fn(array $row):bool=>(int)$row['sozlesme_id']===$cB));
ok_181(count($bRows)===1 && (string)$bRows[0]['kaynak']==='tek_vade',
    'legacy contract must use single-due fallback.');
ok_181((string)$bRows[0]['kalan_tutar']==='400.00' && (string)$bRows[0]['durum_kodu']==='gecikmis',
    'legacy overdue remaining balance mismatch.');

$dRows=array_values(array_filter($rows,static fn(array $row):bool=>(int)$row['sozlesme_id']===$cD));
ok_181(count($dRows)===1 && $dRows[0]['vade_tarihi']===null && (string)$dRows[0]['durum_kodu']==='vadesiz',
    'missing-due active balance must remain visible as unscheduled.');

$summary=ttk_summary($pdo);
$by=[];
foreach($summary as $row)$by[(string)$row['para_birimi']]=$row;
ok_181(isset($by['TRY'],$by['USD']),'TRY/USD summaries must remain separate.');
ok_181((string)$by['TRY']['gecikmis']==='600.00','TRY overdue schedule total mismatch.');
ok_181((string)$by['TRY']['gun_1_7']==='150.00','TRY 1-7 day expected amount mismatch.');
ok_181((string)$by['TRY']['gun_31_60']==='700.00','TRY 31-60 day expected amount mismatch.');
ok_181((string)$by['TRY']['vadesiz']==='600.00','TRY unscheduled open balance mismatch.');
ok_181((string)$by['USD']['gun_8_30']==='800.00','USD 8-30 day expected amount mismatch.');

$filtered=ttk_filter_rows($pdo,[
    'baslangic'=>$today->format('Y-m-d'),'bitis'=>$today->modify('+90 days')->format('Y-m-d'),
    'para_birimi'=>'','q'=>'','gecikmis'=>'1','vadesiz'=>'1'
]);
ok_181(count($filtered)===7,'default 90-day view with overdue and unscheduled should show seven items.');

$futureOnly=ttk_filter_rows($pdo,[
    'baslangic'=>$today->format('Y-m-d'),'bitis'=>$today->modify('+90 days')->format('Y-m-d'),
    'para_birimi'=>'','q'=>'','gecikmis'=>'0','vadesiz'=>'0'
]);
ok_181(count($futureOnly)===4,'future-only 90-day view should show four scheduled items.');

$usdOnly=ttk_filter_rows($pdo,[
    'baslangic'=>$today->format('Y-m-d'),'bitis'=>$today->modify('+90 days')->format('Y-m-d'),
    'para_birimi'=>'USD','q'=>'','gecikmis'=>'1','vadesiz'=>'1'
]);
ok_181(count($usdOnly)===1 && (int)$usdOnly[0]['sozlesme_id']===$cC,
    'USD filter must isolate USD obligation.');

$aOnly=ttk_filter_rows($pdo,[
    'baslangic'=>$today->format('Y-m-d'),'bitis'=>$today->modify('+90 days')->format('Y-m-d'),
    'para_birimi'=>'','q'=>'A Kurumu','gecikmis'=>'1','vadesiz'=>'1'
]);
ok_181(count($aOnly)===2,'institution search must isolate A installment obligations.');

$forecast=ttk_monthly_forecast($pdo,6);
$totals=[];
foreach($forecast as $row){
    $ccy=(string)$row['para_birimi'];
    $totals[$ccy]=($totals[$ccy]??0)+(float)$row['beklenen_tutar'];
}
ok_181(abs(($totals['TRY']??0)-850.0)<0.01,'six-month TRY expected cash flow mismatch.');
ok_181(abs(($totals['USD']??0)-800.0)<0.01,'six-month USD expected cash flow mismatch.');

$pdo->prepare("UPDATE kurum_tahsilatlari SET durum='iptal' WHERE id=?")->execute([$payA]);
$rowsAfterCancel=ttk_obligations($pdo);
$aAfter=array_values(array_filter($rowsAfterCancel,static fn(array $row):bool=>(int)$row['sozlesme_id']===$cA));
ok_181(count($aAfter)===3,'cancelled payment must restore all A installment obligations.');
ok_181((string)$aAfter[0]['kalan_tutar']==='300.00' && (string)$aAfter[0]['durum_kodu']==='gecikmis',
    'cancelled payment must restore overdue first installment in forecast.');

$summaryAfter=ttk_summary($pdo);
$after=[];
foreach($summaryAfter as $row)$after[(string)$row['para_birimi']]=$row;
ok_181((string)$after['TRY']['gecikmis']==='900.00',
    'payment cancellation must immediately increase current TRY overdue forecast without persisted snapshot.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: installment FIFO forecast, legacy single due, missing due, currency isolation, filters and payment-cancel recalculation\n";
