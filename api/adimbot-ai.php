<?php
declare(strict_types=1);

require dirname(__DIR__) . '/src/auth.php';
require_once dirname(__DIR__) . '/src/adimbot_groq.php';
require_once dirname(__DIR__) . '/src/adimbot_rate_limit.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function adimbot_ai_json(array $payload, int $status=200): never {
    http_response_code($status);
    echo json_encode($payload, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}

function adimbot_ai_clean(mixed $value, int $max=400): string {
    $text=trim(preg_replace('/\s+/u',' ',strip_tags((string)$value)) ?? '');
    if (mb_strlen($text)>$max) $text=mb_substr($text,0,$max);
    return trim($text);
}

function adimbot_ai_placeholder_key(string $value): bool {
    $normalized=strtoupper(trim($value," \t\n\r\0\x0B<>[]{}'\""));
    return preg_match('/^(?:(?:GROQ|GEMINI|OPENAI)[_ -]?)?API[_ -]?(?:KEY|ANAHTARI|ANAHTARINIZ)$/D',$normalized)===1
        || preg_match('/^(?:YOUR[_ -]?API[_ -]?KEY|CHANGE[_ -]?ME|ANAHTARI[_ -]?BURAYA[_ -]?YAZ)$/D',$normalized)===1;
}

function adimbot_ai_resolve_key(mixed $configured, string $environment, bool $environmentFirst=false): string {
    $saved=trim((string)$configured);
    $fallback=trim((string)(getenv($environment) ?: ''));
    $candidates=$environmentFirst ? [$fallback,$saved] : [$saved,$fallback];
    foreach ($candidates as $candidate) {
        if ($candidate!=='' && !adimbot_ai_placeholder_key($candidate)) return $candidate;
    }
    return '';
}

function adimbot_ai_redact(string $text): string {
    $text=preg_replace('/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/iu','[e-posta gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?:https?:\/\/|www\.)\S+/iu','[bağlantı gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)(?:\+?90[\s.\-]?)?(?:0?[2-5]\d{2})[\s.\-]?\d{3}[\s.\-]?\d{2}[\s.\-]?\d{2}(?!\d)/u','[telefon gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)\d{11}(?!\d)/u','[kimlik bilgisi gizlendi]',$text) ?? $text;
    return $text;
}

function adimbot_ai_privacy_request(string $text): bool {
    if (preg_match('/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/iu',$text) || preg_match('/(?<!\d)\d{11}(?!\d)/u',$text) || preg_match('/(?<!\d)(?:\+?90[\s.\-]?)?(?:0?[2-5]\d{2})[\s.\-]?\d{3}[\s.\-]?\d{2}[\s.\-]?\d{2}(?!\d)/u',$text)) return true;
    if (preg_match('/(?:ne\s+demek|ne\s+anlama\s+gelir|mucidi|nasıl\s+çalışır|konusu(?:nu)?|hakkında)/iu',$text)) return false;
    $sensitive=preg_match('/(?:adres(?:in|ini|im|imiz)?|telefon\s*numara(?:nı|sı|m)?|e[- ]?posta(?:\s*adres)?(?:nı|m)?|şifre(?:ni|niz|m)?|tc\s*(?:kimlik)?\s*numara(?:nı|sı|m)?|konum(?:un|unu|um)?)/iu',$text)===1;
    $disclosure=preg_match('/(?:öğrenmek|bilmek)\s+istiyorum/iu',$text)===1 || preg_match('/(?:^|[^\p{L}])(?:söyle(?:r\s+misin)?|ver(?:ir\s+misin)?|yaz(?:ar\s+mısın)?|paylaş(?:ır\s+mısın)?|gönder(?:ir\s+misin)?|nedir|ne|kaç|lazım)(?:$|[^\p{L}])/iu',$text)===1;
    return $sensitive && $disclosure;
}

function adimbot_ai_extract_text(array $response): string {
    if (isset($response['output_text']) && is_string($response['output_text'])) {
        return adimbot_ai_clean($response['output_text'],600);
    }
    $parts=[];
    foreach (($response['output'] ?? []) as $item) {
        if (!is_array($item) || ($item['type'] ?? '')!=='message') continue;
        foreach (($item['content'] ?? []) as $content) {
            if (!is_array($content)) continue;
            $text=$content['text'] ?? '';
            if (is_string($text) && trim($text)!=='') $parts[]=$text;
        }
    }
    return adimbot_ai_clean(implode(' ',$parts),600);
}

