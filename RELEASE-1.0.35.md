# İlkAdım V1.0.35 — Gerçek Kullanıcı ve Yetkilendirme

- Merkezi `kullanicilar` ve `kullanici_rolleri` yapısı eklendi.
- Mevcut öğrenci hesapları otomatik olarak yeni kimlik sistemine bağlanır.
- Öğrenci / veli / öğretmen / yönetici / süper admin rolleri eklendi.
- Veli–öğrenci ve öğretmen–öğrenci eşleştirmeleri eklendi.
- Yetki Merkezi ve Kullanıcı Yönetimi sayfaları eklendi.
- Yönetici tarafından yeni öğrenci, veli ve öğretmen hesabı oluşturulabilir.
- Süper Admin yönetici hesabı ve ek roller oluşturabilir.
- Veli/öğretmen yalnızca eşleştirilmiş öğrencilerin raporlarını görebilir.
- Öğrenci raporları salt-okunur yetki kontrolüyle sunulur.
- Merkezi e-posta/şifre yönetimi eklendi.
- Kalıcı oturum tokenleri merkezi kullanıcı hesabına taşındı.
- Yetki değişiklikleri için denetim kaydı eklendi.
- PWA çevrimdışı eşitlemesi öğrenci hesabı ile sınırlı kalır; diğer roller ilerleme yazamaz.
- İlk Süper Admin etkinleştirildikten sonra güncelleme merkezi yalnızca Süper Admin tarafından kullanılabilir.
- Mevcut CSS ve görseller değiştirilmedi.

İlk Süper Admin kurulumu için `YETKILENDIRME-1.0.35.md` dosyasına bak.
