'use strict';
(() => {
 const sid=Number(window.ILKADIM_CURRENT_STUDENT_ID||0);
 if(!Number.isInteger(sid)||sid<=0)return;
 const store=window.IlkAdimPwaStore;
 const q=s=>document.querySelector(s);
 const e=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 let installPrompt=null,installed=window.matchMedia?.('(display-mode: standalone)').matches||false;
 let registration=null,ready=false,pack=null,count=0,syncing=false,message='',syncTime='';
 let panelActive=false;
 try{localStorage.setItem('ilkadim-pwa34-active-student',String(sid));}catch{}
 const reg=async()=>{
  if(!('serviceWorker' in navigator)||!(location.protocol==='https:'||location.hostname==='localhost'))return;
  try{registration=await navigator.serviceWorker.register('service-worker.js',{updateViaCache:'none'});await registration.update();}catch(err){console.warn('İlkAdım PWA:',err);}
 };
 const refreshed=async()=>{
  if(!store)return;
  try{pack=await store.getPack(sid);count=(await store.getPending(sid)).length;}
  catch{pack=null;count=0;}
 };
 const menu=()=>{
  const el=q('.profile-menu');if(!el)return;
  if(el.querySelector('[data-pwa34-menu]'))return;
  const link=document.createElement('a');link.href='#/pwa34';link.dataset.pwa34Menu='1';
  link.innerHTML='<span class="menu-icon blue">📲</span><div><strong>Uygulamayı Kur</strong><small>Çevrimdışı dersler ve otomatik eşitleme</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
  const anchor=el.querySelector('[data-app-update-link],[data-logout-link]');
  anchor?el.insertBefore(link,anchor):el.appendChild(link);
 };
 const render=async()=>{
  menu();
  const route=location.hash.replace(/^#\/?/,'');
  if(route!=='pwa34'){panelActive=false;return;}
  const screen=q('#screen');if(!screen)return;
  if(panelActive&&screen.dataset.pwa34Screen==='pwa34')return;
  panelActive=true;screen.dataset.pwa34Screen='pwa34';
  await refreshed();
  if(location.hash!=='#/pwa34')return;
  const online=navigator.onLine;
  const lines=[
   '<section class="v4-hero"><span class="v4-emoji">📲</span><h1>İlkAdım Cebimde</h1><p>Uygulamayı ana ekranına ekle. Derslerini ve oyunlarını indir, internetsiz devam et.</p></section>',
   '<div id="pwa34-feedback">'+(message?'<div class="v4-status">'+e(message)+'</div>':'')+'</div>',
   '<section class="v4-panel"><h2>📡 Bağlantı</h2><p>'+(online?'🟢 Çevrimiçi':'🟡 Çevrimdışı')+'</p><p class="v4-note">İçerikler: '+(pack?pack.lessons.length+' ders · '+pack.games.filter(g=>Array.isArray(g.questions)&&g.questions.length).length+' etkinlik':'Henüz indirilmedi')+'</p><p class="v4-note">Bekleyen kayıt: '+count+(syncTime?' · Son eşitleme: '+e(syncTime):'')+'</p></section>',
   '<section class="v4-panel"><h2>📥 Çevrimdışı içerikler</h2><p class="v4-note">İlk kurulum için internete bağlı olmalısın. Tüm aktif dersler ve sorulu etkinlikler bu cihaza indirilir.</p><button class="button primary full" id="pwa34-download" '+(!online||!store?'disabled':'')+'>'+(pack?'İçerikleri Güncelle':'Dersleri ve Oyunları İndir')+'</button><a class="button soft full" href="offline-v4.html" style="text-align:center;text-decoration:none">Çevrimdışı Öğrenme Ekranını Aç</a></section>',
   '<section class="v4-panel"><h2>☁️ İlerlemeyi eşitle</h2><p class="v4-note">Cevaplar ve tamamlanan oyunlar yalnızca giriş yaptığın öğrenci hesabına yüklenir.</p><button class="button primary full" id="pwa34-sync" '+(!online||!store||syncing?'disabled':'')+'>Şimdi Eşitle</button></section>',
   '<section class="v4-panel"><h2>📱 Telefona kur</h2><button class="button primary full" id="pwa34-install" '+(installed||!installPrompt?'disabled':'')+'>'+(installed?'✓ Kurulu':installPrompt?'Uygulamayı Kur':'Tarayıcı Menüsünden Kur')+'</button><p class="v4-note">iPhone: Safari → Paylaş → Ana Ekrana Ekle. Android: Chrome → Menü → Uygulamayı yükle veya Ana ekrana ekle.</p></section>',
   '<a class="v4-navlink" href="#/profil">← Profilime dön</a>'
  ];
  screen.innerHTML='<div class="screen-content v4-screen">'+lines.join('')+'</div>';
  const bar=q('#app-topbar');
  if(bar)bar.innerHTML='<a href="#/profil" class="icon-button" aria-label="Profile dön"><svg><use href="#back"/></svg></a><span class="topbar-title">Uygulamayı Kur</span><a class="mini-avatar" href="#/profil">🌞</a>';
  q('#pwa34-download')?.addEventListener('click',download);
  q('#pwa34-sync')?.addEventListener('click',()=>syncNow(true));
  q('#pwa34-install')?.addEventListener('click',install);
  document.querySelectorAll('[data-tab]').forEach(a=>a.classList.toggle('active',a.dataset.tab==='profil'));
 };
 const setMsg=text=>{message=text;const el=q('#pwa34-feedback');if(el)el.textContent=text;};
 const download=async()=>{
  if(!store||!navigator.onLine)return setMsg('İçerikleri indirmek için internet gereklidir.');
  const button=q('#pwa34-download');if(button)button.disabled=true;
  setMsg('Dersler ve etkinlikler indiriliyor…');
  try{
   const authR=await fetch('api/offline-sync.php',{credentials:'same-origin',cache:'no-store'});
   const auth=await authR.json();
   if(!authR.ok||Number(auth.student_id)!==sid)throw Error('Öğrenci hesabın doğrulanamadı.');
   const lessons=window.LESSONS;
   if(!Array.isArray(lessons)||!lessons.length)throw Error('Dersler henüz yüklenmemiş.');
   const gameR=await fetch('api/activities.php',{credentials:'same-origin',cache:'no-store'});
   if(!gameR.ok)throw Error('Etkinlikler sunucudan alınamadı.');
   const games=await gameR.json();
   if(!games.ok||!Array.isArray(games.games))throw Error('Etkinlik paketi geçersiz.');
   const previous=await store.getPack(sid);
   const progress=store.mergeProgress(previous?.progress,store.progressFrom(window.ILKADIM_SERVER_STATE));
   const next={studentId:sid,lessons,games:games.games,progress,downloadedAt:Date.now()};
   await store.savePack(next);pack=next;
   message='Derslerin ve sorulu etkinliklerin indirildi. Artık internetsiz açabilirsin.';
  }catch(err){message=err.message||'İndirme başarısız oldu.';}
  panelActive=false;render();
 };
 const syncNow=async(manual=false)=>{
  if(syncing||!store||!navigator.onLine)return;
  syncing=true;let synced=0;
  try{
   const pending=await store.getPending(sid);
   if(!pending.length){if(manual)message='Bekleyen çevrimdışı kayıt yok.';return;}
   setMsg(pending.length+' çevrimdışı kayıt sunucuya aktarılıyor…');
   const a=await fetch('api/offline-sync.php',{credentials:'same-origin',cache:'no-store'});
   if(!a.ok)throw Error('Oturumun kapalı; eşitlemek için giriş yap.');
   const auth=await a.json();
   if(!auth.ok||Number(auth.student_id)!==sid)throw Error('Farklı öğrenci hesabıyla eşitleme yapılamaz.');
   for(const op of pending){
    const response=await fetch('api/offline-sync.php',{
     method:'POST',credentials:'same-origin',cache:'no-store',
     headers:{'Content-Type':'application/json','X-CSRF-Token':auth.csrf},
     body:JSON.stringify(op)
    });
    if(!response.ok)throw Error('Eşitleme yarıda kaldı. Kayıtlar cihazda tutuluyor.');
    const payload=await response.json();
    if(!payload.ok||Number(payload.student_id)!==sid)throw Error('Öğrenci doğrulaması başarısız.');
    await store.removePending(op.op_id);
    const current=await store.getPack(sid);
    if(current){current.progress=store.mergeProgress(current.progress,store.progressFrom(payload.state));await store.savePack(current);}
    synced++;
   }
   if(synced){syncTime=new Date().toLocaleTimeString('tr-TR',{hour:'2-digit',minute:'2-digit'});message=synced+' kayıt MySQL ile eşitlendi. Güncel ilerlemeyi görmek için sayfayı yenile.';}
  }catch(err){message=err.message||'Eşitleme yapılamadı.';}
  finally{
   syncing=false;
   if(location.hash==='#/pwa34'){panelActive=false;render();}
  }
 };
 const install=async()=>{
  if(!installPrompt)return setMsg('Tarayıcının menüsünden Ana Ekrana Ekle seçeneğini kullan.');
  const prompt=installPrompt;installPrompt=null;
  try{await prompt.prompt();const result=await prompt.userChoice;if(result.outcome==='accepted')setMsg('Kurulum isteği kabul edildi.');}
  catch{setMsg('Kurulum için tarayıcı menüsünü kullanabilirsin.');}
  if(location.hash==='#/pwa34'){panelActive=false;render();}
 };
 window.addEventListener('beforeinstallprompt',event=>{event.preventDefault();installPrompt=event;if(location.hash==='#/pwa34'){panelActive=false;render();}});
 window.addEventListener('appinstalled',()=>{installed=true;if(location.hash==='#/pwa34'){panelActive=false;render();}});
 window.addEventListener('online',()=>{syncNow();if(location.hash==='#/pwa34'){panelActive=false;render();}});
 window.addEventListener('offline',()=>{if(location.hash==='#/pwa34'){panelActive=false;render();}});
 window.addEventListener('hashchange',()=>setTimeout(render,0));
 document.addEventListener('click',async evt=>{
  const link=evt.target.closest?.('a[href="logout.php"]');
  if(!link||!store)return;
  evt.preventDefault();evt.stopImmediatePropagation();
  try{
   const pending=await store.getPending(sid);
   if(pending.length&&!confirm(pending.length+' çevrimdışı kayıt henüz gönderilmedi. Çıkış yapılırsa bu cihazdaki bekleyen kayıtlar silinir. Yine de çıkış yapılsın mı?'))return;
  }catch{}
  location.href='logout.php';
 },true);
 let scheduled=null;const screen=q('#screen');
 if(screen)new MutationObserver(()=>{
  if(scheduled)return;scheduled=setTimeout(()=>{scheduled=null;render();},0);
 }).observe(screen,{childList:true,subtree:true});
 reg();setTimeout(()=>{ready=true;render();syncNow();},500);
})();
