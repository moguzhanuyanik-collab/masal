# İlkAdım V1.0.40 — Kurum ve Rol Panelleri

Bu sürüm V4 tasarım dilini yönetim tarafına uyarlayan kurum ve rol mimarisini ekler.

- `İlkAdım` adında varsayılan platform kurumu oluşturulur.
- İlkAdım platform kurumunun içerik kaynağı `sistem` olarak işaretlenir.
- Mevcut kullanıcılar güvenli biçimde İlkAdım platform kurumuna rol bazında bağlanır.
- Yeni `kurumlar` ve `kurum_kullanicilari` tabloları eklendi.
- Kurum altına yönetici, öğretmen, veli ve öğrenci eklenebilir.
- Süper Admin yeni okul/kurs/platform kurumu oluşturabilir.
- Süper Admin kurum içine yönetici dahil tüm temel rolleri ekleyebilir.
- Kurum yöneticisi yalnızca kendi kurumuna öğrenci, veli ve öğretmen hesabı açabilir.
- Kurum yöneticisinin öğrenci erişimi yalnızca kendi kurumundaki öğrencilerle sınırlandı.
- Veli ve öğretmen öğrencilerle aynı kurum içinde eşleştirilebilir.
- Doğrudan/okulsuz kullanıcılar İlkAdım platform kurumunda sistem ders ve etkinliklerini kullanmaya devam eder.
- Kuruma özel içerik altyapısı için `icerik_kaynagi` alanı hazırlandı; özel kurum içeriği daha sonra bağlanacak.
- Giriş sonrası rol bazlı yönlendirme eklendi:
  - Süper Admin → `super-admin.php`
  - Yönetici → `yonetici-paneli.php`
  - Öğretmen → `ogretmen-paneli.php`
  - Veli → `veli-paneli.php`
  - Öğrenci → mevcut öğrenci uygulaması
- Hesap ve Yetkiler ekranına ilgili rol paneli bağlantıları eklendi.
- Global `yetkilendirme.php` yalnızca Süper Admin'e ayrıldı; kurum yöneticileri `kurum-kullanicilari.php` kullanır.
- Global ekrandan oluşturulan doğrudan kullanıcılar otomatik İlkAdım platform kurumuna bağlanır.
- Süper Admin, Yönetici, Öğretmen, Veli ve Kurum ekranları için ayrı CSS dosyaları oluşturuldu.
- Mevcut `styles.css` ve mevcut görseller değiştirilmedi.
- V1.0.35–V1.0.39 yetkilendirme / MySQL uyumluluk düzeltmeleri korunur.
- Güncelleme merkezindeki Süper Admin kontrol sorgusunun cursor'u güvenli biçimde kapatılır.
