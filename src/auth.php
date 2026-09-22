<?php
declare(strict_types=1);

if (!function_exists('app_session_start')) {
    function app_session_start(): void {
        if (session_status() === PHP_SESSION_ACTIVE) return;
        $secure = (!empty($_SERVER['HTTPS']) && strtolower((string)$_SERVER['HTTPS']) !== 'off')
            || strtolower((string)($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '')) === 'https';
        session_name('ilkadim_session');
        session_set_cookie_params([
            'lifetime'=>0,'path'=>'/','secure'=>$secure,'httponly'=>true,'samesite'=>'Lax'
        ]);
        session_start();
    }
}

if (!function_exists('auth_cookie_secure')) {
    function auth_cookie_secure(): bool {
        return (!empty($_SERVER['HTTPS']) && strtolower((string)$_SERVER['HTTPS']) !== 'off')
            || strtolower((string)($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '')) === 'https';
    }
}

if (!function_exists('csrf_token')) {
    function csrf_token(): string {
        app_session_start();
        if (empty($_SESSION['csrf_token']) || !is_string($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
        return $_SESSION['csrf_token'];
    }
}

if (!function_exists('verify_csrf')) {
    function verify_csrf(?string $token): bool {
        app_session_start();
        return is_string($token)
            && isset($_SESSION['csrf_token'])
            && is_string($_SESSION['csrf_token'])
            && hash_equals($_SESSION['csrf_token'], $token);
    }
}

if (!function_exists('auth_accounts_ready')) {
    function auth_accounts_ready(PDO $pdo): bool {
        try {
            $q = $pdo->query("SELECT COUNT(*) FROM ogrenciler WHERE aktif=1 AND email IS NOT NULL AND email<>'' AND sifre_hash IS NOT NULL AND sifre_hash<>''");
            return (int)$q->fetchColumn() > 0;
        } catch (Throwable) {
            return false;
        }
    }
}

if (!function_exists('remember_student')) {
    function remember_student(PDO $pdo, int $studentId): void {
        $raw = bin2hex(random_bytes(32));
        $hash = hash('sha256', $raw);
        $expires = (new DateTimeImmutable('+30 days'))->format('Y-m-d H:i:s');
        $stmt = $pdo->prepare('INSERT INTO ogrenci_oturum_tokenlari (ogrenci_id, token_hash, son_kullanma_tarihi) VALUES (?, ?, ?)');
        $stmt->execute([$studentId, $hash, $expires]);
        setcookie('ilkadim_remember', $raw, [
            'expires'=>time()+30*86400,'path'=>'/','secure'=>auth_cookie_secure(),
            'httponly'=>true,'samesite'=>'Lax'
        ]);
    }
}

if (!function_exists('clear_remember_cookie')) {
    function clear_remember_cookie(?PDO $pdo = null): void {
        $raw = (string)($_COOKIE['ilkadim_remember'] ?? '');
        if ($raw !== '' && $pdo instanceof PDO) {
            try {
                $stmt = $pdo->prepare('DELETE FROM ogrenci_oturum_tokenlari WHERE token_hash=?');
                $stmt->execute([hash('sha256', $raw)]);
            } catch (Throwable) {}
        }
        setcookie('ilkadim_remember', '', [
            'expires'=>time()-3600,'path'=>'/','secure'=>auth_cookie_secure(),
            'httponly'=>true,'samesite'=>'Lax'
        ]);
        unset($_COOKIE['ilkadim_remember']);
    }
}

if (!function_exists('authenticated_student_id')) {
    function authenticated_student_id(): ?int {
        app_session_start();

        $sid = (int)($_SESSION['ogrenci_id'] ?? 0);
        if ($sid > 0) return $sid;

        $raw = (string)($_COOKIE['ilkadim_remember'] ?? '');
        if ($raw === '') return null;

        try {
            $pdo = db();
            $stmt = $pdo->prepare("SELECT t.ogrenci_id
                FROM ogrenci_oturum_tokenlari t
                INNER JOIN ogrenciler o ON o.id=t.ogrenci_id
                WHERE t.token_hash=? AND t.son_kullanma_tarihi>NOW() AND o.aktif=1
                LIMIT 1");
            $stmt->execute([hash('sha256', $raw)]);
            $id = (int)($stmt->fetchColumn() ?: 0);
            if ($id <= 0) {
                clear_remember_cookie($pdo);
                return null;
            }
            session_regenerate_id(true);
            $_SESSION['ogrenci_id'] = $id;
            return $id;
        } catch (Throwable) {
            return null;
        }
    }
}

if (!function_exists('require_student_login')) {
    function require_student_login(): int {
        $id = authenticated_student_id();
        if ($id !== null) return $id;
        header('Location: login.php');
        exit;
    }
}

if (!function_exists('require_api_student')) {
    function require_api_student(): int {
        $id = authenticated_student_id();
        if ($id !== null) return $id;
        if (function_exists('json_response')) {
            json_response([
                'ok'=>false,
                'message'=>'Oturum süresi doldu. Lütfen tekrar giriş yapın.',
                'auth_required'=>true
            ], 401);
        }
        http_response_code(401);
        exit;
    }
}
