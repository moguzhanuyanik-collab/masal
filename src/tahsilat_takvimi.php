<?php
declare(strict_types=1);

function ttk_tables_ready(PDO $pdo): bool {
    return tf_tables_ready($pdo);
}

function ttk_installment_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'kurum_sozlesme_taksit_planlari')
        && auth_runtime_table_exists($pdo,'kurum_sozlesme_taksitleri');
}

function ttk_parse_date(string $value,string $label): string {
    $value=trim($value);
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(
        !$date
        || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value
    ){
        throw new RuntimeException($label.' geçersiz.');
    }
    return $value;
}

function ttk_window(?string $start=null,?string $end=null): array {
    $today=new DateTimeImmutable('today');
    $start=trim((string)$start);
    $end=trim((string)$end);
    if($start==='') $start=$today->format('Y-m-d');
    if($end==='') $end=$today->modify('+90 days')->format('Y-m-d');

    $start=ttk_parse_date($start,'Başlangıç tarihi');
    $end=ttk_parse_date($end,'Bitiş tarihi');
    if($start>$end) throw new RuntimeException('Başlangıç tarihi bitiş tarihinden sonra olamaz.');

    $a=new DateTimeImmutable($start);
    $b=new DateTimeImmutable($end);
    if((int)$a->diff($b)->days>366) throw new RuntimeException('Tahsilat takvimi en fazla 366 günlük aralık gösterebilir.');

    return ['baslangic'=>$start,'bitis'=>$end];
}

