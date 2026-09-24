# İlkAdım v1.1.26

## Sınıf bazlı ders ve içerik altyapısı
- Öğrenci profiline 1-12 arası `sinif_seviyesi` eklendi.
- Mevcut öğrenciler geriye dönük olarak 1. sınıf kabul edilir.
- Mevcut ders modülleri 1. sınıf içeriği olarak korunur.
- `sinif_dersleri` tablosu ile derslerin sınıfa göre haftalık saati, sırası ve aktifliği ayrılır.
- `ders_modulleri` kayıtları sınıf seviyesine bağlanır.
- Öğrenci ekranı yalnız giriş yapan öğrencinin sınıfına ait ders modüllerini yükler.
- `ogrenci_ilerleme` ve `ogrenci_cevaplari` kayıtları sınıf seviyesine göre ayrılır.
- Öğrenci sınıf değiştirdiğinde önceki sınıfın tamamlanan adımları yeni sınıfı tamamlanmış göstermez.
- Global ve kurum öğrenci oluşturma alanlarında sınıf seçilebilir.
- Öğrenci raporu aktif sınıfa göre filtrelenir.

## Bu sürümde yapılmayanlar
- 2. sınıf müfredat verileri henüz eklenmedi.
- Mevcut 1. sınıf soru ve konu içerikleri değiştirilmedi.
- Öğrenci HTML/CSS tasarımı değiştirilmedi.
- Logo, ikon, resim ve AdımBot görselleri değiştirilmedi.
- Güncelleme ekranı değiştirilmedi.
- app-runtime.js değiştirilmedi.

Taban sürüm: v1.1.25
