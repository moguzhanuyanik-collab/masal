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

    echo json_encode(
        $data,
        JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
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
                'update_available' => version_compare(
                    (string)($remote['version'] ?? '0.0.0'),
                    $local,
                    '>'
                ),
            ]);
        }

        if ($action === 'install') {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                ajax_response([
                    'ok' => false,
                    'message' => 'Kurulum işlemi POST isteği ile yapılmalıdır.',
                ], 405);
            }

            $remoteBefore = remote_version_info($gh);

            if (!version_compare(
                (string)($remoteBefore['version'] ?? '0.0.0'),
                $local,
                '>'
            )) {
                ajax_response([
                    'ok' => true,
                    'action' => 'install',
                    'message' => 'Sistem zaten güncel.',
                    'local_version' => $local,
                    'remote_version' => (string)($remoteBefore['version'] ?? ''),
                    'remote_name' => (string)($remoteBefore['name'] ?? ''),
                    'commit' => (string)($remoteBefore['commit'] ?? ''),
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
                'message' => (string)($result['message'] ?? 'Güncelleme başarıyla kuruldu.'),
                'backup' => (string)($result['backup'] ?? ''),
                'local_version' => $newLocal,
                'remote_version' => (string)($remote['version'] ?? ''),
                'remote_name' => (string)($remote['name'] ?? ''),
                'commit' => (string)($remote['commit'] ?? ''),
                'update_available' => version_compare(
                    (string)($remote['version'] ?? '0.0.0'),
                    $newLocal,
                    '>'
                ),
            ]);
        }

        ajax_response([
            'ok' => false,
            'message' => 'Geçersiz AJAX işlemi.',
        ], 400);
    } catch (Throwable $e) {
        ajax_response([
            'ok' => false,
            'message' => $e->getMessage(),
        ], 500);
    }
}

$local = read_app_version();
?>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#7440ee">
    <meta name="description" content="İlkAdım uygulama güncelleme merkezi.">
    <title>Uygulama Güncelleme — İlkAdım</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<svg class="icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
    <symbol id="i-home" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10H15v-6H9v6H3Z"/></symbol>
    <symbol id="i-book" viewBox="0 0 24 24"><path d="M12 5C8 2 3 3 3 3v16s5-1 9 2c4-3 9-2 9-2V3s-5-1-9 2Zm0 0v16"/></symbol>
    <symbol id="i-star" viewBox="0 0 24 24"><path d="m12 3 3 6 7 1-5 5 1 7-6-3-6 3 1-7-5-5 7-1Z"/></symbol>
    <symbol id="i-user" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 22v-3a8 8 0 0 1 16 0v3"/></symbol>
    <symbol id="i-refresh" viewBox="0 0 24 24"><path d="M20 7v5h-5"/><path d="M4 17v-5h5"/><path d="M6.1 9A7 7 0 0 1 18.7 7M17.9 15A7 7 0 0 1 5.3 17"/></symbol>
    <symbol id="i-check" viewBox="0 0 24 24"><path d="m5 12 4 4L19 6"/></symbol>
</svg>

<a class="skip-link" href="#screen">İçeriğe geç</a>

<div class="app-shell">
    <header class="app-topbar">
        <a class="icon-button" href="index.php#/profil" aria-label="Profile dön">←</a>
        <div class="topbar-title">Uygulama Güncelleme</div>
        <a class="mini-avatar" href="index.php#/profil" aria-label="Profil">
            <span class="avatar-emoji">🌞</span>
        </a>
    </header>

    <main id="screen" tabindex="-1">
        <div class="screen-content">
            <section class="subpage-intro">
                <span>🔄</span>
                <h1>Uygulama Güncelleme</h1>
                <p>Yeni sürümleri GitHub üzerinden kontrol et ve uygulamayı tek dokunuşla güncelle.</p>
            </section>

            <section class="settings-block">
                <h2>Sürüm Bilgileri</h2>

                <div class="history-item">
                    <span>📱</span>
                    <div>
                        <strong>Kurulu sürüm</strong>
                        <small id="localVersion"><?=h($local)?></small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-check"/></svg>
                </div>

                <div class="history-item">
                    <span>☁️</span>
                    <div>
                        <strong>GitHub sürümü</strong>
                        <small><span id="remoteVersion">Kontrol ediliyor...</span><span id="remoteName"></span></small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-refresh"/></svg>
                </div>

                <div class="history-item">
                    <span>🧩</span>
                    <div>
                        <strong>Commit</strong>
                        <small id="commit">-</small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-check"/></svg>
                </div>
            </section>

            <section class="weekly-summary" id="statusBox">
                <strong id="statusTitle">Güncelleme kontrol ediliyor</strong>
                <p id="statusText">GitHub sürümü kontrol ediliyor...</p>
                <small id="backupText" hidden></small>
            </section>

            <section class="settings-block" id="messageBox" hidden>
                <h2 id="messageTitle">Bilgi</h2>
                <div class="local-data">
                    <p id="messageText"></p>
                </div>
            </section>

            <button type="button" class="button soft full" id="checkButton">
                <svg aria-hidden="true"><use href="#i-refresh"/></svg>
                Güncellemeyi Kontrol Et
            </button>

            <button type="button" class="button primary full" id="installButton" hidden>
                <svg aria-hidden="true"><use href="#i-refresh"/></svg>
                Güncellemeyi Şimdi Kur
            </button>

            <p class="little-note">Sunucuda yalnızca bir önceki sürümün tek yedeği tutulur. Yeni güncellemede eski yedek güvenli biçimde yenilenir. CSS ve mevcut görseller korunur.</p>
        </div>
    </main>

    <nav class="app-nav" aria-label="Hızlı erişim">
        <a href="index.php#/anasayfa"><span><svg><use href="#i-home"/></svg></span>Anasayfa</a>
        <a href="index.php#/dersler"><span><svg><use href="#i-book"/></svg></span>Dersler</a>
        <a href="index.php#/etkinlikler"><span><svg><use href="#i-star"/></svg></span>Etkinlikler</a>
        <a class="active" href="index.php#/profil"><span><svg><use href="#i-user"/></svg></span>Profil</a>
    </nav>
