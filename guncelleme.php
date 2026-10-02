<?php
declare(strict_types=1);

$isAjax = isset($_GET['ajax']) && (string)$_GET['ajax'] === '1';
if ($isAjax) {
    ob_start();
}

require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/updater.php';
require __DIR__ . '/src/auth.php';

$updateUser=authenticated_user();
if (!$updateUser) {
    if ($isAjax) {
        if (ob_get_level()>0) ob_clean();
        http_response_code(401);
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(['ok'=>false,'message'=>'Güncelleme merkezi için giriş yapmalısın.'],JSON_UNESCAPED_UNICODE);
        exit;
    }
    header('Location: login.php');
    exit;
}
if (auth_effective_role($updateUser)!=='super_admin') {
    if ($isAjax) {
        if (ob_get_level()>0) ob_clean();
        http_response_code(403);
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(['ok'=>false,'message'=>'Güncelleme yalnızca Süper Admin tarafından kurulabilir.'],JSON_UNESCAPED_UNICODE);
        exit;
    }
    auth_redirect_to_role_home($updateUser);
}

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

function update_public_error_message(Throwable $e): string {
    $message=trim($e->getMessage());
    $safePrefixes=[
        'Baska bir guncelleme',
        'Başka bir güncelleme',
        'Siradaki guncelleme',
        'Sıradaki güncelleme',
        'Siradaki surumun',
        'Sıradaki sürümün',
        'Güncelleme kurtarma köprüsü',
        'GitHub dal HEAD',
        'Migration ',
        'Eski kurum_kullanicilari',
        'Eski kurum kullanıcı',
        'GitHub ',
        'Indirilen guncelleme',
        'İndirilen güncelleme',
        'Guncelleme paketi',
        'Güncelleme paketi',
        'Güncelleme ZIP paketi',
        'Güncelleme hedef',
        'Güncelleme dosya',
        'Güncelleme kaynak',
        'Güncelleme sonrası',
        'Manuel güncelleme',
        'Yedek ',
        'Onceki surum',
        'Önceki sürüm',
        'PHP ZipArchive',
        'Storage ',
    ];
    foreach($safePrefixes as $prefix){
        if($message!=='' && str_starts_with($message,$prefix)) return $message;
    }
    return 'Güncelleme işlemi tamamlanamadı. Teknik ayrıntılar sunucu günlüğüne kaydedildi.';
}

try{
    ensure_runtime_storage_guard(__DIR__);
}catch(Throwable $storageError){
    error_log('[IlkAdim][update-storage] '.$storageError->getMessage());
}

$gh = app_config('github');
$dbCfg = app_config('db');
$updateCfg = app_config('update');
$updateCsrf = csrf_token();

