<?php
declare(strict_types=1);

function sod_homeworks(array $contents): array {
    return array_values(array_filter(
        $contents,
        static fn(array $item): bool => (string)($item['icerik_turu']??'')==='odev'
    ));
}

function sod_institutions(array $homeworks): array {
    $map=[];
    foreach($homeworks as $row){
        if(!is_array($row)) continue;
        $id=(int)($row['kurum_id']??0);
        if($id<=0) continue;
        $map[$id]=[
            'id'=>$id,
            'ad'=>(string)($row['kurum_adi']??('Kurum #'.$id)),
        ];
    }
    $rows=array_values($map);
    usort($rows,static function(array $a,array $b): int {
        $byName=strcasecmp((string)$a['ad'],(string)$b['ad']);
        return $byName!==0?$byName:((int)$a['id']<=>(int)$b['id']);
    });
    return $rows;
}

function sod_filter(
    array $homeworks,
    int $institutionId=0,
    string $status='tum',
    ?DateTimeImmutable $now=null
): array {
    if(!in_array($status,['tum','pending','overdue','completed'],true)) $status='tum';

    $rows=array_values(array_filter(
        $homeworks,
        static function(array $row) use ($institutionId): bool {
            return $institutionId<=0 || (int)($row['kurum_id']??0)===$institutionId;
        }
    ));

    if($status!=='tum'){
        $rows=hw_filter($rows,$status,$now);
    }

    return sod_sort($rows,$now);
}

function sod_sort(array $homeworks,?DateTimeImmutable $now=null): array {
    $now=$now??new DateTimeImmutable('now');
    $rank=['overdue'=>0,'pending'=>1,'completed'=>2];

    usort($homeworks,static function(array $a,array $b) use ($now,$rank): int {
        $as=hw_status($a,$now);
        $bs=hw_status($b,$now);
        $statusCompare=($rank[$as]??9)<=>($rank[$bs]??9);
        if($statusCompare!==0) return $statusCompare;

        if($as==='completed'){
            $ac=trim((string)($a['odev_tamamlanma_tarihi']??''));
            $bc=trim((string)($b['odev_tamamlanma_tarihi']??''));
            if($ac!==$bc) return strcmp($bc,$ac);
        }

        $ad=trim((string)($a['teslim_tarihi']??''));
        $bd=trim((string)($b['teslim_tarihi']??''));
        if($ad==='' && $bd!=='') return 1;
        if($ad!=='' && $bd==='') return -1;
        if($ad!==$bd) return strcmp($ad,$bd);

        return (int)($b['id']??0)<=>(int)($a['id']??0);
    });

    return array_values($homeworks);
}

function sod_summary(array $homeworks,?DateTimeImmutable $now=null): array {
    $summary=hw_summary($homeworks,$now);
    $summary['completion_rate']=$summary['total']>0
        ?(int)round($summary['completed']*100/$summary['total'])
        :0;

    $summary['next_due']=null;
    foreach($homeworks as $row){
        if(!is_array($row) || hw_status($row,$now)!=='pending') continue;
        $due=trim((string)($row['teslim_tarihi']??''));
        if($due==='') continue;
        try{
            $dueAt=new DateTimeImmutable($due);
            if($summary['next_due']===null || $dueAt<$summary['next_due']){
                $summary['next_due']=$dueAt;
            }
        }catch(Throwable){}
    }

    return $summary;
}
