(()=> {
  const root=document.querySelector('[data-adimbot]');
  if(!root) return;

  const bubble=root.querySelector('[data-adimbot-bubble]');
  const stage=root.querySelector('[data-adimbot-stage]');
  const close=root.querySelector('[data-adimbot-close]');
  const messages=[
    'Merhaba! Ben AdımBot 👋',
    'Buradayım! İstersen birlikte başlayabiliriz.',
    'Bugün küçük bir adım bile büyük ilerleme demek.',
    'Bana tıklayınca konuşma animasyonunu görebilirsin.'
  ];
  let index=0;
  let speakingTimer=0;

  const speak=(message)=>{
    if(!bubble) return;
    bubble.textContent=message;
    root.classList.add('is-ready','is-speaking');
    window.clearTimeout(speakingTimer);
    speakingTimer=window.setTimeout(()=>root.classList.remove('is-speaking'),1800);
  };

  window.setTimeout(()=>speak(messages[0]),650);

  stage?.addEventListener('click',()=>{
    index=(index+1)%messages.length;
    speak(messages[index]);
  });

  stage?.addEventListener('keydown',(event)=>{
    if(event.key==='Enter'||event.key===' '){
      event.preventDefault();
      stage.click();
    }
  });

  close?.addEventListener('click',(event)=>{
    event.stopPropagation();
    root.classList.add('is-hidden');
  });
})();