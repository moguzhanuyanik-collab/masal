<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
function aa_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function aa_test_provider(string $provider,string $model,string $apiKey): string {
    if(!function_exists('curl_init')) throw new RuntimeException('Ayarlar kaydedildi ancak sunucuda cURL kapalı olduğu için bağlantı test edilemedi.');
    if($apiKey==='') throw new RuntimeException('Ayarlar kaydedildi ancak seçilen sağlayıcının API anahtarı bulunamadı.');
    $prompt='Yalnızca TAMAM yaz.';
    if($provider==='gemini'){
        $url='https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model).':generateContent';
        $headers=['x-goog-api-key: '.$apiKey,'Content-Type: application/json'];
        $payload=['contents'=>[['parts'=>[['text'=>$prompt]]]],'generationConfig'=>['maxOutputTokens'=>8]];
    }elseif($provider==='groq'){
        $url='https://api.groq.com/openai/v1/chat/completions';
        $headers=['Authorization: Bearer '.$apiKey,'Content-Type: application/json'];
        $payload=['model'=>$model,'messages'=>[['role'=>'user','content'=>$prompt]],'max_tokens'=>8];
    }else{
        $url='https://api.openai.com/v1/responses';
        $headers=['Authorization: Bearer '.$apiKey,'Content-Type: application/json'];
        $payload=['model'=>$model,'input'=>$prompt,'max_output_tokens'=>8];
    }
    $ch=curl_init($url);
    curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>6,CURLOPT_TIMEOUT=>15,CURLOPT_HTTPHEADER=>$headers,CURLOPT_POSTFIELDS=>json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)]);
    $body=curl_exec($ch);
    $errno=curl_errno($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    curl_close($ch);
    unset($body);
    if($errno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) throw new RuntimeException('Ayarlar kaydedildi ancak bağlantı testi zaman aşımına uğradı.');
    if($errno!==0) throw new RuntimeException('Ayarlar kaydedildi ancak sağlayıcıya ağ bağlantısı kurulamadı.');
    if($status===401 || $status===403) throw new RuntimeException('Ayarlar kaydedildi ancak API anahtarı sağlayıcı tarafından reddedildi.');
    if($status===400 || $status===404) throw new RuntimeException('Ayarlar kaydedildi ancak model kimliği veya istek ayarı sağlayıcı tarafından kabul edilmedi.');
    if($status===429) throw new RuntimeException('Ayarlar kaydedildi ancak sağlayıcı kotası veya istek sınırı bağlantı testini engelledi.');
    if($status<200 || $status>=300) throw new RuntimeException('Ayarlar kaydedildi ancak sağlayıcı geçici olarak yanıt veremedi.');
    return 'Bağlantı testi başarılı: '.strtoupper($provider).' anahtarı ve '.$model.' modeli doğrulandı.';
}
function aa_test_voice_provider(string $provider,string $model,string $apiKey): string {
    if(!function_exists('curl_init')) throw new RuntimeException('Ses ayarları kaydedildi ancak sunucuda cURL kapalı olduğu için konuşma modeli test edilemedi.');
    if($apiKey==='') throw new RuntimeException('Ses ayarları kaydedildi ancak konuşma sağlayıcısının API anahtarı bulunamadı.');
    $url=$provider==='groq'
        ?'https://api.groq.com/openai/v1/models/'.rawurlencode($model)
        :'https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model);
    $headers=$provider==='groq'?['Authorization: Bearer '.$apiKey]:['x-goog-api-key: '.$apiKey];
    $ch=curl_init($url);
    curl_setopt_array($ch,[CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>6,CURLOPT_TIMEOUT=>15,CURLOPT_HTTPHEADER=>$headers]);
    $body=curl_exec($ch);
    $errno=curl_errno($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    curl_close($ch);
    unset($body);
    if($errno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma modeli testi zaman aşımına uğradı.');
    if($errno!==0) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısına ağ bağlantısı kurulamadı.');
    if($status===401 || $status===403) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısının API anahtarı reddedildi.');
    if($status===400 || $status===404) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak seçilen konuşma modeli bulunamadı.');
    if($status===429) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısının kotası testi engelledi.');
    if($status<200 || $status>=300) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısı geçici olarak yanıt veremedi.');
    return 'Konuşma modeli doğrulandı: '.strtoupper($provider).' '.$model.'.';
}
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
        $newGeminiKey=trim((string)($_POST['gemini_api_key']??''));
        $enabled=isset($_POST['enabled']);
        $voiceEnabled=isset($_POST['voice_enabled']);
        $voiceInput=trim((string)($_POST['voice_input']??'browser'));
        $transcriptionModel=trim((string)($_POST['voice_transcription_model']??'whisper-large-v3-turbo'));
        $geminiVoiceModel=trim((string)($_POST['voice_gemini_model']??'gemini-3.5-flash-lite'));
        $timeoutSeconds=(int)($_POST['timeout_seconds']??20);
        $limit=(int)($_POST['max_requests_per_10_minutes']??20);
        if(!in_array($provider,['groq','openai','gemini'],true)) throw new RuntimeException('Sağlayıcı seçimi geçersiz.');
        if(!preg_match('~^[A-Za-z0-9._/-]{2,100}$~D',$model)) throw new RuntimeException('Model adı geçersiz.');
        if($provider==='groq' && (str_starts_with($model,'gpt-') || str_starts_with($model,'gemini-'))) throw new RuntimeException('Groq için Groq model kimliğini seçin.');
        if($provider==='gemini' && !preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$model)) throw new RuntimeException('Gemini model kimliği gemini- ile başlamalı.');
        if($provider==='openai' && (str_starts_with($model,'gemini-') || str_starts_with($model,'llama-'))) throw new RuntimeException('OpenAI için OpenAI model kimliğini seçin.');
        if($newKey!=='' && (strlen($newKey)>512 || preg_match('/\s/',$newKey))) throw new RuntimeException('API anahtarını kontrol edin.');
        if($newGeminiKey!=='' && (strlen($newGeminiKey)>512 || preg_match('/\s/',$newGeminiKey))) throw new RuntimeException('Gemini API anahtarını kontrol edin.');
        if(!in_array($voiceInput,['browser','groq','gemini'],true)) throw new RuntimeException('Mikrofon yöntemi geçersiz.');
        if(!in_array($transcriptionModel,['whisper-large-v3-turbo','whisper-large-v3'],true)) throw new RuntimeException('Groq konuşma modeli geçersiz.');
        if(!preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$geminiVoiceModel)) throw new RuntimeException('Gemini konuşma modeli geçersiz.');
        if($timeoutSeconds<5 || $timeoutSeconds>40) throw new RuntimeException('Bağlantı zaman aşımı 5 ile 40 saniye arasında olmalı.');
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
            $geminiKey=$newGeminiKey!==''?$newGeminiKey:trim((string)($saved['gemini_api_key']??($ai['gemini_api_key']??'')));
            if(isset($_POST['clear_gemini_key'])) $geminiKey='';
            if($provider==='groq' && $enabled && $groqKey==='' && trim((string)(getenv('GROQ_API_KEY')?:''))==='') {
                throw new RuntimeException('Groq için API anahtarı girin veya sunucuda GROQ_API_KEY tanımlayın.');
            }
            if($provider==='gemini' && $enabled && $geminiKey==='' && trim((string)(getenv('GEMINI_API_KEY')?:''))==='') {
                throw new RuntimeException('Gemini için API anahtarı girin veya sunucuda GEMINI_API_KEY tanımlayın.');
            }
            if($voiceEnabled && $voiceInput==='groq' && $groqKey==='' && trim((string)(getenv('GROQ_API_KEY')?:''))==='') throw new RuntimeException('Groq konuşma tanıma için Groq anahtarı gerekli.');
            if($voiceEnabled && $voiceInput==='gemini' && $geminiKey==='' && trim((string)(getenv('GEMINI_API_KEY')?:''))==='') throw new RuntimeException('Gemini konuşma tanıma için Gemini anahtarı gerekli.');
            $saved['provider']=$provider;
            $saved['model']=$model;
            $saved['enabled']=$enabled;
            $saved['max_requests_per_10_minutes']=$limit;
            $saved['groq_api_key']=$groqKey;
            $saved['gemini_api_key']=$geminiKey;
            $saved['voice_enabled']=$voiceEnabled;
            $saved['voice_input']=$voiceInput;
            $saved['voice_transcription_model']=$transcriptionModel;
            $saved['voice_gemini_model']=$geminiVoiceModel;
            $saved['timeout_seconds']=$timeoutSeconds;
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
        if(($_POST['action']??'save')==='save_test'){
            $testKey=match($provider){
                'groq'=>trim((string)($groqKey!==''?$groqKey:getenv('GROQ_API_KEY'))),
                'gemini'=>trim((string)($geminiKey!==''?$geminiKey:getenv('GEMINI_API_KEY'))),
                default=>trim((string)(getenv('OPENAI_API_KEY')?:($ai['api_key']??''))),
            };
            $message.=' '.aa_test_provider($provider,$model,$testKey);
            if($voiceEnabled && $voiceInput!=='browser'){
                $voiceModel=$voiceInput==='groq'?$transcriptionModel:$geminiVoiceModel;
                $voiceKey=$voiceInput==='groq'
                    ?trim((string)($groqKey!==''?$groqKey:getenv('GROQ_API_KEY')))
                    :trim((string)($geminiKey!==''?$geminiKey:getenv('GEMINI_API_KEY')));
                $message.=' '.aa_test_voice_provider($voiceInput,$voiceModel,$voiceKey);
            }
        }
        $config=require __DIR__.'/config/app.php';
        $ai=is_array($config['ai']??null)?$config['ai']:[];
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Ayarlar kaydedilemedi.';
        $config=require __DIR__.'/config/app.php';
        $ai=is_array($config['ai']??null)?$config['ai']:[];
    }
}

