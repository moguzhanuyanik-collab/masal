# İlkAdım 1.2.40

## Güvenli Şifre Kurtarma Merkezi

Bu sürüm giriş ekranına güvenli “Şifremi unuttum” akışı, süreli tek kullanımlık tokenlar, e-posta teslim katmanı, rate-limit ve oturum iptal mekanizması ekler.

### Şifremi Unuttum

Yeni sayfa:

`sifremi-unuttum.php`

Kullanıcı e-posta adresini girer. Ekran, hesap sistemde bulunsa da bulunmasa da aynı genel yanıtı verir:

> Eğer bu e-posta adresiyle eşleşen aktif bir hesap varsa şifre yenileme bağlantısı gönderildi.

Bu davranış hesap/e-posta keşfini engeller.

### Güvenli Token

Yeni kurtarma tokenı:

- 32 rastgele byte / 64 hex karakterdir,
- veritabanında ham haliyle tutulmaz,
- yalnız SHA-256 hash’i saklanır,
- 30 dakika geçerlidir,
- yalnız bir kez kullanılabilir,
- yeni talep oluşturulunca kullanıcının önceki açık tokenları iptal edilir,
- süresi geçmiş, kullanılmış veya iptal edilmiş token tekrar çalışmaz.

Token URL’den ilk doğrulamadan sonra session’a alınır ve tarayıcı adres çubuğundan kaldırılır.

Kurtarma sayfalarında:

- `Cache-Control: no-store`
- `Referrer-Policy: no-referrer`
- `noindex,nofollow`

uygulanır.

### Rate Limit

Şifre sıfırlama talepleri düz e-posta veya IP olarak saklanmaz.

Hash tabanlı güvenlik sayaçları kullanılır:

- e-posta: 15 dakikada 3 istek,
- IP: 15 dakikada 10 istek,
- sınır aşımında 30 dakika engel.

Rate-limit sonucu da kullanıcıya hesap varlığını ele veren farklı bir mesaj üretmez.

### Şifre Değişiminde Oturum İptali

`kullanicilar.oturum_surumu` alanı eklendi.

Başarılı şifre sıfırlamada:

- kullanıcı şifre hash’i yenilenir,
- bağlı legacy öğrenci şifre hash’i senkron tutulur,
- oturum sürümü artırılır,
- kullanıcı “beni hatırla” tokenları silinir,
- legacy öğrenci oturum tokenları silinir,
- reset tokenı kullanılmış olarak işaretlenir,
- diğer açık reset tokenları iptal edilir,
- audit kaydı oluşturulur.

Mevcut oturumlar güncelleme kurulduğunda topluca kapatılmaz. Eski oturum sürümü 1 kabul edilir; yalnız şifresi sıfırlanan hesabın sürümü artırıldığı için o hesaba ait eski session yeniden giriş ister.

### E-posta Teslimi

Yeni yapılandırma:

- `app.base_url`
- `mail.transport`
- `mail.from_email`
- `mail.from_name`
- SMTP host / port / encryption / username / password / timeout

Desteklenen transportlar:

- `disabled`
- PHP `mail()`
- SMTP
- SMTP STARTTLS
- SMTP SSL

Varsayılan durum `disabled` olarak fail-closed’dur.

E-posta gönderimi yapılandırılmamış veya başarısızsa:

- kullanıcı yine genel güvenli yanıtı görür,
- oluşturulmuş token iptal edilir,
- ham token loglanmaz,
- hata yalnız genel kodla sunucu loguna yazılır.

Örnek ayarlar `config/local.php.example` dosyasına eklendi.

### Giriş Ekranı

`login.php` içerisine:

- “Şifremi unuttum” bağlantısı,
- başarılı sıfırlama sonrası güvenli başarı mesajı

eklendi.

### Yeni Migration

`075_guvenli_sifre_kurtarma.sql`

Yeni tablolar:

- `sifre_sifirlama_tokenlari`
- `sifre_sifirlama_guvenlik`

Yeni kolon:

- `kullanicilar.oturum_surumu`

### Test

Yeni testler:

- `tests/password-recovery-165.cjs`
- `tests/password-recovery-db-165.php`

MariaDB testi şunları doğrular:

1. ilk üç talebin kabul edilmesini,
2. dördüncü kısa süreli talebin rate-limit’e takılmasını,
3. ham tokenın veritabanına yazılmamasını,
4. SHA-256 token hash’ini,
5. yeni tokenın eski tokenı iptal etmesini,
6. tek kullanımlık davranışı,
7. süresi geçmiş token reddini,
8. kullanıcı ve öğrenci şifre hash’lerinin birlikte değişmesini,
9. oturum sürümünün artmasını,
10. “beni hatırla” tokenlarının silinmesini.
