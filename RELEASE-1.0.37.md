# İlkAdım V1.0.37 — MySQL 2014 Güncelleme Düzeltmesi

Düzeltilen hata:

`SQLSTATE[HY000]: General error: 2014 Cannot execute queries while other unbuffered queries are active`

- V1.0.35 gerçek kullanıcı/yetkilendirme sistemi korunur.
- V1.0.36 veli–öğrenci / öğretmen–öğrenci tablo uyumluluk düzeltmesi korunur.
- `018_gercek_yetkilendirme.sql` içindeki koşullu boş işlemlerde kullanılan `SELECT 1` kaldırıldı.
- Bu işlemler artık sonuç seti üretmeyen `SET @ilkadim_noop = 1` komutunu kullanır; sonraki DDL sorgusu açık sonuç setine takılmaz.
- Güncelleyicide `SHOW INDEX` sonucu da tamamen okunup cursor kapatıldıktan sonra yeni sorguya geçilir.
- Yarım kalan 018 migration tamamlanmış sayılmadığı için V1.0.37 kurulurken yeniden çalıştırılabilir.
- Mevcut kullanıcı/öğrenci verileri, V4/PWA modülleri, CSS ve görseller değiştirilmedi.
