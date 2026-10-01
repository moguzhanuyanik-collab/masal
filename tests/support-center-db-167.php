<?php
declare(strict_types=1);

function fail_167(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_167(bool $condition,string $message): void { if(!$condition) fail_167($message); }

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
}catch(Throwable $e){ fail_167('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??''); }
function auth_user_institution_ids(PDO $pdo,int $userId,?string $role=null): array {
    $sql='SELECT DISTINCT kurum_id FROM kurum_kullanicilari WHERE kullanici_id=? AND aktif=1';
    $params=[$userId];
    if($role!==null){$sql.=' AND kurum_rolu=?';$params[]=$role;}
    $sql.=' ORDER BY kurum_id';
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
    $stmt->closeCursor();
    return $rows;
}
function auth_user_in_institution(PDO $pdo,int $userId,int $institutionId,?string $role=null): bool {
    $sql='SELECT 1 FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id=? AND aktif=1';
    $params=[$institutionId,$userId];
    if($role!==null){$sql.=' AND kurum_rolu=?';$params[]=$role;}
    $sql.=' LIMIT 1';
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $ok=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $ok;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/destek.php';

$tables=['destek_talep_mesajlari','destek_talepleri','kurum_kullanicilari','kullanicilar','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kurumlar(
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari(
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE destek_talepleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    acani_kullanici_id BIGINT UNSIGNED NOT NULL,
    acani_rolu VARCHAR(30) NOT NULL,
    atanan_kullanici_id BIGINT UNSIGNED NULL,
    kategori VARCHAR(30) NOT NULL,
    oncelik VARCHAR(20) NOT NULL DEFAULT 'normal',
    konu VARCHAR(190) NOT NULL,
    durum VARCHAR(30) NOT NULL DEFAULT 'acik',
    son_hareket_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cozum_tarihi DATETIME NULL,
    kapanis_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE destek_talep_mesajlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    talep_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NOT NULL,
    gonderen_rolu VARCHAR(30) NOT NULL,
    mesaj VARCHAR(5000) NOT NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES (10,'a','A Okulu',1),(20,'b','B Okulu',1)");
$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Süper Admin',1),(2,'A Yönetici',1),(3,'A Öğretmen',1),(4,'A Veli',1),(5,'B Yönetici',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
    (10,2,'yonetici',1),(10,3,'ogretmen',1),(10,4,'veli',1),(20,5,'yonetici',1)");

$admin=['id'=>1,'role'=>'super_admin'];
$managerA=['id'=>2,'role'=>'yonetici'];
$teacherA=['id'=>3,'role'=>'ogretmen'];
$parentA=['id'=>4,'role'=>'veli'];
$managerB=['id'=>5,'role'=>'yonetici'];

$ticketId=ds_create_ticket($pdo,$managerA,[
    'kurum_id'=>10,
    'kategori'=>'teknik',
    'oncelik'=>'acil',
    'konu'=>'Panel açılırken hata alıyorum',
    'mesaj'=>'Yönetici panelinde rapor alanını açınca hata mesajı görüyorum.'
]);
ok_167($ticketId>0,'manager should create support ticket in own institution.');

$crossCreate=false;
try{
    ds_create_ticket($pdo,$managerA,[
        'kurum_id'=>20,'kategori'=>'teknik','oncelik'=>'normal',
        'konu'=>'Yetkisiz kurum talebi','mesaj'=>'Bu talep oluşturulmamalıdır.'
    ]);
}catch(RuntimeException){$crossCreate=true;}
ok_167($crossCreate,'manager must not create ticket for another institution.');

$teacherTicket=ds_create_ticket($pdo,$teacherA,[
    'kurum_id'=>10,'kategori'=>'icerik','oncelik'=>'normal',
    'konu'=>'İçerik ekranı hakkında',
    'mesaj'=>'İçerik ekranındaki bir davranış için destek istiyorum.'
]);
ok_167($teacherTicket>0,'teacher should create ticket in own institution.');

$userRows=ds_user_ticket_rows($pdo,$managerA);
ok_167(count($userRows)===1 && (int)$userRows[0]['id']===$ticketId,'requester list must include only own ticket.');
ok_167(ds_ticket_row($pdo,$managerB,$ticketId)===null,'different user/institution must not access another requester ticket.');
ok_167(ds_ticket_row($pdo,$managerA,$teacherTicket)===null,'same institution different requester must not access ticket.');

ds_user_reply($pdo,$managerA,$ticketId,'Ek bilgi: sorun yalnız rapor ekranında oluyor.');
$messages=ds_ticket_messages($pdo,$ticketId);
ok_167(count($messages)===2,'requester reply should append immutable conversation message.');

ds_admin_reply($pdo,$admin,$ticketId,'Sorunu inceliyoruz. Tarayıcı önbelleğini temizlemeden tekrar denemeyin.');
$row=ds_ticket_row($pdo,$admin,$ticketId);
ok_167((string)$row['durum']==='kullanici_bekleniyor','admin reply should move ticket to waiting-user.');
ok_167((int)$row['atanan_kullanici_id']===1,'first admin reply should assign ticket to admin.');

ds_admin_set_status($pdo,$admin,$ticketId,'cozuldu');
$row=ds_ticket_row($pdo,$admin,$ticketId);
ok_167((string)$row['durum']==='cozuldu' && !empty($row['cozum_tarihi']),'resolved status must set resolution time.');
ok_167(empty($row['kapanis_tarihi']),'resolved ticket should not yet have closure time.');

ds_user_reply($pdo,$managerA,$ticketId,'Sorun tekrar oluştu, yeniden kontrol eder misiniz?');
$row=ds_ticket_row($pdo,$admin,$ticketId);
ok_167((string)$row['durum']==='acik','requester reply to resolved ticket must reopen it.');
ok_167(empty($row['cozum_tarihi']),'reopened ticket must clear stale resolution time.');

ds_admin_set_status($pdo,$admin,$ticketId,'kapali');
$row=ds_ticket_row($pdo,$admin,$ticketId);
ok_167((string)$row['durum']==='kapali','admin should close ticket.');
ok_167(!empty($row['cozum_tarihi']) && !empty($row['kapanis_tarihi']),'closed ticket must keep resolution and closure timestamps.');

$userClosed=false;
try{ds_user_reply($pdo,$managerA,$ticketId,'Kapalı talebe yazılamamalı.');}catch(RuntimeException){$userClosed=true;}
ok_167($userClosed,'requester must not reply to closed ticket.');

$adminClosed=false;
try{ds_admin_reply($pdo,$admin,$ticketId,'Kapalı talebe admin de yazmamalı.');}catch(RuntimeException){$adminClosed=true;}
ok_167($adminClosed,'admin must not reply to closed ticket.');

$all=ds_admin_ticket_rows($pdo,[]);
ok_167(count($all)===2,'Super Admin queue should include both institution-A tickets.');
$filtered=ds_admin_ticket_rows($pdo,['durum'=>'kapali']);
ok_167(count($filtered)===1 && (int)$filtered[0]['id']===$ticketId,'status filter should isolate closed ticket.');

$summary=ds_admin_summary($pdo);
ok_167((int)$summary['toplam_acik']===1,'summary should count non-closed ticket.');
ok_167((int)$pdo->query("SELECT COUNT(*) FROM destek_talep_mesajlari WHERE talep_id={$ticketId}")->fetchColumn()===4,
    'conversation history must remain physically present.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: support tenant isolation, requester ownership, reply workflow, resolution and closure integrity\n";
