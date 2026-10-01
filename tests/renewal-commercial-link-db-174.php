<?php
declare(strict_types=1);

function fail_174(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_174(bool $condition,string $message): void { if(!$condition) fail_174($message); }

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
}catch(Throwable $e){ fail_174('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
require __DIR__.'/../src/lisans_yenileme.php';
require __DIR__.'/../src/lisans_yenileme_ticari.php';

$tables=[
    'lisans_yenileme_sozlesmeleri',
    'kurum_tahsilatlari','kurum_sozlesmeleri',
    'kurum_lisans_yenileme_gecmisi','kurum_lisans_yenilemeleri',
    'kurum_lisans_gecmisi','kurum_lisanslari','paketler',
    'kullanicilar','kurumlar'
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
    aciklama VARCHAR(1000) NULL,
    ogrenci_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    ogretmen_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    veli_limiti INT UNSIGNED NOT NULL DEFAULT 0,
    ai_aylik_kota INT UNSIGNED NOT NULL DEFAULT 0,
    aylik_fiyat DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    para_birimi CHAR(3) NOT NULL DEFAULT 'TRY',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisanslari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    paket_id BIGINT UNSIGNED NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
    notlar VARCHAR(2000) NULL,
    PRIMARY KEY(id),
    UNIQUE KEY uk_kurum_lisans(kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisans_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    islem VARCHAR(40) NOT NULL,
    eski_paket_id BIGINT UNSIGNED NULL,
    yeni_paket_id BIGINT UNSIGNED NULL,
    eski_durum VARCHAR(20) NULL,
    yeni_durum VARCHAR(20) NULL,
    eski_baslangic_tarihi DATE NULL,
    yeni_baslangic_tarihi DATE NULL,
    eski_bitis_tarihi DATE NULL,
    yeni_bitis_tarihi DATE NULL,
    eski_not_hash CHAR(64) NULL,
    yeni_not_hash CHAR(64) NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    aciklama VARCHAR(500) NULL,
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
    PRIMARY KEY(id),
    UNIQUE KEY uk_lisans_yenileme_donem(lisans_id,hedef_bitis_tarihi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisans_yenileme_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    yenileme_id BIGINT UNSIGNED NOT NULL,
    lisans_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    not_metni VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1,'Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','Kurum A',1),(20,'b','Kurum B',1),(30,'c','Kurum C',1)");
$pdo->exec("INSERT INTO paketler(id,kod,ad,aylik_fiyat,para_birimi,aktif) VALUES
    (1,'pro','Pro Paket',1000,'TRY',1),(2,'plus','Plus Paket',2000,'TRY',1)");

$today=new DateTimeImmutable('today');
$oldEnd=$today->modify('+10 days')->format('Y-m-d');
$newEnd=$today->modify('+375 days')->format('Y-m-d');

$stmt=$pdo->prepare("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum)
    VALUES (10,2,CURDATE(),?,'aktif')");
$stmt->execute([$newEnd]);
$licenseId=(int)$pdo->lastInsertId();

$stmt=$pdo->prepare("INSERT INTO kurum_lisans_yenilemeleri
    (lisans_id,kurum_id,hedef_bitis_tarihi,durum,sonuc_paket_id,sonuc_bitis_tarihi,kapanma_tarihi)
    VALUES (?,10,?,'yenilendi',2,?,NOW())");
$stmt->execute([$licenseId,$oldEnd,$newEnd]);
$renewalId=(int)$pdo->lastInsertId();

$actor=['id'=>1,'role'=>'super_admin'];

ok_174(lyt_contract_start_date($oldEnd)===$today->modify('+11 days')->format('Y-m-d'),
    'contract start must be the day after prior license end.');

$gap=lyt_gap_summary($pdo);
ok_174((int)$gap['sozlesme_yok']===1,'renewed case without contract must be visible as commercial gap.');

$nonRenewedStmt=$pdo->prepare("INSERT INTO kurum_lisans_yenilemeleri
    (lisans_id,kurum_id,hedef_bitis_tarihi,durum,kapanma_tarihi)
    VALUES (?,10,?,'yenilenmedi',NOW())");
$nonRenewedStmt->execute([$licenseId,$today->modify('+5 days')->format('Y-m-d')]);
$nonRenewedId=(int)$pdo->lastInsertId();

$blocked=false;
try{
    lyt_create_contract_draft($pdo,$actor,$nonRenewedId,[
        'sozlesme_no'=>'IA-BLOCK-001','toplam_tutar'=>'1000','para_birimi'=>'TRY','vade_tarihi'=>''
    ]);
}catch(RuntimeException){$blocked=true;}
ok_174($blocked,'non-renewed case must not create a commercial contract.');

$contractId=lyt_create_contract_draft($pdo,$actor,$renewalId,[
    'sozlesme_no'=>'IA-YEN-001',
    'toplam_tutar'=>'12000',
    'para_birimi'=>'TRY',
    'vade_tarihi'=>$today->modify('+20 days')->format('Y-m-d'),
    'notlar'=>'Yıllık yenileme sözleşmesi'
]);
ok_174($contractId>0,'renewal contract draft should be created.');
ok_174((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()===1,
    'commercial draft must create exactly one contract.');
ok_174((int)$pdo->query("SELECT COUNT(*) FROM lisans_yenileme_sozlesmeleri WHERE yenileme_id={$renewalId}")->fetchColumn()===1,
    'renewal/contract mapping must be created.');
ok_174((string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()==='taslak',
    'renewal-created contract must start as draft.');
ok_174((int)$pdo->query("SELECT paket_id FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()===2,
    'renewal contract must use renewed package.');
ok_174((string)$pdo->query("SELECT baslangic_tarihi FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()
    ===$today->modify('+11 days')->format('Y-m-d'),
    'renewal contract must start after prior license end.');
ok_174((string)$pdo->query("SELECT bitis_tarihi FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()===$newEnd,
    'renewal contract must end at renewed license end.');
ok_174((int)$pdo->query("SELECT COUNT(*) FROM kurum_lisans_yenileme_gecmisi
    WHERE yenileme_id={$renewalId} AND tur='ticari' AND kod='sozlesme_taslak'")->fetchColumn()===1,
    'commercial draft creation must be appended to renewal history.');

$duplicateBlocked=false;
try{
    lyt_create_contract_draft($pdo,$actor,$renewalId,[
        'sozlesme_no'=>'IA-YEN-002','toplam_tutar'=>'13000','para_birimi'=>'TRY','vade_tarihi'=>''
    ]);
}catch(RuntimeException){$duplicateBlocked=true;}
ok_174($duplicateBlocked,'one renewal case must not create a second linked contract.');
ok_174((int)$pdo->query("SELECT COUNT(*) FROM kurum_sozlesmeleri")->fetchColumn()===1,
    'failed duplicate link attempt must not leave an orphan contract.');

$relation=lyt_contract_relation($pdo,$renewalId);
ok_174(is_array($relation) && (int)$relation['sozlesme_id']===$contractId,
    'renewal relation query must resolve linked contract.');
ok_174((string)$relation['tahsil_edilen']==='0.00','draft relation should begin with zero collection.');

$gap=lyt_gap_summary($pdo);
ok_174((int)$gap['sozlesme_taslak']===1 && (int)$gap['sozlesme_yok']===0,
    'linked draft must move gap from contract-missing to draft.');

tf_save_contract($pdo,$actor,[
    'sozlesme_id'=>$contractId,
    'kurum_id'=>10,
    'paket_id'=>2,
    'sozlesme_no'=>'IA-YEN-001',
    'baslangic_tarihi'=>$today->modify('+11 days')->format('Y-m-d'),
    'bitis_tarihi'=>$newEnd,
    'vade_tarihi'=>$today->modify('+20 days')->format('Y-m-d'),
    'toplam_tutar'=>'12000',
    'para_birimi'=>'TRY',
    'durum'=>'aktif',
    'notlar'=>'Yıllık yenileme sözleşmesi'
]);

$gap=lyt_gap_summary($pdo);
ok_174((int)$gap['tahsilat_yok']===1,'active linked contract with no payment must be visible.');

$p1=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contractId,
    'tahsilat_tarihi'=>$today->format('Y-m-d'),
    'tutar'=>'3000',
    'odeme_yontemi'=>'havale',
    'referans_no'=>'R-1',
    'notlar'=>'İlk tahsilat'
]);
ok_174($p1>0,'first renewal contract payment should be recorded.');
$gap=lyt_gap_summary($pdo);
ok_174((int)$gap['kismi_tahsilat']===1,'partial renewal collection must be visible.');

$revenue=lyt_revenue_summary($pdo);
ok_174(count($revenue)===1 && (string)$revenue[0]['para_birimi']==='TRY','renewal revenue summary must group by currency.');
ok_174((string)$revenue[0]['sozlesme_toplami']==='12000.00','renewal revenue summary contract total mismatch.');
ok_174((string)$revenue[0]['tahsil_edilen']==='3000.00','renewal revenue summary paid total mismatch.');
ok_174((string)$revenue[0]['kalan_tutar']==='9000.00','renewal revenue summary remaining total mismatch.');

$p2=tf_record_payment($pdo,$actor,[
    'sozlesme_id'=>$contractId,
    'tahsilat_tarihi'=>$today->format('Y-m-d'),
    'tutar'=>'9000',
    'odeme_yontemi'=>'havale',
    'referans_no'=>'R-2',
    'notlar'=>'Kapanış tahsilatı'
]);
ok_174($p2>0,'final renewal contract payment should be recorded.');
$gap=lyt_gap_summary($pdo);
ok_174((int)$gap['tamam']===1,'fully collected renewal contract must be commercially complete.');
ok_174((string)$pdo->query("SELECT durum FROM kurum_sozlesmeleri WHERE id={$contractId}")->fetchColumn()==='tamamlandi',
    'full renewal payment must normalize contract status to completed.');

$links=lyt_contract_links($pdo,[$contractId,99999]);
ok_174(isset($links[$contractId]) && (int)$links[$contractId]['yenileme_id']===$renewalId,
    'finance contract lineage map must resolve renewal id.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: renewal contract draft, one-to-one mapping, gap states, collections and renewal revenue summary\n";
