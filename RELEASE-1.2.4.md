# İlkAdım 1.2.4

## AdımBot oturum ve rate-limit bütünlük hardening

1.2.3 bütünlük taramasından sonra AdımBot sohbet ve ses API'lerinde bir yetkilendirme/bağımlılık boşluğu bulundu.

### Kök neden

- `api/adimbot-ai.php` ve `api/adimbot-transcribe.php` yalnız `auth.php` yüklüyor, uygulama bootstrap'ını doğrudan yüklemiyordu.
- Endpoint yetkilendirmesi canlı kullanıcı kaydı yerine session içindeki `aktif_rol`, `ogrenci_id` ve `kullanici_id` değerlerine dayanıyordu.
- Bu nedenle pasife alınmış veya rolü değişmiş bir hesabın açık oturumu canlı hesap durumunu tekrar doğrulamadan AdımBot isteğine ulaşabiliyordu.
- `db()` yüklenmemişse kalıcı `adimbot_rate_limitleri` koruması çalışmıyor ve rate-limit session fallback'ine düşüyordu.

### Düzeltmeler

- Her iki endpoint uygulama `bootstrap.php` dosyasını auth katmanından önce yüklüyor.
- Her istekte `authenticated_user()` ile canlı aktif hesap yeniden doğrulanıyor.
- Güncel effective role mutlaka `ogrenci` olmalı.
- Aktif öğrenci profili `auth_student_id_for_user()` ile DB'den yeniden çözülüyor.
- Chat ve voice rate-limit kontrolleri aynı doğrulanmış PDO bağlantısı üzerinden kalıcı DB rate-limit tablosunu kullanıyor.
- Session yalnız fallback sayaç saklama amacıyla kalıyor; yetkilendirme kaynağı olarak kullanılmıyor.
- Yeni `tests/adimbot-api-auth-130.cjs` regression testi bu sözleşmeyi kilitliyor.

### Veritabanı

Yeni migration yoktur. Mevcut `064_adimbot_rate_limit_ve_migration_checkpoint.sql` ile oluşturulan `adimbot_rate_limitleri` tablosu kullanılır.

### Yayın güvenliği

Bu sürüm veri silmez, tenant eşleştirmelerini değiştirmez ve mevcut updater/migration zincirine yeni bir DB adımı eklemez.
