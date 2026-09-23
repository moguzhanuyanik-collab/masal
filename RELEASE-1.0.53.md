# İlkAdım V1.0.53 — Kurum Eşleştirme Kurum Kapsamı

- V1.0.52 ana dalı temel alındı; önceki telefon commitleri korunur.
- Kurumlar Modülü > Eşleştirme bölümünde kurum seçimi zorunlu hale getirildi.
- Kurum seçilmeden öğrenci/eşleştirme tablosu yüklenmez ve “Yeni Eşleştirme” düğmesi pasif kalır.
- Kurum seçildiğinde AJAX API yalnızca o kuruma ait aktif öğrencileri, velileri ve öğretmenleri döndürür.
- Eşleştirme modalı seçilmiş kuruma sabitlenir; başka kurumdaki veli/öğretmen istemci tarafından seçilemez.
- Sunucu tarafındaki mevcut kurum doğrulaması korunur; farklı kuruma ait öğrenci/veli/öğretmen gönderilirse işlem reddedilir.
- Mevcut eşleştirmeler tabloda görünmeye, ekleme/güncelleme/kaldırma işlemleri AJAX ve modal üzerinden sayfa yenilenmeden çalışmaya devam eder.
- `veli_ogrenci` ve `ogretmen_ogrenci` tabloları kullanılmaya devam eder.
- V1.0.48 Öğretmenim modülüne, mevcut CSS dosyalarına ve görsellere dokunulmadı.
