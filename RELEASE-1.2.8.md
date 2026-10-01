# İlkAdım 1.2.8

## Kurum İçerikleri modülü

Bu sürüm, kurum yönetiminde "Dersler / İçerikler" başlığı altında daha sonra yapılacağı belirtilen öğretmen içerik görünürlüğünü tamamlar.

### Yeni kurum sayfası

Yeni `kurum-icerikleri.php` sayfası eklendi.

Yönetici veya Süper Admin, yalnızca yönetme/görüntüleme yetkisi bulunan kurum için:

- kurum öğretmenlerinin yayınlarını tek listede görür,
- öğretmene göre filtreler,
- içerik türüne göre filtreler,
- aktif/pasif duruma göre filtreler,
- ders ve konu bilgisini görür,
- hedef öğrenci sayısını görür,
- soru içeriklerinde cevaplayan ve doğru cevaplayan öğrenci sayılarını görür,
- ödev içeriklerinde tamamlayan öğrenci sayısını ve teslim tarihini görür.

### Kurum izolasyonu

İçerik merkezi salt okunurdur ve bütün sorgular kurum kapsamıyla sınırlandırılır.

- İçerik: `ogretmen_icerikleri.kurum_id`
- Öğretmen üyeliği: aynı kurum
- Öğretmen–öğrenci ilişkisi: aynı kurum
- Öğrenci üyeliği: aynı kurum

Başka bir kurumdaki öğretmen, öğrenci veya içerik kayıtları sonuç kümesine dahil edilmez.

### Navigasyon

- Kurum Detay sayfasındaki **Dersler / İçerikler** alanı artık aktif modüldür.
- Yönetici Paneli'ne **Kurum İçerikleri** hızlı erişimi eklendi.
- Öğretmen Paneli'ndeki eski "daha sonra bağlanacak" notu kaldırıldı ve mevcut gerçek akış anlatıldı.

### Yetki modeli

Yeni bir yönetici yetkisi eklenmedi.

Kurum İçerikleri sayfası mevcut `kurum_goruntule` yetkisini kullanır ve yayınları değiştirmez. İçerik oluşturma veya aktif/pasif değiştirme yetkisi ilgili öğretmenin kendi **İçeriklerim** alanında kalır.

### Test

- Yeni `institution-content-center-133.cjs` regression testi eklendi.
- Tenant scope, rol kontrolü, navigasyon ve release/manifest sözleşmesi Quality Gate içinde doğrulanır.
