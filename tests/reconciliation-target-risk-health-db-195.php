<?php
declare(strict_types=1);

function fail_195(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_195(bool $condition,string $message): void { if(!$condition) fail_195($message); }

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
}catch(Throwable $e){ fail_195('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_saglik.php';

$tables=[
    'ticari_mutabakat_hedef_risk_bildirimleri',
    'kurum_duyuru_alicilari','kurum_duyurulari',
    'ticari_mutabakat_hedef_politikalari',
    'ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari',
    'kurum_sozlesmeleri','kullanicilar','kurumlar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL DEFAULT 'super_admin',
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
    id BIGINT UNSIGNED NOT NULL,
    anahtar CHAR(64) NOT NULL,
    kaynak_turu VARCHAR(30) NOT NULL DEFAULT 'sozlesme_mutabakat',
    kaynak_kodu VARCHAR(40) NOT NULL DEFAULT 'eksik',
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
    PRIMARY KEY(id)
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

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_politikalari(
    id BIGINT UNSIGNED NOT NULL,
    kapsam VARCHAR(20) NOT NULL,
    ilk_mudahale_saat INT UNSIGNED NOT NULL,
    cevrim_gun INT UNSIGNED NOT NULL,
    aciklama VARCHAR(1000) NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    gecerlilik_baslangici DATETIME NOT NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyurulari(
    id BIGINT UNSIGNED NOT NULL,
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
    olusturulma_tarihi DATETIME NOT NULL,
    guncellenme_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    okundu_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_risk_bildirimleri(
    id BIGINT UNSIGNED NOT NULL,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    hedef_politika_id BIGINT UNSIGNED NOT NULL,
    alici_kullanici_id BIGINT UNSIGNED NOT NULL,
    dongu_anahtari CHAR(64) NOT NULL,
    esik_kodu VARCHAR(40) NOT NULL,
    risk_kodu VARCHAR(30) NOT NULL,
    kullanim_orani DECIMAL(7,2) NULL,
    duyuru_id BIGINT UNSIGNED NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES
    (1,'Süper Admin A'),(2,'Süper Admin B')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES
    (10,'A','A Kurumu'),(20,'B','B Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (101,10,'A-101'),(202,20,'B-202')");
$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari
    (id,kapsam,ilk_mudahale_saat,cevrim_gun,gecerlilik_baslangici)
    VALUES (1,'genel',48,8,DATE_SUB(NOW(),INTERVAL 100 DAY)),
           (2,'operasyon',12,3,DATE_SUB(NOW(),INTERVAL 100 DAY))");

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');

function add_case_195(PDO $pdo,int $id,int $institutionId,int $contractId,string $type,string $status,int $owner,string $created,?string $closed=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,
       sorumlu_kullanici_id,kapanma_tarihi,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (?,SHA2(CONCAT('case-',?),256),'sozlesme_mutabakat','eksik',?,?,?,'TRY',?,?,?,?,?,?)");
    $stmt->execute([$id,$id,$contractId,$contractId,$institutionId,$type,$status,$owner,$closed,$created,$created]);
}
function add_notice_195(PDO $pdo,array $x): void {
    $pdo->prepare("INSERT INTO kurum_duyurulari
      (id,kurum_id,gonderen_kullanici_id,tur,kaynak_turu,kaynak_id,baslik,mesaj,onem,hedef_roller,baglanti,aktif,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (?,?,1,'sistem','mutabakat_hedef_risk_bildirim',?,'Risk','Risk','onemli','super_admin','ticari-mutabakat-aksiyon.php',1,?,?)")
      ->execute([$x['notice_id'],$x['institution'],$x['notification_id'],$x['sent'],$x['sent']]);
    $pdo->prepare("INSERT INTO kurum_duyuru_alicilari
      (duyuru_id,kurum_id,kullanici_id,kurum_rolu,okundu_tarihi,olusturulma_tarihi)
      VALUES (?,?,?,'super_admin',?,?)")
      ->execute([$x['notice_id'],$x['institution'],$x['owner'],$x['read'],$x['sent']]);
    $pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
      (id,vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,
       esik_kodu,risk_kodu,kullanim_orani,duyuru_id,gonderen_kullanici_id,olusturulma_tarihi)
      VALUES (?,?,?,?,?,?,?,?,?,?,1,?)")
      ->execute([
        $x['notification_id'],$x['case_id'],$x['institution'],$x['policy'],$x['owner'],$x['cycle_key'],
        $x['signal'],$x['signal']==='hedef_disinda'?'hedef_disinda':'yuzde_75',$x['usage'],
        $x['notice_id'],$x['sent']
      ]);
}

$c1Start=$now->modify('-5 days');
$c2Start=$now->modify('-12 days');
$c3Start=$now->modify('-15 days');
$c4Start=$now->modify('-20 days');
$c4Reopen=$now->modify('-3 days');
$c5Start=$now->modify('-10 days');

add_case_195($pdo,1,10,101,'butunluk','acik',1,$fmt($c1Start));
add_case_195($pdo,2,20,202,'operasyon','incelemede',2,$fmt($c2Start));
add_case_195($pdo,3,10,101,'butunluk','kapali',1,$fmt($c3Start),$fmt($now->modify('-2 days')));
add_case_195($pdo,4,20,202,'operasyon','beklemede',1,$fmt($c4Start));
add_case_195($pdo,5,10,101,'butunluk','kapali',2,$fmt($c5Start),$fmt($now->modify('-1 day')));

$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
  (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
  VALUES (4,1,'durum','vaka_yeniden_acildi','Reopen',?)")->execute([$fmt($c4Reopen)]);

$n1Sent=$now->modify('-2 days');
$n2Sent=$now->modify('-1 day');
$n3Sent=$now->modify('-5 days');
$n4OldSent=$now->modify('-10 days');
$n4NewSent=$now->modify('-20 hours');
$n5Sent=$now->modify('-3 days');

add_notice_195($pdo,[
  'notification_id'=>1,'notice_id'=>101,'case_id'=>1,'institution'=>10,'policy'=>1,'owner'=>1,
  'cycle_key'=>mrh_cycle_key(1,$fmt($c1Start)),'signal'=>'hedef_75','usage'=>80,
  'sent'=>$fmt($n1Sent),'read'=>$fmt($n1Sent->modify('+60 minutes'))
]);
add_notice_195($pdo,[
  'notification_id'=>2,'notice_id'=>102,'case_id'=>2,'institution'=>20,'policy'=>2,'owner'=>2,
  'cycle_key'=>mrh_cycle_key(2,$fmt($c2Start)),'signal'=>'hedef_disinda','usage'=>130,
  'sent'=>$fmt($n2Sent),'read'=>null
]);
add_notice_195($pdo,[
  'notification_id'=>3,'notice_id'=>103,'case_id'=>3,'institution'=>10,'policy'=>1,'owner'=>1,
  'cycle_key'=>mrh_cycle_key(3,$fmt($c3Start)),'signal'=>'hedef_disinda','usage'=>150,
  'sent'=>$fmt($n3Sent),'read'=>$fmt($n3Sent->modify('+30 minutes'))
]);
add_notice_195($pdo,[
  'notification_id'=>4,'notice_id'=>104,'case_id'=>4,'institution'=>20,'policy'=>2,'owner'=>1,
  'cycle_key'=>mrh_cycle_key(4,$fmt($c4Start)),'signal'=>'hedef_75','usage'=>78,
  'sent'=>$fmt($n4OldSent),'read'=>$fmt($n4OldSent->modify('+120 minutes'))
]);
add_notice_195($pdo,[
  'notification_id'=>5,'notice_id'=>105,'case_id'=>4,'institution'=>20,'policy'=>2,'owner'=>1,
  'cycle_key'=>mrh_cycle_key(4,$fmt($c4Reopen)),'signal'=>'hedef_disinda','usage'=>125,
  'sent'=>$fmt($n4NewSent),'read'=>$fmt($n4NewSent->modify('+10 minutes'))
]);
add_notice_195($pdo,[
  'notification_id'=>6,'notice_id'=>106,'case_id'=>5,'institution'=>10,'policy'=>1,'owner'=>2,
  'cycle_key'=>mrh_cycle_key(5,$fmt($c5Start)),'signal'=>'hedef_75','usage'=>82,
  'sent'=>$fmt($n5Sent),'read'=>null
]);

$rows=mrh_rows($pdo,['days'=>30],100);
ok_195(count($rows)===6,'six target-risk notification history rows expected.');

$byId=[];
foreach($rows as $row)$byId[(int)$row['id']]=$row;
ok_195(!empty($byId[1]['guncel_acik_vaka']),'case 1 notification should be current open cycle.');
ok_195(!empty($byId[2]['guncel_acik_vaka']) && empty($byId[2]['okundu']),
    'case 2 should be current open unread notification.');
ok_195(!empty($byId[4]['eski_dongu_bildirimi']) && empty($byId[4]['guncel_acik_vaka']),
    'old pre-reopen notification must be old-cycle history, not current open.');
ok_195(!empty($byId[5]['guncel_acik_vaka']) && !empty($byId[5]['acik_hedef_disinda']),
    'new reopen-cycle outside notification should be current open outside.');
ok_195((int)$byId[1]['okunma_dakika']===60,'read latency mismatch for notification 1.');
ok_195((int)$byId[3]['okunma_dakika']===30,'read latency mismatch for notification 3.');

$summary=mrh_summary($pdo,30);
ok_195((int)$summary['total']===6,'summary total mismatch.');
ok_195((int)$summary['read']===4 && (int)$summary['unread']===2,'read/unread summary mismatch.');
ok_195(abs((float)$summary['read_rate']-66.7)<0.11,'read rate mismatch.');
ok_195((int)$summary['current_open']===3,'current open-cycle summary must exclude old reopen history.');
ok_195((int)$summary['current_open_unread']===1,'current open unread summary mismatch.');
ok_195((int)$summary['current_outside_open']===2,'current outside-open summary mismatch.');
ok_195((int)$summary['old_cycle']===1,'old reopen-cycle history count mismatch.');
ok_195((int)$summary['closed_after']===2,'closed-after-notification count mismatch.');
ok_195(abs((float)$summary['avg_read_minutes']-55.0)<0.01,'average read latency mismatch.');

$owners=mrh_owner_rows($pdo,30);
$ownerMap=[];
foreach($owners as $row)$ownerMap[(int)$row['alici_kullanici_id']]=$row;
ok_195((int)$ownerMap[1]['toplam']===4 && (int)$ownerMap[1]['okundu']===4,
    'owner A notification/read totals mismatch.');
ok_195((int)$ownerMap[1]['guncel_acik']===2 && (int)$ownerMap[1]['hedef_disinda_acik']===1,
    'owner A current open workload mismatch.');
ok_195((int)$ownerMap[2]['toplam']===2 && (int)$ownerMap[2]['okunmadi']===2,
    'owner B unread totals mismatch.');
ok_195((int)$ownerMap[2]['guncel_acik_okunmadi']===1 && (int)$ownerMap[2]['hedef_disinda_acik']===1,
    'owner B current unread/outside workload mismatch.');

$policies=mrh_policy_rows($pdo,30);
$policyMap=[];
foreach($policies as $row)$policyMap[(int)$row['hedef_politika_id']]=$row;
ok_195((int)$policyMap[1]['toplam']===3 && (int)$policyMap[2]['toplam']===3,
    'policy distribution totals mismatch.');
ok_195((int)$policyMap[2]['guncel_acik']===2,'policy 2 current open count mismatch.');

$unread=mrh_rows($pdo,['days'=>30,'read'=>'okunmadi'],100);
ok_195(count($unread)===2,'unread filter mismatch.');
$currentUnread=mrh_rows($pdo,['days'=>30,'state'=>'guncel_acik_okunmadi'],100);
ok_195(count($currentUnread)===1 && (int)$currentUnread[0]['vaka_id']===2,
    'current-open-unread filter mismatch.');
$oldCycle=mrh_rows($pdo,['days'=>30,'state'=>'eski_dongu'],100);
ok_195(count($oldCycle)===1 && (int)$oldCycle[0]['id']===4,'old-cycle filter mismatch.');
$owner2=mrh_rows($pdo,['days'=>30,'owner_id'=>2],100);
ok_195(count($owner2)===2,'owner filter mismatch.');
$outside=mrh_rows($pdo,['days'=>30,'signal'=>'hedef_disinda'],100);
ok_195(count($outside)===3,'target-outside signal filter mismatch.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: read-state health, reopen-aware current-cycle separation, owner/policy summaries and read-only filters\n";
