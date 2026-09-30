<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/adimbot_transcript.php';
function check(bool $ok,string $name): void {if(!$ok)throw new RuntimeException($name);}
foreach(['A','İ','2','Müzik','Alkış','Merhaba nasılsın?'] as $text)check(adimbot_transcript_result($text)['text']===$text,'valid '.$text);
foreach(['[ALKIŞ]','[alkış]','(Anlaşılmayan ses)','[BLANK_AUDIO]','[NO_SPEECH]','Konuşma yok','Konuşma algılanmadı','...',''] as $text)check(adimbot_transcript_result($text)['reason']==='empty','noise '.$text);
$long=str_repeat('ş',401);check(adimbot_transcript_result($long)['text']===$long,'long editing preserved');
check(adimbot_transcript_result(str_repeat('a',4001))['reason']==='too_long','hard bound');
check(adimbot_transcript_result("\xFF")['reason']==='invalid_provider_response','invalid utf8');
echo "PASS: short education input, Turkish noise sentinels, full long text, hard limit and invalid UTF8.\n";
