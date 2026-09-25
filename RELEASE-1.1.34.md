# İlkAdım v1.1.34 — 3-5. Sınıf MEB İçerik Aktivasyonu

Bu sürüm, tamamlanmış 3., 4. ve 5. sınıf içerik paketlerini canlı öğrenci akışına alır.

## Canlı içerik
- 3. sınıf: 104 konu / 1.792 soru
- 4. sınıf: 123 konu / 947 temizlenmiş canlı soru
- 5. sınıf: 132 konu / 691 temizlenmiş canlı soru
- Toplam yeni canlı soru: 3.430

4. ve 5. sınıf hazırlık paketlerindeki aynı sorunun "benzer bağlam" türü yapay tekrarları canlı migration'dan ayıklanmıştır. Hazırlık dosyaları kaynak olarak korunur.

## Öğrenci akışı
Ders → Tema / Ünite / Öğrenme Alanı → Konu (tek kart) → Soru Havuzu

Aynı konuya ait sorular ayrı konu kartı oluşturmaz.

## Simgeler
API katmanına üst sınıflar için konu kodu tabanlı simge eşlemesi eklendi. Örnekler:
- Para: ₺
- Kesir: 🍕
- Açı: 📐
- Veri: 📊
- Elektrik: ⚡
- Hücre: 🔬
- Harita: 🗺️
- Demokrasi: 🗳️
- Siber güvenlik: 🔐

## Güvenlik
- Öğrenci HTML/CSS tasarımı değiştirilmedi.
- Logo, görseller ve AdımBot değiştirilmedi.
- Güncelleme ekranı değiştirilmedi.
- 6. sınıf tamamlanmadığı için canlıya alınmadı.
- 6. sınıfta hazır olan Türkçe, Matematik, Fen ve Sosyal Bilgiler çalışmaları yalnız hazırlık klasöründe saklandı.

## Migration
- 033_grade3_meb_icerik_aktivasyonu.sql
- 034_grade4_meb_icerik_aktivasyonu.sql
- 035_grade5_meb_icerik_aktivasyonu.sql
