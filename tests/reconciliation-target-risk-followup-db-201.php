<?php
declare(strict_types=1);

function fail_201(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_201(bool $condition,string $message): void { if(!$condition) fail_201($message); }
function throws_201(callable $fn,string $contains): void {
    try{$fn();}catch(Throwable $e){
        ok_201(str_contains($e->getMessage(),$contains),'unexpected exception: '.$e->getMessage());
        return;
    }
    fail_201('expected exception containing: '.$contains);
}

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
}catch(Throwable $e){ fail_201('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_fetch_user(PDO $pdo,int $id): ?array {
    $stmt=$pdo->prepare('SELECT * FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$id]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}
function auth_user_has_role(array $user,string $role): bool {
    return (string)($user['ana_rol']??'')===$role;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

function mhs_tables_ready(PDO $pdo): bool { return true; }
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_validate_date(?string $value): ?string {
    $value=trim((string)$value);
    if($value==='') return null;
    $d=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    return $d && $d->format('Y-m-d')===$value?$value:null;
}
function ma_case_source_still_open(PDO $pdo,array $case): bool { return true; }
function ma_sync_cases(PDO $pdo,array $actor): array { return ['created'=>0,'reopened'=>0,'closed'=>0]; }
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,string $code,string $note=''): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
        (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
        VALUES (?,?,?,?,?,NOW())");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
    $stmt->closeCursor();
}

$GLOBALS['current_map_201']=[];
function mi_target_risk_map(PDO $pdo,array $actor,array $caseIds): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $out=[];
    foreach($caseIds as $caseId){
        $caseId=(int)$caseId;
        if(isset($GLOBALS['current_map_201'][$caseId]))$out[$caseId]=$GLOBALS['current_map_201'][$caseId];
    }
    return $out;
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_saglik.php';
require __DIR__.'/../src/ticari_mutabakat_planlama.php';
require __DIR__.'/../src/ticari_mutabakat_hedef_risk_takip.php';

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
    email VARCHAR(190) NULL,
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
    sorun_turu VARCHAR(20) NOT NULL DEFAULT 'operasyon',
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
    tur VARCHAR(20) NOT NULL DEFAULT 'sistem',
    kaynak_turu VARCHAR(40) NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    baslik VARCHAR(190) NOT NULL DEFAULT 'Risk',
    mesaj VARCHAR(4000) NOT NULL DEFAULT 'Risk',
    onem VARCHAR(20) NOT NULL DEFAULT 'onemli',
    hedef_roller VARCHAR(120) NOT NULL DEFAULT 'super_admin',
    baglanti VARCHAR(255) NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    olusturulma_tarihi DATETIME NOT NULL,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,email,ana_rol,aktif) VALUES
    (1,'Admin Bir','a@example.test','super_admin',1),
    (2,'Admin İki','b@example.test','super_admin',1),
    (3,'Admin Pasif','c@example.test','super_admin',0)");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'A','A Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (101,10,'S-101'),(102,10,'S-102'),(103,10,'S-103'),(104,10,'S-104'),(105,10,'S-105')");
$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari
    (id,kapsam,ilk_mudahale_saat,cevrim_gun,gecerlilik_baslangici)
    VALUES (1,'genel',48,8,DATE_SUB(NOW(),INTERVAL 100 DAY))");

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');
$today=new DateTimeImmutable('today');
$tomorrow=$today->modify('+1 day')->format('Y-m-d');

function add_case_201(PDO $pdo,int $id,int $contract,int $owner,string $status,string $created,?string $next=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,anahtar,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,sorumlu_kullanici_id,
       sonraki_aksiyon_tarihi,son_aciklama,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (?,SHA2(CONCAT('case-',?),256),?,?,10,'TRY','operasyon',?,?,?,'Vaka',?,?)");
    $stmt->execute([$id,$id,$contract,$contract,$status,$owner,$next,$created,$created]);
}
function add_notice_201(
    PDO $pdo,int $notificationId,int $caseId,int $owner,string $cycle,string $signal,int $noticeId,?string $read,string $sent
): void {
    $pdo->prepare("INSERT INTO kurum_duyurulari
      (id,kurum_id,gonderen_kullanici_id,kaynak_turu,kaynak_id,olusturulma_tarihi)
      VALUES (?,10,1,'mutabakat_hedef_risk_bildirim',?,?)")
      ->execute([$noticeId,$notificationId,$sent]);
    $pdo->prepare("INSERT INTO kurum_duyuru_alicilari
      (duyuru_id,kurum_id,kullanici_id,kurum_rolu,okundu_tarihi,olusturulma_tarihi)
      VALUES (?,10,?,'super_admin',?,?)")
      ->execute([$noticeId,$owner,$read,$sent]);
    $pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
      (id,vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,
       esik_kodu,risk_kodu,kullanim_orani,duyuru_id,gonderen_kullanici_id,olusturulma_tarihi)
      VALUES (?,?,10,1,?,?,?,?,120,?,1,?)")
      ->execute([$notificationId,$caseId,$owner,$cycle,$signal,$signal==='hedef_disinda'?'hedef_disinda':'yuzde_75',$noticeId,$sent]);
}

$starts=[
  1=>$now->modify('-5 days'),
  2=>$now->modify('-4 days'),
  3=>$now->modify('-3 days'),
  4=>$now->modify('-2 days'),
  5=>$now->modify('-10 days'),
];
add_case_201($pdo,1,101,1,'acik',$fmt($starts[1]),$today->modify('-1 day')->format('Y-m-d'));
add_case_201($pdo,2,102,2,'incelemede',$fmt($starts[2]),null);
add_case_201($pdo,3,103,2,'acik',$fmt($starts[3]),null);
add_case_201($pdo,4,104,1,'beklemede',$fmt($starts[4]),null);
add_case_201($pdo,5,105,1,'acik',$fmt($starts[5]),null);

$reopen=$now->modify('-1 day');
$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
  (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
  VALUES (5,1,'durum','vaka_yeniden_acildi','Yeni döngü',?)")->execute([$fmt($reopen)]);

$sent=$fmt($now->modify('-6 hours'));
$read=$fmt($now->modify('-1 hour'));

add_notice_201($pdo,1,1,1,hash('sha256','1|'.$fmt($starts[1])),'hedef_disinda',201,null,$sent);
add_notice_201($pdo,2,2,2,hash('sha256','2|'.$fmt($starts[2])),'hedef_75',202,null,$sent);
// Same current cycle but old recipient: must become historical old-owner state.
add_notice_201($pdo,3,3,1,hash('sha256','3|'.$fmt($starts[3])),'hedef_disinda',203,null,$sent);
// Current owner/current cycle but already read: must not be follow-up eligible.
add_notice_201($pdo,4,4,1,hash('sha256','4|'.$fmt($starts[4])),'hedef_75',204,$read,$sent);
// Pre-reopen unread notice: must be old-cycle history.
add_notice_201($pdo,5,5,1,hash('sha256','5|'.$fmt($starts[5])),'hedef_disinda',205,null,$sent);

$GLOBALS['current_map_201']=[
  1=>[
    'hedef_bildirim_id'=>1,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,
    'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında',
    'hedef_sure_kullanim_orani'=>125,'beklenen_esik_kodu'=>'hedef_disinda'
  ],
  2=>[
    'hedef_bildirim_id'=>2,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>2,
    'hedef_risk_kodu'=>'yuzde_75','hedef_risk_etiketi'=>'Süre %75+',
    'hedef_sure_kullanim_orani'=>82,'beklenen_esik_kodu'=>'hedef_75'
  ],
  3=>[
    'hedef_bildirim_id'=>null,'hedef_bildirim_durumu'=>'bekliyor','sorumlu_kullanici_id'=>2,
    'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında',
    'hedef_sure_kullanim_orani'=>130,'beklenen_esik_kodu'=>'hedef_disinda'
  ],
  4=>[
    'hedef_bildirim_id'=>4,'hedef_bildirim_durumu'=>'okundu','sorumlu_kullanici_id'=>1,
    'hedef_risk_kodu'=>'yuzde_75','hedef_risk_etiketi'=>'Süre %75+',
    'hedef_sure_kullanim_orani'=>85,'beklenen_esik_kodu'=>'hedef_75'
  ],
  5=>[
    'hedef_bildirim_id'=>null,'hedef_bildirim_durumu'=>'bekliyor','sorumlu_kullanici_id'=>1,
    'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında',
    'hedef_sure_kullanim_orani'=>140,'beklenen_esik_kodu'=>'hedef_disinda'
  ],
];

$actor=['id'=>1,'role'=>'super_admin'];

$health=mrh_rows($pdo,['days'=>30],100);
$byId=[];
foreach($health as $row)$byId[(int)$row['id']]=$row;
ok_201(!empty($byId[1]['guncel_acik_vaka']),'case 1 must be current owner/current cycle.');
ok_201(!empty($byId[2]['guncel_acik_vaka']),'case 2 must be current owner/current cycle.');
ok_201(empty($byId[3]['guncel_acik_vaka']) && !empty($byId[3]['eski_sorumlu_bildirimi']),
    'same-cycle old-recipient notice must be historical old-owner state.');
ok_201(empty($byId[5]['guncel_acik_vaka']) && !empty($byId[5]['eski_dongu_bildirimi']),
    'pre-reopen notice must remain old-cycle history.');

$summary=mrh_summary($pdo,30);
ok_201((int)$summary['current_open']===3,'only current-owner/current-cycle notices, including read notice, should be current open.');
ok_201((int)$summary['current_open_unread']===2,'two exact current unread notices expected.');
ok_201((int)$summary['old_owner']===1,'one old-owner historical notice expected.');
ok_201((int)$summary['old_cycle']===1,'one old-cycle historical notice expected.');

$oldOwner=mrh_rows($pdo,['days'=>30,'state'=>'eski_sorumlu'],100);
ok_201(count($oldOwner)===1 && (int)$oldOwner[0]['id']===3,'old-owner filter mismatch.');

$rows=mrt_rows($pdo,$actor,['days'=>30],100);
$eligible=array_map(static fn(array $row):int=>(int)$row['vaka_id'],$rows);
sort($eligible);
ok_201($eligible===[1,2],'only exact current-owner/current-cycle/current-signal unread cases may enter follow-up list.');

$mrtSummary=mrt_summary($pdo,$actor,30);
ok_201((int)$mrtSummary['total']===2,'follow-up summary total mismatch.');
ok_201((int)$mrtSummary['outside']===1 && (int)$mrtSummary['target_75']===1,'follow-up signal summary mismatch.');
ok_201((int)$mrtSummary['overdue_action']===1,'follow-up overdue-action count mismatch.');
ok_201((int)$mrtSummary['no_action_date']===1,'follow-up no-action-date count mismatch.');

$result=mrt_plan_selected(
    $pdo,$actor,[1,2],$tomorrow,'Okunmamış hedef-risk takibi',['days'=>30]
);
ok_201((int)$result['updated']===2,'two eligible cases should be planned.');
ok_201((int)$result['owner_count']===2,'both existing owners must be preserved.');
ok_201((string)$result['next_action_date']===$tomorrow,'planned date mismatch.');

$planned=$pdo->query("SELECT id,sorumlu_kullanici_id,sonraki_aksiyon_tarihi
    FROM ticari_mutabakat_vakalari WHERE id IN (1,2) ORDER BY id")->fetchAll(PDO::FETCH_ASSOC);
ok_201((int)$planned[0]['sorumlu_kullanici_id']===1 && (int)$planned[1]['sorumlu_kullanici_id']===2,
    'follow-up planning must preserve each case current owner.');
ok_201((string)$planned[0]['sonraki_aksiyon_tarihi']===$tomorrow
    && (string)$planned[1]['sonraki_aksiyon_tarihi']===$tomorrow,
    'follow-up planning must update only next-action date.');

$historyCount=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='toplu_takip_planlama'")->fetchColumn();
ok_201($historyCount===2,'append-only follow-up planning history must be written per case.');

$ownerNotes=$pdo->query("SELECT vaka_id,not_metni FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='toplu_takip_planlama' ORDER BY vaka_id")->fetchAll(PDO::FETCH_ASSOC);
ok_201(str_contains((string)$ownerNotes[0]['not_metni'],'Sorumlu korunuyor: Admin Bir (#1)'),
    'case 1 history must record preserved owner.');
ok_201(str_contains((string)$ownerNotes[1]['not_metni'],'Sorumlu korunuyor: Admin İki (#2)'),
    'case 2 history must record preserved owner.');

// Stale read state must fail closed before any new planning write.
$pdo->exec("UPDATE kurum_duyuru_alicilari SET okundu_tarihi=NOW() WHERE duyuru_id=201 AND kullanici_id=1");
$GLOBALS['current_map_201'][1]['hedef_bildirim_durumu']='okundu';
$before=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='toplu_takip_planlama'")->fetchColumn();
throws_201(
    fn()=>mrt_plan_selected($pdo,$actor,[1],$tomorrow,'Stale',['days'=>30]),
    'artık güncel açık ve okunmamış hedef-risk allowlistinde değil'
);
$after=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
    WHERE kod='toplu_takip_planlama'")->fetchColumn();
ok_201($before===$after,'stale read-state rejection must not append planning history.');

// Owner transfer must also remove old-recipient notice from eligible allowlist.
$pdo->exec("UPDATE ticari_mutabakat_vakalari SET sorumlu_kullanici_id=1 WHERE id=2");
$GLOBALS['current_map_201'][2]['sorumlu_kullanici_id']=1;
$GLOBALS['current_map_201'][2]['hedef_bildirim_id']=null;
$GLOBALS['current_map_201'][2]['hedef_bildirim_durumu']='bekliyor';
$afterTransfer=mrt_rows($pdo,$actor,['days'=>30],100);
ok_201(count($afterTransfer)===0,'owner transfer must invalidate old-recipient unread follow-up eligibility.');

throws_201(
    fn()=>mrt_normalize_case_ids(range(1,51)),
    'en fazla 50 vaka'
);
throws_201(
    fn()=>mrt_rows($pdo,['id'=>99,'role'=>'yonetici'],['days'=>30],100),
    ''
);
ok_201(mrt_rows($pdo,['id'=>99,'role'=>'yonetici'],['days'=>30],100)===[],
    'non-Super-Admin follow-up resolver must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: current-owner health, stale/old-cycle isolation, exact unread allowlist, owner-preserving follow-up planning and hard cap\n";
