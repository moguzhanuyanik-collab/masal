<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';
require dirname(__DIR__) . '/src/normalized.php';

function compact_profile_photo(string $photo): string {
    if ($photo === '' || !preg_match('#^data:image/(jpeg|png|webp);base64,([A-Za-z0-9+/=]+)$#',$photo,$m)) return '';
    $bytes=base64_decode($m[2],true);
    if (!is_string($bytes) || $bytes==='' || strlen($bytes)>5*1024*1024) return '';

    if (!function_exists('imagecreatefromstring') || !function_exists('imagejpeg')) {
        return strlen($photo)<=250000 ? $photo : '';
    }

    $src=@imagecreatefromstring($bytes);
    if ($src===false) return '';
    $w=imagesx($src); $h=imagesy($src);
    if ($w<1 || $h<1) { imagedestroy($src); return ''; }

    $side=min($w,$h);
    $sx=(int)floor(($w-$side)/2);
    $sy=(int)floor(($h-$side)/2);
    $dst=imagecreatetruecolor(192,192);
    if ($dst===false) { imagedestroy($src); return ''; }

    $white=imagecolorallocate($dst,255,255,255);
    imagefill($dst,0,0,$white);
    imagecopyresampled($dst,$src,0,0,$sx,$sy,192,192,$side,$side);

    ob_start();
    imagejpeg($dst,null,72);
    $jpeg=ob_get_clean();
    imagedestroy($dst); imagedestroy($src);

    return is_string($jpeg) && $jpeg!=='' ? 'data:image/jpeg;base64,'.base64_encode($jpeg) : '';
}

function remove_duplicate_photo_from_state(PDO $pdo,int $studentId): void {
    try {
        $stmt=$pdo->prepare('SELECT durum_json FROM ogrenci_durumlari WHERE ogrenci_id=? LIMIT 1');
        $stmt->execute([$studentId]);
        $raw=$stmt->fetchColumn();
        if (!is_string($raw) || $raw==='') return;
        $data=json_decode($raw,true);
        if (!is_array($data) || empty($data['photo'])) return;
        $data['photo']='';
        $json=json_encode($data,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        if (is_string($json)) {
            $pdo->prepare('UPDATE ogrenci_durumlari SET durum_json=? WHERE ogrenci_id=?')->execute([$json,$studentId]);
        }
    } catch (Throwable) {}
}

try {
    $pdo=db();
    $studentId=require_api_student();

    if($_SERVER['REQUEST_METHOD']==='GET'){
        $state=load_student_state($pdo,$studentId);
        if(normalized_table_exists($pdo,'ogrenci_ilerleme')){
            $c=$pdo->prepare('SELECT COUNT(*) FROM ogrenci_ilerleme WHERE ogrenci_id=?');$c->execute([$studentId]);
            if((int)$c->fetchColumn()===0&&(!empty($state['steps'])||!empty($state['attempts'])||!empty($state['history']))){
                $pdo->beginTransaction();
                try{normalized_sync($pdo,$studentId,$state);$pdo->commit();}catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
            }
        }
        json_response(['ok'=>true,'student_id'=>$studentId,'state'=>$state,'summary'=>normalized_summary($pdo,$studentId),'storage'=>'mysql']);
    }

    if($_SERVER['REQUEST_METHOD']!=='POST')json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    $raw=file_get_contents('php://input');
    if(!is_string($raw)||strlen($raw)>2000000)json_response(['ok'=>false,'message'=>'Geçersiz veya çok büyük istek.'],413);
    $payload=json_decode($raw,true);
    if(!is_array($payload))json_response(['ok'=>false,'message'=>'Geçersiz JSON.'],400);
    $state=isset($payload['state'])&&is_array($payload['state'])?$payload['state']:$payload;
    if(array_key_exists('photo',$state)) $state['photo']=compact_profile_photo((string)$state['photo']);

    save_student_state($pdo,$studentId,$state);
    $pdo->beginTransaction();
    try{normalized_sync($pdo,$studentId,$state);$pdo->commit();}catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
    remove_duplicate_photo_from_state($pdo,$studentId);

    json_response(['ok'=>true,'student_id'=>$studentId,'saved_at'=>date(DATE_ATOM),'summary'=>normalized_summary($pdo,$studentId),'storage'=>'mysql']);
}catch(Throwable $e){
    json_response(['ok'=>false,'message'=>'Veritabanı işlemi başarısız.','detail'=>$e->getMessage()],500);
}
