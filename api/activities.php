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

        $progress = [];
        try {
            $progressStmt = $pdo->prepare("SELECT oyun_kodu,sonraki_soru_indeksi,tamamlandi FROM etkinlik_ilerleme WHERE ogrenci_id=?");
            $progressStmt->execute([$studentId]);
            foreach ($progressStmt->fetchAll() as $row) {
                $progress[(string)$row['oyun_kodu']] = [
                    'next_round'=>(int)$row['sonraki_soru_indeksi'],
                    'completed'=>(int)$row['tamamlandi']===1,
                ];
            }
            $progressStmt->closeCursor();
        } catch (Throwable) {}

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
                'progress'=>$progress[(string)$game['kod']] ?? ['next_round'=>0,'completed'=>false],
                'questions'=>$questions,
            ];
        }
        json_response(['ok'=>true,'games'=>$out,'csrf'=>csrf_token()]);
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    }

    if (!verify_csrf($_SERVER['HTTP_X_CSRF_TOKEN'] ?? null)) {
        json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.'],403);
    }

    $raw = file_get_contents('php://input');
    if (!is_string($raw) || strlen($raw) > 20000) {
        json_response(['ok'=>false,'message'=>'Geçersiz veya çok büyük istek.'],413);
    }
    $payload = json_decode($raw, true);
    $gameCode = is_array($payload) ? trim((string)($payload['game'] ?? '')) : '';
    if (!preg_match('/^[a-z0-9_-]{1,50}$/i', $gameCode)) {
        json_response(['ok'=>false,'message'=>'Geçersiz oyun kodu.'],400);
    }

    $check = $pdo->prepare("SELECT o.id,(SELECT COUNT(*) FROM etkinlik_sorulari s WHERE s.oyun_id=o.id AND s.aktif=1) soru_sayisi FROM etkinlik_oyunlari o WHERE o.kod=? AND o.aktif=1 LIMIT 1");
    $check->execute([$gameCode]);
    $gameRow=$check->fetch();
    $check->closeCursor();
    if (!is_array($gameRow)) {
        json_response(['ok'=>false,'message'=>'Oyun bulunamadı.'],404);
    }

    $hasProgress=is_array($payload) && array_key_exists('next_round',$payload);
    $nextRound=$hasProgress?(int)$payload['next_round']:0;
    $questionCount=max(0,(int)($gameRow['soru_sayisi']??0));
    if($nextRound<0 || $nextRound>$questionCount){
        json_response(['ok'=>false,'message'=>'Geçersiz etkinlik ilerlemesi.'],400);
    }

    $resetProgress=is_array($payload) && ($payload['reset_progress']??false)===true;
    $markCompleted=is_array($payload)
        ? (($payload['completed']??false)===true || !$hasProgress)
        : true;

    try {
        if($resetProgress){
            $progressStmt=$pdo->prepare("INSERT INTO etkinlik_ilerleme (ogrenci_id,oyun_kodu,sonraki_soru_indeksi,tamamlandi)
                                         VALUES (?,?,0,0)
                                         ON DUPLICATE KEY UPDATE sonraki_soru_indeksi=0");
            $progressStmt->execute([$studentId,$gameCode]);
        }else{
            $progressStmt=$pdo->prepare("INSERT INTO etkinlik_ilerleme (ogrenci_id,oyun_kodu,sonraki_soru_indeksi,tamamlandi)
                                         VALUES (?,?,?,?)
                                         ON DUPLICATE KEY UPDATE
                                           sonraki_soru_indeksi=GREATEST(sonraki_soru_indeksi,VALUES(sonraki_soru_indeksi)),
                                           tamamlandi=GREATEST(tamamlandi,VALUES(tamamlandi))");
            $progressStmt->execute([$studentId,$gameCode,$nextRound,$markCompleted?1:0]);
        }
    } catch (Throwable $e) {
        error_log('[IlkAdim][activities-progress] '.$e->getMessage());
        if($hasProgress){
            json_response(['ok'=>false,'message'=>'Etkinlik ilerlemesi kaydedilemedi.'],500);
        }
    }

    if($markCompleted){
        $stmt = $pdo->prepare("INSERT INTO oyun_tamamlamalari (ogrenci_id,oyun_kodu,tamamlanma_tarihi)
                               VALUES (?,?,NOW())
                               ON DUPLICATE KEY UPDATE tamamlanma_tarihi=VALUES(tamamlanma_tarihi)");
        $stmt->execute([$studentId,$gameCode]);
    }

    json_response([
        'ok'=>true,
        'game'=>$gameCode,
        'completed'=>$markCompleted,
        'next_round'=>$nextRound,
        'question_count'=>$questionCount,
    ]);
} catch (Throwable $e) {
    error_log('[IlkAdim][activities] '.$e->getMessage());
    json_response(['ok'=>false,'message'=>'Etkinlik verileri şu anda alınamadı. Lütfen tekrar deneyin.'],500);
}
