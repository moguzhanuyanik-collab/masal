<?php
declare(strict_types=1);

function fail_131(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_131(bool $condition,string $message): void { if(!$condition) fail_131($message); }

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
}catch(Throwable $e){ fail_131('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

require_once __DIR__.'/../src/updater.php';

foreach(['sistem_migrations','adimbot_rate_limitleri','kurum_kullanicilari','veli_ogrenci','ogretmen_ogrenci','kurumlar'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

$pdo->exec('CREATE TABLE sistem_migrations (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    migration VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uq_migration(migration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE adimbot_rate_limitleri (
    kanal VARCHAR(16) NOT NULL,
    kapsam VARCHAR(16) NOT NULL,
    kapsam_hash CHAR(64) NOT NULL,
    deneme_sayisi SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    pencere_baslangici DATETIME NOT NULL,
    engel_bitis DATETIME NULL,
    son_deneme DATETIME NOT NULL,
    PRIMARY KEY(kanal,kapsam,kapsam_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE veli_ogrenci (
    veli_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(veli_id,ogrenci_id,kurum_id),
    KEY ix_veli_ogrenci_kurum(kurum_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE ogretmen_ogrenci (
    ogretmen_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id),
    KEY ix_ogretmen_ogrenci_kurum(kurum_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec("INSERT INTO sistem_migrations(migration) VALUES
    ('064_adimbot_rate_limit_ve_migration_checkpoint'),
    ('065_kurum_bazli_eslestirme_izolasyonu'),
    ('066_kurum_eslestirme_schema_guard')");

$root=dirname(__DIR__);
$versionData=json_decode((string)file_get_contents($root.'/version.json'),true);
$remote=[
    'version'=>is_array($versionData)?(string)($versionData['version']??''):'',
    'release_revision'=>is_array($versionData)?(int)($versionData['release_revision']??1):1,
    'name'=>'direct recovery test',
];


assert_recovered_release_postconditions($pdo,$root,$root,$remote);

$pdo->exec("DELETE FROM sistem_migrations WHERE migration='066_kurum_eslestirme_schema_guard'");
$failed=false;
try{ assert_recovered_release_postconditions($pdo,$root,$root,$remote); }catch(Throwable){ $failed=true; }
ok_131($failed,'Eksik 066 checkpointi recovery postcondition tarafından yakalanmadı.');

$pdo->exec("INSERT INTO sistem_migrations(migration) VALUES ('066_kurum_eslestirme_schema_guard')");
assert_recovered_release_postconditions($pdo,$root,$root,$remote);

foreach(['sistem_migrations','adimbot_rate_limitleri','kurum_kullanicilari','veli_ogrenci','ogretmen_ogrenci','kurumlar'] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

echo "PASS: historical recovery release postcondition 1.2.1+ contract\n";
