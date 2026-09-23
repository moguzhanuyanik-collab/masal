(()=>{'use strict';
const root=document.querySelector('[data-km-root]');
if(!root)return;

const csrf=document.querySelector('meta[name="csrf-token"]')?.content||'';
const home=document.getElementById('km-home');
const sectionView=document.getElementById('km-section-view');
const content=document.getElementById('km-content');
const title=document.getElementById('km-title');
const eyebrow=document.getElementById('km-eyebrow');
const addBtn=document.getElementById('km-add');
const filter=document.getElementById('km-filter');
const search=document.getElementById('km-search');
const backBtn=document.getElementById('km-back');
const dialog=document.getElementById('km-dialog');
const form=document.getElementById('km-form');
const dialogTitle=document.getElementById('km-dialog-title');
const fields=document.getElementById('km-fields');
const toast=document.getElementById('km-toast');

const sections={
  kurumlar:{label:'Kurumlar',singular:'Kurum',icon:'🏫'},
  yoneticiler:{label:'Yöneticiler',singular:'Yönetici',icon:'🧑‍💼'},
  ogretmenler:{label:'Öğretmenler',singular:'Öğretmen',icon:'👩‍🏫'},
  veliler:{label:'Veliler',singular:'Veli',icon:'👪'},
  ogrenciler:{label:'Öğrenciler',singular:'Öğrenci',icon:'🎒'},
  eslestirme:{label:'Eşleştirme',singular:'Eşleştirme',icon:'🔗'}
};

let state={
  section:root.dataset.section&&root.dataset.section!=='ana'?root.dataset.section:'',
  rows:[],
  institutions:[],
  matchingOptions:{ogrenciler:[],veliler:[],ogretmenler:[]},
  filterId:Number(root.dataset.kurum||0)
};

const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const qs=obj=>new URLSearchParams(Object.entries(obj).filter(([,v])=>v!==''&&v!==null&&v!==undefined)).toString();

const fetchJson=async(url,opts={})=>{
  const response=await fetch(url,{credentials:'same-origin',cache:'no-store',...opts});
  let data;
  try{data=await response.json();}catch{throw Error('Sunucudan geçerli yanıt alınamadı.');}
  if(!response.ok||!data.ok)throw Error(data.message||'İşlem tamamlanamadı.');
  return data;
};

const flash=(message,bad=false)=>{
  toast.textContent=message;
  toast.classList.toggle('bad',bad);
  toast.classList.add('show');
  clearTimeout(flash.timer);
  flash.timer=setTimeout(()=>toast.classList.remove('show'),2600);
};

const institutionOptions=selected=>{
  const current=Number(selected||0);
  return state.institutions.map(k=>'<option value="'+k.id+'" '+(Number(k.id)===current?'selected':'')+'>'+esc(k.ad)+'</option>').join('');
};

const showHome=(push=true)=>{
  state.section='';
  state.filterId=0;
  search.value='';
  home.hidden=false;
  sectionView.classList.remove('active');
  if(push)history.pushState({view:'home'},'',location.pathname);
};

const showSectionShell=()=>{
  home.hidden=true;
  sectionView.classList.add('active');
  const info=sections[state.section]||sections.kurumlar;
  title.textContent=info.label;
  eyebrow.textContent='KURUMLAR MODÜLÜ';
  addBtn.textContent=state.section==='kurumlar'
    ?'＋ Yeni Kurum'
    :state.section==='eslestirme'
      ?'＋ Yeni Eşleştirme'
      :'＋ Yeni '+info.singular;
  addBtn.disabled=state.section==='eslestirme'&&state.filterId<=0;
};

const setUrl=()=>{
  const p=new URLSearchParams();
  if(state.section)p.set('sekme',state.section);
  if(state.filterId)p.set('kurum_id',String(state.filterId));
  history.pushState({section:state.section,kurum_id:state.filterId},'',location.pathname+(p.toString()?'?'+p.toString():''));
};

const renderFilter=()=>{
  if(state.section==='kurumlar'){
    filter.hidden=true;
    return;
  }
  filter.hidden=false;
  const emptyLabel=state.section==='eslestirme'?'Önce kurum seçin':'Tüm kurumlar';
  filter.innerHTML='<option value="0">'+emptyLabel+'</option>'+institutionOptions(state.filterId);
  filter.value=String(state.filterId||0);
};

const relationHtml=items=>{
  if(!Array.isArray(items)||!items.length)return '<span class="role-pill off">Yok</span>';
  return '<div class="km-relations">'+items.map(x=>'<span class="km-relation">'+esc(x.name)+'</span>').join('')+'</div>';
};

const render=()=>{
  const term=(search.value||'').trim().toLocaleLowerCase('tr-TR');
  const rows=state.rows.filter(r=>!term||JSON.stringify(r).toLocaleLowerCase('tr-TR').includes(term));

  if(state.section==='eslestirme'&&state.filterId<=0){
    content.innerHTML='<div class="km-panel"><div class="km-empty">Önce kurum seç. Öğrenci, veli ve öğretmen listeleri seçtiğin kuruma göre yüklenecek.</div></div>';
    return;
  }

  if(state.section==='kurumlar'){
    content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Kurum</th><th>Tür</th><th>İçerik</th><th>Kullanıcılar</th><th>Durum</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
    (rows.length?rows.map((r,i)=>'<tr>'+
      '<td><div class="km-name"><span class="km-avatar">'+(r.kod==='ilkadim'?'🌞':'🏫')+'</span><div><strong>'+esc(r.ad)+'</strong><small>'+esc(r.kod)+(r.email?' · '+esc(r.email):'')+'</small></div></div></td>'+
      '<td>'+esc(r.tur)+'</td>'+
      '<td>'+esc(r.icerik_kaynagi)+'</td>'+
      '<td><div class="km-counts"><span>Yön. '+r.yonetici_sayisi+'</span><span>Öğrt. '+r.ogretmen_sayisi+'</span><span>Veli '+r.veli_sayisi+'</span><span>Öğr. '+r.ogrenci_sayisi+'</span></div></td>'+
      '<td><span class="role-pill '+(Number(r.aktif)===1?'ok':'off')+'">'+(Number(r.aktif)===1?'Aktif':'Pasif')+'</span></td>'+
      '<td><div class="km-actions">'+
        (Number(r.aktif)===1?'<button class="km-btn primary" data-manage="'+r.id+'">Yönet</button>':'')+
        '<button class="km-btn" data-edit="'+i+'">Güncelle</button>'+
        (Number(r.aktif)===1&&r.kod!=='ilkadim'?'<button class="km-btn danger" data-delete="'+i+'">Sil</button>':'')+
      '</div></td></tr>').join(''):'<tr><td colspan="6"><div class="km-empty">Kurum bulunamadı.</div></td></tr>')+
    '</tbody></table></div></div>';
  }else if(state.section==='eslestirme'){
    content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Öğrenci</th><th>Kurum</th><th>Veliler</th><th>Öğretmenler</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
    (rows.length?rows.map((r,i)=>'<tr>'+
      '<td><div class="km-name"><span class="km-avatar">🎒</span><div><strong>'+esc(r.ogrenci_adi)+'</strong><small>'+esc(r.ogrenci_email||'')+'</small></div></div></td>'+
      '<td>'+esc(r.kurum_adi)+'</td>'+
      '<td>'+relationHtml(r.veliler)+'</td>'+
      '<td>'+relationHtml(r.ogretmenler)+'</td>'+
      '<td><div class="km-actions"><button class="km-btn primary" data-edit="'+i+'">Eşleştir</button>'+
      ((((r.veliler||[]).length+(r.ogretmenler||[]).length)>0)?'<button class="km-btn danger" data-delete="'+i+'">Bağlantıları Sil</button>':'')+
      '</div></td></tr>').join(''):'<tr><td colspan="5"><div class="km-empty">Eşleştirilecek öğrenci bulunamadı.</div></td></tr>')+
    '</tbody></table></div></div>';
  }else{
    const icon=sections[state.section]?.icon||'👤';
    content.innerHTML='<div class="km-panel"><div class="km-table-wrap"><table class="km-table"><thead><tr><th>Ad Soyad</th><th>Kurum</th><th>E-posta</th><th>Telefon</th><th>Durum</th><th style="text-align:right">İşlemler</th></tr></thead><tbody>'+
    (rows.length?rows.map((r,i)=>'<tr>'+
      '<td><div class="km-name"><span class="km-avatar">'+icon+'</span><div><strong>'+esc(r.ad_soyad)+'</strong><small>#'+r.kullanici_id+'</small></div></div></td>'+
      '<td>'+esc(r.kurum_adi)+'</td>'+
      '<td>'+esc(r.email)+'</td>'+
      '<td>'+esc(r.telefon||'—')+'</td>'+
      '<td><span class="role-pill '+(Number(r.aktif)===1?'ok':'off')+'">'+(Number(r.aktif)===1?'Aktif':'Pasif')+'</span></td>'+
      '<td><div class="km-actions"><button class="km-btn" data-edit="'+i+'">Güncelle</button><button class="km-btn danger" data-delete="'+i+'">Sil</button></div></td></tr>').join(''):'<tr><td colspan="6"><div class="km-empty">Kayıt bulunamadı.</div></td></tr>')+
    '</tbody></table></div></div>';
  }
  bindRows(rows);
};

const bindRows=rows=>{
  content.querySelectorAll('[data-edit]').forEach(btn=>btn.onclick=()=>openDialog('update',rows[Number(btn.dataset.edit)]));
  content.querySelectorAll('[data-delete]').forEach(btn=>btn.onclick=()=>removeRow(rows[Number(btn.dataset.delete)]));
  content.querySelectorAll('[data-manage]').forEach(btn=>btn.onclick=()=>{
    state.section='yoneticiler';
    state.filterId=Number(btn.dataset.manage);
    load(true);
  });
};

const load=async(push=true)=>{
  if(!state.section){showHome(push);return;}
  showSectionShell();
  content.classList.add('loading');
  content.innerHTML='<div class="km-panel"><div class="km-loading">Yükleniyor…</div></div>';
  try{
    const data=await fetchJson('api/kurumlar-modulu.php?'+qs({section:state.section,kurum_id:state.filterId}));
    state.rows=data.rows||[];
    state.institutions=data.institutions||[];
    state.matchingOptions=data.matching_options||{ogrenciler:[],veliler:[],ogretmenler:[]};
    renderFilter();
    render();
    if(push)setUrl();
  }catch(error){
    content.innerHTML='<div class="role-note"><span>⚠️</span><p>'+esc(error.message)+'</p></div>';
  }finally{
    content.classList.remove('loading');
  }
};

const institutionFields=(row={})=>
  '<input type="hidden" name="kurum_id" value="'+esc(row.id||0)+'">'+
  '<label>Kurum adı</label><input class="role-input" name="ad" required maxlength="190" value="'+esc(row.ad||'')+'">'+
  '<div class="km-grid"><div><label>Kurum kodu</label><input class="role-input" name="kod" maxlength="80" value="'+esc(row.kod||'')+'"></div>'+
  '<div><label>Tür</label><select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select></div></div>'+
  '<label>İçerik kaynağı</label><select class="role-input" name="icerik_kaynagi"><option value="kurum">Kurum içeriği</option><option value="sistem">Sistem içeriği</option></select>'+
  '<div class="km-grid"><div><label>E-posta</label><input class="role-input" type="email" name="email" value="'+esc(row.email||'')+'"></div>'+
  '<div><label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'"></div></div>'+
  '<label>Adres</label><textarea class="role-input" name="adres">'+esc(row.adres||'')+'</textarea>';

const memberFields=(row={},edit=false)=>{
  const showPhone=state.section==='ogretmenler'||state.section==='veliler';
  return '<input type="hidden" name="kullanici_id" value="'+esc(row.kullanici_id||0)+'">'+
  '<input type="hidden" name="eski_kurum_id" value="'+esc(row.kurum_id||0)+'">'+
  '<label>Kurum</label><select class="role-input" name="kurum_id" required><option value="">Kurum seç</option>'+institutionOptions(row.kurum_id||state.filterId)+'</select>'+
  '<label>Ad soyad</label><input class="role-input" name="ad_soyad" required maxlength="190" value="'+esc(row.ad_soyad||'')+'">'+
  '<label>E-posta</label><input class="role-input" type="email" name="email" required value="'+esc(row.email||'')+'">'+
  (showPhone?'<label>Telefon</label><input class="role-input" name="telefon" maxlength="30" value="'+esc(row.telefon||'')+'">':'')+
  '<label>'+(edit?'Yeni şifre (değişmeyecekse boş bırak)':'Geçici şifre')+'</label>'+
  '<input class="role-input" type="password" name="sifre" '+(edit?'':'required')+' minlength="8">';
};

const matchingFields=(row={})=>{
  const institutionId=Number(row.kurum_id||state.filterId||0);
  const institutionName=state.institutions.find(k=>Number(k.id)===institutionId)?.ad||'Kurum';
  return '<input type="hidden" name="kurum_id" value="'+institutionId+'">'+
  '<label>Kurum</label><input class="role-input" value="'+esc(institutionName)+'" disabled>'+
  '<label>Öğrenci</label><select class="role-input" name="ogrenci_id" required></select>'+
  '<div class="km-grid"><div><label>Veliler</label><div class="km-match-list" data-match-parents></div></div>'+
  '<div><label>Öğretmenler</label><div class="km-match-list" data-match-teachers></div></div></div>'+
  '<div class="km-match-note">Sadece seçilen kurumun aktif veli, öğretmen ve öğrencileri listelenir. Bir öğrenci birden fazla veli ve öğretmene bağlanabilir.</div>';
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
    parentBox.innerHTML=parents.length
      ?parents.map(x=>'<label class="km-match-item"><input type="checkbox" name="veli_ids[]" value="'+x.profil_id+'" '+(same&&originalParents.has(Number(x.profil_id))?'checked':'')+'><span><strong>'+esc(x.ad)+'</strong><small>'+esc(x.email||'')+'</small></span></label>').join('')
      :'<div class="km-match-empty">Bu kurumda aktif veli yok.</div>';
    teacherBox.innerHTML=teachers.length
      ?teachers.map(x=>'<label class="km-match-item"><input type="checkbox" name="ogretmen_ids[]" value="'+x.profil_id+'" '+(same&&originalTeachers.has(Number(x.profil_id))?'checked':'')+'><span><strong>'+esc(x.ad)+'</strong><small>'+esc(x.email||'')+'</small></span></label>').join('')
      :'<div class="km-match-empty">Bu kurumda aktif öğretmen yok.</div>';
  };
  institutionSelect.addEventListener('change',fill);
  fill();
};

const openDialog=(mode,row={})=>{
  form.reset();
  form.dataset.action=state.section==='eslestirme'?'save':mode;
  const info=sections[state.section]||sections.kurumlar;
  dialogTitle.textContent=state.section==='eslestirme'
    ?(mode==='create'?'Yeni Eşleştirme':'Eşleştirmeyi Güncelle')
    :(mode==='create'?'Yeni '+info.singular:info.singular+' Güncelle');

  fields.innerHTML=state.section==='kurumlar'
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

const removeRow=async row=>{
  if(state.section==='eslestirme'){
    if(!confirm((row.ogrenci_adi||'Bu öğrenci')+' için bu kurumdaki veli ve öğretmen bağlantıları kaldırılsın mı?'))return;
    const p=new URLSearchParams({csrf,section:'eslestirme',action:'delete',kurum_id:String(row.kurum_id),ogrenci_id:String(row.ogrenci_id)});
    try{
      const data=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});
      flash(data.message);load(false);
    }catch(error){flash(error.message,true);}
    return;
  }

  const name=state.section==='kurumlar'?row.ad:row.ad_soyad;
  if(!confirm(name+' silinsin mi? İşlem güvenli pasife alma/kurumdan çıkarma olarak uygulanır.'))return;
  const p=new URLSearchParams({csrf,section:state.section,action:'delete'});
  if(state.section==='kurumlar')p.set('kurum_id',String(row.id));
  else{
    p.set('kullanici_id',String(row.kullanici_id));
    p.set('kurum_id',String(row.kurum_id));
  }
  try{
    const data=await fetchJson('api/kurumlar-modulu.php',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},body:p});
    flash(data.message);load(false);
  }catch(error){flash(error.message,true);}
};

