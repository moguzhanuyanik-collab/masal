# İlkAdım v1.1.36 — 6-8. Sınıf İçerik Aktivasyonu

Bu sürüm, daha önce hazırlık klasörlerinde tamamlanan 6., 7. ve 8. sınıf içeriklerini canlı öğrenci akışına alır.

## Canlı içerik

- 6. sınıf: 128 konu / 523 temizlenmiş canlı soru
- 7. sınıf: 126 konu / 602 temizlenmiş canlı soru
- 8. sınıf: 130 konu / 953 canlı soru
- Toplam yeni canlı soru: 2.078

6. ve 7. sınıf hazırlık paketlerinde aynı sorunun yapay “benzer bağlam” varyasyonları canlı paketten ayıklanmıştır. Matematikte farklı sayısal işlem ve problem varyasyonları korunmuştur.

8. sınıf soru bankası konu bazında özgün soru setleri olarak hazırlandığı için 953 sorunun tamamı korunmuştur.

## Öğrenci akışı

Ders → Tema / Ünite / Öğrenme Alanı → Konu (tek kart) → Soru Havuzu

Aynı konuya ait sorular ayrı konu kartları oluşturmaz. Konu açıldığında soru havuzu mevcut öğrenci soru ekranında sırayla çalışır.

## Migration yapısı

Büyük tek SQL dosyası yerine ders bazlı migrationlar kullanılmıştır:

- 036-044: 6. sınıf
- 045-053: 7. sınıf
- 054-062: 8. sınıf

Bu yapı kurulum hatalarında hangi dersin sorun çıkardığını doğrudan tespit etmeyi kolaylaştırır. Migrationlar idempotent içerik yapısını kullanır.

## SQL güvenliği

v1.1.35'te düzeltilen Türkçe özel ad / kesme işareti sorununun tekrar etmemesi için 6-8. sınıf kaynakları SQL tek-tırnak kaçış kontrolünden geçirilmiştir.

## Program kapsamı

- 6. ve 7. sınıf: 2026-2027 Türkiye Yüzyılı Maarif Modeli yapısı
- 8. sınıf: 2026-2027'de uygulanmaya devam eden mevcut öğretim programı / LGS konu yapısı

## Tasarım güvenliği

- Öğrenci HTML yapısı değiştirilmedi.
- CSS dosyaları değiştirilmedi.
- Logo, görseller ve AdımBot değiştirilmedi.
- Updater arayüzü değiştirilmedi.
- Mevcut konu kartı → soru havuzu akışı kullanılmaya devam eder.
- v1.1.34'te eklenen üst sınıf konu simgesi altyapısı kullanılmaya devam eder.
