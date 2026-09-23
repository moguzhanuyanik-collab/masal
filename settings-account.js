'use strict';
(() => {
  const nativeToDataURL = HTMLCanvasElement.prototype.toDataURL;
  if (!HTMLCanvasElement.prototype.__ilkadimProfileCompact) {
    Object.defineProperty(HTMLCanvasElement.prototype, '__ilkadimProfileCompact', { value: true });
    HTMLCanvasElement.prototype.toDataURL = function(type, quality) {
      if (type === 'image/jpeg' && this.width === 256 && this.height === 256) {
        const small = document.createElement('canvas');
        small.width = 192;
        small.height = 192;
        const ctx = small.getContext('2d');
        if (ctx) {
          ctx.drawImage(this, 0, 0, 192, 192);
          return nativeToDataURL.call(small, 'image/jpeg', 0.72);
        }
      }
      return nativeToDataURL.call(this, type, quality);
    };
  }

  let csrf = '';

  async function loadAccount(form) {
    const status = form.querySelector('[data-account-status]');
    try {
      const response = await fetch('api/account.php', {
        credentials: 'same-origin',
        headers: { 'Accept': 'application/json' },
        cache: 'no-store'
      });
      const data = await response.json();
      if (!response.ok || !data.ok) throw new Error(data.message || 'Hesap bilgileri alınamadı.');
      csrf = data.csrf || '';
      form.querySelector('[name="email"]').value = data.email || '';
      status.textContent = 'E-posta ve şifreni buradan değiştirebilirsin.';
    } catch (error) {
      status.textContent = error.message || 'Hesap bilgileri yüklenemedi.';
    }
  }

  function enhanceSettings() {
    const settingsForm = document.querySelector('#settings-form');
    if (!settingsForm || document.querySelector('[data-account-settings]')) return;

    const account = document.createElement('form');
    account.className = 'settings-block';
    account.setAttribute('data-account-settings', '1');
    account.innerHTML = `
      <h2>Giriş Bilgilerim</h2>
      <label class="field-label" for="account-email">E-posta</label>
      <input class="text-input" type="email" id="account-email" name="email" autocomplete="username" required>
      <label class="field-label" for="account-current-password">Mevcut şifre</label>
      <input class="text-input" type="password" id="account-current-password" name="current_password" autocomplete="current-password" required>
      <label class="field-label" for="account-new-password">Yeni şifre</label>
      <input class="text-input" type="password" id="account-new-password" name="new_password" minlength="8" autocomplete="new-password" placeholder="Değiştirmeyeceksen boş bırak">
      <label class="field-label" for="account-new-password-repeat">Yeni şifre tekrar</label>
      <input class="text-input" type="password" id="account-new-password-repeat" name="new_password_repeat" minlength="8" autocomplete="new-password">
      <button class="button primary full" type="submit">Giriş Bilgilerini Kaydet</button>
      <p class="setting-hint" data-account-status>Hesap bilgileri yükleniyor...</p>
    `;
    settingsForm.insertAdjacentElement('afterend', account);

    const localData = document.querySelector('.settings-block.local-data');
    if (localData && !localData.querySelector('[data-photo-size-note]')) {
      const note = document.createElement('p');
      note.setAttribute('data-photo-size-note', '1');
      note.textContent = 'Profil fotoğrafı otomatik olarak 192 × 192 piksele küçültülür ve sıkıştırılmış olarak saklanır.';
      localData.insertBefore(note, localData.lastElementChild);
    }

    if (!document.querySelector('[data-settings-logout]')) {
      const logout = document.createElement('a');
      logout.className = 'button soft full';
      logout.href = 'logout.php';
      logout.setAttribute('data-settings-logout', '1');
      logout.textContent = 'Çıkış Yap';
      (localData || account).insertAdjacentElement('afterend', logout);
    }

    account.addEventListener('submit', async event => {
      event.preventDefault();
      const status = account.querySelector('[data-account-status]');
      const form = new FormData(account);
      const payload = {
        email: String(form.get('email') || ''),
        current_password: String(form.get('current_password') || ''),
        new_password: String(form.get('new_password') || ''),
        new_password_repeat: String(form.get('new_password_repeat') || '')
      };
      status.textContent = 'Kaydediliyor...';
      try {
        const response = await fetch('api/account.php', {
          method: 'POST',
          credentials: 'same-origin',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-Token': csrf
          },
          body: JSON.stringify(payload)
        });
        const data = await response.json();
        if (!response.ok || !data.ok) throw new Error(data.message || 'Hesap bilgileri güncellenemedi.');
        csrf = data.csrf || csrf;
        account.querySelector('[name="current_password"]').value = '';
        account.querySelector('[name="new_password"]').value = '';
        account.querySelector('[name="new_password_repeat"]').value = '';
        status.textContent = data.message || 'Giriş bilgileri güncellendi.';
        const toast = document.querySelector('.toast');
        if (toast) {
          toast.textContent = status.textContent;
          toast.classList.add('show');
          setTimeout(() => toast.classList.remove('show'), 3500);
        }
      } catch (error) {
        status.textContent = error.message || 'Hesap bilgileri güncellenemedi.';
      }
    });

    loadAccount(account);
  }

  const screen = document.getElementById('screen');
  if (screen) new MutationObserver(enhanceSettings).observe(screen, { childList: true, subtree: true });
  window.addEventListener('hashchange', () => setTimeout(enhanceSettings, 0));
  document.addEventListener('DOMContentLoaded', () => setTimeout(enhanceSettings, 0));
  setTimeout(enhanceSettings, 0);
})();
