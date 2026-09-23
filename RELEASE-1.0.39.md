# İlkAdım V1.0.39 — Hesap ve Yetkiler Sayfası Açılmama Düzeltmesi

- Profildeki "Hesap ve Yetkiler" bağlantısının açtığı Yetki Merkezi güçlendirildi.
- Önceki yarım yetkilendirme migration'larında `ogrenciler.kullanici_id` eşleşmesi boş kaldıysa öğrenci e-postası üzerinden merkezi kullanıcı hesabı güvenli biçimde bulunur ve eşleşme onarılır.
- `veli_ogrenci` veya `ogretmen_ogrenci` tabloları henüz hazır değilse Yetki Merkezi artık 500 hatasıyla düşmez.
- Veli ve öğretmen ilişki sorguları yalnızca gerekli tablo ve kolonlar mevcutsa çalışır.
- Yetki Merkezi'ndeki veritabanı sayaç sorguları cursor kapatılarak çalıştırılır.
- Öğrenci özetlerinden biri okunamazsa bütün sayfa kapanmaz; diğer hesap/yetki işlemleri kullanılabilir kalır.
- V1.0.35 gerçek yetkilendirme, V1.0.36 ilişki uyumluluğu, V1.0.37 PDO düzeltmesi ve V1.0.38 collation düzeltmesi korunur.
- CSS, görseller, V4/PWA modülleri ve öğrenci ilerleme verileri değiştirilmedi.
