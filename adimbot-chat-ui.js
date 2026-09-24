'use strict';
(() => {
  if (window.AdimBotChatUI) return;

  const CONTEXT_KEY='ilkadim.adimbot.chat.context.v1';
  const HISTORY_KEY='ilkadim.adimbot.chat.history.v1';
  const HINT_KEY='ilkadim.adimbot.chat.hint.v1';
  const MAX_HISTORY=6;
  let modal=null;
  let chatBusy=false;
  let lastTrigger=null;

  const clean=value=>String(value??'').replace(/\s+/g,' ').trim();

  const isVisible=el=>{
    if(!(el instanceof Element)||el.closest('[data-adimbot-student],[data-adimbot-chat-modal]'))return false;
    const style=getComputedStyle(el);
    if(style.display==='none'||style.visibility==='hidden'||Number(style.opacity)===0)return false;
    const rect=el.getBoundingClientRect();
    return rect.width>1&&rect.height>1;
  };

  const elementText=el=>{
    if(!(el instanceof Element))return '';
    const explicit=clean(
      el.getAttribute('data-question-text')||
      el.getAttribute('data-adimbot-text')||
      el.getAttribute('data-title')||
      ''
    );
    return explicit||clean(el.textContent);
  };

  const firstText=selectors=>{
    for(const selector of selectors){
      const elements=[...document.querySelectorAll(selector)];
      const el=elements.find(isVisible);
      const value=elementText(el);
      if(value)return value;
    }
    return '';
  };

  const stripContextLabel=value=>clean(value)
    .replace(/^soru\s*[!:.-–—]*\s*/i,'')
    .replace(/^(?:[👉➡️✨⭐]\s*)*(?:şimdi\s+)?sıra\s+sende\s*[!:.-–—]*\s*/i,'')
    .trim();

  const routeLabel=()=>{
    const active=document.querySelector('.app-nav a.active,.app-nav a[aria-current="page"],.app-nav a.is-active');
    return isVisible(active)?clean(active.textContent):'';
  };

  const captureContext=()=>{
    const hash=location.hash||'#/anasayfa';
    if(hash.startsWith('#/profil')||hash.startsWith('#/adimbot-ayarlari'))return;

    const route=hash.replace(/^#\//,'').split('/').filter(Boolean);
    const context={screen:(routeLabel()||route[0]||'anasayfa').slice(0,80)};

    const lesson=firstText([
      '#screen [data-lesson-title]','#screen [data-lesson-name]','#screen [data-course-title]',
      '#screen .lesson-title','#screen .course-title',
      '#screen .teacher-lesson[open] > summary',
      '#screen .screen-title','#screen .page-title','#screen h1','#screen h2'
    ]);
    const topic=firstText([
      '#screen [data-topic-title]','#screen [data-topic-name]',
      '#screen .topic-title','#screen .lesson-topic',
      '#screen .teacher-topic[open] > summary',
      '#screen .breadcrumb .active','#screen h3'
    ]);
    const activity=firstText([
      '#screen [data-activity-title]','#screen [data-game-title]',
      '#screen .game-title','#screen .activity-title',
      '#screen .teacher-content-card h3','#screen .game-intro'
    ]);
    const question=firstText([
      '#screen [data-adimbot-read="text"][data-adimbot-text^="Soru"]',
      '#screen [data-question-text]','#screen .question-text','#screen .question-title',
      '#screen .question-prompt','#screen .question-stem',
      '#screen .question-card','#screen .quiz-question','#screen .exercise-question',
      '#screen .puzzle-question','#screen .teacher-question > strong'
    ]);

    const safeLesson=stripContextLabel(lesson);
    const safeTopic=stripContextLabel(topic);
    const safeActivity=stripContextLabel(activity);
    const safeQuestion=stripContextLabel(question);

    if(safeLesson)context.lesson=safeLesson.slice(0,80);
    if(safeTopic&&safeTopic!==safeLesson)context.topic=safeTopic.slice(0,80);
    if(safeActivity&&safeActivity!==safeLesson&&safeActivity!==safeTopic)context.activity=safeActivity.slice(0,80);
    if(safeQuestion)context.question=safeQuestion.slice(0,240);

    try{sessionStorage.setItem(CONTEXT_KEY,JSON.stringify(context));}catch(_){}
  };

  const currentContext=()=>{
    captureContext();
    try{
      const saved=JSON.parse(sessionStorage.getItem(CONTEXT_KEY)||'null');
      if(saved&&typeof saved==='object')return saved;
    }catch(_){}
    return {screen:(location.hash||'#/anasayfa').replace(/^#\//,'').split('/')[0]||'anasayfa'};
  };


  const hintSignature=()=>{
    const context=currentContext();
    return clean([context.screen,context.lesson,context.topic,context.activity,context.question].filter(Boolean).join('|')).slice(0,480);
  };

  const readHintState=()=>{
    const signature=hintSignature();
    try{
      const saved=JSON.parse(sessionStorage.getItem(HINT_KEY)||'null');
      if(saved&&saved.signature===signature){
        return {signature,level:Math.max(0,Math.min(3,Number(saved.level)||0))};
      }
    }catch(_){}
    return {signature,level:0};
  };

  const writeHintLevel=level=>{
    const state={signature:hintSignature(),level:Math.max(0,Math.min(3,Number(level)||0))};
    try{sessionStorage.setItem(HINT_KEY,JSON.stringify(state));}catch(_){}
    return state;
  };

  const resetHintState=()=>{
    try{sessionStorage.removeItem(HINT_KEY);}catch(_){}
  };

  const hintStep=()=>{
    const current=readHintState();
    const level=Math.min(3,current.level+1);
    writeHintLevel(level);
    if(level===1)return 'Bu sorunun cevabını söylemeden yalnızca ilk küçük ipucunu ver. Çocuğun kendisinin düşünmesini sağla.';
    if(level===2)return 'İlk ipucundan biraz daha açıklayıcı ikinci bir ipucu ver. Doğru cevabı veya doğru şıkkı yine söyleme.';
    return 'Bu soruyu 1. sınıf öğrencisinin anlayacağı şekilde adım adım açıkla. Sonucu veya doğru şıkkı doğrudan söyleme; son adımı öğrencinin bulmasına bırak.';
  };

  const appendMessage=(box,role,message,{speakable=true}={})=>{
    const item=document.createElement('div');
    item.className='adb-chat-message '+(role==='user'?'adb-chat-user':'adb-chat-bot');

    const label=document.createElement('strong');
    label.textContent=role==='user'?'Sen':'AdımBot';

    const body=document.createElement('p');
    body.textContent=String(message||'');

    item.append(label,body);

    if(role!=='user'&&speakable&&clean(message)){
      const listen=document.createElement('button');
      listen.type='button';
      listen.className='adb-chat-listen';
      listen.setAttribute('aria-label','AdımBot yanıtını tekrar dinle');
      listen.textContent='🔊 Tekrar dinle';
      listen.addEventListener('click',()=>{
        try{window.AdimBotStudent?.speak?.(clean(message));}catch(_){}
      });
      item.appendChild(listen);
    }

    box.appendChild(item);

    while(box.children.length>12)box.firstElementChild?.remove();
    box.scrollTop=box.scrollHeight;
    return item;
  };

  const readHistory=()=>{
    try{
      const raw=JSON.parse(sessionStorage.getItem(HISTORY_KEY)||'[]');
      if(!Array.isArray(raw))return [];
      return raw
        .filter(item=>item&&['user','assistant'].includes(item.role)&&clean(item.text))
        .slice(-MAX_HISTORY)
        .map(item=>({role:item.role,text:clean(item.text).slice(0,300)}));
    }catch(_){return [];}
  };

  const writeHistory=history=>{
    const safe=(Array.isArray(history)?history:[])
      .filter(item=>item&&['user','assistant'].includes(item.role)&&clean(item.text))
      .slice(-MAX_HISTORY)
      .map(item=>({role:item.role,text:clean(item.text).slice(0,300)}));
    try{sessionStorage.setItem(HISTORY_KEY,JSON.stringify(safe));}catch(_){}
    return safe;
  };

  const remember=(role,text)=>writeHistory([...readHistory(),{role,text}]);

  const clearHistory=()=>{
    try{sessionStorage.removeItem(HISTORY_KEY);}catch(_){}
    resetHintState();
    const hintButton=modal?.querySelector('[data-adimbot-hint]');
    if(hintButton){
      hintButton.textContent='💡 1. ipucu';
      hintButton.setAttribute('aria-label','Birinci ipucunu iste');
    }
    const box=modal?.querySelector('[data-adimbot-chat-messages]');
    if(box){
      box.innerHTML='';
      appendMessage(box,'bot','Yeni bir sohbet başlattık. Dersinle ilgili merak ettiğin bir şeyi sorabilirsin.');
    }
  };

  const buildModal=()=>{
    if(modal)return modal;

    modal=document.createElement('div');
    modal.className='adb-chat-modal';
    modal.setAttribute('data-adimbot-chat-modal','1');
    modal.hidden=true;
    modal.innerHTML=[
      '<div class="adb-chat-backdrop" data-adimbot-chat-close></div>',
      '<section class="adb-chat-dialog" role="dialog" aria-modal="true" aria-labelledby="adb-chat-title" aria-describedby="adb-chat-desc">',
      '<header class="adb-chat-dialog-head">',
      '<div><strong id="adb-chat-title">AdımBot ile Sohbet</strong><small id="adb-chat-desc">Dersinle ilgili sor. Birlikte düşünüp keşfedelim.</small></div>',
      '<div class="adb-chat-head-actions"><button type="button" class="adb-chat-clear" data-adimbot-chat-clear>Temizle</button><button type="button" class="adb-chat-close" data-adimbot-chat-close aria-label="Sohbeti kapat">×</button></div>',
      '</header>',
      '<div class="adb-chat-context" data-adimbot-chat-context hidden></div>',
      '<div class="adb-chat-messages" data-adimbot-chat-messages aria-live="polite"></div>',
      '<div class="adb-chat-suggestions" data-adimbot-chat-suggestions aria-label="AdımBot hızlı yardım seçenekleri">',
      '<button type="button" data-adimbot-suggestion="Bunu bana daha basit anlatır mısın?">✨ Basit anlat</button>',
      '<button type="button" data-adimbot-hint>💡 1. ipucu</button>',
      '<button type="button" data-adimbot-suggestion="Bununla ilgili kolay bir örnek verir misin?">🧩 Örnek ver</button>',
      '</div>',
      '<form class="adb-chat-form" data-adimbot-chat-form>',
      '<input type="text" maxlength="400" autocomplete="off" enterkeyhint="send" placeholder="AdımBot’a bir şey sor..." data-adimbot-chat-input>',
      '<button type="submit">Gönder</button>',
      '</form>',
      '<div class="adb-chat-meta"><small data-adimbot-chat-counter>0 / 400</small><small class="adb-chat-status" data-adimbot-chat-status></small></div>',
      '</section>'
    ].join('');

    document.body.appendChild(modal);

    const box=modal.querySelector('[data-adimbot-chat-messages]');
    const form=modal.querySelector('[data-adimbot-chat-form]');
    const input=modal.querySelector('[data-adimbot-chat-input]');
    const status=modal.querySelector('[data-adimbot-chat-status]');
    const counter=modal.querySelector('[data-adimbot-chat-counter]');
    const contextBadge=modal.querySelector('[data-adimbot-chat-context]');

    const syncConnection=()=>{
      if(!status)return;
      if(!navigator.onLine)status.textContent='İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
      else if(!chatBusy)status.textContent='';
    };

    input?.addEventListener('input',()=>{
      if(counter)counter.textContent=String(input.value.length)+' / 400';
    });
    window.addEventListener('online',syncConnection);
    window.addEventListener('offline',syncConnection);
    syncConnection();

    const savedHistory=readHistory();
    if(savedHistory.length){
      savedHistory.forEach(item=>appendMessage(box,item.role==='assistant'?'bot':'user',item.text));
    }else{
      appendMessage(box,'bot','Merhaba! Dersinle ilgili merak ettiğin bir şeyi sorabilirsin.');
    }

    modal.querySelector('[data-adimbot-chat-clear]')?.addEventListener('click',clearHistory);

    modal.querySelectorAll('[data-adimbot-chat-close]').forEach(el=>{
      el.addEventListener('click',()=>close());
    });

    const refreshContextBadge=()=>{
      if(!contextBadge)return;
      const context=currentContext();
      const parts=[context.lesson,context.topic,context.activity].map(clean).filter(Boolean);
      if(parts.length){
        contextBadge.textContent='📚 '+parts.slice(0,2).join(' • ');
        contextBadge.hidden=false;
      }else{
        contextBadge.textContent='';
        contextBadge.hidden=true;
      }
    };

    const hintButton=modal.querySelector('[data-adimbot-hint]');
    const refreshHintButton=()=>{
      if(!hintButton)return;
      const level=readHintState().level;
      hintButton.textContent=level===0?'💡 1. ipucu':level===1?'💡 2. ipucu':'🧠 Birlikte açıkla';
      hintButton.setAttribute('aria-label',level===0?'Birinci ipucunu iste':level===1?'İkinci ipucunu iste':'Soruyu birlikte açıklayalım');
    };
    refreshHintButton();

    hintButton?.addEventListener('click',()=>{
      if(chatBusy||!input)return;
      input.value=hintStep();
      if(counter)counter.textContent=String(input.value.length)+' / 400';
      refreshHintButton();
      input.focus();
      if(typeof form?.requestSubmit==='function')form.requestSubmit();
    });

    modal.querySelectorAll('[data-adimbot-suggestion]').forEach(button=>{
      button.addEventListener('click',()=>{
        if(chatBusy||!input)return;
        input.value=button.getAttribute('data-adimbot-suggestion')||'';
        if(counter)counter.textContent=String(input.value.length)+' / 400';
        input.focus();
        if(typeof form?.requestSubmit==='function')form.requestSubmit();
      });
    });

    form?.addEventListener('submit',async event=>{
      event.preventDefault();
      if(chatBusy)return;

      const message=clean(input?.value).slice(0,400);
      if(!message||!input||!box)return;
      if(!navigator.onLine){
        if(status)status.textContent='İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
        return;
      }

      chatBusy=true;
      modal.setAttribute('aria-busy','true');
      input.value='';
      if(counter)counter.textContent='0 / 400';
      input.disabled=true;
      const submit=form.querySelector('button[type="submit"]');
      if(submit)submit.disabled=true;
      if(status)status.textContent='AdımBot düşünüyor...';
      const historyBefore=readHistory();
      appendMessage(box,'user',message);
      remember('user',message);

      try{
        const ai=window.AdimBotAI;
        if(!ai||typeof ai.askAndSpeak!=='function'){
          appendMessage(box,'bot','AdımBot yapay zekâ bağlantısı henüz hazır değil.');
        }else{
          const result=await ai.askAndSpeak(message,currentContext(),historyBefore);
          const reply=result?.text||'Şu anda yanıt oluşturamadım.';
          appendMessage(box,'bot',reply);
          remember('assistant',reply);
        }
      }catch(_){
        appendMessage(box,'bot','Şu anda yanıt veremedim. İstersen tekrar deneyebilirsin.');
      }finally{
        chatBusy=false;
        modal.removeAttribute('aria-busy');
        input.disabled=false;
        if(submit)submit.disabled=false;
        if(status)status.textContent=navigator.onLine?'':'İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
        if(!modal.hidden)input.focus();
      }
    });

    return modal;
  };

  const focusables=()=>modal?[...modal.querySelectorAll('button:not([disabled]),input:not([disabled]),select:not([disabled]),textarea:not([disabled]),[href],[tabindex]:not([tabindex="-1"])')].filter(el=>!el.hidden):[];

  const open=(trigger=null)=>{
    const dialog=buildModal();
    lastTrigger=trigger instanceof HTMLElement?trigger:document.activeElement instanceof HTMLElement?document.activeElement:null;
    captureContext();
    const contextBadge=dialog.querySelector('[data-adimbot-chat-context]');
    if(contextBadge){
      const context=currentContext();
      const parts=[context.lesson,context.topic,context.activity].map(clean).filter(Boolean);
      contextBadge.textContent=parts.length?'📚 '+parts.slice(0,2).join(' • '):'';
      contextBadge.hidden=!parts.length;
    }
    const hintButton=dialog.querySelector('[data-adimbot-hint]');
    if(hintButton){
      const level=readHintState().level;
      hintButton.textContent=level===0?'💡 1. ipucu':level===1?'💡 2. ipucu':'🧠 Birlikte açıkla';
      hintButton.setAttribute('aria-label',level===0?'Birinci ipucunu iste':level===1?'İkinci ipucunu iste':'Soruyu birlikte açıklayalım');
    }
    dialog.hidden=false;
    document.documentElement.classList.add('adb-chat-open');
    setTimeout(()=>dialog.querySelector('[data-adimbot-chat-input]')?.focus(),40);
    return true;
  };

  const close=()=>{
    if(!modal)return true;
    modal.hidden=true;
    modal.removeAttribute('aria-busy');
    document.documentElement.classList.remove('adb-chat-open');
    const target=lastTrigger;
    lastTrigger=null;
    setTimeout(()=>target?.focus?.(),0);
    return true;
  };

  document.addEventListener('click',event=>{
    const trigger=event.target instanceof Element?event.target.closest('[data-adimbot-chat-open]'):null;
    if(!trigger)return;
    event.preventDefault();
    event.stopPropagation();
    open(trigger);
  });

  document.addEventListener('keydown',event=>{
    if(!modal||modal.hidden)return;
    if(event.key==='Escape'){
      event.preventDefault();
      close();
      return;
    }
    if(event.key!=='Tab')return;
    const items=focusables();
    if(!items.length)return;
    const first=items[0],last=items[items.length-1];
    if(event.shiftKey&&document.activeElement===first){
      event.preventDefault();
      last.focus();
    }else if(!event.shiftKey&&document.activeElement===last){
      event.preventDefault();
      first.focus();
    }
  });

  window.addEventListener('hashchange',()=>setTimeout(captureContext,80));
  document.addEventListener('DOMContentLoaded',()=>setTimeout(captureContext,80),{once:true});
  setTimeout(captureContext,80);

  window.AdimBotChatUI=Object.freeze({open,close,clearHistory,captureContext,currentContext,history:()=>readHistory().map(item=>({...item}))});
})();
