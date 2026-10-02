<?php
declare(strict_types=1);

function fail_182(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_182(bool $condition,string $message): void { if(!$condition) fail_182($message); }

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
}catch(Throwable $e){ fail_182('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
require __DIR__.'/../src/ticari_belgeler.php';

$tables=[
    'ticari_belge_gecmisi','ticari_belge_tahsilat_eslemeleri','ticari_belgeler',
    'kurum_tahsilatlari','kurum_sozlesmeleri','paketler','kullanicilar','kurumlar'
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1,'Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro Paket',1)");

$today=(new DateTimeImmutable('today'))->format('Y-m-d');

function add_contract_182(PDO $pdo,int $institutionId,string $number,string $currency,string $status,string $total): int {
    $stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
        (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
        VALUES (?,1,?,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),DATE_ADD(CURDATE(),INTERVAL 30 DAY),?,?,?)");
    $stmt->execute([$institutionId,$number,$total,$currency,$status]);
    return (int)$pdo->lastInsertId();
}

$c1=add_contract_182($pdo,10,'A-TRY-1000','TRY','aktif','1000');
$c2=add_contract_182($pdo,10,'A-TRY-500','TRY','aktif','500');
$c3=add_contract_182($pdo,20,'B-USD-700','USD','aktif','700');
$cDraft=add_contract_182($pdo,10,'A-DRAFT','TRY','taslak','400');

$actor=['id'=>1,'role'=>'super_admin'];

$d1=tb_save_document($pdo,$actor,[
    'sozlesme_id'=>$c1,'belge_turu'=>'fatura_referansi','belge_no'=>'EAR-A-001',
    'belge_tarihi'=>$today,'tutar'=>'600','notlar'=>'Harici e-belge referansı'
]);
$d2=tb_save_document($pdo,$actor,[
    'sozlesme_id'=>$c1,'belge_turu'=>'tahakkuk','belge_no'=>'TAH-A-001',
    'belge_tarihi'=>$today,'tutar'=>'400','notlar'=>'İç tahakkuk'
]);
ok_182($d1>0 && $d2>0,'two contract documents should be created.');
ok_182(tb_contract_document_total($pdo,$c1)==='1000.00','active document total must equal contract total.');

$overBlocked=false;
try{
    tb_save_document($pdo,$actor,[
        'sozlesme_id'=>$c1,'belge_turu'=>'diger','belge_no'=>'OVER-1',
        'belge_tarihi'=>$today,'tutar'=>'1','notlar'=>''
    ]);
}catch(RuntimeException){$overBlocked=true;}
ok_182($overBlocked,'document total must not exceed contract total.');

$draftBlocked=false;
try{
    tb_save_document($pdo,$actor,[
        'sozlesme_id'=>$cDraft,'belge_turu'=>'tahakkuk','belge_no'=>'DRAFT-1',
        'belge_tarihi'=>$today,'tutar'=>'100','notlar'=>''
    ]);
}catch(RuntimeException){$draftBlocked=true;}
ok_182($draftBlocked,'draft contract must not accept commercial document.');

$dUsd=tb_save_document($pdo,$actor,[
    'sozlesme_id'=>$c3,'belge_turu'=>'fatura_referansi','belge_no'=>'USD-INV-1',
    'belge_tarihi'=>$today,'tutar'=>'700','notlar'=>'USD external reference'
]);

$duplicateBlocked=false;
try{
    tb_save_document($pdo,$actor,[
        'sozlesme_id'=>$c2,'belge_turu'=>'fatura_referansi','belge_no'=>'EAR-A-001',
        'belge_tarihi'=>$today,'tutar'=>'100','notlar'=>'duplicate'
    ]);
}catch(PDOException){$duplicateBlocked=true;}
ok_182($duplicateBlocked,'same institution/type/document number must be unique.');

$p1=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$c1,'tahsilat_tarihi'=>$today,'tutar'=>'500',
    'odeme_yontemi'=>'havale','referans_no'=>'P1','notlar'=>''
]);
$p2=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$c1,'tahsilat_tarihi'=>$today,'tutar'=>'300',
    'odeme_yontemi'=>'havale','referans_no'=>'P2','notlar'=>''
]);
$pOther=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$c2,'tahsilat_tarihi'=>$today,'tutar'=>'100',
    'odeme_yontemi'=>'havale','referans_no'=>'P-OTHER','notlar'=>''
]);
$pUsd=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$c3,'tahsilat_tarihi'=>$today,'tutar'=>'200',
    'odeme_yontemi'=>'havale','referans_no'=>'P-USD','notlar'=>''
]);

tb_allocate_payment($pdo,$actor,$d1,$p1,'400');
tb_allocate_payment($pdo,$actor,$d2,$p1,'100');
ok_182(tb_payment_effective_allocated($pdo,$p1)==='500.00',
    'one payment must be splittable across documents up to its total.');

tb_allocate_payment($pdo,$actor,$d1,$p2,'200');
ok_182(tb_document_effective_allocated($pdo,$d1)==='600.00',
    'document should be fully matched by multiple payments.');

$paymentOverBlocked=false;
try{tb_allocate_payment($pdo,$actor,$d2,$p2,'200');}catch(RuntimeException){$paymentOverBlocked=true;}
ok_182($paymentOverBlocked,'allocation must not exceed payment remaining amount.');

tb_allocate_payment($pdo,$actor,$d2,$p2,'100');
ok_182(tb_document_effective_allocated($pdo,$d2)==='200.00',
    'second document allocated amount mismatch.');

$crossContractBlocked=false;
try{tb_allocate_payment($pdo,$actor,$d2,$pOther,'50');}catch(RuntimeException){$crossContractBlocked=true;}
ok_182($crossContractBlocked,'different contract payment must not be allocatable.');

