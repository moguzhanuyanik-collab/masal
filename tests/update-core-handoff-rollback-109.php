<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check109(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-handoff-rollback-'.bin2hex(random_bytes(6));
$source=$root.'/source';
@mkdir($root.'/src',0770,true);
@mkdir($source.'/src',0770,true);
@mkdir($root.'/storage/backups',0770,true);
@mkdir($root.'/storage/updates',0770,true);

$old="<?php\n// old core\n";
$new="<?php\n// new core\n";
file_put_contents($root.'/src/updater.php',$old);
file_put_contents($source.'/src/updater.php',$new);
file_put_contents($root.'/storage/backups/onceki_surum.zip','backup');

// Marker yazımını kontrollü biçimde bozalım: hedef path'i klasör yap.
$marker=updater_core_handoff_marker_path($root);
@mkdir($marker,0770,true);

$failed=false;
try{
    prepare_updater_core_handoff(
        $root,$source,'1.1.110',str_repeat('b',40),'onceki_surum.zip'
    );
}catch(Throwable){
    $failed=true;
}
check109($failed,'Handoff marker failure did not fail closed.');
check109(file_get_contents($root.'/src/updater.php')===$old,'Old updater core was not rolled back.');
check109(hash('sha256',$old)===hash_file('sha256',$root.'/src/updater.php'),'Rollback hash mismatch.');

delete_tree($root);

echo "PASS: updater core handoff rollback\n";
