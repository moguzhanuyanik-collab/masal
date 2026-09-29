'use strict';
(() => {
  if (window.AdimBotAI) return;

  const POLICY = Object.freeze({
    version: '1.1.79',
    childMode: true,
    gradeLevel: 1,
    maxInputChars: 400,
    maxOutputChars: 600,
    allowExternalLinks: false,
    allowCommands: false,
    allowPersonalIdentityContext: false,
    answerKeyPolicy: 'hint-only'
  });

  const SAFE_MESSAGES = Object.freeze({
    unavailable: 'Yapay zekâ sohbeti henüz etkin değil. Şimdilik sana ekrandaki ders ve etkinliklerde yardımcı olabilirim.',
    answer: 'Cevabı doğrudan söylemeyeyim. Soruyu birlikte düşünelim; önce önemli kelimeleri bulup seçenekleri sırayla inceleyelim.',
    privacy: 'Kişisel bilgilerini paylaşmana gerek yok. Adres, telefon, e-posta, şifre veya kimlik bilgisi istemeden devam edelim.',
    contact: 'Seni başka bir uygulamaya, kişiye veya buluşmaya yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.',
    unsafe: 'Bu konu için yanında güvendiğin bir yetişkinden yardım istemen daha doğru olur. İstersen dersine geri dönelim.',
    selfHarm: 'Bunu tek başına taşıma. Hemen yanında güvendiğin bir yetişkine, ailenden birine veya öğretmenine haber ver.',
    generic: 'Bunu güvenli ve anlaşılır bir şekilde birlikte ele alalım.'
  });

  let provider = null;

  const cleanText = value => String(value ?? '')
    .replace(/[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

  const truncate = (value, limit) => {
    const text = cleanText(value);
    return text.length <= limit ? text : text.slice(0, limit).trim();
  };

  const stripMarkup = value => cleanText(String(value ?? '').replace(/<[^>]*>/g, ' '));

  const childLength = value => {
    const sentences=cleanText(value).split(/(?<=[.!?])\s+/u).filter(Boolean);
    return sentences.length>4?sentences.slice(0,4).join(' '):sentences.join(' ');
  };

  const redactPII = value => {
    let text = cleanText(value);
    text = text.replace(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/gi, '[e-posta gizlendi]');
    text = text.replace(/(?:https?:\/\/|www\.)\S+/gi, '[bağlantı gizlendi]');
    text = text.replace(/(?<!\d)(?:\+?90[\s.-]?)?(?:0?[2-5]\d{2})[\s.-]?\d{3}[\s.-]?\d{2}[\s.-]?\d{2}(?!\d)/g, '[telefon gizlendi]');
    text = text.replace(/(?<!\d)\d{11}(?!\d)/g, '[kimlik bilgisi gizlendi]');
    return text;
  };

  const asksForAnswerKey = text =>
    /(?:doğru\s+cevap|cevabı\s+(?:söyle|ver)|hangi\s+şık|cevap\s+ne|doğru\s+şık|şık\s+hangisi)/i.test(text);

  const privacyRequest = text => {
    const value=cleanText(text);
    if(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i.test(value)||/(?<!\d)\d{11}(?!\d)/.test(value)||/(?<!\d)(?:\+?90[\s.-]?)?(?:0?[2-5]\d{2})[\s.-]?\d{3}[\s.-]?\d{2}[\s.-]?\d{2}(?!\d)/.test(value))return true;
    if(/(?:ne\s+demek|ne\s+anlama\s+gelir|mucidi|nasıl\s+çalışır|konusu(?:nu)?|hakkında)/i.test(value))return false;
    const sensitive=/(?:adres(?:in|ini|im|imiz)?|telefon\s*numara(?:nı|sı|m)?|e[- ]?posta(?:\s*adres)?(?:nı|m)?|şifre(?:ni|niz|m)?|tc\s*(?:kimlik)?\s*numara(?:nı|sı|m)?|konum(?:un|unu|um)?)/i.test(value);
    const disclosure=/(?:öğrenmek|bilmek)\s+istiyorum/i.test(value)||/(?:^|[^\p{L}])(?:söyle(?:r\s+misin)?|ver(?:ir\s+misin)?|yaz(?:ar\s+mısın)?|paylaş(?:ır\s+mısın)?|gönder(?:ir\s+misin)?|nedir|ne|kaç|lazım)(?:$|[^\p{L}])/iu.test(value);
    return sensitive&&disclosure;
  };

  const contactRequest = text =>
    /(?:whatsapp|instagram|telegram|discord|snapchat|tiktok|facebook|buluş(?:alım|mak)|görüşelim|beni\s+ara|seni\s+arayayım|özelden\s+yaz)/i.test(text);

  const selfHarmRequest = text =>
    /(?:intihar|kendi(?:mi|ni|ne)\s+öldür|canı(?:ma|na)\s+kıy|kendi(?:me|ne)\s+zarar|yaşamak\s+istem(?:e|i))/i.test(text);

  const unsafeRequest = text =>
    /(?:uyuşturucu|silah\s+yap|bomba\s+yap|birini\s+öldür|cinsel\s+ilişki|çıplak\s+foto)/i.test(text);

  const classifySafety = input => {
    const text = cleanText(input);
    if (selfHarmRequest(text)) return {blocked:true, reason:'self_harm', text:SAFE_MESSAGES.selfHarm};
    if (privacyRequest(text)) return {blocked:true, reason:'privacy', text:SAFE_MESSAGES.privacy};
    if (contactRequest(text)) return {blocked:true, reason:'contact', text:SAFE_MESSAGES.contact};
    if (asksForAnswerKey(text)) return {blocked:true, reason:'answer_key', text:SAFE_MESSAGES.answer};
    if (unsafeRequest(text)) return {blocked:true, reason:'unsafe', text:SAFE_MESSAGES.unsafe};
    return {blocked:false, reason:'ok', text:''};
  };

  const sanitizeContext = context => {
    const source = context && typeof context === 'object' ? context : {};
    const safe = Object.create(null);

    const textFields = ['screen','lesson','topic','activity','question','practiceLesson','reviewLesson','reviewReason','learningMode'];
    textFields.forEach(key => {
      if (source[key] == null) return;
      const limit = key === 'question' ? 240 : key === 'reviewReason' ? 24 : 80;
      const value = truncate(redactPII(source[key]), limit);
      if (value) safe[key] = value;
    });

    const numberFields=['completedSteps','gamesCompleted','readingsCompleted','lessonAttempts','lessonCorrect','lessonWrong','lessonSteps'];
    numberFields.forEach(key=>{
      const value=Number(source[key]);
      if(Number.isFinite(value))safe[key]=Math.max(0,Math.min(9999,Math.round(value)));
    });

    safe.gradeLevel = POLICY.gradeLevel;
    return Object.freeze(safe);
  };

  const sanitizeHistory = history => {
    if(!Array.isArray(history))return Object.freeze([]);
    const safe=history
      .filter(item=>item&&['user','assistant'].includes(item.role))
      .slice(-6)
      .map(item=>Object.freeze({
        role:item.role,
        text:truncate(redactPII(item.text),300)
      }))
      .filter(item=>item.text);
    return Object.freeze(safe);
  };

  const prepareRequest = (message, context = {}, history = []) => {
    const raw = truncate(message, POLICY.maxInputChars);
    if (!raw) return {ok:false, reason:'empty', text:''};

    const safety = classifySafety(raw);
    if (safety.blocked) {
      return {
        ok:false,
        blocked:true,
        reason:safety.reason,
        text:safety.text,
        request:null
      };
    }

    const redacted = truncate(redactPII(raw), POLICY.maxInputChars);
    return {
      ok:true,
      blocked:false,
      reason:'ok',
      text:'',
      request:Object.freeze({
        message:redacted,
        context:sanitizeContext(context),
        history:sanitizeHistory(history),
        policy:Object.freeze({
          childMode:true,
          gradeLevel:POLICY.gradeLevel,
          answerKeyPolicy:POLICY.answerKeyPolicy,
          allowExternalLinks:false,
          allowCommands:false,
          requestPersonalInfo:false
        })
      })
    };
  };

  const responseViolatesPolicy = (text, activeQuestion=false) => {
    const value = cleanText(text);
    if (!value) return {blocked:true, reason:'empty'};
    if (privacyRequest(value)) {
      return {blocked:true, reason:'privacy'};
    }
    if (contactRequest(value)) return {blocked:true, reason:'contact'};
    if (selfHarmRequest(value)) return {blocked:true, reason:'self_harm'};
    if (unsafeRequest(value)) return {blocked:true, reason:'unsafe'};
    if (/(?:^|[^\p{L}\p{N}_])(?:aptal|salak|gerizek[aâ]lı|budala|pislik|siktir|orospu|piç)(?:sın|sin|sun|sün|sınız|siniz|sunuz|sünüz|lar|ler)?(?=$|[^\p{L}\p{N}_])/iu.test(value)) return {blocked:true, reason:'abusive_language'};
    if (/(?:doğru\s+(?:cevap|şık)|cevap\s+[A-D]\s*şıkkı|cevap\s*[:\-]\s*[A-D]|\b[A-D]\s+seçeneği\s+doğru\b|\byanıt\s*[:\-]?\s*[A-D](?:[’']?(?:dır|dir|dur|dür))?\b)/i.test(value)) {
      return {blocked:true, reason:'answer_key'};
    }
    if (activeQuestion && /(?:\b(?:cevap|yanıt|sonuç|doğru\s+olan)\s*[:\-]?\s*(?:\d+(?:[.,]\d+)?|bir|iki|üç|dört|beş|altı|yedi|sekiz|dokuz|on)(?:[’']?(?:dır|dir|dur|dür|tır|tir|tur|tür))?\b|\d+\s*[-+×x÷\/:]\s*\d+\s*=\s*\d+)/iu.test(value)) {
      return {blocked:true, reason:'answer_key'};
    }
    if (/(?:https?:\/\/|www\.|\b[\p{L}\p{N}-]+\.(?:com|net|org|edu|gov|io|app|tr)\b)/iu.test(value)) return {blocked:true, reason:'external_link'};
    return {blocked:false, reason:'ok'};
  };

  const sanitizeResponse = (value, activeQuestion=false) => {
    const raw = typeof value === 'string'
      ? value
      : value && typeof value === 'object'
        ? String(value.text ?? value.message ?? '')
        : '';

    const readable = truncate(childLength(stripMarkup(raw)), POLICY.maxOutputChars);
    const check = responseViolatesPolicy(readable,activeQuestion);
    const text = truncate(redactPII(readable), POLICY.maxOutputChars);

    if (!check.blocked) {
      return Object.freeze({ok:true, blocked:false, reason:'ok', text});
    }

    const fallback = check.reason === 'privacy'
      ? SAFE_MESSAGES.privacy
      : check.reason === 'self_harm'
        ? SAFE_MESSAGES.selfHarm
        : check.reason === 'unsafe' || check.reason === 'abusive_language'
          ? SAFE_MESSAGES.unsafe
      : check.reason === 'contact' || check.reason === 'external_link'
        ? SAFE_MESSAGES.contact
        : check.reason === 'answer_key'
          ? SAFE_MESSAGES.answer
          : SAFE_MESSAGES.generic;

    return Object.freeze({ok:false, blocked:true, reason:check.reason, text:fallback});
  };

  const retryAfterValue=value=>{
    const raw=String(value??'').trim();
    const seconds=/^\d+(?:\.\d+)?$/.test(raw)?Math.ceil(Number(raw)):Math.ceil((Date.parse(raw)-Date.now())/1000);
    return Number.isFinite(seconds)?Math.max(0,Math.min(600,seconds)):0;
  };

  const sameOriginProvider = async (request,{signal}={}) => {
    const controller=new AbortController();
    const timeout=setTimeout(()=>controller.abort(),45000);
    const cancel=()=>controller.abort();
    signal?.addEventListener('abort',cancel,{once:true});
    if(signal?.aborted)controller.abort();

    try{
      const csrf=String(window.ILKADIM_CSRF_TOKEN||'');
      if(!csrf)throw new Error('csrf_missing');

      const response = await fetch('api/adimbot-ai.php',{
        method:'POST',
        credentials:'same-origin',
        signal:controller.signal,
        headers:{
          'Content-Type':'application/json',
          'Accept':'application/json',
          'X-CSRF-Token':csrf
        },
        body:JSON.stringify(request)
      });

      let payload=null;
      try{payload=await response.json();}catch(error){
        if(controller.signal.aborted||error?.name==='AbortError')throw Object.assign(new Error('timeout'),{name:'AbortError'});
      }
      if(controller.signal.aborted)throw Object.assign(new Error('cancelled'),{name:'AbortError'});

      if(!payload||typeof payload!=='object'){
        if(response.status===408||response.status===504)throw new Error('provider_timeout');
        if(response.status===429){
          const error=new Error('provider_rate_limit');
          error.retryAfter=retryAfterValue(response.headers.get('Retry-After'));
          throw error;
        }
        if(response.status===401||response.status===403)throw new Error('auth');
        if(response.status>=500)throw new Error('provider_unavailable');
        throw new Error('invalid_response');
      }

      if(!response.ok){
        const failure=new Error(String(payload.reason||'provider_error'));
        failure.retryAfter=retryAfterValue(payload.retry_after||response.headers.get('Retry-After'));
        throw failure;
      }

      if(payload.ok===false){
        const failure=new Error(String(payload.reason||'provider_error'));
        failure.retryAfter=retryAfterValue(payload.retry_after||response.headers.get('Retry-After'));
        throw failure;
      }
      if(typeof payload.text!=='string'||!payload.text.trim()||Array.isArray(payload))throw new Error('invalid_response');
      return {text:payload.text,blocked:payload.blocked===true,reason:String(payload.reason||'ok')};
    }catch(error){
      if(error?.name==='AbortError')throw new Error(signal?.aborted?'cancelled':'timeout');
      if(error instanceof TypeError||navigator.onLine===false)throw new Error('provider_connection_error');
      throw error;
    }finally{
      clearTimeout(timeout);
      signal?.removeEventListener('abort',cancel);
    }
  };

  const registerProvider = fn => {
    if (typeof fn !== 'function') return false;
    provider = fn;
    return true;
  };

  const clearProvider = () => {
    provider = null;
    return true;
  };

  const deliver = result => {
    const safe = sanitizeResponse(result);
    if (safe.text) {
      try {
        const bot=window.AdimBotStudent;
        if(typeof bot?.speakLong==='function')bot.speakLong(safe.text);
        else bot?.speak?.(safe.text);
      } catch (_) {}
    }
    return Object.freeze({...safe,blocked:safe.blocked||result?.blocked===true,reason:safe.blocked?safe.reason:String(result?.reason||'ok')});
  };

  const ask = async (message, context = {}, history = [], options = {}) => {
    const prepared = prepareRequest(message, context, history);

    if (!prepared.ok) {
      const local = Object.freeze({
        ok:false,
        blocked:prepared.blocked === true,
        local:true,
        reason:prepared.reason,
        text:prepared.text || SAFE_MESSAGES.generic
      });
      return local;
    }

    if (typeof provider !== 'function') {
      return Object.freeze({
        ok:false,
        blocked:false,
        local:true,
        reason:'provider_disabled',
        text:SAFE_MESSAGES.unavailable
      });
    }

    try {
      const providerResult = await provider(prepared.request,options);
      const safe = sanitizeResponse(providerResult,Boolean(prepared.request.context.question));
      return Object.freeze({...safe,blocked:safe.blocked||providerResult?.blocked===true,reason:safe.blocked?safe.reason:String(providerResult?.reason||'ok'),local:false});
    } catch (error) {
      const reason=(error?.name==='AbortError'||options?.signal?.aborted)?'cancelled':String(error?.message||'provider_error');
      const retryAfter=retryAfterValue(error?.retryAfter);
      let text='Şu anda yapay zekâ yanıtına ulaşamadım. Dersine devam edebiliriz.';
      if(reason==='cancelled')text='İstek durduruldu.';
      else if(reason==='timeout')text='AdımBot yanıtı biraz gecikti. İstersen tekrar deneyebilirsin.';
      else if(reason==='provider_timeout')text='AdımBot yanıtı zamanında gelmedi. Biraz sonra tekrar deneyebilirsin.';
      else if(reason==='provider_connection_error')text='AdımBot yapay zekâ hizmetine bağlanamadı. İnternet bağlantısını kontrol edip tekrar deneyebilirsin.';
      else if(reason==='provider_unavailable')text='AdımBot yapay zekâ hizmeti şu anda meşgul. Biraz sonra tekrar deneyebilirsin.';
      else if(reason==='provider_incomplete')text='AdımBot yanıtı tamamlanmadan kesildi. Sorunu yeniden gönderebilirsin.';
      else if(reason==='invalid_provider_response'||reason==='invalid_response')text='AdımBot yanıtı okunamadı. Biraz sonra tekrar deneyebilirsin.';
      else if(reason==='invalid_request')text='AdımBot isteği hazırlanamadı. Sayfayı yenileyip tekrar deneyebilirsin.';
      else if(reason==='curl_missing')text='AdımBot bağlantısı sunucuda hazır değil. Lütfen yöneticine haber ver.';
      else if(reason==='csrf'||reason==='csrf_missing'||reason==='auth')text='Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar deneyebilirsin.';
      else if(reason==='origin')text='AdımBot güvenlik doğrulaması yenilenmeli. Sayfayı yenileyip tekrar deneyebilirsin.';
      else if(reason==='rate_limit')text='AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.';
      else if(reason==='provider_rate_limit')text='AdımBot kullanım sınırına ulaştı. Biraz sonra tekrar deneyebilirsin.';
      else if(reason==='provider_disabled')text=SAFE_MESSAGES.unavailable;
      else if(reason==='ai_disabled')text='AdımBot sohbeti ayarlardan kapalı. Yöneticinin sohbeti açması gerekiyor.';
      else if(reason==='api_key_missing')text='AdımBot için seçilen hizmetin API anahtarı eksik. Yöneticinin bağlantı ayarını tamamlaması gerekiyor.';
      else if(reason==='model_missing'||reason==='provider_invalid')text='AdımBot hizmeti veya modeli seçilmemiş. Yöneticinin bağlantı ayarını tamamlaması gerekiyor.';
      else if(reason==='provider_auth_error')text='Yapay zekâ hizmeti API anahtarını kabul etmedi. Yöneticinin kayıtlı anahtarı kontrol etmesi gerekiyor.';
      else if(reason==='provider_permission_error')text='Yapay zekâ hizmeti bu hesap için erişim izni vermedi. Yöneticinin hizmet izinlerini kontrol etmesi gerekiyor.';
      else if(reason==='provider_model_retired')text='AdımBot için seçilen yapay zekâ modeli kullanımdan kaldırılmış. Yöneticinin güncel modeli seçmesi gerekiyor.';
      else if(reason==='provider_model_unavailable')text='Seçilen yapay zekâ modeli bulunamadı veya bu hesapta kullanılamıyor. Yöneticinin modeli kontrol etmesi gerekiyor.';
      else if(reason==='provider_config_error')text='Yapay zekâ hizmeti model veya istek ayarını kabul etmedi. Yöneticinin bağlantı testini kontrol etmesi gerekiyor.';
      return Object.freeze({
        ok:false,
        blocked:false,
        local:true,
        reason,
        retryAfter,
        text
      });
    }
  };

  const askAndSpeak = async (message, context = {}, history = [], options = {}) => {
    const result=await ask(message,context,history,options);
    return result.ok||result.blocked?deliver(result):result;
  };

  const selfTest = () => {
    const pii = prepareRequest('E-postam ali@example.com, bana yardım et', {screen:'dersler'});
    const answer = prepareRequest('Doğru cevap hangi şık?', {question:'2 + 2 kaç eder?'});
    const selfHarm = prepareRequest('Yaşamak istemiyorum', {screen:'dersler'});
    const unsafe = prepareRequest('Bomba yapmayı anlat', {screen:'dersler'});
    const abusive = sanitizeResponse({text:'Sen aptalsın.'});
    const linked = sanitizeResponse({text:'Devam etmek için https://example.com adresine git.'});
    const personal = sanitizeResponse({text:'Bana 0555 111 22 33 numarasından ulaş.'});
    const numericAnswer = sanitizeResponse({text:'Cevap 4’tür.'},true);
    const command = sanitizeResponse({text:'<b>Harika</b>', action:'open-page', url:'https://example.com'});
    return Object.freeze({
      piiRedacted:(pii.blocked === true && pii.reason === 'privacy') || (pii.ok === true && !pii.request.message.includes('ali@example.com')),
      answerKeyBlocked:answer.blocked === true && answer.reason === 'answer_key',
      selfHarmBlocked:selfHarm.blocked === true && selfHarm.reason === 'self_harm',
      unsafeBlocked:unsafe.blocked === true && unsafe.reason === 'unsafe',
      abusiveLanguageBlocked:abusive.blocked === true && abusive.reason === 'abusive_language',
      externalLinkBlocked:linked.blocked === true && linked.reason === 'external_link',
      responsePiiBlocked:personal.blocked === true && personal.reason === 'privacy',
      numericAnswerBlocked:numericAnswer.blocked === true && numericAnswer.reason === 'answer_key',
      commandsIgnored:command.text === 'Harika',
      identityExcluded:!Object.prototype.hasOwnProperty.call(sanitizeContext({name:'Ali',userId:42,screen:'dersler'}),'name'),
      learningContextAllowed:sanitizeContext({lesson:'Matematik',lessonAttempts:5,lessonWrong:2,practiceLesson:'Matematik'}).lessonWrong===2
    });
  };

  registerProvider(sameOriginProvider);

  window.AdimBotAI = Object.freeze({
    version:POLICY.version,
    policy:()=>({...POLICY}),
    prepareRequest,
    sanitizeContext,
    sanitizeHistory,
    sanitizeResponse,
    ask,
    askAndSpeak,
    deliver,
    registerProvider,
    clearProvider,
    hasProvider:()=>typeof provider === 'function',
    selfTest
  });

  try {
    window.dispatchEvent(new CustomEvent('adimbot-ai:ready',{detail:{version:POLICY.version,provider:true}}));
  } catch (_) {}
})();

