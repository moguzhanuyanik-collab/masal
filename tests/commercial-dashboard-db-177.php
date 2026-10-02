<?php
declare(strict_types=1);

function fail_177(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_177(bool $condition,string $message): void { if(!$condition) fail_177($message); }

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
}catch(Throwable $e){ fail_177('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/ticari_dashboard.php';

$tables=['lisans_yenileme_sozlesmeleri','kurum_tahsilatlari','kurum_sozlesmeleri','paketler','kurumlar'];
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

$pdo->exec("CREATE TABLE lisans_yenileme_sozlesmeleri(
    yenileme_id BIGINT UNSIGNED NOT NULL,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(yenileme_id),
    UNIQUE KEY uk_yenileme_sozlesme(sozlesme_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro Paket',1)");

$today=new DateTimeImmutable('today');

function add_contract_177(
    PDO $pdo,int $institutionId,string $number,string $currency,string $status,string $total,?string $due
): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?,DATE_SUB(CURDATE(),INTERVAL 1 YEAR),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,?,?,?)");
    $stmt->execute([$institutionId,$number,$due,$total,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

function add_payment_177(
    PDO $pdo,int $contractId,int $institutionId,string $currency,string $amount,string $status='aktif'
): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,durum)
        VALUES (?,?,CURDATE(),?,?,'havale',?)");
    $stmt->execute([$contractId,$institutionId,$amount,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

$cA1=add_contract_177($pdo,10,'A-TRY-ACT','TRY','aktif','1000',$today->modify('-5 days')->format('Y-m-d'));
$cA2=add_contract_177($pdo,10,'A-TRY-DONE','TRY','tamamlandi','2000',$today->modify('-40 days')->format('Y-m-d'));
$cAUsd=add_contract_177($pdo,10,'A-USD-ACT','USD','aktif','1000',$today->modify('+10 days')->format('Y-m-d'));
$cB=add_contract_177($pdo,20,'B-TRY-ACT','TRY','aktif','500',$today->modify('+20 days')->format('Y-m-d'));
$cDraft=add_contract_177($pdo,20,'B-TRY-DRAFT','TRY','taslak','9000',$today->modify('-20 days')->format('Y-m-d'));
$cCancelled=add_contract_177($pdo,20,'B-TRY-CANCEL','TRY','iptal','8000',$today->modify('-20 days')->format('Y-m-d'));

add_payment_177($pdo,$cA1,10,'TRY','200');
add_payment_177($pdo,$cA1,10,'TRY','300');
add_payment_177($pdo,$cA1,10,'TRY','999','iptal');
add_payment_177($pdo,$cA2,10,'TRY','2000');
add_payment_177($pdo,$cAUsd,10,'USD','200');
add_payment_177($pdo,$cB,20,'TRY','100');
add_payment_177($pdo,$cDraft,20,'TRY','5000');
add_payment_177($pdo,$cCancelled,20,'TRY','4000');

$pdo->prepare("INSERT INTO lisans_yenileme_sozlesmeleri
    (yenileme_id,sozlesme_id,kurum_id,olusturan_kullanici_id)
    VALUES (1001,?,10,1)")->execute([$cA1]);

$kpis=td_currency_kpis($pdo);
ok_177(count($kpis)===2,'TRY and USD must remain separate KPI rows.');

$byCurrency=[];
foreach($kpis as $row)$byCurrency[(string)$row['para_birimi']]=$row;
ok_177(isset($byCurrency['TRY'],$byCurrency['USD']),'TRY/USD KPI rows missing.');

$try=$byCurrency['TRY'];
ok_177((int)$try['sozlesme_sayisi']===3,'TRY portfolio must include only active/completed contracts.');
ok_177((int)$try['aktif_sozlesme']===2,'TRY active contract count mismatch.');
ok_177((int)$try['tamamlanan_sozlesme']===1,'TRY completed contract count mismatch.');
ok_177((string)$try['aktif_sozlesme_toplami']==='1500.00','active TRY contract value mismatch.');
ok_177((string)$try['sozlesme_toplami']==='3500.00',
    'multiple payments must not duplicate TRY contract totals.');
ok_177((string)$try['tahsil_edilen']==='2600.00',
    'TRY collected amount must include active payments only.');
ok_177((string)$try['kalan_tutar']==='900.00','TRY remaining balance mismatch.');
ok_177((string)$try['gecikmis_bakiye']==='500.00','TRY overdue balance mismatch.');
ok_177((int)$try['gecikmis_sozlesme']===1,'TRY overdue contract count mismatch.');
ok_177(abs((float)$try['tahsilat_orani']-74.3)<0.01,'TRY collection rate mismatch.');
ok_177((int)$try['yenileme_sozlesmesi']===1,'renewal-linked contract count mismatch.');
ok_177((string)$try['yenileme_sozlesme_toplami']==='1000.00','renewal contract total mismatch.');
ok_177((string)$try['yenileme_tahsil_edilen']==='500.00','renewal collected total mismatch.');
ok_177((string)$try['yenileme_kalan_tutar']==='500.00','renewal remaining total mismatch.');

$usd=$byCurrency['USD'];
ok_177((string)$usd['sozlesme_toplami']==='1000.00','USD portfolio mismatch.');
ok_177((string)$usd['tahsil_edilen']==='200.00','USD collected mismatch.');
ok_177((string)$usd['kalan_tutar']==='800.00','USD remaining mismatch.');
ok_177(abs((float)$usd['tahsilat_orani']-20.0)<0.01,'USD collection rate mismatch.');

$tryInstitutions=td_institution_rows($pdo,['para_birimi'=>'TRY'],100);
ok_177(count($tryInstitutions)===2,'TRY institution summary must contain two institutions.');
$inst=[];
foreach($tryInstitutions as $row)$inst[(int)$row['kurum_id']]=$row;
ok_177((string)$inst[10]['sozlesme_toplami']==='3000.00','A institution TRY portfolio mismatch.');
ok_177((string)$inst[10]['tahsil_edilen']==='2500.00','A institution TRY collected mismatch.');
ok_177((string)$inst[10]['kalan_tutar']==='500.00','A institution TRY remaining mismatch.');
ok_177((string)$inst[10]['gecikmis_bakiye']==='500.00','A institution overdue mismatch.');
ok_177((int)$inst[10]['yenileme_sozlesmesi']===1,'A institution renewal count mismatch.');
ok_177((string)$inst[20]['sozlesme_toplami']==='500.00','draft/cancelled B contracts must be excluded.');

$search=td_institution_rows($pdo,['para_birimi'=>'TRY','q'=>'B Kurumu'],100);
ok_177(count($search)===1 && (int)$search[0]['kurum_id']===20,'institution search filter mismatch.');

$monthly=td_monthly_collections($pdo,6);
$currentMonth=$today->format('Y-m');
$current=[];
foreach($monthly as $row) if((string)$row['ay']===$currentMonth)$current[(string)$row['para_birimi']]=$row;
ok_177((string)$current['TRY']['tahsilat_toplami']==='2600.00',
    'monthly TRY trend must ignore cancelled payments and payments tied to draft/cancelled contracts.');
ok_177((int)$current['TRY']['tahsilat_sayisi']===4,'monthly TRY active payment count mismatch.');
ok_177((string)$current['USD']['tahsilat_toplami']==='200.00','monthly USD trend mismatch.');

$recent=td_recent_payments($pdo,20);
ok_177(count($recent)===5,'recent active payment feed must exclude cancelled payments and payments tied to draft/cancelled contracts.');
foreach($recent as $row) ok_177((int)$row['id']>0,'recent payment row invalid.');
$recentIds=array_map(static fn(array $row):int=>(int)$row['id'],$recent);
$cancelledPaymentId=(int)$pdo->query("SELECT id FROM kurum_tahsilatlari WHERE durum='iptal' LIMIT 1")->fetchColumn();
ok_177(!in_array($cancelledPaymentId,$recentIds,true),'cancelled payment must not appear in recent active feed.');

$ops=td_operational_counts($pdo);
ok_177((int)$ops['risk_open']===0 && (int)$ops['renewal_open']===0,
    'operational bridge must degrade safely when optional domains are not loaded.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: currency-separated KPI, no payment double-count, draft/cancel exclusion, renewal revenue, institution summary and monthly trend\n";
