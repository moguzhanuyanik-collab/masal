<?php
declare(strict_types=1);

function fail_209(string $message): never { fwrite(STDERR,"FAIL: {$message}\n"); exit(1); }
function ok_209(bool $condition,string $message): void { if(!$condition) fail_209($message); }

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
}catch(Throwable $e){ fail_209('MariaDB bağlantısı kurulamadı: '.$e->getMessage()); }

$pdo->exec('DROP TABLE IF EXISTS etkinlik_ilerleme');
$pdo->exec("CREATE TABLE IF NOT EXISTS ogrenciler (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$pdo->exec("CREATE TABLE IF NOT EXISTS oyun_tamamlamalari (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ogrenci_id BIGINT UNSIGNED NOT NULL,
    oyun_kodu VARCHAR(50) NOT NULL,
    tamamlanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY uk_oyun_tamamlama_test (ogrenci_id,oyun_kodu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

function run_092(PDO $pdo): void {
    $path=__DIR__.'/../database/migrations/092_ogrenci_etkinlik_ilerleme.sql';
    $raw=file_get_contents($path);
    if(!is_string($raw)) fail_209('092 migration okunamadı.');
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

run_092($pdo);
run_092($pdo);

$table=(int)$pdo->query("SELECT COUNT(*) FROM information_schema.tables
    WHERE table_schema=DATABASE() AND table_name='etkinlik_ilerleme'")->fetchColumn();
ok_209($table===1,'etkinlik_ilerleme tablosu oluşmalı.');

$columns=$pdo->query("SELECT column_name FROM information_schema.columns
    WHERE table_schema=DATABASE() AND table_name='etkinlik_ilerleme'")->fetchAll(PDO::FETCH_COLUMN);
foreach(['ogrenci_id','oyun_kodu','sonraki_soru_indeksi','tamamlandi','guncellenme_tarihi'] as $column){
    ok_209(in_array($column,$columns,true),'etkinlik_ilerleme kolonu eksik: '.$column);
}

$index=$pdo->query("SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index SEPARATOR ',')
    FROM information_schema.statistics
    WHERE table_schema=DATABASE() AND table_name='etkinlik_ilerleme' AND index_name='uk_etkinlik_ilerleme'")->fetchColumn();
ok_209((string)$index==='ogrenci_id,oyun_kodu','etkinlik ilerleme unique anahtarı öğrenci+oyun olmalı.');

$fk=(int)$pdo->query("SELECT COUNT(*) FROM information_schema.referential_constraints
    WHERE constraint_schema=DATABASE()
      AND table_name='etkinlik_ilerleme'
      AND constraint_name='fk_etkinlik_ilerleme_ogrenci'
      AND delete_rule='CASCADE'")->fetchColumn();
ok_209($fk===1,'etkinlik ilerleme öğrenci FK CASCADE olmalı.');

echo "PASS: student activity progress DB schema\n";
