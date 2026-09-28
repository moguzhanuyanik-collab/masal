<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
function aa_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
$message='';
$error='';
$config=require __DIR__.'/config/app.php';
$ai=is_array($config['ai']??null)?$config['ai']:[];
$settingsFile=__DIR__.'/storage/adimbot-ai.php';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Oturum doğrulaması başarısız. Sayfayı yenileyin.');
        $provider=strtolower(trim((string)($_POST['provider']??'')));
        $model=trim((string)($_POST['model']??''));
        $newKey=trim((string)($_POST['groq_api_key']??''));
        $enabled=isset($_POST['enabled']);
        $limit=(int)($_POST['max_requests_per_10_minutes']??20);
        if(!in_array($provider,['groq','openai'],true)) throw new RuntimeException('Sağlayıcı seçimi geçersiz.');
        if(!preg_match('~^[A-Za-z0-9._/-]{2,100}$~D',$model)) throw new RuntimeException('Model adı geçersiz.');
        if($provider==='groq' && str_starts_with($model,'gpt-')) throw new RuntimeException('Groq için Groq model kimliğini seçin.');
        if($newKey!=='' && (strlen($newKey)>512 || preg_match('/\s/',$newKey))) throw new RuntimeException('API anahtarını kontrol edin.');
        if($limit<3 || $limit>60) throw new RuntimeException('10 dakikalık sınır 3 ile 60 arasında olmalı.');

        $dir=dirname($settingsFile);
        if(!is_dir($dir) && !mkdir($dir,0750,true) && !is_dir($dir)) throw new RuntimeException('Ayar klasörü oluşturulamadı.');
        $lock=fopen($dir.'/adimbot-ai.lock','c');
        if($lock===false || !flock($lock,LOCK_EX)) throw new RuntimeException('Ayar dosyası kilitlenemedi.');
        try{
            $saved=is_file($settingsFile)?require $settingsFile:[];
            if(!is_array($saved)) throw new RuntimeException('Mevcut ayarlar okunamadı.');
            $groqKey=$newKey!==''?$newKey:trim((string)($saved['groq_api_key']??($ai['groq_api_key']??'')));
            if(isset($_POST['clear_groq_key'])) $groqKey='';
            if($provider==='groq' && $enabled && $groqKey==='' && trim((string)(getenv('GROQ_API_KEY')?:''))==='') {
                throw new RuntimeException('Groq için API anahtarı girin veya sunucuda GROQ_API_KEY tanımlayın.');
            }
            $saved['provider']=$provider;
            $saved['model']=$model;
            $saved['enabled']=$enabled;
            $saved['max_requests_per_10_minutes']=$limit;
            $saved['groq_api_key']=$groqKey;
            $temp=tempnam($dir,'adimbot_');
            if($temp===false) throw new RuntimeException('Ayar dosyası oluşturulamadı.');
            $contents="<?php\ndeclare(strict_types=1);\nreturn ".var_export($saved,true).";\n";
            if(file_put_contents($temp,$contents)!==strlen($contents) || !chmod($temp,0600) || !rename($temp,$settingsFile)){
                @unlink($temp);
                throw new RuntimeException('Ayarlar kaydedilemedi.');
            }
            $message='AdımBot ayarları kaydedildi.';
        }finally{
            flock($lock,LOCK_UN);
            fclose($lock);
        }
        $config=require __DIR__.'/config/app.php';
        $ai=is_array($config['ai']??null)?$config['ai']:[];
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Ayarlar kaydedilemedi.';
    }
}

$provider=(string)($ai['provider']??'openai');
$keySet=trim((string)(getenv('GROQ_API_KEY')?:($ai['groq_api_key']??'')))!=='';
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>AdımBot Yapay Zekâ Ayarları — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.72"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell"><header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>AdımBot Ayarları</small></span></a></header>
<main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-settings"/></svg></span><h1>AdımBot Yapay Zekâ</h1><p>Öğrenci sohbeti için sağlayıcıyı, modeli ve Groq anahtarını yönetin. Anahtar öğrenciye ve tarayıcıya gönderilmez.</p></section>
<?php if($message!==''):?><div class="role-note"><p><?=aa_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><p><?=aa_h($error)?></p></div><?php endif;?>
<form method="post" class="settings-block" autocomplete="off"><input type="hidden" name="csrf" value="<?=aa_h(csrf_token())?>">
<label class="field-label" for="provider">Sağlayıcı</label><select class="text-input" id="provider" name="provider"><option value="groq" <?=$provider==='groq'?'selected':''?>>Groq</option><option value="openai" <?=$provider==='openai'?'selected':''?>>OpenAI (mevcut ayar)</option></select>
<label class="field-label" for="model">Model kimliği</label><input class="text-input" id="model" name="model" list="ai-models" maxlength="100" required value="<?=aa_h((string)($ai['model']??''))?>"><datalist id="ai-models"><option value="llama-3.1-8b-instant"><option value="llama-3.3-70b-versatile"></datalist>
<p class="little-note">Groq için örnek: llama-3.1-8b-instant. OpenAI'ye dönerken OpenAI model kimliğini yeniden seçin.</p>
<label class="field-label" for="groq-key">Groq API anahtarı</label><input class="text-input" id="groq-key" type="password" name="groq_api_key" maxlength="512" placeholder="<?=($keySet?'Anahtar kayıtlı — değiştirmek için yenisini girin':'Groq anahtarınızı girin')?>" autocomplete="new-password">
<p class="little-note">Anahtar: <?=$keySet?'kayıtlı veya ortam değişkeninde tanımlı':'henüz tanımlı değil'?>. Boş bırakılırsa mevcut anahtar korunur. Ücretsiz planın istek ve token sınırları Groq hesabınıza bağlıdır.</p>
<label class="field-label"><input type="checkbox" name="clear_groq_key" value="1"> Kayıtlı Groq anahtarını kaldır</label>
<label class="field-label"><input type="checkbox" name="enabled" value="1" <?=($ai['enabled']??true)?'checked':''?>> AdımBot AI yanıtları açık</label>
<label class="field-label" for="limit">Öğrenci başına 10 dakikalık istek sınırı</label><input class="text-input" id="limit" type="number" name="max_requests_per_10_minutes" min="3" max="60" value="<?=(int)($ai['max_requests_per_10_minutes']??20)?>">
<button class="button primary full" type="submit">Ayarları Kaydet</button></form>
<p class="little-note">Groq hesabının ücretsiz kotası biterse AdımBot geçici olarak sınır mesajı gösterir. Ücretli sağlayıcıya otomatik geçiş yapılmaz.</p>
</div></main><nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="sistem-durum.php"><span><svg><use href="#sa-database"/></svg></span>Durum</a><a class="active" href="adimbot-ayarlari.php"><span><svg><use href="#sa-settings"/></svg></span>AdımBot</a><a href="guncelleme.php"><span><svg><use href="#sa-refresh"/></svg></span>Güncelle</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div>
<script>document.getElementById('provider').addEventListener('change',function(){const field=document.getElementById('model');if(this.value==='groq' && (!field.value || field.value.startsWith('gpt-')))field.value='llama-3.1-8b-instant';});</script>
</body></html>
