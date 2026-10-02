<?php
declare(strict_types=1);

function fail_178(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_178(bool $condition,string $message): void { if(!$condition) fail_178($message); }

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
}catch(Throwable $e){ fail_178('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/kurum_ticari_360.php';

$tables=[
    'ticari_tahsilat_hatirlatmalari',
    'ticari_tahsilat_takipleri',
    'lisans_yenileme_sozlesmeleri',
    'kurum_lisans_yenilemeleri',
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
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'kurum-a','Kurum A',1),(20,'kurum-b','Kurum B',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES
    (1,'pro','Pro Paket',1),(2,'plus','Plus Paket',1)");

$today=new DateTimeImmutable('today');

function c178(PDO $pdo,int $institutionId,string $no,int $packageId,string $currency,string $status,string $total,string $due): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum,notlar)
        VALUES (?,?,?,DATE_SUB(CURDATE(),INTERVAL 1 YEAR),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,?,?,?,?)");
    $stmt->execute([$institutionId,$packageId,$no,$due,$total,$currency,$status,'Test sözleşme']);
    return (int)$pdo->lastInsertId();
}

function p178(PDO $pdo,int $contractId,int $institutionId,string $currency,string $amount,string $status,string $ref): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_tahsilatlari
        (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,referans_no,durum,iptal_nedeni,iptal_tarihi)
        VALUES (?,?,CURDATE(),?,?,'havale',?,?,?,?)");
    $cancelReason=$status==='iptal'?'Test iptal':null;
    $cancelDate=$status==='iptal'?date('Y-m-d H:i:s'):null;
    $stmt->execute([$contractId,$institutionId,$amount,$currency,$ref,$status,$cancelReason,$cancelDate]);
    return (int)$pdo->lastInsertId();
}

$c1=c178($pdo,10,'A-TRY-ACT',1,'TRY','aktif','1000',$today->modify('-10 days')->format('Y-m-d'));
$c2=c178($pdo,10,'A-TRY-DONE',2,'TRY','tamamlandi','2000',$today->modify('-60 days')->format('Y-m-d'));
$c3=c178($pdo,10,'A-USD-ACT',1,'USD','aktif','1000',$today->modify('+20 days')->format('Y-m-d'));
$c4=c178($pdo,10,'A-TRY-DRAFT',1,'TRY','taslak','7000',$today->modify('+30 days')->format('Y-m-d'));
$c5=c178($pdo,10,'A-TRY-CANCEL',1,'TRY','iptal','8000',$today->modify('-20 days')->format('Y-m-d'));
$cOther=c178($pdo,20,'B-TRY-ACT',1,'TRY','aktif','9999',$today->modify('-20 days')->format('Y-m-d'));

p178($pdo,$c1,10,'TRY','200','aktif','A1');
p178($pdo,$c1,10,'TRY','300','aktif','A2');
p178($pdo,$c1,10,'TRY','900','iptal','A3');
p178($pdo,$c2,10,'TRY','2000','aktif','A4');
p178($pdo,$c3,10,'USD','200','aktif','A5');
p178($pdo,$c5,10,'TRY','400','iptal','A6');
p178($pdo,$cOther,20,'TRY','100','aktif','B1');

