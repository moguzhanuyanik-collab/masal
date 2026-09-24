<?php
declare(strict_types=1);

function normalized_table_exists(PDO $pdo,string $table):bool{
    $s=$pdo->prepare('SHOW TABLES LIKE ?');$s->execute([$table]);return (bool)$s->fetchColumn();
}
function normalized_column_exists(PDO $pdo,string $table,string $column):bool{
    if(!normalized_table_exists($pdo,$table))return false;
    $s=$pdo->prepare("SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name=?");
    $s->execute([$table,$column]);return (int)$s->fetchColumn()>0;
}
function normalized_student_grade(PDO $pdo,int $studentId):int{
    if($studentId<=0||!normalized_column_exists($pdo,'ogrenciler','sinif_seviyesi'))return 1;
    $s=$pdo->prepare('SELECT sinif_seviyesi FROM ogrenciler WHERE id=? LIMIT 1');$s->execute([$studentId]);
    return max(1,min(12,(int)($s->fetchColumn()?:1)));
}
function normalized_datetime(mixed $v):string{
    $ms=is_numeric($v)?(int)$v:(int)(microtime(true)*1000);
    if($ms<946684800000||$ms>4102444800000)$ms=(int)(microtime(true)*1000);
    return date('Y-m-d H:i:s',(int)floor($ms/1000));
}
function normalized_longest_streak(array $days):int{
    $days=array_values(array_unique(array_filter(array_map('strval',$days),static fn(string $d):bool=>(bool)preg_match('/^\\d{4}-\\d{2}-\\d{2}$/',$d))));
    sort($days,SORT_STRING);if(!$days)return 0;$best=$cur=1;
    for($i=1,$n=count($days);$i<$n;$i++){ $p=new DateTimeImmutable($days[$i-1]);$cur=$p->modify('+1 day')->format('Y-m-d')===$days[$i]?$cur+1:1;$best=max($best,$cur); }
    return $best;
}
function normalized_badges(PDO $pdo,array $state,int $studentId=0):array{
    $steps=[];foreach(($state['steps']??[]) as $k)if(preg_match('/^([a-z0-9_-]+)-(\\d+)$/i',(string)$k,$m))$steps[$m[1]][(int)$m[2]]=true;
    $grade=normalized_student_grade($pdo,$studentId);$counts=[];
    if(normalized_table_exists($pdo,'sinif_dersleri')&&normalized_column_exists($pdo,'ders_modulleri','sinif_seviyesi')){
        $q=$pdo->prepare("SELECT d.kod,COUNT(m.id) modul_sayisi FROM dersler d INNER JOIN sinif_dersleri sd ON sd.ders_id=d.id AND sd.sinif_seviyesi=? AND sd.aktif=1 LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.sinif_seviyesi=? AND m.aktif=1 WHERE d.aktif=1 GROUP BY d.id,d.kod");
        $q->execute([$grade,$grade]);$rows=$q->fetchAll();
    }else{
        $rows=$pdo->query("SELECT d.kod,COUNT(m.id) modul_sayisi FROM dersler d LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.aktif=1 WHERE d.aktif=1 GROUP BY d.id,d.kod")?:[];
    }
    foreach($rows as $r)$counts[(string)$r['kod']]=(int)$r['modul_sayisi'];
    $complete=0;foreach($counts as $c=>$n)if($n>0&&count($steps[$c]??[])>=$n)$complete++;
    $games=array_fill_keys(array_map('strval',$state['games']??[]),true);$math=0;
    foreach(($state['attempts']??[]) as $a)if(is_array($a)&&($a['lesson']??'')==='matematik'&&($a['correct']??false)===true)$math++;
    $streak=normalized_longest_streak((array)($state['days']??[]));$out=[];
    if(count((array)($state['steps']??[]))>=1)$out[]='ilk_adim';
    if($complete>=1)$out[]='merakli_okur';
    if($games)$out[]='oyun_kasifi';
    if(isset($games['renkler']))$out[]='renk_ustasi';
    if($streak>=3)$out[]='istikrarli_kasif';
    if($counts&&$complete>=count($counts))$out[]='buyuk_kasif';
    if($math>=10)$out[]='sayi_dostu';
    if(!empty($state['readings']))$out[]='ilk_hikayem';
    if($streak>=7)$out[]='yedi_gunluk_kasif';
    if(($counts['turkce']??0)>0&&count($steps['turkce']??[])>=$counts['turkce'])$out[]='turkce_ustasi';
    return $out;
}
function normalized_sync(PDO $pdo,int $studentId,array $input):void{
    if(!normalized_table_exists($pdo,'ogrenci_ilerleme'))return;
    $state=sanitize_state($input);
    $grade=normalized_student_grade($pdo,$studentId);
    $gradeProgress=normalized_column_exists($pdo,'ogrenci_ilerleme','sinif_seviyesi');
    $gradeAnswers=normalized_column_exists($pdo,'ogrenci_cevaplari','sinif_seviyesi');
    foreach(['ogrenci_ilerleme','ogrenci_cevaplari','favoriler','oyun_tamamlamalari','okuma_kayitlari','calisma_oturumlari','gunluk_kullanim','ogrenci_rozetleri','gunluk_gorevler'] as $t){
        if(!normalized_table_exists($pdo,$t))continue;
        if($t==='ogrenci_ilerleme'&&$gradeProgress){$q=$pdo->prepare('DELETE FROM ogrenci_ilerleme WHERE ogrenci_id=? AND sinif_seviyesi=?');$q->execute([$studentId,$grade]);continue;}
        if($t==='ogrenci_cevaplari'&&$gradeAnswers){$q=$pdo->prepare('DELETE FROM ogrenci_cevaplari WHERE ogrenci_id=? AND sinif_seviyesi=?');$q->execute([$studentId,$grade]);continue;}
        $q=$pdo->prepare("DELETE FROM {$t} WHERE ogrenci_id=?");$q->execute([$studentId]);
    }
    $s=$gradeProgress?$pdo->prepare('INSERT INTO ogrenci_ilerleme (ogrenci_id,sinif_seviyesi,ders_kodu,modul_indeksi,tamamlandi) VALUES (?,?,?,?,1)'):$pdo->prepare('INSERT INTO ogrenci_ilerleme (ogrenci_id,ders_kodu,modul_indeksi,tamamlandi) VALUES (?,?,?,1)');
    foreach($state['steps'] as $k)if(preg_match('/^([a-z0-9_-]+)-(\\d+)$/i',(string)$k,$m))$s->execute($gradeProgress?[$studentId,$grade,$m[1],(int)$m[2]]:[$studentId,$m[1],(int)$m[2]]);
    $s=$pdo->prepare('INSERT INTO favoriler (ogrenci_id,ders_kodu) VALUES (?,?)');
    foreach($state['favorites'] as $c)if(preg_match('/^[a-z0-9_-]{1,50}$/i',(string)$c))$s->execute([$studentId,(string)$c]);
    $s=$pdo->prepare('INSERT INTO oyun_tamamlamalari (ogrenci_id,oyun_kodu) VALUES (?,?)');
    foreach($state['games'] as $c)if(preg_match('/^[a-z0-9_-]{1,50}$/i',(string)$c))$s->execute([$studentId,(string)$c]);
    $s=$gradeAnswers?$pdo->prepare('INSERT INTO ogrenci_cevaplari (ogrenci_id,sinif_seviyesi,ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi) VALUES (?,?,?,?,?,?,?,?)'):$pdo->prepare('INSERT INTO ogrenci_cevaplari (ogrenci_id,ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi) VALUES (?,?,?,?,?,?,?)');
    foreach(array_reverse($state['attempts']) as $a){
        if(!is_array($a)||trim((string)($a['lesson']??''))==='')continue;
        $sel=json_encode($a['selected']??null,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        $args=[$studentId,mb_substr((string)$a['lesson'],0,50),mb_substr((string)($a['index']??''),0,190),$sel===false?null:$sel,($a['correct']??false)===true?1:0,max(0,min(3600000,(int)($a['ms']??0))),normalized_datetime($a['at']??null)];
        if($gradeAnswers)array_splice($args,1,0,[$grade]);
        $s->execute($args);
    }
    $s=$pdo->prepare('INSERT INTO okuma_kayitlari (ogrenci_id,hikaye_kodu,okuma_tarihi) VALUES (?,?,?)');
    foreach(array_reverse($state['readings']) as $r)if(is_array($r)&&trim((string)($r['id']??''))!=='')$s->execute([$studentId,mb_substr((string)$r['id'],0,50),normalized_datetime($r['at']??null)]);
    $s=$pdo->prepare('INSERT INTO calisma_oturumlari (ogrenci_id,olay_turu,olay_anahtari,baslik,tamamlanma_tarihi) VALUES (?,?,?,?,?)');
    foreach(array_reverse($state['history']) as $h){
        if(!is_array($h)||empty($h['type'])||empty($h['id'])||empty($h['title']))continue;
        $s->execute([$studentId,mb_substr((string)$h['type'],0,30),mb_substr((string)$h['id'],0,190),mb_substr((string)$h['title'],0,255),normalized_datetime($h['at']??null)]);
    }
    $s=$pdo->prepare('INSERT INTO gunluk_kullanim (ogrenci_id,tarih,sure_saniye) VALUES (?,?,?)');
    foreach($state['usage'] as $d=>$sec)if(preg_match('/^\\d{4}-\\d{2}-\\d{2}$/',(string)$d))$s->execute([$studentId,(string)$d,max(0,min(86400,(int)round((float)$sec)))]);
    $reads=[];foreach($state['readings'] as $r)if(is_array($r)&&isset($r['id']))$reads[(string)$r['id']]=true;
    $stars=count($state['steps'])+count($state['games'])+count($reads)+count($state['claimed'])*2;
    $pdo->prepare('INSERT INTO ogrenci_yildizlari (ogrenci_id,toplam_yildiz) VALUES (?,?) ON DUPLICATE KEY UPDATE toplam_yildiz=VALUES(toplam_yildiz)')->execute([$studentId,$stars]);
    $find=$pdo->prepare('SELECT id FROM rozetler WHERE kod=? AND aktif=1 LIMIT 1');$ins=$pdo->prepare('INSERT INTO ogrenci_rozetleri (ogrenci_id,rozet_id) VALUES (?,?)');
    foreach(normalized_badges($pdo,$state,$studentId) as $c){$find->execute([$c]);$id=$find->fetchColumn();if($id)$ins->execute([$studentId,(int)$id]);}
    $daily=[];
    foreach($state['history'] as $h){if(!is_array($h)||!isset($h['at']))continue;$d=date('Y-m-d',(int)floor(((int)$h['at'])/1000));$t=(string)($h['type']??'');if($t==='step')$daily[$d]['ders_adimi']=1;if($t==='reading')$daily[$d]['okuma']=1;if($t==='game')$daily[$d]['oyun']=1;}
    foreach($state['attempts'] as $a)if(is_array($a)&&isset($a['at']))$daily[date('Y-m-d',(int)floor(((int)$a['at'])/1000))]['soru']=1;
    foreach($state['claimed'] as $d)if(preg_match('/^\\d{4}-\\d{2}-\\d{2}$/',(string)$d))$daily[(string)$d]['gunluk_odul']=1;
    $s=$pdo->prepare('INSERT INTO gunluk_gorevler (ogrenci_id,tarih,gorev_kodu,tamamlandi,odul_alindi) VALUES (?,?,?,1,?)');
    foreach($daily as $d=>$tasks)foreach($tasks as $task=>$_)$s->execute([$studentId,$d,$task,$task==='gunluk_odul'?1:0]);
}
function normalized_summary(PDO $pdo,int $studentId):array{
    $out=['completed_steps'=>0,'favorites'=>0,'answers'=>0,'correct_answers'=>0,'games'=>0,'readings'=>0,'stars'=>0,'badges'=>0];
    if(!normalized_table_exists($pdo,'ogrenci_ilerleme'))return $out;
    $grade=normalized_student_grade($pdo,$studentId);
    $gradeProgress=normalized_column_exists($pdo,'ogrenci_ilerleme','sinif_seviyesi');
    $gradeAnswers=normalized_column_exists($pdo,'ogrenci_cevaplari','sinif_seviyesi');
    $q=[
      'completed_steps'=>$gradeProgress?'SELECT COUNT(*) FROM ogrenci_ilerleme WHERE ogrenci_id=? AND sinif_seviyesi=? AND tamamlandi=1':'SELECT COUNT(*) FROM ogrenci_ilerleme WHERE ogrenci_id=? AND tamamlandi=1',
      'favorites'=>'SELECT COUNT(*) FROM favoriler WHERE ogrenci_id=?',
      'answers'=>$gradeAnswers?'SELECT COUNT(*) FROM ogrenci_cevaplari WHERE ogrenci_id=? AND sinif_seviyesi=?':'SELECT COUNT(*) FROM ogrenci_cevaplari WHERE ogrenci_id=?',
      'correct_answers'=>$gradeAnswers?'SELECT COUNT(*) FROM ogrenci_cevaplari WHERE ogrenci_id=? AND sinif_seviyesi=? AND dogru=1':'SELECT COUNT(*) FROM ogrenci_cevaplari WHERE ogrenci_id=? AND dogru=1',
      'games'=>'SELECT COUNT(*) FROM oyun_tamamlamalari WHERE ogrenci_id=?',
      'readings'=>'SELECT COUNT(*) FROM okuma_kayitlari WHERE ogrenci_id=?',
      'badges'=>'SELECT COUNT(*) FROM ogrenci_rozetleri WHERE ogrenci_id=?'
    ];
    foreach($q as $k=>$sql){$x=$pdo->prepare($sql);$x->execute(str_contains($sql,'sinif_seviyesi=?')?[$studentId,$grade]:[$studentId]);$out[$k]=(int)$x->fetchColumn();}
    $x=$pdo->prepare('SELECT toplam_yildiz FROM ogrenci_yildizlari WHERE ogrenci_id=? LIMIT 1');$x->execute([$studentId]);$out['stars']=(int)($x->fetchColumn()?:0);
    return $out;
}
