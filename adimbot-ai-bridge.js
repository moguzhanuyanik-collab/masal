'use strict';
(() => {
  if (window.AdimBotAI) return;

  const POLICY = Object.freeze({
    version: '1.1.4',
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

  const privacyRequest = text =>
    /(?:adres(?:in|ini)?|telefon(?:un|unu|\s*numara)|e[- ]?posta(?:n|nı)?|şifre(?:n|ni)?|tc\s*(?:kimlik)?|kimlik\s*numara|konum(?:un|unu)?)/i.test(text);

  const contactRequest = text =>
    /(?:whatsapp|instagram|telegram|discord|snapchat|buluş(?:alım|mak)|görüşelim|beni\s+ara|seni\s+arayayım|özelden\s+yaz)/i.test(text);

  const selfHarmRequest = text =>
    /(?:intihar|kendimi\s+öldür|canıma\s+kıy|kendime\s+zarar|yaşamak\s+istemiyorum)/i.test(text);

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

    const textFields = ['screen','lesson','topic','activity','question'];
    textFields.forEach(key => {
      if (source[key] == null) return;
      const limit = key === 'question' ? 240 : 80;
      const value = truncate(redactPII(source[key]), limit);
      if (value) safe[key] = value;
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

  const responseViolatesPolicy = text => {
    const value = cleanText(text);
    if (!value) return {blocked:true, reason:'empty'};
    if (/(?:telefon(?:unu| numaranı)|adres(?:ini|ini söyle)|e[- ]?posta(?:nı| adresini)|şifre(?:ni)?|tc\s*(?:kimlik)?)/i.test(value)) {
      return {blocked:true, reason:'privacy'};
    }
    if (contactRequest(value)) return {blocked:true, reason:'contact'};
    if (/(?:doğru\s+(?:cevap|şık)|cevap\s+[A-D]\s*şıkkı|cevap\s*[:\-]\s*[A-D])/i.test(value)) {
      return {blocked:true, reason:'answer_key'};
    }
    if (/(?:https?:\/\/|www\.)/i.test(value)) return {blocked:true, reason:'external_link'};
    return {blocked:false, reason:'ok'};
  };

  const sanitizeResponse = value => {
    const raw = typeof value === 'string'
      ? value
      : value && typeof value === 'object'
        ? String(value.text ?? value.message ?? '')
        : '';

    const text = truncate(redactPII(stripMarkup(raw)), POLICY.maxOutputChars);
    const check = responseViolatesPolicy(text);

    if (!check.blocked) {
      return Object.freeze({ok:true, blocked:false, reason:'ok', text});
    }

    const fallback = check.reason === 'privacy'
      ? SAFE_MESSAGES.privacy
      : check.reason === 'contact' || check.reason === 'external_link'
        ? SAFE_MESSAGES.contact
        : check.reason === 'answer_key'
          ? SAFE_MESSAGES.answer
          : SAFE_MESSAGES.generic;

    return Object.freeze({ok:false, blocked:true, reason:check.reason, text:fallback});
  };

  const sameOriginProvider = async request => {
    const controller=new AbortController();
    const timeout=setTimeout(()=>controller.abort(),25000);

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
      try{payload=await response.json();}catch(_){}

      if(!payload||typeof payload!=='object'){
        throw new Error('invalid_response');
      }

      if(!response.ok){
        if(typeof payload.text==='string'&&payload.text.trim()!=='')return {text:payload.text};
        throw new Error(String(payload.reason||payload.message||'provider_error'));
      }

      return {text:String(payload.text||'')};
    }catch(error){
      if(error?.name==='AbortError')throw new Error('timeout');
      throw error;
    }finally{
      clearTimeout(timeout);
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
      try { window.AdimBotStudent?.speak?.(safe.text); } catch (_) {}
    }
    return safe;
  };

  const ask = async (message, context = {}, history = []) => {
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
      const providerResult = await provider(prepared.request);
      const safe = sanitizeResponse(providerResult);
      return Object.freeze({...safe, local:false});
    } catch (error) {
      const reason=String(error?.message||'provider_error');
      let text='Şu anda yapay zekâ yanıtına ulaşamadım. Dersine devam edebiliriz.';
      if(reason==='timeout')text='AdımBot yanıtı biraz gecikti. İstersen tekrar deneyebilirsin.';
      else if(reason==='csrf'||reason==='csrf_missing')text='Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar deneyebilirsin.';
      else if(reason==='rate_limit')text='AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.';
      return Object.freeze({
        ok:false,
        blocked:false,
        local:true,
        reason,
        text
      });
    }
  };

  const askAndSpeak = async (message, context = {}, history = []) => deliver(await ask(message, context, history));

  const selfTest = () => {
    const pii = prepareRequest('E-postam ali@example.com, bana yardım et', {screen:'dersler'});
    const answer = prepareRequest('Doğru cevap hangi şık?', {question:'2 + 2 kaç eder?'});
    const command = sanitizeResponse({text:'<b>Harika</b>', action:'open-page', url:'https://example.com'});
    return Object.freeze({
      piiRedacted:pii.ok === true && !pii.request.message.includes('ali@example.com'),
      answerKeyBlocked:answer.blocked === true && answer.reason === 'answer_key',
      commandsIgnored:command.text === 'Harika',
      identityExcluded:!Object.prototype.hasOwnProperty.call(sanitizeContext({name:'Ali',userId:42,screen:'dersler'}),'name')
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
