<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';

try {
    $pdo = db();
    $studentId = require_api_student();

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        $stmt = $pdo->prepare('SELECT email FROM ogrenciler WHERE id=? LIMIT 1');
        $stmt->execute([$studentId]);
        json_response([
            'ok'=>true,
            'email'=>(string)($stmt->fetchColumn() ?: ''),
            'csrf'=>csrf_token(),
        ]);
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    }

    $csrf = (string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? '');
    if (!verify_csrf($csrf)) {
        json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.'],419);
    }

    $raw = file_get_contents('php://input');
    if (!is_string($raw) || strlen($raw) > 100000) {
        json_response(['ok'=>false,'message'=>'Geçersiz istek.'],413);
    }
    $payload = json_decode($raw,true);
    if (!is_array($payload)) {
        json_response(['ok'=>false,'message'=>'Geçersiz JSON.'],400);
    }

    $email = mb_strtolower(trim((string)($payload['email'] ?? '')));
    $current = (string)($payload['current_password'] ?? '');
    $new = (string)($payload['new_password'] ?? '');
    $repeat = (string)($payload['new_password_repeat'] ?? '');

    if (!filter_var($email,FILTER_VALIDATE_EMAIL)) {
        json_response(['ok'=>false,'message'=>'Geçerli bir e-posta adresi yazın.'],422);
    }
    if ($current === '') {
        json_response(['ok'=>false,'message'=>'Mevcut şifrenizi yazın.'],422);
    }

    $stmt = $pdo->prepare('SELECT sifre_hash FROM ogrenciler WHERE id=? LIMIT 1');
    $stmt->execute([$studentId]);
    $hash = (string)($stmt->fetchColumn() ?: '');
    if ($hash === '' || !password_verify($current,$hash)) {
        json_response(['ok'=>false,'message'=>'Mevcut şifre doğru değil.'],422);
    }

    $dup = $pdo->prepare('SELECT id FROM ogrenciler WHERE email=? AND id<>? LIMIT 1');
    $dup->execute([$email,$studentId]);
    if ($dup->fetchColumn()) {
        json_response(['ok'=>false,'message'=>'Bu e-posta başka bir öğrenci hesabında kullanılıyor.'],409);
    }

    if ($new !== '') {
        if (mb_strlen($new) < 8) {
            json_response(['ok'=>false,'message'=>'Yeni şifre en az 8 karakter olmalıdır.'],422);
        }
        if ($new !== $repeat) {
            json_response(['ok'=>false,'message'=>'Yeni şifreler eşleşmiyor.'],422);
        }
        $newHash = password_hash($new,PASSWORD_DEFAULT);
        if (!is_string($newHash) || $newHash === '') throw new RuntimeException('Şifre oluşturulamadı.');

        $pdo->beginTransaction();
        try {
            $pdo->prepare('UPDATE ogrenciler SET email=?,sifre_hash=? WHERE id=?')->execute([$email,$newHash,$studentId]);
            try { $pdo->prepare('DELETE FROM ogrenci_oturum_tokenlari WHERE ogrenci_id=?')->execute([$studentId]); } catch (Throwable) {}
            $pdo->commit();
        } catch (Throwable $e) {
            if ($pdo->inTransaction()) $pdo->rollBack();
            throw $e;
        }
        clear_remember_cookie();
        $message = 'E-posta ve şifre güncellendi.';
    } else {
        $pdo->prepare('UPDATE ogrenciler SET email=? WHERE id=?')->execute([$email,$studentId]);
        $message = 'E-posta adresi güncellendi.';
    }

    json_response(['ok'=>true,'message'=>$message,'email'=>$email,'csrf'=>csrf_token()]);
} catch (Throwable $e) {
    json_response(['ok'=>false,'message'=>'Hesap bilgileri güncellenemedi.','detail'=>$e->getMessage()],500);
}
