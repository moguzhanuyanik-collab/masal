<?php
declare(strict_types=1);

function fail_187(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_187(bool $condition,string $message): void { if(!$condition) fail_187($message); }

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
}catch(Throwable $e){ fail_187('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function mhs_tables_ready(PDO $pdo): bool { return true; }
function mhs_cycle_expr(string $alias='v'): string { return "{$alias}.olusturulma_tarihi"; }
function mhs_intervention_exists_expr(string $alias='v'): string {
    return "EXISTS(
        SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gi
        WHERE gi.vaka_id={$alias}.id
          AND (gi.kod='takip_notu' OR gi.kod LIKE 'asama_%')
    )";
}
function mhs_age_bucket(int $days): array {
    $days=max(0,$days);
    if($days<=1) return ['kod'=>'0_1','etiket'=>'0–1 gün'];
    if($days<=3) return ['kod'=>'2_3','etiket'=>'2–3 gün'];
    if($days<=7) return ['kod'=>'4_7','etiket'=>'4–7 gün'];
    return ['kod'=>'8_plus','etiket'=>'8+ gün'];
}

require __DIR__.'/../src/ticari_mutabakat_is_kutusu.php';

$tables=['ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari','kurum_sozlesmeleri','kullanicilar','kurumlar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Birinci Süper Admin',1),(2,'İkinci Süper Admin',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES
    (10,'a','A Kurumu'),(20,'b','B Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (100,10,'A-100'),(200,20,'B-200')");

$today=new DateTimeImmutable('today');

function add_case_187(PDO $pdo,int $contractId,int $institutionId,string $type,string $status,?int $owner,?string $next,string $desc,int $ageDays): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
        (anahtar,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,sorumlu_kullanici_id,
         sonraki_aksiyon_tarihi,son_tespit_tarihi,son_aciklama,olusturulma_tarihi,guncellenme_tarihi)
        VALUES (SHA2(UUID(),256),?,?,?,?,?,?,?,?,NOW(),?,DATE_SUB(NOW(),INTERVAL ? DAY),NOW())");
    $stmt->execute([$contractId,$contractId,$institutionId,'TRY',$type,$status,$owner,$next,$desc,$ageDays]);
    return (int)$pdo->lastInsertId();
}

$mineOverdue=add_case_187($pdo,100,10,'butunluk','acik',1,$today->modify('-1 day')->format('Y-m-d'),'A gecikmiş bütünlük',9);
$mineToday=add_case_187($pdo,100,10,'operasyon','incelemede',1,$today->format('Y-m-d'),'A bugün operasyon',3);
$mineNext2=add_case_187($pdo,100,10,'operasyon','acik',1,$today->modify('+2 days')->format('Y-m-d'),'A iki gün',1);
$mineNext5=add_case_187($pdo,100,10,'butunluk','acik',1,$today->modify('+5 days')->format('Y-m-d'),'A beş gün',5);
$mineNoDate=add_case_187($pdo,100,10,'operasyon','acik',1,null,'A tarihsiz',2);
$mineWaiting=add_case_187($pdo,100,10,'operasyon','beklemede',1,$today->modify('+10 days')->format('Y-m-d'),'A dış aksiyon',4);
$otherOverdue=add_case_187($pdo,200,20,'butunluk','acik',2,$today->modify('-2 days')->format('Y-m-d'),'B diğer sorumlu',6);
$unassigned=add_case_187($pdo,200,20,'operasyon','acik',null,null,'B sahipsiz',1);
$closed=add_case_187($pdo,200,20,'butunluk','kapali',1,$today->format('Y-m-d'),'B kapalı',30);

$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi(vaka_id,kullanici_id,tur,kod,not_metni)
    VALUES (?,1,'not','takip_notu','İncelendi')")->execute([$mineToday]);

$actor=['id'=>1,'role'=>'super_admin'];

$summary=mi_summary($pdo,$actor);
ok_187((int)$summary['mine_open']===6,'mine open summary mismatch.');
ok_187((int)$summary['mine_overdue']===1,'mine overdue summary mismatch.');
ok_187((int)$summary['mine_today']===1,'mine today summary mismatch.');
ok_187((int)$summary['mine_next3']===1,'mine next3 summary mismatch.');
ok_187((int)$summary['mine_next7']===2,'mine next7 summary mismatch.');
ok_187((int)$summary['mine_no_date']===1,'mine no-date summary mismatch.');
ok_187((int)$summary['mine_waiting']===1,'mine waiting summary mismatch.');
ok_187((int)$summary['unassigned']===1,'unassigned summary mismatch.');

$mine=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'all'],100);
ok_187(count($mine)===6,'mine scope must include only actor open cases.');
foreach($mine as $row) ok_187((int)$row['sorumlu_kullanici_id']===1,'mine scope leaked another owner.');

