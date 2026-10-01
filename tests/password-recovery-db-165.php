<?php
declare(strict_types=1);

function fail_165(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_165(bool $condition,string $message): void { if(!$condition) fail_165($message); }

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
}catch(Throwable $e){ fail_165('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

require __DIR__.'/../src/password_reset.php';

$tables=[
    'sifre_sifirlama_guvenlik','sifre_sifirlama_tokenlari',
    'ogrenci_oturum_tokenlari','kullanici_oturum_tokenlari',
    'ogrenciler','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    sifre_hash VARCHAR(255) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    oturum_surumu INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_user_email(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

$pdo->exec("CREATE TABLE ogrenciler(
    id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    sifre_hash VARCHAR(255) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanici_oturum_tokenlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) NOT NULL,
    son_kullanma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenci_oturum_tokenlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) NOT NULL,
    son_kullanma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE sifre_sifirlama_tokenlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    son_kullanma_tarihi DATETIME NOT NULL,
    kullanildi_tarihi DATETIME NULL,
    iptal_tarihi DATETIME NULL,
    talep_ip_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_sifre_token_hash(token_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE sifre_sifirlama_guvenlik(
    kapsam VARCHAR(20) NOT NULL,
    kapsam_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
    pencere_baslangici DATETIME NOT NULL,
    engel_bitis DATETIME NULL,
    son_deneme DATETIME NOT NULL,
    PRIMARY KEY(kapsam,kapsam_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$oldHash=password_hash('EskiSifre123',PASSWORD_DEFAULT);
$pdo->prepare("INSERT INTO kullanicilar(id,email,sifre_hash,aktif,oturum_surumu) VALUES (10,'ogrenci@example.com',?,1,1)")
    ->execute([$oldHash]);
$pdo->prepare("INSERT INTO ogrenciler(id,kullanici_id,sifre_hash) VALUES (101,10,?)")->execute([$oldHash]);
$pdo->exec("INSERT INTO kullanici_oturum_tokenlari(kullanici_id,token_hash,son_kullanma_tarihi)
    VALUES (10,REPEAT('a',64),DATE_ADD(NOW(),INTERVAL 10 DAY))");
$pdo->exec("INSERT INTO ogrenci_oturum_tokenlari(ogrenci_id,token_hash,son_kullanma_tarihi)
    VALUES (101,REPEAT('b',64),DATE_ADD(NOW(),INTERVAL 10 DAY))");

ok_165(pr_rate_consume($pdo,'ogrenci@example.com','127.0.0.1')===true,'1. reset request should be allowed.');
ok_165(pr_rate_consume($pdo,'ogrenci@example.com','127.0.0.1')===true,'2. reset request should be allowed.');
ok_165(pr_rate_consume($pdo,'ogrenci@example.com','127.0.0.1')===true,'3. reset request should be allowed.');
ok_165(pr_rate_consume($pdo,'ogrenci@example.com','127.0.0.1')===false,'4. reset request should be rate limited.');

$raw1=pr_issue_token_for_user($pdo,10,'127.0.0.1');
ok_165((bool)preg_match('/^[a-f0-9]{64}$/D',$raw1),'raw reset token should be 64 hex chars.');
$row1=$pdo->query("SELECT token_hash,iptal_tarihi FROM sifre_sifirlama_tokenlari ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);
ok_165((string)$row1['token_hash']!==$raw1,'raw reset token must never be stored.');
ok_165((string)$row1['token_hash']===hash('sha256',$raw1),'stored reset token must be SHA-256.');
ok_165(pr_token_is_valid($pdo,$raw1)===true,'first token should initially be valid.');

$raw2=pr_issue_token_for_user($pdo,10,'127.0.0.1');
ok_165(pr_token_is_valid($pdo,$raw1)===false,'new reset request must revoke previous token.');
ok_165(pr_token_is_valid($pdo,$raw2)===true,'latest reset token must be valid.');

$userId=pr_reset_password($pdo,$raw2,'YeniSifre456');
ok_165($userId===10,'password reset must return target user id.');

$userRow=$pdo->query("SELECT sifre_hash,oturum_surumu FROM kullanicilar WHERE id=10")->fetch(PDO::FETCH_ASSOC);
ok_165(password_verify('YeniSifre456',(string)$userRow['sifre_hash']),'user password hash must be updated.');
ok_165((int)$userRow['oturum_surumu']===2,'session version must increment after password reset.');

$studentHash=(string)$pdo->query("SELECT sifre_hash FROM ogrenciler WHERE id=101")->fetchColumn();
ok_165(password_verify('YeniSifre456',$studentHash),'linked legacy student password hash must remain synchronized.');

ok_165((int)$pdo->query("SELECT COUNT(*) FROM kullanici_oturum_tokenlari WHERE kullanici_id=10")->fetchColumn()===0,
    'remember-me user tokens must be deleted.');
ok_165((int)$pdo->query("SELECT COUNT(*) FROM ogrenci_oturum_tokenlari WHERE ogrenci_id=101")->fetchColumn()===0,
    'legacy student remember tokens must be deleted.');

$used=(int)$pdo->query("SELECT COUNT(*) FROM sifre_sifirlama_tokenlari WHERE token_hash='".hash('sha256',$raw2)."' AND kullanildi_tarihi IS NOT NULL")->fetchColumn();
ok_165($used===1,'used reset token must be marked consumed.');
ok_165(pr_token_is_valid($pdo,$raw2)===false,'used reset token must no longer validate.');

$reused=false;
try{pr_reset_password($pdo,$raw2,'UcuncuSifre789');}catch(RuntimeException){$reused=true;}
ok_165($reused,'used token must not be reusable.');

$expired=pr_issue_token_for_user($pdo,10,'127.0.0.2');
$expiredHash=hash('sha256',$expired);
$pdo->prepare("UPDATE sifre_sifirlama_tokenlari SET son_kullanma_tarihi=DATE_SUB(NOW(),INTERVAL 1 MINUTE) WHERE token_hash=?")
    ->execute([$expiredHash]);
ok_165(pr_token_is_valid($pdo,$expired)===false,'expired token must not validate.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: password reset token hashing, rate limit, one-time use, password sync and session revocation\n";
