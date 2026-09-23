# İlkAdım V1.0.47 — Kurum Listesi ve Modal Yönetimi

- Kurumlar sayfası tablo görünümüne çevrildi.
- Tablo üstüne “Yeni Kurum Ekle” butonu eklendi.
- Kurum ekleme ve kurum güncelleme aynı modal üzerinden yapılır.
- Kurum adı, kodu, türü, içerik kaynağı, e-posta, telefon ve adres bilgileri modalda yönetilir.
- Her kurum satırında Aç, Düzenle ve uygun kurumlarda Pasife Al işlemleri bulunur.
- İlkAdım sistem kurumu yanlışlıkla pasife alınamaz.
- Kurum pasife alındığında kurumun tüm `kurum_kullanicilari` üyelikleri pasif yapılır.
- Başka aktif kurumu olmayan kurum kullanıcılarının `kullanicilar.aktif` değeri de pasif yapılır.
- Pasife çekilen kullanıcının öğrenci/veli/öğretmen profili de pasif yapılır.
- Pasife çekilen kullanıcıların kalıcı oturum tokenları temizlenir.
- Kullanıcı başka aktif bir kurumda da çalışıyorsa hesabı tamamen kapatılmaz; yalnızca pasife alınan kurum üyeliği kapanır.
- Süper Admin hesapları kurum pasif işleminde kullanıcı hesabı olarak pasife çekilmez.
- Pasife alma işlemi transaction içinde gerçekleştirilir.
- Mevcut `kurum.css` değiştirilmedi.
- Yeni `kurumlar-ui.css` ve `kurumlar-ui.js` dosyaları eklendi.
- Mevcut kurum ve kullanıcı kayıtları silinmez.
