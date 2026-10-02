<?php
declare(strict_types=1);

function fail_198(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_198(bool $condition,string $message): void { if(!$condition) fail_198($message); }

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
}catch(Throwable $e){ fail_198('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
function mhr_tables_ready(PDO $pdo): bool { return true; }
function bd_tables_ready(PDO $pdo): bool { return true; }

$GLOBALS['users_198']=[
    1=>['id'=>1,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin A'],
    2=>['id'=>2,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin B'],
];
function auth_fetch_user(PDO $pdo,int $userId): ?array {
    $row=$GLOBALS['users_198'][$userId]??null;
    return is_array($row) && (int)($row['aktif']??0)===1?$row:null;
}
function auth_user_has_role(?array $user,string $role): bool {
    return is_array($user) && (string)($user['role']??'')===$role;
}

$GLOBALS['risk_rows_198']=[];
function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=700): array {
    return array_slice($GLOBALS['risk_rows_198'],0,$limit);
}
function mhr_remaining_label(float $hours): string {
    return number_format($hours,1,'.','').' saat';
}
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }

$GLOBALS['source_open_198']=[];
function ma_case_source_still_open(PDO $pdo,array $case): bool {
    return (bool)($GLOBALS['source_open_198'][(int)$case['id']]??true);
}

$GLOBALS['history_198']=[];
function ma_history_add(
    PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null
): void {
    $GLOBALS['history_198'][]=[
        'vaka_id'=>$caseId,'kullanici_id'=>$userId,'tur'=>$type,'kod'=>$code,'not'=>$note
    ];
}

$GLOBALS['announcements_198']=[];
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
    $id=500+count($GLOBALS['announcements_198'])+1;
    $GLOBALS['announcements_198'][]=[
        'id'=>$id,'kurum_id'=>$institutionId,'gonderen'=>$senderId,'tur'=>$type,
        'baslik'=>$title,'onem'=>$importance,'hedef'=>$targetRoles,
        'alicilar'=>$recipients,'baglanti'=>$link,'kaynak_turu'=>$sourceType,'kaynak_id'=>$sourceId
    ];
    return $id;
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_bildirim.php';

$tables=['ticari_mutabakat_hedef_risk_bildirimleri','ticari_mutabakat_vakalari'];
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

$cases=[
    [1,10,1001,'acik',1],
    [2,20,1002,'acik',2],
    [3,30,1003,'acik',9],
    [4,null,1004,'acik',1],
    [5,50,1005,'acik',1],
    [6,60,1006,'acik',1],
    [7,70,1007,'acik',2],
];
$stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
    (id,kurum_id,sozlesme_id,durum,sorumlu_kullanici_id)
    VALUES (?,?,?,?,?)");
foreach($cases as $row)$stmt->execute($row);
$stmt->closeCursor();

$cycle='2026-10-02 08:00:00';
$GLOBALS['risk_rows_198']=[
    [
        'id'=>1,'kurum_id'=>10,'sozlesme_id'=>1001,'sozlesme_no'=>'S-1','kurum_adi'=>'Kurum 1',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>11,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_sure_kullanim_orani'=>125.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Açık mutabakat farkı'
    ],
    [
        'id'=>2,'kurum_id'=>20,'sozlesme_id'=>1002,'sozlesme_no'=>'S-2','kurum_adi'=>'Kurum 2',
        'sorumlu_kullanici_id'=>2,'sorun_turu'=>'butunluk','hedef_politika_id'=>12,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'yuzde_75',
        'hedef_sure_kullanim_orani'=>82.0,'hedef_kalan_saat'=>2.0,
        'hedef_cevrim_durumu'=>'hedef_icinde','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>false,'aksiyon_bugun'=>true,
        'son_aciklama'=>'Kimlik eşleme kontrolü'
    ],
    [
        'id'=>3,'kurum_id'=>30,'sozlesme_id'=>1003,'sozlesme_no'=>'S-3','kurum_adi'=>'Kurum 3',
        'sorumlu_kullanici_id'=>9,'sorun_turu'=>'operasyon','hedef_politika_id'=>13,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_sure_kullanim_orani'=>140.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Sorumlu geçersiz'
    ],
    [
        'id'=>4,'kurum_id'=>0,'sozlesme_id'=>1004,'sozlesme_no'=>'S-4','kurum_adi'=>'Kurumsuz',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>14,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_sure_kullanim_orani'=>150.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Kurum yok'
    ],
    [
        'id'=>5,'kurum_id'=>50,'sozlesme_id'=>1005,'sozlesme_no'=>'S-5','kurum_adi'=>'Kurum 5',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>15,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_sure_kullanim_orani'=>160.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Kaynak çözülmüş'
    ],
    [
        'id'=>6,'kurum_id'=>60,'sozlesme_id'=>1006,'sozlesme_no'=>'S-6','kurum_adi'=>'Kurum 6',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>16,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'yuzde_50',
        'hedef_sure_kullanim_orani'=>55.0,'hedef_kalan_saat'=>4.0,
        'hedef_cevrim_durumu'=>'hedef_icinde','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>false,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Bildirim gerekmiyor'
    ],
    [
        'id'=>7,'kurum_id'=>70,'sozlesme_id'=>1007,'sozlesme_no'=>'S-7','kurum_adi'=>'Kurum 7',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>17,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_sure_kullanim_orani'=>130.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'DB owner farklı'
    ],
];
$GLOBALS['source_open_198']=[1=>true,2=>true,3=>true,4=>true,5=>false,6=>true,7=>true];

$actor=['id'=>1,'role'=>'super_admin'];

$only1=mrb_candidate_rows($pdo,$actor,1500,1);
ok_198(count($only1)===1 && (int)$only1[0]['vaka_id']===1,
    'exact-case candidate resolver must return only selected case.');

$r1=mrb_sync_case($pdo,$actor,1);
ok_198((int)$r1['candidate_count']===1 && (int)$r1['sent']===1,
    'selected pending target-risk case should send exactly once.');
ok_198((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'case 1 notification history missing.');
ok_198(count($GLOBALS['announcements_198'])===1,'case 1 central announcement missing.');
ok_198((int)$GLOBALS['announcements_198'][0]['alicilar'][0]['kullanici_id']===1,
    'case 1 notification must target current owner.');
ok_198((string)$GLOBALS['announcements_198'][0]['baglanti']==='ticari-mutabakat-aksiyon.php?vaka_id=1',
    'case 1 notification deep link mismatch.');

$r1Again=mrb_sync_case($pdo,$actor,1);
ok_198((int)$r1Again['sent']===0 && (int)$r1Again['skipped']===1,
    'second exact-case sync must deduplicate current owner/cycle/signal.');
ok_198((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'duplicate exact-case sync must not create second history row.');
ok_198(count($GLOBALS['announcements_198'])===1,'duplicate exact-case sync must not create second announcement.');

$r2=mrb_sync_case($pdo,$actor,2);
ok_198((int)$r2['sent']===1,'selected %75 target-risk case should send.');
ok_198((int)$GLOBALS['announcements_198'][1]['alicilar'][0]['kullanici_id']===2,
    'case 2 must notify its own current owner.');
ok_198((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=1")->fetchColumn()===1,
    'sending case 2 must not alter case 1 delivery.');

$r3=mrb_sync_case($pdo,$actor,3);
ok_198((int)$r3['invalid_owner']===1 && (int)$r3['sent']===0,
    'invalid current owner must fail closed.');

$r4=mrb_sync_case($pdo,$actor,4);
ok_198((int)$r4['no_institution']===1 && (int)$r4['sent']===0,
    'case without institution must fail closed.');

$r5=mrb_sync_case($pdo,$actor,5);
ok_198((int)$r5['stale_source']===1 && (int)$r5['sent']===0,
    'resolved source must prevent exact-case notification.');

$r6=mrb_sync_case($pdo,$actor,6);
ok_198((int)$r6['candidate_count']===0 && (int)$r6['sent']===0,
    '50-74 risk band must not become a notification candidate.');

$r7=mrb_sync_case($pdo,$actor,7);
ok_198((int)$r7['candidate_count']===1 && (int)$r7['skipped']===1 && (int)$r7['sent']===0,
    'DB current owner mismatch must be skipped after row lock/revalidation.');

$global=mrb_sync($pdo,$actor);
ok_198((int)$global['candidate_count']===6,
    'global sync must continue to see all notification-producing candidates.');
ok_198((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri")->fetchColumn()===2,
    'global sync after exact-case sends must preserve dedup and not add invalid/stale cases.');

$historyForCase1=array_values(array_filter(
    $GLOBALS['history_198'],
    static fn(array $row):bool=>(int)$row['vaka_id']===1 && (string)$row['tur']==='bildirim'
));
ok_198(count($historyForCase1)===1,'successful exact-case send must append exactly one case history event.');

$nonAdminBlocked=false;
try{mrb_sync_case($pdo,['id'=>99,'role'=>'yonetici'],1);}catch(RuntimeException){$nonAdminBlocked=true;}
ok_198($nonAdminBlocked,'non-Super-Admin exact-case send must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: exact-case target-risk send reuses global engine, preserves dedup and fails closed on stale/invalid context\n";
