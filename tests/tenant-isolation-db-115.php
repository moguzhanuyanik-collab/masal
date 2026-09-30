<?php
declare(strict_types=1);

function fail_test(string $message): never {
    fwrite(STDERR,"FAIL: {$message}\n");
    exit(1);
}
function ok(bool $condition,string $message): void {
    if(!$condition) fail_test($message);
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
    fail_test('MariaDB bağlantısı kurulamadı: '.$e->getMessage());
}

foreach([
    'ogretmen_ogrenci','veli_ogrenci','ogretmenler','veliler','ogrenciler',
    'kurum_kullanicilari','kurumlar','kullanici_rolleri','kullanicilar'
] as $table){
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

$pdo->exec("CREATE TABLE kullanicilar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(190) NOT NULL,
    sifre_hash VARCHAR(255) NOT NULL DEFAULT '',
    ad_soyad VARCHAR(190) NOT NULL DEFAULT '',
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY uk_email(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanici_rolleri (
    kullanici_id BIGINT UNSIGNED NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY(kullanici_id,rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurumlar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu),
    KEY ix_user(kullanici_id,aktif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NULL,
    ad VARCHAR(190) NOT NULL DEFAULT '',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    KEY ix_user(kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE veliler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL DEFAULT '',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    KEY ix_user(kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmenler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL DEFAULT '',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id),
    KEY ix_user(kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE veli_ogrenci (
    veli_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(veli_id,ogrenci_id,kurum_id),
    KEY ix_scope(kurum_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_ogrenci (
    ogretmen_id BIGINT UNSIGNED NOT NULL,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id),
    KEY ix_scope(kurum_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$users=[
    [1,'teacher@example.test','Öğretmen','ogretmen'],
    [2,'parent@example.test','Veli','veli'],
    [3,'student-a@example.test','Öğrenci A','ogrenci'],
    [4,'student-b@example.test','Öğrenci B','ogrenci'],
    [5,'student-c@example.test','Öğrenci C','ogrenci'],
    [6,'global-parent@example.test','Global Veli','veli'],
    [7,'global-student@example.test','Global Öğrenci','ogrenci'],
];
$stmt=$pdo->prepare('INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol) VALUES (?,?,?,?,?)');
foreach($users as [$id,$email,$name,$role])$stmt->execute([$id,$email,$name,$role]);
$stmt=$pdo->prepare('INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (?,?)');
foreach($users as [$id,,, $role])$stmt->execute([$id,$role]);

$pdo->exec("INSERT INTO kurumlar(id,ad) VALUES (10,'Kurum A'),(20,'Kurum B')");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu) VALUES
    (10,1,'ogretmen'),
    (10,2,'veli'),
    (10,3,'ogrenci'),
    (20,4,'ogrenci'),
    (10,5,'ogrenci'),
    (20,5,'ogrenci')");

$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad) VALUES
    (101,3,'Öğrenci A'),
    (102,4,'Öğrenci B'),
    (103,5,'Öğrenci C'),
    (104,7,'Global Öğrenci')");
$pdo->exec("INSERT INTO veliler(id,kullanici_id,ad_soyad) VALUES (201,2,'Veli'),(202,6,'Global Veli')");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad) VALUES (301,1,'Öğretmen')");

$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
    (301,101,10),
    (301,102,10),
    (301,103,20),
    (301,103,10)");

$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES
    (201,101,10),
    (201,102,10),
    (201,103,20),
    (202,104,0)");

require_once __DIR__.'/../src/auth.php';

$teacherIds=auth_accessible_student_ids($pdo,1);
sort($teacherIds);
ok($teacherIds===[101,103],'Öğretmen yalnızca ortak kurum + ilişki kapsamındaki öğrencileri görmeli; gelen: '.json_encode($teacherIds));

$parentIds=auth_accessible_student_ids($pdo,2);
sort($parentIds);
ok($parentIds===[101,103],'Veli yalnızca ortak kurum + ilişki kapsamındaki öğrencileri görmeli; gelen: '.json_encode($parentIds));

$globalParentIds=auth_accessible_student_ids($pdo,6);
sort($globalParentIds);
ok($globalParentIds===[104],'Kurum dışı global veli, yalnızca global ilişkiyi görmeli; gelen: '.json_encode($globalParentIds));

$relation=$pdo->query('SELECT kurum_id FROM veli_ogrenci WHERE veli_id=201 AND ogrenci_id=101')->fetchColumn();
ok((int)$relation===10,'Kurum kapsamı relation satırında korunmalı.');

$pk=$pdo->query("SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
    FROM information_schema.statistics
    WHERE table_schema=DATABASE() AND table_name='veli_ogrenci' AND index_name='PRIMARY'")->fetchColumn();
ok((string)$pk==='veli_id,ogrenci_id,kurum_id','Veli-öğrenci PK kurum kapsamını içermeli.');

$pdo->exec('DROP TABLE ogretmen_ogrenci,veli_ogrenci,ogretmenler,veliler,ogrenciler,kurum_kullanicilari,kurumlar,kullanici_rolleri,kullanicilar');

echo "1.1.114 tenant relation DB integration checks passed\n";
