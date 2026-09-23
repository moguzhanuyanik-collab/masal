# İlkAdım V1.0.43 — Eski Kurumlar Tablosu Uyumluluk Düzeltmesi

Düzeltilen hata:

`SQLSTATE[42S22]: Column not found: 1054 Unknown column 'tur' in 'INSERT INTO'`

- Sunucuda daha önceden bulunan `kurumlar` tablosu korunur; tablo silinmez.
- `tur`, `icerik_kaynagi`, `kod`, `ad`, `logo`, `email`, `telefon`, `adres`, `aktif`, `olusturulma_tarihi` ve `guncellenme_tarihi` kolonları tek tek kontrol edilir; eksik olanlar eklenir.
- Eski kurum kayıtlarının boş `kod` alanları veri silmeden otomatik doldurulur.
- `kurum_kullanicilari` tablosu oluşturulurken mevcut `kurumlar.id` ve `kullanicilar.id` kolonlarının gerçek MySQL tipleri okunur.
- Yarım kalmış `019_kurum_ve_rol_panelleri.sql` güvenli biçimde yeniden çalışabilir.
- İlkAdım kurumu bizim kurumumuz olarak korunur.
- Global öğrenci, veli ve öğretmenler İlkAdım kurumuna otomatik bağlanmaz; yalnızca yönetim hesapları kurum yönetimi için bağlanır.
- V1.0.42 rol paneli izolasyonu aynen korunur.
- Mevcut kullanıcı, öğrenci ilerleme, kurum verileri, CSS ve görseller silinmez.
