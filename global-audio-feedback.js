'use strict';
(() => {
  let speakingText='';
  const spokenState=new WeakMap();
  let activeMotion=null;
  let activeMotionCard=null;
  let armedCard=null;
  let armTimer=null;
  let guideActive=false;
  let guideTarget=null;
  let guideTimer=null;
  const GUIDE_KEY='ilkadim.adimbot.guide.v1';

  const clean=value=>String(value||'')
    .replace(/[\u{1F1E6}-\u{1F1FF}]/gu,' ')
    .replace(/[\u{1F300}-\u{1FAFF}]/gu,' ')
    .replace(/[\u2600-\u27BF]/gu,' ')
    .replace(/[\u2190-\u21FF]/gu,' ')
    .replace(/[\u2300-\u23FF]/gu,' ')
    .replace(/[\u25A0-\u25FF]/gu,' ')
    .replace(/[\uFE0E\uFE0F\u200D]/gu,' ')
    .replace(/\s+/g,' ')
    .trim();

  const stopCardMotion=()=>{
    try{if(activeMotion)activeMotion.cancel();}catch{}
    activeMotion=null;
    activeMotionCard=null;
  };

  const startCardMotion=card=>{
    stopCardMotion();
    if(!card||typeof card.animate!=='function')return;
    if(document.documentElement.classList.contains('reduce-motion'))return;
    if(window.matchMedia&&window.matchMedia('(prefers-reduced-motion: reduce)').matches)return;
    activeMotionCard=card;
    activeMotion=card.animate([
      {transform:'translateX(0) scale(1)'},
      {transform:'translateX(-2px) scale(1.008)'},
      {transform:'translateX(2px) scale(1.008)'},
      {transform:'translateX(0) scale(1)'}
    ],{
      duration:720,
      iterations:Infinity,
      easing:'ease-in-out'
    });
  };

  const botApi=()=>window.AdimBotStudent||null;
  const canSpeak=()=>{
    const bot=botApi();
    if(!bot||typeof bot.speak!=='function')return false;
    return typeof bot.isReady==='function'?bot.isReady()===true:true;
  };

  const stopSpeech=()=>{
    const bot=botApi();
    if(bot&&typeof bot.stop==='function'){
      try{bot.stop();}catch(error){console.error('AdımBot durdurma hatası:',error);}
    }
    speakingText='';
    stopCardMotion();
  };

  const speak=(text,motionCard=null,onEnd=null)=>{
    const value=clean(text);
    if(!value||!canSpeak())return false;

    stopSpeech();
    speakingText=value;
    if(motionCard)startCardMotion(motionCard);

    const done=({cancelled=false}={})=>{
      if(speakingText===value)speakingText='';
      if(activeMotionCard===motionCard)stopCardMotion();
      if(typeof onEnd==='function'){
        try{onEnd({cancelled});}catch(error){console.error('AdımBot etkileşim onEnd hatası:',error);}
      }
    };

    try{
      const ok=botApi().speak(value,{onEnd:done})!==false;
      if(!ok){
        speakingText='';
        if(activeMotionCard===motionCard)stopCardMotion();
      }
      return ok;
    }catch(error){
      console.error('AdımBot etkileşim konuşma hatası:',error);
      speakingText='';
      if(activeMotionCard===motionCard)stopCardMotion();
      return false;
    }
  };

  const react=(type,context={},onEnd=null)=>{
    const bot=botApi();
    if(!bot||typeof bot.react!=='function'||!canSpeak())return false;
    stopSpeech();
    try{
      return bot.react(type,context,{onEnd:({cancelled=false}={})=>{
        if(typeof onEnd==='function'){
          try{onEnd({cancelled});}catch(error){console.error('AdımBot tepki onEnd hatası:',error);}
        }
      }})!==false;
    }catch(error){
      console.error('AdımBot karakter tepkisi başlatılamadı:',error);
      return false;
    }
  };

  // Legacy selectors are only used to auto-label current UI.
  // Runtime behavior itself depends on the stable data-adimbot-read contract.
  const autoActionSelector=[
    '.app-nav a[href]',
    '#screen a[href]',
    'a.game-tile',
    '.course-row > a',
    'a.home-course',
    'a.home-game',
    'a.resume-card',
    '.lesson-step',
    '.story-list > a',
    'a.reading-entry',
    'a.island',
    'a.mina-card',
    '.daily-tasks > a',
    '#screen button:not([type="submit"]):not([data-adimbot-ignore])',
    '#screen summary:not([data-adimbot-ignore])',
    '.answers .answer',
    '.teacher-option',
    '.teacher-group > summary',
    '.teacher-lesson > summary',
    '.teacher-topic > summary'
  ].join(',');

  const autoTextSelector=[
    '.game-intro',
    '.puzzle-question',
    '.teacher-content-card h3',
    '.teacher-content-card p',
    '.teacher-question > strong',
    '.teacher-explanation'
  ].join(',');

  const optionPrefix=index=>{
    const letters='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return letters[index]||String(index+1);
  };

  const stripReadingLabels=value=>clean(value)
    .replace(/^(?:[👉➡️✨⭐]\s*)*(?:şimdi\s+)?sıra\s+sende\s*[!:.\-–—]*\s*/i,'')
    .replace(/^şimdi\s+sıra\s+sende\s*[!:.\-–—]*\s*/i,'')
    .trim();

  const optionSpeechText=(option,index)=>{
    if(!(option instanceof Element))return '';
    const letter=optionPrefix(index);
    const clone=option.cloneNode(true);
    clone.querySelectorAll?.('input,button,svg,.option-letter,.answer-letter,.choice-letter,.option-key,.answer-key').forEach(el=>el.remove());

    const first=clone.firstElementChild;
    if(first&&clean(first.textContent).toLocaleUpperCase('tr-TR')===letter)first.remove();

    let optionText=stripReadingLabels(clone.textContent);
    optionText=optionText.replace(new RegExp('^\\s*(?:\\('+letter+'\\)|'+letter+'\\s*[\\).:\\-])\\s*','i'),'').trim();
    return optionText?letter+' şıkkı. '+optionText:letter+' şıkkı.';
  };

  const questionSpeechText=question=>{
    if(!(question instanceof Element))return '';
    const directSelector='[data-question-text],.question-text,.question-title,.question-prompt,.question-stem,.puzzle-question,.prompt';
    const direct=question.matches?.(directSelector)?question:question.querySelector?.(directSelector);
    if(direct){
      const value=stripReadingLabels(direct.textContent);
      if(value)return value;
    }

    const clone=question.cloneNode(true);
    clone.querySelectorAll?.('.answers,.teacher-option,.feedback,.game-feedback,form,button,input,select,textarea,svg').forEach(el=>el.remove());
    return stripReadingLabels(clone.textContent);
  };

  const readableContainerForHeading=heading=>{
    if(!(heading instanceof Element))return null;
    const preferred=heading.closest(
      '.discover-card,.discovery-card,.lesson-card,.lesson-step,.activity-card,.content-card,.question-card,article,section'
    );
    if(preferred&&preferred.closest('#screen'))return preferred;

    let node=heading.parentElement;
    for(let depth=0;node&&depth<3;depth++,node=node.parentElement){
      if(!node.closest?.('#screen'))break;
      const value=clean(node.textContent);
      if(value&&value.length<=1200)return node;
    }
    return null;
  };

  const directReadableLabel=element=>{
    if(!(element instanceof Element))return '';
    const direct=[...element.childNodes]
      .filter(node=>node.nodeType===Node.TEXT_NODE)
      .map(node=>node.textContent||'')
      .join(' ');
    const own=clean(direct);
    if(own)return own;
    const total=clean(element.textContent);
    return total.length<=120?total:'';
  };

  const discoveryContainerForHeading=heading=>{
    if(!(heading instanceof Element))return null;
    let node=heading;
    for(let depth=0;node&&depth<6;depth++,node=node.parentElement){
      if(!node.closest?.('#screen'))break;
      const text=clean(node.textContent);
      if(!text||text.length>1800)continue;
      const withoutTitle=text.replace(/^(?:birlikte\s+)?keşfedelim\b[\s:!?.\-–—]*/i,'').trim();
      if(withoutTitle.length>=12)return node;
    }
    return readableContainerForHeading(heading);
  };

  const discoverySpeechText=(heading,card)=>{
    if(!(card instanceof Element))return '';
    const clone=card.cloneNode(true);
    clone.querySelectorAll?.(
      '.answers,.teacher-option,.feedback,.game-feedback,form,button,input,select,textarea,svg,'+
      '[data-question-text],.question-text,.question-title,.question-prompt,.question-stem,.puzzle-question,.prompt'
    ).forEach(el=>el.remove());

    let value=stripReadingLabels(clone.textContent);
    const marker=value.search(/(?:şimdi\s+)?sıra\s+sende\b/i);
    if(marker>0)value=value.slice(0,marker).trim();

    const title=clean(heading.textContent);
    if(title&&value&&!value.toLocaleLowerCase('tr-TR').startsWith(title.toLocaleLowerCase('tr-TR'))){
      value=title+'. '+value;
    }
    return value.slice(0,700);
  };

  const lessonTextCandidates=rootScope=>{
    const result=[];
    if(rootScope===document){
      const screen=document.getElementById('screen');
      if(screen)result.push(...screen.querySelectorAll('*'));
      return result;
    }
    if(rootScope instanceof Element&&rootScope.closest('#screen')){
      result.push(rootScope,...rootScope.querySelectorAll('*'));
    }
    return result;
  };

  const markTextDrivenLessonReadables=rootScope=>{
    const candidates=lessonTextCandidates(rootScope);

    candidates.forEach(heading=>{
      const label=directReadableLabel(heading).toLocaleLowerCase('tr-TR');
      if(!label)return;

      if(/^(?:birlikte\s+)?keşfedelim\b/i.test(label)){
        const card=discoveryContainerForHeading(heading);
        if(!card||card.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        const value=discoverySpeechText(heading,card);
        if(!value)return;

        card.setAttribute('data-adimbot-read','text');
        card.setAttribute('data-adimbot-text',value);
        card.setAttribute('data-adimbot-discovery','1');
        return;
      }

      if(/^(?:şimdi\s+)?sıra\s+sende\b/i.test(label)){
        const card=readableContainerForHeading(heading);
        if(!card||card.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        const value=questionSpeechText(card);
        if(!value)return;

        card.setAttribute('data-adimbot-read','text');
        card.setAttribute('data-adimbot-text','Soru. '+value);
      }
    });
  };

  const hintTriggerText=trigger=>{
    if(!(trigger instanceof Element))return '';
    const ids=[
      trigger.getAttribute('aria-controls'),
      trigger.getAttribute('aria-describedby')
    ].filter(Boolean).flatMap(value=>String(value).split(/\s+/)).filter(Boolean);
    for(const id of ids){
      const target=document.getElementById(id);
      if(!target)continue;
      const value=stripReadingLabels(target.textContent);
      if(value)return /^ipucu\b/i.test(value)?value:'İpucu. '+value;
    }

    const selector=trigger.getAttribute('data-target')||trigger.getAttribute('data-bs-target')||'';
    if(/^#[A-Za-z][\w:.-]*$/.test(selector)){
      const target=document.querySelector(selector);
      const value=stripReadingLabels(target?.textContent);
      if(value)return /^ipucu\b/i.test(value)?value:'İpucu. '+value;
    }

    const sibling=trigger.nextElementSibling;
    if(sibling&&sibling.matches?.('.hint-content,.hint-text,.tip-content,.question-hint-content,[data-hint-content]')){
      const value=stripReadingLabels(sibling.textContent);
      if(value)return /^ipucu\b/i.test(value)?value:'İpucu. '+value;
    }

    const scope=trigger.closest('.hint-card,.hint-box,.tip-card,.tip-box,.question-hint,[data-hint]');
    if(scope){
      const clone=scope.cloneNode(true);
      clone.querySelectorAll?.('button,summary,svg,.answers,.teacher-option,.feedback,.game-feedback').forEach(el=>el.remove());
      const value=stripReadingLabels(clone.textContent);
      if(value)return /^ipucu\b/i.test(value)?value:'İpucu. '+value;
    }
    return '';
  };

  const markHintReadables=rootScope=>{
    rootScope.querySelectorAll?.('#screen button,#screen summary,#screen h1,#screen h2,#screen h3,#screen h4,#screen strong,#screen [data-hint-trigger]').forEach(trigger=>{
      if(trigger.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      const label=clean(trigger.getAttribute('aria-label')||trigger.textContent).toLocaleLowerCase('tr-TR');
      if(!/^ipucu\b/i.test(label)&&!trigger.hasAttribute('data-hint-trigger'))return;
      const value=hintTriggerText(trigger);
      trigger.setAttribute('data-adimbot-hint-trigger','1');
      if(value)trigger.setAttribute('data-adimbot-text',value);
    });
  };

  const markQuestionReadables=scope=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;
    const questionSelector='.puzzle-question,.teacher-question > strong,[data-question-text],.question-text,.question-title,.question-prompt,.question-stem';

    rootScope.querySelectorAll?.(questionSelector).forEach(question=>{
      if(question.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      const questionText=questionSpeechText(question);
      question.setAttribute('data-adimbot-read','text');
      if(questionText)question.setAttribute('data-adimbot-text','Soru. '+questionText);
    });

    rootScope.querySelectorAll?.('.question-card,.quiz-question,.exercise-question,.question-block').forEach(card=>{
      if(card.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      const questionText=questionSpeechText(card);
      if(!questionText)return;
      card.setAttribute('data-adimbot-read','text');
      card.setAttribute('data-adimbot-text','Soru. '+questionText);
    });

    const answerGroups=[...rootScope.querySelectorAll?.('.answers')||[]];
    answerGroups.forEach(group=>{
      [...group.querySelectorAll('.answer')].forEach((answer,index)=>{
        if(answer.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        answer.setAttribute('data-adimbot-read','action');
        answer.setAttribute('data-adimbot-text',optionSpeechText(answer,index));
      });
    });

    rootScope.querySelectorAll?.('.teacher-question form').forEach(form=>{
      [...form.querySelectorAll('.teacher-option')].forEach((option,index)=>{
        if(option.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        option.setAttribute('data-adimbot-read','action');
        option.setAttribute('data-adimbot-text',optionSpeechText(option,index));
      });
    });

    markTextDrivenLessonReadables(rootScope);
  };

  const markReadableElements=scope=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;
    rootScope.querySelectorAll?.(autoActionSelector).forEach(el=>{
      if(el.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      if(!el.hasAttribute('data-adimbot-read'))el.setAttribute('data-adimbot-read','action');
    });
    rootScope.querySelectorAll?.(autoTextSelector).forEach(el=>{
      if(el.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      if(el.closest('[data-adimbot-read="action"]'))return;
      if(!el.hasAttribute('data-adimbot-read'))el.setAttribute('data-adimbot-read','text');
    });
    markQuestionReadables(rootScope);
    markHintReadables(rootScope);
  };

  const clearArmTimer=()=>{
    if(armTimer){clearTimeout(armTimer);armTimer=null;}
  };

  const disarmCard=card=>{
    clearArmTimer();
    if(!card||armedCard===card)armedCard=null;
  };

  const scheduleDisarm=card=>{
    clearArmTimer();
    armTimer=setTimeout(()=>{
      if(armedCard===card)armedCard=null;
    },5000);
  };

  const cardSpeechText=card=>{
    if(!card)return '';
    const explicit=stripReadingLabels(card.getAttribute?.('data-adimbot-text'));
    if(explicit)return explicit;
    const titleEl=card.querySelector?.('h1,h2,h3,strong');
    const descEl=card.querySelector?.('p');
    const smallEl=card.querySelector?.('small');
    const title=clean(titleEl?.textContent);
    const desc=clean(descEl?.textContent);
    const small=clean(smallEl?.textContent);
    const composed=[title,desc||small].filter(Boolean).join('. ');
    return stripReadingLabels(composed||card.getAttribute?.('aria-label')||card.textContent);
  };

  const legacySpeakerSelector=[
    '.activity-speech-icon',
    '.speech-icon',
    '.speaker-icon',
    '.audio-speech-icon',
    '.tts-button',
    '.listen-button',
    '[data-speech-kind="activity-card"]',
    'button[data-speech-action]',
    'button[data-tts]',
    'button[data-action="speak"]',
    'button[data-action="speech"]',
    'a[data-action="speak"]',
    'a[data-action="speech"]'
  ].join(',');

  const looksLikeLegacySpeaker=el=>{
    if(!(el instanceof Element))return false;
    if(el.closest('[data-adimbot-student]'))return false;
    if(el.matches?.(legacySpeakerSelector))return true;

    const tag=el.tagName;
    if(tag!=='BUTTON'&&tag!=='A'&&el.getAttribute('role')!=='button')return false;
    const raw=String(el.textContent||'').trim();
    return /^[🔊🔈🔉🔇]$/.test(raw);
  };

  const removeLegacyCardSpeakers=scope=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;
    rootScope.querySelectorAll?.(legacySpeakerSelector).forEach(el=>{
      if(!el.closest('[data-adimbot-student]'))el.remove();
    });
    rootScope.querySelectorAll?.('button,a,[role="button"]').forEach(el=>{
      if(looksLikeLegacySpeaker(el))el.remove();
    });
  };

  const clearGuideTarget=()=>{
    if(guideTarget&&guideTarget.classList)guideTarget.classList.remove('adb-guide-target');
    guideTarget=null;
  };

  const setGuideState=active=>{
    guideActive=active===true;
    try{sessionStorage.setItem(GUIDE_KEY,guideActive?'1':'0');}catch(_){}
    try{botApi()?.setGuideMode?.(guideActive);}catch(_){}
    if(!guideActive)clearGuideTarget();
  };

  const firstVisible=selector=>[...document.querySelectorAll(selector)].find(el=>{
    const rect=el.getBoundingClientRect();
    const style=getComputedStyle(el);
    return rect.width>0&&rect.height>0&&style.display!=='none'&&style.visibility!=='hidden';
  })||null;

  const personalProgress=()=>{
    try{
      const context=botApi()?.context?.();
      return context&&typeof context==='object'
        ?context
        :{name:'',stars:0,completedSteps:0,games:0,readings:0,badges:0};
    }catch(_){
      return {name:'',stars:0,completedSteps:0,games:0,readings:0,badges:0};
    }
  };

  const progressSentence=()=>{
    const p=personalProgress();
    const name=String(p.name||'').trim();
    const prefix=name?name+', ':'';
    if((Number(p.completedSteps)||0)>=5)return `${prefix}${Number(p.completedSteps)} çalışma adımı tamamladın ve ${Number(p.stars)||0} yıldızın var. Harika ilerliyorsun!`;
    if((Number(p.games)||0)>=2)return `${prefix}${Number(p.games)} etkinlik tamamladın. ${Number(p.stars)||0} yıldızın var. Böyle devam!`;
    if((Number(p.stars)||0)>0)return `${prefix}${Number(p.stars)} yıldızın var. Bir küçük adım daha atalım!`;
    return name?`${name}, ilk yıldızın için birlikte başlayabiliriz.`:'İlk yıldızın için birlikte başlayabiliriz.';
  };

  const helpForScreen=()=>{
    const path=location.pathname.split('/').pop()||'';
    const hash=location.hash||'#/anasayfa';

    if(path==='ogretmenim.php'){
      const question=firstVisible('.teacher-question > strong');
      if(question){
        return 'Burası Öğretmenim bölümü. Öğretmeninin gönderdiği soruları ve çalışmaları burada görebilirsin. Soruya dokunursan okuyabilirim. Seçeneklere ilk dokunuşta şıkkı okurum, ikinci dokunuşta seçebilirsin.';
      }
      return 'Burası Öğretmenim bölümü. Öğretmeninin sana gönderdiği soru, tekrar, ödev ve notlar burada görünür. Başlıklara dokunarak içerikleri açabilirsin.';
    }

    if(hash.startsWith('#/oyun/')){
      const hasAnswers=!!firstVisible('#screen .answers .answer');
      return hasAnswers
        ?'Şu anda bir oyundasın. Soruyu dinleyebilirsin. Şıklara ilk dokunuşta seçeneği okurum, ikinci dokunuşta cevabını seçersin. Doğru cevabı sen seçmeden söylemem.'
        :'Şu anda bir oyundasın. Ekrandaki yönergeyi dikkatlice incele. Yardım istediğinde ne yapacağını sana açıklayabilirim.';
    }

    if(hash.startsWith('#/etkinlikler')){
      return 'Burası Etkinlikler bölümü. Buradan bir oyun seçebilirsin. Bir oyuna ilk dokunuşta adını ve açıklamasını okurum, ikinci dokunuşta oyunu açarım.';
    }

    if(hash.startsWith('#/dersler')){
      const lessonStep=firstVisible('#screen a.lesson-step');
      return lessonStep
        ?'Şu anda bir dersin içindesin. Çalışma adımlarını sırayla açabilirsin. Bir karta ilk dokunuşta içeriğini okurum, ikinci dokunuşta açarım.'
        :'Burası Dersler bölümü. Öğrenmek istediğin dersi seçebilirsin. Ders kartlarına ilk dokunuşta sana okuyacağım, ikinci dokunuşta açacağım.';
    }

    if(hash.startsWith('#/profil')){
      return 'Burası Profil bölümü. '+progressSentence()+' Buradan ilerlemeni, ayarlarını ve sana ait bilgileri görebilirsin.';
    }

    if(hash.startsWith('#/anasayfa')||hash==='#/'||hash==='#'){
      return progressSentence()+' Burası ana sayfa. Derslere ve etkinliklere buradan ulaşabilirsin. Ne yapacağını bilmiyorsan robota dokunarak sesli rehberi başlatabilirsin.';
    }

    return 'Bu ekranda sana görünen başlıkları ve kartları okuyabilirim. Bir kartı açmadan önce ilk dokunuşta ne olduğunu söyleyebilirim. Robota dokunursan adım adım rehber de başlatabilirim.';
  };

  const requestHelp=()=>{
    if(!canSpeak())return false;
    // Yardım açıklaması rehber modunu kapatmaz; yalnızca mevcut rehber hedefini geçici olarak temizler.
    clearGuideTarget();
    const text=helpForScreen();
    return botApi().speak(text);
  };

  const guideStepForScreen=()=>{
    const path=location.pathname.split('/').pop()||'';
    const hash=location.hash||'#/anasayfa';

    if(path==='ogretmenim.php'){
      const target=firstVisible('.teacher-group > summary,.teacher-lesson > summary,.teacher-topic > summary');
      return {
        key:'ogretmenim',
        target,
        text:target
          ?'Öğretmeninin çalışmalarını görmek için açık olan başlıklara dokunabilirsin.'
          :'Öğretmenin sana içerik gönderdiğinde çalışmalar burada görünecek.'
      };
    }

    if(hash.startsWith('#/oyun/')){
      const target=firstVisible('#screen .answers .answer');
      return {
        key:'oyun',
        target,
        text:target
          ?'Soruyu dinle. Sonra doğru olduğunu düşündüğün seçeneğe dokun.'
          :'Oyunu dikkatlice incele. Hazır olduğunda ilk adıma dokun.'
      };
    }

    if(hash.startsWith('#/etkinlikler')){
      const target=firstVisible('#screen a.game-tile,#screen a.home-game');
      return {
        key:'etkinlikler',
        target,
        text:target
          ?'Oynamak istediğin etkinliğe dokun. İlk dokunuşta sana okuyacağım.'
          :'Etkinlikler yüklendiğinde buradan bir oyun seçebilirsin.'
      };
    }

    if(hash.startsWith('#/dersler')){
      const target=firstVisible('#screen .course-row > a,#screen a.home-course,#screen a.lesson-step');
      return {
        key:'dersler',
        target,
        text:target
          ?'Öğrenmek istediğin ders veya çalışma kartına dokun.'
          :'Ders kartları burada görünecek. Bir ders seçerek başlayabilirsin.'
      };
    }

    if(hash.startsWith('#/profil')){
      const target=firstVisible('#screen a[href],#screen button');
      return {
        key:'profil',
        target,
        text:'Profilindeki bölümleri buradan açabilir ve ilerlemeni inceleyebilirsin.'
      };
    }

    const target=firstVisible('.app-nav a[data-tab="dersler"],#screen a[href]');
    return {
      key:'anasayfa',
      target,
      text:target
        ?'Başlamak için Dersler bölümüne ya da ekrandaki bir çalışma kartına dokun.'
        :'Hazır olduğunda birlikte bir ders seçebiliriz.'
    };
  };

  const presentGuide=({voice=true}={})=>{
    if(!guideActive||!canSpeak())return false;
    clearTimeout(guideTimer);
    clearGuideTarget();

    const step=guideStepForScreen();
    if(step.target){
      guideTarget=step.target;
      guideTarget.classList.add('adb-guide-target');
      try{guideTarget.scrollIntoView({block:'nearest',inline:'nearest',behavior:'smooth'});}catch(_){}
    }

    return botApi().speak(step.text,{voice});
  };

  const requestGuide=()=>{
    if(!canSpeak())return false;
    if(!guideActive)setGuideState(true);
    return presentGuide({voice:true});
  };

  const stopGuide=({silent=false}={})=>{
    clearTimeout(guideTimer);
    setGuideState(false);
    if(!silent&&canSpeak())botApi().speak('Rehberi kapattım. İstersen yine bana dokunabilirsin.');
    return true;
  };

  const handleReadableClick=e=>{
    const target=e.target;
    if(!(target instanceof Element)||!canSpeak())return;

    const item=target.closest('[data-adimbot-read]');
    if(!item||item.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
    if(target.closest('input,select,textarea'))return;
    if(target.closest('label')&&item!==target.closest('label'))return;

    const mode=item.getAttribute('data-adimbot-read');

    if(mode==='action'){
      if(armedCard===item){
        disarmCard(item);
        stopSpeech();
        return; // second click continues to the original action
      }

      e.preventDefault();
      e.stopImmediatePropagation();

      disarmCard(armedCard);
      armedCard=item;
      const text=cardSpeechText(item);
      const ok=speak(text,item,()=>scheduleDisarm(item));
      if(!ok)disarmCard(item);
      return;
    }

    if(mode==='text'){
      const text=cardSpeechText(item);
      if(text)speak(text);
    }
  };
  const isActivityGame=()=>location.hash.startsWith('#/oyun/');

  const decorateActivities=(scope=document)=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;
    removeLegacyCardSpeakers(rootScope);
    markReadableElements(rootScope);
  };

  document.addEventListener('click',handleReadableClick,true);
  const handleHintTriggerClick=e=>{
    const target=e.target;
    if(!(target instanceof Element)||!canSpeak())return;
    const trigger=target.closest('[data-adimbot-hint-trigger]');
    if(!trigger||trigger.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;

    // İpucu düğmesinin kendi açma/kapatma davranışını engellemeden,
    // DOM güncellendikten sonra ipucu metnini seslendir.
    setTimeout(()=>{
      if(!trigger.isConnected)return;
      const text=hintTriggerText(trigger)||stripReadingLabels(trigger.getAttribute('data-adimbot-text'));
      if(text)speak(text);
    },60);
  };

  document.addEventListener('click',handleHintTriggerClick,false);


  // A correct answer changes both its class and the feedback text.
  // Merge both mutations into one announcement after the DOM has settled.
  const pendingFeedback=new Map();
  const announcedFeedback=new WeakMap();

  const feedbackFor=target=>{
    let scope=target.closest('.question-card,#game-board,.game-screen,.screen-content');
    while(scope){
      const feedback=scope.querySelector('.feedback,.game-feedback');
      if(feedback)return feedback;
      scope=scope.parentElement?.closest('.question-card,#game-board,.game-screen,.screen-content')||null;
    }
    return null;
  };

  const defaultFeedback=state=>state==='correct'
    ? 'Harika, doğru cevap!'
    : 'Olmadı, tekrar deneyelim.';

  const questionTextFor=answer=>{
    if(!(answer instanceof Element))return '';
    const scope=answer.closest('.question-card,.quiz-question,.exercise-question,.question-block,#game-board,.game-screen,.screen-content');
    if(!scope)return '';
    const question=scope.querySelector('[data-question-text],[data-adimbot-text^="Soru"],.question-text,.question-title,.question-prompt,.question-stem,.puzzle-question,.teacher-question > strong');
    return stripReadingLabels(question?.getAttribute?.('data-question-text')||question?.getAttribute?.('data-adimbot-text')||question?.textContent||'')
      .replace(/^soru\s*[!:.-–—]*\s*/i,'')
      .slice(0,240);
  };

  const answerTextFor=answer=>{
    if(!(answer instanceof Element))return '';
    const raw=answer.getAttribute('data-adimbot-text')||answer.textContent||'';
    return stripReadingLabels(raw)
      .replace(/^[A-Z]\s+şıkkı[.:]?\s*/i,'')
      .replace(/^\s*[A-Z]\s*[\).:\-]\s*/i,'')
      .trim()
      .slice(0,120);
  };

  const numericValue=value=>{
    const match=String(value||'').replace(',','.').match(/-?\d+(?:\.\d+)?/);
    if(!match)return null;
    const number=Number(match[0]);
    return Number.isFinite(number)?number:null;
  };

  const coachingPhraseFor=answer=>{
    const questionRaw=questionTextFor(answer);
    const question=questionRaw.toLocaleLowerCase('tr-TR');
    const selected=answerTextFor(answer);
    const selectedNumber=numericValue(selected);
    if(!question)return 'Bir kez daha düşün. Soruyu yavaşça okuyup önemli kelimelere dikkat et.';

    const expression=question.match(/(-?\d+)\s*([+＋\-−–])\s*(-?\d+)/);
    if(/[+＋]|topla|toplam|kaç tane|kaç eder/.test(question)){
      if(expression&&/[+＋]/.test(expression[2])&&selectedNumber!==null){
        const first=Number(expression[1]),second=Number(expression[3]),expected=first+second;
        if(selectedNumber===first||selectedNumber===second){
          return 'Seçtiğin sayı iki gruptan yalnızca birini gösteriyor olabilir. Toplamada iki grubu birleştirip hepsini yeniden say.';
        }
        if(Math.abs(selectedNumber-expected)===1){
          return 'Çok yaklaşmışsın. Sayarken son adımı yeniden kontrol et ve iki gruptaki nesnelerin hepsini bir kez say.';
        }
      }
      return 'Bir daha deneyelim. Sayıları tek tek düşün; istersen parmaklarınla ya da nesneleri sayarak toplama yap.';
    }
    if(/[-−–]|çıkar|eksil|kaldı|fark/.test(question)){
      if(expression&&/[\-−–]/.test(expression[2])&&selectedNumber!==null){
        const first=Number(expression[1]),second=Number(expression[3]),expected=first-second;
        if(selectedNumber===first+second){
          return 'Toplama yapmış olabilirsin. Bu kez başlangıç sayısından çıkarılan kadar geriye doğru say.';
        }
        if(Math.abs(selectedNumber-expected)===1){
          return 'Çok yaklaşmışsın. Geriye doğru sayarken kaç adım attığını bir kez daha kontrol et.';
        }
      }
      return 'Bir daha deneyelim. Önce başlangıçtaki sayıyı düşün, sonra çıkarılan kadarını azaltıp yeniden say.';
    }
    if(/büyük|küçük|fazla|az|karşılaştır|eşit/.test(question)){
      const numbers=(question.match(/-?\d+/g)||[]).slice(0,2).map(Number);
      if(numbers.length===2&&numbers[0]!==numbers[1]&&selected.includes('=')){
        return 'Bu iki sayı aynı değil. Eşit işaretini yeniden düşün ve hangi sayının daha büyük olduğuna bak.';
      }
      if(/[<>]/.test(selected)){
        return 'Seçtiğin karşılaştırma işaretini yeniden kontrol et. İşaretin açık tarafı daha büyük sayıya bakmalı.';
      }
      return 'Sayıları ya da grupları yeniden karşılaştır. Hangisinin daha büyük, daha küçük veya eşit olduğuna dikkat et.';
    }
    if(/harf|hece|kelime|ses|okuy|cümle/.test(question)){
      if(selected&&selected.length<=32){
        return `Seçtiğin "${selected}" seçeneğini sorudaki kelimeyle ses ses karşılaştır. Heceleri yavaşça yeniden oku.`;
      }
      return 'Kelimeyi ya da cümleyi yavaşça bir kez daha oku. Sesleri ve heceleri sırayla düşün.';
    }
    if(/önce|sonra|sıra|örüntü|devam|hangisi gelir/.test(question)){
      return selected
        ?'Seçtiğin seçeneği örüntünün tekrar eden bölümüyle karşılaştır. Önceki iki adımda neyin tekrar ettiğine bak.'
        :'Sıraya yeniden bak. Önceki adımlarda neyin tekrar ettiğini bulup bir sonraki adımı düşün.';
    }
    if(/şekil|renk|üçgen|kare|daire|dikdörtgen/.test(question)){
      return selected
        ?'Seçtiğin şekli soruda istenen özellikle yeniden karşılaştır. Kenar, biçim ve renk ipuçlarına tek tek bak.'
        :'Şeklin özelliklerine dikkat et. Kenarlarını, biçimini veya rengini yeniden karşılaştır.';
    }
    return selected
      ?'Seçtiğin seçeneği sorudaki önemli kelimeyle yeniden karşılaştır. Sonra diğer seçeneklere de bir kez bak.'
      :'Soruyu bir kez daha yavaşça oku. Önemli kelimeyi bul ve seçenekleri onunla karşılaştır.';
  };

  const reactToAnswer=(state,answer=null,onEnd=null)=>{
    const type=state==='correct'?'success':'retry';
    const context=state==='incorrect'?{coachingPhrase:coachingPhraseFor(answer)}:{};
    return react(type,context,onEnd)||speak(state==='incorrect'?context.coachingPhrase:defaultFeedback(state),null,onEnd);
  };

  const queueFeedback=(feedback,state='',answer=null)=>{
    if(!feedback)return;
    const pending=pendingFeedback.get(feedback);
    if(pending){
      if(state)pending.state=state;
      if(answer)pending.answer=answer;
      return;
    }
    const item={state,answer};
    pendingFeedback.set(feedback,item);
    requestAnimationFrame(()=>{
      pendingFeedback.delete(feedback);
      if(!isActivityGame()||!feedback.isConnected)return;
      const content=clean(feedback.textContent);
      const instruction=/^(biraz düşün|bir cevap seç|cevabını seç)/i.test(content);
      const text=content&&!instruction?content:'';
      const signature=text||(item.state?defaultFeedback(item.state):'');
      if(!signature)return;
      const previous=announcedFeedback.get(feedback);
      if(previous&&previous.text===signature&&(!item.answer||previous.answer===item.answer))return;
      announcedFeedback.set(feedback,{text:signature,answer:item.answer});
      if(item.state){
        const reacted=reactToAnswer(item.state,item.answer,({cancelled=false}={})=>{
          if(!cancelled&&text)setTimeout(()=>speak(text),120);
        });
        if(!reacted&&text)speak(text);
      }else if(text){
        speak(text);
      }
    });
  };

  const speakAnswerState=target=>{
    if(!(target instanceof HTMLElement)||!target.classList.contains('answer'))return;
    const state=target.classList.contains('correct')?'correct':target.classList.contains('incorrect')?'incorrect':'';
    if(!state||spokenState.get(target)===state)return;
    spokenState.set(target,state);

    if(isActivityGame()){
      const feedback=feedbackFor(target);
      if(feedback){
        queueFeedback(feedback,state,target);
      }else{
        requestAnimationFrame(()=>{
          if(isActivityGame())reactToAnswer(state,target);
        });
      }
      return;
    }

    // Keep the existing speech behavior for exercises outside the games.
    requestAnimationFrame(()=>{
      const feedback=feedbackFor(target);
      const text=clean(feedback?.textContent);
      if(text){
        const reacted=reactToAnswer(state,target,({cancelled=false}={})=>{
          if(!cancelled)setTimeout(()=>speak(text),120);
        });
        if(!reacted)speak(text);
      }else{
        reactToAnswer(state,target);
      }
    });
  };

  const speakFeedbackElement=target=>{
    if(!(target instanceof HTMLElement)||!isActivityGame())return;
    queueFeedback(target);
  };

  let decorateFrame=0,observing=false;
  const pendingDecorateScopes=new Set();

  const flushDecorations=()=>{
    decorateFrame=0;
    if(document.hidden){
      pendingDecorateScopes.clear();
      return;
    }
    const scopes=[...pendingDecorateScopes];
    pendingDecorateScopes.clear();
    if(!scopes.length)return;
    scopes.forEach(scope=>{
      if(scope?.isConnected!==false)decorateActivities(scope);
    });
  };

  const scheduleDecoration=scope=>{
    const rootScope=scope instanceof Element?scope:scope?.parentElement;
    if(rootScope)pendingDecorateScopes.add(rootScope);
    if(decorateFrame||document.hidden)return;
    decorateFrame=requestAnimationFrame(flushDecorations);
  };

  const observer=new MutationObserver(mutations=>{
    for(const mutation of mutations){
      if(mutation.type==='attributes'&&mutation.attributeName==='class'){
        speakAnswerState(mutation.target);
        continue;
      }
      if(mutation.type==='childList'||mutation.type==='characterData'){
        const el=mutation.target instanceof HTMLElement ? mutation.target : mutation.target.parentElement;
        scheduleDecoration(el);
        const feedback=el?.closest?.('.feedback,.game-feedback');
        if(feedback && isActivityGame() && !pendingFeedback.has(feedback)){
          requestAnimationFrame(()=>speakFeedbackElement(feedback));
        }
      }
    }
  });

  const observeDom=()=>{
    if(observing||!document.body)return;
    observer.observe(document.body,{
      subtree:true,
      attributes:true,
      attributeFilter:['class'],
      childList:true,
      characterData:true
    });
    observing=true;
  };

  const pauseDomObserver=()=>{
    if(!observing)return;
    observer.disconnect();
    observing=false;
    pendingDecorateScopes.clear();
    if(decorateFrame){cancelAnimationFrame(decorateFrame);decorateFrame=0;}
  };

  const start=()=>{
    observeDom();
    decorateActivities();

    try{guideActive=sessionStorage.getItem(GUIDE_KEY)==='1';}catch(_){guideActive=false;}
    try{botApi()?.setGuideMode?.(guideActive);}catch(_){}
    if(guideActive){
      clearTimeout(guideTimer);
      guideTimer=setTimeout(()=>presentGuide({voice:false}),350);
    }

    window.AdimBotGuide=Object.freeze({
      request:()=>requestGuide(),
      start:()=>{setGuideState(true);return presentGuide({voice:true});},
      stop:options=>stopGuide(options||{}),
      repeat:()=>presentGuide({voice:true}),
      isActive:()=>guideActive
    });

    window.AdimBotHelp=Object.freeze({
      request:()=>requestHelp(),
      explain:()=>helpForScreen(),
      screen:()=>{
        const path=location.pathname.split('/').pop()||'';
        const hash=location.hash||'#/anasayfa';
        if(path==='ogretmenim.php')return 'ogretmenim';
        if(hash.startsWith('#/oyun/'))return 'oyun';
        if(hash.startsWith('#/etkinlikler'))return 'etkinlikler';
        if(hash.startsWith('#/dersler'))return 'dersler';
        if(hash.startsWith('#/profil'))return 'profil';
        return 'anasayfa';
      }
    });

    window.AdimBotReadable=Object.freeze({
      refresh:()=>markReadableElements(document),
      register:(element,mode='action',text='')=>{
        if(!(element instanceof Element))return false;
        if(mode!=='action'&&mode!=='text')return false;
        element.setAttribute('data-adimbot-read',mode);
        if(text)element.setAttribute('data-adimbot-text',String(text));
        return true;
      },
      ignore:element=>{
        if(!(element instanceof Element))return false;
        element.setAttribute('data-adimbot-ignore','1');
        return true;
      }
    });
  };

  window.addEventListener('hashchange',()=>{
    stopSpeech();
    clearArmTimer();
    armedCard=null;
    pendingFeedback.clear();
    clearGuideTarget();
    setTimeout(()=>{
      decorateActivities();
      if(guideActive)presentGuide({voice:true});
    },140);
  });
  document.addEventListener('visibilitychange',()=>{
    if(document.hidden){
      stopSpeech();
      pauseDomObserver();
    }else{
      observeDom();
      decorateActivities();
    }
  });

  window.addEventListener('pagehide',()=>{
    stopSpeech();
    clearArmTimer();
    armedCard=null;
    clearGuideTarget();
    pauseDomObserver();
  });

  window.addEventListener('pageshow',()=>{
    observeDom();
    decorateActivities();
  });

  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start,{once:true});
  else start();
})();