$overdue=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'overdue'],100);
ok_187(count($overdue)===1 && (int)$overdue[0]['id']===$mineOverdue,'overdue window mismatch.');

$todayRows=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'today'],100);
ok_187(count($todayRows)===1 && (int)$todayRows[0]['id']===$mineToday,'today window mismatch.');
ok_187(empty($todayRows[0]['ilk_mudahale_yok']),'current-cycle intervention should be visible.');

$next3=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'next3'],100);
ok_187(count($next3)===1 && (int)$next3[0]['id']===$mineNext2,'next3 window mismatch.');

$next7=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'next7'],100);
$next7Ids=array_map(static fn(array $row):int=>(int)$row['id'],$next7);
sort($next7Ids);
$expected=[$mineNext2,$mineNext5]; sort($expected);
ok_187($next7Ids===$expected,'next7 window mismatch.');

$noDate=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'no_date'],100);
ok_187(count($noDate)===1 && (int)$noDate[0]['id']===$mineNoDate,'no-date window mismatch.');

$unassignedRows=mi_case_rows($pdo,$actor,['scope'=>'unassigned','window'=>'all'],100);
ok_187(count($unassignedRows)===1 && (int)$unassignedRows[0]['id']===$unassigned,'unassigned scope mismatch.');

$owner2=mi_case_rows($pdo,$actor,['scope'=>'team','owner_id'=>'2','window'=>'all'],100);
ok_187(count($owner2)===1 && (int)$owner2[0]['id']===$otherOverdue,'direct owner-id filter mismatch.');

$integrity=mi_case_rows($pdo,$actor,['scope'=>'team','sorun_turu'=>'butunluk','window'=>'all'],100);
ok_187(count($integrity)===3,'team integrity filter must exclude closed case and include three open integrity cases.');

$search=mi_case_rows($pdo,$actor,['scope'=>'team','q'=>'dış aksiyon','window'=>'all'],100);
ok_187(count($search)===1 && (int)$search[0]['id']===$mineWaiting,'diagnosis search mismatch.');

$team=mi_team_workload($pdo,20);
ok_187(count($team)===3,'team workload should include owner1, owner2 and unassigned.');
$owners=[];
foreach($team as $row)$owners[(int)$row['sorumlu_kullanici_id']]=$row;
ok_187((int)$owners[1]['open_count']===6,'owner1 workload mismatch.');
ok_187((int)$owners[1]['overdue_count']===1,'owner1 overdue workload mismatch.');
ok_187((int)$owners[1]['today_count']===1,'owner1 today workload mismatch.');
ok_187((int)$owners[1]['next7_count']===2,'owner1 next7 workload mismatch.');
ok_187((int)$owners[1]['no_date_count']===1,'owner1 no-date workload mismatch.');
ok_187((int)$owners[0]['open_count']===1,'unassigned workload mismatch.');

$notAdmin=mi_case_rows($pdo,['id'=>2,'role'=>'yonetici'],['scope'=>'team'],100);
ok_187($notAdmin===[],'non-super-admin inbox query must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reconciliation personal inbox scopes, date windows, owner filtering, health semantics and team workload\n";
