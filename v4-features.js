'use strict';
(() => {
 const q=s=>document.querySelector(s), esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const rewards=[['gozluk','🕶️','Renkli Gözlük',3],['sapka','🎩','Sihirli Şapka',5],['cicek','🌸','Çiçek Tacı',4],['uzay','🚀','Uzay Arka Planı',7],['orman','🌳','Orman Arka Planı',7],['deniz','🌊','Deniz Arka Planı',7]];
 const weekdays=['Pazartesi','Salı','Çarşamba','Perşembe','Cuma','Cumartesi','Pazar'];
 const defaults=()=>({sac:'🟤',tisort:'💜',aksesuar:'✨',arka_plan:'',gece_okuma:0});
 let data=null,loading=null,draft=null,active='',showStatus='';
 const route=()=>location.hash.replace(/^#\/?/,'');
 const renderMenu=()=>{
   const menu=q('.profile-menu');if(!menu)return;
   const entries=[['🎨','Avatar Oluşturucu','Saç, kıyafet ve aksesuarını seç','#/v4/avatar'],['🎁','Yıldız Dükkânı','Başarılarından kazandığın yıldızları kullan','#/v4/magaza'],['📅','Haftalık Planım','Kendi çalışma hedeflerini belirle','#/v4/plan'],['🏅','Başarı Sertifikam','Tamamladığın dersleri kutla','#/v4/sertifika']];
   const before=menu.querySelector('[data-app-update-link],[data-logout-link]');
   entries.forEach(([emoji,title,desc,href])=>{
     if(menu.querySelector('[href="'+href+'"]'))return;
     const a=document.createElement('a');a.href=href;
     a.innerHTML='<span class="menu-icon lavender">'+emoji+'</span><div><strong>'+title+'</strong><small>'+desc+'</small></div><svg aria-hidden="true"><use href="#arrow"/></svg>';
     before?menu.insertBefore(a,before):menu.appendChild(a);
   });
 };
 const load=async(force=false)=>{
   if(data&&!force)return data;
   if(loading)return loading;
   loading=fetch('api/v4-features.php',{credentials:'same-origin',cache:'no-store',headers:{Accept:'application/json'}})
     .then(async r=>{const x=await r.json();if(!r.ok||!x.ok)throw Error(x.message||'Bağlantı kurulamadı.');data=x;draft={...defaults(),...data.preferences};return data;})
     .finally(()=>{loading=null;});
   return loading;
 };
 const post=async(body)=>{
   if(!data)await load();
   const response=await fetch('api/v4-features.php',{method:'POST',credentials:'same-origin',headers:{'Content-Type':'application/json','Accept':'application/json','X-CSRF-Token':data.csrf},body:JSON.stringify(body)});
   const result=await response.json();
   if(!response.ok||!result.ok)throw Error(result.message||'Kaydedilemedi.');
   data=result;draft={...defaults(),...data.preferences};return result;
 };
 const flash=(text,bad=false)=>{showStatus='<p class="v4-status'+(bad?' error':'')+'">'+esc(text)+'</p>';const el=q('#v4-feedback');if(el)el.innerHTML=showStatus;};
 const topbar=(title)=>{
   const bar=q('#app-topbar');if(!bar)return;
   bar.innerHTML='<a href="#/profil" class="icon-button" aria-label="Profile dön"><svg><use href="#back"/></svg></a><span class="topbar-title">'+esc(title)+'</span><a class="mini-avatar" href="#/profil">🌞</a>';
   document.querySelectorAll('[data-tab]').forEach(a=>a.classList.toggle('active',a.dataset.tab==='profil'));
 };
 const shell=(emoji,title,desc,html)=>{
   const screen=q('#screen');if(!screen)return;
   screen.dataset.v4Screen=active;
   screen.innerHTML='<div class="screen-content v4-screen"><section class="v4-hero"><span class="v4-emoji">'+emoji+'</span><h1>'+title+'</h1><p>'+desc+'</p></section><div id="v4-feedback">'+showStatus+'</div>'+html+
     '<a class="v4-navlink" href="#/profil">← Profilime dön</a></div>';
   topbar(title);
 };
 const avatarSVG=()=>{
   const hair={'🟤':'#714329','🟡':'#e8ba45','⚫':'#30303d','🟠':'#bc582d'}[draft.sac]||'#714329';
   const shirt={'💜':'#8754dd','💙':'#368ad7','💚':'#3da785','❤️':'#e4677d'}[draft.tisort]||'#8754dd';
   return '<svg viewBox="0 0 120 120" aria-hidden="true"><circle cx="60" cy="60" r="59" fill="#fff0d8"/><path d="M15 120 Q15 82 60 82 Q105 82 105 120" fill="'+shirt+'"/><ellipse cx="60" cy="52" rx="34" ry="38" fill="#f5c298"/><path d="M25 54 Q11 8 61 10 Q109 10 95 59 L86 35 Q60 48 39 30 Z" fill="'+hair+'"/><circle cx="47" cy="55" r="3"/><circle cx="74" cy="55" r="3"/><path d="M48 71 Q60 81 73 71" fill="none" stroke="#9d493c" stroke-width="3" stroke-linecap="round"/><text x="60" y="'+(draft.aksesuar==='🕶️'?65:30)+'" text-anchor="middle" font-size="38">'+(draft.aksesuar==='✨'?'':draft.aksesuar)+'</text></svg>';
 };
 const buttons=(kind,items,accessory=false)=>'<div class="v4-grid">'+items.map(item=>{
   const val=item[0],active=draft[kind]===val;
   const needed={'🌸':'cicek','🎩':'sapka','🕶️':'gozluk'}[val];
   const disabled=accessory&&needed&&!data.purchased.includes(needed);
   return '<button class="v4-tile'+(active?' active':'')+'" type="button" data-v4-part="'+kind+'" data-value="'+esc(val)+'" '+(disabled?'disabled':'')+'><span class="v4-emoji">'+esc(val)+'</span><strong>'+esc(item[1])+'</strong>'+(disabled?'<small>Dükkândan açılır</small>':'')+'</button>';
 }).join('')+'</div>';
 const avatar=()=>{
   shell('🎨','Avatar Oluşturucu','V4 tasarımından saç, tişört ve aksesuar seçimleri.',
     '<div class="v4-avatar">'+avatarSVG()+'</div><h2 class="v4-subheading">Saç rengi</h2>'+
     buttons('sac',[['🟤','Kahverengi'],['🟡','Sarı'],['⚫','Siyah'],['🟠','Kızıl']])+
     '<h2 class="v4-subheading">Tişört</h2>'+buttons('tisort',[['💜','Mor'],['💙','Mavi'],['💚','Yeşil'],['❤️','Kırmızı']])+
     '<h2 class="v4-subheading">Aksesuar</h2>'+buttons('aksesuar',[['✨','Yok'],['🌸','Çiçek'],['🎩','Şapka'],['🕶️','Gözlük']],true)+
     '<div class="v4-panel"><label><input type="checkbox" id="v4-night" '+(draft.gece_okuma?'checked':'')+'> Gece okuma tercihi</label></div>'+
     '<button class="button primary full" id="v4-avatar-save">Avatarımı Kaydet</button>');
   q('#screen').querySelectorAll('[data-v4-part]').forEach(b=>b.addEventListener('click',()=>{
     draft[b.dataset.v4Part]=b.dataset.value;avatar();
   }));
   q('#v4-avatar-save').addEventListener('click',async()=>{
     const button=q('#v4-avatar-save');button.disabled=true;
     try{draft.gece_okuma=q('#v4-night').checked?1:0;await post({action:'preferences',...draft});flash('Avatarın MySQL veritabanına kaydedildi.');}
     catch(e){button.disabled=false;flash(e.message,true);}
   });
 };
 const shop=()=>{
   shell('🎁','Yıldız Dükkânı','Kazandığın yıldızları seçtiğin ödüller için kullan.',
     '<div class="v4-panel"><strong>⭐ Kullanılabilir yıldız: '+data.available+'</strong><p class="v4-note">Toplam '+data.earned+' · Harcanan '+data.spent+'</p></div><div class="v4-grid">'+
     rewards.map(([id,emoji,name,cost])=>'<button type="button" class="v4-tile" data-v4-buy="'+id+'" '+(!data.purchased.includes(id)&&data.available<cost?'disabled':'')+'><span class="v4-emoji">'+emoji+'</span><strong>'+name+'</strong><small>'+(data.purchased.includes(id)?'✓ Açıldı':'⭐ '+cost)+'</small></button>').join('')+'</div>'+
     '<h2 class="v4-subheading">Satın alınan arka planlar</h2><div class="v4-grid">'+
     [['','Varsayılan','🌞'],['uzay','Uzay','🚀'],['orman','Orman','🌳'],['deniz','Deniz','🌊']].filter(([id])=>!id||data.purchased.includes(id)).map(([id,title,emoji])=>'<button class="v4-tile'+(draft.arka_plan===id?' active':'')+'" data-v4-bg="'+id+'" type="button"><span class="v4-emoji">'+emoji+'</span><strong>'+title+'</strong></button>').join('')+'</div>');
   q('#screen').querySelectorAll('[data-v4-buy]').forEach(b=>b.addEventListener('click',async()=>{
     if(data.purchased.includes(b.dataset.v4Buy)){flash('Bu ödülü zaten kazandın.');return;}
     b.disabled=true;
     try{await post({action:'buy',reward:b.dataset.v4Buy});shop();flash('Yeni ödülün MySQL hesabına kaydedildi. 🎉');}
     catch(e){b.disabled=false;flash(e.message,true);}
   }));
   q('#screen').querySelectorAll('[data-v4-bg]').forEach(b=>b.addEventListener('click',async()=>{
     try{draft.arka_plan=b.dataset.v4Bg;await post({action:'preferences',...draft});shop();flash('Arka plan tercihin kaydedildi.');}catch(e){flash(e.message,true);}
   }));
 };
 const plan=()=>{
   const allCourses=Array.isArray(window.LESSONS)?window.LESSONS:[];
   shell('📅','Haftalık Planım','Her güne bir küçük hedef: planın veritabanına kaydedilir.',
     '<div class="v4-stack">'+weekdays.map((d,i)=>{
       const p=data.plan.find(x=>Number(x.gun)===i+1);
       const course=allCourses.find(c=>c.id===p?.ders_kodu);
       return '<div class="v4-day"><span class="v4-pill">'+d+'</span><div><strong>'+esc(p?.hedef||'Hedef belirlenmedi')+'</strong><p class="v4-note">'+esc(course?.name||'')+'</p></div>'+(p&&!Number(p.tamamlandi)?'<button class="button soft v4-icon-b" data-v4-done="'+(i+1)+'">✓</button>':p?'✅':'')+'</div>';
     }).join('')+'</div><form class="v4-panel v4-plan-form" id="v4-plan-form"><h2>Günlük hedef ekle</h2>'+
     '<label for="v4-day">Gün</label><select required class="v4-field" id="v4-day">'+weekdays.map((w,i)=>'<option value="'+(i+1)+'">'+w+'</option>').join('')+'</select>'+
     '<label for="v4-lesson">Ders</label><select required class="v4-field" id="v4-lesson">'+allCourses.map(c=>'<option value="'+esc(c.id)+'">'+esc(c.name)+'</option>').join('')+'</select>'+
     '<label for="v4-goal">Hedefim</label><input class="v4-field" id="v4-goal" required maxlength="160" placeholder="Örn. İki konu bitireceğim">'+
     '<button type="submit" class="button primary full">Planı Kaydet</button></form>');
   q('#screen').querySelectorAll('[data-v4-done]').forEach(b=>b.addEventListener('click',async()=>{
     b.disabled=true;try{await post({action:'plan_done',day:Number(b.dataset.v4Done)});plan();flash('Hedef tamamlandı olarak işaretlendi.');}catch(e){b.disabled=false;flash(e.message,true);}
   }));
   q('#v4-plan-form').addEventListener('submit',async(e)=>{
     e.preventDefault();const b=q('#v4-plan-form button');b.disabled=true;
     try{await post({action:'plan',day:Number(q('#v4-day').value),lesson:q('#v4-lesson').value,goal:q('#v4-goal').value.trim()});plan();flash('Haftalık planın kaydedildi.');}
     catch(err){b.disabled=false;flash(err.message,true);}
   });
 };
 const cert=()=>{
   const ready=data.completed_courses.length>0;
   const text=ready?data.completed_courses.join(', ')+' dersini başarıyla tamamladı.':'Bir dersin bütün konularını tamamladığında sertifikan açılacak.';
   shell('🏅','Başarı Sertifikam','V4 sertifikan canlı ders ilerlemesinden oluşturulur.',
     '<div class="v4-certificate"><span>🌞 İLKADIM</span><small>BAŞARI SERTİFİKASI</small><h1>'+esc(data.student_name||'Küçük Kaşif')+'</h1><p>'+esc(text)+'</p><span class="v4-emoji">🏆</span><p>'+new Date().toLocaleDateString('tr-TR')+'</p></div>'+
     (ready?'<button class="button primary full v4-no-print" id="v4-print">Yazdır / PDF olarak kaydet</button>':'<p class="v4-note">Sertifikan derslerini tamamladıkça açılır.</p>'));
   q('#v4-print')?.addEventListener('click',()=>window.print());
 };
 const run=()=>{
   renderMenu();
   const r=route();if(!r.startsWith('v4/')){active='';return;}
   if(active===r&&q('#screen')?.dataset.v4Screen===r)return;
   active=r;showStatus='';
   const view=r.split('/')[1];
   if(!['avatar','magaza','plan','sertifika'].includes(view))return;
   if(!data){const el=q('#screen');if(el){el.dataset.v4Screen=r;el.innerHTML='<div class="screen-content"><p>V4 verileri yükleniyor…</p></div>';}load().then(()=>{if(active===r){q('#screen').dataset.v4Screen='';run();}}).catch(err=>{if(active===r)shell('⚠️','Bağlantı Hatası','V4 verileri şu anda alınamadı.','<p>'+esc(err.message)+'</p><button class="button primary full" id="v4-retry">Tekrar dene</button>');q('#v4-retry')?.addEventListener('click',()=>{active='';run();});});return;}
   if(view==='avatar')avatar();if(view==='magaza')shop();if(view==='plan')plan();if(view==='sertifika')cert();
 };
 const screen=q('#screen');let timer=null;
 if(screen)new MutationObserver(()=>{if(timer)return;timer=setTimeout(()=>{timer=null;run();},0);}).observe(screen,{childList:true,subtree:true});
 window.addEventListener('hashchange',()=>setTimeout(run,0));
 document.addEventListener('DOMContentLoaded',()=>setTimeout(run,0));setTimeout(run,0);
})();
