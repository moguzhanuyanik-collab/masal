<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check102(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-update-safety-'.bin2hex(random_bytes(6));
@mkdir($root,0770,true);

$okZip=$root.'/ok.zip';
$zip=new ZipArchive();
check102($zip->open($okZip,ZipArchive::CREATE|ZipArchive::OVERWRITE)===true,'Cannot create safe ZIP.');
for($i=0;$i<101;$i++) $zip->addFromString('package/f'.$i.'.txt','ok');
$zip->close();

$zip=new ZipArchive();
check102($zip->open($okZip)===true,'Cannot open safe ZIP.');
$stats=assert_update_zip_safe($zip,[
    'max_package_entries'=>200,
    'max_package_uncompressed_bytes'=>16*1024*1024,
    'max_package_file_bytes'=>1024*1024,
    'max_package_compression_ratio'=>1000,
]);
check102($stats['entries']===101,'ZIP entry count mismatch.');
check102($stats['uncompressed_bytes']>0,'ZIP uncompressed size missing.');
$zip->close();

$tooMany=false;
$zip=new ZipArchive();
check102($zip->open($okZip)===true,'Cannot reopen safe ZIP.');
try{
    assert_update_zip_safe($zip,[
        'max_package_entries'=>100,
        'max_package_uncompressed_bytes'=>16*1024*1024,
        'max_package_file_bytes'=>1024*1024,
        'max_package_compression_ratio'=>1000,
    ]);
}catch(RuntimeException $e){
    $tooMany=str_contains($e->getMessage(),'dosya sayısı');
}
$zip->close();
check102($tooMany,'Entry limit did not reject ZIP.');

$largeZip=$root.'/large.zip';
$zip=new ZipArchive();
check102($zip->open($largeZip,ZipArchive::CREATE|ZipArchive::OVERWRITE)===true,'Cannot create large-file ZIP.');
$zip->addFromString('package/large.txt',str_repeat('B',2*1024*1024));
$zip->close();

$tooLarge=false;
$zip=new ZipArchive();
check102($zip->open($largeZip)===true,'Cannot open large-file ZIP.');
try{
    assert_update_zip_safe($zip,[
        'max_package_entries'=>100,
        'max_package_uncompressed_bytes'=>16*1024*1024,
        'max_package_file_bytes'=>1024*1024,
        'max_package_compression_ratio'=>1000,
    ]);
}catch(RuntimeException $e){
    $tooLarge=str_contains($e->getMessage(),'tek dosya boyutu');
}
$zip->close();
check102($tooLarge,'Single-file limit did not reject ZIP.');

delete_tree($root);
echo "PASS: update package entry, uncompressed and single-file limits\n";
