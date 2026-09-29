<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/auth.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');
function voice_result(array $data, int $status=200): never {
    http_response_code($status);
    echo json_encode($data,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}
function voice_placeholder_key(string $value): bool {
    $normalized=strtoupper(trim($value," \t\n\r\0\x0B<>[]{}'\""));
    return preg_match('/^(?:(?:GROQ|GEMINI|OPENAI)[_ -]?)?API[_ -]?(?:KEY|ANAHTARI|ANAHTARINIZ)$/D',$normalized)===1
        || preg_match('/^(?:YOUR[_ -]?API[_ -]?KEY|CHANGE[_ -]?ME|ANAHTARI[_ -]?BURAYA[_ -]?YAZ)$/D',$normalized)===1;
}
app_session_start();
if ($_SERVER['REQUEST_METHOD']!=='POST') voice_result(['ok'=>false,'reason'=>'method'],405);
if (($_SESSION['aktif_rol'] ?? '')!=='ogrenci' || (int)($_SESSION['ogrenci_id'] ?? 0)<1 || (int)($_SESSION['kullanici_id'] ?? 0)<1) voice_result(['ok'=>false,'reason'=>'auth'],403);
if (!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? ''))) voice_result(['ok'=>false,'reason'=>'csrf'],403);
$origin=(string)($_SERVER['HTTP_ORIGIN'] ?? '');
if ($origin!=='') {
    $host=(string)($_SERVER['HTTP_HOST'] ?? '');
    $originHost=(string)(parse_url($origin,PHP_URL_HOST) ?? '');
    if ($originHost==='' || strcasecmp(preg_replace('/:\d+$/','',$host) ?? $host,$originHost)!==0) voice_result(['ok'=>false,'reason'=>'origin'],403);
}
$config=require dirname(__DIR__).'/config/app.php';
$ai=is_array($config['ai'] ?? null)?$config['ai']:[];
$provider=strtolower(trim((string)($ai['voice_input'] ?? 'browser')));
if (($ai['enabled'] ?? true)===false || ($ai['voice_enabled'] ?? true)===false || !in_array($provider,['groq','gemini'],true)) voice_result(['ok'=>false,'reason'=>'disabled'],403);
if ((int)($_SERVER['CONTENT_LENGTH'] ?? 0)>2200000) voice_result(['ok'=>false,'reason'=>'size'],413);
$file=$_FILES['audio'] ?? null;
if (!is_array($file) || ($file['error'] ?? -1)!==UPLOAD_ERR_OK || !is_uploaded_file((string)($file['tmp_name'] ?? ''))) voice_result(['ok'=>false,'reason'=>'upload'],400);
$size=(int)($file['size'] ?? 0);
if ($size<100 || $size>1600000) voice_result(['ok'=>false,'reason'=>'size'],413);
$mimes=['audio/webm'=>'webm','video/webm'=>'webm','audio/ogg'=>'ogg','application/ogg'=>'ogg','audio/mp4'=>'m4a','video/mp4'=>'m4a','audio/x-m4a'=>'m4a','audio/mpeg'=>'mp3','audio/wav'=>'wav','audio/x-wav'=>'wav'];
$audioBytes=file_get_contents($file['tmp_name']);
if (!is_string($audioBytes) || strlen($audioBytes)!==$size) voice_result(['ok'=>false,'reason'=>'upload'],400);
$reported=class_exists(finfo::class)?(new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']):'';
$header=substr($audioBytes,0,16);
$detected='';
if (strlen($header)>=8 && substr($header,4,4)==='ftyp') $detected='audio/mp4';
elseif (str_starts_with($header,"\x1A\x45\xDF\xA3")) $detected='audio/webm';
elseif (str_starts_with($header,'OggS')) $detected='audio/ogg';
elseif (str_starts_with($header,'RIFF') && substr($header,8,4)==='WAVE') $detected='audio/wav';
elseif (str_starts_with($header,'ID3') || (strlen($header)>=2 && ord($header[0])===0xFF && (ord($header[1])&0xE0)===0xE0)) $detected='audio/mpeg';
if ($detected==='' || (is_string($reported) && isset($mimes[$reported]) && $mimes[$reported]!==$mimes[$detected])) voice_result(['ok'=>false,'reason'=>'format'],415);
if (!function_exists('curl_init')) voice_result(['ok'=>false,'reason'=>'curl_missing'],500);
$key=$provider==='groq' ? trim((string)(($ai['groq_api_key'] ?? '') ?: getenv('GROQ_API_KEY'))) : trim((string)(($ai['gemini_api_key'] ?? '') ?: getenv('GEMINI_API_KEY')));
if ($key==='' || voice_placeholder_key($key)) voice_result(['ok'=>false,'reason'=>'provider_disabled'],503);
$groqModel=trim((string)($ai['voice_transcription_model'] ?? 'whisper-large-v3-turbo'));
$geminiModel=trim((string)($ai['voice_gemini_model'] ?? 'gemini-3.5-flash-lite'));
if ($provider==='groq' && !in_array($groqModel,['whisper-large-v3-turbo','whisper-large-v3'],true)) voice_result(['ok'=>false,'reason'=>'provider_config_error'],500);
if ($provider==='gemini' && !preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$geminiModel)) voice_result(['ok'=>false,'reason'=>'provider_config_error'],500);
$times=is_array($_SESSION['adimbot_voice_requests'] ?? null)?$_SESSION['adimbot_voice_requests']:[];
$times=array_values(array_filter(array_map('intval',$times),static fn(int $t):bool=>$t>time()-600));
if (count($times)>=max(3,min(30,(int)($ai['max_requests_per_10_minutes'] ?? 20)))) voice_result(['ok'=>false,'reason'=>'rate_limit'],429);
$times[]=time();
$_SESSION['adimbot_voice_requests']=$times;
session_write_close();
$timeout=max(10,min(45,(int)($ai['timeout_seconds'] ?? 20)));
if ($provider==='groq') {
    $request=['file'=>new CURLFile($file['tmp_name'],$detected,'speech.'.$mimes[$detected]),'model'=>$groqModel,'language'=>'tr','response_format'=>'json'];
    $url='https://api.groq.com/openai/v1/audio/transcriptions';
    $headers=['Authorization: Bearer '.$key];
} else {
    $url='https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($geminiModel).':generateContent';
    $headers=['x-goog-api-key: '.$key,'Content-Type: application/json'];
    $request=json_encode(['contents'=>[['parts'=>[
        ['text'=>'Bu Türkçe ses kaydını yalnızca yazıya çevir. Yorum, yanıt veya ek açıklama yazma.'],
        ['inline_data'=>['mime_type'=>$detected==='video/webm'?'audio/webm':($detected==='video/mp4'?'audio/mp4':$detected),'data'=>base64_encode($audioBytes)]],
    ]]]]],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
}
$ch=curl_init($url);
curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>8,CURLOPT_TIMEOUT=>$timeout,CURLOPT_HTTPHEADER=>$headers,CURLOPT_POSTFIELDS=>$request]);
$body=curl_exec($ch);
$curlErrno=curl_errno($ch);
$status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
curl_close($ch);
if ($curlErrno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) voice_result(['ok'=>false,'reason'=>'provider_timeout'],504);
if ($curlErrno!==0) voice_result(['ok'=>false,'reason'=>'provider_connection_error'],502);
if ($status===402 || $status===429) voice_result(['ok'=>false,'reason'=>'provider_rate_limit'],429);
if ($status===401 || $status===403) voice_result(['ok'=>false,'reason'=>'provider_auth_error'],502);
if ($status===400 || $status===404 || $status===422) voice_result(['ok'=>false,'reason'=>'provider_config_error'],502);
if ($status>=500) voice_result(['ok'=>false,'reason'=>'provider_unavailable'],503);
if ($status<200 || $status>=300 || !is_string($body)) voice_result(['ok'=>false,'reason'=>'provider_error'],502);
$decoded=json_decode($body,true);
if (!is_array($decoded)) voice_result(['ok'=>false,'reason'=>'invalid_provider_response'],502);
$providerBlocked=$provider==='gemini' && (trim((string)($decoded['promptFeedback']['blockReason'] ?? ''))!=='' || in_array((string)($decoded['candidates'][0]['finishReason'] ?? ''),['SAFETY','PROHIBITED_CONTENT','BLOCKLIST'],true));
if ($providerBlocked) voice_result(['ok'=>false,'reason'=>'provider_safety'],422);
$text=$decoded['text'] ?? '';
if ($provider==='gemini') {
    $parts=$decoded['candidates'][0]['content']['parts'] ?? [];
    $text='';
    if (is_array($parts)) foreach ($parts as $part) {
        if (is_array($part) && empty($part['thought']) && is_string($part['text'] ?? null)) $text.=' '.$part['text'];
    }
}
if (!is_string($text)) $text='';
$text=trim(preg_replace('/\s+/u',' ',strip_tags($text)) ?? '');
$text=preg_replace('/^(?:transkripsiyon|deşifre|metin)\s*[:\-]\s*/iu','',$text) ?? $text;
$text=trim($text," \t\n\r\0\x0B\"'“”‘’");
if (mb_strlen($text)>400) $text=mb_substr($text,0,400);
if ($text==='' || preg_match('/^(?:\[(?:müzik|sessizlik|anlaşılmayan ses)\]|(?:ses|konuşma) (?:algılanmadı|bulunamadı))\.?$/iu',$text) || !preg_match('/[\pL\pN]{2}/u',$text)) voice_result(['ok'=>false,'reason'=>'empty'],422);
voice_result(['ok'=>true,'text'=>$text]);
