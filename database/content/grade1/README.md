# İlkAdım 1. Sınıf MEB İçerik Hazırlık Paketi

Bu klasör otomatik migration değildir. `database/migrations` dışında tutulduğu için güncelleme sistemi bu dosyaları kendiliğinden çalıştırmaz.

## Amaç
Mevcut tek-sorulu ders modülü mantığını, tasarımı bozmadan ileride şu yapıya geçirmek:

Ders → Tema / Öğrenme Alanı → Konu → Soru Havuzu

## Hazırlanan veri
- Türkçe: 33 konu, 255 soru
- Matematik: 16 konu, 395 soru
- Hayat Bilgisi: 6 konu, 62 soru
- Görsel Sanatlar: 7 konu, 28 soru
- Müzik: 2 konu, 16 soru
- Beden Eğitimi ve Oyun: 4 konu, 32 soru
- Toplam: 68 konu, 788 soru

## Kurallar
- Sorular 1. sınıf öğrencisinin okuyabileceği kısa ve doğal cümlelerle hazırlanmıştır.
- Her çoktan seçmeli soruda 4 benzersiz seçenek bulunur.
- Doğru cevap indeksleri mümkün olduğunca farklı şıklara dağıtılmıştır.
- Türkçe ve Matematikte gerçek anlamda çok sayıda benzersiz örnek üretilebildiği için soru havuzu daha büyüktür.
- Diğer derslerde sırf sayı artsın diye aynı sorunun kelimeleri değiştirilmiş kopyaları üretilmemiştir.
- Öğrenci HTML/CSS tasarımı, logo, ikon, görseller ve AdımBot görselleri bu hazırlıkta değiştirilmemiştir.

## Dosyalar
1. `00_schema_and_mufredat.sql` — yeni konu/soru havuzu tabloları ve 1. sınıf tema/öğrenme alanları
2. `10_turkce_soru_havuzu.sql`
3. `20_matematik_soru_havuzu.sql`
4. `30_diger_dersler_soru_havuzu.sql`

## Aktivasyon notu
Bu veri henüz canlı ders motoruna bağlanmamıştır. Mevcut `app-runtime.js` tek-soru modül yapısını kullandığı için soru havuzunu doğrudan aktifleştirmek, yüzlerce soruyu konu kartı gibi gösterebilir veya ilerleme mantığını bozabilir. Aktivasyon aşamasında görünümü değiştirmeden konu başına soru havuzu akışı ayrıca bağlanmalıdır.

MEB kaynak yapısı: Türkiye Yüzyılı Maarif Modeli 1. sınıf Türkçe, İlkokul Matematik, Hayat Bilgisi, Görsel Sanatlar, Müzik ve Beden Eğitimi ve Oyun öğretim programları.
