# İlkAdım V1.0.35 — Gerçek Yetkilendirme Kurulumu

Bu sürüm öğrenci, veli, öğretmen, yönetici ve süper admin hesaplarını tek bir merkezi kimlik sistemi altında toplar.

## Roller

- `ogrenci`: yalnızca kendi öğrenci uygulamasını ve kendi ilerlemesini kullanır.
- `veli`: yalnızca kendisine eşleştirilen öğrencilerin raporlarını görür.
- `ogretmen`: yalnızca kendisine eşleştirilen öğrencilerin raporlarını görür.
- `yonetici`: aktif öğrencileri görebilir; öğrenci, veli ve öğretmen hesabı oluşturabilir; veli/öğretmen eşleştirebilir.
- `super_admin`: yönetici oluşturabilir, ek roller verebilir ve güncelleme merkezini kullanabilir.

Yetki kontrolü yalnızca menü gizlemeye dayanmaz. PHP tarafı her istekte oturumu ve öğrenci erişimini yeniden doğrular.

## İlk Süper Admin

Güncellemeden önceki öğrenci hesapları otomatik olarak `kullanicilar` tablosuna taşınır ve öğrenci rolleri korunur.

Kurulumda yalnızca **bir aktif kullanıcı hesabı** varsa:

1. Öğrenci hesabıyla giriş yap.
2. Profil > **Hesap ve Yetkiler** bölümünü aç.
3. Mevcut şifreni gir.
4. **Sistem Sahibi Yetkisini Etkinleştir** butonuna bas.

Bu işlem yalnızca hiç Süper Admin yokken ve sistemde tam olarak bir aktif hesap varken görünür.

Birden fazla mevcut hesap varsa sistem güvenlik nedeniyle kimin yönetici olduğunu tahmin etmez. İlk Süper Admin rolünü phpMyAdmin/MySQL üzerinden bir kez açıkça ver:

```sql
SELECT id,email,ana_rol,aktif FROM kullanicilar ORDER BY id;

INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol)
SELECT id,'super_admin'
FROM kullanicilar
WHERE email='YONETICI_EMAIL_ADRESI';
```

Sonrasında tüm kullanıcı ve eşleştirme işlemleri web arayüzünden yapılabilir.

## Kullanıcı Yönetimi

Süper Admin / Yönetici:

- öğrenci hesabı oluşturabilir,
- veli hesabı oluşturabilir,
- öğretmen hesabı oluşturabilir,
- Süper Admin ayrıca yönetici hesabı oluşturabilir,
- veli ve öğretmeni bir öğrenciyle eşleştirebilir,
- öğrenci eşleştirmesini kaldırabilir,
- uygun kullanıcı hesaplarını pasifleştirip yeniden aktifleştirebilir.

Süper Admin ayrıca mevcut bir kullanıcıya ek rol verebilir.

## Hesap Güvenliği

- Şifreler PHP `password_hash()` ile saklanır.
- Girişte `password_verify()` kullanılır.
- Başarılı girişte PHP session ID yenilenir.
- Oturum çerezleri HttpOnly / SameSite=Lax ve HTTPS üzerinde Secure kullanır.
- Değişiklik formları CSRF token doğrulaması yapar.
- "Beni hatırla" tokenleri veritabanında yalnızca SHA-256 hash olarak tutulur.
- Kullanıcı pasifleştirildiğinde kalıcı oturum tokenleri iptal edilir.
- Yetki işlemleri `yetki_loglari` tablosuna yazılır.

## PWA ve Çevrimdışı Eşitleme

PWA ilerleme yazma işlemleri öğrenci rolü ile sınırlıdır.

- Çevrimdışı kayıt öğrenci ID'si ile izole edilir.
- Eşitleme sırasında aktif oturumdaki öğrenci ID'si tekrar kontrol edilir.
- Veli/öğretmen/yönetici oturumları öğrenci ilerlemesini yazamaz.
- Veli ve öğretmen yalnızca yetkili oldukları öğrencilerin salt-okunur raporlarına erişebilir.

## Güncelleme Merkezi

İlk Süper Admin etkinleştirildikten sonra `guncelleme.php` yalnızca Süper Admin oturumuna izin verir.
