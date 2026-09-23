'use strict';
(async()=>{
 const store=window.IlkAdimPwaStore,el=document.getElementById('offline-screen');
 const status=document.getElementById('connection'),studentId=Number(localStorage.getItem('ilkadim-pwa34-active-student')||0);
 const e=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 let pack=null,view='home',subject=null,lessonIndex=null,game=null,round=0,busy=false,message='';
 const connection=()=>{status.classList.toggle('offline',!navigator.onLine);status.textContent=navigator.onLine?'🟢 İnternet bağlantısı var · Kayıtlar eşitlenebilir':'🟡 İnternetsiz mod · İlerlemen bu cihazda saklanır';};
 window.addEventListener('online',()=>{connection();sync();});window.addEventListener('offline',connection);connection();
 const html=(icon,title,sub,body)=>'<section class="hero"><span class="tile-emoji">'+icon+'</span><h2>'+title+'</h2><p>'+sub+'</p></section>'+(message?'<p class="feedback">'+e(message)+'</p>':'')+body;
 const fields=()=>({steps:[],games:[]});
 const currentProgress=()=>pack.progress||fields();
 const uniq=arr=>[...new Set(arr)];
 const saveEvent=async(state,games=[])=>{
   if(!pack||!studentId)return;
   const id=store.uuid(),event={op_id:id,student_id:studentId,studentId,created:Date.now(),state,games};
   const progress=store.mergeProgress(currentProgress(),{steps:state.steps||[],games:[...(state.games||[]),...games]});
   pack.progress=progress;
   await store.saveOfflineEvent(pack,event);
   if('serviceWorker' in navigator){
     try{const reg=await navigator.serviceWorker.ready;await reg.sync?.register('ilkadim-pwa34-sync');}catch{}
   }
   message='İlerlemen cihaza kaydedildi. İnternet gelince MySQL ile eşitlenecek.';
 };
 const pending=()=>store.getPending(studentId);
 const sync=async()=>{
  if(!studentId||busy||!navigator.onLine)return;
  busy=true;let sent=0;
  try{
    const authResponse=await fetch('./api/offline-sync.php',{credentials:'same-origin',cache:'no-store'});
    if(!authResponse.ok)throw Error('Oturum kapalı. Eşitlemek için tekrar giriş yap.');
    const auth=await authResponse.json();
    if(!auth.ok||Number(auth.student_id)!==studentId)throw Error('Farklı bir öğrenci giriş yapmış. Bu kayıtlar gönderilmedi.');
    for(const op of await pending()){
      const r=await fetch('./api/offline-sync.php',{method:'POST',credentials:'same-origin',cache:'no-store',headers:{'Content-Type':'application/json','X-CSRF-Token':auth.csrf},body:JSON.stringify(op)});
      if(!r.ok)throw Error('Sunucu eşitlemeyi tamamlayamadı. Kayıtlar saklanıyor.');
      const result=await r.json();
      if(!result.ok||Number(result.student_id)!==studentId)throw Error('Hesap doğrulaması başarısız.');
      await store.removePending(op.op_id);
      pack.progress=store.mergeProgress(currentProgress(),store.progressFrom(result.state));
      await store.savePack(pack);sent++;
    }
    message=sent?sent+' kayıt başarıyla MySQL ile eşitlendi.':'Eşitlenecek yeni kayıt yok.';
  }catch(err){message=err.message||'Eşitleme için internet gerekli.';}
  finally{busy=false;if(view==='sync')await render();}
 };
 const today=()=>new Date().toISOString().slice(0,10);
 const lesson=()=>{
   const course=pack.lessons.find(l=>l.id===subject);
   if(!course){view='lessons';return render();}
   const mod=course.modules[lessonIndex];if(!mod){lessonIndex=null;return render();}
   const key=course.id+'-'+lessonIndex,done=currentProgress().steps.includes(key);
   view='lesson';
   const choices=(mod.options||[]).map((c,i)=>'<button class="choice" data-answer="'+i+'">'+e(c)+'</button>').join('');
   el.innerHTML=html(e(mod.emoji||'📖'),e(mod.title),e(course.name)+' · '+e(mod.subtitle||''),
     '<div class="reading">'+e(mod.reading||'')+'</div><button type="button" class="secondary full" id="read-aloud">🔊 Metni seslendir</button>'+
     (mod.question?'<p class="question">'+e(mod.question)+'</p>'+choices:'<button type="button" class="primary full" id="mark-read">Konuyu Tamamla ✓</button>')+
     '<p id="feedback" class="intro">'+(done?'✓ Bu konu daha önce tamamlandı.':'Cevabını seçerek devam edebilirsin.')+'</p><button class="secondary full" data-nav="subject">← Konulara dön</button>');
   document.getElementById('read-aloud').addEventListener('click',()=>{
     if(!('speechSynthesis' in window))return;
     speechSynthesis.cancel();const utter=new SpeechSynthesisUtterance(mod.reading||'');utter.lang='tr-TR';utter.rate=.86;speechSynthesis.speak(utter);
   });
   document.getElementById('mark-read')?.addEventListener('click',async()=>{
     await completeLesson(course,mod,key,null,true);
   });
   el.querySelectorAll('[data-answer]').forEach(button=>button.addEventListener('click',async()=>{
     if(el.querySelector('.choice.correct'))return;
     const chosen=Number(button.dataset.answer),correct=chosen===Number(mod.answer);
     button.classList.add(correct?'correct':'wrong');document.getElementById('feedback').textContent=correct?mod.explanation||'Harikasın!':'Bir daha deneyebilirsin.';
     const attempt={lesson:course.id,index:lessonIndex,selected:chosen,correct,ms:0,at:Date.now()};
     await completeLesson(course,mod,key,attempt,correct);
   }));
 };
 const completeLesson=async(course,mod,key,attempt,correct)=>{
   const at=Date.now(),already=currentProgress().steps.includes(key);
   const state={steps:correct?[key]:[],attempts:attempt?[attempt]:[],history:correct&&!already?[{type:'step',id:key,title:course.name+' · '+mod.title,at}]:[],days:correct?[today()]:[]};
   if(!attempt&&!correct)return;
   try{await saveEvent(state);if(correct){document.getElementById('feedback').textContent='✓ Kaydedildi! Diğer konulara geçebilirsin.';el.querySelectorAll('[data-answer]').forEach(b=>b.disabled=true);}}catch{message='Cihaz kaydı yapılamadı; boş alanı kontrol et.';await render();}
 };
 const render=async()=>{
  if(!pack)return;
  const count=(await pending()).length;
  if(view==='home'){
   el.innerHTML=html('🌞','Öğrenmeye kaldığın yerden devam et','Ders ve oyunların internet olmadan da hazır.',
    '<div class="grid"><button class="tile" data-nav="lessons"><span class="tile-emoji">📚</span><strong>'+pack.lessons.length+' Ders</strong><small>'+currentProgress().steps.length+' konu tamamlandı</small></button>'+
    '<button class="tile" data-nav="games"><span class="tile-emoji">🧩</span><strong>'+pack.games.filter(g=>g.questions?.length).length+' Etkinlik</strong><small>'+currentProgress().games.length+' oyun tamamlandı</small></button></div>'+
    '<section class="notice"><strong>☁️ Bekleyen kayıt: '+count+'</strong><p class="intro">Bağlantı geldiğinde otomatik gönderilir. Bu cihazdaki diğer öğrencilerle karışmaz.</p></section>');
  }else if(view==='lessons'){
   el.innerHTML=html('📚','Derslerim','İndirdiğin derslerden birini seç.',
    '<div class="stack">'+pack.lessons.map(l=>'<button class="row" data-subject="'+e(l.id)+'"><span>'+e(l.emoji||'📖')+'</span><div><strong>'+e(l.name)+'</strong><small>'+l.modules.filter((m,i)=>currentProgress().steps.includes(l.id+'-'+i)).length+'/'+l.modules.length+' konu</small></div>→</button>').join('')+'</div>');
  }else if(view==='subject'){
   const l=pack.lessons.find(x=>x.id===subject);
   if(!l){view='lessons';return render();}
   el.innerHTML=html(e(l.emoji||'📚'),e(l.name),e(l.description||''),'<div class="stack">'+
     l.modules.map((m,i)=>'<button class="row" data-lesson="'+i+'"><span>'+e(m.emoji||'📖')+'</span><div><strong>'+e(m.title)+'</strong><small>'+e(m.subtitle||'')+'</small></div>'+(currentProgress().steps.includes(l.id+'-'+i)?'✅':'→')+'</button>').join('')+'</div><button class="secondary full" data-nav="lessons">← Derslere dön</button>');
  }else if(view==='lesson'){return lesson();}
  else if(view==='games'){
   const playable=pack.games.filter(g=>Array.isArray(g.questions)&&g.questions.length);
   el.innerHTML=html('🧩','Oyunlarım','Çevrimdışı oynanabilen etkinlikler',
    '<div class="stack">'+playable.map(g=>'<button class="row" data-game="'+e(g.id)+'"><span>'+e(g.emoji||'🧩')+'</span><div><strong>'+e(g.name)+'</strong><small>'+e(g.description||'')+'</small></div>'+(currentProgress().games.includes(g.id)?'✅':'→')+'</button>').join('')+'</div>');
  }else if(view==='game'){
   const g=pack.games.find(x=>x.id===game),qs=g?.questions||[],item=qs[round];
   if(!item){view='games';return render();}
   el.innerHTML=html(e(g.emoji||'🧩'),e(g.name),'Soru '+(round+1)+' / '+qs.length,
     '<div class="reading">'+e(item.visual||'🧩')+'</div><p class="question">'+e(item.question||'')+'</p>'+
     (item.options||[]).map((v,i)=>'<button class="choice" data-game-answer="'+i+'">'+e(v)+'</button>').join('')+
     '<p class="intro" id="game-feedback">Cevabını seç.</p><div id="game-next"></div><button class="secondary full" data-nav="games">← Oyunlara dön</button>');
   el.querySelectorAll('[data-game-answer]').forEach(b=>b.addEventListener('click',async()=>{
     if(el.querySelector('.choice.correct'))return;
     const correct=Number(b.dataset.gameAnswer)===Number(item.answer);
     b.classList.add(correct?'correct':'wrong');
     document.getElementById('game-feedback').textContent=correct?item.explanation||'Harika!':'Yeniden dene.';
     if(!correct)return;
     el.querySelectorAll('[data-game-answer]').forEach(x=>x.disabled=true);
     if(round===qs.length-1){
       const already=currentProgress().games.includes(g.id);
       try{await saveEvent({games:[g.id],history:already?[]:[{type:'game',id:g.id,title:g.name,at:Date.now()}],days:[today()]},[g.id]);}
       catch{message='Oyun sonucu cihazda kaydedilemedi.';return render();}
       document.getElementById('game-next').innerHTML='<button class="primary full" data-nav="games">✓ Oyun tamamlandı! Geri dön</button>';
     }else document.getElementById('game-next').innerHTML='<button class="primary full" id="next-question">Sonraki soru →</button>';
     document.getElementById('next-question')?.addEventListener('click',()=>{round++;render();});
   }));
  }else if(view==='sync'){
   el.innerHTML=html('☁️','İlerlememi Eşitle','MySQL öğrenci hesabına güvenli gönderim.',
     '<section class="notice"><strong>Bekleyen kayıt: '+count+'</strong><p class="intro">Sadece bu öğrenci hesabına ait kayıtlar yüklenir.</p></section>'+
     '<button class="primary full" id="sync-button" '+(!navigator.onLine||busy?'disabled':'')+'>Şimdi Eşitle</button>'+
     '<a href="./index.php#/profil" class="secondary full" style="text-align:center;text-decoration:none">Ana uygulamayı aç</a>');
   document.getElementById('sync-button')?.addEventListener('click',sync);
  }
 };
 el.addEventListener('click',e=>{
  const nav=e.target.closest('[data-nav]');
  if(nav){view=nav.dataset.nav;message='';render();return;}
  const sub=e.target.closest('[data-subject]');
  if(sub){subject=sub.dataset.subject;view='subject';message='';render();return;}
  const les=e.target.closest('[data-lesson]');
  if(les){lessonIndex=Number(les.dataset.lesson);view='lesson';message='';render();return;}
  const gm=e.target.closest('[data-game]');
  if(gm){game=gm.dataset.game;round=0;view='game';message='';render();}
 });
 document.querySelectorAll('[data-nav]').forEach(b=>b.addEventListener('click',()=>{view=b.dataset.nav;message='';render();}));
 if(!studentId){
   el.innerHTML=html('🔒','Giriş gerekli','Bu cihazda çevrimdışı kullanım için hazırlanmış öğrenci hesabı yok.',
     '<p>İnternete bağlanıp kendi öğrenci hesabına giriş yap ve Profil → Uygulamayı Kur menüsünden dersleri indir.</p><a href="./login.php" class="primary full" style="display:block;text-align:center">Giriş Yap</a>');
   return;
 }
 try{pack=await store.getPack(studentId);}
 catch{pack=null;}
 if(!pack||!Array.isArray(pack.lessons)||!pack.lessons.length){
   el.innerHTML=html('📥','Önce dersleri indir','İlk çevrimdışı kullanım için internet bağlantısı gerekir.',
     '<p>Giriş yapıp Profil → Uygulamayı Kur bölümünden ders ve etkinliklerini indir.</p><a href="./index.php#/profil" class="primary full" style="display:block;text-align:center">Ana uygulamaya git</a>');
   return;
 }
 await render();if(navigator.onLine)sync();
})();
