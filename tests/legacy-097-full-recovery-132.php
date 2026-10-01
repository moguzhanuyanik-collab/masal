<?php
declare(strict_types=1);

/**
 * 1.1.97 -> current recovery integration fixture.
 *
 * Bu test gerçek 1.1.97 DB durumunu temsil eden minimal legacy şemayı kurar,
 * 001-063 migration geçmişini tamamlanmış kabul eder ve gerçek
 * run_legacy_1_1_97_to_1_2_1_recovery() fonksiyonunu çalıştırır.
 *
 * Amaç: yalnız source-contract değil; 064 checkpoint + legacy kurum üyeliği
 * dönüşümü + 065 tenant migration + 066 guard zincirinin aynı MariaDB
 * üzerinde uçtan uca tamamlandığını kanıtlamak.
 */

function fail_132(string $message): never {
    fwrite(STDERR,"FAIL: {$message}\n");
    exit(1);
}
function ok_132(bool $condition,string $message): void {
    if(!$condition) fail_132($message);
}

$host=getenv('ILKADIM_DB_HOST') ?: '127.0.0.1';
$port=(int)(getenv('ILKADIM_DB_PORT') ?: 3306);
$name=getenv('ILKADIM_DB_NAME') ?: 'ilkadim_ci';
$user=getenv('ILKADIM_DB_USER') ?: 'root';
$pass=getenv('ILKADIM_DB_PASSWORD') ?: 'root';

try{
    $pdo=new PDO(
        "mysql:host={$host};port={$port};dbname={$name};charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES=>false,
        ]
    );
}catch(Throwable $e){
    fail_132('MariaDB bağlantısı kurulamadı: '.$e->getMessage());
}

require_once __DIR__.'/../src/updater.php';

$tables=[
    'adimbot_rate_limitleri',
    'sistem_migrations',
    'veli_ogrenci',
    'ogretmen_ogrenci',
    'kurum_kullanicilari',
    'kurum_kullanicilari_legacy_197_backup',
    'kurum_kullanicilari_v4_bridge',
    'veliler',
    'ogretmenler',
    'ogrenciler',
    'kullanicilar',
    'kurumlar',
];
foreach($tables as $table){
    $pdo->exec("DROP TABLE IF EXISTS `{$table}`");
}

$pdo->exec('CREATE TABLE sistem_migrations (
    migration VARCHAR(255) NOT NULL,
    PRIMARY KEY(migration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE kullanicilar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE veliler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE ogretmenler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    kurum_rolu VARCHAR(30) NOT NULL DEFAULT '',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    veli_id BIGINT UNSIGNED NULL,
    ogretmen_id BIGINT UNSIGNED NULL,
    ogrenci_id BIGINT UNSIGNED NULL,
    yonetici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec('CREATE TABLE veli_ogrenci (
    veli_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(veli_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('CREATE TABLE ogretmen_ogrenci (
    ogretmen_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(ogretmen_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4');

$pdo->exec('INSERT INTO kurumlar(id,aktif) VALUES (1,1)');
$pdo->exec('INSERT INTO kullanicilar(id) VALUES (100),(200),(300)');
$pdo->exec('INSERT INTO veliler(id,kullanici_id,aktif) VALUES (10,100,1)');
$pdo->exec('INSERT INTO ogretmenler(id,kullanici_id,aktif) VALUES (20,200,1)');
$pdo->exec('INSERT INTO ogrenciler(id,kullanici_id,aktif) VALUES (30,300,1)');

$pdo->exec("INSERT INTO kurum_kullanicilari
    (kurum_id,kullanici_id,kurum_rolu,aktif,veli_id,ogretmen_id,ogrenci_id,yonetici_id,olusturulma_tarihi)
    VALUES
    (1,NULL,'veli',1,10,NULL,NULL,NULL,NOW()),
    (1,NULL,'ogretmen',1,NULL,20,NULL,NULL,NOW()),
    (1,NULL,'ogrenci',1,NULL,NULL,30,NULL,NOW())");

$pdo->exec('INSERT INTO veli_ogrenci(veli_id,ogrenci_id) VALUES (10,30)');
$pdo->exec('INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id) VALUES (20,30)');

/*
 * Gerçek 1.1.97 geçmişi için güncel migration ağacındaki 001-063,
 * retired olmayan kayıtları tamamlanmış kabul et.
 */
$retired=retired_automatic_migrations();
$expected=[];
foreach(glob(dirname(__DIR__).'/database/migrations/*.sql')?:[] as $file){
    $migration=basename($file,'.sql');
    $number=migration_sequence_number($migration);
    if($number>=1 && $number<=63 && !isset($retired[$migration])){
        $expected[$migration]=true;
    }
}
ok_132(count($expected)>0,'001-063 legacy migration fixture oluşturulamadı.');

$insert=$pdo->prepare('INSERT INTO sistem_migrations(migration) VALUES (?)');
foreach(array_keys($expected) as $migration){
    $insert->execute([$migration]);
}
$insert->closeCursor();

$root=dirname(__DIR__);
$applied=run_legacy_1_1_97_to_1_2_1_recovery($pdo,$root,'1.1.97');

ok_132(in_array('064_adimbot_rate_limit_ve_migration_checkpoint',$applied,true),
    '1.1.97 recovery 064 checkpointini uygulamadı.');
ok_132(in_array('065_kurum_bazli_eslestirme_izolasyonu',$applied,true),
    '1.1.97 recovery 065 tenant migrationını uygulamadı.');
ok_132(in_array('066_kurum_eslestirme_schema_guard',$applied,true),
    '1.1.97 recovery 066 tenant guard migrationını uygulamadı.');

ok_132(auth_table_exists($pdo,'adimbot_rate_limitleri'),
    '064 sonrası AdımBot rate-limit tablosu yok.');

$relationChecks=[
    ['veli_ogrenci','kurum_id'],
    ['ogretmen_ogrenci','kurum_id'],
];
foreach($relationChecks as [$table,$column]){
    ok_132(isset(auth_column_map($pdo,$table)[$column]),
        $table.'.kurum_id oluşmadı.');
}

$vo=(int)$pdo->query('SELECT kurum_id FROM veli_ogrenci WHERE veli_id=10 AND ogrenci_id=30')->fetchColumn();
$oo=(int)$pdo->query('SELECT kurum_id FROM ogretmen_ogrenci WHERE ogretmen_id=20 AND ogrenci_id=30')->fetchColumn();
ok_132($vo===1,'Veli-öğrenci ilişkisi ortak kuruma taşınmadı.');
ok_132($oo===1,'Öğretmen-öğrenci ilişkisi ortak kuruma taşınmadı.');

$membershipColumns=auth_column_map($pdo,'kurum_kullanicilari');
foreach(['kurum_id','kullanici_id','kurum_rolu','aktif'] as $column){
    ok_132(isset($membershipColumns[$column]),'Yeni kurum üyeliği kolonu eksik: '.$column);
}
foreach(['veli_id','ogretmen_id','ogrenci_id','yonetici_id'] as $legacy){
    ok_132(!isset($membershipColumns[$legacy]),'Legacy kurum üyeliği kolonu kaldı: '.$legacy);
}

$remote=[
    'version'=>'1.2.4',
    'release_revision'=>1,
    'name'=>'legacy 1.1.97 full recovery fixture',
];
assert_recovered_release_postconditions($pdo,$root,$root,$remote);

foreach($tables as $table){
    $pdo->exec("DROP TABLE IF EXISTS `{$table}`");
}

echo "PASS: 1.1.97 -> 1.2.4 full MariaDB recovery integration contract\n";
