<?php
declare(strict_types=1);

function fail_191(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_191(bool $condition,string $message): void { if(!$condition) fail_191($message); }

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
}catch(Throwable $e){ fail_191('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
require __DIR__.'/../src/ticari_mutabakat_performans.php';

$tables=[
    'ticari_mutabakat_eskalasyonlari','ticari_mutabakat_aksiyon_hatirlatmalari',
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'kurum_sozlesmeleri','kullanicilar','kurumlar'
];
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
    durum VARCHAR(20) NOT NULL,
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    sonraki_aksiyon_tarihi DATE NULL,
    son_tespit_tarihi DATETIME NULL,
    son_aciklama VARCHAR(2000) NULL,
    kapanma_kodu VARCHAR(40) NULL,
    kapanma_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL,
    guncellenme_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY uk_case_key(anahtar)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ticari_mutabakat_vaka_gecmisi(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NULL,
    tur VARCHAR(20) NOT NULL,
    kod VARCHAR(40) NULL,
    not_metni VARCHAR(2000) NULL,
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
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
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
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
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES (1,'Admin Bir'),(2,'Admin İki')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'A','A Kurumu'),(20,'B','B Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES (101,10,'A-101'),(202,20,'B-202')");

function add_case_191(PDO $pdo,array $x): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,
       sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama,kapanma_kodu,kapanma_tarihi,
       olusturan_kullanici_id,guncelleyen_kullanici_id,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (SHA2(?,256),'sozlesme_mutabakat','eksik',?,?,?,'TRY',?,?,?,?,?,'kaynak_cozuldu',?,?,?, ?,?)");
    $stmt->execute([
        $x['key'],$x['contract'],$x['contract'],$x['institution'],$x['type'],$x['status'],$x['owner'],
        $x['action'],$x['note'],$x['closed'],1,1,$x['created'],$x['updated']
    ]);
    return (int)$pdo->lastInsertId();
}
function add_history_191(PDO $pdo,int $caseId,string $type,string $code,string $when): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,1,?,?,?,?)");
    $stmt->execute([$caseId,$type,$code,$code,$when]);
}

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');

$c1=add_case_191($pdo,[
    'key'=>'c1','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Kapandı','closed'=>$fmt($now->modify('-5 days')),
    'created'=>$fmt($now->modify('-10 days')),'updated'=>$fmt($now->modify('-5 days'))
]);
add_history_191($pdo,$c1,'durum','vaka_acildi',$fmt($now->modify('-10 days')));
add_history_191($pdo,$c1,'not','takip_notu',$fmt($now->modify('-10 days +2 hours')));
add_history_191($pdo,$c1,'durum','kaynak_cozuldu',$fmt($now->modify('-5 days')));

$c2=add_case_191($pdo,[
    'key'=>'c2','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'kapali','owner'=>2,
    'action'=>null,'note'=>'Reopen kapandı','closed'=>$fmt($now->modify('-2 days')),
    'created'=>$fmt($now->modify('-50 days')),'updated'=>$fmt($now->modify('-2 days'))
]);
add_history_191($pdo,$c2,'durum','vaka_acildi',$fmt($now->modify('-50 days')));
add_history_191($pdo,$c2,'durum','vaka_yeniden_acildi',$fmt($now->modify('-6 days')));
add_history_191($pdo,$c2,'durum','asama_incelemede',$fmt($now->modify('-6 days +3 hours')));
add_history_191($pdo,$c2,'durum','kaynak_cozuldu',$fmt($now->modify('-2 days')));

$c3=add_case_191($pdo,[
    'key'=>'c3','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
    'action'=>$now->modify('-2 days')->format('Y-m-d'),'note'=>'Açık','closed'=>null,
    'created'=>$fmt($now->modify('-20 days')),'updated'=>$fmt($now->modify('-1 day'))
]);
add_history_191($pdo,$c3,'durum','vaka_acildi',$fmt($now->modify('-20 days')));

$c4=add_case_191($pdo,[
    'key'=>'c4','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'incelemede','owner'=>2,
    'action'=>$now->format('Y-m-d'),'note'=>'İncelemede','closed'=>null,
    'created'=>$fmt($now->modify('-3 days')),'updated'=>$fmt($now->modify('-1 hour'))
]);
add_history_191($pdo,$c4,'durum','vaka_acildi',$fmt($now->modify('-3 days')));
add_history_191($pdo,$c4,'not','takip_notu',$fmt($now->modify('-3 days +1 hour')));

$c5=add_case_191($pdo,[
    'key'=>'c5','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Eski kapanış','closed'=>$fmt($now->modify('-40 days')),
    'created'=>$fmt($now->modify('-60 days')),'updated'=>$fmt($now->modify('-40 days'))
]);
add_history_191($pdo,$c5,'durum','vaka_acildi',$fmt($now->modify('-60 days')));
add_history_191($pdo,$c5,'not','takip_notu',$fmt($now->modify('-59 days')));
add_history_191($pdo,$c5,'durum','kaynak_cozuldu',$fmt($now->modify('-40 days')));

