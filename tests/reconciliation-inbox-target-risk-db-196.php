<?php
declare(strict_types=1);

function fail_196(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_196(bool $condition,string $message): void { if(!$condition) fail_196($message); }

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
}catch(Throwable $e){ fail_196('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function mhs_tables_ready(PDO $pdo): bool { return true; }
function mhs_cycle_expr(string $alias='v'): string {
    return "COALESCE(
      (SELECT MAX(gx.olusturulma_tarihi) FROM ticari_mutabakat_vaka_gecmisi gx
       WHERE gx.vaka_id={$alias}.id AND gx.kod='vaka_yeniden_acildi'),
      {$alias}.olusturulma_tarihi
    )";
}
function mhs_intervention_exists_expr(string $alias='v'): string {
    $cycle=mhs_cycle_expr($alias);
    return "EXISTS(
      SELECT 1 FROM ticari_mutabakat_vaka_gecmisi gi
      WHERE gi.vaka_id={$alias}.id
        AND gi.olusturulma_tarihi>={$cycle}
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

$GLOBALS['risk_rows_196']=[];
function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=900): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    return array_slice($GLOBALS['risk_rows_196'],0,$limit);
}

require __DIR__.'/../src/ticari_mutabakat_is_kutusu.php';

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
    gecerlilik_baslangici DATETIME NOT NULL,
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
  (1,'Admin Bir'),(2,'Admin İki')");
$pdo->exec("INSERT INTO kurumlar(id,kod,ad) VALUES (10,'A','A Kurumu')");
$pdo->exec("INSERT INTO kurum_sozlesmeleri(id,kurum_id,sozlesme_no) VALUES
  (101,10,'S-101'),(102,10,'S-102'),(103,10,'S-103'),(104,10,'S-104'),(105,10,'S-105'),(106,10,'S-106')");
$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari(id,kapsam,ilk_mudahale_saat,cevrim_gun,gecerlilik_baslangici)
  VALUES (1,'genel',48,8,DATE_SUB(NOW(),INTERVAL 100 DAY))");

$now=new DateTimeImmutable();
$fmt=static fn(DateTimeImmutable $d):string=>$d->format('Y-m-d H:i:s');
$today=new DateTimeImmutable('today');

function add_case_196(PDO $pdo,int $id,int $contract,int $owner,string $status,?string $action,string $created): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,anahtar,kaynak_id,sozlesme_id,kurum_id,para_birimi,sorun_turu,durum,sorumlu_kullanici_id,
       sonraki_aksiyon_tarihi,son_aciklama,olusturulma_tarihi,guncellenme_tarihi)
      VALUES (?,SHA2(CONCAT('case-',?),256),?,?,10,'TRY','operasyon',?,?,?,'Vaka',?,?)");
    $stmt->execute([$id,$id,$contract,$contract,$status,$owner,$action,$created,$created]);
}

$starts=[
  1=>$now->modify('-7 days'),
  2=>$now->modify('-6 days'),
  3=>$now->modify('-5 days'),
  4=>$now->modify('-4 days'),
  5=>$now->modify('-10 days'),
  6=>$now->modify('-3 days'),
];
add_case_196($pdo,1,101,1,'acik',$today->modify('+2 days')->format('Y-m-d'),$fmt($starts[1]));
add_case_196($pdo,2,102,1,'acik',$today->modify('+3 days')->format('Y-m-d'),$fmt($starts[2]));
add_case_196($pdo,3,103,1,'acik',$today->modify('-1 day')->format('Y-m-d'),$fmt($starts[3]));
add_case_196($pdo,4,104,1,'acik',null,$fmt($starts[4]));
add_case_196($pdo,5,105,1,'acik',$today->modify('+5 days')->format('Y-m-d'),$fmt($starts[5]));
add_case_196($pdo,6,106,2,'acik',$today->format('Y-m-d'),$fmt($starts[6]));

