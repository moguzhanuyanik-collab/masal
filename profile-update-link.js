'use strict';
(() => {
  const insertAccountLinks = () => {
    const menu = document.querySelector('.profile-menu');
    if (!menu || menu.querySelector('[data-account-links]')) return;

    const wrap = document.createElement('div');
    wrap.setAttribute('data-account-links', '1');
    wrap.style.display = 'contents';
    wrap.innerHTML = `
      <a href="hesabim.php"><span class="menu-icon green">👤</span><div><strong>Hesabım</strong><small>E-posta, şifre ve profil fotoğrafı</small></div><svg aria-hidden="true"><use href="#arrow"/></svg></a>
      <a href="guncelleme.php"><span class="menu-icon blue">🔄</span><div><strong>Uygulama Güncelleme</strong><small>Yeni sürümleri kontrol et ve kur</small></div><svg aria-hidden="true"><use href="#arrow"/></svg></a>
      <a href="logout.php"><span class="menu-icon pink">🚪</span><div><strong>Çıkış Yap</strong><small>Bu öğrenci hesabından güvenli çıkış yap</small></div><svg aria-hidden="true"><use href="#arrow"/></svg></a>`;
    menu.appendChild(wrap);
  };

  const screen = document.getElementById('screen');
  if (screen) new MutationObserver(insertAccountLinks).observe(screen, { childList:true, subtree:true });
  window.addEventListener('hashchange', () => setTimeout(insertAccountLinks, 0));
  document.addEventListener('DOMContentLoaded', () => setTimeout(insertAccountLinks, 0));
  setTimeout(insertAccountLinks, 0);
})();
