<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';

header('Content-Type: application/javascript; charset=utf-8');
header('Cache-Control: no-store, max-age=0');

$studentId = authenticated_student_id();
if ($studentId === null) {
    echo "window.location.replace('login.php');\n";
    exit;
}

$root = dirname(__DIR__);
$dbConnected = false;
$lessons = [];
$state = null;
$summary = null;
$error = null;

try {
    $pdo = db();
    $rows = $pdo->query('SELECT * FROM dersler WHERE aktif=1 ORDER BY sira,id')->fetchAll();
    $moduleStmt = $pdo->prepare('SELECT * FROM ders_modulleri WHERE ders_id=? AND aktif=1 ORDER BY sira,id');

    foreach ($rows as $row) {
        $moduleStmt->execute([(int)$row['id']]);
        $modules = [];

        foreach ($moduleStmt->fetchAll() as $m) {
            $opts = json_decode((string)$m['secenekler_json'], true);
            $modules[] = [
                'title'=>$m['baslik'],
                'subtitle'=>$m['alt_baslik'],
                'emoji'=>$m['emoji'],
                'reading'=>$m['okuma_metni'],
                'example'=>$m['ornek_metni'],
                'question'=>$m['soru'],
                'options'=>is_array($opts) ? $opts : [],
                'answer'=>(int)$m['dogru_cevap_indeksi'],
                'explanation'=>$m['aciklama'],
            ];
        }

        $lessons[] = [
            'id'=>$row['kod'],
            'name'=>$row['ad'],
            'hours'=>(int)$row['haftalik_saat'],
            'emoji'=>$row['emoji'],
            'art'=>$row['sanat'],
            'artClass'=>$row['sanat_sinifi'],
            'color'=>$row['renk'],
            'ink'=>$row['yazi_renk'],
            'description'=>$row['aciklama'],
            'modules'=>$modules,
        ];
    }

    $state = load_student_state($pdo, $studentId);
    $summary = function_exists('student_database_summary')
        ? student_database_summary($pdo, $studentId)
        : null;
    $dbConnected = true;
} catch (Throwable $e) {
    $error = $e->getMessage();
    $fallback = $root . '/database/lessons.json';
    if (is_file($fallback)) {
        $decoded = json_decode((string)file_get_contents($fallback), true);
        if (is_array($decoded)) $lessons = $decoded;
    }
}

$flags = JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES;
echo 'window.LESSONS=' . json_encode($lessons, $flags) . ";\n";
echo 'window.ILKADIM_CURRENT_STUDENT_ID=' . json_encode($studentId, $flags) . ";\n";
echo 'window.ILKADIM_DB_CONNECTED=' . ($dbConnected ? 'true' : 'false') . ";\n";
echo 'window.ILKADIM_DB_ERROR=' . json_encode($error, $flags) . ";\n";
echo 'window.ILKADIM_DB_SUMMARY=' . json_encode($summary, $flags) . ";\n";

if ($dbConnected && is_array($state)) {
    echo 'window.ILKADIM_SERVER_STATE=' . json_encode($state, $flags) . ";\n";
    echo "try{localStorage.setItem('ilk-adim-profile',JSON.stringify(window.ILKADIM_SERVER_STATE));}catch(e){}\n";
}
