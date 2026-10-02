<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/kurum_ticari_360.php';

$user=require_role('super_admin');
$pdo=db();

header('Cache-Control: no-store, max-age=0');
header('Pragma: no-cache');
header('X-Content-Type-Options: nosniff');

function k360csv_safe(string $value): string {
    $value=str_replace(["\0"],'',$value);
    if($value!=='' && preg_match('/^[=+\-@\t\r]/u',$value)===1) return "'".$value;
    return $value;
}

$institutionId=max(0,(int)($_GET['kurum_id']??0));
$institution=kt360_institution($pdo,$institutionId);
if(!$institution){
    http_response_code(404);
    header('Content-Type: text/plain; charset=UTF-8');
    echo 'Kurum bulunamadı.';
    exit;
}

try{
    $filters=kt360_statement_filters($_GET);
    $statement=kt360_statement($pdo,$institutionId,$filters,10000);
}catch(Throwable $e){
    http_response_code(400);
    header('Content-Type: text/plain; charset=UTF-8');
    echo 'Ekstre filtreleri geçersiz.';
    exit;
}

$filename='ilkadim-kurum-'.$institutionId.'-ekstre-'
    .str_replace('-','',(string)$filters['baslangic']).'-'
    .str_replace('-','',(string)$filters['bitis']).'.csv';

header('Content-Type: text/csv; charset=UTF-8');
header('Content-Disposition: attachment; filename="'.$filename.'"');

$out=fopen('php://output','wb');
if($out===false) exit;
fwrite($out,"\xEF\xBB\xBF");

$write=static function($handle,array $cells): void {
    $safe=array_map(static fn($value):string=>k360csv_safe((string)$value),$cells);
    fputcsv($handle,$safe,';','"','');
};

$write($out,['İlkAdım Kurum Ticari Hesap Ekstresi']);
$write($out,['Kurum',(string)$institution['ad']]);
$write($out,['Kurum Kodu',(string)$institution['kod']]);
$write($out,['Dönem',(string)$filters['baslangic'].' - '.(string)$filters['bitis']]);
$write($out,['Para Birimi',(string)($filters['para_birimi']?:'Tümü')]);
$write($out,['Hareket Türü',(string)$filters['hareket_turu']]);
$write($out,[]);

$write($out,['ÖZET']);
$write($out,['Para Birimi','Açılış Bakiyesi','Dönem Sözleşme Borcu','Dönem Tahsilatı','Kapanış Bakiyesi']);
foreach($statement['summary'] as $row){
    $write($out,[
        $row['para_birimi'],$row['acilis_bakiyesi'],$row['donem_borcu'],
        $row['donem_tahsilati'],$row['kapanis_bakiyesi']
    ]);
}
$write($out,[]);

$write($out,['HAREKETLER']);
$write($out,['Tarih','Tür','Referans','Açıklama','Para Birimi','Borç','Tahsilat','Bakiye','Sözleşme ID','Ödeme Yöntemi']);
foreach($statement['rows'] as $row){
    $write($out,[
        $row['hareket_tarihi'],
        $row['hareket_turu']==='sozlesme'?'Sözleşme':'Tahsilat',
        $row['referans'],
        $row['aciklama'],
        $row['para_birimi'],
        $row['borc'],
        $row['tahsilat'],
        $row['bakiye'],
        $row['sozlesme_id'],
        (string)($row['odeme_yontemi']??''),
    ]);
}
if(!empty($statement['truncated'])){
    $write($out,[]);
    $write($out,['UYARI','Ekstre 10.000 hareket ile sınırlandı. Daha dar tarih aralığı seçin.']);
}

fclose($out);
exit;
