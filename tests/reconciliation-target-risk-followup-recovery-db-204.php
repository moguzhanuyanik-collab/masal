<?php
declare(strict_types=1);

function fail_204(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_204(bool $condition,string $message): void { if(!$condition) fail_204($message); }

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
}catch(Throwable $e){ fail_204('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool { return true; }
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}
function mhs_tables_ready(PDO $pdo): bool { return true; }
function ma_open_stages(): array { return ['acik','incelemede','beklemede']; }
function ma_case_source_still_open(PDO $pdo,array $case): bool { return true; }
function ma_validate_date(string $value): ?string {
    $value=trim($value);
    if($value==='') return null;
    $d=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$d || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $d->format('Y-m-d')!==$value) return null;
    return $value;
}
function auth_fetch_user(PDO $pdo,int $id): ?array {
    $stmt=$pdo->prepare('SELECT id,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$id]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}
function auth_user_has_role(?array $user,string $role): bool {
    return is_array($user) && (int)($user['aktif']??0)===1 && (string)($user['ana_rol']??'')===$role;
}
function ma_history_add(PDO $pdo,int $caseId,?int $userId,string $type,?string $code=null,?string $note=null): void {
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vaka_gecmisi
      (vaka_id,kullanici_id,tur,kod,not_metni,olusturulma_tarihi)
      VALUES (?,?,?,?,?,NOW())");
    $stmt->execute([$caseId,$userId,$type,$code,$note]);
    $stmt->closeCursor();
}

require __DIR__.'/../src/ticari_mutabakat_planlama.php';

function mrts_tables_ready(PDO $pdo): bool { return true; }
function mrt_tables_ready(PDO $pdo): bool { return true; }
function mrh_window_days(int|string|null $value): int {
    $days=(int)$value;
    return in_array($days,[7,30,90,180,365],true)?$days:30;
}
function mrts_state_labels(): array {
    return [
      'owner_degisti'=>'Owner Değişti',
      'dongu_degisti'=>'Reopen Döngüsü Değişti',
      'sinyal_degisti'=>'Hedef-Risk Sinyali Değişti',
      'bildirim_degisti'=>'Güncel Bildirim Değişti',
      'plan_bildirimi_yok'=>'Plan Bildirimi Bulunamadı',
      'okundu'=>'Bildirim Okundu',
      'risk_cozuldu'=>'Hedef-Risk Çözüldü',
      'vaka_kapandi'=>'Vaka Kapandı',
      'aksiyon_gecikmis'=>'Aksiyon Gecikmiş',
    ];
}

$GLOBALS['health_204']=[
  1=>['vaka_id'=>1,'takip_durumu'=>'owner_degisti','sorumlu_kullanici_id'=>2,'guncel_sorumlu_adi'=>'Admin İki','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>101,'plan_notu'=>'Eski owner planı','takip_durumu_etiketi'=>'Owner Değişti','takip_nedeni'=>'Owner değişti','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-1'],
  2=>['vaka_id'=>2,'takip_durumu'=>'dongu_degisti','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_disinda','plan_bildirim_id'=>102,'plan_notu'=>'Eski döngü','takip_durumu_etiketi'=>'Reopen Döngüsü Değişti','takip_nedeni'=>'Döngü değişti','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-2'],
  3=>['vaka_id'=>3,'takip_durumu'=>'sinyal_degisti','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>103,'plan_notu'=>'Eski sinyal','takip_durumu_etiketi'=>'Hedef-Risk Sinyali Değişti','takip_nedeni'=>'Sinyal değişti','kurum_adi'=>'B Kurumu','sozlesme_no'=>'S-3'],
  4=>['vaka_id'=>4,'takip_durumu'=>'bildirim_degisti','sorumlu_kullanici_id'=>2,'guncel_sorumlu_adi'=>'Admin İki','plan_alici_adi'=>'Admin İki','plan_esik_kodu'=>'hedef_disinda','plan_bildirim_id'=>104,'plan_notu'=>'Eski bildirim','takip_durumu_etiketi'=>'Güncel Bildirim Değişti','takip_nedeni'=>'Bildirim değişti','kurum_adi'=>'B Kurumu','sozlesme_no'=>'S-4'],
  5=>['vaka_id'=>5,'takip_durumu'=>'plan_bildirimi_yok','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'—','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>0,'plan_notu'=>'Plan bildirimi kayıp','takip_durumu_etiketi'=>'Plan Bildirimi Bulunamadı','takip_nedeni'=>'Plan bildirimi bulunamadı','kurum_adi'=>'C Kurumu','sozlesme_no'=>'S-5'],
  6=>['vaka_id'=>6,'takip_durumu'=>'okundu','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>106,'plan_notu'=>'Okundu','takip_durumu_etiketi'=>'Bildirim Okundu','takip_nedeni'=>'Okundu','kurum_adi'=>'C Kurumu','sozlesme_no'=>'S-6'],
  7=>['vaka_id'=>7,'takip_durumu'=>'risk_cozuldu','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>107,'plan_notu'=>'Çözüldü','takip_durumu_etiketi'=>'Hedef-Risk Çözüldü','takip_nedeni'=>'Risk çözüldü','kurum_adi'=>'C Kurumu','sozlesme_no'=>'S-7'],
  8=>['vaka_id'=>8,'takip_durumu'=>'vaka_kapandi','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>108,'plan_notu'=>'Kapandı','takip_durumu_etiketi'=>'Vaka Kapandı','takip_nedeni'=>'Kapandı','kurum_adi'=>'C Kurumu','sozlesme_no'=>'S-8'],
  9=>['vaka_id'=>9,'takip_durumu'=>'owner_degisti','sorumlu_kullanici_id'=>2,'guncel_sorumlu_adi'=>'Admin İki','plan_alici_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_75','plan_bildirim_id'=>109,'plan_notu'=>'Current unread yok','takip_durumu_etiketi'=>'Owner Değişti','takip_nedeni'=>'Owner değişti','kurum_adi'=>'D Kurumu','sozlesme_no'=>'S-9'],
];

$GLOBALS['current_204']=[
  1=>['vaka_id'=>1,'id'=>201,'alici_kullanici_id'=>2,'alici_adi'=>'Admin İki','esik_kodu'=>'hedef_disinda','hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','olusturulma_tarihi'=>'2026-10-02 10:00:00'],
  2=>['vaka_id'=>2,'id'=>202,'alici_kullanici_id'=>1,'alici_adi'=>'Admin Bir','esik_kodu'=>'hedef_disinda','hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','olusturulma_tarihi'=>'2026-10-02 10:01:00'],
  3=>['vaka_id'=>3,'id'=>203,'alici_kullanici_id'=>1,'alici_adi'=>'Admin Bir','esik_kodu'=>'hedef_disinda','hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','olusturulma_tarihi'=>'2026-10-02 10:02:00'],
  4=>['vaka_id'=>4,'id'=>204,'alici_kullanici_id'=>2,'alici_adi'=>'Admin İki','esik_kodu'=>'hedef_disinda','hedef_risk_kodu'=>'hedef_disinda','hedef_risk_etiketi'=>'Hedef dışında','olusturulma_tarihi'=>'2026-10-02 10:03:00'],
  5=>['vaka_id'=>5,'id'=>205,'alici_kullanici_id'=>1,'alici_adi'=>'Admin Bir','esik_kodu'=>'hedef_75','hedef_risk_kodu'=>'yuzde_75','hedef_risk_etiketi'=>'Hedef %75+','olusturulma_tarihi'=>'2026-10-02 10:04:00'],
];
$GLOBALS['drop_current_on_sync_204']=0;

function mrts_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $out=[];
    foreach($GLOBALS['health_204'] as $row){
        $state=(string)($filters['state']??'');
        if($state!=='' && (string)$row['takip_durumu']!==$state) continue;
        $owner=(int)($filters['owner_id']??0);
        if($owner>0 && (int)$row['sorumlu_kullanici_id']!==$owner) continue;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}
function mrt_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $signal=(string)($filters['signal']??'');
    $owner=(int)($filters['owner_id']??0);
    $out=[];
    foreach($GLOBALS['current_204'] as $id=>$row){
        if($signal!=='' && (string)$row['esik_kodu']!==$signal) continue;
        if($owner>0 && (int)$row['alici_kullanici_id']!==$owner) continue;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}
function mrt_visible_case_ids(array $rows): array {
    $out=[];
    foreach($rows as $row){
        $id=(int)($row['vaka_id']??0);
        if($id>0)$out[$id]=$id;
    }
    return array_values($out);
}
function ma_sync_cases(PDO $pdo,array $actor): array {
    $id=(int)($GLOBALS['drop_current_on_sync_204']??0);
    if($id>0) unset($GLOBALS['current_204'][$id]);
    return ['created'=>0,'closed'=>0,'reopened'=>0];
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_takip_kurtarma.php';

$tables=['ticari_mutabakat_vaka_gecmisi','ticari_mutabakat_vakalari','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
  id BIGINT UNSIGNED NOT NULL,
  ad_soyad VARCHAR(190) NOT NULL,
  ana_rol VARCHAR(30) NOT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vakalari(
  id BIGINT UNSIGNED NOT NULL,
  durum VARCHAR(20) NOT NULL,
  sorumlu_kullanici_id BIGINT UNSIGNED NULL,
  sonraki_aksiyon_tarihi DATE NULL,
  guncelleyen_kullanici_id BIGINT UNSIGNED NULL,
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ticari_mutabakat_vaka_gecmisi(
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  vaka_id BIGINT UNSIGNED NOT NULL,
  kullanici_id BIGINT UNSIGNED NULL,
  tur VARCHAR(20) NOT NULL,
  kod VARCHAR(40) NULL,
  not_metni VARCHAR(2000) NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,ana_rol,aktif) VALUES
  (1,'Admin Bir','super_admin',1),(2,'Admin İki','super_admin',1),(9,'Yönetici','yonetici',1)");

for($id=1;$id<=9;$id++){
    $owner=in_array($id,[1,4,9],true)?2:1;
    if($id===2)$owner=1;
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi)
      VALUES (?,'acik',?,NULL)");
    $stmt->execute([$id,$owner]);
}

$actor=['id'=>1,'role'=>'super_admin'];

$rows=mrtr_rows($pdo,$actor,['days'=>30],100);
$ids=mrtr_visible_case_ids($rows);
sort($ids);
ok_204($ids===[1,2,3,4,5],
  'only stale-health rows that still exist in exact current unread allowlist must be recoverable.');

$summary=mrtr_summary($pdo,$actor,30);
ok_204((int)$summary['total']===5,'stale recovery summary total mismatch.');
ok_204((int)$summary['owner_changed']===1,'owner-changed recoverable count mismatch.');
ok_204((int)$summary['cycle_changed']===1,'cycle-changed recoverable count mismatch.');
ok_204((int)$summary['signal_changed']===1,'signal-changed recoverable count mismatch.');
ok_204((int)$summary['notice_changed']===1,'notice-changed recoverable count mismatch.');
ok_204((int)$summary['plan_notice_missing']===1,'missing-plan-notice recoverable count mismatch.');

$owner2=mrtr_rows($pdo,$actor,['days'=>30,'owner_id'=>2],100);
$owner2Ids=mrtr_visible_case_ids($owner2);
sort($owner2Ids);
ok_204($owner2Ids===[1,4],'current-owner filter must use current owner/current notification recipient.');

$currentOutside=mrtr_rows($pdo,$actor,['days'=>30,'signal'=>'hedef_disinda'],100);
$outsideIds=mrtr_visible_case_ids($currentOutside);
sort($outsideIds);
ok_204($outsideIds===[1,2,3,4],
  'signal filter must use current exact unread signal, not stale plan signal.');

$search=mrtr_rows($pdo,$actor,['days'=>30,'q'=>'S-5'],100);
ok_204(count($search)===1 && (int)$search[0]['vaka_id']===5,'stale recovery search filter mismatch.');

$case1=$rows[array_search(1,array_column($rows,'vaka_id'),true)];
ok_204((string)$case1['plan_alici_adi']==='Admin Bir','old plan recipient snapshot mismatch.');
ok_204((string)$case1['kurtarma_alici_adi']==='Admin İki','current recovery recipient/owner mismatch.');
ok_204((string)$case1['plan_esik_kodu']==='hedef_75','old plan signal snapshot mismatch.');
ok_204((string)$case1['kurtarma_esik_kodu']==='hedef_disinda','current recovery signal mismatch.');
ok_204((int)$case1['kurtarma_bildirim_id']===201,'current exact notification mismatch.');

$future=(new DateTimeImmutable('today'))->modify('+4 days')->format('Y-m-d');
$result=mrtr_recover_selected($pdo,$actor,[1,2,3,4,5],$future,'Current context ile kurtarma',['days'=>30]);
ok_204((int)$result['updated']===5 && (int)$result['recovered']===5,
  'five stale plans should be recovered into new current-context planning.');
ok_204((int)$result['owner_count']===2,'recovery should preserve two distinct current owners.');
ok_204((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===2,
  'owner-changed case must preserve current owner 2, not stale owner 1.');
ok_204((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=3")->fetchColumn()===1,
  'signal-changed case current owner must remain unchanged.');
ok_204((string)$pdo->query("SELECT sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id=4")->fetchColumn()===$future,
  'recovered case must receive new next-action date.');
ok_204((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE kod='toplu_takip_planlama'")->fetchColumn()===5,
  'each recovered stale plan must append a new current follow-up planning event.');

$nonStale=false;
try{
    mrtr_recover_selected($pdo,$actor,[6],$future,'Okundu kurtarma',['days'=>30]);
}catch(RuntimeException $e){$nonStale=str_contains($e->getMessage(),'stale plan kurtarma allowlistinde');}
ok_204($nonStale,'read notification state must never be recoverable.');

$historyBefore=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn();
$GLOBALS['drop_current_on_sync_204']=4;
$stalePost=false;
try{
    mrtr_recover_selected($pdo,$actor,[4],$future,'Current unread düştü',['days'=>30]);
}catch(RuntimeException $e){
    $stalePost=str_contains($e->getMessage(),'stale plan kurtarma allowlistinde')
      || str_contains($e->getMessage(),'exact current');
}
ok_204($stalePost,'POST-time loss of exact current unread context must fail closed.');
ok_204((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn()===$historyBefore,
  'failed stale recovery must not append history.');
$GLOBALS['drop_current_on_sync_204']=0;
$GLOBALS['current_204'][4]=[
  'vaka_id'=>4,'id'=>204,'alici_kullanici_id'=>2,'alici_adi'=>'Admin İki',
  'esik_kodu'=>'hedef_disinda','hedef_risk_kodu'=>'hedef_disinda',
  'hedef_risk_etiketi'=>'Hedef dışında','olusturulma_tarihi'=>'2026-10-02 10:03:00'
];

$tooMany=false;
try{mrtr_normalize_case_ids(range(1,51));}catch(RuntimeException $e){$tooMany=str_contains($e->getMessage(),'en fazla 50');}
ok_204($tooMany,'51-case stale recovery selection must be rejected.');

$past=(new DateTimeImmutable('today'))->modify('-1 day')->format('Y-m-d');
$pastRejected=false;
try{mrtr_recover_selected($pdo,$actor,[1],$past,'Geçmiş tarih',['days'=>30]);}
catch(RuntimeException $e){$pastRejected=str_contains($e->getMessage(),'geçmişte olamaz');}
ok_204($pastRejected,'past next-action date must be rejected by owner-preserving planning engine.');

ok_204(mrtr_rows($pdo,['id'=>9,'role'=>'yonetici'],['days'=>30],100)===[],
  'non-Super-Admin stale recovery resolver must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: stale health + exact current unread intersection, current-owner preservation, new planning history and fail-closed recovery\n";
