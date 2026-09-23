# İlkAdım V1.0.18

Mevcut 52 modül korunarak 61 yeni ve farklı 1. sınıf ders modülü eklendi.

- Türkçe: +15
- Matematik: +15
- Hayat Bilgisi: +10
- Görsel Sanatlar: +6
- Müzik: +5
- Beden Eğitimi ve Oyun: +5
- Serbest Etkinlikler: +5
- Yeni toplam hedef: 113 ders modülü

Her yeni modül mevcut ders_modulleri yapısını kullanır:
baslik, alt_baslik, emoji, okuma_metni, ornek_metni, soru,
secenekler_json, dogru_cevap_indeksi, aciklama, sira ve aktif.

Yeni başlıklar V1.0.17 paketindeki başlıkları tekrar etmez.
Migration aynı başlığı ikinci kez eklememek için NOT EXISTS kontrolü içerir.
Yeni tablo oluşturulmadı.
CSS ve görseller değiştirilmedi.
