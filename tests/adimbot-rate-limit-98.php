<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/adimbot_rate_limit.php';

function check98(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$scopes=adimbot_rate_limit_scopes(42,'192.0.2.10');
check98(count($scopes)===3,'Expected student, student_ip and ip scopes.');
check98(array_column($scopes,0)===['student','student_ip','ip'],'Unexpected scope order.');
check98(strlen((string)$scopes[0][1])===64,'Student hash length.');
check98($scopes===adimbot_rate_limit_scopes(42,'192.0.2.10'),'Scope hashing must be stable.');
check98($scopes!==adimbot_rate_limit_scopes(43,'192.0.2.10'),'Different student must change scope hashes.');

$noIp=adimbot_rate_limit_scopes(42,'');
check98(count($noIp)===1 && $noIp[0][0]==='student','Empty IP must not create shared blank-IP buckets.');

echo "PASS: AdımBot persistent rate-limit scope behavior\n";
