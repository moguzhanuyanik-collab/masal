<?php
declare(strict_types=1);

function fail_147(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_147(bool $condition,string $message): void { if(!$condition) fail_147($message); }

require __DIR__.'/../src/ogretmen_icerik.php';
require __DIR__.'/../src/normalized.php';

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
}catch(Throwable $e){ fail_147('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$pdo->exec("DROP TABLE IF EXISTS ogretmen_icerik_yildiz_odulleri");
$pdo->exec("CREATE TABLE ogretmen_icerik_yildiz_odulleri (
  icerik_id BIGINT UNSIGNED NOT NULL,
  ogrenci_id BIGINT UNSIGNED NOT NULL,
  yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,
  kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (icerik_id,ogrenci_id),
  KEY ix_oi_yildiz_ogrenci (ogrenci_id,kazanma_tarihi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$first=oi_record_question_reward($pdo,101,501,5);
ok_147($first===5,'ilk doğru cevap 5 yıldız ödülü üretmeli.');

$duplicate=oi_record_question_reward($pdo,101,501,5);
ok_147($duplicate===0,'aynı öğrenci ve içerik ikinci kez ödül üretmemeli.');

$secondContent=oi_record_question_reward($pdo,101,502,7);
ok_147($secondContent===7,'farklı soru kendi ödülünü üretebilmeli.');

$zero=oi_record_question_reward($pdo,101,503,0);
ok_147($zero===0,'0 yıldız ödülü kayıt oluşturmamalı.');

$clamped=oi_record_question_reward($pdo,101,504,99);
ok_147($clamped===20,'ödül 20 yıldız üst sınırında kırpılmalı.');

$count=(int)$pdo->query("SELECT COUNT(*) FROM ogretmen_icerik_yildiz_odulleri WHERE ogrenci_id=101")->fetchColumn();
ok_147($count===3,'yalnız üç benzersiz pozitif ödül kaydı bulunmalı.');

$sum=normalized_teacher_reward_stars($pdo,101);
ok_147($sum===32,'öğretmen bonus toplamı 5+7+20 = 32 olmalı.');

$other=oi_record_question_reward($pdo,202,501,4);
ok_147($other===4,'aynı içerik farklı öğrenciye ayrı ödül verebilmeli.');
ok_147(normalized_teacher_reward_stars($pdo,202)===4,'ikinci öğrencinin bonusu ayrı hesaplanmalı.');
ok_147(normalized_teacher_reward_stars($pdo,999)===0,'ödülü olmayan öğrenci 0 bonus almalı.');

$pdo->exec("DROP TABLE IF EXISTS ogretmen_icerik_yildiz_odulleri");

echo "PASS: teacher question star rewards are idempotent and summable\n";
