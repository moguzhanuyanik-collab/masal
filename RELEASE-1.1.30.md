# İlkAdım v1.1.30

## MEB tema → konu → soru havuzu aktivasyonu

Bu sürüm 1. ve 2. sınıf için daha önce hazırlanmış MEB içerik havuzlarını canlı ders veri akışına bağlar.

### İçerik
- 1. sınıf: 68 konu / 788 soru
- 2. sınıf: 77 konu / 1.434 soru
- Toplam: 145 konu / 2.222 soru

### Ders akışı
- Öğrencinin sınıf seviyesi veritabanından okunur.
- Dersler sınıf eşlemesine göre gelir.
- Yeni içerik varsa Ders → Tema/Öğrenme Alanı → Konu → Soru Havuzu kullanılır.
- Konu listesinde aynı konuya ait yüzlerce soru kartı gösterilmez; her konu tek kart olarak görünür.
- Konuya girildiğinde o konuya ait sorular mevcut ders ekranında sırayla açılır.
- Tamamlanmış sorularda konu kartı ilk tamamlanmamış soruya yönlenir.
- Yeni içerik bulunamazsa eski ders_modulleri yapısına otomatik geri dönülür.

### Veritabanı
- 031_meb_soru_havuzu_aktivasyonu.sql ile 1. ve 2. sınıf içerikleri gerçek DB tablolarına kurulur.
- Migration silme yapmaz.
- Eski ders_modulleri kayıtları korunur.
- Aynı konu ve soru kodları tekrar çalıştırılırsa çoğalmaz; upsert edilir.

### İlerleme
- Yeni havuz aktif derslerde tamamlanma sayısı ders_sorulari üzerinden hesaplanır.
- Eski derslerde ders_modulleri sayımı fallback olarak korunur.

### Tasarım güvenliği
- Mevcut öğrenci HTML yapısı değiştirilmemiştir.
- CSS dosyaları değiştirilmemiştir.
- Logo, ikon, resimler ve AdımBot görselleri değiştirilmemiştir.
- Canlı app-runtime.js dosyası ezilmemiştir.
- Güncelleme ekranının tasarımına dokunulmamıştır.

Taban sürüm: v1.1.29
