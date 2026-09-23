<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require_student_login();
?>
<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
  <meta name="theme-color" content="#f8f7fc">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="default">
  <meta name="description" content="İlkAdım: 1. sınıf için renkli dersler, eğlenceli oyunlar ve kişisel öğrenme yolculuğun.">
  <title>İlkAdım — Benim öğrenme dünyam</title>
  <link rel="stylesheet" href="styles.css">
  <script src="api/bootstrap.js.php" defer></script>
  <script src="activities-extra.js?v=1.0.24" defer></script>
  <script src="app-runtime.js" defer></script>\n  <script src="global-audio-feedback.js?v=1.0.24" defer></script>
  <script src="lesson-ui-fix.js?v=1.0.19" defer></script>
  <script src="settings-account.js" defer></script>
  <script src="profile-update-link.js" defer></script>
</head>
<body>
  <svg class="icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
    <symbol id="home" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10h-6v-6H9v6H3Z"/></symbol>
    <symbol id="book" viewBox="0 0 24 24"><path d="M12 5C8 2 3 3 3 3v16s5-1 9 2c4-3 9-2 9-2V3s-5-1-9 2Zm0 0v16"/></symbol>
    <symbol id="star" viewBox="0 0 24 24"><path d="m12 3 3 6 7 1-5 5 1 7-6-3-6 3 1-7-5-5 7-1Z"/></symbol>
    <symbol id="user" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21v-2a8 8 0 0 1 16 0v2"/></symbol>
    <symbol id="search" viewBox="0 0 24 24"><circle cx="10" cy="10" r="7"/><path d="m15 15 6 6"/></symbol>
    <symbol id="arrow" viewBox="0 0 24 24"><path d="m9 5 7 7-7 7"/></symbol>
    <symbol id="back" viewBox="0 0 24 24"><path d="m14 5-7 7 7 7M7 12h14"/></symbol>
    <symbol id="bell" viewBox="0 0 24 24"><path d="M5 16V9a7 7 0 0 1 14 0v7l2 3H3l2-3m5 6h4"/></symbol>
    <symbol id="heart" viewBox="0 0 24 24"><path d="M20 4c-3-3-7-1-8 1-1-2-5-4-8-1-4 4 0 9 8 16 8-7 12-12 8-16Z"/></symbol>
    <symbol id="check" viewBox="0 0 24 24"><path d="m5 12 4 4L20 5"/></symbol>
    <symbol id="gear" viewBox="0 0 24 24"><path d="m9 3-1 3-3 1-2 4 2 2v4l4 2 3-1 3 1 4-2v-4l2-2-2-4-3-1-1-3Z"/><circle cx="12" cy="11" r="3"/></symbol>
  </svg>
  <a class="skip-link" href="#screen">İçeriğe geç</a>
  <div class="app-shell">
    <header class="app-topbar" id="app-topbar"></header>
    <main id="screen" tabindex="-1"><noscript>İlkAdım’ı kullanmak için tarayıcında JavaScript’i etkinleştir.</noscript></main>
    <nav class="app-nav" aria-label="Uygulama menüsü">
      <a href="#/anasayfa" data-tab="anasayfa"><span><svg><use href="#home"/></svg></span>Anasayfa</a>
      <a href="#/dersler" data-tab="dersler"><span><svg><use href="#book"/></svg></span>Dersler</a>
      <a href="#/etkinlikler" data-tab="etkinlikler"><span><svg><use href="#star"/></svg></span>Etkinlikler</a>
      <a href="#/profil" data-tab="profil"><span><svg><use href="#user"/></svg></span>Profil</a>
    </nav>
  </div>
  <dialog id="confirm-dialog" class="confirm-dialog" aria-labelledby="confirm-title"><h2 id="confirm-title">Yeni bir başlangıç?</h2><p>İlerleme, yıldızlar, oyun sonuçları ve geçmiş bu tarayıcıdan silinecek. İsmin ve favorilerin korunacak.</p><div><button class="button soft" id="cancel-reset">Vazgeç</button><button class="button danger" id="confirm-reset">İlerlemeyi Sıfırla</button></div></dialog>
  <div class="toast" role="status" aria-live="polite"></div>
</body>
</html>
