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

function progress_string_union(array ...$lists): array {
    $out=[];
    $seen=[];
    foreach($lists as $list){
        foreach($list as $value){
            $key=trim((string)$value);
            if($key===''||isset($seen[$key])) continue;
            $seen[$key]=true;
            $out[]=$key;
        }
    }
    return $out;
}

function progress_record_key(mixed $row,string $type): string {
    if(!is_array($row)) return '';
    if($type==='attempt'){
        return json_encode([
            (string)($row['lesson']??''),
            (string)($row['index']??''),
            $row['selected']??null,
            ($row['correct']??false)===true,
            (int)($row['at']??0),
        ],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)?:'';
    }
    if($type==='history'){
        return implode('|',[
            (string)($row['type']??''),
            (string)($row['id']??''),
            (string)($row['title']??''),
            (string)($row['at']??''),
        ]);
    }
    if($type==='reading'){
        return implode('|',[(string)($row['id']??''),(string)($row['at']??'')]);
    }
    return json_encode($row,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)?:'';
}

function progress_record_union(array $incoming,array $persisted,string $type): array {
    $out=[];
    $seen=[];
    foreach([$persisted,$incoming] as $list){
        foreach($list as $row){
            $key=progress_record_key($row,$type);
            if($key===''||isset($seen[$key])) continue;
            $seen[$key]=true;
            $out[]=$row;
        }
    }
    return $out;
}

function persisted_student_progress(PDO $pdo,int $studentId): array {
    $persisted=[];
    try{
        $loaded=load_student_state($pdo,$studentId);
        if(is_array($loaded)) $persisted=$loaded;
    }catch(Throwable $e){
        error_log('[IlkAdim][state-merge] saved_state_unavailable '.$e->getMessage());
    }

    $steps=(array)($persisted['steps']??[]);
    $games=(array)($persisted['games']??[]);
    $attempts=(array)($persisted['attempts']??[]);

    try{
        if(normalized_table_exists($pdo,'ogrenci_ilerleme')){
            $grade=normalized_student_grade($pdo,$studentId);
            $hasGrade=normalized_column_exists($pdo,'ogrenci_ilerleme','sinif_seviyesi');
            $sql=$hasGrade
                ? 'SELECT ders_kodu,modul_indeksi FROM ogrenci_ilerleme WHERE ogrenci_id=? AND sinif_seviyesi=? AND tamamlandi=1'
                : 'SELECT ders_kodu,modul_indeksi FROM ogrenci_ilerleme WHERE ogrenci_id=? AND tamamlandi=1';
            $stmt=$pdo->prepare($sql);
            $stmt->execute($hasGrade?[$studentId,$grade]:[$studentId]);
            foreach($stmt->fetchAll() as $row){
                $lesson=trim((string)($row['ders_kodu']??''));
                $index=(int)($row['modul_indeksi']??-1);
                if($lesson!==''&&$index>=0) $steps[]=$lesson.'-'.$index;
            }
            $stmt->closeCursor();
        }
    }catch(Throwable $e){
        error_log('[IlkAdim][state-merge] completed_steps_unavailable '.$e->getMessage());
    }

    try{
        if(normalized_table_exists($pdo,'oyun_tamamlamalari')){
            $stmt=$pdo->prepare('SELECT oyun_kodu FROM oyun_tamamlamalari WHERE ogrenci_id=?');
            $stmt->execute([$studentId]);
            foreach($stmt->fetchAll(PDO::FETCH_COLUMN) as $game){
                $game=trim((string)$game);
                if($game!=='') $games[]=$game;
            }
            $stmt->closeCursor();
        }
    }catch(Throwable $e){
        error_log('[IlkAdim][state-merge] completed_games_unavailable '.$e->getMessage());
    }

    try{
        if(normalized_table_exists($pdo,'ogrenci_cevaplari')){
            $grade=normalized_student_grade($pdo,$studentId);
            $hasGrade=normalized_column_exists($pdo,'ogrenci_cevaplari','sinif_seviyesi');
            $sql=$hasGrade
                ? 'SELECT ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi FROM ogrenci_cevaplari WHERE ogrenci_id=? AND sinif_seviyesi=? ORDER BY id'
                : 'SELECT ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi FROM ogrenci_cevaplari WHERE ogrenci_id=? ORDER BY id';
            $stmt=$pdo->prepare($sql);
            $stmt->execute($hasGrade?[$studentId,$grade]:[$studentId]);
            foreach($stmt->fetchAll() as $row){
                $selected=json_decode((string)($row['secilen_cevap']??'null'),true);
                $at=strtotime((string)($row['cevap_tarihi']??''));
                $attempts[]=[
                    'lesson'=>(string)($row['ders_kodu']??''),
                    'index'=>(string)($row['soru_anahtari']??''),
                    'selected'=>$selected,
                    'correct'=>(int)($row['dogru']??0)===1,
                    'ms'=>(int)($row['sure_ms']??0),
                    'at'=>$at!==false?$at*1000:0,
                ];
            }
            $stmt->closeCursor();
        }
    }catch(Throwable $e){
        error_log('[IlkAdim][state-merge] answers_unavailable '.$e->getMessage());
    }

    $persisted['steps']=progress_string_union($steps);
    $persisted['games']=progress_string_union($games);
    $persisted['attempts']=progress_record_union([], $attempts,'attempt');
    return $persisted;
}

