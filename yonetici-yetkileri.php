<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/yonetici_yetkileri.php';
$actor=require_role('super_admin');
$pdo=db();
$options=yy_options();
$message='';$error='';
function yy_h(string $value):string{return htmlspecialchars($value,ENT_QUOTES,'UTF-8');}
try {
    if($_SERVER['REQUEST_METHOD']==='POST') {
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        if(!auth_runtime_table_exists($pdo,'yonetici_yetkileri')) throw new RuntimeException('Yetki tablosu henüz kurulmadı. Sistem güncellemesini tamamlayın.');
        $target=(int)($_POST['kullanici_id']??0);
        $stmt=$pdo->prepare("SELECT k.id FROM kullanicilar k WHERE k.id=? AND k.aktif=1 AND (k.ana_rol='yonetici' OR EXISTS(SELECT 1 FROM kullanici_rolleri r WHERE r.kullanici_id=k.id AND r.rol='yonetici')) LIMIT 1");
        $stmt->execute([$target]);
        if(!$stmt->fetchColumn()) throw new RuntimeException('Geçerli bir yönetici seçin.');
        $posted=$_POST['yetkiler']??[];
        if(!is_array($posted)) throw new RuntimeException('Geçersiz yetki seçimi.');
        $selected=array_values(array_intersect(array_keys($options),array_map('strval',$posted)));
        $pdo->beginTransaction();
        try {
            $pdo->prepare('DELETE FROM yonetici_yetkileri WHERE kullanici_id=?')->execute([$target]);
            $insert=$pdo->prepare('INSERT INTO yonetici_yetkileri (kullanici_id,yetki) VALUES (?,?)');
            foreach($selected as $permission)$insert->execute([$target,$permission]);
            $pdo->commit();
        } catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
        auth_audit($pdo,(int)$actor['id'],$target,'yonetici_yetkileri',implode(',',$selected)?:'Tüm izinler kaldırıldı');
        $message='Yönetici izinleri kaydedildi.';
    }
} catch(Throwable $e){$error=$e->getMessage();}
$managers=[];$grants=[];
try {
    $managers=$pdo->query("SELECT k.id,k.ad_soyad,k.email FROM kullanicilar k WHERE k.aktif=1 AND (k.ana_rol='yonetici' OR EXISTS(SELECT 1 FROM kullanici_rolleri r WHERE r.kullanici_id=k.id AND r.rol='yonetici')) ORDER BY k.ad_soyad,k.id")->fetchAll(PDO::FETCH_ASSOC);
    if(auth_runtime_table_exists($pdo,'yonetici_yetkileri')) {
        foreach($pdo->query('SELECT kullanici_id,yetki FROM yonetici_yetkileri') as $grant)$grants[(int)$grant['kullanici_id']][]=(string)$grant['yetki'];
    }
} catch(Throwable){$error='Yönetici listesi okunamadı.';}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Yönetici Yetkileri — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.61"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?><div class="app-shell">
<header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a><div class="sa-page-actions"><a class="sa-page-action" href="hesap-guvenligi.php" aria-label="Hesabım"><svg><use href="#sa-user"/></svg></a></div></header>
<main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-shield"/></svg></span><h1>Yönetici Yetkileri</h1><p>Her yöneticinin kurum bölümlerine erişimini ayrı ayrı belirleyin.</p></section>
<?php if($message):?><div class="role-note"><span><svg><use href="#sa-check"/></svg></span><p><?=yy_h($message)?></p></div><?php endif;?>
<?php if($error):?><div class="role-note"><span><svg><use href="#sa-alert"/></svg></span><p><?=yy_h($error)?></p></div><?php endif;?>
<?php if(!$managers):?><div class="role-empty">Henüz yönetici yok. Önce Kurumlar bölümünden yönetici oluşturun.</div><?php endif;?>
<?php foreach($managers as $manager):?><form method="post" class="settings-block yy-manager-card"><input type="hidden" name="csrf" value="<?=yy_h(csrf_token())?>"><input type="hidden" name="kullanici_id" value="<?=(int)$manager['id']?>"><h2><?=yy_h((string)$manager['ad_soyad'])?></h2><p><?=yy_h((string)$manager['email'])?></p><div class="yy-permissions">
<?php foreach($options as $key=>$label):?><label><input type="checkbox" name="yetkiler[]" value="<?=yy_h($key)?>" <?=in_array($key,$grants[(int)$manager['id']]??[],true)?'checked':''?>><span><?=yy_h($label)?></span></label><?php endforeach;?></div><button class="button primary full" type="submit">Yetkileri Kaydet</button></form><?php endforeach;?>
</div></main><nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a><a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a><a class="active" href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div></body></html>