if ($isAjax) {
    try {
        $action = (string)($_GET['action'] ?? 'check');
        $local = read_app_version();
        $localRevision = read_local_release_revision(__DIR__,$local);

        if ($action === 'check') {
            $remote = next_remote_version_info($gh,$local,$localRevision,__DIR__);

            ajax_response([
                'ok' => true,
                'action' => 'check',
                'local_version' => $local,
                'local_revision' => $localRevision,
                'remote_version' => (string)($remote['version'] ?? ''),
                'remote_revision' => normalize_release_revision($remote['release_revision'] ?? 0),
                'remote_name' => (string)($remote['name'] ?? ''),
                'commit' => (string)($remote['commit'] ?? ''),
                'update_available' => release_identity_is_newer($remote,$local,$localRevision),
            ]);
        }

        if ($action === 'install') {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                ajax_response([
                    'ok' => false,
                    'message' => 'Kurulum işlemi POST isteği ile yapılmalıdır.',
                ], 405);
            }
            $csrf=(string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? ($_POST['csrf'] ?? ''));
            if (!verify_csrf($csrf)) {
                ajax_response([
                    'ok' => false,
                    'message' => 'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.',
                ], 403);
            }

            $remoteBefore = next_remote_version_info($gh,$local,$localRevision,__DIR__);

            if (!release_identity_is_newer($remoteBefore,$local,$localRevision)) {
                ajax_response([
                    'ok' => true,
                    'action' => 'install',
                    'message' => 'Sistem zaten güncel.',
                    'local_version' => $local,
                    'local_revision' => $localRevision,
                    'remote_version' => (string)($remoteBefore['version'] ?? ''),
                    'remote_revision' => normalize_release_revision($remoteBefore['release_revision'] ?? 0),
                    'remote_name' => (string)($remoteBefore['name'] ?? ''),
                    'commit' => (string)($remoteBefore['commit'] ?? ''),
                    'update_available' => false,
                ]);
            }

            $result = install_github_update(
                __DIR__,
                $gh,
                (array)($updateCfg['preserve'] ?? []),
                is_array($dbCfg)?$dbCfg:[],
                is_array($updateCfg)?$updateCfg:[]
            );

            if (($result['retry_required'] ?? false) === true) {
                ajax_response([
                    'ok' => true,
                    'action' => 'install',
                    'retry_required' => true,
                    'core_handoff' => (bool)($result['core_handoff'] ?? false),
                    'message' => (string)($result['message'] ?? 'Updater çekirdeği yenilendi.'),
                    'backup' => (string)($result['backup'] ?? ''),
                    'updater_backup' => (string)($result['updater_backup'] ?? ''),
                    'recovery_manifest' => (string)($result['recovery_manifest'] ?? ''),
                    'local_version' => $local,
                    'local_revision' => $localRevision,
                    'remote_version' => (string)($remoteBefore['version'] ?? ''),
                    'remote_revision' => normalize_release_revision($remoteBefore['release_revision'] ?? 0),
                    'remote_name' => (string)($remoteBefore['name'] ?? ''),
                    'commit' => (string)($remoteBefore['commit'] ?? ''),
                    'update_available' => true,
                ]);
            }

            $newLocal = read_app_version();
            $newLocalRevision = read_local_release_revision(__DIR__,$newLocal);

            // Kurulum başarıyla tamamlandıktan sonraki GitHub kontrolü ikincil bir adımdır.
            // Bu ağ isteği başarısız olsa bile tamamlanmış kurulumu kullanıcıya hatalı gösterme.
            $message = (string)($result['message'] ?? 'Güncelleme başarıyla kuruldu.');
            $remote = [
                'version' => $newLocal,
                'release_revision' => $newLocalRevision,
                'name' => '',
                'commit' => '',
            ];
            $hasNext = false;
            try {
                $remote = next_remote_version_info($gh,$newLocal,$newLocalRevision,__DIR__);
                $hasNext = release_identity_is_newer($remote,$newLocal,$newLocalRevision);
                if ($hasNext) {
                    $message .= ' Sıradaki güncelleme '.(string)$remote['version'].' rev '.normalize_release_revision($remote['release_revision']??0).' kuruluma hazır.';
                }
            } catch (Throwable $postInstallCheckError) {
                error_log('[IlkAdim][update-post-check] '.$postInstallCheckError->getMessage());
                $message .= ' Güncelleme kuruldu; sonraki sürüm kontrolü şu anda tamamlanamadı.';
            }

            ajax_response([
                'ok' => true,
                'action' => 'install',
                'message' => $message,
                'backup' => (string)($result['backup'] ?? ''),
                'database_backup' => (string)($result['database_backup'] ?? ''),
                'recovery_manifest' => (string)($result['recovery_manifest'] ?? ''),
                'local_version' => $newLocal,
                'local_revision' => $newLocalRevision,
                'remote_version' => (string)($remote['version'] ?? ''),
                'remote_revision' => normalize_release_revision($remote['release_revision'] ?? 0),
                'remote_name' => (string)($remote['name'] ?? ''),
                'commit' => (string)($remote['commit'] ?? ''),
                'update_available' => $hasNext,
            ]);
        }

        if ($action === 'manual_install') {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                ajax_response([
                    'ok' => false,
                    'message' => 'Manuel güncelleme yalnızca POST isteği ile yapılabilir.',
                ], 405);
            }

            $csrf=(string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? ($_POST['csrf'] ?? ''));
            if (!verify_csrf($csrf)) {
                ajax_response([
                    'ok' => false,
                    'message' => 'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.',
                ], 403);
            }

            $upload=$_FILES['update_zip']??null;
            if(!is_array($upload)){
                ajax_response(['ok'=>false,'message'=>'Manuel güncelleme ZIP dosyası seçilmedi.'],400);
            }

            $uploadError=(int)($upload['error']??UPLOAD_ERR_NO_FILE);
            if($uploadError!==UPLOAD_ERR_OK){
                $uploadMessages=[
                    UPLOAD_ERR_INI_SIZE=>'Manuel güncelleme ZIP dosyası sunucunun upload_max_filesize sınırını aşıyor.',
                    UPLOAD_ERR_FORM_SIZE=>'Manuel güncelleme ZIP dosyası form boyut sınırını aşıyor.',
                    UPLOAD_ERR_PARTIAL=>'Manuel güncelleme ZIP dosyası eksik yüklendi.',
                    UPLOAD_ERR_NO_FILE=>'Manuel güncelleme ZIP dosyası seçilmedi.',
                    UPLOAD_ERR_NO_TMP_DIR=>'Manuel güncelleme için sunucuda geçici klasör bulunamadı.',
                    UPLOAD_ERR_CANT_WRITE=>'Manuel güncelleme ZIP dosyası geçici alana yazılamadı.',
                    UPLOAD_ERR_EXTENSION=>'Manuel güncelleme yüklemesi sunucu eklentisi tarafından durduruldu.',
                ];
                ajax_response([
                    'ok'=>false,
                    'message'=>$uploadMessages[$uploadError]??'Manuel güncelleme ZIP yüklemesi tamamlanamadı.',
                ],400);
            }

            $originalName=basename((string)($upload['name']??''));
            $tmpName=(string)($upload['tmp_name']??'');
            $uploadSize=max(0,(int)($upload['size']??0));
            $packageLimits=update_package_limits(is_array($updateCfg)?$updateCfg:[]);
            if($originalName==='' || strtolower((string)pathinfo($originalName,PATHINFO_EXTENSION))!=='zip'){
                ajax_response(['ok'=>false,'message'=>'Manuel güncelleme için yalnızca .zip paket yüklenebilir.'],400);
            }
            if($tmpName==='' || !is_uploaded_file($tmpName)){
                ajax_response(['ok'=>false,'message'=>'Manuel güncelleme yüklemesi güvenilir bir HTTP dosya yüklemesi değil.'],400);
            }
            if($uploadSize<1 || $uploadSize>(int)$packageLimits['max_download_bytes']){
                ajax_response(['ok'=>false,'message'=>'Manuel güncelleme ZIP paketi boyut sınırını aşıyor veya boş.'],400);
            }

            $result=install_github_update(
                __DIR__,
                $gh,
                (array)($updateCfg['preserve'] ?? []),
                is_array($dbCfg)?$dbCfg:[],
                is_array($updateCfg)?$updateCfg:[],
                $tmpName
            );
            $package=(array)($result['remote']??[]);

            if (($result['retry_required'] ?? false) === true) {
                ajax_response([
                    'ok'=>true,
                    'action'=>'manual_install',
                    'retry_required'=>true,
                    'core_handoff'=>(bool)($result['core_handoff']??false),
                    'message'=>(string)($result['message']??'Updater çekirdeği yenilendi.'),
                    'backup'=>(string)($result['backup']??''),
                    'updater_backup'=>(string)($result['updater_backup']??''),
                    'recovery_manifest'=>(string)($result['recovery_manifest']??''),
                    'local_version'=>$local,
                    'local_revision'=>$localRevision,
                    'remote_version'=>(string)($package['version']??''),
                    'remote_revision'=>normalize_release_revision($package['release_revision']??0),
                    'remote_name'=>(string)($package['name']??''),
                    'commit'=>(string)($package['commit']??''),
                    'update_available'=>true,
                ]);
            }

            $newLocal=read_app_version();
            $newLocalRevision=read_local_release_revision(__DIR__,$newLocal);
            $message='Manuel güncelleme başarıyla kuruldu: '.$newLocal
                .($newLocalRevision>0?' rev '.$newLocalRevision:'').'.';
            $remote=[
                'version'=>$newLocal,
                'release_revision'=>$newLocalRevision,
                'name'=>'',
                'commit'=>'',
            ];
            $hasNext=false;
            try{
                $remote=next_remote_version_info($gh,$newLocal,$newLocalRevision,__DIR__);
                $hasNext=release_identity_is_newer($remote,$newLocal,$newLocalRevision);
                if($hasNext){
                    $message.=' Sıradaki GitHub güncellemesi '.(string)$remote['version']
                        .' rev '.normalize_release_revision($remote['release_revision']??0).' hazır.';
                }
            }catch(Throwable $postInstallCheckError){
                error_log('[IlkAdim][manual-update-post-check] '.$postInstallCheckError->getMessage());
                $message.=' GitHub sonraki sürüm kontrolü şu anda tamamlanamadı.';
            }

            ajax_response([
                'ok'=>true,
                'action'=>'manual_install',
                'message'=>$message,
                'backup'=>(string)($result['backup']??''),
                'database_backup'=>(string)($result['database_backup']??''),
                'recovery_manifest'=>(string)($result['recovery_manifest']??''),
                'local_version'=>$newLocal,
                'local_revision'=>$newLocalRevision,
                'remote_version'=>(string)($remote['version']??''),
                'remote_revision'=>normalize_release_revision($remote['release_revision']??0),
                'remote_name'=>(string)($remote['name']??''),
                'commit'=>(string)($remote['commit']??''),
                'update_available'=>$hasNext,
            ]);
        }

        ajax_response([
            'ok' => false,
            'message' => 'Geçersiz AJAX işlemi.',
        ], 400);
    } catch (Throwable $e) {
        error_log('[IlkAdim][update] '.$e->getMessage());
        ajax_response([
            'ok' => false,
            'message' => update_public_error_message($e),
        ], 500);
    }
}