function adimbot_ai_extract_chat_text(array $response): string {
    $message=$response['choices'][0]['message']['content'] ?? '';
    if (is_string($message)) return adimbot_ai_clean($message,600);
    return '';
}

function adimbot_ai_extract_gemini_text(array $response): string {
    $parts=$response['candidates'][0]['content']['parts'] ?? [];
    if (!is_array($parts)) return '';
    $texts=[];
    foreach ($parts as $part) {
        if (is_array($part) && empty($part['thought']) && is_string($part['text'] ?? null)) $texts[]=$part['text'];
    }
    return adimbot_ai_clean(implode(' ',$texts),600);
}

function adimbot_ai_input_safety(string $text): ?array {
    if (preg_match('/(?:intihar|kendi(?:mi|ni|ne)\s+öldür|canı(?:ma|na)\s+kıy|kendi(?:me|ne)\s+zarar|yaşamak\s+istem(?:e|i))/iu',$text)) {
        return ['reason'=>'self_harm','text'=>'Bunu tek başına taşıma. Hemen yanında güvendiğin bir yetişkine, ailenden birine veya öğretmenine haber ver.'];
    }
    if (adimbot_ai_privacy_request($text)) {
        return ['reason'=>'privacy','text'=>'Kişisel bilgilerini paylaşmana gerek yok. Adres, telefon, e-posta, şifre veya kimlik bilgisi istemeden devam edelim.'];
    }
    if (preg_match('/(?:whatsapp|instagram|telegram|discord|snapchat|buluş(?:alım|mak)|görüşelim|beni\s+ara|seni\s+arayayım|özelden\s+yaz)/iu',$text)) {
        return ['reason'=>'contact','text'=>'Seni başka bir uygulamaya, kişiye veya buluşmaya yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.'];
    }
    if (preg_match('/(?:doğru\s+cevap|cevabı\s+(?:söyle|ver)|hangi\s+şık|cevap\s+ne|doğru\s+şık|şık\s+hangisi)/iu',$text)) {
        return ['reason'=>'answer_key','text'=>'Cevabı doğrudan söylemeyeyim. Sorudaki önemli kelimeleri bulalım ve seçenekleri birlikte eleyelim.'];
    }
    if (preg_match('/(?:uyuşturucu|silah\s+yap|bomba\s+yap|birini\s+öldür|cinsel\s+ilişki|çıplak\s+foto)/iu',$text)) {
        return ['reason'=>'unsafe','text'=>'Bu konu için yanında güvendiğin bir yetişkinden yardım istemen daha doğru olur. İstersen dersine geri dönelim.'];
    }
    return null;
}

function adimbot_ai_readable_output(string $text): string {
    $value=strip_tags($text);
    $value=preg_replace('/\*\*([^*]+)\*\*/u','$1',$value) ?? $value;
    $value=preg_replace('/__([^_]+)__/u','$1',$value) ?? $value;
    $value=preg_replace('/`([^`]+)`/u','$1',$value) ?? $value;
    $value=preg_replace('/^\s*(?:#{1,6}|>|[•-])\s+/mu','',$value) ?? $value;
    $value=adimbot_ai_clean($value,600);
    $sentences=preg_split('/(?<=[.!?])\s+/u',$value,-1,PREG_SPLIT_NO_EMPTY);
    if(is_array($sentences) && count($sentences)>4) $value=implode(' ',array_slice($sentences,0,4));
    return trim($value);
}

