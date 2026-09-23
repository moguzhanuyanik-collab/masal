'use strict';
(() => {
  const insertLinks = () => {
    const menu = document.querySelector('.profile-menu');
    if (!menu || menu.querySelector('[data-extra-profile-links]')) return;
    const wrap = document.createElement('div');
    wrap.setAttribute('data-extra-profile-links','1');
    wrap.style.display='contents';
    wrap.innerHTML = `
      <a href="guncelleme.php"><span class="menu-icon blue">🔄</span><div><strong>Uygulama Güncelleme</strong><small>Yeni sürümleri kontrol et ve kur</small></div><svg aria-hidden="true"><use href="#arrow"/></svg></a>
      <a href="logout.php"><span class="menu-icon pink">🚪</span><div><strong>Çıkış Yap</strong><small>Bu öğrenci hesabından güvenli çıkış yap</small></div><svg aria-hidden="true"><use href="#arrow"/></svg></a>`;
    menu.appendChild(wrap);
  };
  const screen=document.getElementById('screen');
  if(screen)new MutationObserver(insertLinks).observe(screen,{childList:true,subtree:true});
  window.addEventListener('hashchange',()=>setTimeout(insertLinks,0));
  document.addEventListener('DOMContentLoaded',()=>setTimeout(insertLinks,0));
  setTimeout(insertLinks,0);
})();
