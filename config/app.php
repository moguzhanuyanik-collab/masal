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
    'ai' => [
        'enabled' => true,
        'provider' => 'openai',
        'model' => 'gpt-5.6-luna',
        'api_key' => '',
        'groq_api_key' => '',
        'gemini_api_key' => '',
        'voice_enabled' => true,
        'voice_input' => 'browser',
        'voice_transcription_model' => 'whisper-large-v3-turbo',
        'timeout_seconds' => 20,
        'max_requests_per_10_minutes' => 20,
    ],
    'update' => [
        'preserve' => [
            'config/local.php',
            'storage',
            'styles.css',
            'app-style.css',
            'features-style.css',
            'assets',
            'v4',
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

$adimbotSettingsFile = dirname(__DIR__) . '/storage/adimbot-ai.php';
if (is_file($adimbotSettingsFile)) {
    // Panel settings are mutable even when OPcache timestamp validation is disabled.
    if (function_exists('opcache_invalidate')) @opcache_invalidate($adimbotSettingsFile, true);
    $adimbotSettings = require $adimbotSettingsFile;
    if (is_array($adimbotSettings)) {
        $defaults['ai'] = array_replace($defaults['ai'], $adimbotSettings);
    }
}

return $defaults;