function adimbot_ai_safe_output(string $text, bool $hasActiveQuestion=false): array {
    $value=adimbot_ai_readable_output($text);
    if ($value==='') return ['ok'=>false,'text'=>'Şu anda yanıt oluşturamadım. İstersen soruyu başka türlü soralım.','reason'=>'empty'];

    if (adimbot_ai_privacy_request($value)) {
        return ['ok'=>false,'text'=>'Kişisel bilgilerini paylaşmana gerek yok. Dersine güvenli şekilde devam edelim.','reason'=>'privacy'];
    }
    if (preg_match('/(?:https?:\/\/|www\.|\b[\pL\pN-]+\.(?:com|net|org|edu|gov|io|app|tr)\b|whatsapp|instagram|telegram|discord|snapchat|tiktok|facebook|özelden\s+yaz|buluşalım)/iu',$value)) {
        return ['ok'=>false,'text'=>'Seni başka bir uygulamaya veya kişiye yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.','reason'=>'external_contact'];
    }
    if (preg_match('/(?:intihar|kendi(?:mi|ni|ne)\s+öldür|canı(?:ma|na)\s+kıy|kendi(?:me|ne)\s+zarar|yaşamak\s+istem(?:e|i))/iu',$value)) {
        return ['ok'=>false,'text'=>'Bu konuda hemen yanında güvendiğin bir yetişkinden yardım istemelisin. Yalnız kalma ve ailene ya da öğretmenine haber ver.','reason'=>'self_harm'];
    }
    if (preg_match('/(?:uyuşturucu|bomba\s+yap|silah\s+yap|birini\s+öldür|cinsel\s+ilişki|çıplak\s+foto)/iu',$value)) {
        return ['ok'=>false,'text'=>'Bu konu yaşına uygun değil. Yanında güvendiğin bir yetişkinden yardım isteyebilir veya dersine geri dönebilirsin.','reason'=>'unsafe'];
    }
    if (preg_match('/(?:^|[^\pL\pN_])(?:aptal|salak|gerizek[aâ]lı|budala|pislik|siktir|orospu|piç)(?:sın|sin|sun|sün|sınız|siniz|sunuz|sünüz|lar|ler)?(?=$|[^\pL\pN_])/iu',$value)) {
        return ['ok'=>false,'text'=>'Kırıcı veya kötü sözler kullanmayalım. Birbirimize saygılı biçimde konuşup dersimize devam edelim.','reason'=>'abusive_language'];
    }
    if (preg_match('/(?:doğru\s+(?:cevap|şık)|cevap\s+[A-D]\s*şıkkı|cevap\s*[:\-]\s*[A-D])/iu',$value)) {
        return ['ok'=>false,'text'=>'Cevabı doğrudan söylemeyeyim. Bir ipucu vereyim ve birlikte düşünelim.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/(?:cevap|sonuç|doğru\s+(?:seçenek|şık))\s*(?:(?:şudur|olur)\s*|[:\-]\s*)?(?:[A-D]\b|\d+(?:[.,]\d+)?\b|bir\b|iki\b|üç\b|dört\b|beş\b|altı\b|yedi\b|sekiz\b|dokuz\b|on\b)/iu',$value)) {
        return ['ok'=>false,'text'=>'Sonucu doğrudan vermeyeyim. İlk adımı birlikte bulalım: soruda bizden ne istendiğini söyleyebilir misin?','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/(?:doğru\s+olan\s+[A-D]\b|seçmen\s+gereken\s+[A-D]\b|[A-D]\s*şıkkını\s+seç|^\s*[A-D]\s*(?:şıkkı|seçeneği)(?:dır|dir|dur|dür)?[.!]?\s*$)/iu',$value)) {
        return ['ok'=>false,'text'=>'Doğru seçeneği doğrudan söylemeyeyim. Önce seçeneklerden hangisinin sorudaki ipucuyla eşleştiğini bulalım.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/(?:\b[A-D]\s+seçeneği\s+doğru\b|\byanıt\s*[:\-]?\s*[A-D](?:[’\x27]?(?:dır|dir|dur|dür))?\b)/iu',$value)) {
        return ['ok'=>false,'text'=>'Yanıtı doğrudan vermeyeyim. Sorudaki ipucunu kullanarak doğru seçeneği birlikte bulalım.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/(?:\d+\s*[-+×x÷\/:]\s*\d+\s*=\s*\d+|(?:\d+(?:[.,]\d+)?|bir|iki|üç|dört|beş|altı|yedi|sekiz|dokuz|on)\s+(?:eder|olur)\b)/iu',$value)) {
        return ['ok'=>false,'text'=>'İşlemin sonucunu doğrudan söylemeyeyim. Önce hangi işlemi yapacağımızı birlikte bulalım.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/\b(?:cevap|yanıt|sonuç|doğru\s+olan)\s*[:\-]?\s*(?:\d+(?:[.,]\d+)?|bir|iki|üç|dört|beş|altı|yedi|sekiz|dokuz|on)(?:[’\x27]?(?:dır|dir|dur|dür|tır|tir|tur|tür))?\b/iu',$value)) {
        return ['ok'=>false,'text'=>'Sonucu doğrudan söylemeyeyim. Sorudaki bilgileri kullanarak birlikte bulalım.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/^\s*(?:[A-D]|\d+(?:[.,]\d+)?|bir|iki|üç|dört|beş|altı|yedi|sekiz|dokuz|on)\s*[.!]?\s*$/iu',$value)) {
        return ['ok'=>false,'text'=>'Sonucu doğrudan söylemeyeyim. Önce soruda verilen bilgileri birlikte bulalım.','reason'=>'answer_key'];
    }
    return ['ok'=>true,'text'=>adimbot_ai_redact($value),'reason'=>'ok'];
}

