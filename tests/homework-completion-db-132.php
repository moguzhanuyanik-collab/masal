<?php
declare(strict_types=1);

function fail_132(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_132(bool $condition,string $message): void { if(!$condition) fail_132($message); }

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
}catch(Throwable $e){ fail_132('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$pdo->exec('DROP TABLE IF EXISTS ogrenci_odev_durumlari');
$pdo->exec('DROP TABLE IF EXISTS ogretmen_icerikleri');
$pdo->exec('DROP TABLE IF EXISTS ogrenciler');

$pdo->exec("CREATE TABLE ogrenciler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

$pdo->exec("CREATE TABLE ogretmen_icerikleri (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    icerik_turu VARCHAR(30) NOT NULL DEFAULT 'odev',
    hedef_turu VARCHAR(30) NOT NULL DEFAULT 'tum_ogrenciler',
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

function run_067(PDO $pdo): void {
    $path=__DIR__.'/../database/migrations/067_odev_teslim_tarihi_ve_tamamlama.sql';
    $raw=file_get_contents($path);
    if(!is_string($raw)) fail_132('067 migration okunamadı.');
    $buffer='';
    foreach(preg_split('/\\R/',$raw) as $line){
        $trim=trim($line);
        if($trim==='' || str_starts_with($trim,'--')) continue;
        $buffer.=$line."\n";
        if(str_ends_with(rtrim($line),';')){
            $sql=trim($buffer);
            $buffer='';
            if($sql!=='') $pdo->exec($sql);
        }
    }
    if(trim($buffer)!=='') $pdo->exec(trim($buffer));
}

run_067($pdo);
run_067($pdo);

$column=$pdo->query("SELECT COUNT(*) FROM information_schema.columns
    WHERE table_schema=DATABASE() AND table_name='ogretmen_icerikleri' AND column_name='teslim_tarihi'")->fetchColumn();
ok_132((int)$column===1,'teslim_tarihi kolonu tam bir kez oluşmalı.');

$index=$pdo->query("SELECT COUNT(DISTINCT index_name) FROM information_schema.statistics
    WHERE table_schema=DATABASE() AND table_name='ogretmen_icerikleri' AND index_name='ix_oi_odev_teslim'")->fetchColumn();
ok_132((int)$index===1,'ödev teslim indexi tam bir kez oluşmalı.');

$table=$pdo->query("SELECT COUNT(*) FROM information_schema.tables
    WHERE table_schema=DATABASE() AND table_name='ogrenci_odev_durumlari'")->fetchColumn();
ok_132((int)$table===1,'ödev durum tablosu oluşmalı.');

$studentType=$pdo->query("SELECT COLUMN_TYPE FROM information_schema.columns
    WHERE table_schema=DATABASE() AND table_name='ogrenci_odev_durumlari' AND column_name='ogrenci_id'")->fetchColumn();
ok_132(strtolower((string)$studentType)==='bigint(20) unsigned' || strtolower((string)$studentType)==='bigint unsigned',
    'ödev durum ogrenci_id tipi canlı öğrenci id tipiyle uyumlu olmalı; gelen: '.(string)$studentType);

$pdo->exec('INSERT INTO ogrenciler(id) VALUES (101)');
$pdo->exec("INSERT INTO ogretmen_icerikleri(id,icerik_turu,hedef_turu,teslim_tarihi,aktif)
    VALUES (501,'odev','tum_ogrenciler','2026-10-31 18:00:00',1)");
$stmt=$pdo->prepare("INSERT INTO ogrenci_odev_durumlari(icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi)
    VALUES (?,?,1,NOW())
    ON DUPLICATE KEY UPDATE tamamlandi=VALUES(tamamlandi),tamamlanma_tarihi=VALUES(tamamlanma_tarihi)");
$stmt->execute([501,101]);
$stmt->execute([501,101]);
$count=$pdo->query('SELECT COUNT(*) FROM ogrenci_odev_durumlari WHERE icerik_id=501 AND ogrenci_id=101')->fetchColumn();
ok_132((int)$count===1,'ödev durum upsert tek satır olarak kalmalı.');

$pdo->exec('DROP TABLE ogrenci_odev_durumlari');
$pdo->exec('DROP TABLE ogretmen_icerikleri');
$pdo->exec('DROP TABLE ogrenciler');

echo "PASS: homework completion migration DB integration\n";
