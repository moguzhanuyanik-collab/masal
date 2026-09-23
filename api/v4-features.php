<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';
require dirname(__DIR__) . '/src/normalized.php';
header('Cache-Control: private,no-store,max-age=0');

function v4_rewards(): array {
 return ['gozluk'=>3,'sapka'=>5,'cicek'=>4,'uzay'=>7,'orman'=>7,'deniz'=>7];
}
function v4_preference(PDO $db,int $sid): array {
 $s=$db->prepare('SELECT sac,tisort,aksesuar,arka_plan,gece_okuma FROM v4_ogrenci_tercihleri WHERE ogrenci_id=?');
 $s->execute([$sid]);
 $r=$s->fetch(PDO::FETCH_ASSOC);
 return $r ?: ['sac'=>'🟤','tisort'=>'💜','aksesuar'=>'✨','arka_plan'=>'','gece_okuma'=>0];
}
function v4_data(PDO $db,int $sid): array {
 $s=$db->prepare('SELECT odul_kodu FROM v4_odul_satin_alimlari WHERE ogrenci_id=? ORDER BY id');
 $s->execute([$sid]);
 $bought=$s->fetchAll(PDO::FETCH_COLUMN);
 $s=$db->prepare('SELECT COALESCE(SUM(yildiz_maliyeti),0) FROM v4_odul_satin_alimlari WHERE ogrenci_id=?');
 $s->execute([$sid]);
 $spent=(int)$s->fetchColumn();
 $s=$db->prepare('SELECT gun,ders_kodu,hedef,tamamlandi FROM v4_haftalik_plan WHERE ogrenci_id=? ORDER BY gun');
 $s->execute([$sid]);
 $plan=$s->fetchAll(PDO::FETCH_ASSOC);
 $state=load_student_state($db,$sid);
 $stars=count($state['steps']??[])+count($state['games']??[])
   +count(array_unique(array_column($state['readings']??[],'id')))
   +2*count($state['claimed']??[]);
 $complete=0;
 $rows=$db->query("SELECT d.kod,d.ad,COUNT(m.id) AS toplam FROM dersler d
   LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.aktif=1 WHERE d.aktif=1 GROUP BY d.id,d.kod,d.ad")->fetchAll(PDO::FETCH_ASSOC);
 $done=[];
 foreach($state['steps']??[] as $step)if(is_string($step)&&preg_match('/^(.+)-(\d+)$/',$step,$m))$done[$m[1]][$m[2]]=1;
 $completed=[];
 foreach($rows as $row){
   $n=(int)$row['toplam'];
   if($n>0&&count($done[$row['kod']]??[]) >= $n) {
     $complete++;
     $completed[]=$row['ad'];
   }
 }
 return [
  'ok'=>true,
  'csrf'=>csrf_token(),
  'student_id'=>$sid,
  'preferences'=>v4_preference($db,$sid),
  'purchased'=>$bought,
  'spent'=>$spent,
  'earned'=>$stars,
  'available'=>max(0,$stars-$spent),
  'plan'=>$plan,
  'completed_courses'=>$completed,
  'completed_count'=>$complete,
  'student_name'=>(string)($state['name']??'')
 ];
}
try {
 $db=db();$sid=require_api_student();
 if($_SERVER['REQUEST_METHOD']==='GET')json_response(v4_data($db,$sid));
 if($_SERVER['REQUEST_METHOD']!=='POST')json_response(['ok'=>false,'message'=>'Yalnızca GET ve POST desteklenir.'],405);
 if(!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN']??'')))json_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız.'],403);
 $raw=file_get_contents('php://input');
 if(!is_string($raw)||strlen($raw)>30000)json_response(['ok'=>false,'message'=>'Geçersiz istek.'],413);
 $body=json_decode($raw,true);
 if(!is_array($body))json_response(['ok'=>false,'message'=>'Geçersiz içerik.'],400);
 $action=(string)($body['action']??'');
 if($action==='preferences'){
   $allowed=['sac'=>['🟤','🟡','⚫','🟠'],'tisort'=>['💜','💙','💚','❤️'],'aksesuar'=>['✨','🌸','🎩','🕶️'],'arka_plan'=>['','uzay','orman','deniz']];
   foreach($allowed as $k=>$choices)if(!in_array($body[$k]??null,$choices,true))json_response(['ok'=>false,'message'=>'Geçersiz kişiselleştirme.'],400);
   $s=$db->prepare('SELECT odul_kodu FROM v4_odul_satin_alimlari WHERE ogrenci_id=?');$s->execute([$sid]);
   $owned=array_fill_keys($s->fetchAll(PDO::FETCH_COLUMN),true);
   $need=['🌸'=>'cicek','🎩'=>'sapka','🕶️'=>'gozluk'];
   $accessory=$body['aksesuar'];$bg=$body['arka_plan'];
   if((isset($need[$accessory])&&!isset($owned[$need[$accessory]]))||($bg!==''&&!isset($owned[$bg])))
     json_response(['ok'=>false,'message'=>'Önce ilgili ödülü açmalısın.'],409);
   $s=$db->prepare('INSERT INTO v4_ogrenci_tercihleri (ogrenci_id,sac,tisort,aksesuar,arka_plan,gece_okuma)
    VALUES (?,?,?,?,?,?) ON DUPLICATE KEY UPDATE sac=VALUES(sac),tisort=VALUES(tisort),aksesuar=VALUES(aksesuar),
    arka_plan=VALUES(arka_plan),gece_okuma=VALUES(gece_okuma)');
   $s->execute([$sid,$body['sac'],$body['tisort'],$accessory,$bg,(!empty($body['gece_okuma'])?1:0)]);
 }elseif($action==='buy'){
   $id=(string)($body['reward']??'');$list=v4_rewards();
   if(!isset($list[$id]))json_response(['ok'=>false,'message'=>'Ödül bulunamadı.'],400);
   $db->beginTransaction();
   try{
     $s=$db->prepare('SELECT id FROM ogrenciler WHERE id=? AND aktif=1 FOR UPDATE');$s->execute([$sid]);if(!$s->fetchColumn())throw new RuntimeException('Öğrenci bulunamadı.');
     $data=v4_data($db,$sid);
     if(!in_array($id,$data['purchased'],true)){
       if($data['available']<$list[$id]){ $db->rollBack();json_response(['ok'=>false,'message'=>'Yeterli yıldız yok.'],409); }
       $s=$db->prepare('INSERT INTO v4_odul_satin_alimlari (ogrenci_id,odul_kodu,yildiz_maliyeti) VALUES (?,?,?)');
       $s->execute([$sid,$id,$list[$id]]);
     }
     $db->commit();
   }catch(Throwable $e){if($db->inTransaction())$db->rollBack();throw $e;}
 }elseif($action==='plan'){
   $day=(int)($body['day']??0);$lesson=(string)($body['lesson']??'');$goal=trim((string)($body['goal']??''));
   if($day<1||$day>7||strlen($lesson)>50||mb_strlen($goal)>160||$goal==='')
     json_response(['ok'=>false,'message'=>'Gün, ders veya hedef geçersiz.'],400);
   $s=$db->prepare('SELECT COUNT(*) FROM dersler WHERE kod=? AND aktif=1');$s->execute([$lesson]);
   if(!(int)$s->fetchColumn())json_response(['ok'=>false,'message'=>'Ders bulunamadı.'],400);
   $s=$db->prepare('INSERT INTO v4_haftalik_plan (ogrenci_id,gun,ders_kodu,hedef,tamamlandi) VALUES (?,?,?,?,0)
    ON DUPLICATE KEY UPDATE ders_kodu=VALUES(ders_kodu),hedef=VALUES(hedef),tamamlandi=0');
   $s->execute([$sid,$day,$lesson,$goal]);
 }elseif($action==='plan_done'){
   $day=(int)($body['day']??0);
   if($day<1||$day>7)json_response(['ok'=>false,'message'=>'Geçersiz gün.'],400);
   $s=$db->prepare('UPDATE v4_haftalik_plan SET tamamlandi=1 WHERE ogrenci_id=? AND gun=?');$s->execute([$sid,$day]);
 }elseif($action==='reading'){
   $story=(string)($body['story']??'');$score=$body['score']??null;
   if(!preg_match('/^[a-z0-9_-]{1,50}$/i',$story)||!is_int($score)||$score<0||$score>100)
     json_response(['ok'=>false,'message'=>'Okuma sonucu geçersiz.'],400);
   $s=$db->prepare('INSERT INTO v4_okuma_denemeleri (ogrenci_id,hikaye_kodu,eslesme_orani) VALUES (?,?,?)');
   $s->execute([$sid,$story,$score]);
 }else json_response(['ok'=>false,'message'=>'Bilinmeyen işlem.'],400);
 json_response(v4_data($db,$sid));
} catch(Throwable $e) {
 error_log('IlkAdim V4 API: '.$e->getMessage());
 json_response(['ok'=>false,'message'=>'V4 verileri şu anda kaydedilemedi.'],500);
}
