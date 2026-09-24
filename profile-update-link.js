'use strict';
(() => {
  const syncAdimBotPanel = panel => {
    if (!(panel instanceof Element)) return;
    const api = window.AdimBotStudent;
    const settings = api?.getSettings?.() || {};
    const state = api?.getState?.() || {};
    const sound = panel.querySelector('[data-profile-adimbot-sound]');
    const rate = panel.querySelector('[data-profile-adimbot-rate]');
    const guide = panel.querySelector('[data-profile-adimbot-guide]');
    const visible = panel.querySelector('[data-profile-adimbot-visible]');

    if (sound) sound.checked = settings.sound !== false;
    if (rate) rate.value = String(Number(settings.rate) || 0.95);
    if (guide) {
      let active = state.guide === true;
      try { active = window.AdimBotGuide?.isActive?.() === true || active; } catch (_) {}
      guide.checked = active;
    }
    if (visible) visible.checked = settings.minimized !== true;
  };

  const buildAdimBotPanel = menu => {
    let panel = document.querySelector('[data-profile-adimbot-panel]');
    if (panel) return panel;

    panel = document.createElement('section');
    panel.className = 'adb-profile-settings';
    panel.setAttribute('data-profile-adimbot-panel', '1');
    panel.hidden = true;
    panel.innerHTML = [
      '<div class="adb-profile-settings-head"><div><strong>AdımBot Ayarları</strong><small>Robotun sesini, hızını ve rehber davranışını buradan yönet.</small></div></div>',
      '<label class="adb-profile-setting-row"><span><strong>Ses</strong><small>AdımBot konuşsun</small></span><input type="checkbox" data-profile-adimbot-sound></label>',
      '<label class="adb-profile-setting-row"><span><strong>Konuşma hızı</strong><small>Okuma hızını seç</small></span><select data-profile-adimbot-rate><option value="0.80">Yavaş</option><option value="0.95">Normal</option><option value="1.10">Hızlı</option></select></label>',
      '<label class="adb-profile-setting-row"><span><strong>Rehber modu</strong><small>Adım adım yönlendirme</small></span><input type="checkbox" data-profile-adimbot-guide></label>',
      '<label class="adb-profile-setting-row"><span><strong>Robot görünür</strong><small>AdımBot ekranda görünsün</small></span><input type="checkbox" data-profile-adimbot-visible></label>'
    ].join('');

    menu.insertAdjacentElement('afterend', panel);

    panel.querySelector('[data-profile-adimbot-sound]')?.addEventListener('change', event => {
      window.AdimBotStudent?.setSound?.(event.currentTarget.checked);
      syncAdimBotPanel(panel);
    });
    panel.querySelector('[data-profile-adimbot-rate]')?.addEventListener('change', event => {
      window.AdimBotStudent?.setRate?.(event.currentTarget.value);
      syncAdimBotPanel(panel);
    });
    panel.querySelector('[data-profile-adimbot-guide]')?.addEventListener('change', event => {
      try {
        if (event.currentTarget.checked) window.AdimBotGuide?.start?.();
        else window.AdimBotGuide?.stop?.({silent:true});
      } catch (_) {}
      syncAdimBotPanel(panel);
    });
    panel.querySelector('[data-profile-adimbot-visible]')?.addEventListener('change', event => {
      if (event.currentTarget.checked) window.AdimBotStudent?.restore?.();
      else window.AdimBotStudent?.minimize?.();
      syncAdimBotPanel(panel);
    });

    return panel;
  };

  const insertLinks = () => {
    const menu = document.querySelector('.profile-menu');
    if (!menu) return;

    if (!menu.querySelector('[data-adimbot-profile-link]')) {
      const adimBotLink = document.createElement('a');
      adimBotLink.href = '#/profil';
      adimBotLink.setAttribute('data-adimbot-profile-link', '1');
      adimBotLink.innerHTML = '<span class="menu-icon">🤖</span><div><strong>AdımBot Ayarları</strong><small>Ses, konuşma hızı, rehber ve görünürlük</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
      adimBotLink.addEventListener('click', event => {
        event.preventDefault();
        const panel = buildAdimBotPanel(menu);
        panel.hidden = !panel.hidden;
        if (!panel.hidden) {
          syncAdimBotPanel(panel);
          panel.scrollIntoView({block:'nearest', behavior:'smooth'});
        }
      });
      menu.appendChild(adimBotLink);
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

  window.addEventListener('adimbot:statechange', () => {
    const panel = document.querySelector('[data-profile-adimbot-panel]');
    if (panel && !panel.hidden) syncAdimBotPanel(panel);
  });
  window.addEventListener('hashchange', () => setTimeout(insertLinks, 0));
  document.addEventListener('DOMContentLoaded', () => setTimeout(insertLinks, 0));
  setTimeout(insertLinks, 0);
})();
