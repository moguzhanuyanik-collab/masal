# İlkAdım V1.0.49 — AJAX Kurumlar Modülü

- Kurumlar alanı tek bir yönetim modülüne dönüştürüldü.
- İç menü sekmeleri:
  - Kurumlar
  - Yöneticiler
  - Öğretmenler
  - Veliler
  - Öğrenciler
- Sekme geçişleri AJAX ile yapılır; sayfa tam yenilenmez.
- Liste filtreleme ve arama istemci tarafında hızlı çalışır.
- Yönetici/öğretmen/veli/öğrenci listelerinde kurum filtresi bulunur.
- Kurum tablosundaki “Yönet” butonu seçilen kurumu filtreleyerek Yöneticiler sekmesine geçirir.
- Ekleme ve güncelleme işlemleri tek modal pencerede yapılır.
- Modal kaydı AJAX ile gönderilir ve tablo sayfa yenilenmeden güncellenir.
- Silme işlemleri AJAX ile yapılır.

## Güvenli silme

- Kurum silme fiziksel veri silmez; kurumu pasife alır.
- Kurum pasife alınınca kurum üyelikleri pasif olur.
- Başka aktif kurumu olmayan kullanıcı hesapları ve ilgili profiller pasife alınır.
- Başka aktif kurum üyeliği bulunan kullanıcı hesabı açık kalır.
- Süper Admin hesabı kurum kullanıcı listesinden silinemez.
- İlkAdım sistem kurumu silinemez.

## Kullanıcı CRUD

- Yöneticiler, öğretmenler, veliler ve öğrenciler tablo halinde listelenir.
- Yeni kullanıcı eklenirken kurum, ad soyad, e-posta ve geçici şifre alınır.
- Öğretmen ve veli için telefon alanı da bulunur.
- Güncellemede kurum değiştirilebilir.
- Şifre boş bırakılırsa mevcut şifre korunur.
- Kurum değişikliğinde eski üyelik pasif, yeni üyelik aktif hale gelir.

## Teknik

Yeni dosyalar:
- `api/kurumlar-modulu.php`
- `src/kurumlar_modulu.php`
- `kurumlar-modul.css`
- `kurumlar-modul.js`

Mevcut `kurum.css` ve görseller değiştirilmedi.
Kurum yöneticisinin mevcut kurum sayfaları korunur; Süper Admin kurum detayından yeni AJAX modülüne yönlendirilir.
