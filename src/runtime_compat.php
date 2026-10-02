<?php
declare(strict_types=1);

if(!function_exists('mb_strlen')){
    function mb_strlen(string $string,?string $encoding=null): int {
        $count=preg_match_all('/./us',$string,$matches);
        return $count===false?strlen($string):$count;
    }
}

if(!function_exists('mb_substr')){
    function mb_substr(string $string,int $start,?int $length=null,?string $encoding=null): string {
        $chars=preg_split('//u',$string,-1,PREG_SPLIT_NO_EMPTY);
        if(!is_array($chars)) return $length===null?substr($string,$start):substr($string,$start,$length);
        $slice=$length===null?array_slice($chars,$start):array_slice($chars,$start,$length);
        return implode('',$slice);
    }
}

if(!function_exists('mb_strtolower')){
    function mb_strtolower(string $string,?string $encoding=null): string {
        $string=strtr($string,['İ'=>'i','I'=>'ı','Ğ'=>'ğ','Ü'=>'ü','Ş'=>'ş','Ö'=>'ö','Ç'=>'ç']);
        return strtolower($string);
    }
}

if(!function_exists('mb_strtoupper')){
    function mb_strtoupper(string $string,?string $encoding=null): string {
        $string=strtr($string,['i'=>'İ','ı'=>'I','ğ'=>'Ğ','ü'=>'Ü','ş'=>'Ş','ö'=>'Ö','ç'=>'Ç']);
        return strtoupper($string);
    }
}
