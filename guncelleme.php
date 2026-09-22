<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/updater.php';

function h(string $v): string { return htmlspecialchars($v, ENT_QUOTES, 'UTF-8'); }

$gh = app_config('github');
$updateCfg = app_config('update');
$result = null;
$error = null;
$remote = null;

try {
    $remote = remote_version_info($gh);
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') === 'install') {
        $result = install_github_update(__DIR__, $gh, (array)($updateCfg['preserve'] ?? []));
        $remote = $result['remote'] ?? $remote;
    }
} catch (Throwable $e) {
    $error = $e->getMessage();
}

$local = read_app_version();
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>İlkAdım Güncelleme</title></head>
<body style="font-family:system-ui,sans-serif;max-width:760px;margin:40px auto;padding:0 18px;line-height:1.55">
<h1>İlkAdım GitHub Güncelleme</h1>
<p>Kurulu sürüm: <strong><?=h($local)?></strong></p>
<?php if ($error): ?><p style="padding:12px;background:#fff0f0;border:1px solid #e4a5a5"><strong>Hata:</strong> <?=h($error)?></p><?php endif; ?>
<?php if ($result): ?><p style="padding:12px;background:#e8fff0;border:1px solid #96d7ab"><strong><?=h((string)$result['message'])?></strong><?php if (!empty($result['backup'])): ?><br>Yedek: <?=h((string)$result['backup'])?><?php endif; ?></p><?php endif; ?>
<?php if ($remote): ?>
<p>GitHub sürümü: <strong><?=h((string)$remote['version'])?></strong><?php if (!empty($remote['name'])): ?> — <?=h((string)$remote['name'])?><?php endif; ?></p>
<p>Commit: <code><?=h(substr((string)$remote['commit'],0,12))?></code></p>
<?php if (version_compare((string)$remote['version'], $local, '>')): ?>
<form method="post"><input type="hidden" name="action" value="install"><button type="submit" onclick="return confirm('Önce otomatik yedek alınacak ve GitHub sürümü kurulacak. Devam edilsin mi?')">Güncellemeyi Şimdi Kur</button></form>
<?php else: ?><p>Sistem güncel.</p><?php endif; ?>
<?php endif; ?>
<hr><p><a href="index.php">Uygulamaya dön</a></p>
</body></html>
