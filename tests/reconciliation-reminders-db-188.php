<?php
declare(strict_types=1);

function fail_188(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_188(bool $condition,string $message): void { if(!$condition) fail_188($message); }

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
}catch(Throwable $e){ fail_188('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
function mi_tables_ready(PDO $pdo): bool { return true; }
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_case_source_still_open(PDO $pdo,array $case): bool { return (int)($case['id']??0)!==6; }
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
        (vaka_id,kullanici_id,tur,kod,not_metni) VALUES (?,?,?,?,?)");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
    $stmt->closeCursor();
}

require __DIR__.'/../src/bildirimler.php';
require __DIR__.'/../src/ticari_mutabakat_hatirlatma.php';

$tables=[
    'ticari_mutabakat_aksiyon_hatirlatmalari',
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
    PRIMARY KEY(id)
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

$pdo->exec("CREATE TABLE ticari_mutabakat_aksiyon_hatirlatmalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    alici_kullanici_id BIGINT UNSIGNED NOT NULL,
    aksiyon_tarihi DATE NOT NULL,
    esik_kodu VARCHAR(30) NOT NULL,
    duyuru_id BIGINT UNSIGNED NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_mutabakat_hatirlatma(vaka_id,aksiyon_tarihi,esik_kodu,alici_kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif) VALUES
    (1,'actor@test.local','Ana Süper Admin','super_admin',1),
    (2,'owner@test.local','İkincil Süper Admin','yonetici',1),
    (3,'manager@test.local','Normal Yönetici','yonetici',1),
    (4,'inactive@test.local','Pasif Süper Admin','super_admin',0)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (2,'super_admin')");

for($i=1;$i<=12;$i++){
    $institutionId=$i*10;
    $pdo->prepare("INSERT INTO kurumlar(id,kod,ad) VALUES (?,?,?)")
        ->execute([$institutionId,'k'.$institutionId,'Kurum '.$institutionId]);
    $pdo->prepare("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES (?,?,?)")
        ->execute([$i*100,$institutionId,'S-'.$i]);
}

$today=new DateTimeImmutable('today');
function add_case_188(
    PDO $pdo,int $id,?int $institutionId,int $contractId,string $type,string $status,
    ?int $ownerId,?string $actionDate,string $description
): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
        (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,
         sorun_turu,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama,olusturulma_tarihi)
        VALUES (?,REPEAT(?,64),'sozlesme_mutabakat','eksik',?,?,?,'TRY',?,?,?,?,?,DATE_SUB(NOW(),INTERVAL 10 DAY))");
    $stmt->execute([
        $id,(string)($id%10),$contractId,$contractId,$institutionId,
        $type,$status,$ownerId,$actionDate,$description
    ]);
}

add_case_188($pdo,1,10,100,'operasyon','acik',1,$today->format('Y-m-d'),'Bugünkü operasyon açığı');
add_case_188($pdo,2,20,200,'butunluk','incelemede',2,$today->modify('-1 day')->format('Y-m-d'),'Bir günlük bütünlük gecikmesi');
add_case_188($pdo,3,30,300,'operasyon','beklemede',1,$today->modify('-4 days')->format('Y-m-d'),'Dört günlük gecikme');
add_case_188($pdo,4,40,400,'butunluk','acik',1,$today->modify('-8 days')->format('Y-m-d'),'Sekiz günlük gecikme');
add_case_188($pdo,5,50,500,'operasyon','acik',1,$today->modify('-20 days')->format('Y-m-d'),'Yirmi günlük gecikme');
add_case_188($pdo,6,60,600,'butunluk','acik',1,$today->modify('-35 days')->format('Y-m-d'),'Kaynağı çözülmüş stale vaka');
add_case_188($pdo,7,70,700,'operasyon','acik',1,$today->modify('+1 day')->format('Y-m-d'),'Gelecek aksiyon');
add_case_188($pdo,8,80,800,'operasyon','acik',1,null,'Tarihsiz açık vaka');
add_case_188($pdo,9,90,900,'operasyon','acik',3,$today->modify('-2 days')->format('Y-m-d'),'Normal yöneticiye atanmış');
add_case_188($pdo,10,null,1000,'operasyon','acik',1,$today->modify('-2 days')->format('Y-m-d'),'Kurumsuz vaka');
add_case_188($pdo,11,110,1100,'operasyon','kapali',1,$today->modify('-2 days')->format('Y-m-d'),'Kapalı vaka');
add_case_188($pdo,12,120,1200,'operasyon','acik',4,$today->modify('-2 days')->format('Y-m-d'),'Pasif admin');
add_case_188($pdo,13,10,100,'butunluk','acik',1,$today->modify('-35 days')->format('Y-m-d'),'Otuz beş günlük gecikme');

ok_188(mr_milestone($today->modify('+1 day')->format('Y-m-d'),$today->format('Y-m-d'))===null,
    'future action date must not produce milestone.');
ok_188((string)mr_milestone($today->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='bugun',
    'today milestone mismatch.');
ok_188((string)mr_milestone($today->modify('-1 day')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_1',
    '1+ milestone mismatch.');
ok_188((string)mr_milestone($today->modify('-3 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_3',
    '3+ milestone mismatch.');
ok_188((string)mr_milestone($today->modify('-7 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_7',
    '7+ milestone mismatch.');
ok_188((string)mr_milestone($today->modify('-14 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_14',
    '14+ milestone mismatch.');
ok_188((string)mr_milestone($today->modify('-30 days')->format('Y-m-d'),$today->format('Y-m-d'))['kod']==='gecikme_30',
    '30+ milestone mismatch.');

ok_188(array_key_exists('super_admin',bd_supported_recipient_roles()),
    'system recipient roles must include Super Admin.');
ok_188(!array_key_exists('super_admin',bd_recipient_roles()),
    'manual announcement role list must not expose Super Admin.');

$candidates=mr_candidate_rows($pdo,100);
$ids=array_map(static fn(array $row):int=>(int)$row['vaka_id'],$candidates);
sort($ids);
ok_188($ids===[1,2,3,4,5,6,9,10,12,13],
    'candidate queue must include only assigned due/overdue open cases.');

$actor=['id'=>1,'role'=>'super_admin'];
$sync1=mr_sync($pdo,$actor);
ok_188((int)$sync1['sent']===6,'six valid current milestones should notify.');
ok_188((int)$sync1['invalid_owner']===2,'normal manager and inactive Super Admin must be rejected.');
ok_188((int)$sync1['no_institution']===1,'institution-less case must not produce central notification.');
ok_188((int)$sync1['stale_source']===1,'resolved source issue must not notify.');
ok_188((int)$sync1['failed']===0,'first reminder sync should not fail.');

ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari")->fetchColumn()===6,
    'six reminder history rows expected.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='mutabakat_aksiyon_hatirlatma'")->fetchColumn()===6,
    'six central system notifications expected.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE kurum_rolu='super_admin'")->fetchColumn()===6,
    'all reminder recipient snapshots must be Super Admin role.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE tur='bildirim' AND kod LIKE 'hatirlatma_%'")->fetchColumn()===6,
    'successful reminders must append case history.');

$sync2=mr_sync($pdo,$actor);
ok_188((int)$sync2['sent']===0,'same case/date/threshold/recipient must not resend.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari")->fetchColumn()===6,
    'dedup sync must not duplicate reminder history.');

$pdo->exec("UPDATE ticari_mutabakat_vakalari SET sorumlu_kullanici_id=2 WHERE id=1");
$sync3=mr_sync($pdo,$actor);
ok_188((int)$sync3['sent']===1,'owner change must allow same date/threshold notification to new owner.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari WHERE vaka_id=1")->fetchColumn()===2,
    'owner change must preserve old history and add new recipient history.');
$recipients=$pdo->query("SELECT alici_kullanici_id FROM ticari_mutabakat_aksiyon_hatirlatmalari WHERE vaka_id=1 ORDER BY alici_kullanici_id")
    ->fetchAll(PDO::FETCH_COLUMN);
ok_188(array_map('intval',$recipients)===[1,2],'owner-specific reminder dedup mismatch.');

$pdo->prepare("UPDATE ticari_mutabakat_vakalari SET sonraki_aksiyon_tarihi=? WHERE id=2")
    ->execute([$today->format('Y-m-d')]);
$sync4=mr_sync($pdo,$actor);
ok_188((int)$sync4['sent']===1,'changed action date must create a new reminder cycle.');
ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari WHERE vaka_id=2")->fetchColumn()===2,
    'changed action date must retain prior reminder history.');

$history=mr_case_history($pdo,2,20);
ok_188(count($history)===2,'per-case reminder history must preserve both action-date cycles.');

$pdo->exec("UPDATE ticari_mutabakat_vakalari SET durum='kapali' WHERE id=3");
ok_188((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_aksiyon_hatirlatmalari WHERE vaka_id=3")->fetchColumn()===1,
    'closing a case must not delete reminder audit history.');

$summary=mr_summary($pdo);
ok_188((int)$summary['toplam']===8,'reminder summary total mismatch after owner/date cycles.');
ok_188((int)$summary['bugun']>=3,'today summary should include original and changed-date/owner reminder cycles.');
ok_188((int)$summary['gecikme_30']===1,'30+ reminder summary mismatch.');

$link=(string)$pdo->query("SELECT baglanti FROM kurum_duyurulari
    WHERE kaynak_turu='mutabakat_aksiyon_hatirlatma' ORDER BY id LIMIT 1")->fetchColumn();
ok_188(str_starts_with($link,'ticari-mutabakat-aksiyon.php?vaka_id='),
    'reminder notification must deep-link to reconciliation case.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reconciliation action reminder milestones, Super Admin recipients, owner/date dedup cycles and stale-source guard\n";