$pdo->prepare("INSERT INTO kurum_lisans_yenilemeleri
    (id,lisans_id,kurum_id,hedef_bitis_tarihi,durum,sonuc_paket_id,sonuc_bitis_tarihi,kapanma_tarihi)
    VALUES
    (501,1001,10,?,'yenilendi',1,?,NOW()),
    (502,1001,10,?,'acik',NULL,NULL,NULL),
    (601,2001,20,?,'acik',NULL,NULL,NULL)")
    ->execute([
        $today->modify('-365 days')->format('Y-m-d'),$today->modify('+365 days')->format('Y-m-d'),
        $today->modify('+30 days')->format('Y-m-d'),
        $today->modify('+20 days')->format('Y-m-d')
    ]);

$pdo->prepare("INSERT INTO lisans_yenileme_sozlesmeleri(yenileme_id,sozlesme_id,kurum_id,olusturan_kullanici_id)
    VALUES (501,?,10,1)")->execute([$c1]);

$pdo->prepare("INSERT INTO ticari_tahsilat_takipleri
    (sozlesme_id,kurum_id,durum,sonraki_aksiyon_tarihi)
    VALUES (?,10,'odeme_sozu',DATE_ADD(CURDATE(),INTERVAL 1 DAY))")->execute([$c1]);

$pdo->prepare("INSERT INTO ticari_tahsilat_hatirlatmalari
    (sozlesme_id,kurum_id,vade_tarihi,esik_kodu,acik_tutar,para_birimi,duyuru_id,alici_sayisi,gonderen_kullanici_id)
    VALUES
    (?,10,?,'gecikme_7',700,'TRY',10001,2,1),
    (?,10,?,'gecikme_15',500,'TRY',10002,2,1),
    (?,20,?,'gecikme_7',9899,'TRY',20001,1,1)")
    ->execute([
        $c1,$today->modify('-10 days')->format('Y-m-d'),
        $c1,$today->modify('-10 days')->format('Y-m-d'),
        $cOther,$today->modify('-20 days')->format('Y-m-d')
    ]);

$institution=kt360_institution($pdo,10);
ok_178(is_array($institution) && (string)$institution['ad']==='Kurum A','institution resolver mismatch.');
ok_178(kt360_institution($pdo,999)===null,'unknown institution must resolve to null.');

$summary=kt360_currency_summary($pdo,10);
ok_178(count($summary)===2,'institution summary must keep TRY and USD separate.');
$sum=[];
foreach($summary as $row)$sum[(string)$row['para_birimi']]=$row;
ok_178((string)$sum['TRY']['portfoy_toplami']==='3000.00',
    'TRY summary must exclude draft/cancelled contracts.');
ok_178((string)$sum['TRY']['aktif_sozlesme_toplami']==='1000.00',
    'TRY active contract value mismatch.');
ok_178((string)$sum['TRY']['tahsil_edilen']==='2500.00',
    'multiple active payments must aggregate without contract double-count.');
ok_178((string)$sum['TRY']['kalan_tutar']==='500.00','TRY remaining balance mismatch.');
ok_178((string)$sum['TRY']['gecikmis_bakiye']==='500.00','TRY overdue balance mismatch.');
ok_178((int)$sum['TRY']['yenileme_sozlesmesi']===1,'TRY renewal-linked contract count mismatch.');
ok_178((string)$sum['USD']['portfoy_toplami']==='1000.00','USD portfolio mismatch.');
ok_178((string)$sum['USD']['tahsil_edilen']==='200.00','USD collected mismatch.');

$contracts=kt360_contract_rows($pdo,10);
ok_178(count($contracts)===5,'360 contract history must retain all institution contract states.');
$byId=[];
foreach($contracts as $row)$byId[(int)$row['id']]=$row;
ok_178((string)$byId[$c1]['tahsil_edilen']==='500.00','active payment aggregate mismatch on contract detail.');
ok_178((int)$byId[$c1]['aktif_tahsilat_sayisi']===2,'active payment count mismatch.');
ok_178((int)$byId[$c1]['tahsilat_gecmisi']===3,'full payment history count must include cancelled payment.');
ok_178(!empty($byId[$c1]['gecikmis']),'overdue active contract flag missing.');
ok_178((int)$byId[$c1]['yenileme_id']===501,'renewal lineage missing from contract detail.');
ok_178((string)$byId[$c1]['risk_durumu']==='odeme_sozu','risk state missing from contract detail.');
ok_178((int)$byId[$c1]['hatirlatma_sayisi']===2,'reminder count missing from contract detail.');
ok_178(isset($byId[$c4]) && (string)$byId[$c4]['durum']==='taslak','draft contract must remain visible in audit view.');
ok_178(isset($byId[$c5]) && (string)$byId[$c5]['durum']==='iptal','cancelled contract must remain visible in audit view.');
foreach($contracts as $row) ok_178((int)$row['kurum_id']===10,'contract history leaked another institution.');

$payments=kt360_payment_rows($pdo,10,300);
ok_178(count($payments)===6,'payment history must retain active and cancelled movements.');
$paymentStatuses=array_count_values(array_map(static fn(array $row):string=>(string)$row['durum'],$payments));
ok_178((int)($paymentStatuses['aktif']??0)===4,'active payment history count mismatch.');
ok_178((int)($paymentStatuses['iptal']??0)===2,'cancelled payment history count mismatch.');
foreach($payments as $row) ok_178((int)$row['kurum_id']===10,'payment history leaked another institution.');

$renewals=kt360_renewal_rows($pdo,10,100);
ok_178(count($renewals)===2,'renewal history must be institution scoped and retain open/closed cases.');
$renewalIds=array_map(static fn(array $row):int=>(int)$row['id'],$renewals);
sort($renewalIds);
ok_178($renewalIds===[501,502],'renewal history mismatch.');
$renewal501=null;
foreach($renewals as $row) if((int)$row['id']===501)$renewal501=$row;
ok_178(is_array($renewal501) && (int)$renewal501['sozlesme_id']===$c1,
    'renewed case contract lineage missing.');

$reminders=kt360_reminder_rows($pdo,10,100);
ok_178(count($reminders)===2,'manager reminder history must be institution scoped.');
foreach($reminders as $row) ok_178((int)$row['sozlesme_id']===$c1,'unexpected contract in institution reminder history.');

$counts=kt360_counts($pdo,10);
ok_178((int)$counts['sozlesme']===5,'360 contract count mismatch.');
ok_178((int)$counts['aktif_sozlesme']===2,'360 active contract count mismatch.');
ok_178((int)$counts['gecikmis_sozlesme']===1,'360 overdue contract count mismatch.');
ok_178((int)$counts['risk_acik']===1,'360 open risk count mismatch.');
ok_178((int)$counts['tahsilat']===6,'360 payment movement count mismatch.');
ok_178((int)$counts['aktif_tahsilat']===4 && (int)$counts['iptal_tahsilat']===2,
    '360 active/cancelled payment counts mismatch.');
ok_178((int)$counts['yenileme']===2 && (int)$counts['acik_yenileme']===1,
    '360 renewal counts mismatch.');
ok_178((int)$counts['hatirlatma']===2,'360 reminder count mismatch.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: institution commercial 360 currency summary, all-state contracts, payment audit, renewal/risk/reminder lineage and tenant isolation\n";
