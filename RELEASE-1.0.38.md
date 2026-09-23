# İlkAdım V1.0.38 — MySQL Collation Uyumluluk Düzeltmesi

Düzeltilen hata:

`SQLSTATE[HY000]: General error: 1267 Illegal mix of collations (utf8mb4_turkish_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation '='`

- V1.0.35 gerçek kullanıcı ve yetkilendirme sistemi korunur.
- V1.0.36 ilişki tablosu ID uyumluluk düzeltmesi korunur.
- V1.0.37 PDO unbuffered sorgu düzeltmesi korunur.
- Yeni yetkilendirme tablolarının karakter karşılaştırma standardı `utf8mb4_turkish_ci` olarak değiştirildi.
- Önceki yarım kurulumlarda `utf8mb4_unicode_ci` ile oluşmuş yetkilendirme tabloları veri silmeden `utf8mb4_turkish_ci` değerine dönüştürülür.
- Öğrenci e-postası ile merkezi kullanıcı e-postasını eşleştiren JOIN ifadeleri açık `COLLATE utf8mb4_turkish_ci` kullanır.
- Mevcut öğrenci kayıtları, V4/PWA özellikleri, CSS ve görseller değiştirilmedi.
