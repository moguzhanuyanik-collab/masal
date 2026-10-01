<?php
declare(strict_types=1);

function fail_168(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_168(bool $condition,string $message): void { if(!$condition) fail_168($message); }

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
}catch(Throwable $e){ fail_168('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

function auth_runtime_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $stmt->execute([$table]);
    $ok=(int)$stmt->fetchColumn()>0;
    $stmt->closeCursor();
    return $ok;
}
function auth_effective_role(?array $user): ?string { return (string)($user['role']??$user['ana_rol']??''); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/yasal_onay.php';

$tables=['yasal_belge_onaylari','yasal_belgeler','kullanici_rolleri','kullanicilar'];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar(
    id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    ad_soyad VARCHAR(190) NOT NULL,
    ana_rol VARCHAR(30) NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

$pdo->exec("CREATE TABLE kullanici_rolleri(
    kullanici_id BIGINT UNSIGNED NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY(kullanici_id,rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE yasal_belgeler(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    belge_turu VARCHAR(40) NOT NULL,
    surum VARCHAR(40) NOT NULL,
    baslik VARCHAR(190) NOT NULL,
    icerik MEDIUMTEXT NOT NULL,
    icerik_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    zorunlu TINYINT(1) NOT NULL DEFAULT 1,
    hedef_roller VARCHAR(150) NOT NULL,
    durum VARCHAR(20) NOT NULL DEFAULT 'taslak',
    yururluk_tarihi DATE NULL,
    yayin_tarihi DATETIME NULL,
    arsiv_tarihi DATETIME NULL,
    olusturan_kullanici_id BIGINT UNSIGNED NOT NULL,
    olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_yasal_belge_tur_surum(belge_turu,surum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

$pdo->exec("CREATE TABLE yasal_belge_onaylari(
    belge_id BIGINT UNSIGNED NOT NULL,
    kullanici_id BIGINT UNSIGNED NOT NULL,
    onay_rolu VARCHAR(30) NOT NULL,
    belge_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    onay_ip_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,
    user_agent_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,
    onay_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(belge_id,kullanici_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,email,ad_soyad,ana_rol,aktif) VALUES
    (1,'admin@example.com','Süper Admin','super_admin',1),
    (2,'veli@example.com','A Veli','veli',1),
    (3,'ogretmen@example.com','A Öğretmen','ogretmen',1),
    (4,'yonetici@example.com','A Yönetici','yonetici',1),
    (5,'ogrenci@example.com','A Öğrenci','ogrenci',1)");
$pdo->exec("INSERT INTO kullanici_rolleri(kullanici_id,rol) VALUES
    (1,'super_admin'),(2,'veli'),(3,'ogretmen'),(4,'yonetici'),(5,'ogrenci')");

$admin=['id'=>1,'role'=>'super_admin'];
$parent=['id'=>2,'role'=>'veli'];
$teacher=['id'=>3,'role'=>'ogretmen'];
$manager=['id'=>4,'role'=>'yonetici'];

ok_168(yl_pending_documents($pdo,$parent)===[],'fresh install with no published docs must not block users.');

$text1=str_repeat('Bu metin hukuk danışmanı tarafından kontrol edilmiş örnek test içeriğidir. ',2);
$id1=yl_create_draft($pdo,$admin,[
    'belge_turu'=>'gizlilik',
    'surum'=>'1.0',
    'baslik'=>'Gizlilik Politikası Test Sürümü',
    'icerik'=>$text1,
    'zorunlu'=>'1',
    'hedef_roller'=>['veli','ogretmen'],
    'yururluk_tarihi'=>'',
]);
ok_168($id1>0,'legal draft should be created.');
ok_168(yl_pending_documents($pdo,$parent)===[],'draft must not create mandatory consent.');

yl_update_draft($pdo,$admin,$id1,[
    'surum'=>'1.0',
    'baslik'=>'Gizlilik Politikası Test Sürümü',
    'icerik'=>$text1.' Güncellenmiş taslak.',
    'zorunlu'=>'1',
    'hedef_roller'=>['veli','ogretmen'],
    'yururluk_tarihi'=>'',
]);

yl_publish($pdo,$admin,$id1);
$doc1=yl_document($pdo,$id1);
ok_168((string)$doc1['durum']==='yayinda','draft should publish.');
ok_168(count(yl_pending_documents($pdo,$parent))===1,'target parent must have pending consent.');
ok_168(count(yl_pending_documents($pdo,$teacher))===1,'target teacher must have pending consent.');
ok_168(yl_pending_documents($pdo,$manager)===[],'non-target manager must not be blocked.');

$missingFailed=false;
try{yl_accept($pdo,$parent,[]);}catch(RuntimeException){$missingFailed=true;}
ok_168($missingFailed,'all pending documents must be explicitly checked.');

$_SERVER['REMOTE_ADDR']='203.0.113.44';
$_SERVER['HTTP_USER_AGENT']='IlkAdim-Test-Agent/1.0';
$count=yl_accept($pdo,$parent,[$id1]);
ok_168($count===1,'parent should record one consent.');
ok_168(yl_pending_documents($pdo,$parent)===[],'accepted exact document hash should clear pending consent.');

$evidence=$pdo->query("SELECT belge_hash,onay_ip_hash,user_agent_hash FROM yasal_belge_onaylari WHERE belge_id={$id1} AND kullanici_id=2")->fetch(PDO::FETCH_ASSOC);
ok_168((string)$evidence['belge_hash']===(string)$doc1['icerik_hash'],'consent evidence must preserve exact document hash.');
ok_168((string)$evidence['onay_ip_hash']===hash('sha256','203.0.113.44'),'IP evidence must be hashed.');
ok_168((string)$evidence['onay_ip_hash']!=='203.0.113.44','raw IP must not be stored.');
ok_168((string)$evidence['user_agent_hash']===hash('sha256','IlkAdim-Test-Agent/1.0'),'user agent evidence must be hashed.');

$publishedEditBlocked=false;
try{
    yl_update_draft($pdo,$admin,$id1,[
        'surum'=>'1.0','baslik'=>'Değişmemeli','icerik'=>$text1,
        'zorunlu'=>'1','hedef_roller'=>['veli'],'yururluk_tarihi'=>''
    ]);
}catch(RuntimeException){$publishedEditBlocked=true;}
ok_168($publishedEditBlocked,'published document must be immutable.');

$pdo->exec("UPDATE yasal_belge_onaylari SET belge_hash=REPEAT('0',64) WHERE belge_id={$id1} AND kullanici_id=2");
ok_168(count(yl_pending_documents($pdo,$parent))===1,'consent with mismatched document hash must not satisfy requirement.');
$pdo->prepare("UPDATE yasal_belge_onaylari SET belge_hash=? WHERE belge_id=? AND kullanici_id=2")->execute([(string)$doc1['icerik_hash'],$id1]);

$text2=str_repeat('Yeni sürüm için hukuk danışmanı kontrollü test metni. ',3);
$id2=yl_create_draft($pdo,$admin,[
    'belge_turu'=>'gizlilik',
    'surum'=>'2.0',
    'baslik'=>'Gizlilik Politikası Yeni Sürüm',
    'icerik'=>$text2,
    'zorunlu'=>'1',
    'hedef_roller'=>['veli','ogretmen'],
    'yururluk_tarihi'=>'',
]);
yl_publish($pdo,$admin,$id2);
$old=yl_document($pdo,$id1);
ok_168((string)$old['durum']==='arsiv','new published version must archive previous version of same type.');
ok_168(count(yl_pending_documents($pdo,$parent))===1,'new document version must require fresh parent consent.');

yl_accept($pdo,$parent,[$id2]);
$history=yl_user_acceptance_rows($pdo,2);
ok_168(count($history)===2,'consent history must retain prior version after re-consent.');

$report=yl_admin_report($pdo);
ok_168(count($report)===1 && (int)$report[0]['onaylayan']===1,'published-version report should count accepted target users.');
ok_168((int)$report[0]['bekleyen']===1,'published-version report should count pending target teacher.');

$detail=yl_admin_user_report($pdo,$id2);
ok_168(count($detail)===2,'detailed report should include both target active users.');
$pendingUsers=array_values(array_filter($detail,static fn(array $r):bool=>(int)$r['onayli']===0));
ok_168(count($pendingUsers)===1 && (int)$pendingUsers[0]['id']===3,'teacher should remain visible as pending in detailed report.');

$futureId=yl_create_draft($pdo,$admin,[
    'belge_turu'=>'kullanim_kosullari',
    'surum'=>'1.0',
    'baslik'=>'Gelecek Tarihli Koşullar',
    'icerik'=>str_repeat('Gelecek tarihli kontrollü kullanım koşulu test metni. ',3),
    'zorunlu'=>'1',
    'hedef_roller'=>['veli'],
    'yururluk_tarihi'=>(new DateTimeImmutable('+1 day'))->format('Y-m-d'),
]);
$futureBlocked=false;
try{yl_publish($pdo,$admin,$futureId);}catch(RuntimeException){$futureBlocked=true;}
ok_168($futureBlocked,'future-effective draft must not publish early.');
ok_168((string)yl_document($pdo,$futureId)['durum']==='taslak','blocked future publication must remain draft.');

yl_archive($pdo,$admin,$id2);
ok_168(yl_pending_documents($pdo,$parent)===[],'archiving current published document must remove active requirement without deleting consent history.');
ok_168((int)$pdo->query('SELECT COUNT(*) FROM yasal_belge_onaylari WHERE kullanici_id=2')->fetchColumn()===2,
    'archiving must preserve all historical consent rows.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: legal document versioning, explicit consent, exact-hash evidence, re-consent and immutable history\n";
