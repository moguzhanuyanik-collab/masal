'use strict';
(() => {
  const insertLinks = () => {
    const menu = document.querySelector('.profile-menu');
    if (!menu) return;

    if (!menu.querySelector('[data-app-update-link]')) {
      const updateLink = document.createElement('a');
      updateLink.href = 'guncelleme.php';
      updateLink.setAttribute('data-app-update-link', '1');
      updateLink.innerHTML = '<span class="menu-icon blue">🔄</span><div><strong>Uygulama Güncelleme</strong><small>Yeni sürümleri kontrol et ve kur</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
      menu.appendChild(updateLink);
    }

    if (!menu.querySelector('[data-logout-link]')) {
      const logoutLink = document.createElement('a');
      logoutLink.href = 'logout.php';
      logoutLink.setAttribute('data-logout-link', '1');
      logoutLink.innerHTML = '<span class="menu-icon pink">🚪</span><div><strong>Çıkış Yap</strong><small>Bu öğrenci hesabından güvenli çıkış yap</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
      menu.appendChild(logoutLink);
    }
  };

  const screen = document.getElementById('screen');
  if (screen) {
    new MutationObserver(insertLinks).observe(screen, {
      childList: true,
      subtree: true
    });
  }

  window.addEventListener('hashchange', () => setTimeout(insertLinks, 0));
  document.addEventListener('DOMContentLoaded', () => setTimeout(insertLinks, 0));
  setTimeout(insertLinks, 0);
})();
