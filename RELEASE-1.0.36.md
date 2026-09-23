# İlkAdım V1.0.36 — Yetkilendirme Veritabanı Uyumluluk Düzeltmesi

- V1.0.35 gerçek kullanıcı ve yetkilendirme özellikleri korunur.
- `veli_ogrenci` ve `ogretmen_ogrenci` tabloları oluşturulurken ebeveyn/öğretmen/öğrenci kimlik sütunlarının gerçek MySQL tipleri otomatik okunur.
- Eski veritabanında önceden bulunan `veliler` veya `ogretmenler` tabloları varsa silinmez; yalnızca yetkilendirme için gereken eksik kolonlar eklenir.
- İlişki tablolarının oluşturulması eski tablo motoru veya farklı ID tipi yüzünden `errno: 150` ile durmaz.
- Daha önce yarıda kalan 018 migration güvenli biçimde tekrar çalıştırılabilir; tamamlanmış tablolar `CREATE TABLE IF NOT EXISTS` ile korunur.
- Mevcut öğrenci verileri, V4/PWA çalışmaları, V1.0.35 rol sistemi, CSS ve görseller değiştirilmedi.

Düzeltilen hata:
`SQLSTATE[HY000]: General error: 1005 Can't create table ... veli_ogrenci (errno: 150 "Foreign key constraint is incorrectly formed")`
