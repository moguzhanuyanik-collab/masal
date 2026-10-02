<?php
declare(strict_types=1);

function fail_190(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_190(bool $condition,string $message): void { if(!$condition) fail_190($message); }

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
}catch(Throwable $e){ fail_190('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_fetch_user(PDO $pdo,int $userId): ?array {
    $stmt=$pdo->prepare('SELECT id,email,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$userId]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) return null;
    $roles=[(string)$row['ana_rol']];
    if(auth_runtime_table_exists($pdo,'kullanici_rolleri')){
        $stmt=$pdo->prepare('SELECT rol FROM kullanici_rolleri WHERE kullanici_id=?');
        $stmt->execute([$userId]);
        foreach($stmt->fetchAll(PDO::FETCH_COLUMN) as $role)$roles[]=(string)$role;
        $stmt->closeCursor();
    }
    $row['roles']=array_values(array_unique($roles));
    return $row;
}
function auth_user_has_role(?array $user,string|array $roles): bool {
    if(!$user) return false;
    $wanted=is_array($roles)?$roles:[$roles];
    foreach($wanted as $role) if(in_array((string)$role,$user['roles']??[],true)) return true;
    return false;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function ma_tables_ready(PDO $pdo): bool { return true; }
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_case_source_still_open(PDO $pdo,array $case): bool { return (int)($case['id']??0)!==10; }
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
        (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
        VALUES (?,?,?,?,?,NOW())");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
    $stmt->closeCursor();
}

require __DIR__.'/../src/ticari_mutabakat_saglik.php';
require __DIR__.'/../src/bildirimler.php';
require __DIR__.'/../src/ticari_mutabakat_eskalasyon.php';

$tables=[
    'ticari_mutabakat_eskalasyonlari',
    'kurum_duyuru_alicilari','kurum_duyurulari',
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'kurum_sozlesmeleri','kullanici_rolleri','kullanicilar','kurumlar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kullanici_rolleri(
    kullanici_id BIGINT UNSIGNED NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY(kullanici_id,rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurumlar(
    id BIGINT UNSIGNED NOT NULL,
    kod VARCHAR(80) NOT NULL,
    ad VARCHAR(190) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_sozlesmeleri(
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    sozlesme_no VARCHAR(80) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vakalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    anahtar CHAR(64) NOT NULL,
    kaynak_turu VARCHAR(40) NOT NULL DEFAULT 'sozlesme_mutabakat',
    kaynak_kodu VARCHAR(40) NOT NULL DEFAULT 'eksik',
    kaynak_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    kaynak_alt_id BIGINT UNSIGNED NULL,
    sozlesme_id BIGINT UNSIGNED NULL,
    kurum_id BIGINT UNSIGNED NULL,
    para_birimi CHAR(3) NULL,
    sorun_turu VARCHAR(20) NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'acik',
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    sonraki_aksiyon_tarihi DATE NULL,
    son_tespit_tarihi DATETIME NULL,
    son_aciklama VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_vaka_anahtar(anahtar)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vaka_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    not_metni VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyurulari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NOT NULL,
    tur VARCHAR(20) NOT NULL DEFAULT 'duyuru',
    kaynak_turu VARCHAR(40) NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    baslik VARCHAR(190) NOT NULL,
    mesaj VARCHAR(4000) NOT NULL,
    onem VARCHAR(20) NOT NULL DEFAULT 'normal',
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

$pdo->exec("CREATE TABLE ticari_mutabakat_eskalasyonlari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    alici_kullanici_id BIGINT UNSIGNED NOT NULL,
    dongu_anahtari CHAR(64) NOT NULL,
    dongu_baslangic_tarihi DATETIME NOT NULL,
    esik_kodu VARCHAR(30) NOT NULL,
    acik_gun INT UNSIGNED NOT NULL DEFAULT 0,
    duyuru_id BIGINT UNSIGNED NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_mutabakat_eskalasyon(vaka_id,dongu_anahtari,esik_kodu,alici_kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif) VALUES
    (1,'admin1@example.test','Admin Bir','super_admin',1),
    (2,'admin2@example.test','Admin İki','yonetici',1),
    (3,'manager@example.test','Normal Yönetici','yonetici',1),
    (4,'passive@example.test','Pasif Admin','super_admin',0)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (2,'super_admin')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'K10','Kurum On')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (100,10,'S-100'),(101,10,'S-101'),(102,10,'S-102'),(103,10,'S-103'),
    (104,10,'S-104'),(105,10,'S-105'),(106,10,'S-106'),(107,10,'S-107'),
    (108,10,'S-108'),(109,10,'S-109'),(110,10,'S-110'),(111,10,'S-111')");

function add_case_190(PDO $pdo,int $id,int $days,string $status,int $owner,?int $institution=10,bool $intervention=false): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
        (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,
         sorun_turu,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama,
         olusturulma_tarihi,guncellenme_tarihi)
        VALUES (?,SHA2(CONCAT('case-',?),256),'sozlesme_mutabakat','eksik',?,?,?,'TRY',
                'operasyon',?,?,?,CONCAT('Vaka ',?),DATE_SUB(NOW(),INTERVAL ? DAY),NOW())");
    $action=(new DateTimeImmutable('today'))->modify('-1 day')->format('Y-m-d');
    $stmt->execute([$id,$id,99+$id,99+$id,$institution,$status,$owner,$action,$id,$days]);
    $stmt->closeCursor();
    if($intervention){
        $h=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
            (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
            VALUES (?,1,'not','takip_notu','Müdahale',DATE_SUB(NOW(),INTERVAL 1 DAY))");
        $h->execute([$id]);
        $h->closeCursor();
    }
}

add_case_190($pdo,1,1,'acik',1,10,false);
add_case_190($pdo,2,2,'acik',1,10,false);
add_case_190($pdo,3,3,'acik',1,10,true);
add_case_190($pdo,4,4,'acik',1,10,true);
add_case_190($pdo,5,8,'acik',1,10,true);
add_case_190($pdo,6,14,'incelemede',1,10,true);
add_case_190($pdo,7,30,'beklemede',1,10,true);
add_case_190($pdo,8,8,'acik',3,10,true);
add_case_190($pdo,9,8,'acik',1,null,true);
add_case_190($pdo,10,8,'acik',1,10,true);
add_case_190($pdo,11,30,'kapali',1,10,true);
add_case_190($pdo,12,8,'acik',2,10,true);

ok_190(me_milestone(['acik_gun'=>1,'ilk_mudahale_yok'=>true])===null,'day 1 must not escalate.');
ok_190((string)me_milestone(['acik_gun'=>2,'ilk_mudahale_yok'=>true])['kod']==='ilk_mudahale_2','2+ first-intervention threshold mismatch.');
ok_190(me_milestone(['acik_gun'=>3,'ilk_mudahale_yok'=>false])===null,'day 3 with intervention must not escalate.');
ok_190((string)me_milestone(['acik_gun'=>4,'ilk_mudahale_yok'=>false])['kod']==='dongu_4','4+ threshold mismatch.');
ok_190((string)me_milestone(['acik_gun'=>8,'ilk_mudahale_yok'=>false])['kod']==='dongu_8','8+ threshold mismatch.');
ok_190((string)me_milestone(['acik_gun'=>14,'ilk_mudahale_yok'=>false])['kod']==='dongu_14','14+ threshold mismatch.');
ok_190((string)me_milestone(['acik_gun'=>30,'ilk_mudahale_yok'=>false])['kod']==='dongu_30','30+ threshold mismatch.');

$candidates=me_candidate_rows($pdo,100);
ok_190(count($candidates)===9,'nine open cases should meet escalation thresholds.');
$byId=[];
foreach($candidates as $row)$byId[(int)$row['vaka_id']]=$row;
ok_190(!isset($byId[1],$byId[3],$byId[11]),'non-threshold/closed cases must stay out of escalation queue.');
ok_190(empty($byId[8]['alici_gecerli']),'normal manager owner must be invalid for escalation delivery.');
ok_190(empty($byId[9]['kurum_gecerli']),'institution-less case must be marked invalid for delivery.');
ok_190(!empty($byId[12]['alici_gecerli']),'secondary-role Super Admin must be a valid escalation recipient.');

$actor=['id'=>1,'role'=>'super_admin'];
$first=me_sync($pdo,$actor);
ok_190((int)$first['sent']===6,'first sync should send six valid current escalations.');
ok_190((int)$first['invalid_owner']===1,'one invalid owner should be reported.');
ok_190((int)$first['no_institution']===1,'one institution-less case should be reported.');
ok_190((int)$first['stale_source']===1,'one stale-source case should be skipped.');
ok_190((int)$first['failed']===0,'first escalation sync should not fail.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari")->fetchColumn()===6,
    'six escalation history rows expected.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='mutabakat_operasyon_eskalasyon'")->fetchColumn()===6,
    'six central escalation announcements expected.');
ok_190((int)$pdo->query("SELECT COUNT(DISTINCT kurum_rolu) FROM kurum_duyuru_alicilari WHERE kurum_rolu='super_admin'")->fetchColumn()===1,
    'escalation recipients must be Super Admin snapshots.');

$second=me_sync($pdo,$actor);
ok_190((int)$second['sent']===0,'same cycle/threshold/owner must not resend escalation.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari")->fetchColumn()===6,
    'dedup sync must not add escalation history.');

$pdo->exec("UPDATE ticari_mutabakat_vakalari SET sorumlu_kullanici_id=2 WHERE id=5");
$ownerTransfer=me_sync($pdo,$actor);
ok_190((int)$ownerTransfer['sent']===1,'same cycle threshold must notify new valid owner after owner transfer.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari WHERE vaka_id=5")->fetchColumn()===2,
    'owner transfer must preserve old delivery and add new recipient delivery.');

$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
    (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
    VALUES (4,1,'durum','vaka_yeniden_acildi','Yeni döngü',DATE_SUB(NOW(),INTERVAL 4 DAY))")->execute();
$reopen=me_sync($pdo,$actor);
ok_190((int)$reopen['sent']===1,'new reopen cycle at same 4-day threshold must allow a fresh escalation.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari WHERE vaka_id=4")->fetchColumn()===2,
    'reopen cycle must keep old escalation and add new cycle delivery.');
ok_190((int)$pdo->query("SELECT COUNT(DISTINCT dongu_anahtari) FROM ticari_mutabakat_eskalasyonlari WHERE vaka_id=4")->fetchColumn()===2,
    'reopen cycle must use a different stable cycle key.');

$summary=me_summary($pdo);
ok_190((int)$summary['toplam']===8,'escalation summary total mismatch after owner/reopen cycles.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE kod LIKE 'eskalasyon_%'")->fetchColumn()===8,
    'each successful escalation must append case history.');
ok_190((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_eskalasyonlari WHERE vaka_id=10")->fetchColumn()===0,
    'stale-source case must never receive escalation history.');

$forbidden=false;
try{me_sync($pdo,['id'=>3,'role'=>'yonetici']);}catch(RuntimeException){$forbidden=true;}
ok_190($forbidden,'non-Super-Admin actor must not run escalation sync.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: escalation thresholds, owner/source guards, cycle dedup, owner transfer and reopen-cycle delivery\n";
