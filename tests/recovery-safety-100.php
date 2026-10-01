<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check100(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-recovery-'.bin2hex(random_bytes(6));
foreach([
    'src',
    'config',
    'storage/backups',
    'storage/updates',
    '.git',
] as $dir){
    @mkdir($root.'/'.$dir,0770,true);
}
file_put_contents($root.'/version.json',"{\"version\":\"9.9.9\"}\n");
file_put_contents($root.'/src/updater.php',"<?php\n");
file_put_contents($root.'/src/auth.php',"<?php\n");
file_put_contents($root.'/login.php',"<?php\n");
file_put_contents($root.'/index.php',"<?php\n");
file_put_contents($root.'/config/local.php',"<?php return ['secret'=>'x'];\n");
file_put_contents($root.'/.env',"SECRET=1\n");
file_put_contents($root.'/.git/config',"[remote \"origin\"]\nurl=x\n");
file_put_contents($root.'/normal.txt',str_repeat('A',1024));

$zip=$root.'/storage/backups/test.zip';
create_project_backup($root,$zip);
$meta=validate_project_backup($zip);
check100($meta['bytes']>128,'Validated ZIP must have size.');
check100(strlen((string)$meta['sha256'])===64,'ZIP SHA-256 missing.');

$za=new ZipArchive();
check100($za->open($zip)===true,'ZIP cannot be reopened.');
check100($za->locateName('config/local.php')===false,'local.php leaked into ZIP.');
check100($za->locateName('.env')===false,'.env leaked into ZIP.');
check100($za->locateName('.git/config')===false,'.git config leaked into ZIP.');
check100($za->locateName('normal.txt')!==false,'Normal file missing from ZIP.');
$za->close();

$state=[
    'from_version'=>'1.1.99',
    'to_version'=>'1.1.100',
    'target_commit'=>str_repeat('a',40),
    'status'=>'ready_before_mutation',
    'application_backup'=>backup_artifact_metadata($root,'test.zip'),
    'database_backup'=>null,
    'pending_migrations'=>[],
    'manual_restore_only'=>true,
];
$name=write_recovery_manifest($root,$state);
check100($name==='recovery.json','Unexpected recovery manifest name.');
$decoded=json_decode((string)file_get_contents($root.'/storage/backups/recovery.json'),true);
check100(is_array($decoded),'Recovery manifest is invalid JSON.');
check100(($decoded['status']??'')==='ready_before_mutation','Recovery status mismatch.');
check100(($decoded['application_backup']['sha256']??'')===$meta['sha256'],'Recovery hash mismatch.');
check100(($decoded['manual_restore_only']??false)===true,'Recovery must remain manual restore only.');

delete_tree($root);
echo "PASS: validated app backup exclusions, SHA-256 metadata and recovery manifest\n";
