<?php
declare(strict_types=1);

require dirname(__DIR__).'/src/updater.php';

function check144(bool $condition,string $message): void {
    if(!$condition) throw new RuntimeException($message);
}

$local='1.1.99';
$rev=999;

check144(
    release_identity_is_newer(['version'=>'1.1.100','release_revision'=>1],$local,$rev),
    '1.1.100, 1.1.99 üzerine yeni sürüm olarak seçilebilmeli.'
);
check144(
    !release_identity_is_newer(['version'=>'1.1.98','release_revision'=>1],$local,$rev),
    'Daha eski sürüm aday olarak kabul edilmemeli.'
);
check144(
    !release_identity_is_newer(['version'=>'1.1.99','release_revision'=>999],$local,$rev),
    'Aynı sürüm/eşit revision yeniden kurulabilir sayılmamalı.'
);
check144(
    release_identity_is_newer(['version'=>'1.1.99','release_revision'=>1000],$local,$rev),
    'Aynı sürümde daha yüksek release revision güncelleme sayılmalı.'
);

$next=['version'=>'1.1.113','release_revision'=>1];
check144(
    release_identity_should_replace_next(['version'=>'1.1.100','release_revision'=>1],$next),
    '1.1.113 yerine 1.1.100 bir sonraki hedef olarak seçilmeli.'
);
$next=['version'=>'1.1.100','release_revision'=>1];
check144(
    release_identity_should_replace_next(['version'=>'1.1.100','release_revision'=>2],$next),
    'Aynı sürümde daha yüksek revision hedefi seçilmeli.'
);
check144(
    !release_identity_should_replace_next(['version'=>'1.1.100','release_revision'=>1],$next),
    'Aynı sürüm/eşit revision mevcut hedefi değiştirmemeli.'
);

echo "PASS: sequential release selection contract\n";
