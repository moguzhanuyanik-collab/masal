<?php
declare(strict_types=1);

$defaults = [
    'app' => [
        'name' => 'İlkAdım',
        'demo_student_id' => 1,
        'timezone' => 'Europe/Istanbul',
        // Şifre sıfırlama bağlantıları için dışarıdan erişilebilir HTTPS kök adresi.
        'base_url' => '',
    ],
    'db' => [
        'host' => 'localhost',
        'port' => 3306,
        'name' => 'ilk_adim',
        'user' => 'root',
        'pass' => '',
        'charset' => 'utf8mb4',
    ],
    'mail' => [
        // disabled | mail | smtp
        'transport' => 'disabled',
        'from_email' => '',
        'from_name' => 'İlkAdım',
        'smtp' => [
            'host' => '',
            'port' => 587,
            'encryption' => 'tls', // none | tls | ssl
            'username' => '',
            'password' => '',
            'timeout_seconds' => 10,
        ],
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
        // Boş bırakılırsa updater yaygın sistem yollarında mysqldump arar.
        // Shared hosting özel yol kullanıyorsa config/local.php içinden ayarlanabilir.
        'mysqldump_path' => '',
        // GitHub update paketleri için fail-closed kaynak sınırları.
        'max_package_download_bytes' => 64 * 1024 * 1024,
        'max_package_entries' => 5000,
        'max_package_uncompressed_bytes' => 128 * 1024 * 1024,
        'max_package_file_bytes' => 16 * 1024 * 1024,
        'max_package_compression_ratio' => 250,
        'preserve' => [
            'config/local.php',
            'storage',
            // Canlı yüklemeler/legacy varlıklar repoda olmadığı için korunur.
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