$local = read_app_version();
$localRevision = read_local_release_revision(__DIR__,$local);
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
    <link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
    <link rel="stylesheet" href="guncelleme-manuel.css?v=1.2.6">
</head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<svg class="icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
    <symbol id="i-home" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10H15v-6H9v6H3Z"/></symbol>
    <symbol id="i-book" viewBox="0 0 24 24"><path d="M12 5C8 2 3 3 3 3v16s5-1 9 2c4-3 9-2 9-2V3s-5-1-9 2Zm0 0v16"/></symbol>
    <symbol id="i-star" viewBox="0 0 24 24"><path d="m12 3 3 6 7 1-5 5 1 7-6-3-6 3 1-7-5-5 7-1Z"/></symbol>
    <symbol id="i-user" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 22v-3a8 8 0 0 1 16 0v3"/></symbol>
    <symbol id="i-refresh" viewBox="0 0 24 24"><path d="M20 7v5h-5"/><path d="M4 17v-5h5"/><path d="M6.1 9A7 7 0 0 1 18.7 7M17.9 15A7 7 0 0 1 5.3 17"/></symbol>
    <symbol id="i-check" viewBox="0 0 24 24"><path d="m5 12 4 4L19 6"/></symbol>
    <symbol id="i-upload" viewBox="0 0 24 24"><path d="M12 16V4"/><path d="m7 9 5-5 5 5"/><path d="M5 20h14"/></symbol>
    <symbol id="i-close" viewBox="0 0 24 24"><path d="m6 6 12 12M18 6 6 18"/></symbol>
