<?php
declare(strict_types=1);

$root = __DIR__;
$lockFile = $root . '/storage/install.lock';
$message = '';
$error = '';

function h(string $v): string { return htmlspecialchars($v, ENT_QUOTES, 'UTF-8'); }
function run_sql_file(PDO $pdo, string $path): void {
    $buffer = '';
    foreach (file($path, FILE_IGNORE_NEW_LINES) ?: [] as $line) {
        $trim = trim($line);
        if ($trim === '' || str_starts_with($trim, '--')) continue;
        $buffer .= $line . "\n";
        if (str_ends_with(rtrim($line), ';')) {
            $sql = trim($buffer);
            $buffer = '';
            if ($sql !== '') $pdo->exec($sql);
        }
    }
    if (trim($buffer) !== '') $pdo->exec($buffer);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        if (!extension_loaded('pdo_mysql')) throw new RuntimeException('Sunucuda PHP pdo_mysql eklentisi açık olmalı.');
        $db = [
            'host' => trim((string)($_POST['db_host'] ?? 'localhost')),
            'port' => max(1, (int)($_POST['db_port'] ?? 3306)),
            'name' => preg_replace('/[^a-zA-Z0-9_]/', '', (string)($_POST['db_name'] ?? 'ilk_adim')),
            'user' => (string)($_POST['db_user'] ?? ''),
            'pass' => (string)($_POST['db_pass'] ?? ''),
        ];
        if ($db['name'] === '' || $db['user'] === '') throw new RuntimeException('Veritabanı adı ve kullanıcı adı zorunlu.');

        $githubOwner = trim((string)($_POST['github_owner'] ?? ''));
        $githubRepo = trim((string)($_POST['github_repo'] ?? ''));
        $githubBranch = trim((string)($_POST['github_branch'] ?? 'main')) ?: 'main';
        $githubToken = trim((string)($_POST['github_token'] ?? ''));

        $local = "<?php\nreturn " . var_export([
            'db' => $db,
            'github' => [
                'owner' => $githubOwner,
                'repo' => $githubRepo,
                'branch' => $githubBranch,
                'token' => $githubToken,
            ],
        ], true) . ";\n";
        if (file_put_contents($root . '/config/local.php', $local, LOCK_EX) === false) throw new RuntimeException('config/local.php yazılamadı.');

        $dsnServer = "mysql:host={$db['host']};port={$db['port']};charset=utf8mb4";
        $server = new PDO($dsnServer, $db['user'], $db['pass'], [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]);
        try {
            $server->exec("CREATE DATABASE IF NOT EXISTS `{$db['name']}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        } catch (Throwable $createError) {
        }
        $pdo = new PDO($dsnServer . ';dbname=' . $db['name'], $db['user'], $db['pass'], [
            PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
        ]);
        run_sql_file($pdo, $root . '/database/schema.sql');
        run_sql_file($pdo, $root . '/database/seed.sql');
        file_put_contents($lockFile, date(DATE_ATOM) . "\n", LOCK_EX);
        $message = 'Kurulum tamamlandı. MySQL tabloları ve başlangıç verileri hazır.';
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

$locked = is_file($lockFile) && $_SERVER['REQUEST_METHOD'] !== 'POST';
?><!doctype html>
<html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>İlkAdım Kurulum</title></head>
<body style="font-family:system-ui,sans-serif;max-width:760px;margin:40px auto;padding:0 18px;line-height:1.5">
<h1>İlkAdım PHP + MySQL Kurulum</h1>
<?php if ($message): ?><p style="padding:12px;background:#e8fff0;border:1px solid #96d7ab"><?=h($message)?></p><p><a href="index.php">Uygulamayı aç</a> · <a href="guncelleme.php">Güncelleme sayfası</a></p><?php endif; ?>
<?php if ($error): ?><p style="padding:12px;background:#fff0f0;border:1px solid #e4a5a5"><strong>Hata:</strong> <?=h($error)?></p><?php endif; ?>
<?php if ($locked && !$message): ?><p>Kurulum daha önce tamamlanmış görünüyor. Yeniden kurulum gerekiyorsa önce <code>storage/install.lock</code> dosyasını kaldır.</p><p><a href="index.php">Uygulamaya dön</a></p><?php elseif (!$message): ?>
<p>Bu sayfa yalnızca ilk kurulum içindir. Login sistemi daha sonra eklenecek; şimdilik sistem tek demo öğrenciyle çalışır.</p>
<form method="post">
<fieldset><legend>MySQL</legend>
<p><label>Host<br><input name="db_host" value="localhost" required></label></p>
<p><label>Port<br><input name="db_port" value="3306" inputmode="numeric" required></label></p>
<p><label>Veritabanı adı<br><input name="db_name" value="ilk_adim" required></label></p>
<p><label>Kullanıcı adı<br><input name="db_user" required></label></p>
<p><label>Şifre<br><input name="db_pass" type="password"></label></p>
</fieldset>
<fieldset><legend>GitHub güncelleme ayarları</legend>
<p><label>Owner / Organization<br><input name="github_owner" value="moguzhanuyanik-collab"></label></p>
<p><label>Repository<br><input name="github_repo" value="masal"></label></p>
<p><label>Branch<br><input name="github_branch" value="main"></label></p>
<p><label>GitHub Token (private repo ise)<br><input name="github_token" type="password" autocomplete="off"></label></p>
</fieldset>
<p><button type="submit">Kurulumu Başlat</button></p>
</form>
<?php endif; ?>
</body></html>