$pdo->exec("INSERT INTO ticari_mutabakat_aksiyon_hatirlatmalari
  (vaka_id,kurum_id,alici_kullanici_id,aksiyon_tarihi,esik_kodu,olusturulma_tarihi)
  VALUES
  ({$c3},10,1,CURDATE(),'bugun',DATE_SUB(NOW(),INTERVAL 3 DAY)),
  ({$c4},20,2,CURDATE(),'bugun',DATE_SUB(NOW(),INTERVAL 2 DAY)),
  ({$c5},10,1,CURDATE(),'gecikme_7',DATE_SUB(NOW(),INTERVAL 40 DAY))");
$pdo->exec("INSERT INTO ticari_mutabakat_eskalasyonlari
  (vaka_id,kurum_id,alici_kullanici_id,dongu_anahtari,dongu_baslangic_tarihi,esik_kodu,acik_gun,olusturulma_tarihi)
  VALUES
  ({$c3},10,1,REPEAT('a',64),DATE_SUB(NOW(),INTERVAL 20 DAY),'dongu_14',20,DATE_SUB(NOW(),INTERVAL 3 DAY)),
  ({$c2},20,2,REPEAT('b',64),DATE_SUB(NOW(),INTERVAL 6 DAY),'dongu_4',4,DATE_SUB(NOW(),INTERVAL 2 DAY))");

ok_191(mp_window_days(1)===30 && mp_window_days(7)===7 && mp_window_days(90)===90,
    'window normalization mismatch.');

$s=mp_summary($pdo,30);
ok_191((int)$s['open']===2,'current open count mismatch.');
ok_191((int)$s['open_age_8_plus']===1,'8+ open count mismatch.');
ok_191((int)$s['open_overdue_action']===1,'overdue open action count mismatch.');
ok_191((int)$s['open_no_first_intervention']===1,'open first-intervention gap mismatch.');
ok_191((int)$s['closed']===2,'30-day closed count mismatch.');
ok_191(abs((float)$s['avg_cycle_days']-4.5)<0.2,'reopen-aware average cycle must be about 4.5 days.');
ok_191((int)$s['max_cycle_days']===5,'max cycle mismatch.');
ok_191((int)$s['reopened_closed']===1,'reopened closed count mismatch.');
ok_191(abs((float)$s['reopen_rate']-50.0)<0.1,'reopen rate mismatch.');
ok_191((int)$s['responded_closed']===2,'responded closed count mismatch.');
ok_191(abs((float)$s['avg_first_response_hours']-2.5)<0.2,'average first response mismatch.');
ok_191(abs((float)$s['max_first_response_hours']-3.0)<0.2,'max first response mismatch.');
ok_191((int)$s['opened_cycles']===4,'opened/reopened cycles in 30 days mismatch.');
ok_191((int)$s['reminders']===2,'30-day reminder count mismatch.');
ok_191((int)$s['escalations']===2,'30-day escalation count mismatch.');

$s90=mp_summary($pdo,90);
ok_191((int)$s90['closed']===3,'90-day window must include old closed case.');

$owners=mp_owner_rows($pdo,30,20);
ok_191(count($owners)===2,'two owner metric rows expected.');
$ownerMap=[];
foreach($owners as $row)$ownerMap[(int)$row['sorumlu_kullanici_id']]=$row;
ok_191((int)$ownerMap[1]['open_count']===1 && (int)$ownerMap[1]['closed_count']===1,
    'owner 1 open/closed metrics mismatch.');
ok_191((int)$ownerMap[1]['overdue_action']===1 && (int)$ownerMap[1]['age_8_plus']===1,
    'owner 1 current backlog metrics mismatch.');
ok_191(abs((float)$ownerMap[1]['avg_cycle_days']-5.0)<0.2,'owner 1 cycle mismatch.');
ok_191(abs((float)$ownerMap[1]['avg_first_response_hours']-2.0)<0.2,'owner 1 first response mismatch.');
ok_191((int)$ownerMap[1]['reminders']===1 && (int)$ownerMap[1]['escalations']===1,
    'owner 1 reminder/escalation volume mismatch.');
ok_191((int)$ownerMap[2]['open_count']===1 && (int)$ownerMap[2]['closed_count']===1,
    'owner 2 open/closed metrics mismatch.');
ok_191(abs((float)$ownerMap[2]['avg_cycle_days']-4.0)<0.2,'owner 2 reopen-aware cycle mismatch.');
ok_191((int)$ownerMap[2]['reopened_closed']===1,'owner 2 reopen metric mismatch.');

$issues=mp_issue_rows($pdo,30);
$issueMap=[];
foreach($issues as $row)$issueMap[(string)$row['sorun_turu']]=$row;
ok_191((int)$issueMap['operasyon']['open_count']===1 && (int)$issueMap['operasyon']['closed_count']===1,
    'operation issue metrics mismatch.');
ok_191((int)$issueMap['butunluk']['open_count']===1 && (int)$issueMap['butunluk']['closed_count']===1,
    'integrity issue metrics mismatch.');
ok_191((int)$issueMap['butunluk']['reopened_closed']===1,'integrity reopen metric mismatch.');

$recent=mp_recent_closed_rows($pdo,30,20);
ok_191(count($recent)===2,'30-day recent closed rows mismatch.');
$recentMap=[];
foreach($recent as $row)$recentMap[(int)$row['vaka_id']]=$row;
ok_191(abs((float)$recentMap[$c2]['cevrim_gun']-4.0)<0.2,
    'recent reopened case must use latest 6-day cycle start, not 50-day original creation.');
ok_191(abs((float)$recentMap[$c2]['ilk_mudahale_saat']-3.0)<0.2,
    'recent reopened case first response mismatch.');
ok_191(!empty($recentMap[$c2]['yeniden_acildi']),'recent reopened marker missing.');

$monthly=mp_monthly_closed($pdo,6);
$totalClosed=0;
foreach($monthly as $row)$totalClosed+=(int)$row['closed_count'];
ok_191($totalClosed===3,'six-month closed trend must include all three closed cases.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: reopen-aware cycle, first intervention, owner workload, reminder/escalation volume and closed trend\n";
