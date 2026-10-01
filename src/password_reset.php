<?php
declare(strict_types=1);

function pr_table_exists(PDO $pdo,string $table): bool {
    if(!preg_match('/^[A-Za-z0-9_]+$/D',$table)) return false;
    try{
        $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
        $stmt->execute([$table]);
        $ok=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $ok;
    }catch(Throwable){
        return false;
    }
}

function pr_column_exists(PDO $pdo,string $table,string $column): bool {
    if(!preg_match('/^[A-Za-z0-9_]+$/D',$table) || !preg_match('/^[A-Za-z0-9_]+$/D',$column)) return false;
    try{
        $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name=?');
        $stmt->execute([$table,$column]);
        $ok=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $ok;
    }catch(Throwable){
        return false;
    }
}

function pr_tables_ready(PDO $pdo): bool {
    return pr_table_exists($pdo,'sifre_sifirlama_tokenlari')
        && pr_table_exists($pdo,'sifre_sifirlama_guvenlik')
        && pr_table_exists($pdo,'kullanicilar');
}

function pr_config(): array {
    static $config=null;
    if(is_array($config)) return $config;
    $file=dirname(__DIR__).'/config/app.php';
    $loaded=is_file($file)?require $file:[];
    $config=is_array($loaded)?$loaded:[];
    return $config;
}

function pr_base_url(): ?string {
    $config=pr_config();
    $url=rtrim(trim((string)($config['app']['base_url']??'')),'/');
    if($url==='') return null;
    $parts=parse_url($url);
    if(!is_array($parts) || !in_array(strtolower((string)($parts['scheme']??'')),['http','https'],true) || empty($parts['host'])) return null;
    if(isset($parts['user']) || isset($parts['pass']) || isset($parts['query']) || isset($parts['fragment'])) return null;
    return $url;
}

function pr_normalize_email(string $email): string {
    return mb_strtolower(trim($email),'UTF-8');
}

function pr_client_ip(): string {
    return mb_substr(trim((string)($_SERVER['REMOTE_ADDR']??'')),0,45);
}

function pr_rate_scopes(string $email,string $ip): array {
    $email=pr_normalize_email($email);
    $scopes=[['email',hash('sha256',$email),3,900,1800]];
    if($ip!=='') $scopes[]=['ip',hash('sha256',$ip),10,900,1800];
    return $scopes;
}

