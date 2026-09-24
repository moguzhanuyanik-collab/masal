'use strict';
(() => {
  const CHAT_CONTEXT_KEY='ilkadim.adimbot.chat.context.v1';

  const clean=value=>String(value??'').replace(/\s+/g,' ').trim();

  const firstText=selectors=>{
    for(const selector of selectors){
      const el=document.querySelector(selector);
      const text=clean(el?.textContent);
      if(text)return text;
    }
    return '';
  };

  const captureLearningContext=()=>{
    const hash=location.hash||'#/anasayfa';
    if(hash.startsWith('#/profil'))return;

    const context={
      screen:hash.replace(/^#\//,'').split('/')[0]||'anasayfa'
    };

    const lesson=firstText([
      '#screen .lesson-title','#screen .course-title','#screen .screen-title',
      '#screen h1','#screen h2'
    ]);
    const topic=firstText([
      '#screen .topic-title','#screen .lesson-topic','#screen h3'
    ]);
    const question=firstText([
      '#screen [data-question-text]','#screen .question-text','#screen .question-prompt',
      '#screen .question-stem','#screen .puzzle-question','#screen .teacher-question > strong'
    ]);
    const activity=firstText([
      '#screen .game-title','#screen .activity-title','#screen .game-intro'
    ]);

    if(lesson)context.lesson=lesson.slice(0,80);
    if(topic&&topic!==lesson)context.topic=topic.slice(0,80);
    if(activity)context.activity=activity.slice(0,80);
    if(question)context.question=question.replace(/^(?:şimdi\s+)?sıra\s+sende\s*[!:.\-–—]*\s*/i,'').slice(0,240);

    try{sessionStorage.setItem(CHAT_CONTEXT_KEY,JSON.stringify(context));}catch(_){}
  };

  const currentChatContext=()=>{
    try{
      const saved=JSON.parse(sessionStorage.getItem(CHAT_CONTEXT_KEY)||'null');
      if(saved&&typeof saved==='object')return saved;
    }catch(_){}
    return {screen:'profil'};
  };

  const appendChatMessage=(box,role,message)=>{
    const item=document.createElement('div');
    item.className='adb-profile-chat-message '+(role==='user'?'is-user':'is-bot');
    const label=document.createElement('strong');
    label.textContent=role==='user'?'Sen':'AdımBot';
    const text=document.createElement('p');
    text.textContent=String(message||'');
    item.append(label,text);
    box.appendChild(item);

    while(box.children.length>12){
      box.firstElementChild?.remove();
    }
    box.scrollTop=box.scrollHeight;
  };

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
      '<label class="adb-profile-setting-row"><span><strong>Robot görünür</strong><small>AdımBot ekranda görünsün</small></span><input type="checkbox" data-profile-adimbot-visible></label>',
      '<div class="adb-profile-chat" data-adimbot-chat>',
      '<div class="adb-profile-chat-head"><strong>AdımBot ile Sohbet</strong><small>Dersinle ilgili bir şey sor. Cevabı söylemek yerine birlikte düşünürüz.</small></div>',
      '<div class="adb-profile-chat-messages" data-adimbot-chat-messages aria-live="polite"></div>',
      '<form class="adb-profile-chat-form" data-adimbot-chat-form>',
      '<input type="text" maxlength="400" autocomplete="off" placeholder="AdımBot’a bir şey sor..." data-adimbot-chat-input>',
      '<button type="submit">Gönder</button>',
      '</form>',
      '<small class="adb-profile-chat-status" data-adimbot-chat-status></small>',
      '</div>'
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

    const chatBox=panel.querySelector('[data-adimbot-chat-messages]');
    const chatForm=panel.querySelector('[data-adimbot-chat-form]');
    const chatInput=panel.querySelector('[data-adimbot-chat-input]');
    const chatStatus=panel.querySelector('[data-adimbot-chat-status]');
    let chatBusy=false;

    if(chatBox&&!chatBox.children.length){
      appendChatMessage(chatBox,'bot','Merhaba! Dersinle ilgili merak ettiğin bir şeyi sorabilirsin.');
    }

    chatForm?.addEventListener('submit',async event=>{
      event.preventDefault();
      if(chatBusy)return;

      const message=clean(chatInput?.value).slice(0,400);
      if(!message||!chatInput||!chatBox)return;

      chatBusy=true;
      chatInput.value='';
      chatInput.disabled=true;
      const submit=chatForm.querySelector('button[type="submit"]');
      if(submit)submit.disabled=true;
      if(chatStatus)chatStatus.textContent='AdımBot düşünüyor...';
      appendChatMessage(chatBox,'user',message);

      try{
        const ai=window.AdimBotAI;
        if(!ai||typeof ai.askAndSpeak!=='function'){
          appendChatMessage(chatBox,'bot','AdımBot yapay zekâ bağlantısı henüz hazır değil.');
          return;
        }
        const result=await ai.askAndSpeak(message,currentChatContext());
        appendChatMessage(chatBox,'bot',result?.text||'Şu anda yanıt oluşturamadım.');
      }catch(_){
        appendChatMessage(chatBox,'bot','Şu anda yanıt veremedim. İstersen tekrar deneyebilirsin.');
      }finally{
        chatBusy=false;
        chatInput.disabled=false;
        if(submit)submit.disabled=false;
        if(chatStatus)chatStatus.textContent='';
        chatInput.focus();
      }
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
  window.addEventListener('hashchange', () => {
    setTimeout(()=>{
      captureLearningContext();
      insertLinks();
    },0);
  });
  document.addEventListener('DOMContentLoaded', () => setTimeout(()=>{
    captureLearningContext();
    insertLinks();
  },0));
  setTimeout(()=>{
    captureLearningContext();
    insertLinks();
  },0);
})();
