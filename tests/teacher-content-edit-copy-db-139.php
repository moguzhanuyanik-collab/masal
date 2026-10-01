<?php
declare(strict_types=1);

function fail_139(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_139(bool $condition,string $message): void { if(!$condition) fail_139($message); }
function auth_audit(PDO $pdo,?int $actorId,?int $targetId,string $action,string $detail=''): void {}

require __DIR__.'/../src/ogretmen_icerik.php';

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
}catch(Throwable $e){ fail_139('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
    'ogrenci_odev_durumlari','ogretmen_icerik_cevaplari','ogretmen_icerik_hedefleri',
    'ogretmen_icerikleri','ders_modulleri','dersler','ogretmen_ogrenci',
    'ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
];
foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

$pdo->exec("CREATE TABLE kullanicilar (
 id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmenler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad_soyad VARCHAR(190) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurumlar (
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, kod VARCHAR(60) NULL, tur VARCHAR(30) NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE kurum_kullanicilari (
 kurum_id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, kurum_rolu VARCHAR(30) NOT NULL,
 aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(kurum_id,kullanici_id,kurum_rolu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenciler (
 id BIGINT UNSIGNED NOT NULL, kullanici_id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL,
 email VARCHAR(190) NULL, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_ogrenci (
 ogretmen_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(ogretmen_id,ogrenci_id,kurum_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE dersler (
 id BIGINT UNSIGNED NOT NULL, kod VARCHAR(50) NOT NULL, ad VARCHAR(190) NOT NULL, emoji VARCHAR(20) NULL,
 sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ders_modulleri (
 id BIGINT UNSIGNED NOT NULL, ders_id BIGINT UNSIGNED NOT NULL, baslik VARCHAR(190) NOT NULL,
 alt_baslik VARCHAR(190) NULL, sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, ders_modulu_id BIGINT UNSIGNED NULL, konu_basligi VARCHAR(190) NULL,
 icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL, icerik_metni TEXT NULL, soru TEXT NULL,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL, yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,
 hedef_turu VARCHAR(30) NOT NULL, teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 secilen_cevap_indeksi INT NULL, dogru TINYINT(1) NOT NULL DEFAULT 0, deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES
 (3001,'Öğretmen A',1),(3002,'Öğretmen B',1),(1001,'Ada',1),(1002,'Bora',1),(2001,'Cem',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES
 (301,3001,'Öğretmen A',1),(302,3002,'Öğretmen B',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,kod,tur,aktif) VALUES
 (10,'Okul A','A','okul',1),(20,'Okul B','B','okul',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,3001,'ogretmen',1),(20,3002,'ogretmen',1),
 (10,1001,'ogrenci',1),(10,1002,'ogrenci',1),(20,2001,'ogrenci',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES
 (101,1001,'Ada','ada@example.com',1),(102,1002,'Bora','bora@example.com',1),(201,2001,'Cem','cem@example.com',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES
 (301,101,10),(301,102,10),(302,201,20)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1),(2,'tur','Türkçe','📘',2,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,alt_baslik,sira,aktif) VALUES
 (11,1,'Toplama',NULL,1,1),(21,2,'Okuma',NULL,1,1)");

$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,soru,secenekler_json,dogru_cevap_indeksi,aciklama,yildiz_degeri,hedef_turu,aktif)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Eski Soru','2+2?', '[\"3\",\"4\",\"5\"]',1,'Dört',2,'secili_ogrenciler',1),
 (801,20,302,2,21,'Okuma','soru','Başka Öğretmen','Metin?', '[\"A\",\"B\"]',0,NULL,0,'tum_ogrenciler',1)");
$pdo->exec("INSERT INTO ogretmen_icerik_hedefleri(icerik_id,ogrenci_id) VALUES (701,101)");

$actor=['id'=>3001];
oi_update_content($pdo,$actor,701,[
    'kurum_id'=>20,
    'ders_id'=>2,
    'ders_modulu_id'=>21,
    'konu_basligi'=>'Okuma',
    'icerik_turu'=>'soru',
    'baslik'=>'Yeni Soru',
    'soru'=>'Hangisi doğru?',
    'secenekler'=>['Bir','İki','Üç'],
    'dogru_cevap_indeksi'=>1,
    'aciklama'=>'İkinci seçenek',
], [102]);

$row=$pdo->query('SELECT kurum_id,ders_id,ders_modulu_id,baslik,soru,secenekler_json,dogru_cevap_indeksi,hedef_turu FROM ogretmen_icerikleri WHERE id=701')->fetch();
ok_139((int)$row['kurum_id']===10,'update içerik kurumunu değiştirmemeli.');
ok_139((int)$row['ders_id']===2 && (int)$row['ders_modulu_id']===21,'ders ve konu güncellenmeli.');
ok_139((string)$row['baslik']==='Yeni Soru','başlık güncellenmeli.');
ok_139((string)$row['soru']==='Hangisi doğru?','soru güncellenmeli.');
ok_139((int)$row['dogru_cevap_indeksi']===1,'doğru cevap güncellenmeli.');
ok_139((string)$row['hedef_turu']==='secili_ogrenciler','hedef türü seçili öğrenciler olmalı.');
$targets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id=701')->fetchAll(PDO::FETCH_COLUMN);
ok_139(array_map('intval',$targets)===[102],'hedef öğrenci güvenli biçimde değiştirilmiş olmalı.');

$pdo->exec("INSERT INTO ogretmen_icerik_cevaplari(icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi)
 VALUES (701,102,1,1,1)");

$blocked=false;
try{
    oi_update_content($pdo,$actor,701,[
        'ders_id'=>1,'ders_modulu_id'=>11,'konu_basligi'=>'Toplama','icerik_turu'=>'soru',
        'baslik'=>'Geçmişi Boz','soru'=>'Yeni?', 'secenekler'=>['A','B'],'dogru_cevap_indeksi'=>0
    ],[102]);
}catch(RuntimeException $e){
    $blocked=str_contains($e->getMessage(),'Geçmiş veriyi korumak');
}
ok_139($blocked,'öğrenci yanıtı olan içerik güncellenememeli.');
$title=(string)$pdo->query('SELECT baslik FROM ogretmen_icerikleri WHERE id=701')->fetchColumn();
ok_139($title==='Yeni Soru','engellenen update mevcut içeriği değiştirmemeli.');

$copyId=oi_duplicate_content($pdo,$actor,701);
ok_139($copyId>701,'kopya yeni içerik kimliği almalı.');
$copy=$pdo->query('SELECT kurum_id,ogretmen_id,baslik,aktif,hedef_turu FROM ogretmen_icerikleri WHERE id='.(int)$copyId)->fetch();
ok_139((int)$copy['kurum_id']===10 && (int)$copy['ogretmen_id']===301,'kopya aynı öğretmen ve kurumda olmalı.');
ok_139((int)$copy['aktif']===0,'kopya pasif taslak olmalı.');
ok_139(str_contains((string)$copy['baslik'],'(Kopya)'),'kopya başlığı ayırt edilebilir olmalı.');

$copyTargets=$pdo->query('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id='.(int)$copyId)->fetchAll(PDO::FETCH_COLUMN);
ok_139(array_map('intval',$copyTargets)===[102],'hedef öğrenciler kopyalanmalı.');
$copyAnswers=(int)$pdo->query('SELECT COUNT(*) FROM ogretmen_icerik_cevaplari WHERE icerik_id='.(int)$copyId)->fetchColumn();
$copyHomework=(int)$pdo->query('SELECT COUNT(*) FROM ogrenci_odev_durumlari WHERE icerik_id='.(int)$copyId)->fetchColumn();
ok_139($copyAnswers===0,'öğrenci cevapları kopyalanmamalı.');
ok_139($copyHomework===0,'ödev durumları kopyalanmamalı.');

$otherActor=['id'=>3002];
ok_139(oi_teacher_content_for_edit($pdo,$otherActor,701)===null,'başka öğretmen içeriği edit için okunamamalı.');

$invalidTarget=false;
try{
    oi_update_content($pdo,$actor,$copyId,[
        'ders_id'=>1,'ders_modulu_id'=>11,'konu_basligi'=>'Toplama','icerik_turu'=>'soru',
        'baslik'=>'Kopya Düzenle','soru'=>'Soru?', 'secenekler'=>['A','B'],'dogru_cevap_indeksi'=>0
    ],[201]);
}catch(RuntimeException $e){
    $invalidTarget=str_contains($e->getMessage(),'bu kurumda sana bağlı değil');
}
ok_139($invalidTarget,'başka kurum öğrencisi hedef seçilememeli.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher content safe edit/copy DB integration\n";