function pr_rate_consume(PDO $pdo,string $email,string $ip): bool {
    if(!pr_table_exists($pdo,'sifre_sifirlama_guvenlik')) return false;
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $now=(int)($pdo->query('SELECT UNIX_TIMESTAMP(NOW())')->fetchColumn()?:time());
        $ensure=$pdo->prepare("INSERT IGNORE INTO sifre_sifirlama_guvenlik
            (kapsam,kapsam_hash,deneme_sayisi,pencere_baslangici,engel_bitis,son_deneme)
            VALUES (?,?,0,FROM_UNIXTIME(?),NULL,FROM_UNIXTIME(?))");
        $select=$pdo->prepare("SELECT deneme_sayisi,UNIX_TIMESTAMP(pencere_baslangici) pencere_baslangici,
            UNIX_TIMESTAMP(engel_bitis) engel_bitis
            FROM sifre_sifirlama_guvenlik
            WHERE kapsam=? AND kapsam_hash=? LIMIT 1 FOR UPDATE");
        $update=$pdo->prepare("UPDATE sifre_sifirlama_guvenlik
            SET deneme_sayisi=?,pencere_baslangici=FROM_UNIXTIME(?),
                engel_bitis=?,son_deneme=FROM_UNIXTIME(?)
            WHERE kapsam=? AND kapsam_hash=?");

        $allowed=true;
        foreach(pr_rate_scopes($email,$ip) as [$scope,$hash,$limit,$window,$blockSeconds]){
            $ensure->execute([$scope,$hash,$now,$now]);
            $select->execute([$scope,$hash]);
            $row=$select->fetch(PDO::FETCH_ASSOC);
            $select->closeCursor();
            if(!is_array($row)) throw new RuntimeException('Şifre sıfırlama güvenlik sayacı oluşturulamadı.');

            $blockedUntil=(int)($row['engel_bitis']??0);
            if($blockedUntil>$now){
                $allowed=false;
                $update->execute([(int)$row['deneme_sayisi'],(int)$row['pencere_baslangici'],date('Y-m-d H:i:s',$blockedUntil),$now,$scope,$hash]);
                continue;
            }

            $start=(int)($row['pencere_baslangici']??0);
            $count=1;
            if($start>0 && $start>=$now-(int)$window){
                $count=max(0,(int)$row['deneme_sayisi'])+1;
            }else{
                $start=$now;
            }

            $blocked=$count>(int)$limit;
            $blockValue=$blocked?date('Y-m-d H:i:s',$now+(int)$blockSeconds):null;
            $update->execute([$count,$start,$blockValue,$now,$scope,$hash]);
            if($blocked) $allowed=false;
        }
        if($started)$pdo->commit();
        return $allowed;
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        error_log('[IlkAdim][password-reset] rate_limit_failed');
        return false;
    }
}

function pr_user_id_by_email(PDO $pdo,string $email): ?int {
    if(!pr_table_exists($pdo,'kullanicilar')) return null;
    $stmt=$pdo->prepare("SELECT id FROM kullanicilar
        WHERE (email COLLATE utf8mb4_turkish_ci)=(CONVERT(? USING utf8mb4) COLLATE utf8mb4_turkish_ci)
          AND aktif=1
        LIMIT 1");
    $stmt->execute([pr_normalize_email($email)]);
    $id=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    return $id>0?$id:null;
}

function pr_issue_token_for_user(PDO $pdo,int $userId,string $ip): string {
    if($userId<=0 || !pr_tables_ready($pdo)) throw new RuntimeException('Şifre sıfırlama servisi hazır değil.');
    $raw=bin2hex(random_bytes(32));
    $hash=hash('sha256',$raw);
    $ipHash=$ip!==''?hash('sha256',$ip):null;
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $lock=$pdo->prepare('SELECT id FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1 FOR UPDATE');
        $lock->execute([$userId]);
        $exists=(int)($lock->fetchColumn()?:0);
        $lock->closeCursor();
        if($exists<=0) throw new RuntimeException('Kullanıcı bulunamadı.');

        $revoke=$pdo->prepare("UPDATE sifre_sifirlama_tokenlari
            SET iptal_tarihi=NOW()
            WHERE kullanici_id=? AND kullanildi_tarihi IS NULL AND iptal_tarihi IS NULL");
        $revoke->execute([$userId]);
        $revoke->closeCursor();

        $insert=$pdo->prepare("INSERT INTO sifre_sifirlama_tokenlari
            (kullanici_id,token_hash,son_kullanma_tarihi,talep_ip_hash)
            VALUES (?,?,DATE_ADD(NOW(),INTERVAL 30 MINUTE),?)");
        $insert->execute([$userId,$hash,$ipHash]);
        $insert->closeCursor();
        if($started)$pdo->commit();
        return $raw;
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
}

function pr_revoke_raw_token(PDO $pdo,string $raw): void {
    if(!pr_table_exists($pdo,'sifre_sifirlama_tokenlari') || !preg_match('/^[a-f0-9]{64}$/D',$raw)) return;
    $stmt=$pdo->prepare("UPDATE sifre_sifirlama_tokenlari
        SET iptal_tarihi=COALESCE(iptal_tarihi,NOW())
        WHERE token_hash=? AND kullanildi_tarihi IS NULL");
    $stmt->execute([hash('sha256',$raw)]);
    $stmt->closeCursor();
}

function pr_token_is_valid(PDO $pdo,string $raw): bool {
    if(!pr_tables_ready($pdo) || !preg_match('/^[a-f0-9]{64}$/D',$raw)) return false;
    $stmt=$pdo->prepare("SELECT 1
        FROM sifre_sifirlama_tokenlari t
        INNER JOIN kullanicilar u ON u.id=t.kullanici_id AND u.aktif=1
        WHERE t.token_hash=?
          AND t.kullanildi_tarihi IS NULL
          AND t.iptal_tarihi IS NULL
          AND t.son_kullanma_tarihi>NOW()
        LIMIT 1");
    $stmt->execute([hash('sha256',$raw)]);
    $ok=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    return $ok;
}

function pr_header_value(string $value): string {
    return trim(str_replace(["\r","\n"],' ',$value));
}

function pr_mail_config(): array {
    $config=pr_config();
    return is_array($config['mail']??null)?$config['mail']:[];
}

function pr_mail_subject(string $subject): string {
    return '=?UTF-8?B?'.base64_encode($subject).'?=';
}

function pr_smtp_read($socket): array {
    $lines=[];
    while(!feof($socket)){
        $line=fgets($socket,8192);
        if($line===false) break;
        $lines[]=$line;
        if(strlen($line)>=4 && $line[3]===' ') break;
    }
    $code=$lines?(int)substr($lines[count($lines)-1],0,3):0;
    return [$code,implode('',$lines)];
}

function pr_smtp_command($socket,string $command,array $expected): void {
    if($command!=='') fwrite($socket,$command."\r\n");
    [$code]=pr_smtp_read($socket);
    if(!in_array($code,$expected,true)) throw new RuntimeException('SMTP sunucusu isteği kabul etmedi.');
}

function pr_smtp_send(string $to,string $subject,string $body,array $config): bool {
    $host=trim((string)($config['host']??''));
    $port=max(1,min(65535,(int)($config['port']??587)));
    $encryption=strtolower(trim((string)($config['encryption']??'tls')));
    $username=(string)($config['username']??'');
    $password=(string)($config['password']??'');
    $timeout=max(3,min(30,(int)($config['timeout_seconds']??10)));
    $from=trim((string)($config['from_email']??''));
    $fromName=pr_header_value((string)($config['from_name']??'İlkAdım'));

    if($host==='' || !filter_var($to,FILTER_VALIDATE_EMAIL) || !filter_var($from,FILTER_VALIDATE_EMAIL)) return false;
    if(!in_array($encryption,['none','tls','ssl'],true)) return false;

    $remote=($encryption==='ssl'?'ssl://':'').$host.':'.$port;
    $errno=0;$errstr='';
    $socket=@stream_socket_client($remote,$errno,$errstr,$timeout,STREAM_CLIENT_CONNECT);
    if(!is_resource($socket)) return false;
    stream_set_timeout($socket,$timeout);

    try{
        pr_smtp_command($socket,'',[220]);
        $hello=parse_url((string)(pr_base_url()??''),PHP_URL_HOST);
        $hello=is_string($hello)&&$hello!==''?$hello:'localhost';
        pr_smtp_command($socket,'EHLO '.$hello,[250]);

        if($encryption==='tls'){
            pr_smtp_command($socket,'STARTTLS',[220]);
            if(!stream_socket_enable_crypto($socket,true,STREAM_CRYPTO_METHOD_TLS_CLIENT)){
                throw new RuntimeException('SMTP TLS başlatılamadı.');
            }
            pr_smtp_command($socket,'EHLO '.$hello,[250]);
        }

        if($username!==''){
            pr_smtp_command($socket,'AUTH LOGIN',[334]);
            pr_smtp_command($socket,base64_encode($username),[334]);
            pr_smtp_command($socket,base64_encode($password),[235]);
        }

        pr_smtp_command($socket,'MAIL FROM:<'.$from.'>',[250]);
        pr_smtp_command($socket,'RCPT TO:<'.$to.'>',[250,251]);
        pr_smtp_command($socket,'DATA',[354]);

        $headers=[
            'Date: '.date(DATE_RFC2822),
            'From: '.pr_mail_subject($fromName).' <'.$from.'>',
            'To: <'.$to.'>',
            'Subject: '.pr_mail_subject($subject),
            'MIME-Version: 1.0',
            'Content-Type: text/plain; charset=UTF-8',
            'Content-Transfer-Encoding: 8bit',
            'Message-ID: <'.bin2hex(random_bytes(12)).'@'.$hello.'>',
        ];
        $message=implode("\r\n",$headers)."\r\n\r\n".str_replace(["\r\n","\r"],"\n",$body);
        $message=str_replace("\n","\r\n",$message);
        $message=preg_replace('/(?m)^\./','..',$message)??$message;
        fwrite($socket,$message."\r\n.\r\n");
        [$code]=pr_smtp_read($socket);
        if($code!==250) throw new RuntimeException('SMTP mesajı kabul etmedi.');
        @fwrite($socket,"QUIT\r\n");
        fclose($socket);
        return true;
    }catch(Throwable $e){
        if(is_resource($socket)) fclose($socket);
        error_log('[IlkAdim][password-reset] smtp_delivery_failed');
        return false;
    }
}

function pr_send_reset_email(string $email,string $url): bool {
    $config=pr_mail_config();
    $transport=strtolower(trim((string)($config['transport']??'disabled')));
    $from=trim((string)($config['from_email']??''));
    $fromName=pr_header_value((string)($config['from_name']??'İlkAdım'));
    if(!filter_var($email,FILTER_VALIDATE_EMAIL) || !filter_var($from,FILTER_VALIDATE_EMAIL)) return false;

    $subject='İlkAdım şifre sıfırlama bağlantısı';
    $body="Merhaba,\n\nİlkAdım hesabın için şifre sıfırlama talebi alındı.\n\n".
        "Bağlantı 30 dakika boyunca ve yalnızca bir kez kullanılabilir:\n".$url."\n\n".
        "Bu talebi sen yapmadıysan bu e-postayı yok sayabilirsin. Şifren değişmeyecektir.\n\nİlkAdım";

    if($transport==='smtp') return pr_smtp_send($email,$subject,$body,array_merge($config,is_array($config['smtp']??null)?$config['smtp']:[]));

    if($transport==='mail'){
        $headers=[
            'MIME-Version: 1.0',
            'Content-Type: text/plain; charset=UTF-8',
            'Content-Transfer-Encoding: 8bit',
            'From: '.pr_mail_subject($fromName).' <'.$from.'>',
        ];
        return @mail($email,pr_mail_subject($subject),$body,implode("\r\n",$headers));
    }
    return false;
}

function pr_request_reset(PDO $pdo,string $email,string $ip): void {
    $email=pr_normalize_email($email);
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Geçerli bir e-posta adresi yaz.');

    if(!pr_tables_ready($pdo)){
        error_log('[IlkAdim][password-reset] tables_not_ready');
        usleep(150000);
        return;
    }
    if(!pr_rate_consume($pdo,$email,$ip)){
        usleep(150000);
        return;
    }

    $userId=pr_user_id_by_email($pdo,$email);
    if($userId===null){
        usleep(150000);
        return;
    }

    $raw=pr_issue_token_for_user($pdo,$userId,$ip);
    $baseUrl=pr_base_url();
    $sent=false;
    if($baseUrl!==null){
        $url=$baseUrl.'/sifre-sifirla.php?token='.rawurlencode($raw);
        $sent=pr_send_reset_email($email,$url);
    }

    if(!$sent){
        pr_revoke_raw_token($pdo,$raw);
        error_log('[IlkAdim][password-reset] delivery_unavailable');
        return;
    }

    if(function_exists('auth_audit')){
        auth_audit($pdo,$userId,$userId,'sifre_sifirlama_talep','Şifre sıfırlama bağlantısı gönderildi');
    }
}

function pr_reset_password(PDO $pdo,string $raw,string $password): int {
    if(!pr_tables_ready($pdo) || !preg_match('/^[a-f0-9]{64}$/D',$raw)) throw new RuntimeException('Şifre sıfırlama bağlantısı geçersiz veya süresi dolmuş.');
    if(mb_strlen($password)<8 || mb_strlen($password)>128) throw new RuntimeException('Yeni şifre 8 ile 128 karakter arasında olmalı.');

    $hash=password_hash($password,PASSWORD_DEFAULT);
    if(!is_string($hash) || $hash==='') throw new RuntimeException('Yeni şifre oluşturulamadı.');

    $tokenHash=hash('sha256',$raw);
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare("SELECT t.id,t.kullanici_id
            FROM sifre_sifirlama_tokenlari t
            INNER JOIN kullanicilar u ON u.id=t.kullanici_id AND u.aktif=1
            WHERE t.token_hash=?
              AND t.kullanildi_tarihi IS NULL
              AND t.iptal_tarihi IS NULL
              AND t.son_kullanma_tarihi>NOW()
            LIMIT 1 FOR UPDATE");
        $stmt->execute([$tokenHash]);
        $row=$stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(!is_array($row)) throw new RuntimeException('Şifre sıfırlama bağlantısı geçersiz veya süresi dolmuş.');

        $tokenId=(int)$row['id'];
        $userId=(int)$row['kullanici_id'];

        if(pr_column_exists($pdo,'kullanicilar','oturum_surumu')){
            $stmt=$pdo->prepare('UPDATE kullanicilar SET sifre_hash=?,oturum_surumu=oturum_surumu+1 WHERE id=? AND aktif=1');
        }else{
            $stmt=$pdo->prepare('UPDATE kullanicilar SET sifre_hash=? WHERE id=? AND aktif=1');
        }
        $stmt->execute([$hash,$userId]);
        if($stmt->rowCount()<1) throw new RuntimeException('Şifre güncellenemedi.');
        $stmt->closeCursor();

        $studentIds=[];
        if(pr_table_exists($pdo,'ogrenciler') && pr_column_exists($pdo,'ogrenciler','kullanici_id')){
            $stmt=$pdo->prepare('SELECT id FROM ogrenciler WHERE kullanici_id=?');
            $stmt->execute([$userId]);
            $studentIds=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
            $stmt->closeCursor();
            if(pr_column_exists($pdo,'ogrenciler','sifre_hash')){
                $stmt=$pdo->prepare('UPDATE ogrenciler SET sifre_hash=? WHERE kullanici_id=?');
                $stmt->execute([$hash,$userId]);
                $stmt->closeCursor();
            }
        }

        $stmt=$pdo->prepare('UPDATE sifre_sifirlama_tokenlari SET kullanildi_tarihi=NOW() WHERE id=?');
        $stmt->execute([$tokenId]);
        $stmt->closeCursor();
        $stmt=$pdo->prepare("UPDATE sifre_sifirlama_tokenlari
            SET iptal_tarihi=COALESCE(iptal_tarihi,NOW())
            WHERE kullanici_id=? AND id<>? AND kullanildi_tarihi IS NULL");
        $stmt->execute([$userId,$tokenId]);
        $stmt->closeCursor();

        if(pr_table_exists($pdo,'kullanici_oturum_tokenlari')){
            $stmt=$pdo->prepare('DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id=?');
            $stmt->execute([$userId]);
            $stmt->closeCursor();
        }
        if($studentIds && pr_table_exists($pdo,'ogrenci_oturum_tokenlari')){
            $ph=implode(',',array_fill(0,count($studentIds),'?'));
            $stmt=$pdo->prepare("DELETE FROM ogrenci_oturum_tokenlari WHERE ogrenci_id IN ($ph)");
            $stmt->execute($studentIds);
            $stmt->closeCursor();
        }

        if($started)$pdo->commit();

        if(function_exists('auth_audit')){
            auth_audit($pdo,$userId,$userId,'sifre_sifirlama_basarili','Şifre güvenli kurtarma bağlantısıyla yenilendi; oturumlar iptal edildi');
        }
        return $userId;
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }
}
