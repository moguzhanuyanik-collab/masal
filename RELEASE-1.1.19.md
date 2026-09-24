# İlkAdım 1.1.19 — Soru İpucu Seslendirme Düzeltmesi

- Derslerin soru çözüm ekranındaki üst “İpucu” alanı AdımBot seslendirme sistemine dahil edildi.
- İpucu düğmesine dokunulduğunda düğmenin mevcut açma/kapatma davranışı engellenmez.
- İpucu içeriği açıldıktan sonra DOM güncellemesi beklenir ve görünen/bağlı ipucu metni AdımBot tarafından okunur.
- aria-controls, aria-describedby, data-target, data-bs-target ve yaygın hint/ipucu içerik kapsayıcıları desteklenir.
- Dinamik soru ekranlarında yeni oluşan ipucu düğümleri mevcut MutationObserver/dekorasyon akışıyla otomatik işaretlenir.
- Doğru cevap veya doğru şık çıkarımı yapılmaz; yalnızca ekranda mevcut ipucu metni okunur.
- Veritabanı, API, soru kayıtları ve sürükleme koordinatları değiştirilmedi.
- v1.1.18 Öğrenme Asistanı ve önceki AdımBot özellikleri korunur.
