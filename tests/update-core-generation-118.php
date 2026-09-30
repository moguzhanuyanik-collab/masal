<?php
declare(strict_types=1);

require dirname(__DIR__).'/src/updater.php';

function check118(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

check118(ILKADIM_UPDATER_CORE_GENERATION===118,'Updater generation 118 değil.');
check118(updater_core_generation_from_file(dirname(__DIR__).'/src/updater.php')===118,'Canlı updater generation okunamadı.');

$root=sys_get_temp_dir().'/ilkadim-core-118-'.bin2hex(random_bytes(5));
$source=$root.'/source';
@mkdir($root.'/src',0770,true);
@mkdir($source.'/src',0770,true);

$live="<?php\ndeclare(strict_types=1);\nconst ILKADIM_UPDATER_CORE_GENERATION = 118;\n// live-newer\n";
$legacy="<?php\ndeclare(strict_types=1);\n// legacy-core\n";
file_put_contents($root.'/src/updater.php',$live);
file_put_contents($source.'/src/updater.php',$legacy);

check118(preserve_newer_live_updater_in_staging($root,$source)===true,'Yeni canlı updater staging alanında korunmadı.');
check118(file_get_contents($source.'/src/updater.php')===$live,'Staging updater canlı yeni çekirdekle eşleşmiyor.');

$newer="<?php\ndeclare(strict_types=1);\nconst ILKADIM_UPDATER_CORE_GENERATION = 119;\n// source-newer\n";
file_put_contents($source.'/src/updater.php',$newer);
check118(preserve_newer_live_updater_in_staging($root,$source)===false,'Daha yeni paket updaterı yanlışlıkla ezildi.');
check118(file_get_contents($source.'/src/updater.php')===$newer,'Daha yeni paket updater içeriği değişti.');

@unlink($source.'/src/updater.php');
@rmdir($source.'/src');
@rmdir($source);
@unlink($root.'/src/updater.php');
@rmdir($root.'/src');
@rmdir($root);

echo "PASS: updater core generation preservation 118\n";
