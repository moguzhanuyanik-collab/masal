<?php
declare(strict_types=1);

function ms_settings_file(): string {
    return dirname(__DIR__).'/storage/mail-settings.php';
}

function ms_settings_fingerprint(string $file): string {
    if(!is_file($file)) return '';
    $hash=hash_file('sha256',$file);
    return is_string($hash)?$hash:'';
}

function ms_saved_settings(): array {
    $file=ms_settings_file();
    if(!is_file($file)) return [];
    if(function_exists('opcache_invalidate')) @opcache_invalidate($file,true);
    try{
        $saved=require $file;
        return is_array($saved)?$saved:[];
    }catch(Throwable){
        return [];
    }
}

function ms_valid_base_url(string $value): bool {
    $value=rtrim(trim($value),'/');
    if($value==='') return false;
    $parts=parse_url($value);
    if(!is_array($parts)) return false;
    $scheme=strtolower((string)($parts['scheme']??''));
    $host=trim((string)($parts['host']??''));
    if(!in_array($scheme,['http','https'],true) || $host==='') return false;
    if(isset($parts['user']) || isset($parts['pass']) || isset($parts['query']) || isset($parts['fragment'])) return false;
    return true;
}

function ms_https_ready(string $value): bool {
    if(!ms_valid_base_url($value)) return false;
    $parts=parse_url($value);
    $scheme=strtolower((string)($parts['scheme']??''));
    $host=strtolower((string)($parts['host']??''));
    if($scheme==='https') return true;
    return in_array($host,['localhost','127.0.0.1','::1'],true);
}

