<?php
declare(strict_types=1);

function fail_145(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_145(bool $condition,string $message): void { if(!$condition) fail_145($message); }

function auth_user_has_role(array $user,string $role): bool {
    return (string)($user['role']??'')===$role;
}
function auth_effective_role(array $user): string {
    return (string)($user['role']??'');
}
function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    return true;
}
function auth_manageable_institution_ids(PDO $pdo,array $user): array {
    if(auth_user_has_role($user,'super_admin')){
        $rows=$pdo->query("SELECT id FROM kurumlar WHERE aktif=1 ORDER BY id")->fetchAll(PDO::FETCH_COLUMN);
        return array_map('intval',$rows?:[]);
    }
    if(!auth_user_has_role($user,'yonetici')) return [];
    $stmt=$pdo->prepare("SELECT kurum_id FROM kurum_kullanicilari
        WHERE kullanici_id=? AND kurum_rolu='yonetici' AND aktif=1
        ORDER BY kurum_id");
    $stmt->execute([(int)$user['id']]);
    $rows=$stmt->fetchAll(PDO::FETCH_COLUMN);
    $stmt->closeCursor();
    return array_map('intval',$rows?:[]);
}

require __DIR__.'/../src/yonetici_yetkileri.php';
require __DIR__.'/../src/kurum_yonetimi.php';

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
}catch(Throwable $e){ fail_145('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=['yonetici_yetkileri','ogrenciler','kurum_kullanicilari','kurumlar','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurumlar (
 id BIGINT UNSIGNED NOT NULL, kod VARCHAR(60) NULL, ad VARCHAR(190) NOT NULL, tur VARCHAR(30) NULL,
 icerik_kaynagi VARCHAR(30) NULL, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_kullanicilari (
 kurum_id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, kurum_rolu VARCHAR(30) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenciler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE yonetici_yetkileri (
 kullanici_id BIGINT UNSIGNED NOT NULL, yetki VARCHAR(80) NOT NULL,
 PRIMARY KEY(kullanici_id,yetki)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (9001,'Yönetici A',1),(9999,'Süper Admin',1),(1001,'Ada',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,tur,icerik_kaynagi,aktif) VALUES
 (10,'A','Okul A','okul','kurum',1),(20,'B','Okul B','okul','kurum',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,9001,'yonetici',1),
 (10,1001,'ogrenci',1),(20,1001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,aktif) VALUES (101,1001,'Ada',1)");
$pdo->exec("INSERT INTO yonetici_yetkileri(kullanici_id,yetki) VALUES (9001,'kurum_goruntule')");

$manager=['id'=>9001,'role'=>'yonetici'];
$super=['id'=>9999,'role'=>'super_admin'];

$contexts=ky_manager_student_report_contexts($pdo,$manager,101);
ok_145(count($contexts)===1,'yönetici yalnız yönetebildiği ortak öğrenci kurumunu görmeli.');
ok_145((int)$contexts[0]['id']===10,'tek yönetilebilir öğrenci kurumu Okul A olmalı.');

$contextA=ky_manager_student_report_context($pdo,$manager,101,10);
ok_145(is_array($contextA),'Okul A yönetici rapor bağlamı doğrulanmalı.');
ok_145((string)$contextA['institution_name']==='Okul A','rapor kurum adı Okul A olmalı.');

$forgedB=ky_manager_student_report_context($pdo,$manager,101,20);
ok_145($forgedB===null,'öğrenci Okul B üyesi olsa bile yönetici Okul B yi yönetmiyorsa bağlam reddedilmeli.');

$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES (20,9001,'yonetici',1)");
$contexts2=ky_manager_student_report_contexts($pdo,$manager,101);
$ids=array_map('intval',array_column($contexts2,'id'));
sort($ids);
ok_145($ids===[10,20],'yönetici iki kurumu da yönetmeye başlayınca iki rapor bağlamı görünmeli.');
ok_145(is_array(ky_manager_student_report_context($pdo,$manager,101,20)),'Okul B yönetilebilir olunca bağlam açılmalı.');

$pdo->exec("DELETE FROM yonetici_yetkileri WHERE kullanici_id=9001 AND yetki='kurum_goruntule'");
ok_145(ky_manager_student_report_contexts($pdo,$manager,101)===[],'kurum_goruntule izni kaldırılınca kurum seçenekleri kapanmalı.');
ok_145(ky_manager_student_report_context($pdo,$manager,101,10)===null,'kurum_goruntule izni kaldırılınca doğrudan rapor bağlamı kapanmalı.');

$superContext=ky_manager_student_report_context($pdo,$super,101,20);
ok_145(is_array($superContext),'süper admin aktif öğrenci kurumunu açıkça seçtiğinde bağlam doğrulanmalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: manager student-report manageable institution and permission DB integration\n";