</div>

<script>
(() => {
    const localVersion = document.getElementById('localVersion');
    const remoteVersion = document.getElementById('remoteVersion');
    const remoteName = document.getElementById('remoteName');
    const commit = document.getElementById('commit');
    const statusTitle = document.getElementById('statusTitle');
    const statusText = document.getElementById('statusText');
    const backupText = document.getElementById('backupText');
    const messageBox = document.getElementById('messageBox');
    const messageTitle = document.getElementById('messageTitle');
    const messageText = document.getElementById('messageText');
    const checkButton = document.getElementById('checkButton');
    const installButton = document.getElementById('installButton');

    let busy = false;

    function setBusy(value, action = 'check') {
        busy = value;
        checkButton.disabled = value;
        installButton.disabled = value;

        if (value) {
            if (action === 'install') {
                statusTitle.textContent = 'Güncelleme kuruluyor';
                statusText.textContent = 'Dosyalar hazırlanıyor ve otomatik yedek alınıyor...';
                installButton.textContent = 'Güncelleme Kuruluyor...';
            } else {
                statusTitle.textContent = 'Güncelleme kontrol ediliyor';
                statusText.textContent = 'GitHub sürümü kontrol ediliyor...';
                checkButton.textContent = 'Kontrol Ediliyor...';
            }
        } else {
            checkButton.innerHTML = '<svg aria-hidden="true"><use href="#i-refresh"/></svg>Güncellemeyi Kontrol Et';
            installButton.innerHTML = '<svg aria-hidden="true"><use href="#i-refresh"/></svg>Güncellemeyi Şimdi Kur';
        }
    }

    function showMessage(title, message) {
        messageTitle.textContent = title;
        messageText.textContent = message;
        messageBox.hidden = false;
    }

    function applyState(data) {
        if (data.local_version) {
            localVersion.textContent = data.local_version;
        }

        remoteVersion.textContent = data.remote_version || '-';
        remoteName.textContent = data.remote_name ? ' — ' + data.remote_name : '';
        commit.textContent = data.commit ? data.commit.substring(0, 12) : '-';

        if (data.update_available) {
            statusTitle.textContent = 'Yeni sürüm hazır';
            statusText.textContent = 'Güncelleme bulundu. Kuruluma hazır.';
            installButton.hidden = false;
        } else {
            statusTitle.textContent = 'Sistem güncel';
            statusText.textContent = 'Şu anda kurulabilecek yeni bir sürüm yok.';
            installButton.hidden = true;
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
        } catch (error) {
            throw new Error('Sunucudan geçerli JSON yanıtı alınamadı.');
        }

        if (!response.ok || !data.ok) {
            throw new Error(data.message || 'Güncelleme işlemi başarısız.');
        }

        return data;
    }

    async function checkUpdate() {
        if (busy) return;

        messageBox.hidden = true;
        backupText.hidden = true;
        setBusy(true, 'check');

        try {
            const data = await request('check');
            applyState(data);
        } catch (error) {
            statusTitle.textContent = 'Kontrol başarısız';
            statusText.textContent = 'GitHub sürümü kontrol edilemedi.';
            showMessage('Güncelleme hatası', error.message);
        } finally {
            setBusy(false);
        }
    }

    async function installUpdate() {
        if (busy) return;

        if (!confirm('Önce otomatik yedek alınacak ve yeni sürüm kurulacak. Devam edilsin mi?')) {
            return;
        }

        messageBox.hidden = true;
        backupText.hidden = true;
        setBusy(true, 'install');

        try {
            const data = await request('install');
            applyState(data);

            statusTitle.textContent = 'Güncelleme tamamlandı';
            statusText.textContent = data.message || 'Güncelleme başarıyla kuruldu.';

            if (data.backup) {
                backupText.textContent = 'Yedek: ' + data.backup;
                backupText.hidden = false;
            }

            showMessage('İşlem tamamlandı', data.message || 'Güncelleme başarıyla kuruldu.');
        } catch (error) {
            statusTitle.textContent = 'Güncelleme kurulamadı';
            statusText.textContent = 'Kurulum sırasında bir hata oluştu.';
            showMessage('Kurulum hatası', error.message);
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
