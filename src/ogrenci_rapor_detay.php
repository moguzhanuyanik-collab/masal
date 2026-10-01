<?php
declare(strict_types=1);

function ord_scope_teacher_contents(array $contents,int $institutionId=0): array {
    if($institutionId<=0) return array_values($contents);
    return array_values(array_filter(
        $contents,
        static fn(array $row): bool => (int)($row['kurum_id']??0)===$institutionId
    ));
}

function ord_teacher_content_summary(array $contents,?DateTimeImmutable $now=null): array {
    $now=$now??new DateTimeImmutable('now');
    $summary=[
        'questions'=>0,
        'questions_answered'=>0,
        'questions_correct'=>0,
        'homeworks'=>0,
        'homeworks_completed'=>0,
        'homeworks_overdue'=>0,
    ];

    foreach($contents as $row){
        if(!is_array($row)) continue;
        $type=(string)($row['icerik_turu']??'');
        if($type==='soru'){
            $summary['questions']++;
            if(array_key_exists('secilen_cevap_indeksi',$row) && $row['secilen_cevap_indeksi']!==null){
                $summary['questions_answered']++;
                if((int)($row['cevap_dogru']??0)===1)$summary['questions_correct']++;
            }
            continue;
        }
        if($type!=='odev') continue;

        $summary['homeworks']++;
        $completed=(int)($row['odev_tamamlandi']??0)===1;
        if($completed){
            $summary['homeworks_completed']++;
            continue;
        }

        $due=trim((string)($row['teslim_tarihi']??''));
        if($due!==''){
            try{
                $dueAt=new DateTimeImmutable($due);
                if($dueAt<$now)$summary['homeworks_overdue']++;
            }catch(Throwable){}
        }
    }

    return $summary;
}

function ord_recent_homeworks(array $contents,int $limit=8): array {
    $rows=array_values(array_filter(
        $contents,
        static fn(array $row): bool => (string)($row['icerik_turu']??'')==='odev'
    ));
    usort($rows,static function(array $a,array $b): int {
        $ak=(string)($a['olusturulma_tarihi']??'');
        $bk=(string)($b['olusturulma_tarihi']??'');
        return strcmp($bk,$ak);
    });
    return array_slice($rows,0,max(0,$limit));
}

function ord_recent_questions(array $contents,int $limit=8): array {
    $rows=array_values(array_filter(
        $contents,
        static fn(array $row): bool => (string)($row['icerik_turu']??'')==='soru'
    ));
    usort($rows,static function(array $a,array $b): int {
        $ak=(string)($a['olusturulma_tarihi']??'');
        $bk=(string)($b['olusturulma_tarihi']??'');
        return strcmp($bk,$ak);
    });
    return array_slice($rows,0,max(0,$limit));
}
