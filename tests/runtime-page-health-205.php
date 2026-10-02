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
ok205(mb_strtolower('İLKADIM')==='ilkadım','Turkish lowercase compatibility failed');
ok205(mb_strtoupper('ilkadım')==='İLKADIM','Turkish uppercase compatibility failed');

echo "PASS: runtime compatibility layer is available".PHP_EOL;
