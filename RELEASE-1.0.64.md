# İlkAdım 1.0.64 — Global Kullanıcı Tablo Yönetimi

- Global Öğrenciler ve Global Veliler sayfaları tablo düzenine geçirildi.
- Yeni öğrenci/veli ekleme işlemleri tablo üstündeki butondan açılan modal forma taşındı.
- Her kayıt için Güncelle ve Sil işlemleri eklendi.
- Silme işlemi fiziksel silme yapmaz; kullanıcı ve ilgili profil kaydı güvenli biçimde pasife alınır.
- Güncellemede ad, e-posta ve isteğe bağlı yeni şifre değiştirilebilir.
- Veli · öğrenci eşleştirme işlemi ayrı Global Eşleştirme sayfasında korunur.
- Pasife alınan veli/öğrenci bağlantıları aktif listelerde gösterilmez.
- Öğrenci uygulamasının HTML, CSS, JavaScript ve AJAX dosyaları değiştirilmedi.

Değişen uygulama dosyaları: `global-ogrenciler.php`, `global-veliler.php`, `src/kurum_yonetimi.php`, `super-admin-pages.css` ve `version.json`.