function adimbot_ai_normalize_repeat(string $text): string {
    $value=mb_strtolower(adimbot_ai_clean($text,600),'UTF-8');
    return preg_replace('/[^\pL\pN]+/u','',$value) ?? $value;
}

function adimbot_ai_repeats_previous(string $reply, array $previous): bool {
    $normalized=adimbot_ai_normalize_repeat($reply);
    if($normalized==='') return false;
    foreach($previous as $item){
        $candidate=adimbot_ai_normalize_repeat((string)$item);
        if($candidate==='' ) continue;
        if($normalized===$candidate) return true;
        if(mb_strlen($normalized)<40 || mb_strlen($candidate)<40) continue;
        similar_text($normalized,$candidate,$percent);
        if($percent>=88.0) return true;
    }
    return false;
}

function adimbot_ai_provider_error(int $status, int $curlErrno, mixed $body=null, int $retryAfter=0): never {
    if ($curlErrno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı zamanında gelmedi.','reason'=>'provider_timeout'],504);
    }
    if ($curlErrno!==0) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ sağlayıcısına bağlantı kurulamadı.','reason'=>'provider_connection_error'],502);
    }
    $reason=adimbot_provider_reason($status,$body);
    if($reason==='provider_rate_limit' && $retryAfter>0){
        $retryAfter=max(1,min(600,$retryAfter));
        header('Retry-After: '.$retryAfter);
        adimbot_ai_json(['ok'=>false,'reason'=>$reason,'retry_after'=>$retryAfter],429);
    }
    adimbot_ai_json(['ok'=>false,'reason'=>$reason],$reason==='provider_rate_limit'?429:502);
}

function adimbot_ai_embedded_error(array $error, int $retryAfter=0): never {
    $code=strtoupper((string)($error['code'] ?? $error['status'] ?? $error['type'] ?? ''));
    if (in_array($code,['402','429'],true) || preg_match('/(?:RESOURCE_EXHAUSTED|RATE_LIMIT|QUOTA|TOO_MANY_REQUESTS)/',$code)) {
        if($retryAfter>0){
            $retryAfter=max(1,min(600,$retryAfter));
            header('Retry-After: '.$retryAfter);
            adimbot_ai_json(['ok'=>false,'message'=>'AdımBot kullanım sınırına ulaştı. Biraz sonra tekrar dene.','reason'=>'provider_rate_limit','retry_after'=>$retryAfter],429);
        }
        adimbot_ai_json(['ok'=>false,'message'=>'AdımBot kullanım sınırına ulaştı. Biraz sonra tekrar dene.','reason'=>'provider_rate_limit'],429);
    }
    if (in_array($code,['401','403'],true) || preg_match('/(?:UNAUTHENTICATED|PERMISSION_DENIED|INVALID_API_KEY|AUTH)/',$code)) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ erişim anahtarı sağlayıcı tarafından reddedildi.','reason'=>'provider_auth_error'],502);
    }
    if (in_array($code,['400','404','422'],true) || preg_match('/(?:INVALID_ARGUMENT|NOT_FOUND|MODEL|BAD_REQUEST)/',$code)) {
        adimbot_ai_json(['ok'=>false,'message'=>'Seçilen yapay zekâ modeli veya istek ayarı kabul edilmedi.','reason'=>'provider_config_error'],502);
    }
    adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ sağlayıcısı isteği tamamlayamadı.','reason'=>'provider_error'],502);
}

app_session_start();

