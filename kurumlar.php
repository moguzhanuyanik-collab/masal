<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');

$sections=[
  'kurumlar'=>'Kurumlar',
  'yoneticiler'=>'Yöneticiler',
  'ogretmenler'=>'Öğretmenler',
  'veliler'=>'Veliler',
  'ogrenciler'=>'Öğrenciler',
  'eslestirme'=>'Eşleştirme',
];

$initial=(string)($_GET['sekme']??'');
if(!isset($sections[$initial])) $initial='';
$institutionId=max(0,(int)($_GET['kurum_id']??0));

function kmh(string $v): string {
    return htmlspecialchars($v,ENT_QUOTES,'UTF-8');
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="csrf-token" content="<?=kmh(csrf_token())?>">
<title>Kurumlar Modülü — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
<link rel="stylesheet" href="kurumlar-kart.css?v=1.0.51">
<link rel="stylesheet" href="kurumlar-responsive.css?v=1.0.52">
<script src="kurumlar-kart.js?v=1.0.53" defer></script>
<script src="kurumlar-responsive.js?v=1.0.52" defer></script>
</head>
<body class="role-page">
<div class="role-shell" data-km-root data-section="<?=kmh($initial)?>" data-kurum="<?=$institutionId?>">
<header class="role-topbar">
<a class="role-icon" href="super-admin.php">←</a>
<span class="role-brand"><span>🏫</span><span><strong>Kurumlar Modülü</strong><small>İLKADIM YÖNETİMİ</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">👑</a>
</header>

<main class="role-content">

<section class="km-card-home" id="km-home">
<div class="km-home-head">
<span class="eyeline">KURUMLAR MODÜLÜ</span>
<h1>Ne yönetmek istiyorsun?</h1>
<p>Bölümü seç. Tablo, ekleme, güncelleme ve eşleştirme işlemleri aynı ekran içinde açılır.</p>
</div>

<div class="km-card-grid">
<button class="km-module-card" type="button" data-km-card="kurumlar">
<span class="km-module-icon">🏫</span>
<div><strong>Kurumlar</strong><small>Kurumları listele, ekle, güncelle ve pasife al.</small></div>
<span class="km-module-arrow">→</span>
</button>

<button class="km-module-card" type="button" data-km-card="yoneticiler">
<span class="km-module-icon">🧑‍💼</span>
<div><strong>Yöneticiler</strong><small>Kurum yöneticilerini tablo halinde yönet.</small></div>
<span class="km-module-arrow">→</span>
</button>

<button class="km-module-card" type="button" data-km-card="ogretmenler">
<span class="km-module-icon">👩‍🏫</span>
<div><strong>Öğretmenler</strong><small>Öğretmen hesaplarını kurum bazında yönet.</small></div>
<span class="km-module-arrow">→</span>
</button>

<button class="km-module-card" type="button" data-km-card="veliler">
<span class="km-module-icon">👪</span>
<div><strong>Veliler</strong><small>Velileri listele, ekle, güncelle ve kurumdan çıkar.</small></div>
<span class="km-module-arrow">→</span>
</button>

<button class="km-module-card" type="button" data-km-card="ogrenciler">
<span class="km-module-icon">🎒</span>
<div><strong>Öğrenciler</strong><small>Kuruma ait öğrencileri tablo üzerinden yönet.</small></div>
<span class="km-module-arrow">→</span>
</button>

<button class="km-module-card" type="button" data-km-card="eslestirme">
<span class="km-module-icon">🔗</span>
<div><strong>Eşleştirme</strong><small>Öğrenciyi aynı kurumdaki veli ve öğretmenlere bağla.</small></div>
<span class="km-module-arrow">→</span>
</button>
</div>
</section>

<section class="km-section-view" id="km-section-view">
<div class="km-section-toolbar">
<div class="km-section-title">
<button class="km-back" id="km-back" type="button" aria-label="Bölümlere dön">←</button>
<div><span class="eyeline" id="km-eyebrow">KURUMLAR MODÜLÜ</span><h1 id="km-title">Kurumlar</h1></div>
</div>

<div class="km-section-tools">
<select class="km-select" id="km-filter" hidden aria-label="Kurum filtresi"></select>
<input class="km-search" id="km-search" type="search" placeholder="Ara…" autocomplete="off">
<button class="km-add" id="km-add" type="button">＋ Yeni Ekle</button>
</div>
</div>

<div class="km-content" id="km-content" aria-live="polite">
<div class="km-panel"><div class="km-loading">Yükleniyor…</div></div>
</div>
</section>

<noscript>
<div class="role-note"><span>⚠️</span><p>Kurumlar Modülü AJAX ile çalışır. JavaScript etkin olmalıdır.</p></div>
</noscript>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="kurumlar.php"><span>🏫</span>Kurumlar</a>
<a href="global-ogrenciler.php"><span>🎒</span>Global Öğr.</a>
<a href="global-veliler.php"><span>👪</span>Global Veli</a>
</nav>
</div>

<dialog class="km-dialog" id="km-dialog">
<div class="km-dialog-head">
<strong id="km-dialog-title">Yeni Kayıt</strong>
<button class="km-close" type="button" data-km-close aria-label="Kapat">×</button>
</div>
<form class="km-form" id="km-form">
<div id="km-fields"></div>
<div class="km-dialog-actions">
<button class="km-cancel" type="button" data-km-close>Vazgeç</button>
<button class="role-button" type="submit">Kaydet</button>
</div>
</form>
</dialog>

<div class="km-toast" id="km-toast" role="status" aria-live="polite"></div>
</body>
</html>
