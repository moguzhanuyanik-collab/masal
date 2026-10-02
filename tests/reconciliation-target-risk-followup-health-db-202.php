<?php
declare(strict_types=1);

function fail_202(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_202(bool $condition,string $message): void { if(!$condition) fail_202($message); }

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
}catch(Throwable $e){ fail_202('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function mrt_tables_ready(PDO $pdo): bool { return true; }
function mrh_window_days(int|string|null $value): int {
    $days=(int)$value;
    return in_array($days,[7,30,90,180,365],true)?$days:30;
}
function mrh_cycle_expr(string $alias='v'): string {
    return "COALESCE(
      (SELECT MAX(gx.olusturulma_tarihi)
       FROM ticari_mutabakat_vaka_gecmisi gx
       WHERE gx.vaka_id={$alias}.id AND gx.kod='vaka_yeniden_acildi'),
      {$alias}.olusturulma_tarihi
    )";
}
function mrh_cycle_key(int $caseId,string $cycleStart): string {
    return hash('sha256',$caseId.'|'.trim($cycleStart));
}

$GLOBALS['map_202']=[];
function mi_target_risk_map(PDO $pdo,array $actor,array $caseIds): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $out=[];
    foreach($caseIds as $caseId){
        $caseId=(int)$caseId;
        if(array_key_exists($caseId,$GLOBALS['map_202'])){
            $value=$GLOBALS['map_202'][$caseId];
            if(is_array($value))$out[$caseId]=$value;
        }
    }
    return $out;
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_takip_saglik.php';

$tables=[
    'kurum_duyuru_alicilari',
    'ticari_mutabakat_hedef_risk_bildirimleri',
    'ticari_mutabakat_vaka_gecmisi',
    'ticari_mutabakat_vakalari',
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
    sozlesme_id BIGINT UNSIGNED NULL,
    kurum_id BIGINT UNSIGNED NULL,
    sorun_turu VARCHAR(20) NOT NULL DEFAULT 'operasyon',
    durum VARCHAR(20) NOT NULL,
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    sonraki_aksiyon_tarihi DATE NULL,
    kapanma_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL,
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

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_risk_bildirimleri(
    id BIGINT UNSIGNED NOT NULL,
    vaka_id BIGINT UNSIGNED NOT NULL,
    alici_kullanici_id BIGINT UNSIGNED NOT NULL,
    dongu_anahtari CHAR(64) NOT NULL,
    esik_kodu VARCHAR(40) NOT NULL,
    risk_kodu VARCHAR(30) NOT NULL,
    kullanim_orani DECIMAL(7,2) NULL,
    duyuru_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    okundu_tarihi DATETIME NULL,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES
    (1,'Admin Bir'),(2,'Admin İki')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'A','A Kurumu')");
for($id=1;$id<=12;$id++){
    $contract=100+$id;
    $pdo->prepare("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES (?,10,?)")
        ->execute([$contract,'S-'.$contract]);
}

$now=new DateTimeImmutable();
$today=new DateTimeImmutable('today');
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');

function add_case_202(PDO $pdo,int $id,int $owner,string $stage,string $created,?string $next): void {
    $pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,sozlesme_id,kurum_id,sorun_turu,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi,olusturulma_tarihi)
      VALUES (?,?,10,'operasyon',?,?,?,?)")
      ->execute([$id,100+$id,$stage,$owner,$next,$created]);
}
function add_notice_202(PDO $pdo,int $id,int $caseId,int $owner,string $cycle,string $signal,int $duyuru,string $sent,?string $read=null): void {
    $pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
      (id,vaka_id,alici_kullanici_id,dongu_anahtari,esik_kodu,risk_kodu,kullanim_orani,duyuru_id,olusturulma_tarihi)
      VALUES (?,?,?,?,?,?,120,?,?)")
      ->execute([$id,$caseId,$owner,$cycle,$signal,$signal==='hedef_disinda'?'hedef_disinda':'yuzde_75',$duyuru,$sent]);
    $pdo->prepare("INSERT INTO kurum_duyuru_alicilari(duyuru_id,kullanici_id,okundu_tarihi) VALUES (?,?,?)")
      ->execute([$duyuru,$owner,$read]);
}
function add_plan_202(PDO $pdo,int $caseId,string $when,string $note): int {
    $pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,1,'planlama','toplu_takip_planlama',?,?)")
      ->execute([$caseId,$note,$when]);
    return (int)$pdo->lastInsertId();
}

