<?php
declare(strict_types=1);

require_once __DIR__.'/../src/updater.php';

function ok_127(bool $condition,string $message): void {
    if(!$condition) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-release-chain-cache-'.bin2hex(random_bytes(6));
@mkdir($root,0770,true);

try{
    $chain=[
        ['version'=>'1.1.98','release_revision'=>1,'name'=>'r98','commit'=>str_repeat('a',40)],
        ['version'=>'1.1.99','release_revision'=>1,'name'=>'r99','commit'=>str_repeat('b',40)],
        ['version'=>'1.1.100','release_revision'=>1,'name'=>'r100','commit'=>str_repeat('c',40)],
        ['version'=>'1.2.1','release_revision'=>21,'name'=>'r21','commit'=>str_repeat('d',40)],
    ];

    $next=select_next_release_from_chain($chain,'1.1.99',1);
    ok_127(is_array($next) && $next['version']==='1.1.100',
        'Sıralı seçim cache zincirinde 1.1.99 sonrası 1.1.100ü seçmeli.');

    $same=select_next_release_from_chain($chain,'1.2.1',20);
    ok_127(is_array($same) && $same['version']==='1.2.1' && (int)$same['release_revision']===21,
        'Aynı sürümde daha yüksek release revision seçilmeli.');

    ok_127(release_chain_cache_write($root,'main',str_repeat('e',40),$chain),
        'Release-chain cache yazılamadı.');

    $cached=release_chain_cache_read($root,'main',str_repeat('e',40));
    ok_127(is_array($cached) && count($cached)===4,
        'Geçerli HMAC cache okunamadı.');

    $cachePath=release_chain_cache_path($root);
    $tampered=json_decode((string)file_get_contents($cachePath),true);
    $tampered['chain'][0]['version']='9.9.9';
    file_put_contents($cachePath,json_encode($tampered,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT)."\n",LOCK_EX);
    ok_127(release_chain_cache_read($root,'main',str_repeat('e',40))===null,
        'HMAC bozulmuş cache güvenilir kabul edildi.');

    release_chain_cache_write($root,'main',str_repeat('e',40),$chain);
    ok_127(release_chain_cache_read($root,'main',str_repeat('f',40))===null,
        'Farklı main HEAD cache anahtarını geçememeli.');

    $secretPath=release_chain_cache_secret_path($root);
    @unlink($secretPath);
    ok_127(release_chain_cache_read($root,'main',str_repeat('e',40))===null,
        'Eksik cache secret eski HMAC ile cacheyi güvenilir kabul ettirmemeli.');
    ok_127(is_file($secretPath),
        'Eksik cache secret sonraki kullanım için yeniden oluşturulmalı.');

    release_chain_cache_write($root,'main',str_repeat('e',40),$chain);
    ok_127(release_chain_cache_read($root,'main',str_repeat('e',40))!==null,
        'Yeni secret ile cache yeniden imzalanabilmeli.');

    $mode=fileperms($secretPath);
    ok_127(is_int($mode) && (($mode & 0777)===0600),
        'Cache secret dosyası 0600 izinleriyle korunmalı.');

    echo "PASS: 1.2.1 release-chain HMAC cache contract\n";
}finally{
    if(is_dir($root)){
        $it=new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($root,FilesystemIterator::SKIP_DOTS),
            RecursiveIteratorIterator::CHILD_FIRST
        );
        foreach($it as $item){
            if($item->isDir()) @rmdir($item->getPathname());
            else @unlink($item->getPathname());
        }
        @rmdir($root);
    }
}
