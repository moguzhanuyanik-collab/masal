<?php
declare(strict_types=1);

function fail_200(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_200(bool $condition,string $message): void { if(!$condition) fail_200($message); }

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
}catch(Throwable $e){ fail_200('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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

$GLOBALS['users_200']=[
    1=>['id'=>1,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin A'],
    2=>['id'=>2,'role'=>'super_admin','aktif'=>1,'ad_soyad'=>'Admin B'],
];
function auth_fetch_user(PDO $pdo,int $userId): ?array {
    $row=$GLOBALS['users_200'][$userId]??null;
    return is_array($row) && (int)($row['aktif']??0)===1?$row:null;
}
function auth_user_has_role(?array $user,string $role): bool {
    return is_array($user) && (string)($user['role']??'')===$role;
}

$GLOBALS['risk_rows_200']=[];
function mhr_rows(PDO $pdo,array $actor,array $filters=[],int $limit=700): array {
    return array_slice($GLOBALS['risk_rows_200'],0,$limit);
}
function mhr_remaining_label(float $hours): string {
    return number_format($hours,1,'.','').' saat';
}
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }

$GLOBALS['source_open_200']=[];
function ma_case_source_still_open(PDO $pdo,array $case): bool {
    return (bool)($GLOBALS['source_open_200'][(int)$case['id']]??true);
}

$GLOBALS['history_200']=[];
function ma_history_add(
    PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null
): void {
    $GLOBALS['history_200'][]=[
        'vaka_id'=>$caseId,'kullanici_id'=>$userId,'tur'=>$type,'kod'=>$code,'not'=>$note
    ];
}

$GLOBALS['announcements_200']=[];
$GLOBALS['announcement_fail_institutions_200']=[80=>true];
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
    if(!empty($GLOBALS['announcement_fail_institutions_200'][$institutionId])){
        throw new RuntimeException('Simulated central notification failure.');
    }
    $id=900+count($GLOBALS['announcements_200'])+1;
    $GLOBALS['announcements_200'][]=[
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

$pdo->exec("INSERT INTO ticari_mutabakat_hedef_politikalari(id) VALUES
    (11),(12),(13),(14),(15),(17),(18)");

$cases=[
    [1,10,1001,'acik',1],
    [2,20,1002,'acik',2],
    [3,30,1003,'acik',9],
    [4,null,1004,'acik',1],
    [5,50,1005,'acik',1],
    [6,60,1006,'acik',1],
    [7,70,1007,'acik',1],
    [8,80,1008,'acik',1],
];
$stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
    (id,kurum_id,sozlesme_id,durum,sorumlu_kullanici_id)
    VALUES (?,?,?,?,?)");
foreach($cases as $row)$stmt->execute($row);
$stmt->closeCursor();

$cycle='2026-10-02 10:00:00';
$GLOBALS['risk_rows_200']=[
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
    [
        'id'=>7,'kurum_id'=>70,'sozlesme_id'=>1007,'sozlesme_no'=>'S-7','kurum_adi'=>'Kurum 7',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>17,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>130.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Toplu gönderim başarılı'
    ],
    [
        'id'=>8,'kurum_id'=>80,'sozlesme_id'=>1008,'sozlesme_no'=>'S-8','kurum_adi'=>'Kurum 8',
        'sorumlu_kullanici_id'=>1,'sorun_turu'=>'operasyon','hedef_politika_id'=>18,
        'dongu_baslangic_tarihi'=>$cycle,'hedef_risk_kodu'=>'hedef_disinda',
        'hedef_risk_etiketi'=>'Hedef Dışında','hedef_sure_kullanim_orani'=>135.0,'hedef_kalan_saat'=>0.0,
        'hedef_cevrim_durumu'=>'hedef_disinda','hedef_ilk_mudahale_durumu'=>'hedef_icinde',
        'ilk_mudahale_bekliyor'=>false,'aksiyon_gecikti'=>true,'aksiyon_bugun'=>false,
        'son_aciklama'=>'Bildirim altyapısı hatası simülasyonu'
    ],
];

$GLOBALS['source_open_200']=[
    1=>true,2=>true,3=>true,4=>true,5=>false,6=>true,7=>true,8=>true
];

$actor=['id'=>1,'role'=>'super_admin'];

$pendingIds=mi_pending_case_ids([
    ['id'=>1,'hedef_bildirim_bekliyor'=>true],
    ['id'=>2,'hedef_bildirim_bekliyor'=>1],
    ['id'=>2,'hedef_bildirim_bekliyor'=>true],
    ['id'=>6,'hedef_bildirim_bekliyor'=>false],
    ['id'=>7,'hedef_bildirim_bekliyor'=>true],
    ['id'=>0,'hedef_bildirim_bekliyor'=>true],
]);
ok_200($pendingIds===[1,2,7],'visible pending resolver must return unique positive pending ids.');

$emptyBlocked=false;
try{mi_send_target_risk_cases($pdo,$actor,[],[1,2],50);}catch(RuntimeException){$emptyBlocked=true;}
ok_200($emptyBlocked,'empty bulk selection must be rejected.');

$limitBlocked=false;
try{
    mi_send_target_risk_cases($pdo,$actor,range(1,51),range(1,51),100);
}catch(RuntimeException){$limitBlocked=true;}
ok_200($limitBlocked,'domain hard cap must reject 51 selections even when caller asks for a higher max.');
ok_200(count($GLOBALS['announcements_200'])===0,'limit rejection must occur before any send.');

$batch=mi_send_target_risk_cases(
    $pdo,$actor,
    [1,2,2,3,4,5,6,7,8,999],
    [1,2,3,4,5,7,8],
    50
);
ok_200((int)$batch['selected']===9,'bulk selection must deduplicate repeated ids.');
ok_200((int)$batch['eligible']===7,'visible/pending allowlist count mismatch.');
ok_200((int)$batch['sent']===3,'three valid selected cases should send.');
ok_200((int)$batch['invalid_owner']===1,'invalid owner outcome mismatch.');
ok_200((int)$batch['no_institution']===1,'missing institution outcome mismatch.');
ok_200((int)$batch['stale_source']===1,'stale source outcome mismatch.');
ok_200((int)$batch['failed']===1,'single notification failure must be isolated and reported.');
ok_200((int)$batch['not_visible']===2,'non-visible/non-pending selections must be rejected by allowlist.');

ok_200(count($GLOBALS['announcements_200'])===3,'successful batch cases must create exactly three announcements.');
ok_200((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri")->fetchColumn()===3,
    'successful batch cases must create exactly three notification history rows.');
ok_200((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri WHERE vaka_id=8")->fetchColumn()===0,
    'failed case transaction must roll back its notification history row.');

$sentCaseIds=array_values(array_unique(array_map(
    static fn(array $row):int=>(int)preg_replace('/^.*vaka_id=/', '', (string)$row['baglanti']),
    $GLOBALS['announcements_200']
)));
sort($sentCaseIds);
ok_200($sentCaseIds===[1,2,7],'bulk send must affect only valid allowed cases.');

$batchAgain=mi_send_target_risk_cases($pdo,$actor,[1,2,7],[1,2,7],50);
ok_200((int)$batchAgain['sent']===0,'second bulk click must not resend current notifications.');
ok_200((int)$batchAgain['not_pending']===3,'second bulk click must stop at current inbox context.');
ok_200(count($GLOBALS['announcements_200'])===3,'second bulk click must not duplicate central announcements.');
ok_200((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_hedef_risk_bildirimleri")->fetchColumn()===3,
    'second bulk click must not duplicate notification history.');

$historySent=array_values(array_filter(
    $GLOBALS['history_200'],
    static fn(array $row):bool=>(string)$row['tur']==='bildirim'
));
ok_200(count($historySent)===3,'successful bulk sends must append exactly one history event per sent case.');

$nonAdminBlocked=false;
try{
    mi_send_target_risk_cases($pdo,['id'=>99,'role'=>'yonetici'],[1],[1],50);
}catch(RuntimeException){$nonAdminBlocked=true;}
ok_200($nonAdminBlocked,'non-Super-Admin bulk sender must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: filtered bulk inbox send enforces hard limit, visible allowlist, per-case isolation and exact-case dedup\n";
