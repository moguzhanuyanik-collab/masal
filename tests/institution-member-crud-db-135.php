<?php
declare(strict_types=1);

function fail_135(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_135(bool $condition,string $message): void { if(!$condition) fail_135($message); }

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
}catch(Throwable $e){ fail_135('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $s=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $s->execute([$table]);
    $ok=(int)$s->fetchColumn()>0;
    $s->closeCursor();
    return $ok;
}
function auth_runtime_column_exists(PDO $pdo,string $table,string $column): bool {
    $s=$pdo->prepare('SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name=?');
    $s->execute([$table,$column]);
    $ok=(int)$s->fetchColumn()>0;
    $s->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_yonetimi.php';
require __DIR__.'/../src/kurumlar_modulu.php';

foreach(['ogrenciler','kurum_kullanicilari','kullanici_rolleri','kullanicilar','kurumlar'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

$pdo->exec("CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(190) NOT NULL DEFAULT 'Kurum',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanicilar (
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    sifre_hash VARCHAR(255) NOT NULL DEFAULT '',
    ad_soyad VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_user_email(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanici_rolleri (
    kullanici_id BIGINT UNSIGNED NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY(kullanici_id,rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    ad VARCHAR(190) NOT NULL,
    email VARCHAR(190) NULL,
    sifre_hash VARCHAR(255) NULL,
    egitim_kademesi VARCHAR(40) NOT NULL DEFAULT 'temel_egitim',
    sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_student_user(kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Test Okulu',1)");
$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif)
    VALUES (100,'eski@example.com','Eski Ad','ogrenci',1)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (100,'ogrenci')");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif)
    VALUES (10,100,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(kullanici_id,ad,email,egitim_kademesi,sinif_seviyesi,aktif)
    VALUES (100,'Eski Ad','eski@example.com','temel_egitim',3,1)");

$actor=['id'=>999];

km_update_member($pdo,$actor,'ogrenci',100,10,[
    'kurum_id'=>10,
    'ad_soyad'=>'Yeni Ad',
    'email'=>'yeni@example.com',
    'sifre'=>'',
    'telefon'=>'',
    'sinif_seviyesi'=>5,
]);

$userRow=$pdo->query('SELECT ad_soyad,email,aktif FROM kullanicilar WHERE id=100')->fetch();
$studentRow=$pdo->query('SELECT ad,email,sinif_seviyesi,aktif FROM ogrenciler WHERE kullanici_id=100')->fetch();
ok_135((string)$userRow['ad_soyad']==='Yeni Ad','kullanıcı adı güncellenmeli.');
ok_135((string)$userRow['email']==='yeni@example.com','kullanıcı e-postası güncellenmeli.');
ok_135((string)$studentRow['ad']==='Yeni Ad','öğrenci profil adı güncellenmeli.');
ok_135((string)$studentRow['email']==='yeni@example.com','öğrenci profil e-postası güncellenmeli.');
ok_135((int)$studentRow['sinif_seviyesi']===5,'öğrenci sınıf seviyesi güncellenmeli.');

$activeRows=ky_role_members($pdo,10,'ogrenci');
ok_135(count($activeRows)===1,'aktif üyelik listede görünmeli.');
ok_135((int)$activeRows[0]['sinif_seviyesi']===5,'rol listesi güncel sınıf seviyesini göstermeli.');

$result=km_delete_member($pdo,$actor,'ogrenci',100,10);
ok_135(($result['account_deactivated']??false)===true,'son aktif kurumdan çıkarılan hesap pasife alınmalı.');

$membershipActive=(int)$pdo->query("SELECT aktif FROM kurum_kullanicilari WHERE kurum_id=10 AND kullanici_id=100 AND kurum_rolu='ogrenci'")->fetchColumn();
$userActive=(int)$pdo->query('SELECT aktif FROM kullanicilar WHERE id=100')->fetchColumn();
$profileActive=(int)$pdo->query('SELECT aktif FROM ogrenciler WHERE kullanici_id=100')->fetchColumn();
ok_135($membershipActive===0,'kurum üyeliği pasif olmalı.');
ok_135($userActive===0,'başka aktif kurum yoksa kullanıcı hesabı pasif olmalı.');
ok_135($profileActive===0,'başka aktif kurum yoksa öğrenci profili pasif olmalı.');
ok_135(count(ky_role_members($pdo,10,'ogrenci'))===0,'varsayılan aktif liste pasif üyeyi göstermemeli.');

$allRows=ky_role_members($pdo,10,'ogrenci',true);
ok_135(count($allRows)===1,'inactive-inclusive liste pasif üyeyi göstermeli.');
ok_135((int)$allRows[0]['uyelik_aktif']===0,'pasif üyelik durumu doğru raporlanmalı.');
ok_135((int)$allRows[0]['kullanici_aktif']===0,'pasif hesap durumu doğru raporlanmalı.');

km_restore_member($pdo,$actor,'ogrenci',100,10);
km_restore_member($pdo,$actor,'ogrenci',100,10);

$membershipActive=(int)$pdo->query("SELECT aktif FROM kurum_kullanicilari WHERE kurum_id=10 AND kullanici_id=100 AND kurum_rolu='ogrenci'")->fetchColumn();
$userActive=(int)$pdo->query('SELECT aktif FROM kullanicilar WHERE id=100')->fetchColumn();
$profileActive=(int)$pdo->query('SELECT aktif FROM ogrenciler WHERE kullanici_id=100')->fetchColumn();
ok_135($membershipActive===1,'restore üyeliği aktifleştirmeli.');
ok_135($userActive===1,'restore kullanıcı hesabını aktifleştirmeli.');
ok_135($profileActive===1,'restore öğrenci profilini aktifleştirmeli.');
ok_135(count(ky_role_members($pdo,10,'ogrenci'))===1,'restore sonrası aktif liste üyeyi tekrar göstermeli.');

foreach(['ogrenciler','kurum_kullanicilari','kullanici_rolleri','kullanicilar','kurumlar'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

echo "PASS: institution member update, safe remove and restore DB integration\n";
