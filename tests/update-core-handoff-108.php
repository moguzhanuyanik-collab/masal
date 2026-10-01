<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check108(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-handoff-'.bin2hex(random_bytes(6));
$source=$root.'/source';
@mkdir($root.'/src',0770,true);
@mkdir($source.'/src',0770,true);
@mkdir($root.'/storage/backups',0770,true);
file_put_contents($root.'/src/updater.php',"<?php\n// old\n");
file_put_contents($source.'/src/updater.php',"<?php\n// new\n");
file_put_contents($root.'/storage/backups/onceki_surum.zip','backup');

$commit=str_repeat('a',40);
$state=prepare_updater_core_handoff($root,$source,'1.1.109',$commit,'onceki_surum.zip');
check108(is_array($state),'Handoff state was not returned.');
check108(file_get_contents($root.'/src/updater.php')==="<?php\n// new\n",'Updater core was not activated.');
check108(is_file($root.'/storage/backups/'.(string)$state['updater_backup']),'Updater core backup missing.');
check108(read_updater_core_handoff_marker($root,$commit)!==null,'Handoff marker missing.');
check108(
    prepare_updater_core_handoff($root,$source,'1.1.109',$commit,'onceki_surum.zip')===null,
    'Identical updater core must not trigger another handoff.'
);
clear_updater_core_handoff_marker($root);
check108(!is_file(updater_core_handoff_marker_path($root)),'Handoff marker was not cleared.');
delete_tree($root);

echo "PASS: updater core pre-DB handoff\n";
