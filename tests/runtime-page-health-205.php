<?php
declare(strict_types=1);

require __DIR__.'/../src/runtime_compat.php';

function ok205(bool $condition,string $message): void {
    if(!$condition){
        fwrite(STDERR,"FAIL: ".$message.PHP_EOL);
        exit(1);
    }
}

ok205(function_exists('mb_strlen'),'mb_strlen fallback/native missing');
ok205(function_exists('mb_substr'),'mb_substr fallback/native missing');
ok205(function_exists('mb_strtolower'),'mb_strtolower fallback/native missing');
ok205(function_exists('mb_strtoupper'),'mb_strtoupper fallback/native missing');
ok205(mb_strlen('İlkAdım')===7,'UTF-8 length compatibility failed');
ok205(mb_substr('İlkAdım',0,3)==='İlk','UTF-8 substring compatibility failed');

if(!extension_loaded('mbstring')){
    ok205(mb_strtolower('İLKADIM')==='ilkadım','fallback Turkish lowercase compatibility failed');
    ok205(mb_strtoupper('ilkadım')==='İLKADIM','fallback Turkish uppercase compatibility failed');
}

echo "PASS: runtime compatibility layer is available".PHP_EOL;
