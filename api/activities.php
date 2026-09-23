<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';

try {
    $pdo = db();
    $studentId = require_api_student();

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        $games = $pdo->query("SELECT id,kod,ad,emoji,kategori,sure,renk,aciklama,sira FROM etkinlik_oyunlari WHERE aktif=1 ORDER BY sira,id")->fetchAll();
        $questionStmt = $pdo->prepare("SELECT sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama FROM etkinlik_sorulari WHERE oyun_id=? AND aktif=1 ORDER BY sira,id");
        $completedStmt = $pdo->prepare("SELECT oyun_kodu FROM oyun_tamamlamalari WHERE ogrenci_id=?");
        $completedStmt->execute([$studentId]);
        $completed = array_fill_keys(array_map('strval', $completedStmt->fetchAll(PDO::FETCH_COLUMN)), true);

        $out = [];
        foreach ($games as $game) {
            $questionStmt->execute([(int)$game['id']]);
            $questions = [];
            foreach ($questionStmt->fetchAll() as $q) {
                $options = json_decode((string)$q['secenekler_json'], true);
                $questions[] = [
                    'order'=>(int)$q['sira'],
                    'visual'=>(string)$q['gorsel'],
                    'question'=>(string)$q['soru'],
                    'options'=>is_array($options) ? array_values($options) : [],
                    'answer'=>(int)$q['dogru_cevap_indeksi'],
                    'result'=>(string)$q['sonuc'],
                    'explanation'=>(string)($q['aciklama'] ?? ''),
                ];
            }
            $out[] = [
                'id'=>(string)$game['kod'],
                'name'=>(string)$game['ad'],
                'emoji'=>(string)$game['emoji'],
                'type'=>(string)$game['kategori'],
                'time'=>(string)$game['sure'],
                'color'=>(string)$game['renk'],
                'description'=>(string)$game['aciklama'],
                'completed'=>isset($completed[(string)$game['kod']]),
                'questions'=>$questions,
            ];
        }
        json_response(['ok'=>true,'games'=>$out]);
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    }

    $raw = file_get_contents('php://input');
    $payload = json_decode(is_string($raw) ? $raw : '', true);
    $gameCode = is_array($payload) ? trim((string)($payload['game'] ?? '')) : '';
    if (!preg_match('/^[a-z0-9_-]{1,50}$/i', $gameCode)) {
        json_response(['ok'=>false,'message'=>'Geçersiz oyun kodu.'],400);
    }

    $check = $pdo->prepare("SELECT COUNT(*) FROM etkinlik_oyunlari WHERE kod=? AND aktif=1");
    $check->execute([$gameCode]);
    if ((int)$check->fetchColumn() < 1) {
        json_response(['ok'=>false,'message'=>'Oyun bulunamadı.'],404);
    }

    $stmt = $pdo->prepare("INSERT INTO oyun_tamamlamalari (ogrenci_id,oyun_kodu,tamamlanma_tarihi)
                           VALUES (?,?,NOW())
                           ON DUPLICATE KEY UPDATE tamamlanma_tarihi=VALUES(tamamlanma_tarihi)");
    $stmt->execute([$studentId,$gameCode]);

    json_response(['ok'=>true,'game'=>$gameCode,'completed'=>true]);
} catch (Throwable $e) {
    json_response(['ok'=>false,'message'=>'Etkinlik verileri alınamadı.','detail'=>$e->getMessage()],500);
}
