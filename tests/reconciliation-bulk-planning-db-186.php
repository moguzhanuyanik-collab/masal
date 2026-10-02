<?php
declare(strict_types=1);

function fail_186(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_186(bool $condition,string $message): void { if(!$condition) fail_186($message); }

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
}catch(Throwable $e){ fail_186('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function tm_tables_ready(PDO $pdo): bool { return true; }
function mhs_tables_ready(PDO $pdo): bool { return ma_tables_ready($pdo); }
function auth_effective_role(?array $user): ?string {
    return (string)($user['role']??$user['ana_rol']??'');
}
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

require __DIR__.'/../src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/../src/ticari_mutabakat_planlama.php';

$tables=[
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'ticari_belgeler','kurum_sozlesmeleri','kurumlar',
    'kullanici_rolleri','kullanicilar'
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
    para_birimi CHAR(3) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_belgeler(
    id BIGINT UNSIGNED NOT NULL,
    sozlesme_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    para_birimi CHAR(3) NOT NULL,
    belge_no VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vakalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    anahtar CHAR(64) NOT NULL,
    kaynak_turu VARCHAR(30) NOT NULL,
    kaynak_kodu VARCHAR(40) NOT NULL,
    kaynak_id BIGINT UNSIGNED NULL,
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
    kapanma_kodu VARCHAR(40) NULL,
    kapanma_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_mutabakat_vaka_anahtar(anahtar)
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

$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif) VALUES
    (1,'actor@test.local','Ana Süper Admin','super_admin',1),
    (2,'owner@test.local','İkincil Süper Admin','yonetici',1),
    (3,'manager@test.local','Normal Yönetici','yonetici',1),
    (4,'inactive@test.local','Pasif Süper Admin','super_admin',0)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (2,'super_admin')");

$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES
    (10,'k10','Kurum 10'),(20,'k20','Kurum 20'),(30,'k30','Kurum 30'),
    (40,'k40','Kurum 40'),(99,'k99','Yanlış Kurum')");

$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no,para_birimi) VALUES
    (10,10,'S-10','TRY'),(20,20,'S-20','TRY'),(30,30,'S-30','TRY'),(40,40,'S-40','TRY')");

$pdo->exec("INSERT INTO ticari_belgeler(id,sozlesme_id,kurum_id,para_birimi,belge_no) VALUES
    (101,10,99,'TRY','B-101'),
    (102,20,99,'TRY','B-102'),
    (103,30,99,'TRY','B-103'),
    (104,40,40,'TRY','B-104')");

$pdo->exec("INSERT INTO ticari_mutabakat_vakalari
    (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,son_aciklama)
    VALUES
    (1,REPEAT('1',64),'belge_kimlik','belge_kimlik_uyumsuz',101,10,99,'TRY','butunluk','acik','Açık belge kimlik sorunu'),
    (2,REPEAT('2',64),'belge_kimlik','belge_kimlik_uyumsuz',102,20,99,'TRY','butunluk','incelemede','Açık belge kimlik sorunu'),
    (3,REPEAT('3',64),'belge_kimlik','belge_kimlik_uyumsuz',103,30,99,'TRY','butunluk','kapali','Daha önce kapanmış vaka'),
    (4,REPEAT('4',64),'belge_kimlik','belge_kimlik_uyumsuz',104,40,40,'TRY','butunluk','acik','Kaynağı artık çözülmüş stale vaka')");

$actor=['id'=>1,'role'=>'super_admin'];

$admins=map_super_admin_rows($pdo);
$adminIds=array_map(static fn(array $row):int=>(int)$row['id'],$admins);
sort($adminIds);
ok_186($adminIds===[1,2],'active primary or secondary-role Super Admin list mismatch.');

$normalized=map_normalize_case_ids([2,1,1,'2']);
ok_186($normalized===[1,2],'case id normalization must deduplicate and sort.');

$tomorrow=(new DateTimeImmutable('today'))->modify('+1 day')->format('Y-m-d');
$result=map_bulk_plan($pdo,$actor,[2,1,1],2,$tomorrow,'Dönem kapanışı dağıtımı');
ok_186((int)$result['updated']===2,'two unique open cases should be planned.');

$planned=$pdo->query("SELECT id,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,durum
    FROM ticari_mutabakat_vakalari WHERE id IN (1,2) ORDER BY id")->fetchAll(PDO::FETCH_ASSOC);
ok_186(count($planned)===2,'planned case rows missing.');
foreach($planned as $row){
    ok_186((int)$row['sorumlu_kullanici_id']===2,'planned owner must be selected secondary-role Super Admin.');
    ok_186((string)$row['sonraki_aksiyon_tarihi']===$tomorrow,'planned next-action date mismatch.');
}
ok_186((string)$planned[0]['durum']==='acik' && (string)$planned[1]['durum']==='incelemede',
    'bulk planning must not silently change case stages.');

ok_186((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='toplu_planlama'")->fetchColumn()===2,
    'each planned case must receive one append-only planning history record.');
ok_186((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='takip_notu' OR kod LIKE 'asama_%'")->fetchColumn()===0,
    'bulk owner/date planning must not count as first operational intervention.');

$invalidOwner=false;
try{map_bulk_plan($pdo,$actor,[1],3,$tomorrow,'');}catch(RuntimeException){$invalidOwner=true;}
ok_186($invalidOwner,'normal manager must not be assignable as bulk planning owner.');

$inactiveOwner=false;
try{map_bulk_plan($pdo,$actor,[1],4,$tomorrow,'');}catch(RuntimeException){$inactiveOwner=true;}
ok_186($inactiveOwner,'inactive Super Admin must not be assignable.');

$past=(new DateTimeImmutable('today'))->modify('-1 day')->format('Y-m-d');
$pastBlocked=false;
try{map_bulk_plan($pdo,$actor,[1],2,$past,'');}catch(RuntimeException){$pastBlocked=true;}
ok_186($pastBlocked,'past bulk next-action date must be blocked.');

$tooMany=false;
try{map_normalize_case_ids(range(1,101));}catch(RuntimeException){$tooMany=true;}
ok_186($tooMany,'more than 100 selected cases must be rejected.');

$beforeOwner=(int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn();
$beforeDate=(string)$pdo->query("SELECT sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn();
$beforeHistory=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE vaka_id=1")->fetchColumn();

$closedRollback=false;
try{
    map_bulk_plan(
        $pdo,$actor,[1,3],1,
        (new DateTimeImmutable('today'))->modify('+2 days')->format('Y-m-d'),
        'Kapalı vaka karışık seçim'
    );
}catch(RuntimeException){$closedRollback=true;}
ok_186($closedRollback,'closed case in selection must reject entire bulk operation.');
ok_186((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeOwner,
    'closed-case rejection must rollback another selected case owner.');
ok_186((string)$pdo->query("SELECT sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeDate,
    'closed-case rejection must rollback another selected case action date.');
ok_186((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE vaka_id=1")->fetchColumn()===$beforeHistory,
    'closed-case rejection must not append partial history.');

$staleRollback=false;
try{
    map_bulk_plan(
        $pdo,$actor,[1,4],1,
        (new DateTimeImmutable('today'))->modify('+3 days')->format('Y-m-d'),
        'Stale kaynak karışık seçim'
    );
}catch(RuntimeException){$staleRollback=true;}
ok_186($staleRollback,'source-resolved stale case must reject entire bulk operation.');
ok_186((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeOwner,
    'stale-source rejection must rollback another selected case owner.');
ok_186((string)$pdo->query("SELECT sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeDate,
    'stale-source rejection must rollback another selected case action date.');
ok_186((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE vaka_id=1")->fetchColumn()===$beforeHistory,
    'stale-source rejection must not append partial history.');

$recent=map_recent_planning($pdo,20);
ok_186(count($recent)===2,'recent bulk planning audit feed must expose the two successful events.');
ok_186(str_contains((string)$recent[0]['not_metni'],'Dönem kapanışı dağıtımı'),
    'bulk planning audit note must retain operator plan note.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: atomic reconciliation bulk planning, Super Admin owner validation, stale/closed rollback and append-only audit\n";
