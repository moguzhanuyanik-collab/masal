# İlkAdım V1.0.44 — Kurum Kullanıcıları Eski Şema Uyumluluk Düzeltmesi

Düzeltilen hata:

`SQLSTATE[42S22]: Column not found: 1054 Unknown column 'kullanici_id' in 'INSERT INTO'`

- Sunucuda önceden bulunan `kurum_kullanicilari` tablosu silinmez.
- `kurum_id` kolonu yoksa, canlı `kurumlar.id` kolonunun gerçek MySQL tipi kullanılarak eklenir.
- `kullanici_id` kolonu yoksa, canlı `kullanicilar.id` kolonunun gerçek MySQL tipi kullanılarak eklenir.
- Eski satırları bozmamak için bu iki yeni kimlik kolonu uyumluluk aşamasında NULL kabul edecek şekilde eklenir.
- `kurum_rolu`, `aktif` ve `olusturulma_tarihi` kontrolleri korunur.
- Eksik `ix_kurum_kullanici_user` ve `ix_kurum_kullanici_role` indeksleri veri silmeden eklenir.
- Yarım kalan 019 migration güvenli biçimde yeniden çalışabilir.
- V1.0.42 rol paneli ayrımı ve V1.0.43 eski `kurumlar` tablosu uyumluluğu korunur.
- Kullanıcı, kurum, öğrenci ilerleme verileri, CSS ve görseller değiştirilmez.
