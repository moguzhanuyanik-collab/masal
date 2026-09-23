(()=>{'use strict';
const root=document.querySelector('[data-km-root]');if(!root)return;
const csrf=document.querySelector('meta[name="csrf-token"]')?.content||'';
const content=document.getElementById('km-content'),title=document.getElementById('km-title'),eyebrow=document.getElementById('km-eyebrow');
const addBtn=document.getElementById('km-add'),filter=document.getElementById('km-filter'),search=document.getElementById('km-search');
const dialog=document.getElementById('km-dialog'),form=document.getElementById('km-form'),dialogTitle=document.getElementById('km-dialog-title');
const toast=document.getElementById('km-toast');
let state={section:root.dataset.section||'kurumlar',rows:[],institutions:[],filterId:Number(root.dataset.kurum||0)};
const sections={kurumlar:['Kurumlar','🏫'],yoneticiler:['Yöneticiler','🧑‍💼'],ogretmenler:['Öğretmenler','👩‍🏫'],veliler:['Veliler','👪'],ogrenciler:['Öğrenciler','🎒']};
const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const flash=(m,bad=false)=>{toast.textContent=m;toast.classList.toggle('bad',bad);toast.classList.add('show');setTimeout(()=>toast.classList.remove('show'),2600)};
const qs=(obj)=>new URLSearchParams(Object.entries(obj).filter(([,v])=>v!==''&&v!==null&&v!==undefined)).toString();
const fetchJson=async(url,opts={})=>{const r=await fetch(url,{credentials:'same-origin',cache:'no-store',...opts});const j=await r.json();if(!r.ok||!j.ok)throw Error(j.message||'İşlem tamamlanamadı.');return j};
const setTabs=()=>document.querySelectorAll('[data-km-section]').forEach(b=>b.classList.toggle('active',b.dataset.kmSection===state.section));
const setUrl=()=>{const p=new URLSearchParams();p.set('sekme',state.section);if(state.filterId)p.set('kurum_id',String(state.filterId));history.pushState({section:state.section,kurum_id:state.filterId},'',location.pathname+'?'+p.toString())};
const roleLabel=()=>sections[state.section]?.[0]||'Kullanıcılar';
const institutionOptions=(selected)=>state.institutions.map(k=>'<option value="'+k.id+'" '+(Number(selected)===Number(k.id)?'selected':'')+'>'+esc(k.ad)+'</option>').join('');
const renderFilter=()=>{if(state.section==='kurumlar'){filter.hidden=true;return;}filter.hidden=false;filter.innerHTML='<option value="0">Tüm kurumlar</option>'+institutionOptions(state.filterId);filter.value=String(state.filterId||0)};
const render=()=>{
 const q=(search.value||'').trim().toLocaleLowerCase('tr-TR');
 let rows=state.rows.filter(r=>!q||JSON.stringify(r).toLocaleLowerCase('tr-TR').includes(q));
 if(state.section==='kurumlar'){
  content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Kurum</th><th>Tür</th><th>İçerik</th><th>Kullanıcılar</th><th>Durum</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
  (rows.length?rows.map((r,i)=>'<tr><td><div class="km-name"><span class="km-avatar">'+(r.kod==='ilkadim'?'🌞':'🏫')+'</span><div><strong>'+esc(r.ad)+'</strong><small>'+esc(r.kod)+(r.email?' · '+esc(r.email):'')+'</small></div></div></td><td>'+esc(r.tur)+'</td><td>'+esc(r.icerik_kaynagi)+'</td><td><div class="km-counts"><span>Yön. '+r.yonetici_sayisi+'</span><span>Öğrt. '+r.ogretmen_sayisi+'</span><span>Veli '+r.veli_sayisi+'</span><span>Öğr. '+r.ogrenci_sayisi+'</span></div></td><td><span class="role-pill '+(Number(r.aktif)===1?'ok':'off')+'">'+(Number(r.aktif)===1?'Aktif':'Pasif')+'</span></td><td><div class="km-actions">'+(Number(r.aktif)===1?'<button class="km-btn primary" data-manage="'+r.id+'">Yönet</button>':'')+'<button class="km-btn" data-edit="'+i+'">Düzenle</button>'+(Number(r.aktif)===1&&r.kod!=='ilkadim'?'<button class="km-btn danger" data-delete="'+i+'">Sil</button>':'')+'</div></td></tr>').join(''):'<tr><td colspan="6"><div class="km-empty">Kurum bulunamadı.</div></td></tr>')+
  '</tbody></table></div></div>';
 }else{
  content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Ad Soyad</th><th>Kurum</th><th>E-posta</th><th>Telefon</th><th>Durum</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
  (rows.length?rows.map((r,i)=>'<tr><td><div class="km-name"><span class="km-avatar">'+sections[state.section][1]+'</span><div><strong>'+esc(r.ad_soyad)+'</strong><small>#'+r.kullanici_id+'</small></div></div></td><td>'+esc(r.kurum_adi)+'</td><td>'+esc(r.email)+'</td><td>'+esc(r.telefon||'—')+'</td><td><span class="role-pill '+(Number(r.aktif)===1?'ok':'off')+'">'+(Number(r.aktif)===1?'Aktif':'Pasif')+'</span></td><td><div class="km-actions"><button class="km-btn" data-edit="'+i+'">Güncelle</button><button class="km-btn danger" data-delete="'+i+'">Sil</button></div></td></tr>').join(''):'<tr><td colspan="6"><div class="km-empty">Kayıt bulunamadı.</div></td></tr>')+
  '</tbody></table></div></div>';
 }
 bindRows(rows);
};
const bindRows=rows=>{
 content.querySelectorAll('[data-edit]').forEach(b=>b.onclick=()=>openEdit(rows[Number(b.dataset.edit)]));
 content.querySelectorAll('[data-delete]').forEach(b=>b.onclick=()=>removeRow(rows[Number(b.dataset.delete)]));
 content.querySelectorAll('[data-manage]').forEach(b=>b.onclick=()=>{state.section='yoneticiler';state.filterId=Number(b.dataset.manage);setTabs();setUrl();load(false)});
};
const load=async(push=true)=>{
 content.classList.add('loading');content.innerHTML='<div class="km-panel"><div class="km-loading">Yükleniyor…</div></div>';
 try{const j=await fetchJson('api/kurumlar-modulu.php?'+qs({section:state.section,kurum_id:state.filterId}));state.rows=j.rows||[];state.institutions=j.institutions||[];title.textContent=j.section_label;eyebrow.textContent='KURUMLAR MODÜLÜ';addBtn.textContent='＋ Yeni '+(state.section==='kurumlar'?'Kurum':j.section_label.replace(/ler$|lar$/,''));
 renderFilter();render();setTabs();if(push)setUrl();}
 catch(e){content.innerHTML='<div class="role-note"><span>⚠️</span><p>'+esc(e.message)+'</p></div>';}
 finally{content.classList.remove('loading')}
};
const institutionFields=(row={})=>'<input type="hidden" name="kurum_id" value="'+esc(row.id||0)+'"><label>Kurum adı</label><input class="role-input" name="ad" required maxlength="190" value="'+esc(row.ad||'')+'"><div class="km-grid"><div><label>Kurum kodu</label><input class="role-input" name="kod" maxlength="80" value="'+esc(row.kod||'')+'"></div><div><label>Tür</label><select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select></div></div><label>İçerik kaynağı</label><select class="role-input" name="icerik_kaynagi"><option value="kurum">Kurum içeriği</option><option value="sistem">Sistem içeriği</option></select><div class="km-grid"><div><label>E-posta</label><input class="role-input" type="email" name="email" value="'+esc(row.email||'')+'"></div><div><label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'"></div></div><label>Adres</label><textarea class="role-input" name="adres">'+esc(row.adres||'')+'</textarea>';
const memberFields=(row={},edit=false)=>'<input type="hidden" name="kullanici_id" value="'+esc(row.kullanici_id||0)+'"><input type="hidden" name="eski_kurum_id" value="'+esc(row.kurum_id||0)+'"><label>Kurum</label><select class="role-input" name="kurum_id" required><option value="">Kurum seç</option>'+institutionOptions(row.kurum_id||state.filterId)+'</select><label>Ad soyad</label><input class="role-input" name="ad_soyad" required maxlength="190" value="'+esc(row.ad_soyad||'')+'"><label>E-posta</label><input class="role-input" type="email" name="email" required value="'+esc(row.email||'')+'">'+((state.section==='ogretmenler'||state.section==='veliler')?'<label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'">':'')+'<label>'+(edit?'Yeni şifre (değişmeyecekse boş bırak)':'Geçici şifre')+'</label><input class="role-input" type="password" name="sifre" '+(edit?'':'required')+' minlength="8">';
const openDialog=(mode,row={})=>{form.reset();form.dataset.action=mode;dialogTitle.textContent=(mode==='create'?'Yeni ':'Güncelle — ')+(state.section==='kurumlar'?'Kurum':roleLabel());document.getElementById('km-fields').innerHTML=state.section==='kurumlar'?institutionFields(row):memberFields(row,mode==='update');if(state.section==='kurumlar'&&row.id){form.elements.tur.value=row.tur||'okul';form.elements.icerik_kaynagi.value=row.icerik_kaynagi||'kurum';}dialog.showModal()};
const openEdit=row=>openDialog('update',row);
const removeRow=async row=>{const name=state.section==='kurumlar'?row.ad:row.ad_soyad;if(!confirm(name+' silinsin mi? Bu işlem güvenli pasife alma/kurumdan çıkarma olarak uygulanır.'))return;const p=new URLSearchParams({csrf,section:state.section,action:'delete'});if(state.section==='kurumlar')p.set('kurum_id',row.id);else{p.set('kullanici_id',row.kullanici_id);p.set('kurum_id',row.kurum_id)};try{const j=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});flash(j.message);load(false)}catch(e){flash(e.message,true)}};
form.addEventListener('submit',async e=>{e.preventDefault();const p=new URLSearchParams(new FormData(form));p.set('csrf',csrf);p.set('section',state.section);p.set('action',form.dataset.action);try{const j=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});dialog.close();flash(j.message);load(false)}catch(e){flash(e.message,true)}});
document.querySelectorAll('[data-km-section]').forEach(b=>b.onclick=()=>{state.section=b.dataset.kmSection;state.filterId=0;search.value='';load()});
addBtn.onclick=()=>openDialog('create');
filter.onchange=()=>{state.filterId=Number(filter.value||0);load()};
search.oninput=render;
document.querySelectorAll('[data-km-close]').forEach(b=>b.onclick=()=>dialog.close());
dialog.addEventListener('click',e=>{if(e.target===dialog)dialog.close()});
addEventListener('popstate',()=>{const u=new URL(location.href);state.section=u.searchParams.get('sekme')||'kurumlar';state.filterId=Number(u.searchParams.get('kurum_id')||0);load(false)});
load(false);
})();