if ($_SERVER['REQUEST_METHOD']!=='POST') {
    adimbot_ai_json(['ok'=>false,'message'=>'Yalnızca POST desteklenir.'],405);
}

$role=(string)($_SESSION['aktif_rol'] ?? '');
$studentId=(int)($_SESSION['ogrenci_id'] ?? 0);
$userId=(int)($_SESSION['kullanici_id'] ?? 0);
if ($role!=='ogrenci' || $studentId<=0 || $userId<=0) {
    adimbot_ai_json(['ok'=>false,'message'=>'Bu özellik yalnızca öğrenci hesabında kullanılabilir.','reason'=>'auth'],403);
}

$csrf=(string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? '');
if (!verify_csrf($csrf)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar deneyebilirsin.','reason'=>'csrf'],403);
}

$contentType=strtolower((string)($_SERVER['CONTENT_TYPE'] ?? ''));
if ($contentType!=='' && !str_starts_with($contentType,'application/json')) {
    adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz istek biçimi.','reason'=>'content_type'],415);
}

$origin=(string)($_SERVER['HTTP_ORIGIN'] ?? '');
if ($origin!=='') {
    $host=(string)($_SERVER['HTTP_HOST'] ?? '');
    $originHost=(string)(parse_url($origin,PHP_URL_HOST) ?? '');
    if ($originHost==='' || strcasecmp(preg_replace('/:\d+$/','',$host) ?? $host,$originHost)!==0) {
        adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz istek kaynağı.','reason'=>'origin'],403);
    }
}

$raw=file_get_contents('php://input');
if (!is_string($raw) || strlen($raw)>12000) {
    adimbot_ai_json(['ok'=>false,'message'=>'İstek çok büyük.'],413);
}
$payload=json_decode($raw,true);
if (!is_array($payload)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz JSON.'],400);
}

$messageRaw=adimbot_ai_clean($payload['message'] ?? '',400);
if ($messageRaw==='') {
    adimbot_ai_json(['ok'=>false,'message'=>'Bir soru yazmalısın.'],400);
}

if (($blocked=adimbot_ai_input_safety($messageRaw))!==null) {
    adimbot_ai_json(['ok'=>true,'blocked'=>true,'reason'=>$blocked['reason'],'text'=>$blocked['text']]);
}
$message=adimbot_ai_redact($messageRaw);

$config=require dirname(__DIR__) . '/config/app.php';
$ai=is_array($config['ai'] ?? null)?$config['ai']:[];
$enabled=($ai['enabled'] ?? true)!==false;
$provider=strtolower(trim((string)($ai['provider'] ?? 'openai')));
$apiKey=match ($provider) {
    'groq'=>adimbot_ai_resolve_key($ai['groq_api_key'] ?? '', 'GROQ_API_KEY'),
    'gemini'=>adimbot_ai_resolve_key($ai['gemini_api_key'] ?? '', 'GEMINI_API_KEY'),
    default=>adimbot_ai_resolve_key($ai['api_key'] ?? '', 'OPENAI_API_KEY', true),
};
$model=trim((string)($ai['model'] ?? 'gpt-6-astra'));
$timeout=max(5,min(40,(int)($ai['timeout_seconds'] ?? 20)));

$configurationReason = !$enabled ? 'ai_disabled'
    : (!in_array($provider,['openai','groq','gemini'],true) ? 'provider_invalid'
    : ($model==='' ? 'model_missing'
    : ($apiKey==='' || adimbot_ai_placeholder_key($apiKey) ? 'api_key_missing' : '')));
if ($configurationReason!=='') {
    adimbot_ai_json(['ok'=>false,'configured'=>false,'reason'=>$configurationReason],503);
}
if (!function_exists('curl_init')) {
    adimbot_ai_json(['ok'=>false,'message'=>'Sunucuda yapay zekâ bağlantısı için cURL etkin değil.','reason'=>'curl_missing'],500);
}
$modelInvalid=($provider==='gemini' && !preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$model))
    || ($provider==='groq' && (str_starts_with($model,'gemini-') || str_starts_with($model,'gpt-')))
    || ($provider==='openai' && (str_starts_with($model,'gemini-') || str_starts_with($model,'llama-')));
if ($modelInvalid) {
    adimbot_ai_json(['ok'=>false,'message'=>'Seçilen model sohbet sağlayıcısıyla uyumlu değil.','reason'=>'provider_config_error'],500);
}

