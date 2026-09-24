'use strict';
(() => {
  const SETTINGS_HASH='#/adimbot-ayarlari';

  const syncSettingsPage=page=>{
    if(!(page instanceof Element))return;

    const api=window.AdimBotStudent;
    const settings=api?.getSettings?.()||{};
    const state=api?.getState?.()||{};

    const sound=page.querySelector('[data-adimbot-settings-sound]');
    const rate=page.querySelector('[data-adimbot-settings-rate]');
    const guide=page.querySelector('[data-adimbot-settings-guide]');
    const visible=page.querySelector('[data-adimbot-settings-visible]');

    if(sound)sound.checked=settings.sound!==false;
    if(rate)rate.value=String(Number(settings.rate)||0.95);

    if(guide){
      let active=state.guide===true;
      try{active=window.AdimBotGuide?.isActive?.()===true||active;}catch(_){}
      guide.checked=active;
    }

    if(visible)visible.checked=settings.minimized!==true;
  };

  const bindSettingsPage=page=>{
    if(!(page instanceof Element)||page.dataset.adimbotBound==='1')return;
    page.dataset.adimbotBound='1';

    page.querySelector('[data-adimbot-settings-back]')?.addEventListener('click',()=>{
      location.hash='#/profil';
    });

    page.querySelector('[data-adimbot-settings-sound]')?.addEventListener('change',event=>{
      window.AdimBotStudent?.setSound?.(event.currentTarget.checked);
      syncSettingsPage(page);
    });

    page.querySelector('[data-adimbot-settings-rate]')?.addEventListener('change',event=>{
      window.AdimBotStudent?.setRate?.(event.currentTarget.value);
      syncSettingsPage(page);
    });

    page.querySelector('[data-adimbot-settings-guide]')?.addEventListener('change',event=>{
      try{
        if(event.currentTarget.checked)window.AdimBotGuide?.start?.();
        else window.AdimBotGuide?.stop?.({silent:true});
      }catch(_){}
      syncSettingsPage(page);
    });

    page.querySelector('[data-adimbot-settings-visible]')?.addEventListener('change',event=>{
      if(event.currentTarget.checked)window.AdimBotStudent?.restore?.();
      else window.AdimBotStudent?.minimize?.();
      syncSettingsPage(page);
    });
  };

  const renderSettingsPage=()=>{
    if(location.hash!==SETTINGS_HASH)return false;

    const screen=document.getElementById('screen');
    if(!screen)return false;

    let page=screen.querySelector('[data-adimbot-settings-page]');
    if(!page){
      screen.innerHTML=[
        '<section class="adb-settings-page" data-adimbot-settings-page>',
        '<header class="adb-settings-page-head">',
        '<button type="button" class="adb-settings-back" data-adimbot-settings-back aria-label="Profile dön">‹</button>',
        '<div><strong>AdımBot Ayarları</strong><small>Robotun sesini ve rehber davranışını buradan yönet.</small></div>',
        '</header>',
        '<div class="adb-settings-page-card">',
        '<label class="adb-settings-page-row"><span><strong>Ses</strong><small>AdımBot konuşsun</small></span><input type="checkbox" data-adimbot-settings-sound></label>',
        '<label class="adb-settings-page-row"><span><strong>Konuşma hızı</strong><small>Okuma hızını seç</small></span><select data-adimbot-settings-rate><option value="0.80">Yavaş</option><option value="0.95">Normal</option><option value="1.10">Hızlı</option></select></label>',
        '<label class="adb-settings-page-row"><span><strong>Rehber modu</strong><small>Adım adım yönlendirme</small></span><input type="checkbox" data-adimbot-settings-guide></label>',
        '<label class="adb-settings-page-row"><span><strong>Robot görünür</strong><small>AdımBot öğrenci ekranında görünsün</small></span><input type="checkbox" data-adimbot-settings-visible></label>',
        '</div>',
        '<div class="adb-settings-page-note">Sohbet ayarlarda değildir. AdımBot’un üzerindeki 💬 simgesine dokunarak sohbeti açabilirsin.</div>',
        '</section>'
      ].join('');
      page=screen.querySelector('[data-adimbot-settings-page]');
    }

    bindSettingsPage(page);
    syncSettingsPage(page);
    return true;
  };

  const insertLinks=()=>{
    if(location.hash===SETTINGS_HASH){
      renderSettingsPage();
      return;
    }

    const menu=document.querySelector('.profile-menu');
    if(!menu)return;

    if(!menu.querySelector('[data-adimbot-profile-link]')){
      const link=document.createElement('a');
      link.href=SETTINGS_HASH;
      link.setAttribute('data-adimbot-profile-link','1');
      link.innerHTML='<span class="menu-icon">🤖</span><div><strong>AdımBot Ayarları</strong><small>Ses, konuşma hızı, rehber ve görünürlük</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
      menu.appendChild(link);
    }

    if(!menu.querySelector('[data-logout-link]')){
      const logoutLink=document.createElement('a');
      logoutLink.href='logout.php';
      logoutLink.setAttribute('data-logout-link','1');
      logoutLink.innerHTML='<span class="menu-icon pink">🚪</span><div><strong>Çıkış Yap</strong><small>Bu öğrenci hesabından güvenli çıkış yap</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
      menu.appendChild(logoutLink);
    }
  };

  const screen=document.getElementById('screen');
  if(screen){
    new MutationObserver(()=>{
      if(location.hash===SETTINGS_HASH)renderSettingsPage();
      else insertLinks();
    }).observe(screen,{childList:true,subtree:true});
  }

  window.addEventListener('adimbot:statechange',()=>{
    const page=document.querySelector('[data-adimbot-settings-page]');
    if(page)syncSettingsPage(page);
  });

  window.addEventListener('hashchange',()=>{
    setTimeout(()=>{
      if(!renderSettingsPage())insertLinks();
    },0);
    setTimeout(()=>{
      if(location.hash===SETTINGS_HASH)renderSettingsPage();
    },160);
  });

  document.addEventListener('DOMContentLoaded',()=>{
    setTimeout(()=>{
      if(!renderSettingsPage())insertLinks();
    },0);
  },{once:true});

  setTimeout(()=>{
    if(!renderSettingsPage())insertLinks();
  },0);
})();
