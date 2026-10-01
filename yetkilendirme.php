<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require __DIR__ . '/src/kurum_yonetimi.php';

$user=require_role('super_admin');
$pdo=db();
$isSuper=auth_user_has_role($user,'super_admin');
$relationScopeReady=auth_runtime_column_exists($pdo,'veli_ogrenci','kurum_id')
    && auth_runtime_column_exists($pdo,'ogretmen_ogrenci','kurum_id');
$message='';
$error='';

function h_auth(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
function require_target_role(PDO $pdo,int $userId,string $role): array {
    $target=auth_fetch_user($pdo,$userId);
    if (!$target || !auth_user_has_role($target,$role)) throw new RuntimeException('Seçilen kullanıcı bu role sahip değil.');
    return $target;
}

if ($_SERVER['REQUEST_METHOD']==='POST') {
    try {
        if (!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');

        if ($action==='create_user') {
            $name=trim((string)($_POST['ad_soyad']??''));
            $email=mb_strtolower(trim((string)($_POST['yeni_kullanici_eposta']??'')));
            $password=(string)($_POST['yeni_kullanici_sifre']??'');
            $role=(string)($_POST['rol']??'');

            if ($role==='yonetici') throw new RuntimeException('Yönetici hesabını Kurumlar bölümünden bir kuruma bağlayarak oluştur.');
            if (!in_array($role,['ogrenci','veli','ogretmen'],true)) throw new RuntimeException('Bu rolü oluşturma yetkin yok.');

            $targetId=ky_create_user(
                $pdo,
                $user,
                $role,
                $name,
                $email,
                $password,
                null,
                $role==='ogrenci'?1:null
            );
            $message='Yeni global kullanıcı hesabı oluşturuldu.';
        }

        if ($action==='add_role') {
            if (!$isSuper) throw new RuntimeException('Ek rol verme işlemi yalnızca Süper Admin içindir.');
            $targetId=(int)($_POST['kullanici_id']??0);
            $role=(string)($_POST['rol']??'');
            if ($role==='yonetici') throw new RuntimeException('Yönetici rolü Kurumlar bölümünden kurum üyeliğiyle birlikte verilmelidir.');
            if ($role==='super_admin') throw new RuntimeException('Süper Admin rolü bu ekrandan verilemez.');
            if (!in_array($role,['veli','ogretmen'],true)) throw new RuntimeException('Geçersiz rol.');
            $target=auth_fetch_user($pdo,$targetId);
            if (!$target) throw new RuntimeException('Kullanıcı bulunamadı.');
            $globalCheck=$pdo->prepare("SELECT 1 FROM kullanicilar k WHERE k.id=? AND k.aktif=1 AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari kk WHERE kk.kullanici_id=k.id AND kk.aktif=1) LIMIT 1");
            $globalCheck->execute([$targetId]);
            if (!$globalCheck->fetchColumn()) throw new RuntimeException('Kurum kullanıcısının rolünü Kurumlar bölümünden yönetin.');
            $pdo->prepare('INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol) VALUES (?,?)')->execute([$targetId,$role]);
            if ($role==='veli') $pdo->prepare('INSERT IGNORE INTO veliler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$targetId,(string)$target['ad_soyad']]);
            if ($role==='ogretmen') $pdo->prepare('INSERT IGNORE INTO ogretmenler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$targetId,(string)$target['ad_soyad']]);
            auth_audit($pdo,(int)$user['id'],$targetId,'rol_ekle','Rol: '.$role);
            $message='Rol kullanıcıya eklendi.';
        }

        if ($action==='link_student') {
            $targetId=(int)($_POST['kullanici_id']??0);
            $studentId=(int)($_POST['ogrenci_id']??0);
            $role=(string)($_POST['rol']??'');
            if (!in_array($role,['veli','ogretmen'],true)) throw new RuntimeException('Yalnızca veli veya öğretmen öğrenciyle eşleştirilebilir.');
            if (!$relationScopeReady) throw new RuntimeException('Kurum kapsamlı eşleştirme şeması hazır değil. Sistem güncellemesini tamamlayın.');
            $target=require_target_role($pdo,$targetId,$role);
            $globalTarget=$pdo->prepare("SELECT 1 FROM kullanicilar k WHERE k.id=? AND k.aktif=1 AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari kk WHERE kk.kullanici_id=k.id AND kk.aktif=1) LIMIT 1");
            $globalTarget->execute([$targetId]);
            if (!$globalTarget->fetchColumn()) throw new RuntimeException('Kurum kullanıcısı bu ekrandan global eşleştirmeye eklenemez.');
            $check=$pdo->prepare("SELECT o.id FROM ogrenciler o INNER JOIN kullanicilar k ON k.id=o.kullanici_id WHERE o.id=? AND o.aktif=1 AND k.aktif=1 AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari kk WHERE kk.kullanici_id=k.id AND kk.aktif=1) LIMIT 1");
            $check->execute([$studentId]);
            if (!$check->fetchColumn()) throw new RuntimeException('Global öğrenci bulunamadı.');

            if ($role==='veli') {
                $pdo->prepare('INSERT IGNORE INTO veliler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$targetId,(string)$target['ad_soyad']]);
                $p=$pdo->prepare('SELECT id FROM veliler WHERE kullanici_id=? LIMIT 1');$p->execute([$targetId]);$profileId=(int)$p->fetchColumn();
                $pdo->prepare('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id,kurum_id) VALUES (?,?,0)')->execute([$profileId,$studentId]);
            } else {
                $pdo->prepare('INSERT IGNORE INTO ogretmenler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$targetId,(string)$target['ad_soyad']]);
                $p=$pdo->prepare('SELECT id FROM ogretmenler WHERE kullanici_id=? LIMIT 1');$p->execute([$targetId]);$profileId=(int)$p->fetchColumn();
                $pdo->prepare('INSERT IGNORE INTO ogretmen_ogrenci (ogretmen_id,ogrenci_id,kurum_id) VALUES (?,?,0)')->execute([$profileId,$studentId]);
            }
            auth_audit($pdo,(int)$user['id'],$targetId,'ogrenci_eslestir','Rol: '.$role.' Öğrenci: '.$studentId);
            $message='Öğrenci eşleştirmesi kaydedildi.';
        }

        if ($action==='unlink_student') {
            $targetId=(int)($_POST['kullanici_id']??0);
            $studentId=(int)($_POST['ogrenci_id']??0);
            $role=(string)($_POST['rol']??'');
            if (!in_array($role,['veli','ogretmen'],true)) throw new RuntimeException('Geçersiz eşleştirme türü.');
            if (!$relationScopeReady) throw new RuntimeException('Kurum kapsamlı eşleştirme şeması hazır değil. Sistem güncellemesini tamamlayın.');
            require_target_role($pdo,$targetId,$role);
            if ($role==='veli') {
                $p=$pdo->prepare('SELECT id FROM veliler WHERE kullanici_id=? LIMIT 1');$p->execute([$targetId]);$profileId=(int)$p->fetchColumn();
                if ($profileId>0) $pdo->prepare('DELETE FROM veli_ogrenci WHERE veli_id=? AND ogrenci_id=? AND kurum_id=0')->execute([$profileId,$studentId]);
            } else {
                $p=$pdo->prepare('SELECT id FROM ogretmenler WHERE kullanici_id=? LIMIT 1');$p->execute([$targetId]);$profileId=(int)$p->fetchColumn();
                if ($profileId>0) $pdo->prepare('DELETE FROM ogretmen_ogrenci WHERE ogretmen_id=? AND ogrenci_id=? AND kurum_id=0')->execute([$profileId,$studentId]);
            }
            auth_audit($pdo,(int)$user['id'],$targetId,'ogrenci_eslestirme_kaldir','Rol: '.$role.' Öğrenci: '.$studentId);
            $message='Öğrenci eşleştirmesi kaldırıldı.';
        }

        if ($action==='toggle_active') {
            $targetId=(int)($_POST['kullanici_id']??0);
            if ($targetId===(int)$user['id']) throw new RuntimeException('Kendi hesabını buradan kapatamazsın.');
            $rawTarget=$pdo->prepare('SELECT id,ana_rol,aktif FROM kullanicilar WHERE id=? LIMIT 1');
            $rawTarget->execute([$targetId]);
            $targetRow=$rawTarget->fetch();
            if (!is_array($targetRow)) throw new RuntimeException('Kullanıcı bulunamadı.');
            $targetRoles=auth_user_roles($pdo,$targetId,(string)$targetRow['ana_rol']);
            if (!$isSuper && (in_array('yonetici',$targetRoles,true)||in_array('super_admin',$targetRoles,true))) {
                throw new RuntimeException('Bu hesabı değiştirme yetkin yok.');
            }
            $current=(int)$targetRow['aktif']===1;
            $newActive=$current?0:1;
            $pdo->beginTransaction();
            try {
                $pdo->prepare('UPDATE kullanicilar SET aktif=? WHERE id=?')->execute([$newActive,$targetId]);
                foreach (['ogrenciler','veliler','ogretmenler'] as $profileTable) {
                    if (auth_runtime_table_exists($pdo,$profileTable)
                        && auth_runtime_column_exists($pdo,$profileTable,'kullanici_id')
                        && auth_runtime_column_exists($pdo,$profileTable,'aktif')) {
                        $pdo->prepare("UPDATE {$profileTable} SET aktif=? WHERE kullanici_id=?")->execute([$newActive,$targetId]);
                    }
                }
                if ($current && auth_runtime_table_exists($pdo,'kullanici_oturum_tokenlari')) {
                    $pdo->prepare('DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id=?')->execute([$targetId]);
                }
                $pdo->commit();
            } catch (Throwable $e) {
                if ($pdo->inTransaction()) $pdo->rollBack();
                throw $e;
            }
            auth_audit($pdo,(int)$user['id'],$targetId,'hesap_durum',($current?'pasif':'aktif'));
            $message='Kullanıcı ve profil durumu güncellendi.';
        }
    } catch (PDOException $e) {
        error_log('[IlkAdim][authorization-db] '.$e->getMessage());
        $error=$e->getCode()==='23000'?'Bu e-posta veya eşleştirme zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    } catch (RuntimeException $e) {
        $error=$e->getMessage();
    } catch (Throwable $e) {
        error_log('[IlkAdim][authorization] '.$e->getMessage());
        $error='Yetkilendirme işlemi tamamlanamadı. Lütfen tekrar deneyin.';
    }
}

$users=$pdo->query("SELECT k.id,k.email,k.ad_soyad,k.ana_rol,k.aktif,
    GROUP_CONCAT(r.rol ORDER BY r.rol SEPARATOR ',') roller
    FROM kullanicilar k
    LEFT JOIN kullanici_rolleri r ON r.kullanici_id=k.id
    GROUP BY k.id,k.email,k.ad_soyad,k.ana_rol,k.aktif
    ORDER BY k.id")->fetchAll();
$globalUsers=$pdo->query("SELECT k.id,k.email,k.ad_soyad,k.ana_rol,k.aktif,
    GROUP_CONCAT(r.rol ORDER BY r.rol SEPARATOR ',') roller
    FROM kullanicilar k
    LEFT JOIN kullanici_rolleri r ON r.kullanici_id=k.id
    WHERE k.aktif=1
      AND NOT EXISTS (
        SELECT 1 FROM kurum_kullanicilari kk
        WHERE kk.kullanici_id=k.id AND kk.aktif=1
      )
    GROUP BY k.id,k.email,k.ad_soyad,k.ana_rol,k.aktif
    ORDER BY k.id")->fetchAll();
$students=$pdo->query("SELECT o.id,o.email
    FROM ogrenciler o
    INNER JOIN kullanicilar k ON k.id=o.kullanici_id
    WHERE o.aktif=1 AND k.aktif=1
      AND NOT EXISTS (
        SELECT 1 FROM kurum_kullanicilari kk
        WHERE kk.kullanici_id=k.id AND kk.aktif=1
      )
    ORDER BY o.id")->fetchAll();

$assignable=array_values(array_filter($globalUsers?:[],static function(array $u):bool{
    $roles=explode(',',(string)($u['roller']??''));
    return in_array('veli',$roles,true)||in_array('ogretmen',$roles,true);
}));

$links=[];
if($relationScopeReady){
    $parentLinks=$pdo->query("SELECT k.id kullanici_id,k.email,vo.ogrenci_id,'veli' rol
        FROM veli_ogrenci vo
        INNER JOIN veliler v ON v.id=vo.veli_id
        INNER JOIN kullanicilar k ON k.id=v.kullanici_id
        INNER JOIN ogrenciler s ON s.id=vo.ogrenci_id
        INNER JOIN kullanicilar sk ON sk.id=s.kullanici_id
        WHERE vo.kurum_id=0
          AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari kk WHERE kk.kullanici_id=k.id AND kk.aktif=1)
          AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari skk WHERE skk.kullanici_id=sk.id AND skk.aktif=1)
        ORDER BY k.email,vo.ogrenci_id")->fetchAll();
    $teacherLinks=$pdo->query("SELECT k.id kullanici_id,k.email,oo.ogrenci_id,'ogretmen' rol
        FROM ogretmen_ogrenci oo
        INNER JOIN ogretmenler o ON o.id=oo.ogretmen_id
        INNER JOIN kullanicilar k ON k.id=o.kullanici_id
        INNER JOIN ogrenciler s ON s.id=oo.ogrenci_id
        INNER JOIN kullanicilar sk ON sk.id=s.kullanici_id
        WHERE oo.kurum_id=0
          AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari kk WHERE kk.kullanici_id=k.id AND kk.aktif=1)
          AND NOT EXISTS (SELECT 1 FROM kurum_kullanicilari skk WHERE skk.kullanici_id=sk.id AND skk.aktif=1)
        ORDER BY k.email,oo.ogrenci_id")->fetchAll();
    $links=array_merge($parentLinks?:[],$teacherLinks?:[]);
}elseif($error===''){
    $error='Kurum kapsamlı eşleştirme şeması hazır değil. Sistem güncellemesini tamamlayın.';
}
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Kullanıcı Yönetimi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
</head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell">
<header class="app-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="guncelleme.php" aria-label="Güncellemeler"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="hesap-guvenligi.php" aria-label="Hesabım"><svg><use href="#sa-user"/></svg></a>
</div>
</header>
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span><svg><use href="#sa-shield"/></svg></span><h1>Sistem Rolleri</h1>
<p>Global öğrenci/veli oluşturmak için ayrı Global Kullanıcılar sayfalarını; kurum kullanıcıları için kurum detayını kullan. Bu ekran gelişmiş rol işlemleri içindir.</p>
</section>

<?php if ($message!==''): ?><section class="settings-block local-data"><p><?=h_auth($message)?></p></section><?php endif; ?>
<?php if ($error!==''): ?><section class="settings-block local-data"><p><?=h_auth($error)?></p></section><?php endif; ?>

<form method="post" class="settings-block" autocomplete="off">
<input type="hidden" name="csrf" value="<?=h_auth(csrf_token())?>">
<input type="hidden" name="action" value="create_user">
<h2>Yeni kullanıcı</h2>
<label class="field-label">Ad Soyad</label>
<input class="text-input" name="ad_soyad" required maxlength="190">
<label class="field-label">E-posta</label>
<input class="text-input" type="email" name="yeni_kullanici_eposta" autocomplete="off" autocapitalize="none" spellcheck="false" value="" required>
<label class="field-label">Geçici şifre</label>
<input class="text-input" type="password" name="yeni_kullanici_sifre" autocomplete="new-password" minlength="8" value="" required>
<label class="field-label">Rol</label>
<select class="text-input" name="rol" required>
<option value="ogrenci">Öğrenci</option>
<option value="veli">Veli</option>
<option value="ogretmen">Öğretmen</option>
</select>
<button class="button primary full" type="submit">Kullanıcı Oluştur</button>
</form>

<form method="post" class="settings-block">
<input type="hidden" name="csrf" value="<?=h_auth(csrf_token())?>">
<input type="hidden" name="action" value="link_student">
<h2>Öğrenci eşleştir</h2>
<label class="field-label">Veli / Öğretmen</label>
<select class="text-input" name="kullanici_id" required>
<?php foreach ($assignable as $u): ?>
<option value="<?=(int)$u['id']?>"><?=h_auth((string)$u['email'])?> — <?=h_auth((string)$u['roller'])?></option>
<?php endforeach; ?>
</select>
<label class="field-label">Eşleştirme rolü</label>
<select class="text-input" name="rol" required><option value="veli">Veli</option><option value="ogretmen">Öğretmen</option></select>
<label class="field-label">Öğrenci</label>
<select class="text-input" name="ogrenci_id" required>
<?php foreach ($students as $s): ?><option value="<?=(int)$s['id']?>"><?=h_auth((string)($s['email']??('Öğrenci #'.$s['id'])))?></option><?php endforeach; ?>
</select>
<button class="button primary full" type="submit">Eşleştirmeyi Kaydet</button>
</form>

<section class="settings-block">
<h2>Aktif öğrenci eşleştirmeleri</h2>
<?php if (!$links): ?><p class="little-note">Henüz eşleştirme yapılmamış.</p><?php endif; ?>
<?php foreach ($links as $link): ?>
<div class="history-item">
<span><svg><use href="<?=((string)$link['rol']==='veli'?'#sa-users':'#sa-teacher')?>"/></svg></span>
<div>
<strong><?=h_auth((string)$link['email'])?></strong>
<small><?=h_auth((string)$link['rol'])?> · Öğrenci #<?=(int)$link['ogrenci_id']?></small>
</div>
<form method="post">
<input type="hidden" name="csrf" value="<?=h_auth(csrf_token())?>">
<input type="hidden" name="action" value="unlink_student">
<input type="hidden" name="kullanici_id" value="<?=(int)$link['kullanici_id']?>">
<input type="hidden" name="ogrenci_id" value="<?=(int)$link['ogrenci_id']?>">
<input type="hidden" name="rol" value="<?=h_auth((string)$link['rol'])?>">
<button class="button soft" type="submit">Kaldır</button>
</form>
</div>
<?php endforeach; ?>
</section>

<?php if ($isSuper): ?>
<form method="post" class="settings-block">
<input type="hidden" name="csrf" value="<?=h_auth(csrf_token())?>">
<input type="hidden" name="action" value="add_role">
<h2>Mevcut kullanıcıya ek rol</h2>
<select class="text-input" name="kullanici_id" required>
<?php foreach ($globalUsers as $u): ?><option value="<?=(int)$u['id']?>"><?=h_auth((string)$u['email'])?></option><?php endforeach; ?>
</select>
<select class="text-input" name="rol" required>
<option value="veli">Veli</option><option value="ogretmen">Öğretmen</option>
</select>
<button class="button soft full" type="submit">Rol Ekle</button>
</form>
<?php endif; ?>

<section class="settings-block">
<h2>Kullanıcılar</h2>
<?php foreach ($users as $u): ?>
<div class="history-item">
<span class="sa-status-dot"><svg><use href="#sa-circle"/></svg></span>
<div>
<strong><?=h_auth((string)$u['email'])?></strong>
<small><?=h_auth((string)$u['ad_soyad'])?> · <?=h_auth((string)$u['roller'])?></small>
</div>
<?php if ((int)$u['id']!==(int)$user['id'] && ($isSuper || !preg_match('/(^|,)(yonetici|super_admin)(,|$)/',(string)$u['roller']))): ?>
<form method="post">
<input type="hidden" name="csrf" value="<?=h_auth(csrf_token())?>">
<input type="hidden" name="action" value="toggle_active">
<input type="hidden" name="kullanici_id" value="<?=(int)$u['id']?>">
<input type="hidden" name="aktif" value="<?=(int)$u['aktif']?>">
<button class="button soft" type="submit"><?=((int)$u['aktif']===1?'Pasifleştir':'Aktifleştir')?></button>
</form>
<?php endif; ?>
</div>
<?php endforeach; ?>
</section>
<a class="button soft full" href="super-admin.php">Süper Admin Paneline Dön</a>
</div>
</main>
<nav class="app-nav" aria-label="Süper Admin menüsü">
<a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a>
<a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a>
<a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a>
<a class="active" href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a>
<a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a>
</nav>
</div>
</body>
</html>