$now=time();
$window=600;
$limit=max(3,min(60,(int)($ai['max_requests_per_10_minutes'] ?? 20)));
$rateResult=['persistent'=>false,'blocked'=>false,'retry_after'=>0];
if(function_exists('db')){
    try{
        $rateResult=adimbot_rate_limit_check_and_record(
            db(),
            'chat',
            $studentId,
            mb_substr((string)($_SERVER['REMOTE_ADDR'] ?? ''),0,45),
            $limit,
            $window
        );
    }catch(Throwable){
        $rateResult=['persistent'=>false,'blocked'=>false,'retry_after'=>0];
    }
}

if(($rateResult['persistent']??false)===true){
    unset($_SESSION['adimbot_ai_requests']);
    session_write_close();
    if(($rateResult['blocked']??false)===true){
        $retryAfter=max(1,min($window,(int)($rateResult['retry_after']??$window)));
        header('Retry-After: '.$retryAfter);
        adimbot_ai_json([
            'ok'=>false,
            'message'=>'AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.',
            'reason'=>'rate_limit',
            'retry_after'=>$retryAfter
        ],429);
    }
}else{
    // DB limiter yoksa mevcut session koruması güvenli fallback olarak kalır.
    $requests=is_array($_SESSION['adimbot_ai_requests'] ?? null)?$_SESSION['adimbot_ai_requests']:[];
    $requests=array_values(array_filter(array_map('intval',$requests),static fn(int $ts):bool=>$ts>$now-$window));
    if(count($requests)>=$limit){
        $_SESSION['adimbot_ai_requests']=$requests;
        $retryAfter=max(1,min($window,$requests[0]+$window-$now));
        header('Retry-After: '.$retryAfter);
        adimbot_ai_json([
            'ok'=>false,
            'message'=>'AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.',
            'reason'=>'rate_limit',
            'retry_after'=>$retryAfter
        ],429);
    }
    $requests[]=$now;
    $_SESSION['adimbot_ai_requests']=$requests;
    session_write_close();
}

$context=is_array($payload['context'] ?? null)?$payload['context']:[];
$allowed=[];
foreach (['screen'=>80,'lesson'=>80,'topic'=>80,'activity'=>80,'question'=>240,'practiceLesson'=>80,'reviewLesson'=>80,'reviewReason'=>24,'learningMode'=>20] as $key=>$max) {
    if (!isset($context[$key])) continue;
    $value=adimbot_ai_redact(adimbot_ai_clean($context[$key],$max));
    if ($value!=='') $allowed[$key]=$value;
}
foreach (['completedSteps','gamesCompleted','readingsCompleted','lessonAttempts','lessonCorrect','lessonWrong','lessonSteps'] as $key) {
    if (!isset($context[$key]) || !is_numeric($context[$key])) continue;
    $allowed[$key]=max(0,min(9999,(int)round((float)$context[$key])));
}

$contextText='';
foreach ($allowed as $key=>$value) {
    $contextText.=$key.': '.$value."\n";
}

$history=is_array($payload['history'] ?? null)?$payload['history']:[];
$historyLines=[];
$previousAssistantReplies=[];
foreach (array_slice($history,-6) as $item) {
    if (!is_array($item)) continue;
    $role=(string)($item['role'] ?? '');
    if (!in_array($role,['user','assistant'],true)) continue;
    $text=adimbot_ai_redact(adimbot_ai_clean($item['text'] ?? '',300));
    if ($text==='') continue;
    if (adimbot_ai_input_safety($text)!==null) continue;
    if ($role==='assistant') $previousAssistantReplies[]=$text;
    $historyLines[]=($role==='user'?'Öğrenci':'AdımBot').': '.$text;
}
$historyText=implode("\n",$historyLines);

