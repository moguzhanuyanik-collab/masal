<?php
declare(strict_types=1);

function fail_163(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_163(bool $condition,string $message): void { if(!$condition) fail_163($message); }

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
}catch(Throwable $e){ fail_163('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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

$tables=['kurum_tahsilatlari','kurum_sozlesmeleri','kurum_lisanslari','paketler','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE paketler (
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(120) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisanslari (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    paket_id BIGINT UNSIGNED NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sozlesmeleri (
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

$pdo->exec("CREATE TABLE kurum_tahsilatlari (
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
$pdo->exec("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum)
    VALUES (10,1,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 10 DAY),'aktif'),
           (20,1,CURDATE(),DATE_SUB(CURDATE(),INTERVAL 3 DAY),'aktif')");

$actor=['id'=>999];
$contractId=tf_save_contract($pdo,$actor,[
    'kurum_id'=>10,
    'paket_id'=>1,
    'sozlesme_no'=>'IA-TEST-001',
    'baslangic_tarihi'=>date('Y-m-d'),
    'bitis_tarihi'=>date('Y-m-d',strtotime('+1 year')),
    'vade_tarihi'=>date('Y-m-d',strtotime('+30 days')),
    'toplam_tutar'=>'1000,00',
    'para_birimi'=>'TRY',
    'durum'=>'aktif',
    'notlar'=>'Test',
]);
ok_163($contractId>0,'sözleşme oluşturulmalı.');

$p1=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contractId,
    'tahsilat_tarihi'=>date('Y-m-d'),
    'tutar'=>'400,00',
    'odeme_yontemi'=>'havale',
    'referans_no'=>'R1',
]);
ok_163($p1>0,'ilk tahsilat oluşmalı.');
ok_163(tf_contract_paid($pdo,$contractId)==='400.00','ilk tahsilat toplamı 400 olmalı.');

$over=false;
try{
    tf_record_payment($pdo,$actor,[
        'sozlesme_id'=>$contractId,
        'tahsilat_tarihi'=>date('Y-m-d'),
        'tutar'=>'700,00',
        'odeme_yontemi'=>'nakit',
    ]);
}catch(RuntimeException){$over=true;}
ok_163($over,'kalan tutarı aşan tahsilat engellenmeli.');
ok_163(tf_contract_paid($pdo,$contractId)==='400.00','reddedilen tahsilat toplamı değiştirmemeli.');

$p2=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contractId,
    'tahsilat_tarihi'=>date('Y-m-d'),
    'tutar'=>'600,00',
    'odeme_yontemi'=>'kredi_karti',
    'referans_no'=>'R2',
]);
ok_163(tf_contract_paid($pdo,$contractId)==='1000.00','tam tahsilat toplamı 1000 olmalı.');
$status=(string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn();
ok_163($status==='tamamlandi','tam ödenen sözleşme tamamlandı durumuna geçmeli.');

$belowPaid=false;
try{
    tf_save_contract($pdo,$actor,[
        'sozlesme_id'=>$contractId,
        'kurum_id'=>10,'paket_id'=>1,'sozlesme_no'=>'IA-TEST-001',
        'baslangic_tarihi'=>date('Y-m-d'),'bitis_tarihi'=>'','vade_tarihi'=>'',
        'toplam_tutar'=>'900','para_birimi'=>'TRY','durum'=>'aktif'
    ]);
}catch(RuntimeException){$belowPaid=true;}
ok_163($belowPaid,'sözleşme tutarı tahsil edilen toplamın altına indirilememeli.');

$currencyChange=false;
try{
    tf_save_contract($pdo,$actor,[
        'sozlesme_id'=>$contractId,
        'kurum_id'=>10,'paket_id'=>1,'sozlesme_no'=>'IA-TEST-001',
        'baslangic_tarihi'=>date('Y-m-d'),'bitis_tarihi'=>'','vade_tarihi'=>'',
        'toplam_tutar'=>'1000','para_birimi'=>'USD','durum'=>'tamamlandi'
    ]);
}catch(RuntimeException){$currencyChange=true;}
ok_163($currencyChange,'tahsilatı olan sözleşmenin para birimi değişmemeli.');

tf_cancel_payment($pdo,$actor,$p2,'Kart işlemi iptal edildi');
ok_163(tf_contract_paid($pdo,$contractId)==='400.00','iptal edilen tahsilat toplamdan düşmeli.');
$status=(string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn();
ok_163($status==='aktif','tahsilat iptalinden sonra bakiye varsa sözleşme yeniden aktif olmalı.');
$paymentState=$pdo->query("SELECT durum,iptal_nedeni FROM kurum_tahsilatlari WHERE id={$p2}")->fetch(PDO::FETCH_ASSOC);
ok_163((string)$paymentState['durum']==='iptal','tahsilat fiziksel silinmek yerine iptal edilmeli.');
ok_163((string)$paymentState['iptal_nedeni']==='Kart işlemi iptal edildi','iptal nedeni saklanmalı.');

$rows=tf_contract_rows($pdo);
ok_163(count($rows)===1,'sözleşme listesi bir kayıt dönmeli.');
ok_163((string)$rows[0]['kalan_tutar']==='600.00','sözleşme kalan tutarı 600 olmalı.');

$summary=tf_financial_summary($pdo);
ok_163(count($summary)===1 && (string)$summary[0]['tahsil_edilen']==='400.00','finans özeti aktif tahsilatı göstermeli.');

$renewals=tf_license_renewal_rows($pdo,30);
ok_163(count($renewals)===2,'yenileme radarı yaklaşan ve süresi geçmiş iki lisansı göstermeli.');
ok_163((int)$renewals[0]['kalan_gun']<=(int)$renewals[1]['kalan_gun'],'yenileme radarı tarihe göre sıralanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: commercial contracts, safe payments, cancellation history and renewal radar\n";
