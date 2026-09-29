'use strict';
(() => {
  if (window.AdimBotChatUI) return;

  const CONTEXT_KEY='ilkadim.adimbot.chat.context.v1';
  const HISTORY_KEY='ilkadim.adimbot.chat.history.v1';
  const HINT_KEY='ilkadim.adimbot.chat.hint.v1';
  const TOGETHER_KEY='ilkadim.adimbot.chat.together.v1';
  const scopedKey=base=>{
    const studentId=Number(window.ILKADIM_CURRENT_STUDENT_ID||0);
    return base+'.'+(Number.isInteger(studentId)&&studentId>0?'student-'+studentId:'anonymous');
  };
  const MAX_HISTORY=6;
  let modal=null;
  let chatBusy=false;
  let lastTrigger=null;
  let voiceSession=null;
  let voiceGeneration=0;
  let voiceRequestController=null;
  let retryMessage='';
  let chatRequest=null;
  let chatGeneration=0;

  const cancelChat=(restore=false)=>{
    const pending=chatRequest;
    if(!pending)return;
    chatGeneration++;
    chatRequest=null;
    pending.controller.abort();
    if(restore){
      rollbackPendingUser(pending.message);
      retryMessage=pending.message;
      const input=modal?.querySelector('[data-adimbot-chat-input]');
      if(input){input.value=pending.message;input.dispatchEvent(new Event('input',{bubbles:true}));}
    }
    chatBusy=false;
    const form=modal?.querySelector('[data-adimbot-chat-form]');
    const input=modal?.querySelector('[data-adimbot-chat-input]');
    if(input)input.disabled=false;
    const submit=form?.querySelector('button[type="submit"]');
    if(submit)submit.disabled=false;
    modal?.removeAttribute('aria-busy');
  };

  const stopVoice=(discard=false)=>{
    const session=voiceSession;
    voiceSession=null;
    if(discard)voiceGeneration++;
    if(discard&&voiceRequestController){voiceRequestController.abort();voiceRequestController=null;}
    if(!session)return;
    clearTimeout(session.timer);
    clearInterval(session.countdownTimer);
    clearInterval(session.meterTimer);
    try{session.recognition?.stop();}catch(_){}
    try{if(session.recorder?.state==='recording')session.recorder.stop();}catch(_){}
    try{session.audioContext?.close?.();}catch(_){}
    session.stream?.getTracks().forEach(track=>track.stop());
    const mic=modal?.querySelector('[data-adimbot-microphone]');
    if(mic){mic.textContent='🎤';mic.setAttribute('aria-label','Mikrofonla sor');mic.setAttribute('aria-pressed','false');}
  };

  const clean=value=>String(value??'').replace(/\s+/g,' ').trim();

  const voiceErrorMessage=reason=>({
    provider_rate_limit:'Sesli kullanım sınırına ulaşıldı. Biraz sonra tekrar dene.',
    rate_limit:'Sesli kullanım sınırına ulaşıldı. Biraz sonra tekrar dene.',
    provider_auth_error:'Ses sağlayıcısının API anahtarı reddedildi. Lütfen yöneticine haber ver.',
    provider_config_error:'Ses sağlayıcısının model ayarı geçersiz. Lütfen yöneticine haber ver.',
    provider_disabled:'Sesli konuşma bağlantısı henüz ayarlanmamış. Sorunu yazarak gönderebilirsin.',
    provider_timeout:'Sesin yazıya çevrilmesi uzun sürdü. Tekrar deneyebilirsin.',
    provider_connection_error:'Ses sağlayıcısına bağlanılamadı. İnternet bağlantısını kontrol et.',
    provider_unavailable:'Ses sağlayıcısı şu anda meşgul. Biraz sonra tekrar dene.',
    format:'Bu cihazın ses kayıt biçimi desteklenmedi. Tarayıcı yöntemini seçebilir veya yazabilirsin.',
    size:'Kayıt çok kısa veya büyük. En fazla 15 saniye konuş.',
    empty:'Ses anlaşılmadı. Mikrofona daha yakın konuşup tekrar dene.',
    csrf:'Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar dene.',
    curl_missing:'Sunucudaki ses bağlantısı hazır değil. Lütfen yöneticine haber ver.',
    invalid_provider_response:'Ses sağlayıcısının yanıtı okunamadı. Biraz sonra tekrar dene.',
    provider_safety:'Bu ses güvenli biçimde yazıya çevrilemedi. Sorunu yazarak gönderebilirsin.',
    auth:'Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar dene.',
    origin:'Ses isteğinin güvenlik doğrulaması başarısız oldu. Sayfayı yenileyip tekrar dene.',
    upload:'Ses kaydı sunucuya ulaşmadı. Mikrofona dokunup tekrar dene.',
    disabled:'Mikrofonla sohbet şu anda kapalı. Sorunu yazarak gönderebilirsin.'
  }[String(reason||'')]||'Ses yazıya çevrilemedi. Biraz sonra tekrar deneyebilirsin.');

  const voiceHttpReason=status=>{
    if(status===401||status===403)return 'auth';
    if(status===408||status===504)return 'provider_timeout';
    if(status===413)return 'size';
    if(status===415)return 'format';
    if(status===429)return 'provider_rate_limit';
    if(status>=500)return 'provider_unavailable';
    return 'provider_error';
  };

  const retryableChatReasons=new Set(['timeout','provider_timeout','provider_connection_error','provider_unavailable','provider_error','invalid_provider_response','invalid_response']);

  const microphoneStartMessage=error=>{
    const name=String(error?.name||'');
    if(name==='NotAllowedError'||name==='SecurityError')return 'Mikrofon izni kapalı. Tarayıcı ayarlarından mikrofon iznini açıp tekrar dene.';
    if(name==='NotFoundError'||name==='DevicesNotFoundError')return 'Bu cihazda kullanılabilir mikrofon bulunamadı.';
    if(name==='NotReadableError'||name==='TrackStartError')return 'Mikrofon başka bir uygulama tarafından kullanılıyor olabilir. Kapatıp tekrar dene.';
    return 'Mikrofon başlatılamadı. İzni ve cihaz desteğini kontrol et.';
  };

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

    try{sessionStorage.setItem(scopedKey(CONTEXT_KEY),JSON.stringify(context));}catch(_){}
  };

  const currentContext=()=>{
    captureContext();
    try{
      const saved=JSON.parse(sessionStorage.getItem(scopedKey(CONTEXT_KEY))||'null');
      if(saved&&typeof saved==='object')return saved;
    }catch(_){}
    return {screen:(location.hash||'#/anasayfa').replace(/^#\//,'').split('/')[0]||'anasayfa'};
  };


  const learningContext=()=>{
    const base={...currentContext()};
    try{
      const student=window.AdimBotStudent?.context?.()||{};
      const difficulty=window.AdimBotStudent?.difficulty?.(base)||{};
      const review=window.AdimBotStudent?.review?.(base)||{};
      const lesson=window.AdimBotStudent?.lessonSummary?.(base)||{};
      const number=value=>Math.max(0,Math.min(9999,Number(value)||0));
      base.completedSteps=number(student.completedSteps);
      base.gamesCompleted=number(student.games);
      base.readingsCompleted=number(student.readings);
      base.lessonAttempts=number(lesson.attempts);
      base.lessonCorrect=number(lesson.correct);
      base.lessonWrong=number(lesson.wrong);
      base.lessonSteps=number(lesson.steps);
      if(difficulty?.primary?.lesson)base.practiceLesson=clean(difficulty.primary.lesson).slice(0,80);
      if(review?.needed&&review.lesson)base.reviewLesson=clean(review.lesson).slice(0,80);
      if(review?.needed&&review.reason)base.reviewReason=clean(review.reason).slice(0,24);
      if(togetherActive())base.learningMode='together';
    }catch(_){}
    return base;
  };

  const hintSignature=()=>{
    const context=currentContext();
    return clean([context.screen,context.lesson,context.topic,context.activity,context.question].filter(Boolean).join('|')).slice(0,480);
  };

  const readHintState=()=>{
    const signature=hintSignature();
    try{
      const saved=JSON.parse(sessionStorage.getItem(scopedKey(HINT_KEY))||'null');
      if(saved&&saved.signature===signature){
        return {signature,level:Math.max(0,Math.min(3,Number(saved.level)||0))};
      }
    }catch(_){}
    return {signature,level:0};
  };

  const writeHintLevel=level=>{
    const state={signature:hintSignature(),level:Math.max(0,Math.min(3,Number(level)||0))};
    try{sessionStorage.setItem(scopedKey(HINT_KEY),JSON.stringify(state));}catch(_){}
    return state;
  };

  const resetHintState=()=>{
    try{sessionStorage.removeItem(scopedKey(HINT_KEY));}catch(_){}
  };

  const togetherActive=()=>{
    const signature=hintSignature();
    try{
      const saved=JSON.parse(sessionStorage.getItem(scopedKey(TOGETHER_KEY))||'null');
      return Boolean(saved&&saved.signature===signature&&saved.active===true);
    }catch(_){return false;}
  };

  const setTogetherActive=active=>{
    try{
      if(active)sessionStorage.setItem(scopedKey(TOGETHER_KEY),JSON.stringify({signature:hintSignature(),active:true}));
      else sessionStorage.removeItem(scopedKey(TOGETHER_KEY));
    }catch(_){}
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
      const controls=document.createElement('span');
      controls.className='adb-chat-voice-controls';

      const listen=document.createElement('button');
      listen.type='button';
      listen.className='adb-chat-listen';
      listen.setAttribute('aria-label','AdımBot yanıtını tekrar dinle');
      listen.textContent='🔊 Tekrar dinle';
      listen.addEventListener('click',()=>{
        try{
          const bot=window.AdimBotStudent;
          if(typeof bot?.speakLong==='function')bot.speakLong(clean(message));
          else bot?.speak?.(clean(message));
        }catch(_){}
      });

      const pause=document.createElement('button');
      pause.type='button';
      pause.className='adb-chat-listen';
      pause.setAttribute('aria-label','AdımBot sesini duraklat veya devam ettir');
      pause.textContent='⏸ Duraklat';
      pause.addEventListener('click',()=>{
        try{
          const bot=window.AdimBotStudent;
          if(bot?.isPaused?.()){
            if(bot.resume?.())pause.textContent='⏸ Duraklat';
          }else if(bot?.pause?.()){
            pause.textContent='▶️ Devam';
          }
        }catch(_){}
      });

      const stop=document.createElement('button');
      stop.type='button';
      stop.className='adb-chat-listen';
      stop.setAttribute('aria-label','AdımBot sesini durdur');
      stop.textContent='⏹ Durdur';
      stop.addEventListener('click',()=>{
        try{window.AdimBotStudent?.stop?.();pause.textContent='⏸ Duraklat';}catch(_){}
      });

      controls.append(listen,pause,stop);
      item.appendChild(controls);
    }

    box.appendChild(item);

    while(box.children.length>12)box.firstElementChild?.remove();
    box.scrollTop=box.scrollHeight;
    return item;
  };

  const readHistory=()=>{
    try{
      const raw=JSON.parse(sessionStorage.getItem(scopedKey(HISTORY_KEY))||'[]');
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
    try{sessionStorage.setItem(scopedKey(HISTORY_KEY),JSON.stringify(safe));}catch(_){}
    return safe;
  };

  const remember=(role,text)=>writeHistory([...readHistory(),{role,text}]);

  const rollbackPendingUser=message=>{
    const history=readHistory();
    const last=history[history.length-1];
    if(last?.role==='user'&&clean(last.text)===clean(message))history.pop();
    writeHistory(history);
  };

  const clearHistory=()=>{
    cancelChat();
    stopVoice(true);
    try{sessionStorage.removeItem(scopedKey(HISTORY_KEY));}catch(_){}
    retryMessage='';
    resetHintState();
    setTogetherActive(false);
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
      '<button type="button" data-adimbot-together aria-pressed="false">🤝 Birlikte çözelim</button>',
      '<button type="button" data-adimbot-summary>📋 Ders özeti</button>',
      '</div>',
      '<form class="adb-chat-form" data-adimbot-chat-form>',
      '<input type="text" maxlength="400" autocomplete="off" enterkeyhint="send" placeholder="AdımBot’a bir şey sor..." data-adimbot-chat-input>',
      '<button type="button" class="adb-chat-microphone" data-adimbot-microphone aria-label="Mikrofonla sor" aria-pressed="false">🎤</button>',
      '<button type="submit">Gönder</button>',
      '</form>',
      '<div class="adb-chat-meta"><small data-adimbot-chat-counter>0 / 400</small><small class="adb-chat-status" data-adimbot-chat-status role="status" aria-live="polite"></small></div>',
      '</section>'
    ].join('');

    document.body.appendChild(modal);

    const box=modal.querySelector('[data-adimbot-chat-messages]');
    const form=modal.querySelector('[data-adimbot-chat-form]');
    const input=modal.querySelector('[data-adimbot-chat-input]');
    const status=modal.querySelector('[data-adimbot-chat-status]');
    const counter=modal.querySelector('[data-adimbot-chat-counter]');
    const mic=modal.querySelector('[data-adimbot-microphone]');
    const contextBadge=modal.querySelector('[data-adimbot-chat-context]');
    const speechErrorHandler=event=>{
      if(modal.hidden||!status)return;
      const reason=String(event?.detail?.reason||'');
      status.dataset.adimbotSpeechError='1';
      status.textContent=reason==='unsupported'
        ?'Bu cihazda Türkçe sesli okuma desteklenmiyor; yanıtı ekrandan okuyabilirsin.'
        :reason==='not-allowed'||reason==='start_timeout'
          ?'Cihaz sesli okumayı başlatmadı. Tekrar dinle düğmesine dokunup ses iznini kontrol edebilirsin.'
        :reason==='timeout'
          ?'Sesli okuma takıldı ve güvenli biçimde durduruldu. Tekrar dinle düğmesini deneyebilirsin.'
          :reason==='turkish_voice_missing'
            ?'Cihazda Türkçe ses bulunamadı; varsayılan cihaz sesi kullanılacak.'
          :'Sesli okuma başlatılamadı. Cihazın ses ayarlarını kontrol edebilirsin.';
    };
    window.addEventListener('adimbot:speech-error',speechErrorHandler);
    window.addEventListener('adimbot:speech-start',()=>{if(status){delete status.dataset.adimbotSpeechError;status.textContent='';}});
    const voiceConfig=window.ADIMBOT_VOICE_CONFIG||{enabled:false,input:'browser'};
    if(mic)mic.hidden=!voiceConfig.enabled;
    if(voiceConfig.enabled)mic.title=voiceConfig.input==='browser'?'Tarayıcı ses tanımayı kullanır':'Ses kaydı seçilen yapay zekâ sağlayıcısına gönderilir';
    if(voiceConfig.enabled){
      const description=modal.querySelector('#adb-chat-desc');
      if(description)description.textContent=voiceConfig.input==='browser'
        ?'Mikrofona dokunup sorunu söyle; cihazın ses tanıması kullanılır.'
        :'Mikrofona dokunup sorunu söyle; kısa ses kaydı seçilen sağlayıcıya gönderilir.';
    }
    const recognized=text=>{
      if(modal.hidden||chatBusy)return;
      input.value=clean(text).slice(0,400);
      input.dispatchEvent(new Event('input',{bubbles:true}));
      if(input.value)form.requestSubmit();
      else if(status)status.textContent='Ses anlaşılmadı. Tekrar deneyebilirsin.';
    };
    mic?.addEventListener('click',async()=>{
      if(!voiceConfig.enabled||chatBusy)return;
      if(voiceSession){
        if(voiceSession.pending){stopVoice(true);status.textContent='Mikrofon isteği iptal edildi.';}
        else if(voiceSession.recognition){
          if(voiceSession.stopping)return;
          voiceSession.stopping=true;
          clearTimeout(voiceSession.timer);
          clearInterval(voiceSession.countdownTimer);
          status.textContent='Konuşman tamamlanıyor…';
          try{voiceSession.recognition.stop();}
          catch(_){stopVoice(true);status.textContent='Mikrofon durdurulamadı. Tekrar deneyebilirsin.';}
        }else stopVoice();
        return;
      }
      if(!navigator.onLine){status.textContent='Sesli sohbet için internet bağlantısı gerekli.';return;}
      try{window.AdimBotStudent?.stop?.();}catch(_){}
      const generation=++voiceGeneration;
      const selected=voiceConfig.input||'browser';
      const BrowserRecognition=window.SpeechRecognition||window.webkitSpeechRecognition;
      if(selected==='browser'){
        if(!BrowserRecognition){status.textContent='Bu cihazda mikrofonla yazma desteklenmiyor. Sorunu yazarak gönderebilirsin.';return;}
        try{
          const recognition=new BrowserRecognition();
          recognition.lang='tr-TR';recognition.interimResults=false;recognition.maxAlternatives=1;
          const browserSession={recognition,startedAt:Date.now()};
          browserSession.timer=setTimeout(()=>{
            if(generation!==voiceGeneration||voiceSession?.recognition!==recognition)return;
            stopVoice(true);
            status.textContent='Dinleme süresi doldu. Mikrofona dokunup tekrar deneyebilirsin.';
          },15000);
          browserSession.countdownTimer=setInterval(()=>{
            if(voiceSession!==browserSession)return;
            const left=Math.max(1,15-Math.floor((Date.now()-browserSession.startedAt)/1000));
            status.textContent='Dinliyorum… '+left+' saniye kaldı.';
          },1000);
          voiceSession=browserSession;
          mic.textContent='⏹';mic.setAttribute('aria-label','Dinlemeyi bitir');mic.setAttribute('aria-pressed','true');
          status.textContent='Dinliyorum… Konuşunca sorunu göndereceğim.';
          recognition.onresult=event=>{
            if(generation!==voiceGeneration)return;
            const transcript=event.results?.[0]?.[0]?.transcript||'';
            stopVoice();recognized(transcript);
          };
          recognition.onerror=event=>{if(generation===voiceGeneration&&voiceSession===browserSession){const reason=String(event?.error||'');stopVoice();status.textContent=reason==='not-allowed'||reason==='service-not-allowed'?'Mikrofon izni kapalı. Tarayıcı ayarlarından izin verip tekrar dene.':reason==='no-speech'||(reason==='aborted'&&browserSession.stopping)?'Ses algılanmadı. Mikrofona daha yakın konuşup tekrar dene.':'Mikrofon dinleyemedi. İzinleri kontrol edip tekrar dene.';}};
          recognition.onend=()=>{
            if(generation!==voiceGeneration||voiceSession?.recognition!==recognition)return;
            stopVoice();
            status.textContent='Ses algılanmadı. Mikrofona dokunup tekrar deneyebilirsin.';
          };
          recognition.start();
        }catch(_){stopVoice(true);status.textContent='Mikrofon başlatılamadı. Tarayıcı iznini kontrol et.';}
        return;
      }
      if(!navigator.mediaDevices?.getUserMedia||!window.MediaRecorder){status.textContent='Bu cihazda ses kaydı desteklenmiyor. Tarayıcı yöntemini seçebilir veya sorunu yazabilirsin.';return;}
      let stream;
      try{
        voiceSession={pending:true};
        status.textContent='Mikrofon izni bekleniyor…';
        stream=await navigator.mediaDevices.getUserMedia({audio:true});
        if(generation!==voiceGeneration||modal.hidden||!voiceSession?.pending){stream.getTracks().forEach(track=>track.stop());return;}
        const preferredMime=['audio/webm;codecs=opus','audio/webm','audio/mp4','audio/ogg'].find(type=>MediaRecorder.isTypeSupported(type));
        const recorder=preferredMime?new MediaRecorder(stream,{mimeType:preferredMime}):new MediaRecorder(stream);
        const mime=recorder.mimeType||preferredMime||'audio/webm';
        const chunks=[];
        const recordingSession={recorder,stream,startedAt:Date.now(),detectedSpeech:null,deviceEnded:false};
        const AudioContextClass=window.AudioContext||window.webkitAudioContext;
        if(AudioContextClass){
          try{
            const audioContext=new AudioContextClass();
            const analyser=audioContext.createAnalyser();
            analyser.fftSize=256;
            audioContext.createMediaStreamSource(stream).connect(analyser);
            try{audioContext.resume?.();}catch(_){}
            const samples=new Uint8Array(analyser.fftSize);
            recordingSession.audioContext=audioContext;
            recordingSession.detectedSpeech=audioContext.state==='running'?false:null;
            recordingSession.meterTimer=setInterval(()=>{
              if(audioContext.state!=='running'){recordingSession.detectedSpeech=null;return;}
              if(recordingSession.detectedSpeech===null)recordingSession.detectedSpeech=false;
              analyser.getByteTimeDomainData(samples);
              let peak=0;
              for(const sample of samples)peak=Math.max(peak,Math.abs(sample-128));
              if(peak>=7)recordingSession.detectedSpeech=true;
            },160);
          }catch(_){recordingSession.detectedSpeech=null;}
        }
        recordingSession.timer=setTimeout(()=>stopVoice(),15000);
        recordingSession.countdownTimer=setInterval(()=>{
          if(voiceSession!==recordingSession)return;
          const left=Math.max(1,15-Math.floor((Date.now()-recordingSession.startedAt)/1000));
          status.textContent='Dinliyorum… '+left+' saniye kaldı. Bitirmek için kare düğmeye dokun.';
        },1000);
        voiceSession=recordingSession;
        stream.getAudioTracks().forEach(track=>track.addEventListener('ended',()=>{
          if(voiceSession!==recordingSession)return;
          recordingSession.deviceEnded=true;
          stopVoice();
        },{once:true}));
        mic.textContent='⏹';mic.setAttribute('aria-label','Konuşmayı bitir');mic.setAttribute('aria-pressed','true');
        status.textContent='Dinliyorum… Bitirince kare düğmeye dokun.';
        recorder.ondataavailable=event=>{if(event.data.size)chunks.push(event.data);};
        recorder.onerror=()=>{if(generation===voiceGeneration&&!modal.hidden){stopVoice(true);status.textContent='Ses kaydı tamamlanamadı. Mikrofona yeniden dokunup dene.';}};
        recorder.onstop=async()=>{
          stream.getTracks().forEach(track=>track.stop());
          if(generation!==voiceGeneration||modal.hidden)return;
          if(recordingSession.deviceEnded){status.textContent='Mikrofon bağlantısı kesildi. Cihazı kontrol edip tekrar dene.';return;}
          if(Date.now()-recordingSession.startedAt<700){status.textContent='Kayıt çok kısa. Mikrofona dokunup en az bir saniye konuş.';return;}
          if(recordingSession.detectedSpeech===false){status.textContent='Konuşma sesi algılanmadı. Mikrofona daha yakın konuşup tekrar dene.';return;}
          const blob=new Blob(chunks,{type:mime});
          if(blob.size<100||blob.size>1600000){status.textContent='Kayıt çok kısa veya büyük. En fazla 15 saniye konuş.';return;}
          status.textContent='Konuşman yazıya çevriliyor…';
          try{
            const data=new FormData();data.append('audio',blob,'speech.'+(mime.includes('mp4')?'m4a':mime.includes('ogg')?'ogg':'webm'));
            const controller=new AbortController();voiceRequestController=controller;
            const requestTimer=setTimeout(()=>controller.abort(),30000);
            let response;
            try{response=await fetch('api/adimbot-transcribe.php',{method:'POST',credentials:'same-origin',signal:controller.signal,headers:{'X-CSRF-Token':String(window.ILKADIM_CSRF_TOKEN||'')},body:data});}
            finally{clearTimeout(requestTimer);if(voiceRequestController===controller)voiceRequestController=null;}
            let result=null;
            try{result=await response.json();}
            catch(_){throw new Error(response.ok?'invalid_provider_response':voiceHttpReason(response.status));}
            if(generation!==voiceGeneration||modal.hidden)return;
            if(!response.ok||!result?.ok)throw new Error(result?.reason||voiceHttpReason(response.status));
            recognized(result.text);
          }catch(error){
            const reason=error?.name==='AbortError'?'provider_timeout':error instanceof TypeError||navigator.onLine===false?'provider_connection_error':error?.message;
            if(generation===voiceGeneration&&!modal.hidden)status.textContent=voiceErrorMessage(reason);
          }
        };
        recorder.start(1000);
      }catch(error){stream?.getTracks().forEach(track=>track.stop());stopVoice(true);status.textContent=microphoneStartMessage(error);}
    });

    const syncConnection=()=>{
      if(!status)return;
      if(!navigator.onLine)status.textContent='İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
      else if(!chatBusy&&!status.dataset.adimbotSpeechError&&!status.dataset.adimbotRetry)status.textContent='';
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
      const difficulty=window.AdimBotStudent?.difficulty?.(context);
      const practice=difficulty?.primary?.lesson?('🎯 Biraz pratik: '+difficulty.primary.lesson):'';
      const labels=[];
      if(parts.length)labels.push('📚 '+parts.slice(0,2).join(' • '));
      if(practice)labels.push(practice);
      if(togetherActive())labels.push('🤝 Birlikte çözüyoruz');
      contextBadge.textContent=labels.join('   ');
      contextBadge.hidden=!labels.length;
    };

    const togetherButton=modal.querySelector('[data-adimbot-together]');
    const refreshTogetherButton=()=>{
      if(!togetherButton)return;
      const active=togetherActive();
      togetherButton.textContent=active?'🤝 Birlikte çözüyoruz':'🤝 Birlikte çözelim';
      togetherButton.setAttribute('aria-pressed',active?'true':'false');
    };
    refreshTogetherButton();
    togetherButton?.addEventListener('click',()=>{
      if(chatBusy||!input)return;
      if(togetherActive()){
        setTogetherActive(false);
        refreshTogetherButton();
        refreshContextBadge();
        if(status)status.textContent='Birlikte çözüm modu kapatıldı.';
        input.focus();
        return;
      }
      setTogetherActive(true);
      refreshTogetherButton();
      refreshContextBadge();
      input.value='Bu soruyu benim yerime yapmadan küçük adımlarla birlikte düşünelim. Önce yalnızca ilk adımı sor.';
      if(counter)counter.textContent=String(input.value.length)+' / 400';
      input.focus();
      if(typeof form?.requestSubmit==='function')form.requestSubmit();
    });

    const summaryButton=modal.querySelector('[data-adimbot-summary]');
    summaryButton?.addEventListener('click',()=>{
      if(chatBusy||!box)return;
      const summary=window.AdimBotStudent?.lessonSummary?.(currentContext());
      const message=clean(summary?.text)||'Bugün güzel bir çalışma yaptın. Şimdi öğrendiğin bir şeyi kendi cümlenle söylemeyi dene.';
      appendMessage(box,'bot',message);
      remember('assistant',message);
      try{window.AdimBotStudent?.speak?.(message);}catch(_){}
      if(status)status.textContent='Ders özeti hazır.';
      input?.focus();
    });

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
      if(voiceSession)stopVoice(true);
      if(chatBusy)return;

      refreshTogetherButton();
      refreshContextBadge();
      const message=clean(input?.value).slice(0,400);
      if(!message||!input||!box)return;
      if(!navigator.onLine){
        if(status)status.textContent='İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
        return;
      }

      chatBusy=true;
      const requestGeneration=++chatGeneration;
      const controller=new AbortController();
      chatRequest={controller,message};
      const retrying=retryMessage!==''&&retryMessage===message;
      retryMessage='';
      if(status)delete status.dataset.adimbotSpeechError;
      if(status)delete status.dataset.adimbotRetry;
      modal.setAttribute('aria-busy','true');
      try{window.AdimBotStudent?.emote?.('think',1600);}catch(_){}
      const waitEmotionTimer=setTimeout(()=>{
        if(chatBusy){try{window.AdimBotStudent?.emote?.('wait',5000);}catch(_){}}
      },1500);
      input.value='';
      if(counter)counter.textContent='0 / 400';
      input.disabled=true;
      const submit=form.querySelector('button[type="submit"]');
      if(submit)submit.disabled=true;
      if(status)status.textContent='AdımBot düşünüyor...';
      const historyBefore=readHistory();
      if(!retrying)appendMessage(box,'user',message);
      remember('user',message);

      try{
        const ai=window.AdimBotAI;
        if(!ai||typeof ai.ask!=='function'||typeof ai.deliver!=='function'){
          appendMessage(box,'bot','AdımBot yapay zekâ bağlantısı henüz hazır değil.');
          rollbackPendingUser(message);
        }else{
          const answer=await ai.ask(message,learningContext(),historyBefore,{signal:controller.signal});
          if(requestGeneration!==chatGeneration)return;
          const result=answer.ok||answer.blocked?ai.deliver(answer):answer;
          clearTimeout(waitEmotionTimer);
          try{window.AdimBotStudent?.clearEmotion?.();window.AdimBotStudent?.emote?.('surprised',850);}catch(_){}
          const reply=result?.text||'Şu anda yanıt oluşturamadım.';
          appendMessage(box,'bot',reply);
          if(result?.ok||result?.blocked)remember('assistant',reply);
          else if(retryableChatReasons.has(String(result?.reason||''))){
            rollbackPendingUser(message);
            retryMessage=message;
            input.value=message;
            if(counter)counter.textContent=String(message.length)+' / 400';
            if(status){status.dataset.adimbotRetry='1';status.textContent='Sorun kaybolmadı. Bağlantı düzeldiğinde Gönder düğmesine yeniden dokunabilirsin.';}
          }
        }
      }catch(_){
        if(requestGeneration!==chatGeneration)return;
        appendMessage(box,'bot','Şu anda yanıt veremedim. İstersen tekrar deneyebilirsin.');
        rollbackPendingUser(message);
        retryMessage=message;
        input.value=message;
        if(counter)counter.textContent=String(message.length)+' / 400';
        if(status){status.dataset.adimbotRetry='1';status.textContent='Sorun kaybolmadı. Gönder düğmesine yeniden dokunabilirsin.';}
      }finally{
        clearTimeout(waitEmotionTimer);
        if(requestGeneration!==chatGeneration)return;
        chatRequest=null;
        chatBusy=false;
        modal.removeAttribute('aria-busy');
        input.disabled=false;
        if(submit)submit.disabled=false;
        if(status&&!status.dataset.adimbotSpeechError&&!status.dataset.adimbotRetry)status.textContent=navigator.onLine?'':'İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
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
      const difficulty=window.AdimBotStudent?.difficulty?.(context);
      const labels=[];
      if(parts.length)labels.push('📚 '+parts.slice(0,2).join(' • '));
      if(difficulty?.primary?.lesson)labels.push('🎯 Biraz pratik: '+difficulty.primary.lesson);
      if(togetherActive())labels.push('🤝 Birlikte çözüyoruz');
      contextBadge.textContent=labels.join('   ');
      contextBadge.hidden=!labels.length;
    }
    const togetherButton=dialog.querySelector('[data-adimbot-together]');
    if(togetherButton){
      const active=togetherActive();
      togetherButton.textContent=active?'🤝 Birlikte çözüyoruz':'🤝 Birlikte çözelim';
      togetherButton.setAttribute('aria-pressed',active?'true':'false');
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
    cancelChat(true);
    stopVoice(true);
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
  document.addEventListener('visibilitychange',()=>{if(document.hidden)stopVoice(true);});
  document.addEventListener('DOMContentLoaded',()=>setTimeout(captureContext,80),{once:true});
  setTimeout(captureContext,80);

  window.AdimBotChatUI=Object.freeze({open,close,clearHistory,captureContext,currentContext,learningContext,history:()=>readHistory().map(item=>({...item}))});
})();
