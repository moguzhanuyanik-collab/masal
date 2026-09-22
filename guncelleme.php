<?php
declare(strict_types=1);

$isAjax = isset($_REQUEST['ajax']) && (string)$_REQUEST['ajax'] === '1';
if ($isAjax) {
    ob_start();
}

require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/updater.php';

function h(string $v): string {
    return htmlspecialchars($v, ENT_QUOTES, 'UTF-8');
}

function ajax_response(array $data, int $status = 200): never {
    if (ob_get_level() > 0) {
        ob_clean();
    }
    http_response_code($status);
    header('Content-Type: application/json; charset=UTF-8');
    header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

$gh = app_config('github');
$updateCfg = app_config('update');

if ($isAjax) {
    try {
        $action = (string)($_REQUEST['action'] ?? 'check');
        $local = read_app_version();

        if ($action === 'check') {
            $remote = remote_version_info($gh);

            ajax_response([
                'ok' => true,
                'action' => 'check',
                'local_version' => $local,
                'remote_version' => (string)($remote['version'] ?? ''),
                'remote_name' => (string)($remote['name'] ?? ''),
                'commit' => (string)($remote['commit'] ?? ''),
                'update_available' => version_compare((string)($remote['version'] ?? '0.0.0'), $local, '>'),
            ]);
        }

        if ($action === 'install') {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                ajax_response([
                    'ok' => false,
                    'message' => 'Kurulum islemi POST istegi ile yapilmalidir.',
                ], 405);
            }

            $remoteBefore = remote_version_info($gh);

            if (!version_compare((string)($remoteBefore['version'] ?? '0.0.0'), $local, '>')) {
                ajax_response([
                    'ok' => true,
                    'action' => 'install',
                    'message' => 'Sistem zaten guncel.',
                    'local_version' => $local,
                    'remote_version' => (string)($remoteBefore['version'] ?? ''),
                    'update_available' => false,
                ]);
            }

            $result = install_github_update(
                __DIR__,
                $gh,
                (array)($updateCfg['preserve'] ?? [])
            );

            $newLocal = read_app_version();
            $remote = $result['remote'] ?? $remoteBefore;

            ajax_response([
                'ok' => true,
                'action' => 'install',
                'message' => (string)($result['message'] ?? 'Guncelleme basariyla kuruldu.'),
                'backup' => (string)($result['backup'] ?? ''),
                'local_version' => $newLocal,
                'remote_version' => (string)($remote['version'] ?? ''),
                'remote_name' => (string)($remote['name'] ?? ''),
                'commit' => (string)($remote['commit'] ?? ''),
                'update_available' => version_compare((string)($remote['version'] ?? '0.0.0'), $newLocal, '>'),
            ]);
        }

        ajax_response([
            'ok' => false,
            'message' => 'Gecersiz AJAX islemi.',
        ], 400);
    } catch (Throwable $e) {
        ajax_response([
            'ok' => false,
            'message' => $e->getMessage(),
        ], 500);
    }
}

$local = read_app_version();
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>İlkAdım Güncelleme</title>
</head>
<body style="font-family:system-ui,sans-serif;max-width:760px;margin:40px auto;padding:0 18px;line-height:1.55">
<h1>İlkAdım GitHub Güncelleme</h1>

<p>Kurulu sürüm: <strong id="localVersion"><?=h($local)?></strong></p>

<div id="messageBox" style="display:none;padding:12px;margin:12px 0"></div>

<div id="remoteInfo">
    <p>GitHub sürümü: <strong id="remoteVersion">Kontrol ediliyor...</strong><span id="remoteName"></span></p>
    <p>Commit: <code id="commit">-</code></p>
</div>

<p id="statusText">GitHub sürümü kontrol ediliyor...</p>

<button type="button" id="checkButton">Güncellemeyi Kontrol Et</button>
<button type="button" id="installButton" style="display:none">Güncellemeyi Şimdi Kur</button>

<hr>
<p><a href="index.php">Uygulamaya dön</a></p>

<script>
(() => {
    const localVersion = document.getElementById('localVersion');
    const remoteVersion = document.getElementById('remoteVersion');
    const remoteName = document.getElementById('remoteName');
    const commit = document.getElementById('commit');
    const statusText = document.getElementById('statusText');
    const messageBox = document.getElementById('messageBox');
    const checkButton = document.getElementById('checkButton');
    const installButton = document.getElementById('installButton');

    let busy = false;

    function setBusy(value, text = '') {
        busy = value;
        checkButton.disabled = value;
        installButton.disabled = value;

        if (text) {
            statusText.textContent = text;
        }

        if (value) {
            checkButton.textContent = 'Kontrol ediliyor...';
            if (installButton.style.display !== 'none') {
                installButton.textContent = 'Güncelleme kuruluyor...';
            }
        } else {
            checkButton.textContent = 'Güncellemeyi Kontrol Et';
            installButton.textContent = 'Güncellemeyi Şimdi Kur';
        }
    }

    function showMessage(message, success) {
        messageBox.style.display = 'block';
        messageBox.textContent = message;
        messageBox.style.background = success ? '#e8fff0' : '#fff0f0';
        messageBox.style.border = success ? '1px solid #96d7ab' : '1px solid #e4a5a5';
    }

    function applyState(data) {
        if (data.local_version) {
            localVersion.textContent = data.local_version;
        }

        remoteVersion.textContent = data.remote_version || '-';
        remoteName.textContent = data.remote_name ? ' — ' + data.remote_name : '';
        commit.textContent = data.commit ? data.commit.substring(0, 12) : '-';

        if (data.update_available) {
            statusText.textContent = 'Yeni güncelleme bulundu.';
            installButton.style.display = 'inline-block';
        } else {
            statusText.textContent = 'Sistem güncel.';
            installButton.style.display = 'none';
        }
    }

    async function request(action) {
        const method = action === 'install' ? 'POST' : 'GET';
        const url = 'guncelleme.php?ajax=1&action=' + encodeURIComponent(action);

        const response = await fetch(url, {
            method,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json'
            },
            cache: 'no-store'
        });

        let data;
        try {
            data = await response.json();
        } catch (e) {
            throw new Error('Sunucudan geçerli JSON yanıtı alınamadı.');
        }

        if (!response.ok || !data.ok) {
            throw new Error(data.message || 'Güncelleme işlemi başarısız.');
        }

        return data;
    }

    async function checkUpdate() {
        if (busy) return;

        messageBox.style.display = 'none';
        setBusy(true, 'GitHub sürümü kontrol ediliyor...');

        try {
            const data = await request('check');
            applyState(data);
        } catch (e) {
            statusText.textContent = 'Kontrol başarısız.';
            showMessage(e.message, false);
        } finally {
            setBusy(false);
        }
    }

    async function installUpdate() {
        if (busy) return;

        if (!confirm('Önce otomatik yedek alınacak ve GitHub sürümü kurulacak. Devam edilsin mi?')) {
            return;
        }

        messageBox.style.display = 'none';
        setBusy(true, 'Güncelleme kuruluyor. Sayfayı kapatmayın...');

        try {
            const data = await request('install');
            applyState(data);

            let message = data.message || 'Güncelleme başarıyla kuruldu.';
            if (data.backup) {
                message += ' Yedek: ' + data.backup;
            }

            showMessage(message, true);
        } catch (e) {
            statusText.textContent = 'Güncelleme kurulamadı.';
            showMessage(e.message, false);
        } finally {
            setBusy(false);
        }
    }

    checkButton.addEventListener('click', checkUpdate);
    installButton.addEventListener('click', installUpdate);

    checkUpdate();
})();
</script>
</body>
</html>
