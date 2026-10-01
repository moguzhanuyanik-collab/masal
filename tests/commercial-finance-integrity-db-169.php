<?php
declare(strict_types=1);

function fail_169(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_169(bool $condition,string $message): void { if(!$condition) fail_169($message); }

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
}catch(Throwable $e){ fail_169('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function kl_validate_date(string $value,bool $required=false): ?string {
    $value=trim($value);
    if($value===''){
        if($required) throw new RuntimeException('Tarih zorunlu.');
        return null;
    }
    $d=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    if(!$d || $d->format('Y-m-d')!==$value) throw new RuntimeException('Tarih geçersiz.');
    return $value;
}

require __DIR__.'/../src/ticari_finans.php';

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
    toplam_tutar DECIMAL(14,2) NOT NULL,
    para_birimi CHAR(3) NOT NULL,
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
    odeme_yontemi VARCHAR(30) NOT NULL,
    referans_no VARCHAR(120) NULL,
    notlar VARCHAR(1000) NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    iptal_nedeni VARCHAR(500) NULL,
    iptal_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (10,'a','A Okulu',1),(20,'b','B Okulu',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro',1)");
$actor=['id'=>999];

function contract_input_169(int $institution,string $number,string $total='1000',string $currency='TRY',string $status='aktif',int $id=0): array {
    $input=[
        'kurum_id'=>$institution,
        'paket_id'=>1,
        'sozlesme_no'=>$number,
        'baslangic_tarihi'=>date('Y-m-d'),
        'bitis_tarihi'=>'',
        'vade_tarihi'=>'',
        'toplam_tutar'=>$total,
        'para_birimi'=>$currency,
        'durum'=>$status,
        'notlar'=>'Integrity test',
    ];
    if($id>0)$input['sozlesme_id']=$id;
    return $input;
}

$contract=tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001'));
$p1=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contract,'tahsilat_tarihi'=>date('Y-m-d'),'tutar'=>'200',
    'odeme_yontemi'=>'havale','referans_no'=>'H1'
]);
$p2=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contract,'tahsilat_tarihi'=>date('Y-m-d'),'tutar'=>'300',
    'odeme_yontemi'=>'kredi_karti','referans_no'=>'H2'
]);

$summary=tf_financial_summary($pdo);
ok_169(count($summary)===1,'summary should have one TRY row.');
ok_169((string)$summary[0]['sozlesme_toplami']==='1000.00',
    'two active payments must not multiply the contract total.');
ok_169((string)$summary[0]['tahsil_edilen']==='500.00','summary should sum both active payments once.');
ok_169((string)$summary[0]['kalan_tutar']==='500.00','summary remaining amount should be 500.');

$institutionBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(20,'IA-HARD-001','1000','TRY','aktif',$contract));}
catch(RuntimeException){$institutionBlocked=true;}
ok_169($institutionBlocked,'institution must become immutable after any payment history.');
ok_169((int)$pdo->query("SELECT kurum_id FROM kurum_sozlesmeleri WHERE id={$contract}")->fetchColumn()===10,
    'blocked institution edit must leave contract institution unchanged.');

$currencyBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1000','USD','aktif',$contract));}
catch(RuntimeException){$currencyBlocked=true;}
ok_169($currencyBlocked,'currency must become immutable after any payment history.');

$cancelBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1000','TRY','iptal',$contract));}
catch(RuntimeException){$cancelBlocked=true;}
ok_169($cancelBlocked,'contract with active payments must not be cancelled.');

$draftBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1000','TRY','taslak',$contract));}
catch(RuntimeException){$draftBlocked=true;}
ok_169($draftBlocked,'contract with payment history must not return to draft.');

tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','500','TRY','aktif',$contract));
$status=(string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contract}")->fetchColumn();
ok_169($status==='tamamlandi','contract total equal to active paid amount must normalize to completed.');

tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1200','TRY','tamamlandi',$contract));
$status=(string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contract}")->fetchColumn();
ok_169($status==='aktif','raising total above active paid amount must reopen completed contract.');

tf_cancel_payment($pdo,$actor,$p1,'Test iptal 1');
tf_cancel_payment($pdo,$actor,$p2,'Test iptal 2');
ok_169(tf_contract_paid($pdo,$contract)==='0.00','all cancelled payments must leave zero active paid amount.');

$historyInstitutionBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(20,'IA-HARD-001','1200','TRY','aktif',$contract));}
catch(RuntimeException){$historyInstitutionBlocked=true;}
ok_169($historyInstitutionBlocked,'cancelled payment history must still lock institution ownership.');

$historyDraftBlocked=false;
try{tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1200','TRY','taslak',$contract));}
catch(RuntimeException){$historyDraftBlocked=true;}
ok_169($historyDraftBlocked,'cancelled payment history must still prevent draft regression.');

tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-001','1200','TRY','iptal',$contract));
$status=(string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contract}")->fetchColumn();
ok_169($status==='iptal','contract may be cancelled after all active payments are cancelled.');
ok_169(tf_financial_summary($pdo)===[],'cancelled contract must be excluded from commercial summary.');

$legacy=tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-002','2000','USD','aktif'));
$pdo->prepare("INSERT INTO kurum_tahsilatlari
    (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,durum)
    VALUES (?,?,CURDATE(),100,'USD','havale','aktif')")->execute([$legacy,20]);

$cancelledLegacy=tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-003','500','TRY','aktif'));
$pdo->exec("UPDATE kurum_sozlesmeleri SET durum='iptal' WHERE id={$cancelledLegacy}");
$pdo->prepare("INSERT INTO kurum_tahsilatlari
    (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,durum)
    VALUES (?,?,CURDATE(),100,'TRY','nakit','aktif')")->execute([$cancelledLegacy,10]);

$statusLegacy=tf_save_contract($pdo,$actor,contract_input_169(10,'IA-HARD-004','700','TRY','aktif'));
$pdo->prepare("INSERT INTO kurum_tahsilatlari
    (sozlesme_id,kurum_id,tahsilat_tarihi,tutar,para_birimi,odeme_yontemi,durum)
    VALUES (?,?,CURDATE(),700,'TRY','havale','aktif')")->execute([$statusLegacy,10]);

$paymentRows=tf_payment_rows($pdo,100);
$legacyRows=array_values(array_filter($paymentRows,static fn(array $row):bool=>(int)$row['sozlesme_id']===$legacy));
ok_169(count($legacyRows)===1,'legacy mismatched payment must remain visible in payment history.');
ok_169((int)$legacyRows[0]['kurum_tutarsiz']===1,'legacy mismatched payment must be explicitly flagged.');

$issues=tf_integrity_issues($pdo);
$byCode=[];
foreach($issues as $issue)$byCode[(string)$issue['kod']]=$issue;
ok_169(isset($byCode['payment_institution_mismatch']) && (int)$byCode['payment_institution_mismatch']['adet']===1,
    'integrity scanner must flag legacy institution/payment mismatch.');
ok_169(isset($byCode['cancelled_contract_active_payment']) && (int)$byCode['cancelled_contract_active_payment']['adet']===1,
    'integrity scanner must flag cancelled contract with active payment.');
ok_169(isset($byCode['contract_status_balance_mismatch']) && (int)$byCode['contract_status_balance_mismatch']['adet']>=1,
    'integrity scanner must flag balance/status inconsistency.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: finance summary aggregation, history immutability, cancellation guard and legacy integrity detection\n";
