<?php
declare(strict_types=1);

function fail_194(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_194(bool $condition,string $message): void { if(!$condition) fail_194($message); }

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
}catch(Throwable $e){ fail_194('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_fetch_user(PDO $pdo,int $id): ?array {
    $stmt=$pdo->prepare('SELECT id,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE id=? LIMIT 1');
    $stmt->execute([$id]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}
function auth_user_has_role(?array $user,string $role): bool {
    return is_array($user) && (int)($user['aktif']??0)===1 && (string)($user['ana_rol']??'')===$role;
}
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function ma_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'ticari_mutabakat_vakalari')
        && auth_runtime_table_exists($pdo,'ticari_mutabakat_vaka_gecmisi');
}
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_case_source_still_open(PDO $pdo,array $case): bool {
    return (string)($case['kaynak_kodu']??'')!=='cozuldu';
}
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,?,?,?,?,NOW())");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
}

require __DIR__.'/../src/ticari_mutabakat_saglik.php';
require __DIR__.'/../src/ticari_mutabakat_performans.php';
require __DIR__.'/../src/ticari_mutabakat_hedef.php';
require __DIR__.'/../src/ticari_mutabakat_hedef_risk.php';
require __DIR__.'/../src/bildirimler.php';
require __DIR__.'/../src/ticari_mutabakat_hedef_risk_bildirim.php';

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
    ana_rol VARCHAR(30) NOT NULL,
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
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_duyurulari(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    kurum_id BIGINT UNSIGNED NOT NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NOT NULL,
    tur VARCHAR(20) NOT NULL DEFAULT 'duyuru',
    kaynak_turu VARCHAR(40) NULL,
    kaynak_id BIGINT UNSIGNED NULL,
    baslik VARCHAR(190) NOT NULL,
    mesaj VARCHAR(4000) NOT NULL,
    onem VARCHAR(20) NOT NULL DEFAULT 'normal',
    hedef_roller VARCHAR(120) NOT NULL,
    baglanti VARCHAR(255) NULL,
    son_gosterim_tarihi DATE NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_duyuru_kaynak(kurum_id,kaynak_turu,kaynak_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL,
    okundu_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_risk_bildirimleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
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
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_hedef_risk_bildirim(vaka_id,dongu_anahtari,hedef_politika_id,esik_kodu,alici_kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,ana_rol,aktif) VALUES
    (1,'Süper Admin A','super_admin',1),
    (2,'Süper Admin B','super_admin',1),
    (3,'Normal Yönetici','yonetici',1),
    (4,'Pasif Süper Admin','super_admin',0)");
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

$generalPolicy=(int)$pdo->query("SELECT id FROM ticari_mutabakat_hedef_politikalari WHERE kapsam='genel'")->fetchColumn();
$operationPolicy=(int)$pdo->query("SELECT id FROM ticari_mutabakat_hedef_politikalari WHERE kapsam='operasyon'")->fetchColumn();

function add_case_194(PDO $pdo,array $x): int {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (anahtar,kaynak_turu,kaynak_kodu,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,
       sorumlu_kullanici_id,sonraki_aksiyon_tarihi,son_aciklama,
       olusturan_kullanici_id,guncelleyen_kullanici_id,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (SHA2(?,256),'sozlesme_mutabakat',?,?,?,?,'TRY',?,?,?,?,?,1,1,?,?)");
    $stmt->execute([
        $x['key'],$x['source_code'],$x['contract'],$x['contract'],$x['institution'],$x['type'],$x['status'],
        $x['owner'],$x['action'],$x['note'],$x['created'],$x['updated']
    ]);
    return (int)$pdo->lastInsertId();
}
function add_history_194(PDO $pdo,int $caseId,string $type,string $code,string $when): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,1,?,?,?,?)");
    $stmt->execute([$caseId,$type,$code,$code,$when]);
}

$aStart=$now->modify('-2 days');
$a=add_case_194($pdo,[
  'key'=>'a','source_code'=>'eksik','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
  'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'İlk müdahale hedef dışı',
  'created'=>$fmt($aStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$a,'durum','vaka_acildi',$fmt($aStart));

$bStart=$now->modify('-7 days');
$b=add_case_194($pdo,[
  'key'=>'b','source_code'=>'eksik','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'incelemede','owner'=>2,
  'action'=>$now->modify('+1 day')->format('Y-m-d'),'note'=>'%75 hedef tüketimi',
  'created'=>$fmt($bStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$b,'durum','vaka_acildi',$fmt($bStart));
add_history_194($pdo,$b,'not','takip_notu',$fmt($bStart->modify('+2 hours')));

$cStart=$now->modify('-5 days');
$c=add_case_194($pdo,[
  'key'=>'c','source_code'=>'eksik','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>$now->modify('+2 days')->format('Y-m-d'),'note'=>'%50 bandı',
  'created'=>$fmt($cStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$c,'durum','vaka_acildi',$fmt($cStart));
add_history_194($pdo,$c,'not','takip_notu',$fmt($cStart->modify('+2 hours')));

$dStart=$now->modify('-30 days');
$d=add_case_194($pdo,[
  'key'=>'d','source_code'=>'eksik','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>null,'note'=>'Politika öncesi',
  'created'=>$fmt($dStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$d,'durum','vaka_acildi',$fmt($dStart));

$eStart=$now->modify('-4 days');
$e=add_case_194($pdo,[
  'key'=>'e','source_code'=>'eksik','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'beklemede','owner'=>null,
  'action'=>$now->modify('-1 day')->format('Y-m-d'),'note'=>'Sahipsiz hedef dışı',
  'created'=>$fmt($eStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$e,'durum','vaka_acildi',$fmt($eStart));

$fStart=$now->modify('-7 days');
$f=add_case_194($pdo,[
  'key'=>'f','source_code'=>'eksik','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>3,
  'action'=>$now->format('Y-m-d'),'note'=>'Geçersiz normal yönetici',
  'created'=>$fmt($fStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$f,'durum','vaka_acildi',$fmt($fStart));
add_history_194($pdo,$f,'not','takip_notu',$fmt($fStart->modify('+2 hours')));

$gStart=$now->modify('-7 days');
$g=add_case_194($pdo,[
  'key'=>'g','source_code'=>'eksik','contract'=>202,'institution'=>null,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>$now->format('Y-m-d'),'note'=>'Kurumsuz vaka',
  'created'=>$fmt($gStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$g,'durum','vaka_acildi',$fmt($gStart));
add_history_194($pdo,$g,'not','takip_notu',$fmt($gStart->modify('+2 hours')));

$hStart=$now->modify('-7 days');
$h=add_case_194($pdo,[
  'key'=>'h','source_code'=>'cozuldu','contract'=>202,'institution'=>20,'type'=>'butunluk','status'=>'acik','owner'=>2,
  'action'=>$now->format('Y-m-d'),'note'=>'Stale kaynak',
  'created'=>$fmt($hStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$h,'durum','vaka_acildi',$fmt($hStart));
add_history_194($pdo,$h,'not','takip_notu',$fmt($hStart->modify('+2 hours')));

$jStart=$now->modify('-4 days');
$j=add_case_194($pdo,[
  'key'=>'j','source_code'=>'eksik','contract'=>101,'institution'=>10,'type'=>'operasyon','status'=>'acik','owner'=>1,
  'action'=>$now->format('Y-m-d'),'note'=>'Önceden %75 gönderilmiş, şimdi hedef dışı',
  'created'=>$fmt($jStart),'updated'=>$fmt($now)
]);
add_history_194($pdo,$j,'durum','vaka_acildi',$fmt($jStart));

$jCycle=hash('sha256',$j.'|'.$fmt($jStart));
$pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
  (vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,esik_kodu,risk_kodu,kullanim_orani,gonderen_kullanici_id)
  VALUES (?,10,?,1,?,'hedef_75','yuzde_75',80,1)")
  ->execute([$j,$operationPolicy,$jCycle]);

$actor=['id'=>1,'role'=>'super_admin'];

$candidates=mrb_candidate_rows($pdo,$actor,100);
$map=[];
foreach($candidates as $row)$map[(int)$row['vaka_id']]=$row;
ok_194(isset($map[$a],$map[$b],$map[$e],$map[$f],$map[$g],$map[$h],$map[$j]),
    'expected target-risk notification candidates missing.');
ok_194(!isset($map[$c]),'50-74 band must not be a notification candidate.');
ok_194(!isset($map[$d]),'policy-missing case must not be a notification candidate.');
ok_194((string)$map[$a]['esik_kodu']==='hedef_disinda','outside signal mismatch.');
ok_194((string)$map[$b]['esik_kodu']==='hedef_75','75+ signal mismatch.');

$first=mrb_sync($pdo,$actor);
ok_194((int)$first['sent']===3,'A outside, B 75+, and J outside should send exactly three notifications.');
ok_194((int)$first['invalid_owner']===2,'unassigned and normal-manager owners must be rejected.');
ok_194((int)$first['no_institution']===1,'institution-less candidate must be rejected.');
ok_194((int)$first['stale_source']===1,'stale source candidate must be rejected.');
ok_194((int)$first['failed']===0,'first target-risk notification sync should not fail.');

ok_194((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri")->fetchColumn()===4,
    'three new deliveries plus seeded J 75 history expected.');
ok_194((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='mutabakat_hedef_risk_bildirim'")->fetchColumn()===3,
    'three central target-risk announcements expected.');
ok_194((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyuru_alicilari WHERE kurum_rolu='super_admin'")->fetchColumn()===3,
    'all target-risk recipients must use super_admin system role.');

ok_194((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri
  WHERE vaka_id={$a} AND esik_kodu='hedef_75'")->fetchColumn()===0,
    'first sync at target-outside must not backfill old 75 signal.');
ok_194((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri
  WHERE vaka_id={$j} AND esik_kodu='hedef_75'")->fetchColumn()===1
  && (int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri
  WHERE vaka_id={$j} AND esik_kodu='hedef_disinda'")->fetchColumn()===1,
    'outside signal must be allowed after prior 75 signal in same cycle.');

$second=mrb_sync($pdo,$actor);
ok_194((int)$second['sent']===0,'same current signals must not be delivered twice.');
ok_194((int)$pdo->query("SELECT COUNT(*) FROM kurum_duyurulari WHERE kaynak_turu='mutabakat_hedef_risk_bildirim'")->fetchColumn()===3,
    'dedup sync must not duplicate central announcements.');

$pdo->prepare("UPDATE ticari_mutabakat_vakalari SET sorumlu_kullanici_id=1 WHERE id=?")->execute([$b]);
$ownerChange=mrb_sync($pdo,$actor);
ok_194((int)$ownerChange['sent']===1,'new valid owner must receive current 75 signal once.');
ok_194((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri
  WHERE vaka_id={$b} AND esik_kodu='hedef_75'")->fetchColumn()===2,
    'old and new owner 75 delivery history must both remain.');

$reopen=$now->modify('-40 hours');
add_history_194($pdo,$b,'durum','vaka_yeniden_acildi',$fmt($reopen));
$reopenSync=mrb_sync($pdo,$actor);
ok_194((int)$reopenSync['sent']===1,'new reopen cycle must permit a new 75 signal to current owner.');
$bHistory=$pdo->query("SELECT COUNT(DISTINCT dongu_anahtari)
  FROM ticari_mutabakat_hedef_risk_bildirimleri
  WHERE vaka_id={$b} AND alici_kullanici_id=1 AND esik_kodu='hedef_75'")->fetchColumn();
ok_194((int)$bHistory===2,'reopen cycle must use a new dedup cycle key.');

$summary=mrb_summary($pdo,$actor);
ok_194((int)$summary['history_75']>=4,'75 delivery history summary mismatch.');
ok_194((int)$summary['history_outside']===2,'outside delivery history summary mismatch.');
ok_194((int)$summary['history_total']===6,'total target-risk notification history mismatch.');

$caseHistory=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi
  WHERE tur='bildirim' AND kod LIKE 'hedef_risk_%'")->fetchColumn();
ok_194($caseHistory===5,'each successful send must append case notification history.');

$manual=bd_recipient_roles();
ok_194(!array_key_exists('super_admin',$manual),'manual announcement roles must remain unchanged.');
ok_194(array_key_exists('super_admin',bd_supported_recipient_roles()),
    'system notification roles must retain Super Admin support.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: target-risk 75/outside notifications, no backfill, owner-change dedup, reopen cycle and append-only history\n";
