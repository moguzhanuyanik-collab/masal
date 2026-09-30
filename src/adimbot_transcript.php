<?php
declare(strict_types=1);

/** Validate provider text without silently truncating the student's words. */
function adimbot_transcript_result(string $text): array {
    $length=preg_match_all('/./us',$text);
    if ($length===false) return ['ok'=>false,'reason'=>'invalid_provider_response'];
    if ($length>4000) return ['ok'=>false,'reason'=>'too_long'];
    $normalized=strtr($text,['İ'=>'i','I'=>'i','ı'=>'i']);
    $noise='/^(?:[\[(](?:müzik|music|sessizlik|silence|gürültü|noise|alkiş|applause|anlaşilmayan\s+ses|blank[_ ]audio|no[_ ]speech|konuşma\s+yok)[\])]|(?:ses|konuşma)\s+(?:algilanmadi|bulunamadi)|blank[_ ]audio|no[_ ]speech|anlaşilmayan\s+ses|konuşma\s+yok)[.!]?$/iu';
    if ($text==='' || preg_match($noise,$normalized) || !preg_match('/[\p{L}\p{N}]/u',$text)) return ['ok'=>false,'reason'=>'empty'];
    return ['ok'=>true,'text'=>$text];
}
