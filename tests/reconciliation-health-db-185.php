<?php
declare(strict_types=1);

function fail_185(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_185(bool $condition,string $message): void { if(!$condition) fail_185($message); }

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
}catch(Throwable $e){ fail_185('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function ma_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'ticari_mutabakat_vakalari')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi');
}

require __DIR__.'/../src/ticari_mutabakat_saglik.php';

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
    aktif TINYINT(1) NOT NULL DEFAULT 1,
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
    (1,'Admin Bir',1),(2,'Admin İki',1)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad,aktif) VALUES
    (10,'a','A Kurumu',1),(20,'b','B Kurumu',1)");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (101,10,'SOZ-A1'),(102,10,'SOZ-A2'),(103,10,'SOZ-A3'),(104,20,'SOZ-B1'),
    (105,20,'SOZ-B2'),(106,20,'SOZ-B3'),(107,10,'SOZ-A7'),(108,20,'SOZ-B8')");

function case_185(
    PDO $pdo,int $id,int $institutionId,int $contractId,string $type,string $stage,
    ?int $owner,?string $nextAction,string $createdAgo,?string $closedAgo=null
): void {
    $closed=$closedAgo!==null?"DATE_SUB(NOW(),INTERVAL {$closedAgo})":'NULL';
    $sql="INSERT INTO ticari_mutabakat_vakalari
        (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,
         sorun_turu,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_tespit_tarihi,
         son_aciklama,kapanma_kodu,kapanma_tarihi,olusturulma_tarihi,guncellenme_tarihi)
        VALUES (?,SHA2(CONCAT('case-',?),256),'sozlesme_mutabakat','eksik',?,?,?,'TRY',
                ?,?,?,?,NOW(),?,?,$closed,DATE_SUB(NOW(),INTERVAL {$createdAgo}),NOW())";
    $stmt=$pdo->prepare($sql);
    $stmt->execute([
        $id,$id,$contractId,$contractId,$institutionId,
        $type,$stage,$owner,$nextAction,'Vaka '.$id,
        $closedAgo!==null?'kaynak_cozuldu':null
    ]);
}

$today=(new DateTimeImmutable('today'))->format('Y-m-d');
$yesterday=(new DateTimeImmutable('today'))->modify('-1 day')->format('Y-m-d');
$plus2=(new DateTimeImmutable('today'))->modify('+2 days')->format('Y-m-d');

case_185($pdo,1,10,101,'butunluk','acik',null,null,'0 DAY');
case_185($pdo,2,10,102,'operasyon','incelemede',1,$today,'2 DAY');
case_185($pdo,3,10,103,'butunluk','beklemede',2,$yesterday,'5 DAY');
case_185($pdo,4,20,104,'operasyon','acik',1,$plus2,'10 DAY');
case_185($pdo,5,20,105,'butunluk','kapali',1,null,'20 DAY','2 DAY');
case_185($pdo,6,20,106,'operasyon','kapali',2,null,'50 DAY','1 DAY');
case_185($pdo,7,10,107,'butunluk','acik',2,null,'100 DAY');
case_185($pdo,8,20,108,'operasyon','acik',null,$today,'8 DAY');

