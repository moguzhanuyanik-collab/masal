'use strict';
(() => {
  if (window.AdimBotChatUI) return;

  const CONTEXT_KEY='ilkadim.adimbot.chat.context.v1';
  const HISTORY_KEY='ilkadim.adimbot.chat.history.v1';
  const MAX_HISTORY=6;
  let modal=null;
  let chatBusy=false;

  const clean=value=>String(value??'').replace(/\s+/g,' ').trim();

  const firstText=selectors=>{
    for(const selector of selectors){
      const el=document.querySelector(selector);
      const value=clean(el?.textContent);
      if(value)return value;
    }
    return '';
  };

  const captureContext=()=>{
    const hash=location.hash||'#/anasayfa';
    if(hash.startsWith('#/profil')||hash.startsWith('#/adimbot-ayarlari'))return;

    const context={screen:hash.replace(/^#\//,'').split('/')[0]||'anasayfa'};
    const lesson=firstText([
      '#screen .lesson-title','#screen .course-title','#screen .screen-title',
      '#screen h1','#screen h2'
    ]);
    const topic=firstText(['#screen .topic-title','#screen .lesson-topic','#screen h3']);
    const activity=firstText(['#screen .game-title','#screen .activity-title','#screen .game-intro']);
    const question=firstText([
      '#screen [data-question-text]','#screen .question-text','#screen .question-prompt',
      '#screen .question-stem','#screen .puzzle-question','#screen .teacher-question > strong'
    ]);

    if(lesson)context.lesson=lesson.slice(0,80);
    if(topic&&topic!==lesson)context.topic=topic.slice(0,80);
    if(activity)context.activity=activity.slice(0,80);
    if(question){
      context.question=question
        .replace(/^(?:şimdi\s+)?sıra\s+sende\s*[!:.\-–—]*\s*/i,'')
        .slice(0,240);
    }

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

  const appendMessage=(box,role,message)=>{
    const item=document.createElement('div');
    item.className='adb-chat-message '+(role==='user'?'adb-chat-user':'adb-chat-bot');

    const label=document.createElement('strong');
    label.textContent=role==='user'?'Sen':'AdımBot';

    const body=document.createElement('p');
    body.textContent=String(message||'');

    item.append(label,body);
    box.appendChild(item);

    while(box.children.length>12)box.firstElementChild?.remove();
    box.scrollTop=box.scrollHeight;
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
      '<section class="adb-chat-dialog" role="dialog" aria-modal="true" aria-labelledby="adb-chat-title">',
      '<header class="adb-chat-dialog-head">',
      '<div><strong id="adb-chat-title">AdımBot ile Sohbet</strong><small>Dersinle ilgili sor. Birlikte düşünüp keşfedelim.</small></div>',
      '<div class="adb-chat-head-actions"><button type="button" class="adb-chat-clear" data-adimbot-chat-clear>Temizle</button><button type="button" class="adb-chat-close" data-adimbot-chat-close aria-label="Sohbeti kapat">×</button></div>',
      '</header>',
      '<div class="adb-chat-context" data-adimbot-chat-context hidden></div>',
      '<div class="adb-chat-messages" data-adimbot-chat-messages aria-live="polite"></div>',
      '<div class="adb-chat-suggestions" data-adimbot-chat-suggestions>',
      '<button type="button" data-adimbot-suggestion="Bunu bana daha basit anlatır mısın?">✨ Basit anlat</button>',
      '<button type="button" data-adimbot-suggestion="Bana cevabı söylemeden küçük bir ipucu verir misin?">💡 İpucu ver</button>',
      '<button type="button" data-adimbot-suggestion="Bununla ilgili kolay bir örnek verir misin?">🧩 Örnek ver</button>',
      '</div>',
      '<form class="adb-chat-form" data-adimbot-chat-form>',
      '<input type="text" maxlength="400" autocomplete="off" enterkeyhint="send" placeholder="AdımBot’a bir şey sor..." data-adimbot-chat-input>',
      '<button type="submit">Gönder</button>',
      '</form>',
      '<small class="adb-chat-status" data-adimbot-chat-status></small>',
      '</section>'
    ].join('');

    document.body.appendChild(modal);

    const box=modal.querySelector('[data-adimbot-chat-messages]');
    const form=modal.querySelector('[data-adimbot-chat-form]');
    const input=modal.querySelector('[data-adimbot-chat-input]');
    const status=modal.querySelector('[data-adimbot-chat-status]');
    const contextBadge=modal.querySelector('[data-adimbot-chat-context]');

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

    modal.querySelectorAll('[data-adimbot-suggestion]').forEach(button=>{
      button.addEventListener('click',()=>{
        if(chatBusy||!input)return;
        input.value=button.getAttribute('data-adimbot-suggestion')||'';
        input.focus();
        if(typeof form?.requestSubmit==='function')form.requestSubmit();
      });
    });

    form?.addEventListener('submit',async event=>{
      event.preventDefault();
      if(chatBusy)return;

      const message=clean(input?.value).slice(0,400);
      if(!message||!input||!box)return;

      chatBusy=true;
      input.value='';
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
        input.disabled=false;
        if(submit)submit.disabled=false;
        if(status)status.textContent='';
        if(!modal.hidden)input.focus();
      }
    });

    return modal;
  };

  const open=()=>{
    const dialog=buildModal();
    captureContext();
    const contextBadge=dialog.querySelector('[data-adimbot-chat-context]');
    if(contextBadge){
      const context=currentContext();
      const parts=[context.lesson,context.topic,context.activity].map(clean).filter(Boolean);
      contextBadge.textContent=parts.length?'📚 '+parts.slice(0,2).join(' • '):'';
      contextBadge.hidden=!parts.length;
    }
    dialog.hidden=false;
    document.documentElement.classList.add('adb-chat-open');
    setTimeout(()=>dialog.querySelector('[data-adimbot-chat-input]')?.focus(),40);
    return true;
  };

  const close=()=>{
    if(!modal)return true;
    modal.hidden=true;
    document.documentElement.classList.remove('adb-chat-open');
    return true;
  };

  document.addEventListener('click',event=>{
    const trigger=event.target instanceof Element?event.target.closest('[data-adimbot-chat-open]'):null;
    if(!trigger)return;
    event.preventDefault();
    event.stopPropagation();
    open();
  });

  document.addEventListener('keydown',event=>{
    if(event.key==='Escape'&&modal&&!modal.hidden)close();
  });

  window.addEventListener('hashchange',()=>setTimeout(captureContext,80));
  document.addEventListener('DOMContentLoaded',()=>setTimeout(captureContext,80),{once:true});
  setTimeout(captureContext,80);

  window.AdimBotChatUI=Object.freeze({open,close,clearHistory,captureContext,currentContext,history:()=>readHistory().map(item=>({...item}))});
})();
