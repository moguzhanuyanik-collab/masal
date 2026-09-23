'use strict';
(() => {
  const EXTRA_IDS=["hece_birlestir","kelime_yakala","ona_tamamla","sayi_avi","dogru_yanlis","golgesini_bul","ritmi_tekrarla"];
  const STORE='ilkadim-extra-games-v1';
  let extraGames=[];
  let completed=new Set();
  const nativeFetch=window.fetch.bind(window);

  const readStored=()=>{
    try{
      const arr=JSON.parse(localStorage.getItem(STORE)||'[]');
      return Array.isArray(arr)?arr.filter(x=>EXTRA_IDS.includes(x)):[];
    }catch{return [];}
  };
  const writeStored=()=>{
    try{localStorage.setItem(STORE,JSON.stringify([...completed].filter(x=>EXTRA_IDS.includes(x))));}catch{}
  };
  const captureServerGames=()=>{
    try{
      const state=JSON.parse(localStorage.getItem('ilk-adim-profile')||'{}');
      const list=Array.isArray(state.games)?state.games:[];
      list.filter(x=>EXTRA_IDS.includes(x)).forEach(x=>completed.add(x));
      writeStored();
    }catch{}
  };
  readStored().forEach(x=>completed.add(x));
  captureServerGames();

  window.fetch=function(input,init){
    try{
      const url=typeof input==='string'?input:(input&&input.url)||'';
      if(/(?:^|\/)api\/state\.php(?:\?|$)/.test(url) && init && String(init.method||'GET').toUpperCase()==='POST' && typeof init.body==='string'){
        const payload=JSON.parse(init.body);
        const state=payload&&payload.state&&typeof payload.state==='object'?payload.state:payload;
        if(state&&Array.isArray(state.games)){
          state.games=[...new Set([...state.games,...completed])];
          init={...init,body:JSON.stringify(payload)};
        }
      }
    }catch{}
    return nativeFetch(input,init);
  };

  const esc=v=>String(v).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const arrow=()=>'<svg aria-hidden="true"><use href="#arrow"/></svg>';
  const back=()=>'<svg aria-hidden="true"><use href="#back"/></svg>';
  const user=()=>'<svg aria-hidden="true"><use href="#user"/></svg>';
  const route=()=>location.hash.replace(/^#\/?/,'').split('/');

  function load(){
    nativeFetch('api/activities.php',{headers:{'Accept':'application/json'},credentials:'same-origin'})
      .then(r=>r.ok?r.json():Promise.reject(new Error('HTTP '+r.status)))
      .then(data=>{
        if(!data||data.ok!==true||!Array.isArray(data.games))return;
        extraGames=data.games;
        data.games.filter(g=>g.completed).forEach(g=>completed.add(g.id));
        writeStored();
        schedule();
      })
      .catch(err=>console.warn('İlkAdım etkinlik verileri:',err));
  }

  function card(g){
    return '<a class="game-tile" data-extra-game="'+esc(g.id)+'" href="#/oyun/'+encodeURIComponent(g.id)+'" style="--tint:'+esc(g.color)+'">'+
      '<span class="game-art" aria-hidden="true">'+esc(g.emoji)+'</span>'+
      '<div><small>'+esc(g.type)+'</small><h3>'+esc(g.name)+'</h3><p>'+esc(g.description)+'</p>'+
      '<span class="game-time">'+(completed.has(g.id)?'✓ Tamamlandı':'⏱ '+esc(g.time))+'</span></div>'+arrow()+'</a>';
  }

  function injectActivities(){
    const list=document.querySelector('.game-list');
    if(!list||!extraGames.length)return;
    extraGames.forEach(g=>{
      if(!list.querySelector('[data-extra-game="'+CSS.escape(g.id)+'"]')) list.insertAdjacentHTML('beforeend',card(g));
    });
  }

  function setTopbar(g){
    const bar=document.getElementById('app-topbar');
    if(!bar)return;
    bar.innerHTML='<a class="icon-button" href="#/etkinlikler" aria-label="Etkinliklere dön">'+back()+'</a>'+
      '<span class="topbar-title">'+esc(g.name)+'</span>'+
      '<a class="mini-avatar" href="#/profil" aria-label="Profilim">'+user()+'</a>';
  }

  function progress(value,label){
    return '<div class="progress" role="progressbar" aria-label="'+esc(label)+'" aria-valuenow="'+value+'" aria-valuemin="0" aria-valuemax="100"><span style="width:'+value+'%"></span></div>';
  }

  function markComplete(g){
    completed.add(g.id); writeStored();
    nativeFetch('api/activities.php',{
      method:'POST',headers:{'Content-Type':'application/json','Accept':'application/json'},
      body:JSON.stringify({game:g.id}),credentials:'same-origin'
    }).catch(()=>{});
    try{
      if(typeof window.recordGame==='function') window.recordGame({id:g.id,name:g.name});
    }catch{}
  }

  function play(g){
    const screen=document.getElementById('screen');
    if(!screen||screen.dataset.extraGame===g.id)return;
    screen.dataset.extraGame=g.id;
    setTopbar(g);
    screen.innerHTML='<div class="screen-content game-screen"><div class="game-intro" style="--tint:'+esc(g.color)+'">'+
      '<span>'+esc(g.emoji)+'</span><h1>'+esc(g.name)+'</h1><p>'+esc(g.description)+'</p></div><div id="game-board"></div></div>';

    const qs=Array.isArray(g.questions)?g.questions:[];
    let round=0;
    const board=document.getElementById('game-board');

    const show=()=>{
      if(!qs.length){
        board.innerHTML='<section class="game-complete"><span>🧩</span><h2>İçerik hazırlanıyor</h2><p>Bu oyunun görevleri henüz yüklenemedi.</p><a class="button primary full" href="#/etkinlikler">Oyunlara Dön '+arrow()+'</a></section>';
        return;
      }
      const q=qs[round];
      const total=qs.length;
      board.innerHTML='<div class="puzzle-count"><span>KEŞİF '+(round+1)+' / '+total+'</span><span>⭐</span></div>'+
        progress(Math.round(round/total*100),'Oyun ilerlemesi')+
        '<div class="puzzle-visual">'+esc(q.visual)+'</div>'+
        '<h2 class="puzzle-question">'+esc(q.question)+'</h2>'+
        '<div class="answers">'+q.options.map((o,i)=>'<button class="answer" data-extra-choice="'+i+'">'+esc(o)+'</button>').join('')+'</div>'+
        '<p class="feedback" role="status" aria-live="polite">💡 Biraz düşün, bir cevap seç.</p><div id="next-extra-round"></div>';

      board.querySelectorAll('[data-extra-choice]').forEach(btn=>btn.addEventListener('click',()=>{
        const correct=Number(btn.dataset.extraChoice)===Number(q.answer);
        btn.disabled=true;
        btn.classList.add(correct?'correct':'incorrect');
        const feedback=board.querySelector('.feedback');
        if(correct){
          feedback.classList.add('success');
          feedback.textContent='🌟 Doğru cevap: '+q.result+'. '+(q.explanation||'Harikasın!');
          board.querySelectorAll('[data-extra-choice]').forEach(x=>x.disabled=true);
          const next=document.getElementById('next-extra-round');
          next.innerHTML='<button class="button primary full" id="advance-extra">'+(round===total-1?'Oyunu Tamamla ✨':'Sonraki Keşif '+arrow())+'</button>';
          document.getElementById('advance-extra').addEventListener('click',()=>{
            round++;
            if(round<total) show();
            else{
              markComplete(g);
              board.innerHTML='<section class="game-complete"><span>🎉</span><h2>Harika iş!</h2><p>'+total+' keşfin tamamını bitirdin.<br>Başarın kaydedildi.</p>'+
                '<a class="button primary full" href="#/etkinlikler">Oyunlara Dön '+arrow()+'</a>'+
                '<button class="button soft full" id="extra-again">Yeniden Oyna</button></section>';
              document.getElementById('extra-again').addEventListener('click',()=>{round=0;show();});
            }
          });
        }else{
          feedback.classList.remove('success');
          feedback.textContent='💜 Tekrar düşün, başka bir cevap dene.';
        }
      }));
    };
    show();
    window.scrollTo({top:0,behavior:'instant'});
  }

  function patchReport(){
    if(route()[0]!=='profil'||route()[1]!=='rapor')return;
    let current=[];
    try{
      const state=JSON.parse(localStorage.getItem('ilk-adim-profile')||'{}');
      current=Array.isArray(state.games)?state.games:[];
    }catch{}
    const total=new Set([...current,...completed]).size;
    document.querySelectorAll('.report-stats > div').forEach(box=>{
      const label=box.querySelector('span');
      const strong=box.querySelector('strong');
      if(label&&strong&&label.textContent.trim()==='Oyun') strong.innerHTML=total+'<small>/10</small>';
    });
  }

  let scheduled=false;
  function apply(){
    scheduled=false;
    const r=route();
    if(r[0]==='etkinlikler') injectActivities();
    if(r[0]==='oyun'&&EXTRA_IDS.includes(r[1])){
      const g=extraGames.find(x=>x.id===r[1]);
      if(g) play(g);
    }
    patchReport();
  }
  function schedule(){
    if(scheduled)return;
    scheduled=true;
    requestAnimationFrame(()=>setTimeout(apply,0));
  }

  document.addEventListener('DOMContentLoaded',()=>{
    const screen=document.getElementById('screen');
    if(screen)new MutationObserver(schedule).observe(screen,{childList:true,subtree:true});
    window.addEventListener('hashchange',schedule);
    load(); schedule();
  });
})();