$crossInstitutionBlocked=false;
try{tb_allocate_payment($pdo,$actor,$d2,$pUsd,'50');}catch(RuntimeException){$crossInstitutionBlocked=true;}
ok_182($crossInstitutionBlocked,'different institution/currency payment must not be allocatable.');

$editBlocked=false;
try{
    tb_save_document($pdo,$actor,[
        'belge_id'=>$d1,'sozlesme_id'=>$c1,'belge_turu'=>'fatura_referansi','belge_no'=>'EAR-A-001',
        'belge_tarihi'=>$today,'tutar'=>'599','notlar'=>'change amount'
    ]);
}catch(RuntimeException){$editBlocked=true;}
ok_182($editBlocked,'allocation history must freeze document identity and amount.');

$sameCore=tb_save_document($pdo,$actor,[
    'belge_id'=>$d1,'sozlesme_id'=>$c1,'belge_turu'=>'fatura_referansi','belge_no'=>'EAR-A-001',
    'belge_tarihi'=>$today,'tutar'=>'600','notlar'=>'Only note changed after allocation history'
]);
ok_182($sameCore===$d1,'note-only update with same core values should remain possible.');

$cancelBlocked=false;
try{tb_cancel_document($pdo,$actor,$d1,'Yanlış belge');}catch(RuntimeException){$cancelBlocked=true;}
ok_182($cancelBlocked,'document with effective active allocation must not be cancellable.');

tf_cancel_payment($pdo,$actor,$p2,'Tahsilat iade edildi.');
ok_182(tb_document_effective_allocated($pdo,$d1)==='400.00',
    'cancelled payment must stop contributing to effective document allocation.');
ok_182(tb_document_effective_allocated($pdo,$d2)==='100.00',
    'cancelled payment must stop contributing to all linked documents.');
ok_182(tb_document_mapping_count($pdo,$d1)===2,
    'payment cancellation must not erase document allocation history.');

tb_unallocate_payment($pdo,$actor,$d1,$p1,'Belge eşlemesi düzeltildi.');
ok_182(tb_document_effective_allocated($pdo,$d1)==='0.00',
    'unallocation plus cancelled payment should leave zero effective allocation.');

tb_cancel_document($pdo,$actor,$d1,'Harici belge kaydı iptal edildi.');
$cancelled=tb_document_row($pdo,$d1);
ok_182((string)$cancelled['durum']==='iptal','document should be cancelled after effective allocations are cleared.');
ok_182(tb_contract_document_total($pdo,$c1)==='400.00',
    'cancelled document must leave active contract document capacity.');

$dReplacement=tb_save_document($pdo,$actor,[
    'sozlesme_id'=>$c1,'belge_turu'=>'diger','belge_no'=>'REPLACEMENT-600',
    'belge_tarihi'=>$today,'tutar'=>'600','notlar'=>'Replacement tracking record'
]);
ok_182($dReplacement>0 && tb_contract_document_total($pdo,$c1)==='1000.00',
    'freed document capacity should be reusable without changing contract debt.');

tb_allocate_payment($pdo,$actor,$dUsd,$pUsd,'200');

$summary=tb_currency_summary($pdo);
$byCurrency=[];
foreach($summary as $row)$byCurrency[(string)$row['para_birimi']]=$row;
ok_182(isset($byCurrency['TRY'],$byCurrency['USD']),'TRY and USD document summaries must remain separate.');
ok_182((string)$byCurrency['TRY']['belge_toplami']==='1000.00','active TRY document total mismatch.');
ok_182((string)$byCurrency['TRY']['eslesen_tutar']==='100.00','active TRY effective allocation mismatch.');
ok_182((string)$byCurrency['TRY']['acik_belge_tutari']==='900.00','active TRY open document amount mismatch.');
ok_182((string)$byCurrency['USD']['belge_toplami']==='700.00','USD document total mismatch.');
ok_182((string)$byCurrency['USD']['eslesen_tutar']==='200.00','USD document allocation mismatch.');

$aRows=tb_document_rows($pdo,['kurum_id'=>10],100);
ok_182(count($aRows)===3,'institution filter must include only A institution documents including cancelled audit row.');
foreach($aRows as $row) ok_182((int)$row['kurum_id']===10,'institution filter leaked another institution document.');

$history=tb_history_rows($pdo,$d1,100);
$codes=array_map(static fn(array $row):string=>(string)($row['kod']??''),$history);
foreach(['olusturuldu','guncellendi','tahsilat_eslendi','tahsilat_esleme_iptal','iptal'] as $code)
    ok_182(in_array($code,$codes,true),'missing append-only audit event '.$code);

$mappings=tb_document_mappings($pdo,$d1);
ok_182(count($mappings)===2,'allocation audit mappings must remain after unallocation/payment cancellation.');
ok_182((int)$pdo->query("SELECT COUNT(*) FROM ticari_belge_gecmisi WHERE belge_id={$d1}")->fetchColumn()>=6,
    'document audit history should retain multiple lifecycle events.');

ok_182((float)$pdo->query("SELECT toplam_tutar FROM kurum_sozlesmeleri WHERE id={$c1}")->fetchColumn()===1000.0,
    'commercial document operations must never alter contract debt.');
ok_182((int)$pdo->query("SELECT COUNT(*) FROM kurum_tahsilatlari WHERE sozlesme_id={$c1}")->fetchColumn()===2,
    'commercial document operations must not create or delete payments.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: commercial document caps, allocation isolation, payment cancellation effect, reusable capacity and append-only audit\n";
