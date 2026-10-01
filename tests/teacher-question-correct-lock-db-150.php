<?php
declare(strict_types=1);

function fail_150(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_150(bool $condition,string $message): void { if(!$condition) fail_150($message); }

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
}catch(Throwable $e){ fail_150('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$tables=[
 'ogretmen_icerik_yildiz_odulleri','ogrenci_odev_durumlari','ogretmen_icerik_cevaplari',
 'ogretmen_icerik_hedefleri','ogretmen_icerikleri','ders_modulleri','dersler',
 'ogretmen_ogrenci','ogrenciler','kurum_kullanicilari','kurumlar','ogretmenler','kullanicilar'
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
 id BIGINT UNSIGNED NOT NULL, ad VARCHAR(190) NOT NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
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
 sira INT NOT NULL DEFAULT 0, aktif TINYINT(1) NOT NULL DEFAULT 1, PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerikleri (
 id BIGINT UNSIGNED NOT NULL, kurum_id BIGINT UNSIGNED NOT NULL, ogretmen_id BIGINT UNSIGNED NOT NULL,
 ders_id BIGINT UNSIGNED NOT NULL, ders_modulu_id BIGINT UNSIGNED NULL, konu_basligi VARCHAR(190) NULL,
 icerik_turu VARCHAR(30) NOT NULL, baslik VARCHAR(190) NOT NULL, icerik_metni TEXT NULL, soru TEXT NULL,
 secenekler_json LONGTEXT NULL, dogru_cevap_indeksi INT NULL, aciklama TEXT NULL, yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,
 hedef_turu VARCHAR(30) NOT NULL, teslim_tarihi DATETIME NULL, aktif TINYINT(1) NOT NULL DEFAULT 1,
 olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_hedefleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_cevaplari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 secilen_cevap_indeksi INT NULL, dogru TINYINT(1) NOT NULL DEFAULT 0,
 deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,
 cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogrenci_odev_durumlari (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL, tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
 tamamlanma_tarihi DATETIME NULL, PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE ogretmen_icerik_yildiz_odulleri (
 icerik_id BIGINT UNSIGNED NOT NULL, ogrenci_id BIGINT UNSIGNED NOT NULL,
 yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0, kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY(icerik_id,ogrenci_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("INSERT INTO kullanicilar(id,ad_soyad,aktif) VALUES (1001,'Ada',1),(3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO ogretmenler(id,kullanici_id,ad_soyad,aktif) VALUES (301,3001,'Öğretmen A',1)");
$pdo->exec("INSERT INTO kurumlar(id,ad,aktif) VALUES (10,'Okul A',1)");
$pdo->exec("INSERT INTO ogrenciler(id,kullanici_id,ad,email,aktif) VALUES (101,1001,'Ada','ada@example.com',1)");
$pdo->exec("INSERT INTO kurum_kullanicilari(kurum_id,kullanici_id,kurum_rolu,aktif) VALUES
 (10,1001,'ogrenci',1),(10,3001,'ogretmen',1)");
$pdo->exec("INSERT INTO ogretmen_ogrenci(ogretmen_id,ogrenci_id,kurum_id) VALUES (301,101,10)");
$pdo->exec("INSERT INTO dersler(id,kod,ad,emoji,sira,aktif) VALUES (1,'mat','Matematik','➗',1,1)");
$pdo->exec("INSERT INTO ders_modulleri(id,ders_id,baslik,sira,aktif) VALUES (11,1,'Toplama',1,1)");
$pdo->exec("INSERT INTO ogretmen_icerikleri
 (id,kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,soru,
  secenekler_json,dogru_cevap_indeksi,aciklama,yildiz_degeri,hedef_turu,aktif)
 VALUES
 (701,10,301,1,11,'Toplama','soru','Soru 1','2+2?','[\"3\",\"4\",\"5\"]',1,'Dört',5,'tum_ogrenciler',1)");

$stars=0;
$locked=false;
$wrong=oi_answer_question($pdo,101,701,0,$stars,$locked);
ok_150($wrong===false,'ilk yanlış cevap false dönmeli.');
ok_150($stars===0,'yanlış cevap yıldız vermemeli.');
ok_150($locked===false,'ilk yanlış cevap kilitli olmamalı.');

$row=$pdo->query("SELECT secilen_cevap_indeksi,dogru,deneme_sayisi FROM ogretmen_icerik_cevaplari WHERE icerik_id=701 AND ogrenci_id=101")->fetch();
ok_150((int)$row['secilen_cevap_indeksi']===0,'ilk seçilen yanlış cevap kaydedilmeli.');
ok_150((int)$row['dogru']===0,'ilk cevap yanlış görünmeli.');
ok_150((int)$row['deneme_sayisi']===1,'ilk deneme sayısı 1 olmalı.');

$stars=0;
$locked=false;
$correct=oi_answer_question($pdo,101,701,1,$stars,$locked);
ok_150($correct===true,'ikinci doğru cevap true dönmeli.');
ok_150($stars===5,'ilk doğru cevap 5 yıldız vermeli.');
ok_150($locked===false,'ilk doğru cevap önceden kilitli sayılmamalı.');

$row=$pdo->query("SELECT secilen_cevap_indeksi,dogru,deneme_sayisi FROM ogretmen_icerik_cevaplari WHERE icerik_id=701 AND ogrenci_id=101")->fetch();
ok_150((int)$row['secilen_cevap_indeksi']===1,'doğru seçenek kaydedilmeli.');
ok_150((int)$row['dogru']===1,'cevap doğru olarak kilitlenmeli.');
ok_150((int)$row['deneme_sayisi']===2,'doğruya ulaşınca deneme sayısı 2 olmalı.');
$rewardCount=(int)$pdo->query("SELECT COUNT(*) FROM ogretmen_icerik_yildiz_odulleri WHERE icerik_id=701 AND ogrenci_id=101")->fetchColumn();
ok_150($rewardCount===1,'ilk doğru cevap tek yıldız kaydı oluşturmalı.');

$stars=0;
$locked=false;
$afterCorrect=oi_answer_question($pdo,101,701,0,$stars,$locked);
ok_150($afterCorrect===true,'doğru tamamlanmış soru tekrar çağrıldığında doğru durumunu korumalı.');
ok_150($stars===0,'kilitli soruda ikinci yıldız verilmemeli.');
ok_150($locked===true,'doğru tamamlanmış soru alreadyCompleted döndürmeli.');

$row=$pdo->query("SELECT secilen_cevap_indeksi,dogru,deneme_sayisi FROM ogretmen_icerik_cevaplari WHERE icerik_id=701 AND ogrenci_id=101")->fetch();
ok_150((int)$row['secilen_cevap_indeksi']===1,'kilitli soruda cevap yanlış seçeneğe dönmemeli.');
ok_150((int)$row['dogru']===1,'kilitli soruda doğru durumu bozulmamalı.');
ok_150((int)$row['deneme_sayisi']===2,'kilitli soruda deneme sayısı artmamalı.');
$rewardCount2=(int)$pdo->query("SELECT COUNT(*) FROM ogretmen_icerik_yildiz_odulleri WHERE icerik_id=701 AND ogrenci_id=101")->fetchColumn();
ok_150($rewardCount2===1,'kilitli soruda ödül kaydı çoğalmamalı.');

foreach($tables as $table)$pdo->exec("DROP TABLE IF EXISTS {$table}");

echo "PASS: teacher question correct state is final and reward remains idempotent\n";
