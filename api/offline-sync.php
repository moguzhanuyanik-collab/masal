<?php
declare(strict_types=1);

require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';
require dirname(__DIR__) . '/src/normalized.php';

header('Cache-Control: private, no-store, max-age=0');
header('Pragma: no-cache');

function pwa_progress_union(array $existing, array $offline): array {
    $seen = [];
    $output = [];
    foreach (array_merge($existing, $offline) as $item) {
        if (!is_string($item) || $item === '' || strlen($item) > 190) continue;
        if (isset($seen[$item])) continue;
        $seen[$item] = true;
        $output[] = $item;
    }
    return $output;
}

function pwa_event_union(array $existing, array $offline): array {
    $seen = [];
    $output = [];
    foreach (array_merge($existing, $offline) as $item) {
        if (!is_array($item)) continue;
        $key = hash('sha256', (string)json_encode($item, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
        if (isset($seen[$key])) continue;
        $seen[$key] = true;
        $output[] = $item;
    }
    return $output;
}

function pwa_merge_progress(array $server, array $local, array $completedGames): array {
    foreach (['steps','days','claimed','favorites'] as $field) {
        $server[$field] = pwa_progress_union(
            is_array($server[$field] ?? null) ? $server[$field] : [],
            is_array($local[$field] ?? null) ? $local[$field] : []
        );
    }

    $server['games'] = pwa_progress_union(
        is_array($server['games'] ?? null) ? $server['games'] : [],
        array_merge(
            is_array($local['games'] ?? null) ? $local['games'] : [],
            $completedGames
        )
    );

    foreach (['attempts','history','readings'] as $field) {
        $server[$field] = pwa_event_union(
            is_array($server[$field] ?? null) ? $server[$field] : [],
            is_array($local[$field] ?? null) ? $local[$field] : []
        );
    }

    $usage = is_array($server['usage'] ?? null) ? $server['usage'] : [];
    foreach ((is_array($local['usage'] ?? null) ? $local['usage'] : []) as $date=>$seconds) {
        if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', (string)$date)) continue;
        if (!is_numeric($seconds)) continue;
        $usage[$date] = max((float)($usage[$date] ?? 0), (float)$seconds);
    }
    $server['usage'] = $usage;
    return $server;
}

try {
    $pdo = db();
    $studentId = require_api_student();

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        json_response([
            'ok' => true,
            'student_id' => $studentId,
            'csrf' => csrf_token()
        ]);
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        json_response(['ok'=>false,'message'=>'Desteklenmeyen istek.'], 405);
    }

    if (!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? ''))) {
        json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız.'], 403);
    }

    $raw = file_get_contents('php://input');
    if (!is_string($raw) || strlen($raw) > 2200000) {
        json_response(['ok'=>false,'message'=>'Kayıt çok büyük veya geçersiz.'], 413);
    }

    $payload = json_decode($raw, true);
    $operation = is_array($payload) ? (string)($payload['op_id'] ?? '') : '';
    $claimedStudent = is_array($payload) ? (int)($payload['student_id'] ?? 0) : 0;

    if (!preg_match('/^[a-f0-9-]{36}$/i', $operation)
        || $claimedStudent !== $studentId
        || !is_array($payload['state'] ?? null)
        || !is_array($payload['games'] ?? null)) {
        json_response(['ok'=>false,'message'=>'Çevrimdışı kayıt doğrulanamadı.'], 400);
    }

    $local = $payload['state'];
    $games = array_values(array_filter($payload['games'], static function($item): bool {
        return is_string($item) && (bool)preg_match('/^[a-z0-9_-]{1,50}$/i', $item);
    }));

    $pdo->beginTransaction();
    try {
        $lock = $pdo->prepare('SELECT id FROM ogrenciler WHERE id=? AND aktif=1 FOR UPDATE');
        $lock->execute([$studentId]);
        if (!$lock->fetchColumn()) throw new RuntimeException('Öğrenci hesabı bulunamadı.');

        $check = $pdo->prepare('SELECT 1 FROM pwa_sync_islemleri WHERE ogrenci_id=? AND islem_anahtari=?');
        $check->execute([$studentId, $operation]);
        $alreadySynced = (bool)$check->fetchColumn();

        if (!$alreadySynced) {
            $state = load_student_state($pdo, $studentId);
            $merged = pwa_merge_progress($state, $local, $games);
            $pdo->prepare('INSERT INTO pwa_sync_islemleri (ogrenci_id,islem_anahtari) VALUES (?,?)')
                ->execute([$studentId, $operation]);
            save_student_state($pdo, $studentId, $merged);
            normalized_sync($pdo, $studentId, $merged);
        }

        $pdo->commit();
        $saved = load_student_state($pdo, $studentId);
        json_response([
            'ok' => true,
            'student_id' => $studentId,
            'already_synced' => $alreadySynced,
            'state' => $saved,
            'summary' => normalized_summary($pdo, $studentId),
            'saved_at' => date(DATE_ATOM)
        ]);
    } catch (Throwable $error) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        throw $error;
    }
} catch (Throwable $error) {
    error_log('IlkAdim offline sync: ' . $error->getMessage());
    json_response(['ok'=>false,'message'=>'Eşitleme şu anda yapılamadı; kayıtlar cihazda saklanıyor.'], 500);
}
