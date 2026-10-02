<?php
declare(strict_types=1);

function fail_193(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_193(bool $condition,string $message): void { if(!$condition) fail_193($message); }

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
}catch(Throwable $e){ fail_193('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function ma_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'ticari_mutabakat_vakalari')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi');
}

require __DIR__.'/../src/ticari_mutabakat_saglik.php';
require __DIR__.'/../src/ticari_mutabakat_performans.php';
require __DIR__.'/../src/ticari_mutabakat_hedef.php';
require __DIR__.'/../src/ticari_mutabakat_hedef_risk.php';

$tables=[
    'ticari_mutabakat_hedef_politikalari',
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
$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_politikalari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kapsam VARCHAR(20) NOT NULL,
    ilk_mudahale_saat INT UNSIGNED NOT NULL,
    cevrim_gun INT UNSIGNED NOT NULL,
    aciklama VARCHAR(1000) NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NULL,
    gecerlilik_baslangici DATETIME NOT NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    KEY ix_scope_time(kapsam,gecerlilik_baslangici,id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES
    (1,'Süper Admin'),(2,'İkinci Admin')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES
    (10,'A','A Kurumu'),(20,'B','B Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
    (101,10,'A-101'),(202,20,'B-202')");

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');

$pdo->prepare("INSERT INTO ticari_mutabakat_hedef_politikalari
  (kapsam,ilk_mudahale_saat,cevrim_gun,aciklama,olusturan_kullanici_id,gecerlilik_baslangici)
  VALUES
  ('genel',48,8,'Genel hedef',1,?),
  ('operasyon',12,3,'Operasyon özel hedef',1,?)")
  ->execute([$fmt($now->modify('-20 days')),$fmt($now->modify('-10 days'))]);

function add_case_193(PDO $pdo,array $x): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,
       sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama,
       olusturan_kullanici_id,guncelleyen_kullanici_id,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (SHA2(?,256),'sozlesme_mutabakat','eksik',?,?,?,'TRY',?,?,?,?,?,1,1,?,?)");
    $stmt->execute([
        $x['key'],$x['contract'],$x['contract'],$x['institution'],$x['type'],$x['status'],
        $x['owner'],$x['action'],$x['note'],$x['created'],$x['updated']
    ]);
    return (int)$pdo->lastInsertId();
}
function add_history_193(PDO $pdo,int $caseId,string $type,string $code,string $when): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,1,?,?,?,?)");
    $stmt->execute([$caseId,$type,$code,$code,$when]);
}

$aStart=$now->modify('-2 days');
$a=add_case_193($pdo,[
  'key'=>'a','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
  'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'İlk müdahale hedef dışı',
  'created'=>$fmt($aStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$a,'durum','vaka_acildi',$fmt($aStart));

$bStart=$now->modify('-7 days');
$b=add_case_193($pdo,[
  'key'=>'b','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'incelemede','owner'=>2,
  'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'Çevrim süresinin çoğu tüketildi',
  'created'=>$fmt($bStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$b,'durum','vaka_acildi',$fmt($bStart));
add_history_193($pdo,$b,'not','takip_notu',$fmt($bStart->modify('+2 hours')));

$cStart=$now->modify('-5 days');
$c=add_case_193($pdo,[
  'key'=>'c','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>$now->modify('+2 days')->format('Y-m-d'),'note'=>'Orta hedef tüketimi',
  'created'=>$fmt($cStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$c,'durum','vaka_acildi',$fmt($cStart));
add_history_193($pdo,$c,'not','takip_notu',$fmt($cStart->modify('+2 hours')));

$dStart=$now->modify('-2 days');
$d=add_case_193($pdo,[
  'key'=>'d','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>$now->modify('+3 days')->format('Y-m-d'),'note'=>'Hedef içinde',
  'created'=>$fmt($dStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$d,'durum','vaka_acildi',$fmt($dStart));
add_history_193($pdo,$d,'not','takip_notu',$fmt($dStart->modify('+2 hours')));

$eStart=$now->modify('-30 days');
$e=add_case_193($pdo,[
  'key'=>'e','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>null,'note'=>'Politika öncesi vaka',
  'created'=>$fmt($eStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$e,'durum','vaka_acildi',$fmt($eStart));

$fCreated=$now->modify('-20 days');
$fReopen=$now->modify('-6 hours');
$f=add_case_193($pdo,[
  'key'=>'f','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
  'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'Reopen yeni döngü',
  'created'=>$fmt($fCreated),'updated'=>$fmt($now)
]);
add_history_193($pdo,$f,'durum','vaka_acildi',$fmt($fCreated));
add_history_193($pdo,$f,'durum','vaka_yeniden_acildi',$fmt($fReopen));

$gStart=$now->modify('-4 days');
$g=add_case_193($pdo,[
  'key'=>'g','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'beklemede','owner'=>null,
  'action'=>$now->modify('-1 day')->format('Y-m-d'),'note'=>'Sahipsiz hedef dışı',
  'created'=>$fmt($gStart),'updated'=>$fmt($now)
]);
add_history_193($pdo,$g,'durum','vaka_acildi',$fmt($gStart));

$actor=['id'=>1,'role'=>'super_admin'];
$all=mhr_rows($pdo,$actor,['scope'=>'team'],100);
ok_193(count($all)===7,'seven open target-risk rows expected.');

$map=[];
foreach($all as $row)$map[(int)$row['id']]=$row;

ok_193((string)$map[$a]['hedef_risk_kodu']==='hedef_disinda',
    'operation case without first intervention after 12h target must be outside.');
ok_193((string)$map[$a]['hedef_cevrim_durumu']==='hedef_icinde'
    && (string)$map[$a]['hedef_ilk_mudahale_durumu']==='hedef_disinda',
    'A case should breach first intervention while cycle remains within target.');

ok_193((string)$map[$b]['hedef_risk_kodu']==='yuzde_75',
    '7/8-day integrity cycle should be in 75+ target-time band.');
ok_193((float)$map[$b]['hedef_sure_kullanim_orani']>80
    && (float)$map[$b]['hedef_sure_kullanim_orani']<100,
    '75+ band should expose actual target-time usage.');

ok_193((string)$map[$c]['hedef_risk_kodu']==='yuzde_50',
    '5/8-day integrity cycle should be in 50-74 target-time band.');
ok_193((string)$map[$d]['hedef_risk_kodu']==='hedef_icinde',
    '2/8-day integrity cycle should remain inside lower half of target.');

ok_193((string)$map[$e]['hedef_risk_kodu']==='politika_yok'
    && $map[$e]['hedef_sure_kullanim_orani']===null,
    'pre-policy cycle must remain undefined, not retroactively scored.');

ok_193(strtotime((string)$map[$f]['dongu_baslangic_tarihi'])===strtotime($fmt($fReopen)),
    'reopened case must use latest reopen event as cycle start.');
ok_193((string)$map[$f]['hedef_risk_kodu']==='yuzde_50',
    '6h into 12h pending first-intervention target should enter 50-74 band.');
ok_193(!empty($map[$f]['ilk_mudahale_bekliyor']),
    'reopened operation case should still have pending first intervention.');

ok_193((string)$map[$g]['hedef_risk_kodu']==='hedef_disinda'
    && !empty($map[$g]['aksiyon_gecikti']),
    'unassigned 4-day operation case must be outside target with overdue action.');

ok_193((string)$all[0]['hedef_risk_kodu']==='hedef_disinda'
    && (string)$all[1]['hedef_risk_kodu']==='hedef_disinda',
    'queue must place target-breached cases first.');

$outside=mhr_rows($pdo,$actor,['scope'=>'team','risk'=>'hedef_disinda'],100);
ok_193(count($outside)===2,'target-outside filter mismatch.');
$mine=mhr_rows($pdo,$actor,['scope'=>'mine','risk'=>'hedef_disinda'],100);
ok_193(count($mine)===1 && (int)$mine[0]['id']===$a,'mine target-outside filter mismatch.');
$unassigned=mhr_rows($pdo,$actor,['scope'=>'unassigned','risk'=>'hedef_disinda'],100);
ok_193(count($unassigned)===1 && (int)$unassigned[0]['id']===$g,'unassigned target-outside filter mismatch.');
$typeRows=mhr_rows($pdo,$actor,['scope'=>'team','sorun_turu'=>'butunluk','risk'=>'yuzde_75'],100);
ok_193(count($typeRows)===1 && (int)$typeRows[0]['id']===$b,'issue-type + risk filter mismatch.');
$search=mhr_rows($pdo,$actor,['scope'=>'team','q'=>'Politika öncesi'],100);
ok_193(count($search)===1 && (int)$search[0]['id']===$e,'target-risk free-text search mismatch.');

$summary=mhr_summary($pdo,$actor);
ok_193((int)$summary['open']===7,'target-risk summary open count mismatch.');
ok_193((int)$summary['policy_evaluable']===6,'six policy-evaluable open cases expected.');
ok_193((int)$summary['policy_missing']===1,'one pre-policy case expected.');
ok_193((int)$summary['outside']===2,'two target-outside cases expected.');
ok_193((int)$summary['cycle_outside']===1,'one cycle-target breach expected.');
ok_193((int)$summary['first_outside']===2,'two first-intervention breaches expected.');
ok_193((int)$summary['near_75']===1,'one 75+ band case expected.');
ok_193((int)$summary['watch_50']===2,'two 50-74 band cases expected.');
ok_193((int)$summary['inside']===1,'one lower-half target case expected.');
ok_193((int)$summary['mine_outside']===1,'one target-outside case assigned to actor expected.');
ok_193((int)$summary['unassigned_outside']===1,'one unassigned target-outside case expected.');
ok_193((int)$summary['outside_overdue_action']===1,'one target-outside case with overdue action expected.');

$owners=mhr_owner_rows($pdo,$actor,20);
$ownerMap=[];
foreach($owners as $row)$ownerMap[(int)$row['sorumlu_kullanici_id']]=$row;
ok_193((int)$ownerMap[1]['open']===2 && (int)$ownerMap[1]['outside']===1,
    'actor owner target workload mismatch.');
ok_193((int)$ownerMap[2]['open']===4 && (int)$ownerMap[2]['near_75']===1
    && (int)$ownerMap[2]['watch_50']===1 && (int)$ownerMap[2]['policy_missing']===1,
    'second owner target workload mismatch.');
ok_193((int)$ownerMap[0]['open']===1 && (int)$ownerMap[0]['outside']===1,
    'unassigned target workload mismatch.');

$blocked=mhr_rows($pdo,['id'=>2,'role'=>'yonetici'],['scope'=>'team'],100);
ok_193($blocked===[],'non-Super Admin must not receive target-risk queue data.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: target-risk bands, historical policy timing, reopen-aware clocks, filters, summaries and owner workload\n";
