# İlkAdım v1.1.23

## Acil düzeltme
- v1.1.22'de tamamlanan modüllerin soru/şık verisini bootstrap aşamasında boşaltan değişiklik geri alındı.
- Canlıdaki `app-runtime.js` soru alanlarını her modülde beklediği için oluşan “Dersler altında sorular açılmıyor / sorular gelmiyor” hatası giderildi.
- `api/bootstrap.js.php` ders ve soru verisini tekrar v1.1.21'deki çalışan biçimde gönderir.
- `index.php` içinden `completed-question-guard.js` yüklemesi kaldırıldı.

## Korunanlar
- v1.1.21 AdımBot açıklama seslendirme ve tek karşılama düzeltmeleri korunur.
- CSS, tasarım, resim, ikon ve veritabanı şeması değiştirilmedi.
- Eksik `app-runtime.js` ve `src/bootstrap.php` dosyalarına dokunulmadı.

Not: Tamamlanan soruların tekrar açılmasını engelleme özelliği bu hotfixte devre dışı bırakıldı; soru akışının çalışması önceliklendirildi.

Taban sürüm: v1.1.22
