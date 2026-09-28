# İlkAdım v1.1.44

- Yönetici ve Süper Admin için salt okunur `kurum-raporlari.php` sayfası eklendi.
- Aktif kurum öğrencilerinin soru yanıtı, doğru sayısı ve doğruluk oranı sınıf ve yanıt tarihi filtresiyle görüntülenir.
- Kurum üyeliği ve görüntüleme yetkisi sunucuda doğrulanır. Veriler yalnız seçilen kuruma ait üyelerden okunur.
- Yönetici ve kurum detayındaki rapor bağlantıları çalışır hale getirildi.
- Sınıf/grup oluşturma için yeni veritabanı şeması gerekir; test veritabanında geri dönüş denenene kadar o madde beklemede.
- Öğrenci HTML/CSS ve mevcut veritabanı değiştirilmedi.

## Doğrulama

- Statik kapsam ve yetki denetimi yapılacaktır.
- PHP sözdizimi ve gerçek rol/veri testi bu ortamda çalıştırılamadı; canlı sonuçlar kurulumdan sonra kontrol edilmelidir.

Taban sürüm: v1.1.43
