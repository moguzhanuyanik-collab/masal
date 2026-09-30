'use strict';
(() => {
  if (window.AdimBotChatUI) return;

  const CONTEXT_KEY='ilkadim.adimbot.chat.context.v1';
  const HISTORY_KEY='ilkadim.adimbot.chat.history.v1';
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
  let chatRetryUntil=0;
  let voiceRetryUntil=0;
  let focusGeneration=0,inputComposing=false,failedReplyBubble=null;
  const chatCooldownSeconds=(reason,value)=>quotaChatReasons.has(reason)?retryAfterSeconds(value):0;
  const isUnclearTranscript=value=>{
    if(typeof value!=='string')return true;
    const text=clean(value);
    if(!/[\p{L}\p{N}]/u.test(text))return true;
    return /^(?:[\[(](?:sessizlik|gürültü|müzik|alkiş|silence|noise|music|applause|blank[_ ]audio|no[_ ]speech|anlaşilmayan\s+ses|konuşma\s+yok|no\s+speech)[\])]|blank[_ ]audio|no[_ ]speech|anlaşilmayan\s+ses|konuşma\s+yok|no\s+speech)[.!]?$/u.test(text.toLocaleLowerCase('tr-TR').replace(/ı/g,'i'));
  };
  const mergeRecognizedDraft=(draft,spoken)=>{
    const typed=clean(draft),voice=clean(spoken);
    if(!typed)return voice;if(!voice)return typed;
    if(typed.toLocaleLowerCase('tr-TR')===voice.toLocaleLowerCase('tr-TR'))return typed;
    return typed+' '+voice;
  };
  const answerEmotion=(result,text)=>result?.blocked?'encourage':/^(?:Harika|Süper|Güzel|Aferin)\b/i.test(String(text||''))?'happy':'think';
  const setChatControlsBusy=(busy,input,submit,mic)=>{
    const disabled=busy===true;
    if(input)input.disabled=disabled;
    if(submit)submit.disabled=disabled;
    if(mic){mic.disabled=disabled;mic.setAttribute('aria-label',disabled?'AdımBot yanıt verirken mikrofon kapalı':'Mikrofonla sor');}
  };
  const appendFailureReply=(box,text,retrying)=>{
    if(retrying&&failedReplyBubble?.isConnected){
      const nearBottom=box.scrollHeight-box.scrollTop-box.clientHeight<48;
      const body=failedReplyBubble.querySelector('p');
      if(body)body.textContent=String(text||'');
      if(nearBottom)box.scrollTop=box.scrollHeight;
      return failedReplyBubble;
    }
    failedReplyBubble=appendMessage(box,'bot',text,{speakable:false});
    return failedReplyBubble;
  };
  const requestRecognizedSubmit=(form,status)=>{
    try{
      if(typeof form?.requestSubmit==='function'){form.requestSubmit();return true;}
      const button=form?.querySelector?.('button[type=\"submit\"]');
      if(button){button.click();return true;}
    }catch(_){}
    if(status)status.textContent='Soru gönderilemedi. Gönder düğmesine dokunup tekrar deneyebilirsin.';
    return false;
  };

  const cancelChat=(restore=false)=>{
    const pending=chatRequest;
    if(!pending)return;
    chatGeneration++;
    chatRequest=null;
    pending.controller.abort();
    clearTimeout(pending.emotionTimer);
    try{window.AdimBotStudent?.clearEmotion?.();}catch(_){}
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
    const mic=modal?.querySelector('[data-adimbot-microphone]');
    if(mic){mic.disabled=false;mic.setAttribute('aria-label','Mikrofonla sor');}
    modal?.removeAttribute('aria-busy');
  };

  const stopTracks=stream=>{
    let tracks=[];
    try{tracks=stream?.getTracks?.()||[];}catch(_){}
    for(const track of tracks){try{track.stop();}catch(_){}}
  };
  const releaseAudioContext=context=>{
    try{Promise.resolve(context?.close?.()).catch(()=>{});}catch(_){}
  };
  const showVoiceEmotion=type=>{
    try{
      if(type)window.AdimBotStudent?.emote?.(type,8000);
      else window.AdimBotStudent?.clearEmotion?.();
    }catch(_){}
  };
  const releaseVoiceRequest=(controller,generation)=>{
    if(voiceRequestController!==controller)return;
    voiceRequestController=null;
    if(generation!==voiceGeneration)return;
    const mic=modal?.querySelector('[data-adimbot-microphone]');
    if(mic){mic.disabled=false;mic.setAttribute('aria-label','Mikrofonla sor');}
    showVoiceEmotion(null);
  };
  const stopVoice=(discard=false)=>{
    const session=voiceSession;
    voiceSession=null;
    if(discard)voiceGeneration++;
    if(discard&&voiceRequestController){
      const controller=voiceRequestController;
      voiceRequestController=null;controller.abort();
      const mic=modal?.querySelector('[data-adimbot-microphone]');
      if(mic){mic.disabled=false;mic.setAttribute('aria-label','Mikrofonla sor');}
    }
    showVoiceEmotion(null);
    if(!session)return;
    clearTimeout(session.timer);
    clearTimeout(session.muteTimer);
    clearInterval(session.countdownTimer);
    clearInterval(session.meterTimer);
    try{session.recognition?.stop();}catch(_){}
    if(discard&&session.chunks)session.chunks.length=0;
    try{if(['recording','paused'].includes(session.recorder?.state))session.recorder.stop();}catch(_){}
    releaseAudioContext(session.audioContext);
    stopTracks(session.stream);
    const mic=modal?.querySelector('[data-adimbot-microphone]');
    if(mic){mic.textContent='🎤';mic.setAttribute('aria-label','Mikrofonla sor');mic.setAttribute('aria-pressed','false');}
  };

  const clean=value=>String(value??'').normalize('NFC').replace(/[\u200B-\u200F\u202A-\u202E\u2060-\u206F\uFEFF]/g,'').replace(/\s+/g,' ').trim();

  const retryAfterSeconds=value=>{
    const raw=String(value??'').trim();
    const seconds=/^\d+(?:\.\d+)?$/.test(raw)
      ?Math.ceil(Number(raw))
      :Math.ceil((Date.parse(raw)-Date.now())/1000);
    return Number.isFinite(seconds)?Math.max(0,Math.min(600,seconds)):0;
  };

  const cooldownRemaining=until=>Math.max(0,Math.ceil((until-Date.now())/1000));

  const privacySafeText=value=>clean(value)
    .replace(/((?:ş[iİı]frem|parolam|ş[iİı]fre|parola|ap[iİı][ _-]?(?:key|anahtar[ıiİ]|anahtar[ıiİ]m))\s*[:=]\s*)\S+/giu,'$1[gizlendi]')
    .replace(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/gi,'[e-posta gizlendi]')
    .replace(/(?:https?:\/\/|www\.)\S+/gi,'[bağlantı gizlendi]')
    .replace(/(?<!\d)(?:\+?90[\s.-]?)?\(?0?[2-5]\d{2}\)?[\s.-]?\d{3}[\s.-]?\d{2}[\s.-]?\d{2}(?!\d)/g,'[telefon gizlendi]')
    .replace(/(?<!\d)\d{11}(?!\d)/g,'[kimlik bilgisi gizlendi]');

  const voiceErrorMessage=reason=>({
    provider_rate_limit:'Sesli kullanım sınırına ulaşıldı. Biraz sonra tekrar dene.',
    rate_limit:'Sesli kullanım sınırına ulaşıldı. Biraz sonra tekrar dene.',
    provider_auth_error:'Ses sağlayıcısının API anahtarı reddedildi. Lütfen yöneticine haber ver.',
    provider_permission_error:'Ses sağlayıcısı bu hesap için erişim izni vermedi. Lütfen yöneticine haber ver.',
    provider_model_retired:'Seçilen ses modeli kullanımdan kaldırılmış. Lütfen yöneticine haber ver.',
    provider_model_unavailable:'Seçilen ses modeli bulunamadı veya bu hesapta kullanılamıyor. Lütfen yöneticine haber ver.',
    provider_config_error:'Ses sağlayıcısının model ayarı geçersiz. Lütfen yöneticine haber ver.',
    provider_disabled:'Sesli konuşma bağlantısı henüz ayarlanmamış. Sorunu yazarak gönderebilirsin.',
    provider_timeout:'Sesin yazıya çevrilmesi uzun sürdü. Tekrar deneyebilirsin.',
    provider_connection_error:'Ses sağlayıcısına bağlanılamadı. İnternet bağlantısını kontrol et.',
    provider_unavailable:'Ses sağlayıcısı şu anda meşgul. Biraz sonra tekrar dene.',
    provider_incomplete:'Ses yazıya çevrilirken yanıt yarım kaldı. Mikrofona dokunup tekrar söyle.',
    format:'Bu cihazın ses kayıt biçimi desteklenmedi. Tarayıcı yöntemini seçebilir veya yazabilirsin.',
    size:'Kayıt çok kısa veya büyük. En fazla 15 saniye konuş.',
    too_long:'Söylediğin soru biraz uzun oldu. Daha kısa bir cümleyle tekrar söyleyebilirsin.',
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

  const retryableChatReasons=new Set(['timeout','provider_timeout','provider_connection_error','provider_unavailable','provider_incomplete','provider_rate_limit','rate_limit','provider_error','invalid_provider_response','invalid_response','provider_auth_error','provider_permission_error','api_key_missing','model_missing','provider_model_retired','provider_model_unavailable','provider_config_error','provider_disabled','ai_disabled','curl_missing']);
  const quotaChatReasons=new Set(['provider_rate_limit','rate_limit']);
  const retryHint=reason=>({
    provider_auth_error:'AdımBot bağlantısı şu an yanıt veremedi. Biraz sonra sorunu yeniden deneyebilirsin.',
    provider_permission_error:'AdımBot bağlantısı şu an yanıt veremedi. Biraz sonra sorunu yeniden deneyebilirsin.',
    api_key_missing:'AdımBot bağlantısı şu an hazır değil. Biraz sonra sorunu yeniden deneyebilirsin.',
    model_missing:'AdımBot bağlantısı şu an hazır değil. Biraz sonra sorunu yeniden deneyebilirsin.',
    provider_model_retired:'AdımBot bağlantısı şu an yanıt veremedi. Biraz sonra sorunu yeniden deneyebilirsin.',
    provider_model_unavailable:'AdımBot bağlantısı şu an yanıt veremedi. Biraz sonra sorunu yeniden deneyebilirsin.',
    provider_config_error:'AdımBot bağlantısı şu an yanıt veremedi. Biraz sonra sorunu yeniden deneyebilirsin.',
    provider_disabled:'AdımBot bağlantısı şu an hazır değil. Biraz sonra sorunu yeniden deneyebilirsin.',
    ai_disabled:'AdımBot sohbeti şu an kullanılamıyor. Biraz sonra sorunu yeniden deneyebilirsin.',
    curl_missing:'AdımBot bağlantısı şu an hazır değil. Biraz sonra sorunu yeniden deneyebilirsin.'
  }[reason]||'Sorun kaybolmadı. Bağlantı düzeldiğinde Gönder düğmesine yeniden dokunabilirsin.');

  const microphoneStartMessage=error=>{
    const name=String(error?.name||'');
    if(name==='NotAllowedError'||name==='SecurityError')return 'Mikrofon izni kapalı. Tarayıcı ayarlarından mikrofon iznini açıp tekrar dene.';
    if(name==='NotFoundError'||name==='DevicesNotFoundError')return 'Bu cihazda kullanılabilir mikrofon bulunamadı.';
    if(name==='NotReadableError'||name==='TrackStartError')return 'Mikrofon başka bir uygulama tarafından kullanılıyor olabilir. Kapatıp tekrar dene.';
    return 'Mikrofon başlatılamadı. İzni ve cihaz desteğini kontrol et.';
  };

  const browserRecognitionMessage=(reason,stopping=false)=>{
    if(reason==='not-allowed'||reason==='service-not-allowed')return 'Mikrofon izni kapalı. Tarayıcı ayarlarından izin verip tekrar dene.';
    if(reason==='no-speech'||(reason==='aborted'&&stopping))return 'Ses algılanmadı. Mikrofona daha yakın konuşup tekrar dene.';
    if(reason==='audio-capture')return 'Tarayıcı mikrofondan ses alamadı. Mikrofonu kullanan başka uygulamaları kapatıp tekrar dene.';
    if(reason==='language-not-supported')return 'Bu tarayıcının ses tanıma hizmeti Türkçeyi desteklemiyor. Sorunu yazarak gönderebilir veya yöneticinden kayıt yöntemini değiştirmesini isteyebilirsin.';
    if(reason==='network')return 'Tarayıcının ses tanıma hizmetine bağlanılamadı. İnternet bağlantısını kontrol et.';
    return 'Mikrofon dinleyemedi. İzinleri kontrol edip tekrar dene.';
  };

  const createAudioRecorder=stream=>{
    const candidates=['audio/webm;codecs=opus','audio/webm','audio/mp4','audio/ogg'];
    for(const mimeType of candidates){
      try{
        if(typeof MediaRecorder.isTypeSupported==='function'&&!MediaRecorder.isTypeSupported(mimeType))continue;
        return new MediaRecorder(stream,{mimeType});
      }catch(_){}
    }
    return new MediaRecorder(stream);
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

  const appendMessage=(box,role,message,{speakable=true}={})=>{
    const nearBottom=box.scrollHeight-box.scrollTop-box.clientHeight<48;
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
      pause.setAttribute('data-adimbot-speech-pause','1');
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
    if(role==='user'||nearBottom)box.scrollTop=box.scrollHeight;
    return item;
  };

  const readHistory=()=>{
    try{
      const raw=JSON.parse(sessionStorage.getItem(scopedKey(HISTORY_KEY))||'[]');
      if(!Array.isArray(raw))return [];
      const safe=raw
        .filter(item=>item&&['user','assistant'].includes(item.role)&&clean(item.text))
        .slice(-MAX_HISTORY)
        .map(item=>({role:item.role,text:privacySafeText(item.text).slice(0,300)}));
      if(JSON.stringify(raw)!==JSON.stringify(safe))sessionStorage.setItem(scopedKey(HISTORY_KEY),JSON.stringify(safe));
      return safe;
    }catch(_){return [];}
  };

  const writeHistory=history=>{
    const safe=(Array.isArray(history)?history:[])
      .filter(item=>item&&['user','assistant'].includes(item.role)&&clean(item.text))
      .slice(-MAX_HISTORY)
      .map(item=>({role:item.role,text:privacySafeText(item.text).slice(0,300)}));
    try{sessionStorage.setItem(scopedKey(HISTORY_KEY),JSON.stringify(safe));}catch(_){}
    return safe;
  };

  const remember=(role,text)=>writeHistory([...readHistory(),{role,text}]);

  const rollbackPendingUser=message=>{
    const history=readHistory();
    const last=history[history.length-1];
    if(last?.role==='user'&&clean(last.text)===privacySafeText(message))history.pop();
    writeHistory(history);
  };

  const clearHistory=()=>{
    failedReplyBubble=null;
    cancelChat();
    stopVoice(true);
    try{window.AdimBotStudent?.stop?.();window.AdimBotStudent?.clearEmotion?.();}catch(_){}
    const input=modal?.querySelector('[data-adimbot-chat-input]');
    if(input){input.value='';input.dispatchEvent(new Event('input',{bubbles:true}));}
    inputComposing=false;
    try{sessionStorage.removeItem(scopedKey(HISTORY_KEY));}catch(_){}
    retryMessage='';
    setTogetherActive(false);
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
      '<section class="adb-chat-dialog" role="dialog" aria-modal="true" aria-labelledby="adb-chat-title" aria-describedby="adb-chat-desc" tabindex="-1">',
      '<header class="adb-chat-dialog-head">',
      '<div><strong id="adb-chat-title">AdımBot ile Sohbet</strong><small id="adb-chat-desc">Dersinle ilgili sor. Birlikte düşünüp keşfedelim.</small></div>',
      '<div class="adb-chat-head-actions"><button type="button" class="adb-chat-clear" data-adimbot-chat-clear>Temizle</button><button type="button" class="adb-chat-close" data-adimbot-chat-close aria-label="Sohbeti kapat">×</button></div>',
      '</header>',
      '<div class="adb-chat-context" data-adimbot-chat-context hidden></div>',
      '<div class="adb-chat-messages" data-adimbot-chat-messages aria-live="polite"></div>',
      '<div class="adb-chat-suggestions" data-adimbot-chat-suggestions aria-label="AdımBot hızlı yardım seçenekleri">',
      '<button type="button" data-adimbot-suggestion="Bunu bana daha basit anlatır mısın?">✨ Basit anlat</button>',
      '<button type="button" data-adimbot-suggestion="Bununla ilgili kolay bir örnek verir misin?">🧩 Örnek ver</button>',
      '<button type="button" data-adimbot-together aria-pressed="false">🤝 Birlikte çözelim</button>',
      '<button type="button" data-adimbot-summary>📋 Ders özeti</button>',
      '</div>',
      '<form class="adb-chat-form" data-adimbot-chat-form>',
      '<input type="text" maxlength="400" autocomplete="off" enterkeyhint="send" placeholder="AdımBot’a bir şey sor..." aria-label="AdımBot’a soracağın soru" data-adimbot-chat-input>',
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
          :({
            network:'Ses bağlantısı kesildi. Bağlantını kontrol edip yeniden deneyebilirsin.',
            'audio-busy':'Cihazın sesi şu an başka bir uygulama kullanıyor.',
            'audio-hardware':'Cihazın ses çıkışı kullanılamıyor.',
            'language-unavailable':'Bu cihazda Türkçe ses kullanılamıyor.',
            'voice-unavailable':'Seçilen Türkçe ses şu an kullanılamıyor.',
            'text-too-long':'Bu metin tek seferde okunamıyor. Daha kısa bir bölümü seçebilirsin.'
          }[reason]||'Sesli okuma başlatılamadı. Cihazın ses ayarlarını kontrol edebilirsin.');
    };
    window.addEventListener('adimbot:speech-error',speechErrorHandler);
    window.addEventListener('adimbot:speech-start',()=>{if(status){delete status.dataset.adimbotSpeechError;status.textContent='';}});
    const syncPauseControls=()=>{
      const paused=window.AdimBotStudent?.isPaused?.()===true;
      modal?.querySelectorAll('[data-adimbot-speech-pause]').forEach(button=>{
        button.textContent=paused?'▶️ Devam':'⏸ Duraklat';
        button.setAttribute('aria-label',paused?'AdımBot sesini devam ettir':'AdımBot sesini duraklat');
      });
    };
    window.addEventListener('adimbot:speech-end',syncPauseControls);
    window.addEventListener('adimbot:speech-pause',syncPauseControls);
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
      if(typeof text!=='string'){if(status)status.textContent=voiceErrorMessage('invalid_provider_response');return;}
      const transcript=clean(text);
      if(isUnclearTranscript(transcript)){if(status)status.textContent='Ses anlaşılmadı. Tekrar deneyebilirsin.';return;}
      const merged=mergeRecognizedDraft(input.value,transcript);
      input.value=merged;
      input.dispatchEvent(new Event('input',{bubbles:true}));
      if(merged.length>400){
        if(status)status.textContent='Konuşman uzun geldi. Göndermeden önce aşağıdaki metni 400 karaktere kadar kısalt.';
        input.focus();return;
      }
      requestRecognizedSubmit(form,status);
    };
    mic?.addEventListener('click',async()=>{
      if(!voiceConfig.enabled||chatBusy)return;
      const voiceWait=cooldownRemaining(voiceRetryUntil);
      if(voiceWait>0){
        status.textContent='Sesli kullanım sınırı için '+voiceWait+' saniye bekleyip tekrar dene.';
        return;
      }
      if(voiceRequestController){
        status.textContent='Önceki konuşman hâlâ yazıya çevriliyor. Birkaç saniye bekle.';
        return;
      }
      if(voiceSession){
        if(voiceSession.pending){stopVoice(true);status.textContent='Mikrofon isteği iptal edildi.';}
        else if(voiceSession.recognition){
          if(voiceSession.stopping)return;
          const recognitionToStop=voiceSession.recognition,stopGeneration=voiceGeneration;
          voiceSession.stopping=true;
          clearTimeout(voiceSession.timer);
          clearInterval(voiceSession.countdownTimer);
          voiceSession.timer=setTimeout(()=>{
            if(stopGeneration!==voiceGeneration||voiceSession?.recognition!==recognitionToStop)return;
            stopVoice(true);status.textContent='Tarayıcı dinlemeyi tamamlamadı. Mikrofona dokunup tekrar deneyebilirsin.';
          },2500);
          status.textContent='Konuşman tamamlanıyor…';
          try{voiceSession.recognition.stop();}
          catch(_){stopVoice(true);status.textContent='Mikrofon durdurulamadı. Tekrar deneyebilirsin.';}
        }else stopVoice();
        return;
      }
      if(!navigator.onLine){status.textContent='Sesli sohbet için internet bağlantısı gerekli.';return;}
      try{window.AdimBotStudent?.stop?.();}catch(_){}
      const generation=++voiceGeneration;
      const selected=String(voiceConfig.input||'browser').trim().toLowerCase();
      if(!['browser','groq','gemini'].includes(selected)){
        status.textContent='Mikrofon yöntemi ayarlarda geçersiz. Sorunu yazabilir veya yöneticine haber verebilirsin.';
        return;
      }
      const BrowserRecognition=window.SpeechRecognition||window.webkitSpeechRecognition;
      if(selected==='browser'){
        if(!BrowserRecognition){status.textContent='Bu cihazda mikrofonla yazma desteklenmiyor. Sorunu yazarak gönderebilirsin.';return;}
        try{
          const recognition=new BrowserRecognition();
          recognition.lang='tr-TR';recognition.interimResults=false;recognition.maxAlternatives=1;
          const browserSession={recognition,startedAt:0,pending:true,accepted:false,stopping:false};
          browserSession.timer=setTimeout(()=>{
            if(generation!==voiceGeneration||voiceSession?.recognition!==recognition)return;
            stopVoice(true);
            status.textContent='Mikrofon başlatılamadı. Tarayıcı iznini kontrol edip tekrar deneyebilirsin.';
          },15000);
          browserSession.countdownTimer=setInterval(()=>{
            if(voiceSession!==browserSession)return;
            const left=Math.max(1,15-Math.floor((Date.now()-(browserSession.startedAt||browserSession.requestedAt))/1000));
            showVoiceEmotion(browserSession.pending?'wait':'listen');
            status.textContent=(browserSession.pending?'Mikrofon izni bekleniyor… ':'Dinliyorum… ')+left+' saniye kaldı.';
          },1000);
          voiceSession=browserSession;
          mic.textContent='⏹';mic.setAttribute('aria-label','Dinlemeyi bitir');mic.setAttribute('aria-pressed','true');
          browserSession.requestedAt=Date.now();
          status.textContent='Mikrofon izni bekleniyor…';
          showVoiceEmotion('wait');
          recognition.onstart=()=>{
            if(generation!==voiceGeneration||voiceSession!==browserSession||modal.hidden)return;
            browserSession.pending=false;browserSession.startedAt=Date.now();
            clearTimeout(browserSession.timer);
            browserSession.timer=setTimeout(()=>{
              if(generation!==voiceGeneration||voiceSession!==browserSession)return;
              stopVoice(true);status.textContent='Dinleme süresi doldu. Tekrar deneyebilirsin.';
            },15000);
            status.textContent='Dinliyorum… Konuşman bitince otomatik göndereceğim.';
            showVoiceEmotion('listen');
          };
          recognition.onresult=event=>{
            if(generation!==voiceGeneration||voiceSession!==browserSession||browserSession.accepted)return;
            const parts=[];
            for(let i=0;i<(event.results?.length||0);i++){
              if(event.results?.[i]?.isFinal!==true)continue;
              const value=event.results?.[i]?.[0]?.transcript;
              if(typeof value==='string'&&value.trim())parts.push(value.trim());
            }
            const transcript=parts.join(' ');
            if(!transcript)return;
            browserSession.accepted=true;
            stopVoice();recognized(transcript);
          };
          recognition.onerror=event=>{if(generation===voiceGeneration&&voiceSession===browserSession){const reason=String(event?.error||'');stopVoice();status.textContent=browserRecognitionMessage(reason,browserSession.stopping===true);}};
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
        const permissionSession={pending:true};
        permissionSession.timer=setTimeout(()=>{
          if(generation!==voiceGeneration||voiceSession!==permissionSession)return;
          stopVoice(true);
          status.textContent='Mikrofon izni 15 saniye içinde verilmedi. İzni kontrol edip tekrar dene.';
        },15000);
        voiceSession=permissionSession;
        const permissionAt=Date.now();
        permissionSession.countdownTimer=setInterval(()=>{
          if(generation!==voiceGeneration||voiceSession!==permissionSession||modal.hidden)return;
          status.textContent='Mikrofon izni bekleniyor… '+Math.max(1,15-Math.floor((Date.now()-permissionAt)/1000))+' saniye kaldı.';
          showVoiceEmotion('wait');
        },1000);
        mic.textContent='⏹';mic.setAttribute('aria-label','Mikrofon isteğini iptal et');mic.setAttribute('aria-pressed','true');
        status.textContent='Mikrofon izni bekleniyor…';
        showVoiceEmotion('wait');
        stream=await navigator.mediaDevices.getUserMedia({audio:{echoCancellation:true,noiseSuppression:true,autoGainControl:true}});
        if(generation!==voiceGeneration||modal.hidden||voiceSession!==permissionSession){stopTracks(stream);return;}
        clearTimeout(permissionSession.timer);
        clearInterval(permissionSession.countdownTimer);
        const audioTracks=stream.getAudioTracks();
        if(!audioTracks.some(track=>track.readyState!=='ended'&&track.enabled!==false))throw Object.assign(new Error('no_audio_track'),{name:'NotFoundError'});
        const recorder=createAudioRecorder(stream);
        const chunks=[];
        const recordingSession={recorder,stream,chunks,bytes:0,tooLarge:false,startedAt:Date.now(),lastSpeechAt:0,speechSamples:0,detectedSpeech:null,deviceEnded:false,deviceMuted:false};
        const AudioContextClass=window.AudioContext||window.webkitAudioContext;
        if(AudioContextClass){
          try{
            const audioContext=new AudioContextClass();
            recordingSession.audioContext=audioContext;
            const analyser=audioContext.createAnalyser();
            analyser.fftSize=256;
            audioContext.createMediaStreamSource(stream).connect(analyser);
            try{Promise.resolve(audioContext.resume?.()).catch(()=>{recordingSession.detectedSpeech=null;});}catch(_){}
            const samples=new Uint8Array(analyser.fftSize);
            recordingSession.audioContext=audioContext;
            recordingSession.detectedSpeech=audioContext.state==='running'?false:null;
            recordingSession.meterTimer=setInterval(()=>{
              if(generation!==voiceGeneration||voiceSession!==recordingSession||modal.hidden)return;
              if(audioContext.state!=='running'){recordingSession.detectedSpeech=null;return;}
              if(recordingSession.detectedSpeech===null)recordingSession.detectedSpeech=false;
              analyser.getByteTimeDomainData(samples);
              let peak=0;
              for(const sample of samples)peak=Math.max(peak,Math.abs(sample-128));
              if(peak>=7){
                recordingSession.speechSamples++;
                recordingSession.lastSpeechAt=Date.now();
                if(recordingSession.speechSamples>=3)recordingSession.detectedSpeech=true;
              }
              if(recordingSession.detectedSpeech===true&&recordingSession.lastSpeechAt>0&&Date.now()-recordingSession.lastSpeechAt>=1800&&Date.now()-recordingSession.startedAt>=1200)stopVoice();
            },160);
          }catch(_){releaseAudioContext(recordingSession.audioContext);recordingSession.audioContext=null;recordingSession.detectedSpeech=null;}
        }
        recordingSession.timer=setTimeout(()=>{
          if(generation===voiceGeneration&&voiceSession===recordingSession)stopVoice();
        },15000);
        recordingSession.countdownTimer=setInterval(()=>{
          if(voiceSession!==recordingSession)return;
          showVoiceEmotion('listen');
          const left=Math.max(1,15-Math.floor((Date.now()-recordingSession.startedAt)/1000));
          status.textContent='Dinliyorum… '+left+' saniye kaldı. Konuşman bitince otomatik göndereceğim.';
        },1000);
        voiceSession=recordingSession;
        stream.getAudioTracks().forEach(track=>track.addEventListener('ended',()=>{
          if(voiceSession!==recordingSession)return;
          recordingSession.deviceEnded=true;
          stopVoice();
        },{once:true}));
        stream.getAudioTracks().forEach(track=>{
          track.addEventListener('mute',()=>{
            if(voiceSession!==recordingSession)return;
            clearTimeout(recordingSession.muteTimer);
            recordingSession.muteTimer=setTimeout(()=>{
              if(voiceSession!==recordingSession||!track.muted)return;
              recordingSession.deviceMuted=true;
              stopVoice();
            },900);
          });
          track.addEventListener('unmute',()=>clearTimeout(recordingSession.muteTimer));
        });
        mic.textContent='⏹';mic.setAttribute('aria-label','Konuşmayı bitir');mic.setAttribute('aria-pressed','true');
        status.textContent=recordingSession.audioContext
          ?'Dinliyorum… Konuşman bitince otomatik göndereceğim.'
          :'Dinliyorum… Bitirmek için kare düğmeye dokun; en fazla 15 saniye kaydedilir.';
        showVoiceEmotion('listen');
        recorder.ondataavailable=event=>{
          if(generation!==voiceGeneration||recordingSession.tooLarge||!event.data?.size)return;
          recordingSession.bytes+=event.data.size;
          if(recordingSession.bytes>1600000){
            recordingSession.tooLarge=true;chunks.length=0;stopVoice();return;
          }
          chunks.push(event.data);
        };
        recorder.onerror=()=>{if(generation===voiceGeneration&&voiceSession===recordingSession&&!modal.hidden){stopVoice(true);status.textContent='Ses kaydı tamamlanamadı. Mikrofona yeniden dokunup dene.';}};
        recorder.onstop=async()=>{
          if(voiceSession===recordingSession)stopVoice();
          else stopTracks(stream);
          if(generation!==voiceGeneration||modal.hidden){chunks.length=0;return;}
          if(recordingSession.tooLarge){status.textContent='Kayıt çok büyük. Daha kısa konuşup tekrar dene.';return;}
          if(recordingSession.deviceEnded){chunks.length=0;status.textContent='Mikrofon bağlantısı kesildi. Cihazı kontrol edip tekrar dene.';return;}
          if(recordingSession.deviceMuted){chunks.length=0;status.textContent='Mikrofonun ses kanalı kapandı. Cihazı kontrol edip tekrar dene.';return;}
          if(Date.now()-recordingSession.startedAt<700){chunks.length=0;status.textContent='Kayıt çok kısa. Mikrofona dokunup en az bir saniye konuş.';return;}
          if(recordingSession.detectedSpeech===false){chunks.length=0;status.textContent='Konuşma sesi algılanmadı. Mikrofona daha yakın konuşup tekrar dene.';return;}
          const actualMime=chunks.find(chunk=>typeof chunk.type==='string'&&chunk.type.trim())?.type||recorder.mimeType||'audio/webm';
          const mediaType=actualMime.split(';')[0].trim().toLowerCase();
          const extension=({'audio/webm':'webm','video/webm':'webm','audio/mp4':'m4a','video/mp4':'m4a','audio/ogg':'ogg','application/ogg':'ogg','audio/wav':'wav','audio/x-wav':'wav','audio/mpeg':'mp3'})[mediaType];
          if(!extension){chunks.length=0;status.textContent=voiceErrorMessage('format');return;}
          const blob=new Blob(chunks,{type:actualMime});
          chunks.length=0;
          if(blob.size<100||blob.size>1600000){status.textContent='Kayıt çok kısa veya büyük. En fazla 15 saniye konuş.';return;}
          status.textContent='Konuşman yazıya çevriliyor…';
          showVoiceEmotion('transcribe');
          let requestTimer=0,controller=null,emotionRefresh=0;
          try{
            const data=new FormData();data.append('audio',blob,'speech.'+extension);
            controller=new AbortController();voiceRequestController=controller;
            mic.disabled=true;
            mic.setAttribute('aria-label','Konuşma yazıya çevriliyor');
            requestTimer=setTimeout(()=>controller.abort(),50000);
            emotionRefresh=setInterval(()=>{
              if(voiceRequestController===controller&&generation===voiceGeneration)showVoiceEmotion('transcribe');
            },6000);
            const response=await fetch('api/adimbot-transcribe.php',{method:'POST',credentials:'same-origin',signal:controller.signal,headers:{'X-CSRF-Token':String(window.ILKADIM_CSRF_TOKEN||'')},body:data});
            let result=null;
            try{result=await response.json();}
            catch(error){
              if(controller.signal.aborted||error?.name==='AbortError')throw Object.assign(new Error('timeout'),{name:'AbortError'});
              const failure=new Error(response.ok?'invalid_provider_response':voiceHttpReason(response.status));
              failure.retryAfter=retryAfterSeconds(response.headers?.get?.('Retry-After'));
              throw failure;
            }
            if(controller.signal.aborted)throw Object.assign(new Error('timeout'),{name:'AbortError'});
            if(generation!==voiceGeneration||modal.hidden)return;
            if(!response.ok||!result?.ok){
              const failure=new Error(response.status===429?'provider_rate_limit':result?.reason||voiceHttpReason(response.status));
              failure.retryAfter=retryAfterSeconds(result?.retry_after||response.headers?.get?.('Retry-After'));
              throw failure;
            }
            if(typeof result.text!=='string'||!result.text.trim())throw new Error('invalid_provider_response');
            voiceRetryUntil=0;
            releaseVoiceRequest(controller,generation);
            recognized(result.text);
          }catch(error){
            if(generation!==voiceGeneration||modal.hidden)return;
            const reason=error?.name==='AbortError'?'provider_timeout':error instanceof TypeError||navigator.onLine===false?'provider_connection_error':error?.message;
            const retryAfter=['rate_limit','provider_rate_limit'].includes(reason)?retryAfterSeconds(error?.retryAfter):0;
            if(retryAfter>0)voiceRetryUntil=Date.now()+(retryAfter*1000);
            if(generation===voiceGeneration&&!modal.hidden)status.textContent=retryAfter>0
              ?'Sesli kullanım sınırı dolu. '+retryAfter+' saniye sonra tekrar deneyebilirsin.'
              :voiceErrorMessage(reason);
          }finally{
            clearTimeout(requestTimer);
            clearInterval(emotionRefresh);
            if(controller)releaseVoiceRequest(controller,generation);
            else if(generation===voiceGeneration)showVoiceEmotion(null);
          }
        };
        recorder.start(1000);
      }catch(error){stopTracks(stream);if(generation!==voiceGeneration)return;stopVoice(true);status.textContent=microphoneStartMessage(error);}
    });

    const syncConnection=()=>{
      if(!status)return;
      if(!navigator.onLine){
        if(chatRequest)cancelChat(true);
        const hadVoice=Boolean(voiceSession||voiceRequestController);
        if(hadVoice)stopVoice(true);
        status.textContent=hadVoice
          ?'İnternet bağlantısı yok. Ses kaydı durduruldu; bağlantı gelince tekrar deneyebilirsin.'
          :'İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
      }
      else if(!chatBusy&&!status.dataset.adimbotSpeechError&&!status.dataset.adimbotRetry)status.textContent='';
    };

    input?.addEventListener('compositionstart',()=>{inputComposing=true;});
    input?.addEventListener('compositionend',()=>{inputComposing=false;});
    input?.addEventListener('keydown',event=>{
      if(event.key==='Enter'&&(inputComposing||event.isComposing||event.keyCode===229))event.preventDefault();
    });
    input?.addEventListener('input',()=>{
      if(counter)counter.textContent=String(input.value.length)+' / 400';
    });
    window.addEventListener('online',syncConnection);
    window.addEventListener('offline',syncConnection);
    document.addEventListener('visibilitychange',()=>{
      if(document.hidden&&(voiceSession||voiceRequestController)){stopVoice(true);status.textContent='Sayfa arka plana geçtiği için mikrofon durduruldu.';}
    });
    window.addEventListener('pagehide',()=>{
      cancelChat(true);
      if(voiceSession||voiceRequestController)stopVoice(true);
    });
    syncConnection();

    const savedHistory=readHistory();
    if(savedHistory.length){
      savedHistory.forEach(item=>appendMessage(box,item.role==='assistant'?'bot':'user',item.text));
    }else{
      appendMessage(box,'bot','Merhaba! Ben AdımBot. Ne hakkında sohbet edelim?');
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
      if(inputComposing)return;
      if(voiceSession||voiceRequestController)stopVoice(true);
      if(chatBusy)return;
      const chatWait=cooldownRemaining(chatRetryUntil);
      if(chatWait>0){
        if(status)status.textContent='AdımBot kullanım sınırı için '+chatWait+' saniye bekleyip tekrar dene.';
        return;
      }

      refreshTogetherButton();
      refreshContextBadge();
      const message=clean(input?.value);
      if(message.length>400){if(status)status.textContent='Göndermeden önce sorunu 400 karaktere kadar kısalt.';input?.focus();return;}
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
      let replyDelivered=false;
      const waitEmotionTimer=setTimeout(()=>{
        if(chatBusy&&requestGeneration===chatGeneration){try{window.AdimBotStudent?.emote?.('wait',5000);}catch(_){}}
      },1500);
      chatRequest.emotionTimer=waitEmotionTimer;
      input.value='';
      if(counter)counter.textContent='0 / 400';
      const submit=form.querySelector('button[type="submit"]');
      setChatControlsBusy(true,input,submit,mic);
      if(status)status.textContent='AdımBot düşünüyor...';
      const historyBefore=readHistory();
      const requestContext=learningContext();
      if(!retrying)appendMessage(box,'user',message);
      remember('user',message);

      try{
        const ai=window.AdimBotAI;
        if(!ai||typeof ai.ask!=='function'||typeof ai.deliver!=='function'){
          appendMessage(box,'bot','AdımBot yapay zekâ bağlantısı henüz hazır değil.',{speakable:false});
          rollbackPendingUser(message);
        }else{
          const answer=await ai.ask(message,requestContext,historyBefore,{signal:controller.signal});
          if(requestGeneration!==chatGeneration)return;
          if(answer?.ok||answer?.blocked)chatRetryUntil=0;
          const result=answer.ok||answer.blocked?ai.deliver(answer,{activeQuestion:Boolean(requestContext.question)}):answer;
          clearTimeout(waitEmotionTimer);
          replyDelivered=Boolean(result?.ok||result?.blocked);
          const reply=result?.text||'Şu anda yanıt oluşturamadım.';
          try{
            window.AdimBotStudent?.clearEmotion?.();
            if(replyDelivered)window.AdimBotStudent?.emote?.(answerEmotion(result,reply),1500);
          }catch(_){}
          if(result?.ok||result?.blocked){failedReplyBubble=null;appendMessage(box,'bot',reply,{speakable:true});}
          else appendFailureReply(box,reply,retrying);
          if(result?.ok||result?.blocked)remember('assistant',reply);
          else{
            rollbackPendingUser(message);
            const reason=String(result?.reason||'');
            const retryAfter=chatCooldownSeconds(reason,result?.retryAfter);
            if(retryAfter>0)chatRetryUntil=Date.now()+(retryAfter*1000);
            if(retryableChatReasons.has(reason)){
              retryMessage=message;
              input.value=message;
              if(counter)counter.textContent=String(message.length)+' / 400';
              if(status){
                status.dataset.adimbotRetry='1';
                status.textContent=quotaChatReasons.has(reason)
                  ?(retryAfter>0?'Kullanım sınırı dolu. '+retryAfter+' saniye sonra yeniden gönderebilirsin.':'Kullanım sınırı dolu. Birkaç dakika bekleyip Gönder düğmesine yeniden dokunabilirsin.')
                  :retryHint(reason);
              }
            }
          }
        }
      }catch(_){
        if(requestGeneration!==chatGeneration)return;
        appendFailureReply(box,'Şu anda yanıt veremedim. İstersen tekrar deneyebilirsin.',retrying);
        rollbackPendingUser(message);
        retryMessage=message;
        input.value=message;
        if(counter)counter.textContent=String(message.length)+' / 400';
        if(status){status.dataset.adimbotRetry='1';status.textContent='Sorun kaybolmadı. Gönder düğmesine yeniden dokunabilirsin.';}
      }finally{
        clearTimeout(waitEmotionTimer);
        if(requestGeneration!==chatGeneration)return;
        if(!replyDelivered){try{window.AdimBotStudent?.clearEmotion?.();}catch(_){}}
        chatRequest=null;
        chatBusy=false;
        modal.removeAttribute('aria-busy');
        setChatControlsBusy(false,input,submit,mic);
        if(status&&!status.dataset.adimbotSpeechError&&!status.dataset.adimbotRetry)status.textContent=navigator.onLine?'':'İnternet bağlantısı yok. Bağlantı gelince tekrar deneyebilirsin.';
        if(!modal.hidden)input.focus();
      }
    });

    return modal;
  };

  const focusables=()=>modal?[...modal.querySelectorAll('button:not([disabled]),input:not([disabled]),select:not([disabled]),textarea:not([disabled]),[href],[tabindex]:not([tabindex="-1"])')].filter(el=>{
    if(el.disabled||el.tabIndex<0||el.closest('[hidden],[inert],[aria-hidden="true"]'))return false;
    const style=getComputedStyle(el);
    return style.display!=='none'&&style.visibility!=='hidden'&&style.visibility!=='collapse'&&el.getClientRects().length>0;
  }):[];

  const open=(trigger=null)=>{
    const dialog=buildModal();
    const focusToken=++focusGeneration;
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
    dialog.hidden=false;
    document.documentElement.classList.add('adb-chat-open');
    const messages=dialog.querySelector('[data-adimbot-chat-messages]');
    const alignHistory=()=>{if(focusToken===focusGeneration&&!dialog.hidden&&messages)messages.scrollTop=messages.scrollHeight;};
    if(typeof window.requestAnimationFrame==='function')window.requestAnimationFrame(alignHistory);else setTimeout(alignHistory,0);
    setTimeout(()=>{
      if(focusToken!==focusGeneration||dialog.hidden)return;
      const input=dialog.querySelector('[data-adimbot-chat-input]');
      (input&&!input.disabled?input:dialog.querySelector('.adb-chat-dialog'))?.focus?.();
    },40);
    return true;
  };

  const close=()=>{
    if(!modal)return true;
    const focusToken=++focusGeneration;
    inputComposing=false;
    cancelChat(true);
    stopVoice(true);
    try{window.AdimBotStudent?.stop?.();window.AdimBotStudent?.clearEmotion?.();}catch(_){}
    modal.hidden=true;
    modal.removeAttribute('aria-busy');
    document.documentElement.classList.remove('adb-chat-open');
    const target=lastTrigger;
    lastTrigger=null;
    setTimeout(()=>{
      if(focusToken===focusGeneration&&modal.hidden&&target?.isConnected)target.focus?.();
    },0);
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
    if(!items.length){
      event.preventDefault();modal.querySelector('.adb-chat-dialog')?.focus();return;
    }
    const first=items[0],last=items[items.length-1];
    if(!items.includes(document.activeElement)){
      event.preventDefault();(event.shiftKey?last:first).focus();
    }else if(event.shiftKey&&document.activeElement===first){
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

  window.AdimBotChatUI=Object.freeze({open,close,clearHistory,captureContext,currentContext,learningContext,history:()=>readHistory().map(item=>({...item})),diagnostics:Object.freeze({chatCooldownSeconds,isUnclearTranscript,mergeRecognizedDraft,answerEmotion,setChatControlsBusy,requestRecognizedSubmit})});
})();