$pdo->exec("INSERT INTO ticari_mutabakat_vaka_gecmisi(vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi) VALUES
    (2,1,'durum','asama_incelemede','İncelemeye alındı',DATE_SUB(NOW(),INTERVAL 1 DAY)),
    (3,2,'not','takip_notu','Dış dönüş bekleniyor',DATE_SUB(NOW(),INTERVAL 4 DAY)),
    (4,1,'not','takip_notu','Kontrol edildi',DATE_SUB(NOW(),INTERVAL 9 DAY)),
    (6,2,'durum','vaka_yeniden_acildi','Tekrar açıldı',DATE_SUB(NOW(),INTERVAL 5 DAY)),
    (6,2,'not','takip_notu','Tekrar incelendi',DATE_SUB(NOW(),INTERVAL 4 DAY)),
    (7,2,'not','takip_notu','Eski döngü notu',DATE_SUB(NOW(),INTERVAL 90 DAY)),
    (7,2,'durum','vaka_yeniden_acildi','Yeni döngü',DATE_SUB(NOW(),INTERVAL 1 DAY))");

ok_185(mhs_age_bucket(0)['kod']==='0_1','day 0 bucket mismatch.');
ok_185(mhs_age_bucket(1)['kod']==='0_1','day 1 bucket mismatch.');
ok_185(mhs_age_bucket(2)['kod']==='2_3','day 2 bucket mismatch.');
ok_185(mhs_age_bucket(3)['kod']==='2_3','day 3 bucket mismatch.');
ok_185(mhs_age_bucket(4)['kod']==='4_7','day 4 bucket mismatch.');
ok_185(mhs_age_bucket(7)['kod']==='4_7','day 7 bucket mismatch.');
ok_185(mhs_age_bucket(8)['kod']==='8_plus','day 8+ bucket mismatch.');

$summary=mhs_summary($pdo);
ok_185((int)$summary['open']===6,'six cases should be open.');
ok_185((int)$summary['butunluk']===3,'three open integrity cases expected.');
ok_185((int)$summary['operasyon']===3,'three open operation cases expected.');
ok_185((int)$summary['yas_0_1']===2,'today and reopened-yesterday cases should be 0-1 days.');
ok_185((int)$summary['yas_2_3']===1,'one 2-3 day case expected.');
ok_185((int)$summary['yas_4_7']===1,'one 4-7 day case expected.');
ok_185((int)$summary['yas_8_plus']===2,'two 8+ day cases expected.');
ok_185((int)$summary['aksiyon_gecikti']===1,'one overdue next action expected.');
ok_185((int)$summary['aksiyon_bugun']===2,'two next actions due today expected.');
ok_185((int)$summary['sahipsiz']===2,'two unassigned cases expected.');
ok_185((int)$summary['aksiyon_tarihi_yok']===2,'two cases without next action date expected.');
ok_185((int)$summary['ilk_mudahale_yok']===3,'three current cycles without first intervention expected.');
ok_185((int)$summary['beklemede']===1,'one external-wait case expected.');

$all=mhs_case_rows($pdo,[],100);
ok_185(count($all)===6,'health queue must contain only open cases.');
$indexed=[];
foreach($all as $row)$indexed[(int)$row['id']]=$row;
ok_185((int)$indexed[7]['acik_gun']===1,
    'reopened 100-day-old case must age from yesterday reopen, not original creation.');
ok_185(!empty($indexed[7]['ilk_mudahale_yok']),
    'intervention before reopen must not satisfy current-cycle first intervention.');
ok_185(empty($indexed[2]['ilk_mudahale_yok']),
    'current-cycle stage action must count as first intervention.');

$age8=mhs_case_rows($pdo,['yas'=>'8_plus'],100);
$age8Ids=array_map(static fn(array $r):int=>(int)$r['id'],$age8);
sort($age8Ids);
ok_185($age8Ids===[4,8],'8+ age SQL filter must return cases 4 and 8 only.');

$overdue=mhs_case_rows($pdo,['saglik'=>'aksiyon_gecikti'],100);
ok_185(count($overdue)===1 && (int)$overdue[0]['id']===3,'overdue action SQL filter mismatch.');

$unassigned=mhs_case_rows($pdo,['saglik'=>'sahipsiz'],100);
$unassignedIds=array_map(static fn(array $r):int=>(int)$r['id'],$unassigned);
sort($unassignedIds);
ok_185($unassignedIds===[1,8],'unassigned SQL filter mismatch.');

$noIntervention=mhs_case_rows($pdo,['saglik'=>'ilk_mudahale_yok'],100);
$noInterventionIds=array_map(static fn(array $r):int=>(int)$r['id'],$noIntervention);
sort($noInterventionIds);
ok_185($noInterventionIds===[1,7,8],'current-cycle no-intervention filter mismatch.');

$owner1=mhs_case_rows($pdo,['sorumlu_kullanici_id'=>'1'],100);
ok_185(count($owner1)===2,'owner 1 should have two open cases.');
$ownerNone=mhs_case_rows($pdo,['sorumlu_kullanici_id'=>'unassigned'],100);
ok_185(count($ownerNone)===2,'unassigned owner filter mismatch.');

$search=mhs_case_rows($pdo,['q'=>'B Kurumu'],100);
ok_185(count($search)===2 && (int)$search[0]['kurum_id']===20 && (int)$search[1]['kurum_id']===20,
    'institution search must remain tenant-specific to matching rows.');

$owners=mhs_owner_workload($pdo,100);
ok_185(count($owners)===3,'owner workload should contain Admin Bir, Admin İki and unassigned.');
$ownerMap=[];
foreach($owners as $row)$ownerMap[(int)$row['sorumlu_kullanici_id']]=$row;
ok_185((int)$ownerMap[0]['open_count']===2 && (int)$ownerMap[0]['age_8_plus']===1,
    'unassigned workload counts mismatch.');
ok_185((int)$ownerMap[1]['open_count']===2,'Admin Bir workload mismatch.');
ok_185((int)$ownerMap[2]['open_count']===2 && (int)$ownerMap[2]['overdue_action']===1,
    'Admin İki workload mismatch.');

$closed=mhs_recent_closed_metrics($pdo,30);
ok_185((int)$closed['closed']===2,'two cases should have closed in last 30 days.');
ok_185(abs((float)$closed['avg_cycle_days']-11.0)<0.2,
    'closed-cycle average must use latest reopen for reopened case.');
ok_185((int)$closed['max_cycle_days']===18,'max closed cycle should be 18 days.');
ok_185((int)$closed['reopened_closed']===1,'one recently closed case should have a reopen history.');

$beforeCases=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vakalari")->fetchColumn();
$beforeHistory=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn();
mhs_summary($pdo);
mhs_case_rows($pdo,['yas'=>'8_plus'],100);
mhs_owner_workload($pdo,100);
mhs_recent_closed_metrics($pdo,30);
ok_185((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vakalari")->fetchColumn()===$beforeCases,
    'health analytics must not modify case rows.');
ok_185((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn()===$beforeHistory,
    'health analytics must not modify case history.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reconciliation reopen-cycle aging, health filters, owner workload, closure metrics and read-only behavior\n";
