<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check105(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

check105(release_identity_is_newer(['version'=>'1.1.105','release_revision'=>1],'1.1.104',2),'New version must be newer.');
check105(release_identity_is_newer(['version'=>'1.1.104','release_revision'=>3],'1.1.104',2),'Higher same-version revision must be newer.');
check105(!release_identity_is_newer(['version'=>'1.1.104','release_revision'=>2],'1.1.104',2),'Equal revision must not be newer.');
check105(!release_identity_is_newer(['version'=>'1.1.104','release_revision'=>1],'1.1.104',2),'Older revision must not be newer.');

$next=['version'=>'1.1.105','release_revision'=>1];
check105(release_identity_should_replace_next(['version'=>'1.1.104','release_revision'=>4],$next),'Same-version hotfix must precede next semantic version.');
check105(release_identity_should_replace_next(['version'=>'1.1.105','release_revision'=>3],$next),'Higher revision of same target version must win.');
check105(!release_identity_should_replace_next(['version'=>'1.1.106','release_revision'=>1],$next),'Later semantic version must not skip earlier target.');

$root=sys_get_temp_dir().'/ilkadim-revision-'.bin2hex(random_bytes(6));
@mkdir($root,0770,true);
file_put_contents($root.'/version.json',json_encode(['version'=>'1.1.104','release_revision'=>7]));
check105(read_local_release_revision($root,'1.1.104')===7,'Local release revision was not read.');
check105(read_local_release_revision($root,'1.1.103')===0,'Revision must be ignored when version identity mismatches.');
delete_tree($root);

echo "PASS: release revision identity ordering and local revision read\n";
