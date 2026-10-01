<?php
declare(strict_types=1);

function fail_166(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_166(bool $condition,string $message): void { if(!$condition) fail_166($message); }

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
}catch(Throwable $e){ fail_166('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

require __DIR__.'/../src/password_reset.php';
require __DIR__.'/../src/mail_settings.php';

$tables=['sifre_sifirlama_guvenlik','sifre_sifirlama_tokenlari','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    sifre_hash VARCHAR(255) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    oturum_surumu INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE sifre_sifirlama_tokenlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) NOT NULL,
    son_kullanma_tarihi DATETIME NOT NULL,
    kullanildi_tarihi DATETIME NULL,
    iptal_tarihi DATETIME NULL,
    talep_ip_hash CHAR(64) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE sifre_sifirlama_guvenlik(
    kapsam VARCHAR(20) NOT NULL,
    kapsam_hash CHAR(64) NOT NULL,
    deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
    pencere_baslangici DATETIME NOT NULL,
    engel_bitis DATETIME NULL,
    son_deneme DATETIME NOT NULL,
    PRIMARY KEY(kapsam,kapsam_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$current=[
    'app'=>['base_url'=>'https://ilkadim.example.com'],
    'mail'=>[
        'transport'=>'smtp',
        'from_email'=>'noreply@ilkadim.example.com',
        'from_name'=>'İlkAdım',
        'smtp'=>[
            'host'=>'smtp.example.com',
            'port'=>587,
            'encryption'=>'tls',
            'username'=>'smtp-user',
            'password'=>'super-secret',
            'timeout_seconds'=>10,
        ],
    ],
];

$candidate=ms_candidate([
    'base_url'=>'https://ilkadim.example.com',
    'transport'=>'smtp',
    'from_email'=>'noreply@ilkadim.example.com',
    'from_name'=>'İlkAdım',
    'smtp_host'=>'smtp.example.com',
    'smtp_port'=>'587',
    'smtp_encryption'=>'tls',
    'smtp_username'=>'smtp-user',
    'smtp_password'=>'',
    'smtp_timeout'=>'10',
],$current);
ok_166((string)$candidate['mail']['smtp']['password']==='super-secret','blank password input must preserve existing SMTP secret.');

$cleared=ms_candidate([
    'base_url'=>'https://ilkadim.example.com',
    'transport'=>'disabled',
    'from_email'=>'noreply@ilkadim.example.com',
    'from_name'=>'İlkAdım',
    'smtp_host'=>'smtp.example.com',
    'smtp_port'=>'587',
    'smtp_encryption'=>'tls',
    'smtp_username'=>'',
    'smtp_password'=>'',
    'smtp_timeout'=>'10',
    'clear_smtp_password'=>'1',
],$current);
ok_166((string)$cleared['mail']['smtp']['password']==='','explicit clear checkbox must remove stored SMTP secret.');

$ready=ms_readiness($pdo,$candidate);
ok_166(($ready['ready']??false)===true,'complete HTTPS + SMTP config should be recovery-ready.');
ok_166(($ready['issues']??[])===[],'ready config should not report issues.');

$http=$candidate;
$http['app']['base_url']='http://example.com';
$httpStatus=ms_readiness($pdo,$http);
ok_166(($httpStatus['ready']??true)===false,'non-local HTTP base URL must not be production-ready.');

$disabled=$candidate;
$disabled['mail']['transport']='disabled';
$disabledStatus=ms_readiness($pdo,$disabled);
ok_166(($disabledStatus['ready']??true)===false,'disabled mail transport must mark recovery incomplete.');

$missingPassword=false;
try{
    ms_candidate([
        'base_url'=>'https://ilkadim.example.com',
        'transport'=>'smtp',
        'from_email'=>'noreply@ilkadim.example.com',
        'from_name'=>'İlkAdım',
        'smtp_host'=>'smtp.example.com',
        'smtp_port'=>'587',
        'smtp_encryption'=>'tls',
        'smtp_username'=>'smtp-user',
        'smtp_password'=>'',
        'smtp_timeout'=>'10',
        'clear_smtp_password'=>'1',
    ],$current);
}catch(RuntimeException){$missingPassword=true;}
ok_166($missingPassword,'SMTP username with cleared password must be rejected.');

ok_166(ms_valid_base_url('https://app.example.com')===true,'valid HTTPS base URL should pass.');
ok_166(ms_valid_base_url('https://user:pass@app.example.com')===false,'base URL credentials must be rejected.');
ok_166(ms_https_ready('http://localhost')===true,'localhost HTTP may be accepted for local development.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: mail settings validation, secret preservation and password recovery readiness\n";
