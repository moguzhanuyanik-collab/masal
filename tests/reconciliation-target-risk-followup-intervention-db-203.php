<?php
declare(strict_types=1);

function fail_203(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_203(bool $condition,string $message): void { if(!$condition) fail_203($message); }

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
}catch(Throwable $e){ fail_203('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

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
      'aksiyon_gecikmis'=>'Aksiyon Gecikmiş',
      'aksiyon_bugun'=>'Aksiyon Bugün',
      'aksiyon_tarihi_yok'=>'Aksiyon Tarihi Yok',
      'planli_okunmadi'=>'Planlı · Okunmadı',
      'owner_degisti'=>'Owner Değişti',
    ];
}

$GLOBALS['health_203']=[
  1=>['vaka_id'=>1,'takip_durumu'=>'aksiyon_gecikmis','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_disinda','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-1','sonraki_aksiyon_tarihi'=>'2020-01-01','guncel_bildirim_durumu'=>'okunmadi'],
  2=>['vaka_id'=>2,'takip_durumu'=>'aksiyon_bugun','sorumlu_kullanici_id'=>2,'guncel_sorumlu_adi'=>'Admin İki','plan_esik_kodu'=>'hedef_75','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-2','sonraki_aksiyon_tarihi'=>'2020-01-02','guncel_bildirim_durumu'=>'okunmadi'],
  3=>['vaka_id'=>3,'takip_durumu'=>'aksiyon_tarihi_yok','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_disinda','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-3','sonraki_aksiyon_tarihi'=>null,'guncel_bildirim_durumu'=>'okunmadi'],
  4=>['vaka_id'=>4,'takip_durumu'=>'planli_okunmadi','sorumlu_kullanici_id'=>1,'guncel_sorumlu_adi'=>'Admin Bir','plan_esik_kodu'=>'hedef_disinda','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-4','sonraki_aksiyon_tarihi'=>'2099-01-01','guncel_bildirim_durumu'=>'okunmadi'],
  5=>['vaka_id'=>5,'takip_durumu'=>'owner_degisti','sorumlu_kullanici_id'=>2,'guncel_sorumlu_adi'=>'Admin İki','plan_esik_kodu'=>'hedef_disinda','kurum_adi'=>'A Kurumu','sozlesme_no'=>'S-5','sonraki_aksiyon_tarihi'=>'2020-01-01','guncel_bildirim_durumu'=>'okunmadi'],
];
$GLOBALS['current_203']=[1=>true,2=>true,3=>true,4=>true];
$GLOBALS['stale_on_sync_203']=0;

function mrts_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $out=[];
    foreach($GLOBALS['health_203'] as $row){
        $state=(string)($filters['state']??'');
        if($state!=='' && (string)$row['takip_durumu']!==$state) continue;
        $owner=(int)($filters['owner_id']??0);
        if($owner>0 && (int)$row['sorumlu_kullanici_id']!==$owner) continue;
        $signal=(string)($filters['signal']??'');
        if($signal!=='' && (string)$row['plan_esik_kodu']!==$signal) continue;
        $q=mb_strtolower(trim((string)($filters['q']??'')),'UTF-8');
        if($q!=='' && !str_contains(mb_strtolower($row['kurum_adi'].' '.$row['sozlesme_no'].' '.$row['guncel_sorumlu_adi'],'UTF-8'),$q)) continue;
        $out[]=$row;
        if(count($out)>=$limit) break;
    }
    return $out;
}
function mrt_rows(PDO $pdo,array $actor,array $filters=[],int $limit=500): array {
    if((string)(auth_effective_role($actor)??'')!=='super_admin') return [];
    $out=[];
    foreach($GLOBALS['current_203'] as $id=>$enabled){
        if(!$enabled) continue;
        $out[]=['vaka_id'=>(int)$id];
        if(count($out)>=$limit) break;
    }
    return $out;
}
function ma_sync_cases(PDO $pdo,array $actor): array {
    $id=(int)($GLOBALS['stale_on_sync_203']??0);
    if($id>0)$GLOBALS['current_203'][$id]=false;
    return ['created'=>0,'closed'=>0,'reopened'=>0];
}

