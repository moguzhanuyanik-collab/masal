<?php
declare(strict_types=1);

function fail_164(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_164(bool $condition,string $message): void { if(!$condition) fail_164($message); }

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
}catch(Throwable $e){ fail_164('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??''); }
function auth_manageable_institution_ids(PDO $pdo,array $user): array {
    return (int)($user['id']??0)===1?[10,20]:((int)($user['id']??0)===2?[10]:[]);
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/bildirimler.php';

$tables=['kurum_duyuru_alicilari','kurum_duyurulari','veli_ogrenci','veliler','ogrenciler','kurum_kullanicilari','kullanicilar','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kurumlar(id BIGINT UNSIGNED NOT NULL,ad VARCHAR(190) NOT NULL,kod VARCHAR(80) NOT NULL,aktif TINYINT(1) NOT NULL DEFAULT 1,PRIMARY KEY(id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kullanicilar(id BIGINT UNSIGNED NOT NULL,ad_soyad VARCHAR(190) NOT NULL,aktif TINYINT(1) NOT NULL DEFAULT 1,PRIMARY KEY(id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_kullanicilari(kurum_id BIGINT UNSIGNED NOT NULL,kullanici_id BIGINT UNSIGNED NOT NULL,kurum_rolu VARCHAR(30) NOT NULL,aktif TINYINT(1) NOT NULL DEFAULT 1,PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenciler(id BIGINT UNSIGNED NOT NULL,kullanici_id BIGINT UNSIGNED NOT NULL,aktif TINYINT(1) NOT NULL DEFAULT 1,PRIMARY KEY(id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE veliler(id BIGINT UNSIGNED NOT NULL,kullanici_id BIGINT UNSIGNED NOT NULL,aktif TINYINT(1) NOT NULL DEFAULT 1,PRIMARY KEY(id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE veli_ogrenci(veli_id BIGINT UNSIGNED NOT NULL,ogrenci_id BIGINT UNSIGNED NOT NULL,kurum_id BIGINT UNSIGNED NOT NULL,PRIMARY KEY(veli_id,ogrenci_id,kurum_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_duyurulari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NOT NULL,
    tur VARCHAR(20) NOT NULL,
    kaynak_turu VARCHAR(40) NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    baslik VARCHAR(190) NOT NULL,
    mesaj VARCHAR(4000) NOT NULL,
    onem VARCHAR(20) NOT NULL,
    hedef_roller VARCHAR(120) NOT NULL,
    baglanti VARCHAR(255) NULL,
    son_gosterim_tarihi DATE NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_duyuru_kaynak(kurum_id,kaynak_turu,kaynak_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    okundu_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,ad,kod,aktif) VALUES (10,'A Okulu','a',1),(20,'B Okulu','b',1)");
$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Süper',1),(2,'A Yönetici',1),(3,'A Öğretmen',1),(4,'A Öğrenci',1),(5,'A Veli',1),
    (6,'B Öğrenci',1),(7,'A İkinci Öğrenci',1),(8,'Pasif Veli',0)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,2,'yonetici',1),(10,3,'ogretmen',1),(10,4,'ogrenci',1),(10,5,'veli',1),(10,7,'ogrenci',1),(10,8,'veli',1),
    (20,6,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,aktif) VALUES (101,4,1),(102,7,1),(201,6,1)");
$pdo->exec("INSERT INTO veliler(id,kullanici_id,aktif) VALUES (301,5,1),(302,8,1)");
$pdo->exec("INSERT INTO veli_ogrenci(veli_id,ogrenci_id,kurum_id) VALUES (301,101,10),(302,101,10)");

$manager=['id'=>2,'role'=>'yonetici'];
$id=bd_create_manual($pdo,$manager,[
    'kurum_id'=>10,
    'baslik'=>'Yarın Etkinlik',
    'mesaj'=>'Etkinlik saat 10.00’da başlayacak.',
    'onem'=>'onemli',
    'hedef_roller'=>['ogrenci','veli'],
    'son_gosterim_tarihi'=>'',
]);
ok_164($id>0,'manuel duyuru oluşturulmalı.');
$count=(int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE duyuru_id={$id}")->fetchColumn();
ok_164($count===3,'snapshot yalnız A kurumundaki iki aktif öğrenci ve bir aktif veliyi içermeli.');
$cross=(int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE duyuru_id={$id} AND kullanici_id=6")->fetchColumn();
ok_164($cross===0,'B kurumu öğrencisi A kurumu duyurusuna sızmamalı.');
$inactive=(int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE duyuru_id={$id} AND kullanici_id=8")->fetchColumn();
ok_164($inactive===0,'pasif kullanıcı snapshota eklenmemeli.');

ok_164(bd_unread_count($pdo,4)===1,'öğrencinin bir okunmamış bildirimi olmalı.');
bd_mark_read($pdo,4,$id);
ok_164(bd_unread_count($pdo,4)===0,'öğrenci kendi bildirimini okundu yapabilmeli.');
ok_164(bd_unread_count($pdo,5)===1,'veli bildirimi başka kullanıcının okumasından etkilenmemeli.');
bd_mark_all_read($pdo,5);
ok_164(bd_unread_count($pdo,5)===0,'veli tüm bildirimlerini okundu yapabilmeli.');

$unauthorized=false;
try{
    bd_create_manual($pdo,$manager,[
        'kurum_id'=>20,'baslik'=>'Yetkisiz Duyuru','mesaj'=>'Olmamalı','onem'=>'normal','hedef_roller'=>['ogrenci']
    ]);
}catch(RuntimeException){$unauthorized=true;}
ok_164($unauthorized,'yönetici yönetmediği kuruma duyuru gönderememeli.');

$system=bd_notify_teacher_content($pdo,10,3,9001,'odev','Matematik Ödevi',[101],'2026-10-05 18:00:00');
ok_164($system>0,'ödev sistem bildirimi oluşturulmalı.');
$systemRecipients=$pdo->query("SELECT kullanici_id,kurum_rolu FROM kurum_duyuru_alicilari WHERE duyuru_id={$system} ORDER BY kullanici_id")->fetchAll(PDO::FETCH_ASSOC);
ok_164(count($systemRecipients)===2,'ödev yalnız hedef öğrenci ve onun aktif velisine gitmeli.');
ok_164((int)$systemRecipients[0]['kullanici_id']===4 && (int)$systemRecipients[1]['kullanici_id']===5,'ödev hedef dışı öğrenciye gitmemeli.');

$duplicate=bd_notify_teacher_content($pdo,10,3,9001,'odev','Matematik Ödevi',[101],'2026-10-05 18:00:00');
ok_164($duplicate===$system,'aynı içerik kaynağı ikinci sistem duyurusu üretmemeli.');
$totalSystem=(int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='ogretmen_icerik' AND kaynak_id=9001")->fetchColumn();
ok_164($totalSystem===1,'sistem bildirimi kaynak bazında tekil olmalı.');

bd_archive_manual($pdo,$manager,$id);
$active=(int)$pdo->query("SELECT aktif FROM kurum_duyurulari WHERE id={$id}")->fetchColumn();
ok_164($active===0,'manuel duyuru fiziksel silinmeden arşivlenmeli.');
$inbox=bd_inbox_rows($pdo,7);
foreach($inbox as $row) ok_164((int)$row['id']!==$id,'arşivlenen manuel duyuru gelen kutusunda görünmemeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: notification tenant scope, recipient snapshots, read tracking and homework parent delivery\n";