function merge_student_progress(PDO $pdo,int $studentId,array $incoming): array {
    $persisted=persisted_student_progress($pdo,$studentId);

    foreach(['steps','games','days','claimed'] as $key){
        $incoming[$key]=progress_string_union((array)($persisted[$key]??[]),(array)($incoming[$key]??[]));
    }

    $incoming['attempts']=progress_record_union(
        (array)($incoming['attempts']??[]),
        (array)($persisted['attempts']??[]),
        'attempt'
    );
    $incoming['history']=progress_record_union(
        (array)($incoming['history']??[]),
        (array)($persisted['history']??[]),
        'history'
    );
    $incoming['readings']=progress_record_union(
        (array)($incoming['readings']??[]),
        (array)($persisted['readings']??[]),
        'reading'
    );

    $usage=(array)($persisted['usage']??[]);
    foreach((array)($incoming['usage']??[]) as $day=>$seconds){
        $usage[(string)$day]=max((float)($usage[(string)$day]??0),(float)$seconds);
    }
    $incoming['usage']=$usage;

    return $incoming;
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
        json_response(['ok'=>true,'student_id'=>$studentId,'state'=>$state,'summary'=>normalized_summary($pdo,$studentId),'storage'=>'mysql','csrf'=>csrf_token()]);
    }

    if($_SERVER['REQUEST_METHOD']!=='POST')json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    if(!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN']??'')))json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız.'],403);
    $raw=file_get_contents('php://input');
    if(!is_string($raw)||strlen($raw)>2000000)json_response(['ok'=>false,'message'=>'Geçersiz veya çok büyük istek.'],413);
    $payload=json_decode($raw,true);
    if(!is_array($payload))json_response(['ok'=>false,'message'=>'Geçersiz JSON.'],400);
    $explicitReset=($payload['reset_progress']??false)===true;
    $state=isset($payload['state'])&&is_array($payload['state'])?$payload['state']:$payload;
    unset($state['reset_progress']);
    if(array_key_exists('photo',$state)) $state['photo']=compact_profile_photo((string)$state['photo']);

    if(!$explicitReset){
        $state=merge_student_progress($pdo,$studentId,$state);
    }

    save_student_state($pdo,$studentId,$state);
    $pdo->beginTransaction();
    try{normalized_sync($pdo,$studentId,$state);$pdo->commit();}catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
    remove_duplicate_photo_from_state($pdo,$studentId);

    json_response(['ok'=>true,'student_id'=>$studentId,'saved_at'=>date(DATE_ATOM),'summary'=>normalized_summary($pdo,$studentId),'storage'=>'mysql']);
}catch(Throwable $e){
    error_log('[IlkAdim][state] '.$e->getMessage());
    json_response(['ok'=>false,'message'=>'Öğrenci verisi şu anda kaydedilemedi. Lütfen tekrar deneyin.'],500);
}
