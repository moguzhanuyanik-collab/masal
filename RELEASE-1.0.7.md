# İlkAdım V1.0.7 — Gerçek Veri Tabanı Entegrasyonu

Bu sürüm tasarıma dokunmaz.

Yeni MySQL tabloları:
- ogrenci_ilerleme
- ogrenci_cevaplari
- favoriler
- oyun_tamamlamalari
- okuma_kayitlari
- calisma_oturumlari
- gunluk_kullanim
- ogrenci_yildizlari
- rozetler
- ogrenci_rozetleri
- gunluk_gorevler

Mevcut uygulama durumu geriye dönük uyumluluk için ogrenci_durumlari.durum_json alanında tutulmaya devam eder.
Aynı veriler raporlama, gelecek AI analizi ve çoklu öğrenci altyapısı için normal MySQL tablolarına da yazılır.

SQL tablo ve sütun adları ASCII'dir. Veriler utf8mb4_unicode_ci kullanır.
CSS ve görsel dosyaları değiştirilmemiştir.
