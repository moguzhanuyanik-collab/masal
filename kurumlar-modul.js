(()=>{'use strict';
const root=document.querySelector('[data-km-root]');if(!root)return;
const csrf=document.querySelector('meta[name="csrf-token"]')?.content||'';
const content=document.getElementById('km-content'),title=document.getElementById('km-title'),eyebrow=document.getElementById('km-eyebrow');
const addBtn=document.getElementById('km-add'),filter=document.getElementById('km-filter'),search=document.getElementById('km-search');
const dialog=document.getElementById('km-dialog'),form=document.getElementById('km-form'),dialogTitle=document.getElementById('km-dialog-title');
const toast=document.getElementById('km-toast');
let state={
 section:root.dataset.section||'kurumlar',
 rows:[],
 institutions:[],
 matchingOptions:{ogrenciler:[],veliler:[],ogretmenler:[]},
 filterId:Number(root.dataset.kurum||0)
};
const sections={
 kurumlar:['Kurumlar','🏫'],
 yoneticiler:['Yöneticiler','🧑‍💼'],
 ogretmenler:['Öğretmenler','👩‍🏫'],
 veliler:['Veliler','👪'],
 ogrenciler:['Öğrenciler','🎒'],
 eslestirme:['Eşleştirme','🔗']
};
const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const flash=(m,bad=false)=>{toast.textContent=m;toast.classList.toggle('bad',bad);toast.classList.add('show');setTimeout(()=>toast.classList.remove('show'),2600)};
const qs=(obj)=>new URLSearchParams(Object.entries(obj).filter(([,v])=>v!==''&&v!==null&&v!==undefined)).toString();
const fetchJson=async(url,opts={})=>{const r=await fetch(url,{credentials:'same-origin',cache:'no-store',...opts});const j=await r.json();if(!r.ok||!j.ok)throw Error(j.message||'İşlem tamamlanamadı.');return j};
const setTabs=()=>document.querySelectorAll('[data-km-section]').forEach(b=>b.classList.toggle('active',b.dataset.kmSection===state.section));
const setUrl=()=>{const p=new URLSearchParams();p.set('sekme',state.section);if(state.filterId)p.set('kurum_id',String(state.filterId));history.pushState({section:state.section,kurum_id:state.filterId},'',location.pathname+'?'+p.toString())};
const roleLabel=()=>sections[state.section]?.[0]||'Kullanıcılar';
const institutionOptions=(selected)=>state.institutions.map(k=>'<option value="'+k.id+'" '+(Number(selected)===Number(k.id)?'selected':'')+'>'+esc(k.ad)+'</option>').join('');
const renderFilter=()=>{
 if(state.section==='kurumlar'){filter.hidden=true;return;}
 filter.hidden=false;
 filter.innerHTML='<option value="0">Tüm kurumlar</option>'+institutionOptions(state.filterId);
 filter.value=String(state.filterId||0);
};
const relationHtml=(items,empty='—')=>{
 if(!Array.isArray(items)||!items.length)return '<span>'+esc(empty)+'</span>';
 return '<div class="km-relations">'+items.map(x=>'<span class="km-relation">'+esc(x.name)+'</span>').join('')+'</div>';
};
const render=()=>{
 const q=(search.value||'').trim().toLocaleLowerCase('tr-TR');
 let rows=state.rows.filter(r=>!q||JSON.stringify(r).toLocaleLowerCase('tr-TR').includes(q));

 if(state.section==='kurumlar'){
  content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Kurum</th><th>Tür</th><th>İçerik</th><th>Kullanıcılar</th><th>Durum</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
  (rows.length?rows.map((r,i)=>'<tr><td><div class="km-name"><span class="km-avatar">'+(r.kod==='ilkadim'?'🌞':'🏫')+'</span><div><strong>'+esc(r.ad)+'</strong><small>'+esc(r.kod)+(r.email?' · '+esc(r.email):'')+'</small></div></div></td><td>'+esc(r.tur)+'</td><td>'+esc(r.icerik_kaynagi)+'</td><td><div class="km-counts"><span>Yön. '+r.yonetici_sayisi+'</span><span>Öğrt. '+r.ogretmen_sayisi+'</span><span>Veli '+r.veli_sayisi+'</span><span>Öğr. '+r.ogrenci_sayisi+'</span></div></td><td><span class="role-pill '+(Number(r.aktif)===1?'ok':'off')+'">'+(Number(r.aktif)===1?'Aktif':'Pasif')+'</span></td><td><div class="km-actions">'+(Number(r.aktif)===1?'<button class="km-btn primary" data-manage="'+r.id+'">Yönet</button>':'')+'<button class="km-btn" data-edit="'+i+'">Düzenle</button>'+(Number(r.aktif)===1&&r.kod!=='ilkadim'?'<button class="km-btn danger" data-delete="'+i+'">Sil</button>':'')+'</div></td></tr>').join(''):'<tr><td colspan="6"><div class="km-empty">Kurum bulunamadı.</div></td></tr>')+
  '</tbody></table></div></div>';
 }else if(state.section==='eslestirme'){
  content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Öğrenci</th><th>Kurum</th><th>Veliler</th><th>Öğretmenler</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
  (rows.length?rows.map((r,i)=>'<tr><td><div class="km-name"><span class="km-avatar">🎒</span><div><strong>'+esc(r.ogrenci_adi)+'</strong><small>'+esc(r.ogrenci_email||'')+'</small></div></div></td><td>'+esc(r.kurum_adi)+'</td><td>'+relationHtml(r.veliler)+'</td><td>'+relationHtml(r.ogretmenler)+'</td><td><div class="km-actions"><button class="km-btn primary" data-edit="'+i+'">Eşleştir / Güncelle</button>'+((r.veliler?.length||0)+(r.ogretmenler?.length||0)>0?'<button class="km-btn danger" data-delete="'+i+'">Bağlantıları Sil</button>':'')+'</div></td></tr>').join(''):'<tr><td colspan="5"><div class="km-empty">Eşleştirilecek öğrenci bulunamadı.</div></td></tr>')+
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
 content.classList.add('loading');
 content.innerHTML='<div class="km-panel"><div class="km-loading">Yükleniyor…</div></div>';
 try{
  const j=await fetchJson('api/kurumlar-modulu.php?'+qs({section:state.section,kurum_id:state.filterId}));
  state.rows=j.rows||[];
  state.institutions=j.institutions||[];
  state.matchingOptions=j.matching_options||{ogrenciler:[],veliler:[],ogretmenler:[]};
  title.textContent=j.section_label;
  eyebrow.textContent='KURUMLAR MODÜLÜ';
  addBtn.textContent=state.section==='kurumlar'
   ?'＋ Yeni Kurum'
   :state.section==='eslestirme'
    ?'＋ Yeni Eşleştirme'
    :'＋ Yeni '+j.section_label.replace(/ler$|lar$/,'');
  renderFilter();render();setTabs();if(push)setUrl();
 }catch(e){
  content.innerHTML='<div class="role-note"><span>⚠️</span><p>'+esc(e.message)+'</p></div>';
 }finally{content.classList.remove('loading')}
};
const institutionFields=(row={})=>'<input type="hidden" name="kurum_id" value="'+esc(row.id||0)+'"><label>Kurum adı</label><input class="role-input" name="ad" required maxlength="190" value="'+esc(row.ad||'')+'"><div class="km-grid"><div><label>Kurum kodu</label><input class="role-input" name="kod" maxlength="80" value="'+esc(row.kod||'')+'"></div><div><label>Tür</label><select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select></div></div><label>İçerik kaynağı</label><select class="role-input" name="icerik_kaynagi"><option value="kurum">Kurum içeriği</option><option value="sistem">Sistem içeriği</option></select><div class="km-grid"><div><label>E-posta</label><input class="role-input" type="email" name="email" value="'+esc(row.email||'')+'"></div><div><label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'"></div></div><label>Adres</label><textarea class="role-input" name="adres">'+esc(row.adres||'')+'</textarea>';
const memberFields=(row={},edit=false)=>'<input type="hidden" name="kullanici_id" value="'+esc(row.kullanici_id||0)+'"><input type="hidden" name="eski_kurum_id" value="'+esc(row.kurum_id||0)+'"><label>Kurum</label><select class="role-input" name="kurum_id" required><option value="">Kurum seç</option>'+institutionOptions(row.kurum_id||state.filterId)+'</select><label>Ad soyad</label><input class="role-input" name="ad_soyad" required maxlength="190" value="'+esc(row.ad_soyad||'')+'"><label>E-posta</label><input class="role-input" type="email" name="email" required value="'+esc(row.email||'')+'">'+((state.section==='ogretmenler'||state.section==='veliler')?'<label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'">':'')+'<label>'+(edit?'Yeni şifre (değişmeyecekse boş bırak)':'Geçici şifre')+'</label><input class="role-input" type="password" name="sifre" '+(edit?'':'required')+' minlength="8">';
const matchingFields=(row={})=>{
 const institutionId=Number(row.kurum_id||state.filterId||state.institutions[0]?.id||0);
 return '<label>Kurum</label><select class="role-input" name="kurum_id" required><option value="">Kurum seç</option>'+institutionOptions(institutionId)+'</select>'+
 '<label>Öğrenci</label><select class="role-input" name="ogrenci_id" required></select>'+
 '<div class="km-grid"><div><label>Veliler</label><div class="km-match-list" data-match-parents></div></div><div><label>Öğretmenler</label><div class="km-match-list" data-match-teachers></div></div></div>'+
 '<div class="km-match-note">Yalnızca seçilen kurumun aktif öğrencisi, velisi ve öğretmeni listelenir. Bir öğrenci birden fazla veli ve öğretmene bağlanabilir.</div>';
};
const setupMatchingFields=(row={})=>{
 const institutionSelect=form.elements.kurum_id;
 const studentSelect=form.elements.ogrenci_id;
 const parentBox=form.querySelector('[data-match-parents]');
 const teacherBox=form.querySelector('[data-match-teachers]');
 const originalInstitution=Number(row.kurum_id||0);
 const originalStudent=Number(row.ogrenci_id||0);
 const originalParents=new Set((row.veliler||[]).map(x=>Number(x.id)));
 const originalTeachers=new Set((row.ogretmenler||[]).map(x=>Number(x.id)));

 const fill=()=>{
  const institutionId=Number(institutionSelect.value||0);
  const same=institutionId===originalInstitution;
  const students=(state.matchingOptions.ogrenciler||[]).filter(x=>Number(x.kurum_id)===institutionId);
  const parents=(state.matchingOptions.veliler||[]).filter(x=>Number(x.kurum_id)===institutionId);
  const teachers=(state.matchingOptions.ogretmenler||[]).filter(x=>Number(x.kurum_id)===institutionId);

  studentSelect.innerHTML='<option value="">Öğrenci seç</option>'+students.map(x=>'<option value="'+x.profil_id+'" '+(same&&Number(x.profil_id)===originalStudent?'selected':'')+'>'+esc(x.ad)+'</option>').join('');
  parentBox.innerHTML=parents.length?parents.map(x=>'<label class="km-match-item"><input type="checkbox" name="veli_ids[]" value="'+x.profil_id+'" '+(same&&originalParents.has(Number(x.profil_id))?'checked':'')+'><span><strong>'+esc(x.ad)+'</strong><small>'+esc(x.email||'')+'</small></span></label>').join(''):'<div class="km-match-empty">Bu kurumda aktif veli yok.</div>';
  teacherBox.innerHTML=teachers.length?teachers.map(x=>'<label class="km-match-item"><input type="checkbox" name="ogretmen_ids[]" value="'+x.profil_id+'" '+(same&&originalTeachers.has(Number(x.profil_id))?'checked':'')+'><span><strong>'+esc(x.ad)+'</strong><small>'+esc(x.email||'')+'</small></span></label>').join(''):'<div class="km-match-empty">Bu kurumda aktif öğretmen yok.</div>';
 };
 institutionSelect.addEventListener('change',fill);
 fill();
};
const openDialog=(mode,row={})=>{
 form.reset();
 form.dataset.action=state.section==='eslestirme'?'save':mode;
 dialogTitle.textContent=state.section==='eslestirme'
  ?(mode==='create'?'Yeni Eşleştirme':'Eşleştirmeyi Güncelle')
  :(mode==='create'?'Yeni ':'Güncelle — ')+(state.section==='kurumlar'?'Kurum':roleLabel());
 document.getElementById('km-fields').innerHTML=state.section==='kurumlar'
  ?institutionFields(row)
  :state.section==='eslestirme'
   ?matchingFields(row)
   :memberFields(row,mode==='update');
 if(state.section==='kurumlar'&&row.id){
  form.elements.tur.value=row.tur||'okul';
  form.elements.icerik_kaynagi.value=row.icerik_kaynagi||'kurum';
 }
 if(state.section==='eslestirme')setupMatchingFields(row);
 dialog.showModal();
};
const openEdit=row=>openDialog('update',row);
const removeRow=async row=>{
 if(state.section==='eslestirme'){
  if(!confirm((row.ogrenci_adi||'Bu öğrenci')+' için bu kurumdaki veli ve öğretmen bağlantıları kaldırılsın mı?'))return;
  const p=new URLSearchParams({csrf,section:'eslestirme',action:'delete',kurum_id:String(row.kurum_id),ogrenci_id:String(row.ogrenci_id)});
  try{const j=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});flash(j.message);load(false)}catch(e){flash(e.message,true)}
  return;
 }
 const name=state.section==='kurumlar'?row.ad:row.ad_soyad;
 if(!confirm(name+' silinsin mi? Bu işlem güvenli pasife alma/kurumdan çıkarma olarak uygulanır.'))return;
 const p=new URLSearchParams({csrf,section:state.section,action:'delete'});
 if(state.section==='kurumlar')p.set('kurum_id',row.id);else{p.set('kullanici_id',row.kullanici_id);p.set('kurum_id',row.kurum_id)}
 try{const j=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});flash(j.message);load(false)}catch(e){flash(e.message,true)}
};
form.addEventListener('submit',async e=>{
 e.preventDefault();
 const fd=new FormData(form);
 fd.set('csrf',csrf);
 fd.set('section',state.section);
 fd.set('action',form.dataset.action);
 const p=new URLSearchParams();
 for(const [k,v] of fd.entries())p.append(k,String(v));
 try{
  const j=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});
  dialog.close();flash(j.message);load(false);
 }catch(e){flash(e.message,true)}
});
document.querySelectorAll('[data-km-section]').forEach(b=>b.onclick=()=>{state.section=b.dataset.kmSection;state.filterId=0;search.value='';load()});
addBtn.onclick=()=>openDialog('create');
filter.onchange=()=>{state.filterId=Number(filter.value||0);load()};
search.oninput=render;
document.querySelectorAll('[data-km-close]').forEach(b=>b.onclick=()=>dialog.close());
dialog.addEventListener('click',e=>{if(e.target===dialog)dialog.close()});
addEventListener('popstate',()=>{const u=new URL(location.href);state.section=u.searchParams.get('sekme')||'kurumlar';state.filterId=Number(u.searchParams.get('kurum_id')||0);load(false)});
load(false);
})();
