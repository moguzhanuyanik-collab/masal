<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';

try {
    $pdo=db();
    $user=authenticated_user();
    if (!$user) json_response(['ok'=>false,'message'=>'Oturum süresi doldu.','auth_required'=>true],401);
    $userId=(int)$user['id'];

    if ($_SERVER['REQUEST_METHOD']==='GET') {
        json_response([
            'ok'=>true,
            'email'=>(string)$user['email'],
            'roles'=>$user['roles']??[],
            'primary_role'=>(string)($user['ana_rol']??''),
            'csrf'=>csrf_token(),
        ]);
    }

    if ($_SERVER['REQUEST_METHOD']!=='POST') {
        json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
    }

    if (!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN']??''))) {
        json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.'],419);
    }

    $raw=file_get_contents('php://input');
    if (!is_string($raw)||strlen($raw)>100000) json_response(['ok'=>false,'message'=>'Geçersiz istek.'],413);
    $payload=json_decode($raw,true);
    if (!is_array($payload)) json_response(['ok'=>false,'message'=>'Geçersiz JSON.'],400);

    $email=mb_strtolower(trim((string)($payload['email']??'')));
    $current=(string)($payload['current_password']??'');
    $new=(string)($payload['new_password']??'');
    $repeat=(string)($payload['new_password_repeat']??'');

    if (!filter_var($email,FILTER_VALIDATE_EMAIL)) json_response(['ok'=>false,'message'=>'Geçerli bir e-posta adresi yazın.'],422);
    if ($current==='') json_response(['ok'=>false,'message'=>'Mevcut şifrenizi yazın.'],422);

    $stmt=$pdo->prepare('SELECT sifre_hash FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
    $stmt->execute([$userId]);
    $hash=(string)($stmt->fetchColumn()?:'');
    if ($hash===''||!password_verify($current,$hash)) {
        json_response(['ok'=>false,'message'=>'Mevcut şifre doğru değil.'],422);
    }

    $dup=$pdo->prepare('SELECT id FROM kullanicilar WHERE email=? AND id<>? LIMIT 1');
    $dup->execute([$email,$userId]);
    if ($dup->fetchColumn()) json_response(['ok'=>false,'message'=>'Bu e-posta başka bir kullanıcı hesabında kullanılıyor.'],409);

    $studentId=auth_student_id_for_user($pdo,$userId);
    if ($studentId!==null) {
        $dupStudent=$pdo->prepare('SELECT id FROM ogrenciler WHERE email=? AND id<>? LIMIT 1');
        $dupStudent->execute([$email,$studentId]);
        if ($dupStudent->fetchColumn()) json_response(['ok'=>false,'message'=>'Bu e-posta başka bir öğrenci hesabında kullanılıyor.'],409);
    }

    $newHash=null;
    if ($new!=='') {
        if (mb_strlen($new)<8) json_response(['ok'=>false,'message'=>'Yeni şifre en az 8 karakter olmalıdır.'],422);
        if ($new!==$repeat) json_response(['ok'=>false,'message'=>'Yeni şifreler eşleşmiyor.'],422);
        $newHash=password_hash($new,PASSWORD_DEFAULT);
        if (!is_string($newHash)||$newHash==='') throw new RuntimeException('Şifre oluşturulamadı.');
    }

    $pdo->beginTransaction();
    try {
        if ($newHash!==null) {
            $pdo->prepare('UPDATE kullanicilar SET email=?,sifre_hash=? WHERE id=?')->execute([$email,$newHash,$userId]);
            if ($studentId!==null) {
                $pdo->prepare('UPDATE ogrenciler SET email=?,sifre_hash=? WHERE id=?')->execute([$email,$newHash,$studentId]);
            }
            $pdo->prepare('DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id=?')->execute([$userId]);
            if ($studentId!==null && auth_runtime_table_exists($pdo,'ogrenci_oturum_tokenlari')) {
                $pdo->prepare('DELETE FROM ogrenci_oturum_tokenlari WHERE ogrenci_id=?')->execute([$studentId]);
            }
        } else {
            $pdo->prepare('UPDATE kullanicilar SET email=? WHERE id=?')->execute([$email,$userId]);
            if ($studentId!==null) $pdo->prepare('UPDATE ogrenciler SET email=? WHERE id=?')->execute([$email,$studentId]);
        }
        $pdo->commit();
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    if ($newHash!==null) clear_remember_cookie($pdo);
    auth_audit($pdo,$userId,$userId,'hesap_guncelleme',$newHash!==null?'E-posta ve şifre güncellendi':'E-posta güncellendi');

    json_response([
        'ok'=>true,
        'message'=>$newHash!==null?'E-posta ve şifre güncellendi.':'E-posta adresi güncellendi.',
        'email'=>$email,
        'csrf'=>csrf_token()
    ]);
} catch (Throwable $e) {
    error_log('IlkAdim account: '.$e->getMessage());
    json_response(['ok'=>false,'message'=>'Hesap bilgileri güncellenemedi.'],500);
}