require __DIR__.'/../src/ticari_mutabakat_hedef_risk_takip_mudahale.php';

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
for($id=1;$id<=5;$id++){
    $owner=in_array($id,[2,5],true)?2:1;
    $next=match($id){1=>'2020-01-01',2=>'2020-01-02',3=>null,4=>'2099-01-01',default=>'2020-01-01'};
    $stmt=$pdo->prepare("INSERT INTO ticari_mutabakat_vakalari
      (id,durum,sorumlu_kullanici_id,sonraki_aksiyon_tarihi)
      VALUES (?,'acik',?,?)");
    $stmt->execute([$id,$owner,$next]);
}

$actor=['id'=>1,'role'=>'super_admin'];

$rows=mrtm_rows($pdo,$actor,['days'=>30],100);
$ids=mrtm_visible_case_ids($rows);
sort($ids);
ok_203($ids===[1,2,3],'only overdue/today/no-date states must enter intervention allowlist.');

$summary=mrtm_summary($pdo,$actor,30);
ok_203((int)$summary['total']===3,'intervention summary total mismatch.');
ok_203((int)$summary['overdue']===1,'overdue intervention count mismatch.');
ok_203((int)$summary['today']===1,'today intervention count mismatch.');
ok_203((int)$summary['no_date']===1,'no-date intervention count mismatch.');

$owner1=mrtm_rows($pdo,$actor,['days'=>30,'owner_id'=>1],100);
ok_203(count($owner1)===2,'owner filter must keep owner-1 overdue/no-date candidates.');
$signal75=mrtm_rows($pdo,$actor,['days'=>30,'signal'=>'hedef_75'],100);
ok_203(count($signal75)===1 && (int)$signal75[0]['vaka_id']===2,'signal filter mismatch.');
$search=mrtm_rows($pdo,$actor,['days'=>30,'q'=>'S-3'],100);
ok_203(count($search)===1 && (int)$search[0]['vaka_id']===3,'search filter mismatch.');

$future=(new DateTimeImmutable('today'))->modify('+3 days')->format('Y-m-d');
$result=mrtm_reschedule_selected($pdo,$actor,[1,2,3],$future,'Operasyon yeniden planı',['days'=>30]);
ok_203((int)$result['updated']===3 && (int)$result['owner_count']===2,'three cases across two owners should be rescheduled.');
ok_203((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=1")->fetchColumn()===1,'case 1 owner changed unexpectedly.');
ok_203((int)$pdo->query("SELECT sorumlu_kullanici_id FROM ticari_mutabakat_vakalari WHERE id=2")->fetchColumn()===2,'case 2 owner changed unexpectedly.');
ok_203((string)$pdo->query("SELECT sonraki_aksiyon_tarihi FROM ticari_mutabakat_vakalari WHERE id=3")->fetchColumn()===$future,'case 3 next action date not written.');
ok_203((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi WHERE kod='toplu_takip_planlama'")->fetchColumn()===3,
  'each intervention reschedule must append existing follow-up planning history.');

$staleHealth=false;
try{
    mrtm_reschedule_selected($pdo,$actor,[5],$future,'Stale owner',['days'=>30]);
}catch(RuntimeException $e){$staleHealth=str_contains($e->getMessage(),'current-context');}
ok_203($staleHealth,'owner-changed stale health state must be rejected.');

$GLOBALS['stale_on_sync_203']=2;
$historyBefore=(int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn();
$staleCurrent=false;
try{
    mrtm_reschedule_selected($pdo,$actor,[2],$future,'Stale exact current',['days'=>30]);
}catch(RuntimeException $e){$staleCurrent=str_contains($e->getMessage(),'exact current');}
ok_203($staleCurrent,'POST-time exact current allowlist change must be rejected.');
ok_203((int)$pdo->query("SELECT COUNT(*) FROM ticari_mutabakat_vaka_gecmisi")->fetchColumn()===$historyBefore,
  'stale rejection must not append planning history.');
$GLOBALS['stale_on_sync_203']=0;
$GLOBALS['current_203'][2]=true;

$tooMany=false;
try{mrtm_normalize_case_ids(range(1,51));}catch(RuntimeException $e){$tooMany=str_contains($e->getMessage(),'en fazla 50');}
ok_203($tooMany,'51-case intervention selection must be rejected.');

$past=(new DateTimeImmutable('today'))->modify('-1 day')->format('Y-m-d');
$pastRejected=false;
try{mrtm_reschedule_selected($pdo,$actor,[1],$past,'Geçmiş tarih',['days'=>30]);}catch(RuntimeException $e){$pastRejected=str_contains($e->getMessage(),'geçmişte olamaz');}
ok_203($pastRejected,'past next-action date must be rejected by existing planning engine.');

ok_203(mrtm_rows($pdo,['id'=>9,'role'=>'yonetici'],['days'=>30],100)===[],
  'non-Super-Admin intervention resolver must fail closed.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: follow-up health intervention allowlist, owner preservation, stale exact-current rejection and hard cap\n";