$actor=['id'=>1,'role'=>'super_admin'];
$created=$fmt($now->modify('-10 days'));
$sent=$fmt($now->modify('-2 days'));
$plan=$fmt($now->modify('-1 day'));

$future=$today->modify('+2 days')->format('Y-m-d');
$past=$today->modify('-1 day')->format('Y-m-d');
$todayDate=$today->format('Y-m-d');

for($id=1;$id<=12;$id++){
    $owner=$id===6?2:1;
    $stage=$id===10?'kapali':'acik';
    $next=match($id){
        2=>$past,
        3=>$todayDate,
        4=>null,
        default=>$future,
    };
    add_case_202($pdo,$id,$owner,$stage,$created,$next);
}

$cycles=[];
for($id=1;$id<=12;$id++)$cycles[$id]=hash('sha256',$id.'|'.$created);

// Case 1: two planning events. Only latest one must count.
add_notice_202($pdo,101,1,1,$cycles[1],'hedef_75',1001,$fmt($now->modify('-4 days')));
$oldPlanId=add_plan_202($pdo,1,$fmt($now->modify('-3 days')),'Eski plan');
add_notice_202($pdo,102,1,1,$cycles[1],'hedef_disinda',1002,$sent);
$newPlanId=add_plan_202($pdo,1,$plan,'Yeni plan');

// Standard notices + plans.
for($id=2;$id<=10;$id++){
    $signal=in_array($id,[8],true)?'hedef_75':'hedef_disinda';
    add_notice_202($pdo,100+$id,$id,1,$cycles[$id],$signal,1000+$id,$sent,$id===5?$fmt($now->modify('-12 hours')):null);
    add_plan_202($pdo,$id,$plan,'Plan '.$id);
}

// Case 11: no notice before planning -> plan_bildirimi_yok.
add_plan_202($pdo,11,$plan,'Bildirimsiz plan');

// Case 12: planned notice differs from exact current notification.
add_notice_202($pdo,112,12,1,$cycles[12],'hedef_disinda',1012,$sent);
add_plan_202($pdo,12,$plan,'Bildirim değişim planı');

