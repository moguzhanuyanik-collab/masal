<?php
declare(strict_types=1);

function fail_192(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_192(bool $condition,string $message): void { if(!$condition) fail_192($message); }

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
}catch(Throwable $e){ fail_192('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad) VALUES (1,'Süper Admin'),(2,'Normal Kullanıcı')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'A','A Kurumu'),(20,'B','B Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES (101,10,'A-101'),(202,20,'B-202')");

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');

$generalStart=$fmt($now->modify('-20 days'));
$operationStart=$fmt($now->modify('-5 days'));
$stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_hedef_politikalari
  (kapsam,ilk_mudahale_saat,cevrim_gun,aciklama,olusturan_kullanici_id,gecerlilik_baslangici)
  VALUES
  ('genel',48,8,'Başlangıç genel',1,?),
  ('operasyon',12,3,'Operasyon özel',1,?)");
$stmt->execute([$generalStart,$operationStart]);

function add_case_192(PDO $pdo,array $x): int {
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
function add_history_192(PDO $pdo,int $caseId,string $type,string $code,string $when): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,1,?,?,?,?)");
    $stmt->execute([$caseId,$type,$code,$code,$when]);
}

$c1Start=$now->modify('-10 days');
$c1=add_case_192($pdo,[
    'key'=>'c1','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Eski genel hedef','closed'=>$fmt($now->modify('-6 days')),
    'created'=>$fmt($c1Start),'updated'=>$fmt($now->modify('-6 days'))
]);
add_history_192($pdo,$c1,'durum','vaka_acildi',$fmt($c1Start));
add_history_192($pdo,$c1,'not','takip_notu',$fmt($c1Start->modify('+24 hours')));
add_history_192($pdo,$c1,'durum','kaynak_cozuldu',$fmt($now->modify('-6 days')));

$c2Start=$now->modify('-4 days');
$c2=add_case_192($pdo,[
    'key'=>'c2','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Özel hedef dönemi','closed'=>$fmt($now->modify('-1 hour')),
    'created'=>$fmt($c2Start),'updated'=>$fmt($now->modify('-1 hour'))
]);
add_history_192($pdo,$c2,'durum','vaka_acildi',$fmt($c2Start));
add_history_192($pdo,$c2,'not','takip_notu',$fmt($c2Start->modify('+10 hours')));
add_history_192($pdo,$c2,'durum','kaynak_cozuldu',$fmt($now->modify('-1 hour')));

$c3Start=$now->modify('-3 days');
$c3=add_case_192($pdo,[
    'key'=>'c3','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Bütünlük genel hedef','closed'=>$fmt($now->modify('-1 hour')),
    'created'=>$fmt($c3Start),'updated'=>$fmt($now->modify('-1 hour'))
]);
add_history_192($pdo,$c3,'durum','vaka_acildi',$fmt($c3Start));
add_history_192($pdo,$c3,'not','takip_notu',$fmt($c3Start->modify('+60 hours')));
add_history_192($pdo,$c3,'durum','kaynak_cozuldu',$fmt($now->modify('-1 hour')));

$c4Start=$now->modify('-30 days');
$c4=add_case_192($pdo,[
    'key'=>'c4','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'kapali','owner'=>1,
    'action'=>null,'note'=>'Politika öncesi','closed'=>$fmt($now->modify('-25 days')),
    'created'=>$fmt($c4Start),'updated'=>$fmt($now->modify('-25 days'))
]);
add_history_192($pdo,$c4,'durum','vaka_acildi',$fmt($c4Start));
add_history_192($pdo,$c4,'not','takip_notu',$fmt($c4Start->modify('+2 hours')));
add_history_192($pdo,$c4,'durum','kaynak_cozuldu',$fmt($now->modify('-25 days')));

$c5Start=$now->modify('-2 days');
$c5=add_case_192($pdo,[
    'key'=>'c5','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
    'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'İlk müdahale yok','closed'=>null,
    'created'=>$fmt($c5Start),'updated'=>$fmt($now)
]);
add_history_192($pdo,$c5,'durum','vaka_acildi',$fmt($c5Start));

$c6Start=$now->modify('-10 days');
$c6=add_case_192($pdo,[
    'key'=>'c6','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'incelemede','owner'=>1,
    'action'=>$now->format('Y-m-d'),'note'=>'Uzun açık','closed'=>null,
    'created'=>$fmt($c6Start),'updated'=>$fmt($now)
]);
add_history_192($pdo,$c6,'durum','vaka_acildi',$fmt($c6Start));
add_history_192($pdo,$c6,'not','takip_notu',$fmt($c6Start->modify('+2 hours')));

$c7Start=$now->modify('-25 days');
$c7=add_case_192($pdo,[
    'key'=>'c7','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
    'action'=>null,'note'=>'Politika öncesi açık','closed'=>null,
    'created'=>$fmt($c7Start),'updated'=>$fmt($now)
]);
add_history_192($pdo,$c7,'durum','vaka_acildi',$fmt($c7Start));

$c8Start=$now->modify('-4 hours');
$c8=add_case_192($pdo,[
    'key'=>'c8','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
    'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'Hedef süresi işliyor','closed'=>null,
    'created'=>$fmt($c8Start),'updated'=>$fmt($now)
]);
add_history_192($pdo,$c8,'durum','vaka_acildi',$fmt($c8Start));

$versions=mh_policy_versions($pdo);
$p1=mh_resolve_policy($versions,'operasyon',$fmt($c1Start));
$p2=mh_resolve_policy($versions,'operasyon',$fmt($c2Start));
$p3=mh_resolve_policy($versions,'butunluk',$fmt($c3Start));
$p4=mh_resolve_policy($versions,'butunluk',$fmt($c4Start));

ok_192(is_array($p1) && (string)$p1['kapsam']==='genel' && (int)$p1['ilk_mudahale_saat']===48,
    'operation cycle before specific policy must use historical general policy.');
ok_192(is_array($p2) && (string)$p2['kapsam']==='operasyon' && (int)$p2['ilk_mudahale_saat']===12,
    'operation cycle after specific version must use specific policy.');
ok_192(is_array($p3) && (string)$p3['kapsam']==='genel',
    'integrity cycle without specific policy must fall back to general policy.');
ok_192($p4===null,'cycle before first policy must remain policy-unassigned.');

$closed=mh_closed_target_summary($pdo,30);
ok_192((int)$closed['closed_total']===4,'30-day closed total mismatch.');
ok_192((int)$closed['policy_evaluable']===3,'three closed cycles should be policy-evaluable.');
ok_192((int)$closed['no_policy']===1,'one pre-policy closed cycle expected.');
ok_192((int)$closed['cycle_within']===2 && (int)$closed['cycle_outside']===1,
    'closed cycle target results mismatch.');
ok_192((int)$closed['first_within']===2 && (int)$closed['first_outside']===1,
    'closed first-intervention target results mismatch.');
ok_192(abs((float)$closed['cycle_within_rate']-66.7)<0.2,'closed cycle target rate mismatch.');
ok_192(abs((float)$closed['first_within_rate']-66.7)<0.2,'closed first-intervention target rate mismatch.');

$issue=mh_issue_target_summary($pdo,30);
$issueMap=[];
foreach($issue as $row)$issueMap[(string)$row['sorun_turu']]=$row;
ok_192((int)$issueMap['operasyon']['eligible']===2,'operation eligible count mismatch.');
ok_192((int)$issueMap['operasyon']['cycle_within']===1,'operation cycle target count mismatch.');
ok_192((int)$issueMap['operasyon']['first_within']===2,'operation first target count mismatch.');
ok_192((int)$issueMap['butunluk']['eligible']===1,'integrity eligible count mismatch.');
ok_192((int)$issueMap['butunluk']['first_within']===0,'integrity first response should be outside 48h target.');

$open=mh_open_target_summary($pdo);
ok_192((int)$open['open']===4,'four open cases expected.');
ok_192((int)$open['policy_evaluable']===3,'three open cases should be policy-evaluable.');
ok_192((int)$open['no_policy']===1,'one open pre-policy case expected.');
ok_192((int)$open['cycle_outside']===1,'one open cycle should exceed target.');
ok_192((int)$open['first_outside']===1,'one open case should exceed first-intervention target.');
ok_192((int)$open['first_waiting']===1,'one open case should still be inside first-intervention clock.');

$beforeCount=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_politikalari")->fetchColumn();
$newId=mh_publish_policy($pdo,['id'=>1,'role'=>'super_admin'],'genel',36,6,'Yeni genel hedef');
ok_192($newId>0,'new target policy version should be published.');
ok_192((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_politikalari")->fetchColumn()===$beforeCount+1,
    'publishing target policy must append a new row.');
$current=mh_current_policy($pdo,'genel');
ok_192(is_array($current) && (int)$current['id']===$newId && (int)$current['ilk_mudahale_saat']===36,
    'current general policy should be latest published version.');

$versionsAfter=mh_policy_versions($pdo);
$historical=mh_resolve_policy($versionsAfter,'operasyon',$fmt($c1Start));
ok_192(is_array($historical) && (int)$historical['ilk_mudahale_saat']===48,
    'new target publication must not rewrite historical cycle policy resolution.');

$blocked=false;
try{mh_publish_policy($pdo,['id'=>2,'role'=>'yonetici'],'genel',24,5,'Yetkisiz');}
catch(RuntimeException){$blocked=true;}
ok_192($blocked,'non-Super Admin must not publish target policy.');

$invalid=false;
try{mh_publish_policy($pdo,['id'=>1,'role'=>'super_admin'],'genel',0,5,'Geçersiz');}
catch(RuntimeException){$invalid=true;}
ok_192($invalid,'invalid first-intervention target must be rejected.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: append-only target versions, historical policy resolution, general fallback, target compliance and publish authorization\n";
