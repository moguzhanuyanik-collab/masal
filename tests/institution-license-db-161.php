<?php
declare(strict_types=1);

function fail_161(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_161(bool $condition,string $message): void { if(!$condition) fail_161($message); }

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
}catch(Throwable $e){ fail_161('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_lisanslari.php';

foreach(['kurum_lisanslari','paketler','kurum_kullanicilari','kurumlar'] as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE paketler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
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
    PRIMARY KEY(id),
    UNIQUE KEY uk_paket_kod(kod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_lisanslari (
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

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (10,'a','A Okulu',1),(20,'b','B Okulu',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,101,'ogrenci',1),(10,201,'ogretmen',1),(20,301,'ogrenci',1)");

$actor=['id'=>999];
$packageId=kl_save_package($pdo,$actor,[
    'ad'=>'Başlangıç',
    'kod'=>'baslangic',
    'ogrenci_limiti'=>1,
    'ogretmen_limiti'=>1,
    'veli_limiti'=>2,
    'ai_aylik_kota'=>100,
    'aylik_fiyat'=>'999,90',
    'para_birimi'=>'TRY',
]);
ok_161($packageId>0,'paket oluşturulmalı.');

kl_save_license($pdo,$actor,[
    'kurum_id'=>10,
    'paket_id'=>$packageId,
    'durum'=>'aktif',
    'baslangic_tarihi'=>'2026-01-01',
    'bitis_tarihi'=>'2027-12-31',
    'notlar'=>'Yıllık sözleşme',
]);

$license=kl_active_license($pdo,10);
ok_161(is_array($license),'aktif kurum lisansı bulunmalı.');
ok_161((int)$license['ogrenci_limiti']===1,'öğrenci limiti paket değerinden gelmeli.');
ok_161((int)$license['ai_aylik_kota']===100,'AI kotası paket değerinden gelmeli.');

$blocked=false;
try{ kl_assert_member_capacity($pdo,10,'ogrenci'); }catch(RuntimeException){ $blocked=true; }
ok_161($blocked,'öğrenci limiti dolu kurumda yeni öğrenci engellenmeli.');

$teacherBlocked=false;
try{ kl_assert_member_capacity($pdo,10,'ogretmen'); }catch(RuntimeException){ $teacherBlocked=true; }
ok_161($teacherBlocked,'öğretmen limiti dolu kurumda yeni öğretmen engellenmeli.');

$parentAllowed=true;
try{ kl_assert_member_capacity($pdo,10,'veli'); }catch(RuntimeException){ $parentAllowed=false; }
ok_161($parentAllowed,'veli limiti dolu değilse eklemeye izin verilmeli.');

$noLicenseAllowed=true;
try{ kl_assert_member_capacity($pdo,20,'ogrenci'); }catch(RuntimeException){ $noLicenseAllowed=false; }
ok_161($noLicenseAllowed,'lisansı olmayan kurum geriye uyumluluk için sınırsız çalışmalı.');

$pdo->exec("UPDATE kurum_lisanslari SET durum='askida' WHERE kurum_id=10");
$suspendedAllowed=true;
try{ kl_assert_member_capacity($pdo,10,'ogrenci'); }catch(RuntimeException){ $suspendedAllowed=false; }
ok_161($suspendedAllowed,'askıdaki lisans kapasite guardı ile mevcut sistemi kilitlememeli.');

kl_save_license($pdo,$actor,[
    'kurum_id'=>10,
    'paket_id'=>$packageId,
    'durum'=>'deneme',
    'baslangic_tarihi'=>'2026-01-01',
    'bitis_tarihi'=>'2027-12-31',
    'notlar'=>'Deneme',
]);
$count=(int)$pdo->query("SELECT COUNT(*) FROM kurum_lisanslari WHERE kurum_id=10")->fetchColumn();
ok_161($count===1,'aynı kurum için ikinci lisans satırı oluşmamalı; mevcut lisans güncellenmeli.');

$rows=kl_license_rows($pdo);
ok_161(count($rows)===1,'lisans listesi tek kurum satırı göstermeli.');
ok_161((int)$rows[0]['ogrenci_sayisi']===1,'lisans listesi mevcut öğrenci kullanımını göstermeli.');

foreach(['kurum_lisanslari','paketler','kurum_kullanicilari','kurumlar'] as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: package/license persistence, tenant capacity and backward compatibility\n";
