# İlkAdım v1.1.43

- Kurum yöneticisi için `kurum-eslestirmeleri.php` eklendi: kurum içindeki her öğrenciye birden fazla veli ve öğretmen bağlanabilir.
- Kurum, öğrenci, veli ve öğretmen yetkileri sunucuda kontrol edilir; mevcut süper admin eşleştirme kuralları kullanılır.
- Formlar CSRF korumalıdır. Kayıt sonrasında yönlendirme tekrar gönderimi engeller.
- Yönetici ve kurum paneline, yalnız gerekli dört yetkiye sahip yönetici için bağlantı eklendi.
- Öğrenci HTML/CSS, mevcut stiller ve veritabanı şeması değiştirilmedi.

## Doğrulama

- GitHub içeriğiyle sürüm ve bağlantıların statik denetimi yapılacaktır.
- PHP yorumlayıcısı ve test veritabanı mevcut olmadığı için sözdizimi ve gerçek rol/kurum testi yapılamaz; canlı kurulumdan önce bu sınır dikkate alınmalıdır.

Taban sürüm: v1.1.42
