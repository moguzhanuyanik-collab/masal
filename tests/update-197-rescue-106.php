<?php
declare(strict_types=1);
require dirname(__DIR__).'/tools/updater-1.1.97-rescue.php';

function check106(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

check106(is_1_1_97_rescue_transition('1.1.96','1.1.97'),'1.1.96 -> 1.1.97 rescue transition not detected.');
check106(!is_1_1_97_rescue_transition('1.1.95','1.1.97'),'Older transition must not use rescue.');
check106(!is_1_1_97_rescue_transition('1.1.96','1.1.98'),'Later target must not use rescue.');
check106(!is_1_1_97_rescue_transition('1.1.97','1.1.98'),'Normal next transition must not use rescue.');

echo "PASS: 1.1.97 rescue transition scope\n";
