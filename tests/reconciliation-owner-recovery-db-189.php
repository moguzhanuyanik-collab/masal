<?php
declare(strict_types=1);

function fail_189(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_189(bool $condition,string $message): void { if(!$condition) fail_189($message); }

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
}catch(Throwable $e){ fail_189('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
function ma_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'ticari_mutabakat_vakalari')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi');
}
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_case_source_still_open(PDO $pdo,array $case): bool { return (int)($case['id']??0)!==8; }
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
        (vaka_id,kullanici_id,tur,kod,not_metni) VALUES (?,?,?,?,?)");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
    $stmt->closeCursor();
}

require __DIR__.'/../src/ticari_mutabakat_devir.php';

$tables=[
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'kurum_sozlesmeleri','kurumlar','kullanici_rolleri','kullanicilar'
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
    (2,'target@test.local','İkincil Süper Admin','yonetici',1),
    (3,'manager@test.local','Normal Yönetici','yonetici',1),
    (4,'inactive@test.local','Pasif Süper Admin','super_admin',0),
    (5,'former@test.local','Eski Süper Admin','yonetici',1),
    (6,'valid@test.local','Geçerli Süper Admin','super_admin',1)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES (2,'super_admin')");

for($i=1;$i<=9;$i++){
    $institutionId=$i*10;
    $contractId=$i*100;
    $pdo->prepare("INSERT INTO kurumlar(id,kod,ad) VALUES (?,?,?)")
        ->execute([$institutionId,'k'.$institutionId,'Kurum '.$institutionId]);
    $pdo->prepare("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES (?,?,?)")
        ->execute([$contractId,$institutionId,'S-'.$i]);
}

$today=new DateTimeImmutable('today');
function add_case_189(
    PDO $pdo,int $id,string $status,?int $ownerId,?string $actionDate,string $type='operasyon'
): void {
    $institutionId=$id*10;
    $contractId=$id*100;
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
        (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,
         sorun_turu,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama)
        VALUES (?,REPEAT(?,64),'sozlesme_mutabakat','eksik',?,?,?,'TRY',?,?,?,?,?)");
    $stmt->execute([
        $id,(string)$id,$contractId,$contractId,$institutionId,
        $type,$status,$ownerId,$actionDate,'Vaka '.$id.' teşhis metni'
    ]);
}

add_case_189($pdo,1,'acik',null,$today->modify('+1 day')->format('Y-m-d'));
add_case_189($pdo,2,'incelemede',4,$today->format('Y-m-d'),'butunluk');
add_case_189($pdo,3,'beklemede',5,$today->modify('-1 day')->format('Y-m-d'));
add_case_189($pdo,4,'acik',99,null);
add_case_189($pdo,5,'acik',6,$today->modify('+2 days')->format('Y-m-d'));
add_case_189($pdo,6,'acik',3,$today->modify('+2 days')->format('Y-m-d'));
add_case_189($pdo,7,'kapali',null,$today->modify('-1 day')->format('Y-m-d'));
add_case_189($pdo,8,'acik',null,$today->modify('-2 days')->format('Y-m-d'));
add_case_189($pdo,9,'acik',null,$today->modify('-3 days')->format('Y-m-d'));

ok_189((string)mdv_owner_status($pdo,null)['kod']==='sahipsiz','unassigned owner status mismatch.');
ok_189((string)mdv_owner_status($pdo,4)['kod']==='pasif','inactive owner status mismatch.');
ok_189((string)mdv_owner_status($pdo,5)['kod']==='rol_gecersiz','former Super Admin status mismatch.');
ok_189((string)mdv_owner_status($pdo,99)['kod']==='kullanici_yok','missing owner status mismatch.');
ok_189((string)mdv_owner_status($pdo,2)['kod']==='gecerli','secondary-role active Super Admin must be valid.');
ok_189((string)mdv_owner_status($pdo,6)['kod']==='gecerli','primary active Super Admin must be valid.');

$rows=mdv_rows($pdo,[],100);
$ids=array_map(static fn(array $row):int=>(int)$row['id'],$rows);
sort($ids);
ok_189($ids===[1,2,3,4,6,8,9],
    'recovery queue must contain only open cases with invalid/unassigned owners.');

$summary=mdv_summary($pdo);
ok_189((int)$summary['toplam']===7,'recovery summary total mismatch.');
ok_189((int)$summary['sahipsiz']===3,'unassigned recovery count mismatch.');
ok_189((int)$summary['pasif']===1,'inactive recovery count mismatch.');
ok_189((int)$summary['rol_gecersiz']===2,'role-invalid recovery count mismatch.');
ok_189((int)$summary['kullanici_yok']===1,'missing-user recovery count mismatch.');
ok_189((int)$summary['aksiyon_gecikti']===3,'overdue orphan action count mismatch.');

$passive=mdv_rows($pdo,['sorumlu_durumu'=>'pasif'],100);
ok_189(count($passive)===1 && (int)$passive[0]['id']===2,'passive-owner filter mismatch.');
$search=mdv_rows($pdo,['q'=>'Kurum 40'],100);
ok_189(count($search)===1 && (int)$search[0]['id']===4,'owner recovery search mismatch.');

ok_189(mdv_normalize_case_ids([3,1,1,'3'])===[1,3],'case normalization must deduplicate and sort.');
$tooMany=false;
try{mdv_normalize_case_ids(range(1,101));}catch(RuntimeException){$tooMany=true;}
ok_189($tooMany,'more than 100 cases must be rejected.');

$actor=['id'=>1,'role'=>'super_admin'];

$invalidTarget=false;
try{mdv_transfer($pdo,$actor,[1],3,'');}catch(RuntimeException){$invalidTarget=true;}
ok_189($invalidTarget,'normal manager must not be a recovery target.');

$inactiveTarget=false;
try{mdv_transfer($pdo,$actor,[1],4,'');}catch(RuntimeException){$inactiveTarget=true;}
ok_189($inactiveTarget,'inactive Super Admin must not be a recovery target.');

$beforeOwner=$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn();
$validRollback=false;
try{mdv_transfer($pdo,$actor,[1,5],2,'Geçerli sahip karışık seçim');}catch(RuntimeException){$validRollback=true;}
ok_189($validRollback,'valid-owner case must reject whole recovery transaction.');
ok_189($pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeOwner,
    'valid-owner rejection must rollback another selected orphan.');

$closedRollback=false;
try{mdv_transfer($pdo,$actor,[1,7],2,'Kapalı vaka karışık seçim');}catch(RuntimeException){$closedRollback=true;}
ok_189($closedRollback,'closed case must reject whole recovery transaction.');
ok_189($pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeOwner,
    'closed-case rejection must rollback another selected orphan.');

$staleRollback=false;
try{mdv_transfer($pdo,$actor,[1,8],2,'Stale kaynak karışık seçim');}catch(RuntimeException){$staleRollback=true;}
ok_189($staleRollback,'source-resolved case must reject whole recovery transaction.');
ok_189($pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===$beforeOwner,
    'stale-source rejection must rollback another selected orphan.');

$beforeDates=[];
$beforeStages=[];
foreach([1,2,3,4,6,9] as $id){
    $row=$pdo->query("SELECT durum,sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id={$id}")->fetch(PDO::FETCH_ASSOC);
    $beforeStages[$id]=(string)$row['durum'];
    $beforeDates[$id]=$row['sonraki_aksiyon_tarihi']!==null?(string)$row['sonraki_aksiyon_tarihi']:null;
}

$result=mdv_transfer($pdo,$actor,[9,6,4,3,2,1,1],2,'Vardiya ve yetki değişimi');
ok_189((int)$result['updated']===6,'six unique orphan/invalid-owner cases should be transferred.');
ok_189((int)$result['owner_id']===2,'selected secondary-role Super Admin must become owner.');

foreach([1,2,3,4,6,9] as $id){
    $row=$pdo->query("SELECT durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi
        FROM ticari_mutabakat_vakalari WHERE id={$id}")->fetch(PDO::FETCH_ASSOC);
    ok_189((int)$row['sorumlu_kullanici_id']===2,'recovered case owner mismatch for #'.$id);
    ok_189((string)$row['durum']===$beforeStages[$id],'owner recovery must not change stage for #'.$id);
    $date=$row['sonraki_aksiyon_tarihi']!==null?(string)$row['sonraki_aksiyon_tarihi']:null;
    ok_189($date===$beforeDates[$id],'owner recovery must preserve next-action date for #'.$id);
}

ok_189((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE tur='planlama' AND kod='sorumlu_devir'")->fetchColumn()===6,
    'each recovered case must receive one append-only transfer history.');
ok_189((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='sorumlu_devir' AND not_metni LIKE '%Vardiya ve yetki değişimi%'")->fetchColumn()===6,
    'operator transfer note must be preserved in each case audit record.');
ok_189((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='takip_notu' OR kod LIKE 'asama_%'")->fetchColumn()===0,
    'owner recovery must not count as operational intervention.');

$afterRows=mdv_rows($pdo,[],100);
$afterIds=array_map(static fn(array $row):int=>(int)$row['id'],$afterRows);
ok_189($afterIds===[8],
    'after recovery only stale-source orphan should remain listed until case synchronization.');

$recent=mdv_recent_transfers($pdo,20);
ok_189(count($recent)===6,'recent owner transfer audit feed must expose all successful transfers.');

$wrongActor=false;
try{mdv_transfer($pdo,['id'=>3,'role'=>'yonetici'],[8],2,'');}catch(RuntimeException){$wrongActor=true;}
ok_189($wrongActor,'non-Super-Admin actor must not transfer orphan cases.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: invalid reconciliation owner detection, atomic recovery, valid-owner/stale rollback, action-date preservation and append-only audit\n";
