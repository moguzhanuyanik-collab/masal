<?php
declare(strict_types=1);

function fail_162(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_162(bool $condition,string $message): void { if(!$condition) fail_162($message); }

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
}catch(Throwable $e){ fail_162('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/kurum_lisanslari.php';

$tables=['adimbot_ai_kullanimlari','kurum_lisanslari','paketler','kurum_kullanicilari','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

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

$pdo->exec("CREATE TABLE adimbot_ai_kullanimlari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    donem_baslangici DATE NOT NULL,
    kullanim_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
    son_ogrenci_id BIGINT UNSIGNED NULL,
    son_saglayici VARCHAR(20) NULL,
    son_model VARCHAR(120) NULL,
    son_kullanim DATETIME NULL,
    PRIMARY KEY(kurum_id,donem_baslangici)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Okulu',1),(20,'b','B Okulu',1),(30,'c','C Okulu',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,1001,'ogrenci',1),
    (20,2001,'ogrenci',1),
    (10,3001,'ogrenci',1),(20,3001,'ogrenci',1),
    (10,4001,'ogrenci',1),(30,4001,'ogrenci',1)");

$pdo->exec("INSERT INTO paketler(id,kod,ad,ai_aylik_kota,aktif) VALUES
    (1,'iki','İki Hak',2,1),
    (2,'bes','Beş Hak',5,1)");
$pdo->exec("INSERT INTO kurum_lisanslari(kurum_id,paket_id,baslangic_tarihi,bitis_tarihi,durum) VALUES
    (10,1,'2026-01-01','2027-12-31','aktif'),
    (30,2,'2026-01-01','2027-12-31','aktif')");

$r1=kl_ai_quota_reserve($pdo,1001,501,'groq','llama-test');
ok_162(($r1['blocked']??true)===false,'ilk AI kullanımı açık olmalı.');
ok_162((int)$r1['used']===1,'ilk kullanım sayacı 1 olmalı.');
ok_162((int)$r1['remaining']===1,'ilk kullanımdan sonra bir hak kalmalı.');

$r2=kl_ai_quota_reserve($pdo,1001,501,'groq','llama-test');
ok_162(($r2['blocked']??true)===false,'ikinci AI kullanımı açık olmalı.');
ok_162((int)$r2['used']===2,'ikinci kullanım sayacı 2 olmalı.');
ok_162((int)$r2['remaining']===0,'ikinci kullanımdan sonra kota bitmeli.');

$r3=kl_ai_quota_reserve($pdo,1001,501,'groq','llama-test');
ok_162(($r3['blocked']??false)===true,'üçüncü kullanım paket kotası tarafından engellenmeli.');
ok_162((int)$r3['used']===2,'engellenen istek kullanım sayacını artırmamalı.');

$summary=kl_ai_usage_summary($pdo,10);
ok_162((int)$summary['used']===2,'kurum aylık kullanım özeti iki olmalı.');
ok_162((string)$summary['last_provider']==='groq','son sağlayıcı kaydedilmeli.');

$unlicensed=kl_ai_quota_reserve($pdo,2001,601,'openai','test-model');
ok_162(($unlicensed['blocked']??true)===false,'lisansı olmayan kurum AI kullanımında kilitlenmemeli.');
ok_162(($unlicensed['enforced']??true)===false,'lisansı olmayan kurumda kota uygulanmamalı.');
ok_162((int)$unlicensed['used']===1,'lisansı olmayan kurum kullanımı yine izlenmeli.');
ok_162(($unlicensed['remaining']??'x')===null,'sınırsız kullanımda kalan hak null olmalı.');

$singleLicensed=kl_ai_quota_institution($pdo,3001);
ok_162($singleLicensed===10,'çoklu üyelikte yalnız bir aktif lisans varsa o kurum seçilmeli.');

$ambiguous=kl_ai_quota_institution($pdo,4001);
ok_162($ambiguous===null,'birden fazla aktif lisanslı kurum varsa kullanım rastgele kuruma yazılmamalı.');
$ambiguousReserve=kl_ai_quota_reserve($pdo,4001,701,'gemini','gemini-test');
ok_162(($ambiguousReserve['tracked']??true)===false,'belirsiz çoklu kurum kullanımında yanlış kuruma sayaç yazılmamalı.');
ok_162(($ambiguousReserve['blocked']??true)===false,'belirsiz kurum çözümü uygulamayı yanlışlıkla kilitlememeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: AdımBot institution monthly quota, tracking and multi-tenant resolution\n";