</svg>

<a class="skip-link" href="#screen">İçeriğe geç</a>

<div class="app-shell">
    <header class="app-topbar">
        <a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a>
        <div class="sa-page-actions">
            <a class="sa-page-action" href="guncelleme.php" aria-label="Güncellemeler"><svg><use href="#sa-bell"/></svg></a>
            <a class="sa-page-action" href="hesap-guvenligi.php" aria-label="Hesabım"><svg><use href="#sa-user"/></svg></a>
        </div>
    </header>

    <main id="screen" tabindex="-1">
        <div class="screen-content">
            <section class="subpage-intro">
                <span><svg><use href="#sa-refresh"/></svg></span>
                <h1>Uygulama Güncelleme</h1>
                <p>Yeni sürümler GitHub üzerinden otomatik bulunur ve güvenli sırayla kurulur.</p>
            </section>

            <section class="settings-block">
                <h2>Sürüm Bilgileri</h2>

                <div class="history-item">
                    <span><svg><use href="#sa-device"/></svg></span>
                    <div>
                        <strong>Kurulu sürüm</strong>
                        <small id="localVersion"><?=h($local)?><?= $localRevision>0 ? ' · rev '.(int)$localRevision : '' ?></small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-check"/></svg>
                </div>

                <div class="history-item">
                    <span><svg><use href="#sa-cloud"/></svg></span>
                    <div>
                        <strong>Sıradaki sürüm</strong>
                        <small><span id="remoteVersion">Kontrol ediliyor...</span><span id="remoteName"></span></small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-refresh"/></svg>
                </div>

                <div class="history-item">
                    <span><svg><use href="#sa-code"/></svg></span>
                    <div>
                        <strong>Hedef commit</strong>
                        <small id="commit">-</small>
                    </div>
                    <svg aria-hidden="true"><use href="#i-check"/></svg>
                </div>
            </section>

            <section class="weekly-summary" id="statusBox">
                <strong id="statusTitle">Güncelleme kontrol ediliyor</strong>
                <p id="statusText">Sıradaki güvenli sürüm kontrol ediliyor...</p>
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

            <button type="button" class="button manual-update-trigger full" id="manualUpdateButton">
                <svg aria-hidden="true"><use href="#i-upload"/></svg>
                Manuel Güncelle
            </button>

            <p class="little-note">Sunucuda yalnızca bir önceki uygulama sürümünün tek yedeği tutulur. Migration varsa ayrıca doğrulanmış DB snapshot ve SHA-256 recovery manifest oluşturulur. Otomatik restore yapılmaz; recovery bilgisi kontrollü geri dönüş içindir.</p>
        </div>
    </main>

    <div class="manual-update-modal" id="manualUpdateModal" hidden aria-hidden="true">
        <button type="button" class="manual-update-backdrop" data-manual-close aria-label="Manuel güncelleme penceresini kapat"></button>
        <section class="manual-update-dialog" role="dialog" aria-modal="true" aria-labelledby="manualUpdateTitle" aria-describedby="manualUpdateDescription">
            <header class="manual-update-header">
                <div class="manual-update-heading">
                    <span class="manual-update-icon"><svg aria-hidden="true"><use href="#i-upload"/></svg></span>
                    <div>
                        <small>Kurtarma ve çevrimdışı kurulum</small>
                        <h2 id="manualUpdateTitle">Manuel Güncelle</h2>
                    </div>
                </div>
                <button type="button" class="manual-update-close" data-manual-close aria-label="Kapat">
                    <svg aria-hidden="true"><use href="#i-close"/></svg>
                </button>
            </header>

            <div class="manual-update-body">
                <p id="manualUpdateDescription" class="manual-update-description">
                    Otomatik güncelleme çalışmadığında, tarafımızdan hazırlanan İlkAdım güncelleme ZIP paketini buradan yükleyebilirsin.
                </p>

                <div class="manual-update-safety">
                    <strong>Kurulumdan önce otomatik kontrol</strong>
                    <span>Sürüm ve revision eşleşmesi</span>
                    <span>Manifest ve gerçek dosya ağacı</span>
                    <span>ZIP yol ve boyut güvenliği</span>
                </div>

                <label class="manual-update-dropzone" id="manualUpdateDropzone" for="manualUpdateFile">
                    <input type="file" id="manualUpdateFile" name="update_zip" accept=".zip,application/zip" hidden>
                    <span class="manual-update-drop-icon"><svg aria-hidden="true"><use href="#i-upload"/></svg></span>
                    <strong>Güncelleme ZIP paketini seç</strong>
                    <small>Dosyayı buraya bırakabilir veya seçmek için tıklayabilirsin.</small>
                    <span class="manual-update-choose">ZIP Seç</span>
                </label>

                <div class="manual-update-file" id="manualUpdateFileCard" hidden>
                    <div>
                        <strong id="manualUpdateFileName">-</strong>
                        <small id="manualUpdateFileMeta">-</small>
                    </div>
                    <button type="button" id="manualUpdateClearFile">Değiştir</button>
                </div>

                <div class="manual-update-warning">
                    <strong>Güvenli kurulum</strong>
                    <p>Paket doğrulanmadan hiçbir uygulama dosyası değiştirilmez. Kurulum başlamadan önce uygulama yedeği, migration gerekiyorsa ayrıca veritabanı yedeği alınır. Daha eski veya aynı revizyonlu paket kabul edilmez.</p>
                </div>
            </div>

            <footer class="manual-update-footer">
                <button type="button" class="button soft" data-manual-close>Vazgeç</button>
                <button type="button" class="button primary" id="manualUpdateInstall" disabled>
                    <svg aria-hidden="true"><use href="#i-upload"/></svg>
                    ZIP'i Doğrula ve Kur
                </button>
            </footer>
        </section>
    </div>

    <nav class="app-nav" aria-label="Süper Admin hızlı erişim">
        <a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a>
        <a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a>
        <a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a>
        <a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a>
        <a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a>
    </nav>