form.addEventListener('submit',async event=>{
  event.preventDefault();
  const fd=new FormData(form);
  fd.set('csrf',csrf);
  fd.set('section',state.section);
  fd.set('action',form.dataset.action);
  const p=new URLSearchParams();
  for(const [key,value] of fd.entries())p.append(key,String(value));

  try{
    const data=await fetchJson('api/kurumlar-modulu.php',{
      method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8'},
      body:p
    });
    dialog.close();
    flash(data.message);
    load(false);
  }catch(error){flash(error.message,true);}
});

document.querySelectorAll('[data-km-card]').forEach(card=>{
  card.addEventListener('click',()=>{
    state.section=card.dataset.kmCard;
    state.filterId=0;
    search.value='';
    load(true);
  });
});

backBtn.addEventListener('click',()=>showHome(true));
addBtn.addEventListener('click',()=>openDialog('create'));
filter.addEventListener('change',()=>{state.filterId=Number(filter.value||0);load(true);});
search.addEventListener('input',render);
document.querySelectorAll('[data-km-close]').forEach(btn=>btn.addEventListener('click',()=>dialog.close()));
dialog.addEventListener('click',event=>{if(event.target===dialog)dialog.close();});

addEventListener('popstate',()=>{
  const url=new URL(location.href);
  const section=url.searchParams.get('sekme')||'';
  state.section=sections[section]?section:'';
  state.filterId=Number(url.searchParams.get('kurum_id')||0);
  if(state.section)load(false);else showHome(false);
});

if(state.section&&sections[state.section])load(false);
else showHome(false);
})();