<?php
declare(strict_types=1);
require dirname(__DIR__).'/tools/repair-1.1.97-memberships.php';

function check113(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

check113(rescue197_member_key(3,9,'ogrenci')==='3:9:ogrenci','Member key contract failed.');

$src=file_get_contents(dirname(__DIR__).'/tools/repair-1.1.97-memberships.php');
$rollback=file_get_contents(dirname(__DIR__).'/tools/rollback-1.1.97-memberships.php');
check113(is_string($src)&&is_string($rollback),'Bridge files missing.');
foreach([
    "installed!=='1.1.97'",
    "'ogrenci_id'=>['role'=>'ogrenci','table'=>'ogrenciler']",
    "'veli_id'=>['role'=>'veli','table'=>'veliler']",
    "'ogretmen_id'=>['role'=>'ogretmen','table'=>'ogretmenler']",
    "'yonetici_id'=>['role'=>'yonetici','table'=>null]",
    'Çözümlenemeyen legacy üyelikler bulundu; hiçbir değişiklik yapılmadı',
    'RENAME TABLE kurum_kullanicilari TO',
    'kurum_kullanicilari_legacy_backup_1_1_97',
] as $needle){
    check113(strpos($src,$needle)!==false,'Missing bridge contract: '.$needle);
}
check113(strpos($rollback,"installed!=='1.1.97'")!==false,'Rollback version guard missing.');
echo "PASS: 1.1.97 legacy membership rescue bridge contract\n";
