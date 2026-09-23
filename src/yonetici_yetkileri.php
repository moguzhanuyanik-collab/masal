<?php
declare(strict_types=1);

function yy_options(): array {
    return [
        'kurum_goruntule'=>'Kurum bilgilerini görüntüleme',
        'ogretmen_yonet'=>'Öğretmen hesapları',
        'veli_yonet'=>'Veli hesapları',
        'ogrenci_yonet'=>'Öğrenci hesapları',
    ];
}

function yy_can(PDO $pdo,array $user,string $permission): bool {
    if(auth_user_has_role($user,'super_admin')) return true;
    if(!auth_user_has_role($user,'yonetici') || !array_key_exists($permission,yy_options())) return false;
    // Geçiş sırasında eski kurulumların çalışmasını sürdür; migration yeni sürümle uygulanır.
    if(!auth_runtime_table_exists($pdo,'yonetici_yetkileri')) return true;
    $stmt=$pdo->prepare('SELECT 1 FROM yonetici_yetkileri WHERE kullanici_id=? AND yetki=? LIMIT 1');
    $stmt->execute([(int)$user['id'],$permission]);
    $allowed=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $allowed;
}
