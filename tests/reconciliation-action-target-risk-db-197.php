<?php
declare(strict_types=1);

function fail_197(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_197(bool $condition,string $message): void { if(!$condition) fail_197($message); }

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
}catch(Throwable $e){ fail_197('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string {
    return (string)($user['role']??$user['ana_rol']??'');
}

$GLOBALS['risk_rows_197']=[];
function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=700): array {
    return $GLOBALS['risk_rows_197'];
}

require __DIR__.'/../src/ticari_mutabakat_is_kutusu.php';
require __DIR__.'/../src/ticari_mutabakat_aksiyon.php';

$tables=[
    'ticari_mutabakat_hedef_risk_bildirimleri',
    'kurum_duyuru_alicilari',
    'ticari_mutabakat_hedef_politikalari'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_politikalari(
    id BIGINT UNSIGNED NOT NULL,
    kapsam VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_risk_bildirimleri(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaka_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL,
    hedef_politika_id BIGINT UNSIGNED NULL,
    alici_kullanici_id BIGINT UNSIGNED NOT NULL,
    dongu_anahtari CHAR(64) NOT NULL,
    esik_kodu VARCHAR(30) NOT NULL,
    risk_kodu VARCHAR(30) NOT NULL,
    kullanim_orani DECIMAL(8,2) NULL,
    duyuru_id BIGINT UNSIGNED NULL,
    gonderen_kullanici_id BIGINT UNSIGNED NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
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

$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari(id,kapsam) VALUES (1,'genel')");

$cycles=[
    1=>'2026-10-01 08:00:00',
    2=>'2026-10-01 09:00:00',
    3=>'2026-10-02 07:00:00',
    4=>'2026-10-01 11:00:00',
];

$GLOBALS['risk_rows_197']=[
    [
        'id'=>1,'sorumlu_kullanici_id'=>1,
        'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef Dışında',
        'hedef_sure_kullanim_orani'=>125.0,'hedef_politika_id'=>1,
        'dongu_baslangic_tarihi'=>$cycles[1],
    ],
    [
        'id'=>2,'sorumlu_kullanici_id'=>2,
        'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef Dışında',
        'hedef_sure_kullanim_orani'=>140.0,'hedef_politika_id'=>1,
        'dongu_baslangic_tarihi'=>$cycles[2],
    ],
    [
        'id'=>3,'sorumlu_kullanici_id'=>1,
        'hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef Dışında',
        'hedef_sure_kullanim_orani'=>150.0,'hedef_politika_id'=>1,
        'dongu_baslangic_tarihi'=>$cycles[3],
    ],
    [
        'id'=>4,'sorumlu_kullanici_id'=>1,
        'hedef_risk_kodu'=>'yuzde_50','hedef_risk_etiketi'=>'Süre %50–74',
        'hedef_sure_kullanim_orani'=>60.0,'hedef_politika_id'=>1,
        'dongu_baslangic_tarihi'=>$cycles[4],
    ],
];

function add_notice_197(
    PDO $pdo,int $caseId,int $owner,string $cycle,string $signal,int $noticeId,?string $readAt=null
): void {
    $pdo->prepare("INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri
      (vaka_id,kurum_id,hedef_politika_id,alici_kullanici_id,dongu_anahtari,esik_kodu,risk_kodu,kullanim_orani,duyuru_id,gonderen_kullanici_id)
      VALUES (?,10,1,?,?,?,?,120,?,1)")
      ->execute([
        $caseId,$owner,hash('sha256',$caseId.'|'.$cycle),
        $signal,$signal==='hedef_disinda'?'hedef_disinda':'yuzde_75',$noticeId
      ]);
    $pdo->prepare("INSERT INTO kurum_duyuru_alicilari
      (duyuru_id,kurum_id,kullanici_id,kurum_rolu,okundu_tarihi)
      VALUES (?,10,?,'super_admin',?)")
      ->execute([$noticeId,$owner,$readAt]);
}

// Case 1: current owner + current cycle + current signal, unread.
add_notice_197($pdo,1,1,$cycles[1],'hedef_disinda',201,null);

// Case 2: notice belongs to old owner 1, current owner is 2 -> pending.
add_notice_197($pdo,2,1,$cycles[2],'hedef_disinda',202,'2026-10-01 10:00:00');

// Case 3: same current owner but old pre-reopen cycle -> pending.
add_notice_197($pdo,3,1,'2026-09-28 07:00:00','hedef_disinda',203,null);

$actor=['id'=>1,'role'=>'super_admin'];

$c1=ma_target_risk_context($pdo,$actor,1);
ok_197(is_array($c1),'case 1 target-risk context missing.');
ok_197((string)$c1['hedef_risk_kodu']==='hedef_disinda','case 1 risk code mismatch.');
ok_197((string)$c1['hedef_bildirim_durumu']==='okunmadi','current unread delivery must be unread.');
ok_197((int)$c1['hedef_duyuru_id']===201,'case 1 current announcement id mismatch.');
ok_197(ma_target_notification_label($c1)==='Bildirim Okunmadı','unread UI label mismatch.');
ok_197(ma_target_notification_class($c1)==='danger','unread UI class mismatch.');

$c2=ma_target_risk_context($pdo,$actor,2);
ok_197(is_array($c2),'case 2 target-risk context missing.');
ok_197((int)$c2['sorumlu_kullanici_id']===2,'case 2 current owner mismatch.');
ok_197((string)$c2['hedef_bildirim_durumu']==='bekliyor',
    'old-owner notification must not satisfy current owner delivery.');
ok_197($c2['hedef_bildirim_id']===null,'old-owner notification must not be exposed as current delivery.');

$c3=ma_target_risk_context($pdo,$actor,3);
ok_197(is_array($c3),'case 3 target-risk context missing.');
ok_197((string)$c3['hedef_bildirim_durumu']==='bekliyor',
    'old reopen-cycle notification must not satisfy current cycle.');
ok_197($c3['hedef_bildirim_id']===null,'old-cycle notification must not be exposed as current delivery.');

$c4=ma_target_risk_context($pdo,$actor,4);
ok_197(is_array($c4),'case 4 target-risk context missing.');
ok_197((string)$c4['hedef_risk_kodu']==='yuzde_50','case 4 risk code mismatch.');
ok_197((string)$c4['hedef_bildirim_durumu']==='uygulanmaz',
    '50-74 risk band must not require target-risk notification.');
ok_197(ma_target_notification_label($c4)==='Bildirim Gerekmiyor','not-applicable UI label mismatch.');

$missing=ma_target_risk_context($pdo,$actor,999);
ok_197($missing===null,'unknown case target-risk context must be null.');

$nonAdmin=ma_target_risk_context($pdo,['id'=>9,'role'=>'yonetici'],1);
ok_197($nonAdmin===null,'non-Super-Admin target-risk action context must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: action-detail target-risk adapter preserves current owner/current cycle/read-state semantics\n";
