<?php
declare(strict_types=1);

function fail_199(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_199(bool $condition,string $message): void { if(!$condition) fail_199($message); }

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
}catch(Throwable $e){ fail_199('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
function mhs_tables_ready(PDO $pdo): bool { return true; }
function mhr_tables_ready(PDO $pdo): bool { return true; }
function bd_tables_ready(PDO $pdo): bool { return true; }

$GLOBALS['users_199']=[
    1=>['id'=>1,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin A'],
    2=>['id'=>2,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin B'],
];
function auth_fetch_user(PDO $pdo,int $userId): ?array {
    $row=$GLOBALS['users_199'][$userId]??null;
    return is_array($row) && (int)($row['aktif']??0)===1?$row:null;
}
function auth_user_has_role(?array $user,string $role): bool {
    return is_array($user) && (string)($user['role']??'')===$role;
}

$GLOBALS['risk_rows_199']=[];
function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=700): array {
    return array_slice($GLOBALS['risk_rows_199'],0,$limit);
}
function mhr_remaining_label(float $hours): string {
    return number_format($hours,1,'.','').' saat';
}
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }

$GLOBALS['source_open_199']=[];
function ma_case_source_still_open(PDO $pdo,array $case): bool {
    return (bool)($GLOBALS['source_open_199'][(int)$case['id']]??true);
}

$GLOBALS['history_199']=[];
function ma_history_add(
    PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null
): void {
    $GLOBALS['history_199'][]=[
        'vaka_id'=>$caseId,'kullanici_id'=>$userId,'tur'=>$type,'kod'=>$code,'not'=>$note
    ];
}

$GLOBALS['announcements_199']=[];
function bd_insert_announcement(
    PDO $pdo,
    int $institutionId,
    int $senderId,
    string $type,
    string $title,
    string $message,
    string $importance,
    string $targetRoles,
    array $recipients,
    ?string $link=null,
    ?string $lastDisplayDate=null,
    ?string $sourceType=null,
    ?int $sourceId=null
): int {
    $id=700+count($GLOBALS['announcements_199'])+1;
    $GLOBALS['announcements_199'][]=[
        'id'=>$id,'kurum_id'=>$institutionId,'gonderen'=>$senderId,'tur'=>$type,
        'baslik'=>$title,'onem'=>$importance,'hedef'=>$targetRoles,
        'alicilar'=>$recipients,'baglanti'=>$link,'kaynak_turu'=>$sourceType,'kaynak_id'=>$sourceId
    ];
    return $id;
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_bildirim.php';
require __DIR__.'/../src/ticari_mutabakat_is_kutusu.php';

$tables=[
    'kurum_duyuru_alicilari',
    'ticari_mutabakat_hedef_politikalari',
    'ticari_mutabakat_hedef_risk_bildirimleri',
    'ticari_mutabakat_vakalari'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE ticari_mutabakat_vakalari(
    id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NULL,
    sozlesme_id BIGINT UNSIGNED NULL,
    sorun_turu VARCHAR(20) NOT NULL DEFAULT 'operasyon',
    durum VARCHAR(20) NOT NULL DEFAULT 'acik',
    sorumlu_kullanici_id BIGINT UNSIGNED NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_hedef_politikalari(
    id BIGINT UNSIGNED NOT NULL,
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
    PRIMARY KEY(id),
    UNIQUE KEY uk_hedef_risk_bildirim
      (vaka_id,dongu_anahtari,hedef_politika_id,esik_kodu,alici_kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_duyuru_alicilari(
    duyuru_id BIGINT UNSIGNED NOT NULL,
    kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    kurum_rolu VARCHAR(30) NOT NULL DEFAULT 'super_admin',
    okundu_tarihi DATETIME NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(duyuru_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari(id) VALUES (11),(12),(13),(14),(15)");

$cases=[
    [1,10,1001,'acik',1],
    [2,20,1002,'acik',2],
    [3,30,1003,'acik',9],
    [4,null,1004,'acik',1],
    [5,50,1005,'acik',1],
    [6,60,1006,'acik',1],
];
$stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
    (id,kurum_id,sozlesme_id,durum,sorumlu_kullanici_id)
    VALUES (?,?,?,?,?)");
foreach($cases as $row)$stmt->execute($row);
$stmt->closeCursor();

$cycle='2026-10-02 10:00:00';
$GLOBALS['risk_rows_199']=[
    [
        'id'=>1,'kurum_id'=>10,'sozlesme_id'=>1001,'sozlesme_no'=>'S-1','kurum_adi'=>'Kurum 1',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>11,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>125.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Açık mutabakat farkı'
    ],
    [
        'id'=>2,'kurum_id'=>20,'sozlesme_id'=>1002,'sozlesme_no'=>'S-2','kurum_adi'=>'Kurum 2',
        'sorumlu_kullanici_id'=>2,'sorun_turu'=>'butunluk','hedef_politika_id'=>12,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'yuzde_75',
        'hedef_risk_etiketi'=>'Hedef %75+','hedef_sure_kullanim_orani'=>82.0,'hedef_kalan_saat'=>2.0,
        'hedef_cevrim_durumu'=>'hedef_icinde','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>false,'aksiyon_bugun'=>true,
        'son_aciklama'=>'Kimlik eşleme kontrolü'
    ],
    [
        'id'=>3,'kurum_id'=>30,'sozlesme_id'=>1003,'sozlesme_no'=>'S-3','kurum_adi'=>'Kurum 3',
        'sorumlu_kullanici_id'=>9,'sorun_turu'=>'operasyon','hedef_politika_id'=>13,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>140.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Sorumlu geçersiz'
    ],
    [
        'id'=>4,'kurum_id'=>0,'sozlesme_id'=>1004,'sozlesme_no'=>'S-4','kurum_adi'=>'Kurumsuz',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>14,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>150.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Kurum yok'
    ],
    [
        'id'=>5,'kurum_id'=>50,'sozlesme_id'=>1005,'sozlesme_no'=>'S-5','kurum_adi'=>'Kurum 5',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>15,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>160.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Kaynak çözülmüş'
    ],
    [
        'id'=>6,'kurum_id'=>60,'sozlesme_id'=>1006,'sozlesme_no'=>'S-6','kurum_adi'=>'Kurum 6',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>null,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'yuzde_50',
        'hedef_risk_etiketi'=>'Hedef %50–74','hedef_sure_kullanim_orani'=>55.0,'hedef_kalan_saat'=>4.0,
        'hedef_cevrim_durumu'=>'hedef_icinde','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>false,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Bildirim gerekmiyor'
    ],
];
$GLOBALS['source_open_199']=[1=>true,2=>true,3=>true,4=>true,5=>false,6=>true];

$actor=['id'=>1,'role'=>'super_admin'];

$context=mi_target_risk_case($pdo,$actor,1);
ok_199(is_array($context),'pending inbox context should resolve.');
ok_199((string)$context['hedef_bildirim_durumu']==='bekliyor','case 1 should begin pending.');

$r1=mi_send_target_risk_case($pdo,$actor,1);
ok_199((string)$r1['status']==='sent','pending inbox case should send exactly once.');
ok_199((int)($r1['result']['sent']??0)===1,'exact-case send result should report one delivery.');
ok_199((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'case 1 notification history missing.');
ok_199(count($GLOBALS['announcements_199'])===1,'case 1 central announcement missing.');
ok_199((int)$GLOBALS['announcements_199'][0]['alicilar'][0]['kullanici_id']===1,
    'case 1 notification must target current owner.');
ok_199((string)$GLOBALS['announcements_199'][0]['baglanti']==='ticari-mutabakat-aksiyon.php?vaka_id=1',
    'inbox send must preserve action-detail deep link.');

$after=mi_target_risk_case($pdo,$actor,1);
ok_199((string)$after['hedef_bildirim_durumu']==='okunmadi',
    'after send inbox resolver should expose current notification as unread, not pending.');

$r1Again=mi_send_target_risk_case($pdo,$actor,1);
ok_199((string)$r1Again['status']==='not_pending',
    'second inbox click must stop before exact-case engine when current notification already exists.');
ok_199((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'second inbox click must not duplicate notification history.');
ok_199(count($GLOBALS['announcements_199'])===1,'second inbox click must not duplicate central announcement.');

$r2=mi_send_target_risk_case($pdo,$actor,2);
ok_199((string)$r2['status']==='sent','pending %75 inbox case should send.');
ok_199((int)$GLOBALS['announcements_199'][1]['alicilar'][0]['kullanici_id']===2,
    'case 2 must notify its own current owner.');
ok_199((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'sending case 2 must not alter case 1 history.');

$r3=mi_send_target_risk_case($pdo,$actor,3);
ok_199((string)$r3['status']==='invalid_owner','invalid current owner must fail closed.');

$r4=mi_send_target_risk_case($pdo,$actor,4);
ok_199((string)$r4['status']==='no_institution','case without institution must fail closed.');

$r5=mi_send_target_risk_case($pdo,$actor,5);
ok_199((string)$r5['status']==='stale_source','resolved source must prevent inbox notification.');

$r6=mi_send_target_risk_case($pdo,$actor,6);
ok_199((string)$r6['status']==='not_pending','50-74/policy-free inbox case must not send.');

$historyFor1=array_values(array_filter(
    $GLOBALS['history_199'],
    static fn(array $row):bool=>(int)$row['vaka_id']===1 && (string)$row['tur']==='bildirim'
));
ok_199(count($historyFor1)===1,'successful inbox send must append exactly one case history event.');

$nonAdminBlocked=false;
try{mi_send_target_risk_case($pdo,['id'=>99,'role'=>'yonetici'],1);}catch(RuntimeException){$nonAdminBlocked=true;}
ok_199($nonAdminBlocked,'non-Super-Admin inbox sender must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: inbox exact-case target-risk send preserves current-owner/current-cycle state and existing send-engine safeguards\n";