$instructions=<<<'TXT'
Sen İlkAdım adlı 1. sınıf eğitim uygulamasındaki AdımBot'sun.
Türkçe, kısa, sıcak, çocukların anlayacağı basit cümlelerle konuş.
Yeni mesaja doğrudan karşılık ver. Bağlamda olmayan ders, kişi, başarı veya olay uydurma; yeterli bilgi yoksa tek bir kısa soru sor.
Selamlaşma, hobiler, oyunlar, hayvanlar ve gündelik konularda doğal sohbet et; her konuşmayı derse veya bir soruna yönlendirme.
Öğrenci açıkça sormadıkça seslendirme, mikrofon, kayıt veya teknik özellikleri anlatma.
Öğrenci sıkıntı belirtmediyse üzgün, kaygılı veya yardıma muhtaç olduğunu varsayma; durduk yere teselli ve öğüt verme.
Önceki AdımBot yanıtını aynen veya küçük değişikliklerle tekrarlama. Her yanıta aynı selam, övgü ya da başlangıç kalıbıyla başlama.
Ders sorusuna yardım istendiğinde öğretici ipucu ver; aktif soru/şık varsa doğru cevabı veya doğru şıkkı doğrudan söyleme.
Aktif soruda işlemi tamamlayıp sonucu yazma; eşitlik, “... eder” veya çözülmüş örnek yoluyla cevabı dolaylı biçimde de verme.
Ders sorusu için yardım istendiğinde önce düşünmesini sağlayan bir ipucu, gerekirse küçük bir örnek ver; gündelik muhabbette doğrudan konuya karşılık ver.
Ekran bağlamındaki ders, konu, etkinlik, aktif soru ve öğrenme ilerlemesini yalnız öğrenci öğrenme yardımı istediğinde kullan; öğrenciyi "zayıf", "başarısız" veya benzeri bir etiketle tanımlama.
İlerleme sayıları yalnızca desteğin seviyesini ayarlamak içindir; öğrenciyle kıyaslama yapma ve gereksiz yere sayıları tekrar etme.
learningMode "together" ve öğrenci ders yardımı istiyorsa tek seferde yalnızca bir küçük düşünme adımı sor ve öğrencinin yanıtını bekle; soruyu onun yerine çözme.
practiceLesson varsa bunu kesin bir yetersizlik olarak değil, biraz daha pratik yapılabilecek ders bağlamı olarak ele al.
reviewLesson varsa bunu yalnız ders çalışmak veya tekrar yapmak istendiğinde kullan; gündelik muhabbete tekrar önerisi ekleme.
reviewReason yalnızca tekrar zamanlamasını ayarlamak içindir; bunu öğrenciye teknik kod olarak söyleme.
Adres, telefon, e-posta, şifre, kimlik, tam ad, konum veya özel iletişim bilgisi isteme.
Dış bağlantı verme, başka uygulamaya/kişiye yönlendirme, özel iletişim veya buluşma teklif etme.
HTML, Markdown linki, kod, URL, araç çağrısı, komut veya uygulama eylemi üretme.
Yanıtı mümkünse 1-4 kısa cümlede ve en fazla 600 karakterde tut.
Tehlikeli veya yaşa uygun olmayan bir konuda güvendiği bir yetişkinden yardım istemesini söyle.
Öğrenciye hakaret etme, onu küçümseme, korkutma veya kırıcı söz kullanma.
TXT;

$input="Ekran bağlamı:\n".($contextText!==''?$contextText:"Genel öğrenci ekranı\n");
if ($historyText!=='') {
    $input.="\nKısa sohbet geçmişi:\n".$historyText."\n";
}
$input.="\nÖğrencinin yeni mesajı:\n".$message;

$request=$provider==='gemini'
    ?['systemInstruction'=>['parts'=>[['text'=>$instructions]]],
       'contents'=>[['role'=>'user','parts'=>[['text'=>$input]]]],
       'generationConfig'=>['maxOutputTokens'=>600]]
    :($provider==='groq'
    ?['model'=>$model,'messages'=>[
        ['role'=>'system','content'=>$instructions],
        ['role'=>'user','content'=>$input],
    ],'max_tokens'=>220]
    :['model'=>$model,'instructions'=>$instructions,'input'=>$input,'max_output_tokens'=>220]);