$provider=(string)($ai['provider']??'openai');
$keySet=trim((string)(($ai['groq_api_key']??'')?:getenv('GROQ_API_KEY')))!=='';
$geminiKeySet=trim((string)(($ai['gemini_api_key']??'')?:getenv('GEMINI_API_KEY')))!=='';
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>AdımBot Yapay Zekâ Ayarları — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.72"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell"><header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>AdımBot Ayarları</small></span></a></header>
<main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-settings"/></svg></span><h1>AdımBot Yapay Zekâ</h1><p>Sohbet ve mikrofon sağlayıcısını yönetin. API anahtarları tarayıcıya gönderilmez.</p></section>
<?php if($message!==''):?><div class="role-note"><p><?=aa_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><p><?=aa_h($error)?></p></div><?php endif;?>
<form method="post" class="settings-block" autocomplete="off"><input type="hidden" name="csrf" value="<?=aa_h(csrf_token())?>">
<label class="field-label" for="provider">Sohbet sağlayıcısı</label><select class="text-input" id="provider" name="provider"><option value="groq" <?=$provider==='groq'?'selected':''?>>Groq</option><option value="gemini" <?=$provider==='gemini'?'selected':''?>>Gemini</option><option value="openai" <?=$provider==='openai'?'selected':''?>>OpenAI (mevcut ayar)</option></select>
<label class="field-label" for="model">Model kimliği</label><input class="text-input" id="model" name="model" list="ai-models" maxlength="100" required value="<?=aa_h((string)($ai['model']??''))?>"><datalist id="ai-models"><option value="llama-3.1-8b-instant"><option value="llama-3.3-70b-versatile"><option value="gemini-3.5-flash-lite"><option value="gemini-3.8-flash"></datalist>
<p class="little-note">Ücretsiz katman hesabınıza ve seçilen modele bağlıdır. Geçerli kota ve ücretleri sağlayıcının panelinden kontrol edin.</p>
<label class="field-label" for="groq-key">Groq API anahtarı</label><input class="text-input" id="groq-key" type="password" name="groq_api_key" maxlength="512" placeholder="<?=($keySet?'Anahtar kayıtlı — değiştirmek için yenisini girin':'Groq anahtarınızı girin')?>" autocomplete="new-password">
<p class="little-note">Anahtar: <?=$keySet?'kayıtlı veya ortam değişkeninde tanımlı':'henüz tanımlı değil'?>. Boş bırakılırsa mevcut anahtar korunur. Ücretsiz planın istek ve token sınırları Groq hesabınıza bağlıdır.</p>
<label class="field-label"><input type="checkbox" name="clear_groq_key" value="1"> Kayıtlı Groq anahtarını kaldır</label>
<label class="field-label" for="gemini-key">Gemini API anahtarı</label><input class="text-input" id="gemini-key" type="password" name="gemini_api_key" maxlength="512" placeholder="<?=$geminiKeySet?'Anahtar kayıtlı — değiştirmek için yenisini girin':'Gemini anahtarınızı girin'?>" autocomplete="new-password">
<p class="little-note">Gemini anahtarı: <?=$geminiKeySet?'kayıtlı veya ortam değişkeninde tanımlı':'henüz tanımlı değil'?>. Boş bırakılırsa mevcut anahtar korunur.</p>
<label class="field-label"><input type="checkbox" name="clear_gemini_key" value="1"> Kayıtlı Gemini anahtarını kaldır</label>
<label class="field-label"><input type="checkbox" name="enabled" value="1" <?=($ai['enabled']??true)?'checked':''?>> AdımBot AI yanıtları açık</label>
<label class="field-label"><input type="checkbox" name="voice_enabled" value="1" <?=($ai['voice_enabled']??true)?'checked':''?>> Öğrencinin mikrofonla sohbeti açık</label>
<label class="field-label" for="voice-input">Konuşmayı metne çevirme</label><select class="text-input" id="voice-input" name="voice_input"><option value="browser" <?=($ai['voice_input']??'browser')==='browser'?'selected':''?>>Tarayıcı (uyumlu cihazlarda)</option><option value="groq" <?=($ai['voice_input']??'')==='groq'?'selected':''?>>Groq Whisper (ses Groq'a gönderilir)</option><option value="gemini" <?=($ai['voice_input']??'')==='gemini'?'selected':''?>>Gemini (ses Google'a gönderilir)</option></select>
<label class="field-label" for="transcription-model">Groq konuşma tanıma modeli</label><select class="text-input" id="transcription-model" name="voice_transcription_model"><option value="whisper-large-v3-turbo" <?=($ai['voice_transcription_model']??'whisper-large-v3-turbo')==='whisper-large-v3-turbo'?'selected':''?>>Whisper Large V3 Turbo</option><option value="whisper-large-v3" <?=($ai['voice_transcription_model']??'')==='whisper-large-v3'?'selected':''?>>Whisper Large V3</option></select>
<label class="field-label" for="gemini-voice-model">Gemini konuşma tanıma modeli</label><input class="text-input" id="gemini-voice-model" name="voice_gemini_model" maxlength="100" value="<?=aa_h((string)($ai['voice_gemini_model']??'gemini-3.5-flash-lite'))?>">
<p class="little-note">Robotun Türkçe yanıt sesi cihazın seslendirme motorundan gelir. Mikrofon yalnız düğmeye dokununca açılır; kısa kayıtlar kalıcı olarak saklanmaz. Groq/Gemini seçilirse kayıt seçilen sağlayıcıya gönderilir.</p>
<label class="field-label" for="timeout-seconds">API bağlantı zaman aşımı (saniye)</label><input class="text-input" id="timeout-seconds" type="number" name="timeout_seconds" min="5" max="40" value="<?=(int)($ai['timeout_seconds']??20)?>">
<label class="field-label" for="limit">Öğrenci başına 10 dakikalık istek sınırı</label><input class="text-input" id="limit" type="number" name="max_requests_per_10_minutes" min="3" max="60" value="<?=(int)($ai['max_requests_per_10_minutes']??20)?>">
<button class="button primary full" type="submit" name="action" value="save">Ayarları Kaydet</button>
<button class="button full" type="submit" name="action" value="save_test">Kaydet ve Bağlantıyı Test Et</button></form>
<p class="little-note">Groq hesabının ücretsiz kotası biterse AdımBot geçici olarak sınır mesajı gösterir. Ücretli sağlayıcıya otomatik geçiş yapılmaz.</p>
</div></main><nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="sistem-durum.php"><span><svg><use href="#sa-database"/></svg></span>Durum</a><a class="active" href="adimbot-ayarlari.php"><span><svg><use href="#sa-settings"/></svg></span>AdımBot</a><a href="guncelleme.php"><span><svg><use href="#sa-refresh"/></svg></span>Güncelle</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div>
<script>document.getElementById('provider').addEventListener('change',function(){const field=document.getElementById('model');if(this.value==='groq')field.value='llama-3.1-8b-instant';if(this.value==='gemini')field.value='gemini-3.5-flash-lite';if(this.value==='openai')field.value='gpt-5.6-luna';});</script>
</body></html>
