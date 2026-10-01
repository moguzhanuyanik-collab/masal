<?php
declare(strict_types=1);

function fail_158(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_158(bool $condition,string $message): void { if(!$condition) fail_158($message); }

function auth_user_has_role(array $user,string $role): bool {
    return (string)($user['role']??'')===$role;
}
function auth_audit(PDO $pdo,int $actorId,?int $targetUserId,string $action,?string $detail=null): void {
    $GLOBALS['audit_158'][]=[$actorId,$targetUserId,$action,$detail];
}

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
}catch(Throwable $e){ fail_158('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=['veli_ogrenci','veliler','ogrenciler','kurum_kullanicilari','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, email VARCHAR(190) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id), UNIQUE KEY uq_user_email(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL,
 email VARCHAR(190) NULL, egitim_kademesi VARCHAR(40) NULL, sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE veliler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
 kurum_id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, kurum_rolu VARCHAR(30) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE veli_ogrenci (
 veli_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(veli_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,email,aktif) VALUES
 (1,'Süper Admin','admin@example.com',1),
 (101,'Aktif Öğrenci','aktifogr@example.com',1),
 (102,'Pasif Öğrenci','pasifogr@example.com',0),
 (103,'Yarım Pasif Öğrenci','yarimogr@example.com',0),
 (201,'Aktif Veli','aktifveli@example.com',1),
 (202,'Pasif Veli','pasifveli@example.com',0),
 (203,'Kuruma Bağlı Pasif Veli','kurumveli@example.com',0)");

$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,egitim_kademesi,sinif_seviyesi,aktif) VALUES
 (11,101,'Aktif Öğrenci','aktifogr@example.com','temel_egitim',4,1),
 (12,102,'Pasif Öğrenci','pasifogr@example.com','temel_egitim',5,0),
 (13,103,'Yarım Pasif Öğrenci','yarimogr@example.com','temel_egitim',6,1)");

$pdo->exec("INSERT INTO veliler(id,kullanici_id,ad_soyad,aktif) VALUES
 (21,201,'Aktif Veli',1),
 (22,202,'Pasif Veli',0),
 (23,203,'Kuruma Bağlı Pasif Veli',0)");

$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES
 (22,12,0),(21,12,0)");

$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,203,'veli',1)");

$all=ky_global_archived_users($pdo,'tum');
$ids=array_map(static fn(array $r):int=>(int)$r['kullanici_id'],$all);
sort($ids);
ok_158($ids===[102,103,202],'arşiv yalnız global pasif/yarım-pasif hesapları göstermeli.');

$students=ky_global_archived_users($pdo,'ogrenci');
$studentIds=array_map(static fn(array $r):int=>(int)$r['kullanici_id'],$students);
sort($studentIds);
ok_158($studentIds===[102,103],'öğrenci filtresi yalnız pasif global öğrencileri göstermeli.');

$parents=ky_global_archived_users($pdo,'veli');
$parentIds=array_map(static fn(array $r):int=>(int)$r['kullanici_id'],$parents);
ok_158($parentIds===[202],'veli filtresi aktif kurum üyeliği olan pasif veliyi dışarıda bırakmalı.');

$actor=['id'=>1,'role'=>'super_admin'];
$GLOBALS['audit_158']=[];

ky_restore_global_user($pdo,$actor,'ogrenci',102);
$state=$pdo->query("SELECT k.aktif kullanici_aktif,o.aktif profil_aktif
  FROM kullanicilar k INNER JOIN ogrenciler o ON o.kullanici_id=k.id WHERE k.id=102")->fetch();
ok_158((int)$state['kullanici_aktif']===1 && (int)$state['profil_aktif']===1,'öğrenci geri açmada kullanıcı ve profil birlikte aktif olmalı.');

$linkCount=(int)$pdo->query("SELECT COUNT(*) FROM veli_ogrenci WHERE veli_id=22 AND ogrenci_id=12 AND kurum_id=0")->fetchColumn();
ok_158($linkCount===1,'öğrenci geri açma mevcut global veli-öğrenci ilişkisini silmemeli.');

ky_restore_global_user($pdo,$actor,'ogrenci',103);
$state103=$pdo->query("SELECT k.aktif kullanici_aktif,o.aktif profil_aktif
  FROM kullanicilar k INNER JOIN ogrenciler o ON o.kullanici_id=k.id WHERE k.id=103")->fetch();
ok_158((int)$state103['kullanici_aktif']===1 && (int)$state103['profil_aktif']===1,'yarım-pasif öğrenci iki katmanda da düzeltilmeli.');

ky_restore_global_user($pdo,$actor,'veli',202);
$state202=$pdo->query("SELECT k.aktif kullanici_aktif,v.aktif profil_aktif
  FROM kullanicilar k INNER JOIN veliler v ON v.kullanici_id=k.id WHERE k.id=202")->fetch();
ok_158((int)$state202['kullanici_aktif']===1 && (int)$state202['profil_aktif']===1,'veli geri açmada kullanıcı ve profil birlikte aktif olmalı.');

$linkCount2=(int)$pdo->query("SELECT COUNT(*) FROM veli_ogrenci WHERE veli_id=22 AND ogrenci_id=12 AND kurum_id=0")->fetchColumn();
ok_158($linkCount2===1,'veli geri açma mevcut global eşleştirmeyi korumalı.');

$after=ky_global_archived_users($pdo,'tum');
ok_158($after===[],'geri açılan hesaplar arşivden çıkmalı.');

$blocked=false;
try{
    ky_restore_global_user($pdo,$actor,'veli',203);
}catch(RuntimeException){
    $blocked=true;
}
ok_158($blocked,'aktif kurum üyeliği bulunan hesap global arşivden geri açılamamalı.');

$nonAdminBlocked=false;
try{
    ky_restore_global_user($pdo,['id'=>9,'role'=>'yonetici'],'ogrenci',102);
}catch(RuntimeException){
    $nonAdminBlocked=true;
}
ok_158($nonAdminBlocked,'global geri açma yalnız Süper Admin tarafından yapılabilmeli.');

$actions=array_map(static fn(array $row):string=>(string)$row[2],$GLOBALS['audit_158']);
ok_158(count(array_filter($actions,static fn(string $a):bool=>$a==='global_kullanici_aktif'))===3,'üç başarılı geri açma audit kaydı üretmeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: global archived account restore DB integration\n";
