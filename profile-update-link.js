'use strict';
(() => {
  const insertUpdateLink = () => {
    const menu = document.querySelector('.profile-menu');
    if (!menu || menu.querySelector('[data-app-update-link]')) return;

    const link = document.createElement('a');
    link.href = 'guncelleme.php';
    link.setAttribute('data-app-update-link', '1');
    link.innerHTML = '<span class="menu-icon blue">🔄</span><div><strong>Uygulama Güncelleme</strong><small>Yeni sürümleri kontrol et ve tek dokunuşla kur</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
    menu.appendChild(link);
  };

  const screen = document.getElementById('screen');
  if (screen) {
    new MutationObserver(insertUpdateLink).observe(screen, {
      childList: true,
      subtree: true
    });
  }

  window.addEventListener('hashchange', () => setTimeout(insertUpdateLink, 0));
  document.addEventListener('DOMContentLoaded', () => setTimeout(insertUpdateLink, 0));
  setTimeout(insertUpdateLink, 0);
})();