</div>

<script src="guncelleme-auto.js?v=1.2.80"></script>
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
    const manualUpdateButton = document.getElementById('manualUpdateButton');
    const manualUpdateModal = document.getElementById('manualUpdateModal');
    const manualUpdateFile = document.getElementById('manualUpdateFile');
    const manualUpdateDropzone = document.getElementById('manualUpdateDropzone');
    const manualUpdateFileCard = document.getElementById('manualUpdateFileCard');
    const manualUpdateFileName = document.getElementById('manualUpdateFileName');
    const manualUpdateFileMeta = document.getElementById('manualUpdateFileMeta');
    const manualUpdateClearFile = document.getElementById('manualUpdateClearFile');
    const manualUpdateInstall = document.getElementById('manualUpdateInstall');
    const csrfToken = <?=json_encode($updateCsrf, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)?>;

    let busy = false;

    function setBusy(value, action = 'check') {
        busy = value;
        checkButton.disabled = value;
        installButton.disabled = value;
        manualUpdateButton.disabled = value;
        manualUpdateInstall.disabled = value || !manualUpdateFile.files.length;

        if (value) {
            if (action === 'manual') {
                statusTitle.textContent = 'Manuel güncelleme kuruluyor';
                statusText.textContent = 'ZIP paketi doğrulanıyor, yedekleniyor ve güvenli kurulum hazırlanıyor...';
                manualUpdateInstall.innerHTML = '<svg aria-hidden="true"><use href="#i-refresh"/></svg>Doğrulanıyor ve Kuruluyor...';
            } else if (action === 'install') {
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
            manualUpdateInstall.innerHTML = '<svg aria-hidden="true"><use href="#i-upload"/></svg>ZIP\'i Doğrula ve Kur';
            manualUpdateInstall.disabled = !manualUpdateFile.files.length;
        }
    }

    function showMessage(title, message) {
        messageTitle.textContent = title;
        messageText.textContent = message;
        messageBox.hidden = false;
    }

    function applyState(data) {
        if (data.local_version) {
            const localRevision = Number(data.local_revision || 0);
            localVersion.textContent = data.local_version + (localRevision > 0 ? ' · rev ' + localRevision : '');
        }

        const remoteRevision = Number(data.remote_revision || 0);
        remoteVersion.textContent = (data.remote_version || '-') + (remoteRevision > 0 ? ' · rev ' + remoteRevision : '');
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

    async function request(action, body = null) {
        const method = (action === 'install' || action === 'manual_install') ? 'POST' : 'GET';
        const url = 'guncelleme.php?ajax=1&action=' + encodeURIComponent(action);

        const response = await fetch(url, {
            method,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-Token': csrfToken,
                'Accept': 'application/json'
            },
            body: method === 'POST' ? body : null,
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
            let data;
            let handoffRetries = 0;
            while (true) {
                data = await request('install');
                if (data.retry_required === true && handoffRetries < 2) {
                    handoffRetries += 1;
                    statusTitle.textContent = 'Güncelleme çekirdeği yenilendi';
                    statusText.textContent = 'Yeni updater çekirdeğiyle kurulum otomatik yeniden başlatılıyor...';
                    await new Promise(resolve => setTimeout(resolve, 350));
                    continue;
                }
                break;
            }

            if (data && data.retry_required === true) {
                throw new Error(data.message || 'Updater çekirdeği yenilendi ancak otomatik yeniden deneme tamamlanamadı.');
            }

            renderInstallResult(data, 'İşlem tamamlandı');
        } catch (error) {
            statusTitle.textContent = 'Güncelleme kurulamadı';
            statusText.textContent = 'Kurulum sırasında bir hata oluştu.';
            showMessage('Kurulum hatası', error.message);
        } finally {
            setBusy(false);
        }
    }

    function formatBytes(bytes) {
        const value = Number(bytes || 0);
        if (!Number.isFinite(value) || value <= 0) return '0 KB';
        if (value < 1024 * 1024) return Math.max(1, Math.round(value / 1024)) + ' KB';
        return (value / (1024 * 1024)).toFixed(value >= 10 * 1024 * 1024 ? 0 : 1) + ' MB';
    }

    function openManualModal() {
        if (busy) return;
        manualUpdateModal.hidden = false;
        manualUpdateModal.setAttribute('aria-hidden', 'false');
        document.body.classList.add('manual-update-open');
        setTimeout(() => manualUpdateFile.focus(), 0);
    }

    function closeManualModal() {
        if (busy) return;
        manualUpdateModal.hidden = true;
        manualUpdateModal.setAttribute('aria-hidden', 'true');
        document.body.classList.remove('manual-update-open');
        manualUpdateButton.focus();
    }

    function syncManualFile() {
        const file = manualUpdateFile.files && manualUpdateFile.files[0] ? manualUpdateFile.files[0] : null;
        if (!file) {
            manualUpdateFileCard.hidden = true;
            manualUpdateDropzone.hidden = false;
            manualUpdateInstall.disabled = true;
            return;
        }

        if (!/\.zip$/i.test(file.name)) {
            manualUpdateFile.value = '';
            manualUpdateFileCard.hidden = true;
            manualUpdateDropzone.hidden = false;
            manualUpdateInstall.disabled = true;
            showMessage('Manuel güncelleme', 'Yalnızca .zip uzantılı İlkAdım güncelleme paketi seçebilirsin.');
            return;
        }

        manualUpdateFileName.textContent = file.name;
        manualUpdateFileMeta.textContent = formatBytes(file.size) + ' · ZIP güncelleme paketi';
        manualUpdateFileCard.hidden = false;
        manualUpdateDropzone.hidden = true;
        manualUpdateInstall.disabled = false;
    }

    function manualFormData() {
        const file = manualUpdateFile.files && manualUpdateFile.files[0] ? manualUpdateFile.files[0] : null;
        if (!file) throw new Error('Önce güncelleme ZIP paketini seç.');
        const body = new FormData();
        body.append('csrf', csrfToken);
        body.append('update_zip', file, file.name);
        return body;
    }

    function renderInstallResult(data, title) {
        applyState(data);
        statusTitle.textContent = 'Güncelleme tamamlandı';
        statusText.textContent = data.message || 'Güncelleme başarıyla kuruldu.';

        const backupParts = [];
        if (data.backup) backupParts.push('Uygulama: ' + data.backup);
        if (data.updater_backup) backupParts.push('Updater: ' + data.updater_backup);
        if (data.database_backup) backupParts.push('DB: ' + data.database_backup);
        if (data.recovery_manifest) backupParts.push('Recovery: ' + data.recovery_manifest);
        if (backupParts.length) {
            backupText.textContent = backupParts.join(' · ');
            backupText.hidden = false;
        }

        showMessage(title, data.message || 'Güncelleme başarıyla kuruldu.');
    }

    async function installManualUpdate() {
        if (busy) return;
        if (!manualUpdateFile.files.length) {
            syncManualFile();
            return;
        }

        messageBox.hidden = true;
        backupText.hidden = true;
        setBusy(true, 'manual');

        try {
            let data;
            let handoffRetries = 0;
            while (true) {
                data = await request('manual_install', manualFormData());
                if (data.retry_required === true && handoffRetries < 2) {
                    handoffRetries += 1;
                    statusTitle.textContent = 'Updater çekirdeği yenilendi';
                    statusText.textContent = 'Aynı ZIP paketi yeni çekirdekle otomatik yeniden doğrulanıyor...';
                    await new Promise(resolve => setTimeout(resolve, 350));
                    continue;
                }
                break;
            }

            if (data && data.retry_required === true) {
                throw new Error(data.message || 'Updater çekirdeği yenilendi ancak manuel kurulum yeniden başlatılamadı.');
            }

            renderInstallResult(data, 'Manuel güncelleme tamamlandı');
            manualUpdateModal.hidden = true;
            manualUpdateModal.setAttribute('aria-hidden', 'true');
            document.body.classList.remove('manual-update-open');
            manualUpdateFile.value = '';
            syncManualFile();
        } catch (error) {
            statusTitle.textContent = 'Manuel güncelleme kurulamadı';
            statusText.textContent = 'ZIP paketi doğrulama veya kurulum aşamasında durduruldu.';
            showMessage('Manuel güncelleme hatası', error.message);
        } finally {
            setBusy(false);
        }
    }

    manualUpdateButton.addEventListener('click', openManualModal);
    manualUpdateFile.addEventListener('change', syncManualFile);
    manualUpdateClearFile.addEventListener('click', () => {
        if (busy) return;
        manualUpdateFile.value = '';
        syncManualFile();
        manualUpdateFile.click();
    });
    manualUpdateInstall.addEventListener('click', installManualUpdate);
    manualUpdateModal.querySelectorAll('[data-manual-close]').forEach(button => {
        button.addEventListener('click', closeManualModal);
    });
    document.addEventListener('keydown', event => {
        if (event.key === 'Escape' && !manualUpdateModal.hidden && !busy) {
            closeManualModal();
        }
    });
    ['dragenter', 'dragover'].forEach(type => {
        manualUpdateDropzone.addEventListener(type, event => {
            event.preventDefault();
            manualUpdateDropzone.classList.add('is-dragging');
        });
    });
    ['dragleave', 'drop'].forEach(type => {
        manualUpdateDropzone.addEventListener(type, event => {
            event.preventDefault();
            manualUpdateDropzone.classList.remove('is-dragging');
        });
    });
    manualUpdateDropzone.addEventListener('drop', event => {
        const files = event.dataTransfer && event.dataTransfer.files ? event.dataTransfer.files : null;
        if (!files || files.length < 1) return;
        try {
            const transfer = new DataTransfer();
            transfer.items.add(files[0]);
            manualUpdateFile.files = transfer.files;
            syncManualFile();
        } catch (error) {
            manualUpdateFile.click();
        }
    });

    window.ILKADIM_UPDATE_UI = {
        request,
        applyState,
        setBusy,
        showMessage,
        isBusy: () => busy,
        statusTitle,
        statusText,
        elements: {
            checkButton,
            installButton,
            backupText,
            messageBox
        }
    };
    window.dispatchEvent(new Event('ilkadim-updater-ready'));
})();
</script>
</body>
</html>
