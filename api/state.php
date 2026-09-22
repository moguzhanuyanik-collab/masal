<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/normalized.php';

try {
    $pdo=db();
    $studentId=current_student_id();

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

    save_student_state($pdo,$studentId,$state);
    $pdo->beginTransaction();
    try{normalized_sync($pdo,$studentId,$state);$pdo->commit();}catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}

    json_response(['ok'=>true,'student_id'=>$studentId,'saved_at'=>date(DATE_ATOM),'summary'=>normalized_summary($pdo,$studentId),'storage'=>'mysql']);
}catch(Throwable $e){
    json_response(['ok'=>false,'message'=>'Veritabanı işlemi başarısız.','detail'=>$e->getMessage()],500);
}