$endpoint=match ($provider) {
    'groq'=>'https://api.groq.com/openai/v1/chat/completions',
    'gemini'=>'https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model).':generateContent',
    default=>'https://api.openai.com/v1/responses',
};
$providerRetryAfter=0;
if ($provider==='groq') {
    $groqResult=adimbot_groq_request($request,$apiKey,$timeout);
    $responseBody=$groqResult['body'];
    $status=$groqResult['status'];
    $curlErrno=$groqResult['errno'];
    $providerRetryAfter=(int)($groqResult['retry_after'] ?? 0);
    $model=$groqResult['model'];
} else {
    $ch=curl_init($endpoint);
    if ($ch===false) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ bağlantısı başlatılamadı.','reason'=>'provider_connection_error'],502);
    }
    $encodedRequest=json_encode($request,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    if (!is_string($encodedRequest)) {
        curl_close($ch);
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ isteği hazırlanamadı.','reason'=>'invalid_request'],500);
    }
    if (!curl_setopt_array($ch,[
        CURLOPT_POST=>true,
        CURLOPT_RETURNTRANSFER=>true,
        CURLOPT_CONNECTTIMEOUT=>8,
        CURLOPT_TIMEOUT=>$timeout,
        CURLOPT_HTTPHEADER=>$provider==='gemini'
            ?['x-goog-api-key: '.$apiKey,'Content-Type: application/json']
            :['Authorization: Bearer '.$apiKey,'Content-Type: application/json'],
        CURLOPT_HEADERFUNCTION=>static function($curl,string $line) use (&$providerRetryAfter): int {
            $length=strlen($line);
            $parts=explode(':',$line,2);
            if(count($parts)===2 && strcasecmp(trim($parts[0]),'Retry-After')===0){
                $providerRetryAfter=adimbot_retry_after_seconds(trim($parts[1]));
            }
            return $length;
        },
        CURLOPT_POSTFIELDS=>$encodedRequest,
    ])) {
        curl_close($ch);
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ bağlantısı hazırlanamadı.','reason'=>'provider_connection_error'],502);
    }
    $responseBody=curl_exec($ch);
    $curlErrno=curl_errno($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    curl_close($ch);

}

if (!is_string($responseBody) || $responseBody==='' || $status<200 || $status>=300) {
    adimbot_ai_provider_error($status,$curlErrno,$responseBody,$providerRetryAfter);
}

$decoded=json_decode($responseBody,true);
if (!is_array($decoded)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı okunamadı.','reason'=>'invalid_provider_response'],502);
}
if (is_array($decoded['error'] ?? null)) adimbot_ai_embedded_error($decoded['error'],$providerRetryAfter);

$providerBlocked=($provider==='gemini' && (
        trim((string)($decoded['promptFeedback']['blockReason'] ?? ''))!==''
        || in_array((string)($decoded['candidates'][0]['finishReason'] ?? ''),['SAFETY','PROHIBITED_CONTENT','BLOCKLIST'],true)
    ))
    || ($provider==='groq' && (string)($decoded['choices'][0]['finish_reason'] ?? '')==='content_filter');
if ($providerBlocked) {
    adimbot_ai_json([
        'ok'=>true,
        'configured'=>true,
        'blocked'=>true,
        'reason'=>'provider_safety',
        'text'=>'Bu konuya güvenli biçimde yanıt veremem. İstersen dersine uygun başka bir soruyu birlikte düşünelim.'
    ]);
}
$providerIncomplete=($provider==='gemini' && (string)($decoded['candidates'][0]['finishReason'] ?? '')==='MAX_TOKENS')
    || ($provider==='groq' && (string)($decoded['choices'][0]['finish_reason'] ?? '')==='length')
    || ($provider==='openai' && ((string)($decoded['status'] ?? '')==='incomplete' || isset($decoded['incomplete_details'])));
if ($providerIncomplete) {
    adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı tamamlanmadan kesildi.','reason'=>'provider_incomplete'],502);
}

$text=match ($provider) {
    'groq'=>adimbot_ai_extract_chat_text($decoded),
    'gemini'=>adimbot_ai_extract_gemini_text($decoded),
    default=>adimbot_ai_extract_text($decoded),
};
$safe=adimbot_ai_safe_output($text,isset($allowed['question']));
if ($safe['ok'] && adimbot_ai_repeats_previous($safe['text'],$previousAssistantReplies)) {
    $safe=['ok'=>false,'text'=>'Bunu az önce konuşmuştuk. Bu konuda başka neyi merak ediyorsun?','reason'=>'repeated_response'];
}

adimbot_ai_json([
    'ok'=>true,
    'configured'=>true,
    'blocked'=>!$safe['ok'],
    'reason'=>$safe['reason'],
    'text'=>$safe['text'],
]);
