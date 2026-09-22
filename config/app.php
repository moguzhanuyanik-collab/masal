<?php
declare(strict_types=1);

$defaults = [
    'app' => [
        'name' => 'İlkAdım',
        'demo_student_id' => 1,
        'timezone' => 'Europe/Istanbul',
    ],
    'db' => [
        'host' => 'localhost',
        'port' => 3306,
        'name' => 'ilk_adim',
        'user' => 'root',
        'pass' => '',
        'charset' => 'utf8mb4',
    ],
    'github' => [
        'owner' => '',
        'repo' => '',
        'branch' => 'main',
        'token' => '',
    ],
    'update' => [
        'preserve' => [
            'config/local.php',
            'storage',
            'styles.css',
            'app-style.css',
            'features-style.css',
            'assets',
        ],
    ],
];

$localFile = __DIR__ . '/local.php';
if (is_file($localFile)) {
    $local = require $localFile;
    if (is_array($local)) {
        $defaults = array_replace_recursive($defaults, $local);
    }
}

return $defaults;
