# İlkAdım v1.1.48

- Öğretmen ödev listesinden ödev ayrıntısına geçer; ödev metnini ve mevcut kurum üyeliği ile öğretmen bağlantısına göre hedef öğrencileri görür.
- Ayrıntı ekranı yalnız aktif öğretmen hesabının, aktif kurum üyeliğindeki kendi ödevlerini açar. Başkasının ödevi veya geçersiz kimlik için 404, veritabanı okuma hatası için 503 döner.
- Öğrenci ekranı, veritabanı şeması ve mevcut kayıtlar değiştirilmedi. Tamamlama/teslim tarihi takibi bu sürümün kapsamında değildir.

## Doğrulama

- Sürüm, değişiklik kapsamı ve sorgular statik olarak kontrol edildi.
- PHP ve gerçek rol/veritabanı testi bu ortamda çalıştırılamadı.

Taban sürüm: v1.1.47
