<?php
declare(strict_types=1);

function fail_180(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_180(bool $condition,string $message): void { if(!$condition) fail_180($message); }

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
}catch(Throwable $e){ fail_180('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function kl_validate_date(string $value,bool $required=false): ?string {
    $value=trim($value);
    if($value===''){
        if($required) throw new RuntimeException('Tarih zorunlu.');
        return null;
    }
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value) throw new RuntimeException('Tarih geçersiz.');
    return $value;
}

require __DIR__.'/../src/ticari_finans.php';
require __DIR__.'/../src/ticari_taksit.php';
require __DIR__.'/../src/tahsilat_risk.php';

$tables=[
    'ticari_tahsilat_takip_gecmisi','ticari_tahsilat_takipleri',
    'kurum_sozlesme_taksit_gecmisi','kurum_sozlesme_taksitleri','kurum_sozlesme_taksit_planlari',
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

$pdo->exec("CREATE TABLE kurum_sozlesme_taksit_planlari(
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'taslak',
    aktif_surum INT UNSIGNED NOT NULL DEFAULT 1,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_taksit_surum_sira(sozlesme_id,surum_no,sira_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sozlesme_taksit_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    surum_no INT UNSIGNED NULL,
    not_metni VARCHAR(2000) NULL,
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1,'Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aktif) VALUES (1,'pro','Pro Paket',1)");

$today=new DateTimeImmutable('today');
$start=$today->modify('-30 days')->format('Y-m-d');
$contractDue=$today->modify('+365 days')->format('Y-m-d');
$stmt=$pdo->prepare("INSERT INTO kurum_sozlesmeleri
    (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,bitis_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
    VALUES (10,1,'TP-001',?,DATE_ADD(CURDATE(),INTERVAL 1 YEAR),?,1200,'TRY','aktif')");
$stmt->execute([$start,$contractDue]);
$contractId=(int)$pdo->lastInsertId();

$actor=['id'=>1,'role'=>'super_admin'];

$input1=[
    'taksit_vade'=>[
        $today->modify('-10 days')->format('Y-m-d'),
        $today->modify('+10 days')->format('Y-m-d'),
        $today->modify('+30 days')->format('Y-m-d'),
    ],
    'taksit_tutar'=>['400','400','400'],
    'taksit_aciklama'=>['İlk','İkinci','Üçüncü'],
];

$v1=tp_save_plan($pdo,$actor,$contractId,$input1);
ok_180($v1===1,'first plan version must be 1.');
$plan=tp_plan_row($pdo,$contractId);
ok_180(is_array($plan) && (string)$plan['durum']==='taslak','saved plan must begin as draft.');
ok_180(count(tp_current_rows($pdo,$contractId))===3,'draft must contain three installments.');

tp_activate_plan($pdo,$actor,$contractId);
$plan=tp_plan_row($pdo,$contractId);
ok_180((string)$plan['durum']==='aktif','plan must activate.');

$state=tp_schedule_state($pdo,$contractId);
ok_180(is_array($state),'active plan state missing.');
ok_180((string)$state['sonraki_vade']===$today->modify('-10 days')->format('Y-m-d'),
    'first unpaid installment must be next due.');
ok_180((string)$state['gecikmis_tutar']==='400.00','first overdue installment amount mismatch.');
ok_180((string)$state['kalan_plan']==='1200.00','initial plan remaining mismatch.');

$input2=[
    'taksit_vade'=>[
        $today->modify('-5 days')->format('Y-m-d'),
        $today->modify('+15 days')->format('Y-m-d'),
        $today->modify('+35 days')->format('Y-m-d'),
    ],
    'taksit_tutar'=>['300','400','500'],
    'taksit_aciklama'=>['Revize 1','Revize 2','Revize 3'],
];
$v2=tp_save_plan($pdo,$actor,$contractId,$input2);
ok_180($v2===2,'second plan revision must create version 2.');
ok_180((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesme_taksitleri WHERE sozlesme_id={$contractId} AND surum_no=1")->fetchColumn()===3,
    'version 1 installments must remain for audit.');
ok_180((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesme_taksitleri WHERE sozlesme_id={$contractId} AND surum_no=2")->fetchColumn()===3,
    'version 2 installments missing.');
ok_180((string)$pdo->query("SELECT durum FROM kurum_sozlesme_taksit_planlari WHERE sozlesme_id={$contractId}")->fetchColumn()==='taslak',
    'saving a new revision must return plan to draft.');
tp_activate_plan($pdo,$actor,$contractId);

$driftBlocked=false;
try{
    tf_save_contract($pdo,$actor,[
        'sozlesme_id'=>$contractId,'kurum_id'=>10,'paket_id'=>1,'sozlesme_no'=>'TP-001',
        'baslangic_tarihi'=>$start,'bitis_tarihi'=>$today->modify('+1 year')->format('Y-m-d'),
        'vade_tarihi'=>$contractDue,'toplam_tutar'=>'1300','para_birimi'=>'TRY','durum'=>'aktif','notlar'=>''
    ]);
}catch(RuntimeException){$driftBlocked=true;}
ok_180($driftBlocked,'active plan must block contract total drift.');

$sync=tr_sync_cases($pdo,$actor);
ok_180((int)$sync['created']===1,'overdue installment must create risk case even when contract master due is far future.');
$risk=tr_contract_financial_state($pdo,$contractId,false);
ok_180(!empty($risk['taksit_plani_aktif']),'risk financial state must detect active installment plan.');
ok_180((string)$risk['vade_tarihi']===$today->modify('-5 days')->format('Y-m-d'),
    'risk due date must resolve to first unpaid installment.');
ok_180((string)$risk['taksit_gecikmis_tutar']==='300.00','risk overdue installment amount mismatch.');

$paymentId=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contractId,'tahsilat_tarihi'=>$today->format('Y-m-d'),
    'tutar'=>'300','odeme_yontemi'=>'havale','referans_no'=>'TP-P1','notlar'=>'İlk taksit'
]);
ok_180($paymentId>0,'first installment payment failed.');
$state=tp_schedule_state($pdo,$contractId);
ok_180((string)$state['sonraki_vade']===$today->modify('+15 days')->format('Y-m-d'),
    'FIFO allocation must move next due after first installment is paid.');
ok_180((string)$state['gecikmis_tutar']==='0.00','paid overdue installment must clear plan overdue amount.');
ok_180((string)$state['kalan_plan']==='900.00','remaining plan amount after payment mismatch.');

$editBlocked=false;
try{tp_save_plan($pdo,$actor,$contractId,$input2);}catch(RuntimeException){$editBlocked=true;}
ok_180($editBlocked,'payment history must permanently lock structural plan edits.');

$deactivateBlocked=false;
try{tp_deactivate_plan($pdo,$actor,$contractId);}catch(RuntimeException){$deactivateBlocked=true;}
ok_180($deactivateBlocked,'active payment must block plan deactivation.');

tf_cancel_payment($pdo,$actor,$paymentId,'İade/yanlış tahsilat.');
$state=tp_schedule_state($pdo,$contractId);
ok_180((string)$state['sonraki_vade']===$today->modify('-5 days')->format('Y-m-d'),
    'cancelled payment must restore FIFO unpaid first installment.');

tp_deactivate_plan($pdo,$actor,$contractId);
$plan=tp_plan_row($pdo,$contractId);
ok_180((string)$plan['durum']==='pasif','plan must deactivate after active payments are cleared.');
ok_180((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesme_taksitleri WHERE sozlesme_id={$contractId}")->fetchColumn()===6,
    'plan deactivation must not delete versioned installments.');
ok_180((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesme_taksit_gecmisi WHERE sozlesme_id={$contractId} AND kod='plan_pasif'")->fetchColumn()===1,
    'plan deactivation must remain in append-only history.');

tf_save_contract($pdo,$actor,[
    'sozlesme_id'=>$contractId,'kurum_id'=>10,'paket_id'=>1,'sozlesme_no'=>'TP-001',
    'baslangic_tarihi'=>$start,'bitis_tarihi'=>$today->modify('+1 year')->format('Y-m-d'),
    'vade_tarihi'=>$contractDue,'toplam_tutar'=>'1200','para_birimi'=>'TRY','durum'=>'iptal','notlar'=>''
]);
ok_180((string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()==='iptal',
    'contract cancellation must be possible after active payments are cancelled and plan deactivated.');

$badTotal=false;
$contract2=$pdo->exec("INSERT INTO kurum_sozlesmeleri
    (kurum_id,paket_id,sozlesme_no,baslangic_tarihi,vade_tarihi,toplam_tutar,para_birimi,durum)
    VALUES (20,1,'TP-002',CURDATE(),DATE_ADD(CURDATE(),INTERVAL 1 YEAR),1000,'TRY','aktif')");
$contract2Id=(int)$pdo->lastInsertId();
try{
    tp_save_plan($pdo,$actor,$contract2Id,[
        'taksit_vade'=>[$today->modify('+10 days')->format('Y-m-d'),$today->modify('+20 days')->format('Y-m-d')],
        'taksit_tutar'=>['400','500'],
        'taksit_aciklama'=>['A','B'],
    ]);
}catch(RuntimeException){$badTotal=true;}
ok_180($badTotal,'plan total mismatch must be rejected.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: versioned installment plans, FIFO allocation, contract drift guard, risk due override and safe deactivation\n";