$reopen=$fmt($now->modify('-6 hours'));
$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
  (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
  VALUES (7,1,'durum','vaka_yeniden_acildi','Yeni döngü',?)")->execute([$reopen]);

$GLOBALS['map_202']=[
  1=>['hedef_bildirim_id'=>102,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  2=>['hedef_bildirim_id'=>102,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  3=>['hedef_bildirim_id'=>103,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  4=>['hedef_bildirim_id'=>104,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  5=>['hedef_bildirim_id'=>105,'hedef_bildirim_durumu'=>'okundu','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  6=>['hedef_bildirim_id'=>106,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>2,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  7=>['hedef_bildirim_id'=>null,'hedef_bildirim_durumu'=>'bekliyor','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  8=>['hedef_bildirim_id'=>108,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  9=>null,
  10=>['hedef_bildirim_id'=>110,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
  11=>null,
  12=>['hedef_bildirim_id'=>999,'hedef_bildirim_durumu'=>'okunmadi','sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','beklenen_esik_kodu'=>'hedef_disinda'],
];

// Case 6 notice was sent to old owner 1 while current owner is 2.
$pdo->exec("UPDATE ticari_mutabakat_hedef_risk_bildirimleri SET alici_kullanici_id=1 WHERE id=106");
$pdo->exec("DELETE FROM kurum_duyuru_alicilari WHERE duyuru_id=1006");
$pdo->exec("INSERT INTO kurum_duyuru_alicilari(duyuru_id,kullanici_id) VALUES (1006,1)");

$rows=mrts_rows($pdo,$actor,['days'=>30],100);
ok_202(count($rows)===12,'latest plan health must contain exactly one row per planned case.');

$byCase=[];
foreach($rows as $row)$byCase[(int)$row['vaka_id']]=$row;

ok_202((int)$byCase[1]['plan_gecmis_id']===$newPlanId,'case 1 must use latest follow-up plan only.');
ok_202((int)$byCase[1]['plan_gecmis_id']!==$oldPlanId,'old follow-up plan must not remain current health row.');
ok_202((int)$byCase[1]['plan_bildirim_id']===102,'case 1 plan must resolve latest notification existing at planning time.');

$expected=[
  1=>'planli_okunmadi',
  2=>'aksiyon_gecikmis',
  3=>'aksiyon_bugun',
  4=>'aksiyon_tarihi_yok',
  5=>'okundu',
  6=>'owner_degisti',
  7=>'dongu_degisti',
  8=>'sinyal_degisti',
  9=>'risk_cozuldu',
  10=>'vaka_kapandi',
  11=>'plan_bildirimi_yok',
  12=>'bildirim_degisti',
];
foreach($expected as $caseId=>$state){
    ok_202((string)$byCase[$caseId]['takip_durumu']===$state,
        'case '.$caseId.' state mismatch: '.(string)$byCase[$caseId]['takip_durumu']);
}

$summary=mrts_summary($pdo,$actor,30);
ok_202((int)$summary['total']===12,'summary total mismatch.');
ok_202((int)$summary['active_unread']===4,'active unread summary mismatch.');
ok_202((int)$summary['overdue']===1,'overdue summary mismatch.');
ok_202((int)$summary['today']===1,'today summary mismatch.');
ok_202((int)$summary['no_date']===1,'no-date summary mismatch.');
ok_202((int)$summary['read']===1,'read summary mismatch.');
ok_202((int)$summary['owner_changed']===1,'owner-changed summary mismatch.');
ok_202((int)$summary['cycle_changed']===1,'cycle-changed summary mismatch.');
ok_202((int)$summary['signal_changed']===2,'signal/notification changed summary mismatch.');
ok_202((int)$summary['resolved']===1,'resolved summary mismatch.');
ok_202((int)$summary['closed']===1,'closed summary mismatch.');

$overdue=mrts_rows($pdo,$actor,['days'=>30,'state'=>'aksiyon_gecikmis'],100);
ok_202(count($overdue)===1 && (int)$overdue[0]['vaka_id']===2,'state filter mismatch.');

$owner2=mrts_rows($pdo,$actor,['days'=>30,'owner_id'=>2],100);
ok_202(count($owner2)===1 && (int)$owner2[0]['vaka_id']===6,'current-owner filter mismatch.');

$signal75=mrts_rows($pdo,$actor,['days'=>30,'signal'=>'hedef_75'],100);
ok_202(count($signal75)===1 && (int)$signal75[0]['vaka_id']===8,'planned-signal filter mismatch.');

$search=mrts_rows($pdo,$actor,['days'=>30,'q'=>'S-102'],100);
ok_202(count($search)===1 && (int)$search[0]['vaka_id']===2,'free-text filter mismatch.');

$owners=mrts_owner_rows($pdo,$actor,30);
$ownerMap=[];
foreach($owners as $row)$ownerMap[(int)$row['owner_id']]=$row;
ok_202(isset($ownerMap[1],$ownerMap[2]),'owner health rows missing.');
ok_202((int)$ownerMap[2]['context_changed']===1,'owner 2 changed-context count mismatch.');
ok_202((int)$ownerMap[1]['overdue']===1,'owner 1 overdue count mismatch.');

ok_202(mrts_rows($pdo,['id'=>99,'role'=>'yonetici'],['days'=>30],100)===[],
    'non-Super-Admin health resolver must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: latest follow-up plan health, read/action/context-change classification, filters and owner workload\n";
