<?php
declare(strict_types=1);

function adimbot_rate_limit_table_ready(PDO $pdo): bool {
    static $cache=[];
    $key=spl_object_id($pdo);
    if(array_key_exists($key,$cache)) return (bool)$cache[$key];
    try{
        $stmt=$pdo->prepare("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name='adimbot_rate_limitleri'");
        $stmt->execute();
        $ok=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $cache[$key]=$ok;
    }catch(Throwable){
        $cache[$key]=false;
        return false;
    }
}

function adimbot_rate_limit_scopes(int $studentId,string $ip): array {
    $studentId=max(1,$studentId);
    $cleanIp=trim($ip);
    $scopes=[
        ['student',hash('sha256','student:'.$studentId)],
    ];
    if($cleanIp!==''){
        $scopes[]=['student_ip',hash('sha256','student:'.$studentId."\n".$cleanIp)];
        $scopes[]=['ip',hash('sha256','ip:'.$cleanIp)];
    }
    return $scopes;
}

function adimbot_rate_limit_check_and_record(
    PDO $pdo,
    string $channel,
    int $studentId,
    string $ip,
    int $baseLimit,
    int $windowSeconds=600
): array {
    $channel=strtolower(trim($channel));
    if(!preg_match('/^[a-z0-9_-]{1,16}$/D',$channel)) {
        return ['persistent'=>false,'blocked'=>false,'retry_after'=>0];
    }
    if($studentId<1 || !adimbot_rate_limit_table_ready($pdo)){
        return ['persistent'=>false,'blocked'=>false,'retry_after'=>0];
    }

    $baseLimit=max(3,min(60,$baseLimit));
    $windowSeconds=max(60,min(3600,$windowSeconds));
    $thresholds=[
        'student_ip'=>$baseLimit,
        'student'=>min(120,max($baseLimit+5,$baseLimit*2)),
        'ip'=>min(300,max(50,$baseLimit*5)),
    ];

    $started=false;
    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        $now=(int)($pdo->query('SELECT UNIX_TIMESTAMP(NOW())')->fetchColumn()?:time());
        $ensure=$pdo->prepare("INSERT IGNORE INTO adimbot_rate_limitleri
            (kanal,kapsam,kapsam_hash,deneme_sayisi,pencere_baslangici,engel_bitis,son_deneme)
            VALUES (?,?,?,0,FROM_UNIXTIME(?),NULL,FROM_UNIXTIME(?))");
        $select=$pdo->prepare("SELECT deneme_sayisi,
                UNIX_TIMESTAMP(pencere_baslangici) pencere_baslangici,
                UNIX_TIMESTAMP(engel_bitis) engel_bitis
            FROM adimbot_rate_limitleri
            WHERE kanal=? AND kapsam=? AND kapsam_hash=?
            LIMIT 1 FOR UPDATE");
        $update=$pdo->prepare("UPDATE adimbot_rate_limitleri
            SET deneme_sayisi=?,
                pencere_baslangici=FROM_UNIXTIME(?),
                engel_bitis=FROM_UNIXTIME(?),
                son_deneme=FROM_UNIXTIME(?)
            WHERE kanal=? AND kapsam=? AND kapsam_hash=?");

        $retryAfter=0;
        foreach(adimbot_rate_limit_scopes($studentId,$ip) as [$scope,$hash]){
            $ensure->execute([$channel,$scope,$hash,$now,$now]);
            $select->execute([$channel,$scope,$hash]);
            $row=$select->fetch(PDO::FETCH_ASSOC);
            $select->closeCursor();
            if(!is_array($row)) throw new RuntimeException('AdımBot hız limiti satırı oluşturulamadı.');

            $existingBlock=(int)($row['engel_bitis']??0);
            if($existingBlock>$now){
                $retryAfter=max($retryAfter,$existingBlock-$now);
                continue;
            }

            $windowStart=(int)($row['pencere_baslangici']??0);
            $count=(int)($row['deneme_sayisi']??0);
            if($windowStart<=0 || $windowStart<=$now-$windowSeconds){
                $windowStart=$now;
                $count=1;
            }else{
                $count=max(0,$count)+1;
            }

            $threshold=(int)($thresholds[$scope]??$baseLimit);
            $blockUntil=0;
            if($count>$threshold){
                $blockUntil=max($now+1,$windowStart+$windowSeconds);
                $retryAfter=max($retryAfter,$blockUntil-$now);
            }

            $update->execute([
                $count,
                $windowStart,
                $blockUntil>0?$blockUntil:null,
                $now,
                $channel,
                $scope,
                $hash,
            ]);
        }

        if($started){
            $pdo->commit();
            try{
                $pdo->exec("DELETE FROM adimbot_rate_limitleri
                    WHERE son_deneme < DATE_SUB(NOW(), INTERVAL 7 DAY)
                    ORDER BY son_deneme
                    LIMIT 200");
            }catch(Throwable){}
        }
        return [
            'persistent'=>true,
            'blocked'=>$retryAfter>0,
            'retry_after'=>max(0,min($windowSeconds,$retryAfter)),
        ];
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        error_log('[IlkAdim][adimbot-rate-limit] '.get_class($e));
        return ['persistent'=>false,'blocked'=>false,'retry_after'=>0];
    }
}
