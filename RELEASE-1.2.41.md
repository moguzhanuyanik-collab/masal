# İlkAdım 1.2.41

## Süper Admin E-posta / SMTP Ayarları Merkezi

Bu sürüm 1.2.40 şifre kurtarma altyapısının e-posta teslim ayarlarını cPanel veya dosya düzenlemeden yönetilebilir hale getirir.

### Yeni: E-posta & SMTP Merkezi

Yeni Süper Admin sayfası:

`eposta-ayarlari.php`

Buradan:

- uygulamanın dış adresi,
- e-posta transport yöntemi,
- gönderen e-posta adresi,
- gönderen adı,
- SMTP sunucusu,
- SMTP portu,
- STARTTLS / SSL / şifrelemesiz bağlantı,
- SMTP kullanıcı adı,
- SMTP şifresi,
- bağlantı zaman aşımı

yönetilebilir.

### Şifre Gizliliği

SMTP şifresi hiçbir zaman form alanına geri yazılmaz.

Kayıtlı şifre varsa alan boş görünür ve:

`Kayıtlı şifre korunacak`

mesajı gösterilir.

Alan boş bırakılırsa mevcut şifre korunur. Şifrenin temizlenmesi ayrıca açık bir kutucukla yapılır.

### Güvenli Ayar Saklama

Panel ayarları:

`storage/mail-settings.php`

dosyasına yazılır.

Yazma işlemi:

- dosya kilidi,
- mevcut dosya fingerprint kontrolü,
- geçici dosya,
- `0600` izin,
- atomik `rename`

ile yapılır.

Böylece iki Süper Admin'in aynı anda eski ayarı ezme riski azaltılır.

`storage` klasörü updater tarafından zaten korunduğu için yazılım güncellemesi SMTP ayarlarını silmez.

### Dinamik Config Birleşimi

`config/app.php` artık varsa `storage/mail-settings.php` dosyasını yükler.

Buradaki:

- `app.base_url`
- `mail.*`

değerleri varsayılan / local config üzerine güvenli biçimde birleştirilir.

Şifre kurtarma akışı otomatik olarak yeni panel ayarlarını kullanır.

### Şifre Kurtarma Hazır / Eksik

Panelde sistem durumu açık şekilde gösterilir.

Hazır olabilmesi için:

- migration 075 tablolarının bulunması,
- geçerli dış uygulama adresi,
- canlı ortamda HTTPS,
- aktif e-posta transportu,
- geçerli gönderen e-posta,
- SMTP seçiliyse gerekli SMTP alanları

kontrol edilir.

Eksikler tek tek listelenir.

### Bağlantı Testi

`Bağlantıyı Test Et` düğmesi SMTP için:

- sunucu bağlantısını,
- EHLO,
- STARTTLS gerekiyorsa TLS geçişini,
- SMTP AUTH gerekiyorsa kullanıcı adı / şifre doğrulamasını

test eder.

Bu test e-posta göndermez.

### Test E-postası

`Test E-postası Gönder` düğmesi girilen test adresine gerçek bir mesaj yollar.

Bu sayede yalnız bağlantının değil, teslim katmanının da çalıştığı doğrulanabilir.

### Genel Mail Gönderici

1.2.40'taki reset e-posta kodu ortak hale getirildi:

- `pr_send_plain_email()`
- `pr_smtp_probe()`

Şifre kurtarma e-postaları aynı merkezi mail gönderici üzerinden devam eder.

### Test

Yeni testler:

- `tests/mail-settings-166.cjs`
- `tests/mail-settings-166.php`

Testler:

1. boş şifre alanının kayıtlı SMTP şifresini korumasını,
2. açık temizleme işleminin şifreyi kaldırmasını,
3. HTTPS + SMTP yapılandırmasının hazır sayılmasını,
4. canlı HTTP adresinin eksik sayılmasını,
5. kapalı transportun eksik sayılmasını,
6. kullanıcı adı varken şifresiz SMTP yapılandırmasının engellenmesini,
7. SMTP şifresinin HTML'e geri basılmamasını,
8. atomik ayar dosyası yazım sözleşmesini,
9. Süper Admin menü entegrasyonunu

doğrular.
