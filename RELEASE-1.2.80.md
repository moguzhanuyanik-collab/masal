# İlkAdım 1.2.80 — Runtime ve Sayfa Açılış Sağlamlaştırması

Bu sürüm 1.2.79 rev 2 otomatik güncelleyici bootstrap sürümünün üstüne gelir.

## Düzeltmeler

- Güncelleme ekranı 1.2.80 cache-buster ile yeni updater runtime'ını yükler.
- Hostingde native mbstring uzantısı yoksa kritik mb_* çağrıları için güvenli uyumluluk katmanı devreye girer.
- Öğretmen Ödevleri sınıf/grup sorgusu hata verirse sayfanın tamamı 500 olmak yerine grup filtresiz devam eder.
- Öğretmen Soru Performansı için aynı kontrollü fallback uygulanır.
- Sistem Durumu native mbstring ile runtime fallback durumunu ayırır.
- Yeni migration yoktur.

Öğrenci raporu ve öğretmen içerik ekranındaki daha geniş SQL sağlamlaştırması bu sürüme zorla dahil edilmemiştir; yayın güvenliği için ayrı takip edilecektir.