function ms_candidate(array $input,array $current): array {
    $app=is_array($current['app']??null)?$current['app']:[];
    $mail=is_array($current['mail']??null)?$current['mail']:[];
    $smtp=is_array($mail['smtp']??null)?$mail['smtp']:[];

    $baseUrl=rtrim(trim((string)($input['base_url']??($app['base_url']??''))),'/');
    $transport=strtolower(trim((string)($input['transport']??($mail['transport']??'disabled'))));
    $fromEmail=mb_strtolower(trim((string)($input['from_email']??($mail['from_email']??''))),'UTF-8');
    $fromName=trim((string)($input['from_name']??($mail['from_name']??'İlkAdım')));
    $host=trim((string)($input['smtp_host']??($smtp['host']??'')));
    $port=(int)($input['smtp_port']??($smtp['port']??587));
    $encryption=strtolower(trim((string)($input['smtp_encryption']??($smtp['encryption']??'tls'))));
    $username=trim((string)($input['smtp_username']??($smtp['username']??'')));
    $timeout=(int)($input['smtp_timeout']??($smtp['timeout_seconds']??10));
    $newPassword=(string)($input['smtp_password']??'');
    $password=isset($input['clear_smtp_password'])?'':($newPassword!==''?$newPassword:(string)($smtp['password']??''));

    if($baseUrl!=='' && !ms_valid_base_url($baseUrl)) throw new RuntimeException('Uygulama adresini http:// veya https:// ile tam olarak gir.');
    if(!in_array($transport,['disabled','mail','smtp'],true)) throw new RuntimeException('E-posta gönderim yöntemi geçersiz.');
    if($fromEmail!=='' && !filter_var($fromEmail,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Gönderen e-posta adresini kontrol et.');
    if(mb_strlen($fromName)<2 || mb_strlen($fromName)>120) throw new RuntimeException('Gönderen adını kontrol et.');
    if($host!=='' && (strlen($host)>255 || preg_match('/[\s\x00-\x1F\x7F]/',$host))) throw new RuntimeException('SMTP sunucu adresini kontrol et.');
    if($port<1 || $port>65535) throw new RuntimeException('SMTP portu geçersiz.');
    if(!in_array($encryption,['none','tls','ssl'],true)) throw new RuntimeException('SMTP şifreleme seçimi geçersiz.');
    if(strlen($username)>255 || preg_match('/[\r\n]/',$username)) throw new RuntimeException('SMTP kullanıcı adını kontrol et.');
    if(strlen($password)>1024 || preg_match('/[\r\n]/',$password)) throw new RuntimeException('SMTP şifresini kontrol et.');
    if($timeout<3 || $timeout>30) throw new RuntimeException('SMTP zaman aşımı 3 ile 30 saniye arasında olmalı.');

    if($transport!=='disabled' && $fromEmail==='') throw new RuntimeException('Gönderen e-posta adresi gerekli.');
    if($transport==='smtp' && $host==='') throw new RuntimeException('SMTP sunucusu gerekli.');
    if($transport==='smtp' && $username!=='' && $password==='') throw new RuntimeException('SMTP kullanıcı adı girildiğinde SMTP şifresi de gerekli.');

    return [
        'app'=>['base_url'=>$baseUrl],
        'mail'=>[
            'transport'=>$transport,
            'from_email'=>$fromEmail,
            'from_name'=>$fromName,
            'smtp'=>[
                'host'=>$host,
                'port'=>$port,
                'encryption'=>$encryption,
                'username'=>$username,
                'password'=>$password,
                'timeout_seconds'=>$timeout,
            ],
        ],
    ];
}

function ms_save(array $candidate,string $expectedFingerprint): void {
    $file=ms_settings_file();
    $dir=dirname($file);
    if(!is_dir($dir) && !mkdir($dir,0750,true) && !is_dir($dir)) throw new RuntimeException('Ayar klasörü oluşturulamadı.');

    $lock=fopen($dir.'/mail-settings.lock','c');
    if($lock===false || !flock($lock,LOCK_EX)) throw new RuntimeException('E-posta ayarları kilitlenemedi.');

    $temp=null;
    try{
        if(!hash_equals($expectedFingerprint,ms_settings_fingerprint($file))){
            throw new RuntimeException('E-posta ayarları bu işlem sırasında başka bir yönetici tarafından değiştirildi. Sayfayı yenileyip tekrar dene.');
        }
        $temp=tempnam($dir,'mail_');
        if($temp===false) throw new RuntimeException('E-posta ayar dosyası oluşturulamadı.');
        $contents="<?php\ndeclare(strict_types=1);\nreturn ".var_export($candidate,true).";\n";
        if(file_put_contents($temp,$contents,LOCK_EX)!==strlen($contents)
            || !chmod($temp,0600)
            || !rename($temp,$file)){
            throw new RuntimeException('E-posta ayarları kaydedilemedi.');
        }
        $temp=null;
    }finally{
        if(is_string($temp) && is_file($temp)) @unlink($temp);
        flock($lock,LOCK_UN);
        fclose($lock);
    }

    if(function_exists('opcache_invalidate')) @opcache_invalidate($file,true);
}

function ms_readiness(PDO $pdo,array $config): array {
    $issues=[];
    $app=is_array($config['app']??null)?$config['app']:[];
    $mail=is_array($config['mail']??null)?$config['mail']:[];
    $smtp=is_array($mail['smtp']??null)?$mail['smtp']:[];

    $baseUrl=trim((string)($app['base_url']??''));
    $transport=strtolower(trim((string)($mail['transport']??'disabled')));
    $from=trim((string)($mail['from_email']??''));

    if(!pr_tables_ready($pdo)) $issues[]='Şifre kurtarma veritabanı tabloları hazır değil.';
    if(!ms_valid_base_url($baseUrl)) $issues[]='Uygulama dış adresi tanımlı değil.';
    elseif(!ms_https_ready($baseUrl)) $issues[]='Canlı şifre sıfırlama bağlantısı için HTTPS kullan.';
    if($transport==='disabled') $issues[]='E-posta gönderimi kapalı.';
    if(!filter_var($from,FILTER_VALIDATE_EMAIL)) $issues[]='Gönderen e-posta adresi eksik veya geçersiz.';

    if($transport==='smtp'){
        if(trim((string)($smtp['host']??''))==='') $issues[]='SMTP sunucusu eksik.';
        if((int)($smtp['port']??0)<1) $issues[]='SMTP portu eksik.';
        $encryption=strtolower(trim((string)($smtp['encryption']??'')));
        if(!in_array($encryption,['none','tls','ssl'],true)) $issues[]='SMTP şifreleme ayarı geçersiz.';
        $username=trim((string)($smtp['username']??''));
        if($username!=='' && (string)($smtp['password']??'')==='') $issues[]='SMTP şifresi eksik.';
    }elseif($transport==='mail' && !function_exists('mail')){
        $issues[]='Sunucuda PHP mail() işlevi kullanılamıyor.';
    }

    return ['ready'=>$issues===[],'issues'=>$issues];
}

function ms_test_connection(array $candidate): string {
    $mail=$candidate['mail'];
    $transport=(string)$mail['transport'];
    if($transport==='disabled') throw new RuntimeException('E-posta gönderimi kapalı.');
    if($transport==='mail'){
        if(!function_exists('mail')) throw new RuntimeException('Sunucuda PHP mail() işlevi kullanılamıyor.');
        return 'PHP mail() kullanılabilir. Teslimatı doğrulamak için test e-postası gönder.';
    }
    if(!pr_smtp_probe(array_merge($mail,$mail['smtp']))) throw new RuntimeException('SMTP bağlantısı doğrulanamadı.');
    return 'SMTP bağlantısı, şifreleme ve kimlik doğrulama başarılı.';
}

function ms_send_test_email(array $candidate,string $target): string {
    $target=mb_strtolower(trim($target),'UTF-8');
    if(!filter_var($target,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Test alıcısı e-posta adresini kontrol et.');
    $ok=pr_send_plain_email(
        $target,
        'İlkAdım e-posta ayarları testi',
        "Bu mesaj İlkAdım Süper Admin e-posta ayarları ekranından gönderilen test e-postasıdır.\n\nBu mesajı aldıysan e-posta teslim katmanı çalışıyor.",
        $candidate['mail']
    );
    if(!$ok) throw new RuntimeException('Test e-postası gönderilemedi. SMTP/mail ayarlarını kontrol et.');
    return 'Test e-postası gönderildi: '.$target;
}