function ttk_base_contracts(PDO $pdo): array {
    if(!ttk_tables_ready($pdo)) return [];

    $planSelect=ttk_installment_ready($pdo)
        ? ",pl.durum taksit_plan_durum,pl.aktif_surum taksit_plan_surum"
        : ",NULL taksit_plan_durum,NULL taksit_plan_surum";
    $planJoin=ttk_installment_ready($pdo)
        ? "LEFT JOIN kurum_sozlesme_taksit_planlari pl ON pl.sozlesme_id=s.id AND pl.kurum_id=s.kurum_id"
        : "";

    $stmt=$pdo->query("SELECT
        s.id sozlesme_id,s.kurum_id,s.sozlesme_no,s.paket_id,
        s.baslangic_tarihi,s.bitis_tarihi,s.vade_tarihi,
        s.toplam_tutar,s.para_birimi,s.durum sozlesme_durum,
        k.ad kurum_adi,k.kod kurum_kodu,
        p.ad paket_adi,
        COALESCE(pay.tahsil_edilen,0) tahsil_edilen
        {$planSelect}
        FROM kurum_sozlesmeleri s
        INNER JOIN kurumlar k ON k.id=s.kurum_id
        LEFT JOIN paketler p ON p.id=s.paket_id
        LEFT JOIN (
            SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen
            FROM kurum_tahsilatlari
            WHERE durum='aktif'
            GROUP BY sozlesme_id
        ) pay ON pay.sozlesme_id=s.id
        {$planJoin}
        WHERE s.durum='aktif'
          AND s.toplam_tutar-COALESCE(pay.tahsil_edilen,0)>0.009
        ORDER BY s.id");

    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ttk_installment_rows(PDO $pdo,array $contractIds): array {
    if(!ttk_installment_ready($pdo)) return [];
    $ids=array_values(array_unique(array_filter(array_map('intval',$contractIds),static fn(int $id):bool=>$id>0)));
    if(!$ids) return [];

    $ph=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT
        t.id taksit_id,t.sozlesme_id,t.kurum_id,t.surum_no,t.sira_no,
        t.vade_tarihi,t.tutar,t.aciklama
        FROM kurum_sozlesme_taksitleri t
        INNER JOIN kurum_sozlesme_taksit_planlari pl
          ON pl.sozlesme_id=t.sozlesme_id
         AND pl.kurum_id=t.kurum_id
         AND pl.aktif_surum=t.surum_no
         AND pl.durum='aktif'
        WHERE t.sozlesme_id IN ({$ph})
        ORDER BY t.sozlesme_id,t.sira_no,t.id");
    $stmt->execute($ids);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

    $out=[];
    foreach($rows as $row)$out[(int)$row['sozlesme_id']][]=$row;
    return $out;
}

function ttk_due_status(?string $due,?string $today=null): array {
    $today=$today?:date('Y-m-d');
    if($due===null || trim($due)===''){
        return ['kod'=>'vadesiz','etiket'=>'Vade tarihi yok','gun'=>null];
    }
    if($due<$today){
        $a=new DateTimeImmutable($due);
        $b=new DateTimeImmutable($today);
        return ['kod'=>'gecikmis','etiket'=>$a->diff($b)->days.' gün gecikmiş','gun'=>-(int)$a->diff($b)->days];
    }
    if($due===$today) return ['kod'=>'bugun','etiket'=>'Bugün vade','gun'=>0];

    $a=new DateTimeImmutable($today);
    $b=new DateTimeImmutable($due);
    $days=(int)$a->diff($b)->days;
    return ['kod'=>'gelecek','etiket'=>$days.' gün sonra','gun'=>$days];
}

function ttk_obligations(PDO $pdo): array {
    $contracts=ttk_base_contracts($pdo);
    if(!$contracts) return [];

    $planIds=[];
    foreach($contracts as $contract){
        if((string)($contract['taksit_plan_durum']??'')==='aktif'){
            $planIds[]=(int)$contract['sozlesme_id'];
        }
    }
    $installments=ttk_installment_rows($pdo,$planIds);

    $out=[];
    $today=date('Y-m-d');

    foreach($contracts as $contract){
        $contractId=(int)$contract['sozlesme_id'];
        $paid=max(0,(float)$contract['tahsil_edilen']);
        $planRows=$installments[$contractId]??[];

        if((string)($contract['taksit_plan_durum']??'')==='aktif' && $planRows){
            $remainingPaid=$paid;
            foreach($planRows as $installment){
                $amount=round((float)$installment['tutar'],2);
                $allocated=min($amount,$remainingPaid);
                $remainingPaid=max(0,$remainingPaid-$allocated);
                $remaining=max(0,$amount-$allocated);
                if($remaining<=0.009) continue;

                $due=(string)$installment['vade_tarihi'];
                $status=ttk_due_status($due,$today);
                $out[]=[
                    'sozlesme_id'=>$contractId,
                    'kurum_id'=>(int)$contract['kurum_id'],
                    'kurum_adi'=>(string)$contract['kurum_adi'],
                    'kurum_kodu'=>(string)$contract['kurum_kodu'],
                    'sozlesme_no'=>(string)$contract['sozlesme_no'],
                    'paket_adi'=>(string)($contract['paket_adi']??''),
                    'para_birimi'=>(string)$contract['para_birimi'],
                    'kaynak'=>'taksit',
                    'taksit_id'=>(int)$installment['taksit_id'],
                    'taksit_sira'=>(int)$installment['sira_no'],
                    'vade_tarihi'=>$due,
                    'brut_tutar'=>number_format($amount,2,'.',''),
                    'tahsis_edilen'=>number_format($allocated,2,'.',''),
                    'kalan_tutar'=>number_format($remaining,2,'.',''),
                    'aciklama'=>(string)($installment['aciklama']??''),
                    'durum_kodu'=>(string)$status['kod'],
                    'durum_etiketi'=>(string)$status['etiket'],
                    'gun'=>$status['gun'],
                ];
            }
            continue;
        }

        $total=round((float)$contract['toplam_tutar'],2);
        $remaining=max(0,$total-$paid);
        if($remaining<=0.009) continue;

        $due=trim((string)($contract['vade_tarihi']??''));
        $due=$due!==''?$due:null;
        $status=ttk_due_status($due,$today);
        $out[]=[
            'sozlesme_id'=>$contractId,
            'kurum_id'=>(int)$contract['kurum_id'],
            'kurum_adi'=>(string)$contract['kurum_adi'],
            'kurum_kodu'=>(string)$contract['kurum_kodu'],
            'sozlesme_no'=>(string)$contract['sozlesme_no'],
            'paket_adi'=>(string)($contract['paket_adi']??''),
            'para_birimi'=>(string)$contract['para_birimi'],
            'kaynak'=>'tek_vade',
            'taksit_id'=>null,
            'taksit_sira'=>null,
            'vade_tarihi'=>$due,
            'brut_tutar'=>number_format($total,2,'.',''),
            'tahsis_edilen'=>number_format(min($paid,$total),2,'.',''),
            'kalan_tutar'=>number_format($remaining,2,'.',''),
            'aciklama'=>'',
            'durum_kodu'=>(string)$status['kod'],
            'durum_etiketi'=>(string)$status['etiket'],
            'gun'=>$status['gun'],
        ];
    }

    usort($out,static function(array $a,array $b): int {
        $ad=$a['vade_tarihi']??null;
        $bd=$b['vade_tarihi']??null;
        if($ad===null && $bd!==null) return 1;
        if($ad!==null && $bd===null) return -1;
        if($ad!==$bd) return strcmp((string)$ad,(string)$bd);
        $cmp=strcmp((string)$a['kurum_adi'],(string)$b['kurum_adi']);
        if($cmp!==0) return $cmp;
        $cmp=((int)$a['sozlesme_id'])<=>((int)$b['sozlesme_id']);
        if($cmp!==0) return $cmp;
        return ((int)($a['taksit_sira']??0))<=>((int)($b['taksit_sira']??0));
    });

    return $out;
}

function ttk_filter_rows(PDO $pdo,array $filters=[]): array {
    $window=ttk_window(
        isset($filters['baslangic'])?(string)$filters['baslangic']:null,
        isset($filters['bitis'])?(string)$filters['bitis']:null
    );
    $currency=mb_strtoupper(trim((string)($filters['para_birimi']??'')),'UTF-8');
    if($currency!=='' && !in_array($currency,['TRY','USD','EUR'],true)) $currency='';
    $query=trim((string)($filters['q']??''));
    $showOverdue=(string)($filters['gecikmis']??'1')!=='0';
    $showNoDue=(string)($filters['vadesiz']??'1')!=='0';

    $out=[];
    foreach(ttk_obligations($pdo) as $row){
        if($currency!=='' && (string)$row['para_birimi']!==$currency) continue;
        if($query!==''){
            $haystack=mb_strtolower(
                (string)$row['kurum_adi'].' '.(string)$row['kurum_kodu'].' '.(string)$row['sozlesme_no'],
                'UTF-8'
            );
            if(!str_contains($haystack,mb_strtolower($query,'UTF-8'))) continue;
        }

        $due=$row['vade_tarihi'];
        if($due===null){
            if($showNoDue)$out[]=$row;
            continue;
        }
        if((string)$row['durum_kodu']==='gecikmis'){
            if($showOverdue)$out[]=$row;
            continue;
        }
        if($due>=$window['baslangic'] && $due<=$window['bitis']) $out[]=$row;
    }

    return $out;
}

function ttk_summary(PDO $pdo): array {
    $out=[];
    $today=new DateTimeImmutable('today');
    foreach(ttk_obligations($pdo) as $row){
        $currency=(string)$row['para_birimi'];
        if(!isset($out[$currency])){
            $out[$currency]=[
                'para_birimi'=>$currency,
                'gecikmis'=>0.0,'bugun'=>0.0,
                'gun_1_7'=>0.0,'gun_8_30'=>0.0,'gun_31_60'=>0.0,'gun_61_90'=>0.0,
                'gun_90_plus'=>0.0,'vadesiz'=>0.0,
                'gecikmis_adet'=>0,'yaklasan_adet'=>0,'vadesiz_adet'=>0,
            ];
        }
        $amount=(float)$row['kalan_tutar'];
        $code=(string)$row['durum_kodu'];
        $days=$row['gun'];

        if($code==='vadesiz'){
            $out[$currency]['vadesiz']+=$amount;
            $out[$currency]['vadesiz_adet']++;
        }elseif($code==='gecikmis'){
            $out[$currency]['gecikmis']+=$amount;
            $out[$currency]['gecikmis_adet']++;
        }elseif($code==='bugun'){
            $out[$currency]['bugun']+=$amount;
            $out[$currency]['yaklasan_adet']++;
        }elseif(is_int($days) && $days<=7){
            $out[$currency]['gun_1_7']+=$amount;
            $out[$currency]['yaklasan_adet']++;
        }elseif(is_int($days) && $days<=30){
            $out[$currency]['gun_8_30']+=$amount;
            $out[$currency]['yaklasan_adet']++;
        }elseif(is_int($days) && $days<=60){
            $out[$currency]['gun_31_60']+=$amount;
            $out[$currency]['yaklasan_adet']++;
        }elseif(is_int($days) && $days<=90){
            $out[$currency]['gun_61_90']+=$amount;
            $out[$currency]['yaklasan_adet']++;
        }else{
            $out[$currency]['gun_90_plus']+=$amount;
        }
    }

    foreach($out as &$row){
        foreach(['gecikmis','bugun','gun_1_7','gun_8_30','gun_31_60','gun_61_90','gun_90_plus','vadesiz'] as $key){
            $row[$key]=number_format((float)$row[$key],2,'.','');
        }
    }
    unset($row);

    uasort($out,static fn(array $a,array $b): int =>
        array_search((string)$a['para_birimi'],['TRY','USD','EUR'],true)
        <=>
        array_search((string)$b['para_birimi'],['TRY','USD','EUR'],true)
    );
    return array_values($out);
}

function ttk_monthly_forecast(PDO $pdo,int $months=6): array {
    $months=max(1,min(12,$months));
    $start=new DateTimeImmutable('first day of this month');
    $end=$start->modify('+'.($months-1).' months')->modify('last day of this month');
    $map=[];

    foreach(ttk_obligations($pdo) as $row){
        $due=$row['vade_tarihi'];
        if($due===null || $due<$start->format('Y-m-d') || $due>$end->format('Y-m-d')) continue;
        $month=substr((string)$due,0,7);
        $currency=(string)$row['para_birimi'];
        if(!isset($map[$month][$currency])){
            $map[$month][$currency]=[
                'ay'=>$month,'para_birimi'=>$currency,'beklenen_tutar'=>0.0,'kalem_sayisi'=>0
            ];
        }
        $map[$month][$currency]['beklenen_tutar']+=(float)$row['kalan_tutar'];
        $map[$month][$currency]['kalem_sayisi']++;
    }

    $out=[];
    $cursor=$start;
    for($i=0;$i<$months;$i++){
        $month=$cursor->format('Y-m');
        foreach(['TRY','USD','EUR'] as $currency){
            if(!isset($map[$month][$currency])) continue;
            $row=$map[$month][$currency];
            $row['beklenen_tutar']=number_format((float)$row['beklenen_tutar'],2,'.','');
            $out[]=$row;
        }
        $cursor=$cursor->modify('+1 month');
    }
    return $out;
}
