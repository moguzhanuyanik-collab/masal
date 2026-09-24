<?php
declare(strict_types=1);

require dirname(__DIR__) . '/src/auth.php';

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

function adimbot_ai_redact(string $text): string {
    $text=preg_replace('/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/iu','[e-posta gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?:https?:\/\/|www\.)\S+/iu','[bağlantı gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)(?:\+?90[\s.\-]?)?(?:0?[2-5]\d{2})[\s.\-]?\d{3}[\s.\-]?\d{2}[\s.\-]?\d{2}(?!\d)/u','[telefon gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)\d{11}(?!\d)/u','[kimlik bilgisi gizlendi]',$text) ?? $text;
    return $text;
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

function adimbot_ai_safe_output(string $text): array {
    $value=adimbot_ai_redact(adimbot_ai_clean($text,600));
    if ($value==='') return ['ok'=>false,'text'=>'Şu anda yanıt oluşturamadım. İstersen soruyu başka türlü soralım.','reason'=>'empty'];

    if (preg_match('/(?:telefon(?:unu| numaranı)|adres(?:ini|ini söyle)|e[- ]?posta(?:nı| adresini)|şifre(?:ni)?|tc\s*(?:kimlik)?)/iu',$value)) {
        return ['ok'=>false,'text'=>'Kişisel bilgilerini paylaşmana gerek yok. Dersine güvenli şekilde devam edelim.','reason'=>'privacy'];
    }
    if (preg_match('/(?:https?:\/\/|www\.|whatsapp|instagram|telegram|discord|snapchat|özelden\s+yaz|buluşalım)/iu',$value)) {
        return ['ok'=>false,'text'=>'Seni başka bir uygulamaya veya kişiye yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.','reason'=>'external_contact'];
    }
    if (preg_match('/(?:doğru\s+(?:cevap|şık)|cevap\s+[A-D]\s*şıkkı|cevap\s*[:\-]\s*[A-D])/iu',$value)) {
        return ['ok'=>false,'text'=>'Cevabı doğrudan söylemeyeyim. Bir ipucu vereyim ve birlikte düşünelim.','reason'=>'answer_key'];
    }
    return ['ok'=>true,'text'=>$value,'reason'=>'ok'];
}

app_session_start();

if ($_SERVER['REQUEST_METHOD']!=='POST') {
    adimbot_ai_json(['ok'=>false,'message'=>'Yalnızca POST desteklenir.'],405);
}

$role=(string)($_SESSION['aktif_rol'] ?? '');
$studentId=(int)($_SESSION['ogrenci_id'] ?? 0);
$userId=(int)($_SESSION['kullanici_id'] ?? 0);
if ($role!=='ogrenci' || $studentId<=0 || $userId<=0) {
    adimbot_ai_json(['ok'=>false,'message'=>'Bu özellik yalnızca öğrenci hesabında kullanılabilir.'],403);
}

$origin=(string)($_SERVER['HTTP_ORIGIN'] ?? '');
if ($origin!=='') {
    $host=(string)($_SERVER['HTTP_HOST'] ?? '');
    $originHost=(string)(parse_url($origin,PHP_URL_HOST) ?? '');
    if ($originHost==='' || strcasecmp(preg_replace('/:\d+$/','',$host) ?? $host,$originHost)!==0) {
        adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz istek kaynağı.'],403);
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

$message=adimbot_ai_redact(adimbot_ai_clean($payload['message'] ?? '',400));
if ($message==='') {
    adimbot_ai_json(['ok'=>false,'message'=>'Bir soru yazmalısın.'],400);
}

if (preg_match('/(?:doğru\s+cevap|cevabı\s+(?:söyle|ver)|hangi\s+şık|cevap\s+ne|doğru\s+şık|şık\s+hangisi)/iu',$message)) {
    adimbot_ai_json(['ok'=>true,'blocked'=>true,'reason'=>'answer_key','text'=>'Cevabı doğrudan söylemeyeyim. Sorudaki önemli kelimeleri bulalım ve seçenekleri birlikte eleyelim.']);
}
if (preg_match('/(?:adres(?:in|ini)?|telefon(?:un|unu|\s*numara)|e[- ]?posta(?:n|nı)?|şifre(?:n|ni)?|tc\s*(?:kimlik)?|kimlik\s*numara|konum(?:un|unu)?)/iu',$message)) {
    adimbot_ai_json(['ok'=>true,'blocked'=>true,'reason'=>'privacy','text'=>'Kişisel bilgilerini paylaşmana gerek yok. Adres, telefon, e-posta, şifre veya kimlik bilgisi istemeden devam edelim.']);
}

$now=time();
$window=600;
$requests=is_array($_SESSION['adimbot_ai_requests'] ?? null)?$_SESSION['adimbot_ai_requests']:[];
$requests=array_values(array_filter(array_map('intval',$requests),static fn(int $ts):bool=>$ts>$now-$window));

$config=require dirname(__DIR__) . '/config/app.php';
$ai=is_array($config['ai'] ?? null)?$config['ai']:[];
$limit=max(3,min(60,(int)($ai['max_requests_per_10_minutes'] ?? 20)));
if (count($requests)>=$limit) {
    $_SESSION['adimbot_ai_requests']=$requests;
    adimbot_ai_json(['ok'=>false,'message'=>'AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.','reason'=>'rate_limit'],429);
}
$requests[]=$now;
$_SESSION['adimbot_ai_requests']=$requests;

$enabled=($ai['enabled'] ?? true)!==false;
$provider=strtolower(trim((string)($ai['provider'] ?? 'openai')));
$apiKey=trim((string)(getenv('OPENAI_API_KEY') ?: ($ai['api_key'] ?? '')));
$model=trim((string)($ai['model'] ?? 'gpt-6-astra'));
$timeout=max(5,min(40,(int)($ai['timeout_seconds'] ?? 20)));

if (!$enabled || $provider!=='openai' || $apiKey==='' || $apiKey==='OPENAI_API_ANAHTARINIZ') {
    adimbot_ai_json([
        'ok'=>false,
        'configured'=>false,
        'reason'=>'provider_disabled',
        'text'=>'AdımBot yapay zekâ bağlantısı henüz yapılandırılmamış. Profildeki diğer AdımBot özelliklerini kullanmaya devam edebilirsin.'
    ],503);
}

$context=is_array($payload['context'] ?? null)?$payload['context']:[];
$allowed=[];
foreach (['screen'=>80,'lesson'=>80,'topic'=>80,'activity'=>80,'question'=>240] as $key=>$max) {
    if (!isset($context[$key])) continue;
    $value=adimbot_ai_redact(adimbot_ai_clean($context[$key],$max));
    if ($value!=='') $allowed[$key]=$value;
}

$contextText='';
foreach ($allowed as $key=>$value) {
    $contextText.=$key.': '.$value."\n";
}

$instructions=<<<'TXT'
Sen İlkAdım adlı 1. sınıf eğitim uygulamasındaki AdımBot'sun.
Türkçe, kısa, sıcak, çocukların anlayacağı basit cümlelerle konuş.
Öğrenciye öğretici ipucu ver; aktif soru/şık varsa doğru cevabı veya doğru şıkkı doğrudan söyleme.
Önce düşünmesini sağlayan bir ipucu, gerekirse küçük bir örnek ver.
Adres, telefon, e-posta, şifre, kimlik, tam ad, konum veya özel iletişim bilgisi isteme.
Dış bağlantı verme, başka uygulamaya/kişiye yönlendirme, özel iletişim veya buluşma teklif etme.
HTML, Markdown linki, kod, URL, araç çağrısı, komut veya uygulama eylemi üretme.
Yanıtı mümkünse 1-4 kısa cümlede ve en fazla 600 karakterde tut.
Tehlikeli veya yaşa uygun olmayan bir konuda güvendiği bir yetişkinden yardım istemesini söyle.
TXT;

$input="Ekran bağlamı:\n".($contextText!==''?$contextText:"Genel öğrenci ekranı\n")."\nÖğrencinin mesajı:\n".$message;

$request=[
    'model'=>$model,
    'instructions'=>$instructions,
    'input'=>$input,
    'max_output_tokens'=>220,
];

if (!function_exists('curl_init')) {
    adimbot_ai_json(['ok'=>false,'message'=>'Sunucuda yapay zekâ bağlantısı için cURL etkin değil.','reason'=>'curl_missing'],500);
}

$ch=curl_init('https://api.openai.com/v1/responses');
curl_setopt_array($ch,[
    CURLOPT_POST=>true,
    CURLOPT_RETURNTRANSFER=>true,
    CURLOPT_CONNECTTIMEOUT=>8,
    CURLOPT_TIMEOUT=>$timeout,
    CURLOPT_HTTPHEADER=>[
        'Authorization: Bearer '.$apiKey,
        'Content-Type: application/json',
    ],
    CURLOPT_POSTFIELDS=>json_encode($request,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),
]);
$responseBody=curl_exec($ch);
$curlError=curl_error($ch);
$status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
curl_close($ch);

if (!is_string($responseBody) || $responseBody==='' || $status<200 || $status>=300) {
    adimbot_ai_json([
        'ok'=>false,
        'message'=>'AdımBot şu anda yapay zekâ yanıtına ulaşamadı.',
        'reason'=>'provider_error',
        'detail'=>$status>0?'HTTP '.$status:($curlError!==''?'connection_error':'empty_response')
    ],502);
}

$decoded=json_decode($responseBody,true);
if (!is_array($decoded)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı okunamadı.','reason'=>'invalid_provider_response'],502);
}

$text=adimbot_ai_extract_text($decoded);
$safe=adimbot_ai_safe_output($text);

adimbot_ai_json([
    'ok'=>true,
    'configured'=>true,
    'blocked'=>!$safe['ok'],
    'reason'=>$safe['reason'],
    'text'=>$safe['text'],
]);