$reopen=$now->modify('-1 day');
$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
  (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
  VALUES (5,1,'durum','vaka_yeniden_acildi','Yeni döngü',?)")->execute([$fmt($reopen)]);

$GLOBALS['risk_rows_196']=[
  ['id'=>1,'sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','hedef_sure_kullanim_orani'=>125,'hedef_politika_id'=>1,'dongu_baslangic_tarihi'=>$fmt($starts[1])],
  ['id'=>2,'sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'yuzde_75','hedef_risk_etiketi'=>'Süre %75+','hedef_sure_kullanim_orani'=>82,'hedef_politika_id'=>1,'dongu_baslangic_tarihi'=>$fmt($starts[2])],
  ['id'=>3,'sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'yuzde_50','hedef_risk_etiketi'=>'Süre %50–74','hedef_sure_kullanim_orani'=>60,'hedef_politika_id'=>1,'dongu_baslangic_tarihi'=>$fmt($starts[3])],
  ['id'=>4,'sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'politika_yok','hedef_risk_etiketi'=>'Politika yok','hedef_sure_kullanim_orani'=>null,'hedef_politika_id'=>null,'dongu_baslangic_tarihi'=>$fmt($starts[4])],
  ['id'=>5,'sorumlu_kullanici_id'=>1,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','hedef_sure_kullanim_orani'=>140,'hedef_politika_id'=>1,'dongu_baslangic_tarihi'=>$fmt($reopen)],
  ['id'=>6,'sorumlu_kullanici_id'=>2,'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','hedef_sure_kullanim_orani'=>150,'hedef_politika_id'=>1,'dongu_baslangic_tarihi'=>$fmt($starts[6])],
];

function add_notification_196(PDO $pdo,int $id,int $caseId,int $owner,string $cycle,string $signal,int $noticeId,?string $read): void {
    $pdo->prepare("INSERT INTO kurum_duyurulari
      (id,kurum_id,gonderen_kullanici_id,kaynak_turu,kaynak_id,olusturulma_tarihi)
      VALUES (?,10,1,'mutabakat_hedef_risk_bildirim',?,DATE_SUB(NOW(),INTERVAL 2 HOUR))")
      ->execute([$noticeId,$id]);
    $pdo->prepare("INSERT INTO kurum_duyuru_alicilari
      (duyuru_id,kurum_id,kullanici_id,kurum_rolu,okundu_tarihi,olusturulma_tarihi)
      VALUES (?,10,?,'super_admin',?,DATE_SUB(NOW(),INTERVAL 2 HOUR))")
      ->execute([$noticeId,$owner,$read]);
    $pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
      (id,vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,esik_kodu,risk_kodu,kullanim_orani,duyuru_id,gonderen_kullanici_id,olusturulma_tarihi)
      VALUES (?,?,10,1,?,?,?,?,120,?,1,DATE_SUB(NOW(),INTERVAL 2 HOUR))")
      ->execute([$id,$caseId,$owner,$cycle,$signal,$signal==='hedef_disinda'?'hedef_disinda':'yuzde_75',$noticeId]);
}

add_notification_196($pdo,1,1,1,hash('sha256','1|'.$fmt($starts[1])),'hedef_disinda',201,null);
add_notification_196($pdo,2,2,1,hash('sha256','2|'.$fmt($starts[2])),'hedef_75',202,$fmt($now->modify('-1 hour')));

// Case 5: old pre-reopen unread notification must be ignored for current cycle.
add_notification_196($pdo,3,5,1,hash('sha256','5|'.$fmt($starts[5])),'hedef_disinda',203,null);

// Case 6: notification belongs to old owner 1, while current owner is 2. Must be pending for owner 2.
add_notification_196($pdo,4,6,1,hash('sha256','6|'.$fmt($starts[6])),'hedef_disinda',204,null);

$actor=['id'=>1,'role'=>'super_admin'];
$mine=mi_case_rows($pdo,$actor,['scope'=>'mine','window'=>'all'],100);
ok_196(count($mine)===5,'mine inbox should contain five current-owner cases.');

$byId=[];
foreach($mine as $row)$byId[(int)$row['id']]=$row;
ok_196((string)$byId[1]['hedef_risk_kodu']==='hedef_disinda' && !empty($byId[1]['hedef_bildirim_okunmadi']),
    'case 1 current outside unread state mismatch.');
ok_196((string)$byId[2]['hedef_risk_kodu']==='yuzde_75' && (string)$byId[2]['hedef_bildirim_durumu']==='okundu',
    'case 2 current 75 read state mismatch.');
ok_196((string)$byId[3]['hedef_risk_kodu']==='yuzde_50' && (string)$byId[3]['hedef_bildirim_durumu']==='uygulanmaz',
    '50-74 risk should not require target-risk notification.');
ok_196((string)$byId[4]['hedef_risk_kodu']==='politika_yok' && (string)$byId[4]['hedef_bildirim_durumu']==='uygulanmaz',
    'policy-missing risk should not require target-risk notification.');
ok_196((string)$byId[5]['hedef_risk_kodu']==='hedef_disinda' && !empty($byId[5]['hedef_bildirim_bekliyor']),
    'old pre-reopen notification must not satisfy current reopen cycle.');

ok_196((int)$mine[0]['id']===1,'outside unread case must be highest inbox priority.');
ok_196((int)$mine[1]['id']===5,'outside pending current-cycle delivery must rank after outside unread.');

$outside=mi_case_rows($pdo,$actor,['scope'=>'mine','risk'=>'hedef_disinda'],100);
ok_196(count($outside)===2,'mine target-outside filter mismatch.');
$unread=mi_case_rows($pdo,$actor,['scope'=>'mine','risk'=>'okunmamis'],100);
ok_196(count($unread)===1 && (int)$unread[0]['id']===1,'mine unread target-risk filter mismatch.');
$pending=mi_case_rows($pdo,$actor,['scope'=>'mine','risk'=>'bildirim_bekleyen'],100);
ok_196(count($pending)===1 && (int)$pending[0]['id']===5,'mine pending target-risk filter mismatch.');
$watch50=mi_case_rows($pdo,$actor,['scope'=>'mine','risk'=>'yuzde_50'],100);
ok_196(count($watch50)===1 && (int)$watch50[0]['id']===3,'50-74 target-risk filter mismatch.');

$summary=mi_summary($pdo,$actor);
ok_196((int)$summary['mine_target_outside']===2,'mine outside summary mismatch.');
ok_196((int)$summary['mine_target_75']===1,'mine 75 summary mismatch.');
ok_196((int)$summary['mine_target_unread']===1,'mine unread target-risk summary must ignore old reopen notification.');
ok_196((int)$summary['mine_target_pending']===1,'mine pending target-risk summary mismatch.');

$team=mi_team_workload($pdo,20,$actor);
$teamMap=[];
foreach($team as $row)$teamMap[(int)$row['sorumlu_kullanici_id']]=$row;
ok_196((int)$teamMap[1]['target_outside_count']===2,'owner 1 outside workload mismatch.');
ok_196((int)$teamMap[1]['target_unread_count']===1,'owner 1 unread workload mismatch.');
ok_196((int)$teamMap[1]['target_pending_count']===1,'owner 1 pending workload mismatch.');
ok_196((int)$teamMap[2]['target_outside_count']===1,'owner 2 outside workload mismatch.');
ok_196((int)$teamMap[2]['target_unread_count']===0,'old-owner unread notification must not count for owner 2.');
ok_196((int)$teamMap[2]['target_pending_count']===1,'owner 2 current signal must be pending because only old owner was notified.');

$owner2=mi_case_rows($pdo,$actor,['scope'=>'team','owner_id'=>'2','risk'=>'bildirim_bekleyen'],100);
ok_196(count($owner2)===1 && (int)$owner2[0]['id']===6,
    'owner transfer must expose current target-risk delivery as pending.');

$nonAdmin=mi_case_rows($pdo,['id'=>2,'role'=>'yonetici'],['scope'=>'team'],100);
ok_196($nonAdmin===[],'non-Super-Admin target-risk inbox must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: target-risk inbox priority, current-cycle/current-owner read state, reopen isolation and team workload\n";
