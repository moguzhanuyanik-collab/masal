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
$initial=(string)($_GET['sekme']??'kurumlar');
if(!isset($sections[$initial])) $initial='kurumlar';
$institutionId=max(0,(int)($_GET['kurum_id']??0));

function kmh(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="csrf-token" content="<?=kmh(csrf_token())?>">
<title>Kurumlar Modülü — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
<link rel="stylesheet" href="kurumlar-modul.css?v=1.0.50">
<script src="kurumlar-modul.js?v=1.0.50" defer></script>
</head>
<body class="role-page">
<div class="role-shell" data-km-root data-section="<?=kmh($initial)?>" data-kurum="<?=$institutionId?>">
<header class="role-topbar">
<a class="role-icon" href="super-admin.php">←</a>
<span class="role-brand"><span>🏫</span><span><strong>Kurumlar Modülü</strong><small>AJAX YÖNETİM MERKEZİ</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">👑</a>
</header>

<main class="role-content km-shell">
<nav class="km-tabs" aria-label="Kurum iç menüsü">
<button class="km-tab" type="button" data-km-section="kurumlar">🏫 Kurumlar</button>
<button class="km-tab" type="button" data-km-section="yoneticiler">🧑‍💼 Yöneticiler</button>
<button class="km-tab" type="button" data-km-section="ogretmenler">👩‍🏫 Öğretmenler</button>
<button class="km-tab" type="button" data-km-section="veliler">👪 Veliler</button>
<button class="km-tab" type="button" data-km-section="ogrenciler">🎒 Öğrenciler</button>
<button class="km-tab" type="button" data-km-section="eslestirme">🔗 Eşleştirme</button>
</nav>

<div class="km-toolbar">
<div class="km-title"><span class="eyeline" id="km-eyebrow">KURUMLAR MODÜLÜ</span><h1 id="km-title"><?=kmh($sections[$initial])?></h1></div>
<div class="km-tools">
<select class="km-select" id="km-filter" hidden aria-label="Kurum filtresi"></select>
<input class="km-search" id="km-search" type="search" placeholder="Ara…" autocomplete="off">
<button class="km-add" id="km-add" type="button">＋ Yeni Kayıt</button>
</div>
</div>

<section class="km-content" id="km-content" aria-live="polite">
<div class="km-panel"><div class="km-loading">Yükleniyor…</div></div>
</section>

<noscript><div class="role-note"><span>⚠️</span><p>Bu modül AJAX ile çalışır. JavaScript etkin olmalıdır.</p></div></noscript>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="kurumlar.php"><span>🏫</span>Kurumlar</a>
<a href="global-ogrenciler.php"><span>🎒</span>Global Öğr.</a>
<a href="global-veliler.php"><span>👪</span>Global Veli</a>
</nav>
</div>

<dialog class="km-dialog" id="km-dialog">
<div class="km-dialog-head"><strong id="km-dialog-title">Yeni Kayıt</strong><button class="km-close" type="button" data-km-close aria-label="Kapat">×</button></div>
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
