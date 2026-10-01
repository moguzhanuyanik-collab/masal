<?php
declare(strict_types=1);

function fail_125(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_125(bool $condition,string $message): void { if(!$condition) fail_125($message); }

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
}catch(Throwable $e){ fail_125('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

require_once __DIR__.'/../src/updater.php';

foreach(['veli_ogrenci','ogretmen_ogrenci','kurumlar'] as $table){ $pdo->exec("DROP TABLE IF EXISTS {$table}"); }

$pdo->exec('CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
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

$pdo->exec('INSERT INTO kurumlar(aktif) VALUES (1)');
$root=dirname(__DIR__);

validate_tenant_relation_schema_guard($pdo,$root);

$pdo->exec('ALTER TABLE veli_ogrenci DROP PRIMARY KEY, ADD PRIMARY KEY(veli_id,ogrenci_id)');
$failed=false;
try{ validate_tenant_relation_schema_guard($pdo,$root); }catch(Throwable){ $failed=true; }
ok_125($failed,'Bozuk veli_ogrenci primary key guard tarafından yakalanmadı.');

$pdo->exec('ALTER TABLE veli_ogrenci DROP PRIMARY KEY, ADD PRIMARY KEY(veli_id,ogrenci_id,kurum_id)');
validate_tenant_relation_schema_guard($pdo,$root);

$pdo->exec('ALTER TABLE ogretmen_ogrenci DROP KEY ix_ogretmen_ogrenci_kurum');
$failed=false;
try{ validate_tenant_relation_schema_guard($pdo,$root); }catch(Throwable){ $failed=true; }
ok_125($failed,'Eksik öğretmen tenant indexi guard tarafından yakalanmadı.');

$pdo->exec('ALTER TABLE ogretmen_ogrenci ADD KEY ix_ogretmen_ogrenci_kurum(kurum_id,ogrenci_id)');
validate_tenant_relation_schema_guard($pdo,$root);

$pdo->exec('DROP TABLE ogretmen_ogrenci');
$pdo->exec('DROP TABLE veli_ogrenci');
$pdo->exec('DROP TABLE kurumlar');

echo "PASS: legacy recovery tenant schema postcondition guard\n";
