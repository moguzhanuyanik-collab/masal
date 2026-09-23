# İlkAdım V1.0.42 — Rol Panellerini Tam Ayırma

Bu sürüm kullanıcı rollerini birbirinden kesin olarak ayırır.

- Oturum için tek bir etkin rol belirlenir.
- Rol önceliği: Süper Admin → Yönetici → Öğretmen → Veli → Öğrenci.
- Süper Admin hesabı başka rol kayıtlarına sahip olsa bile Öğretmen, Veli, Yönetici veya Öğrenci paneline geçemez.
- Yönetici yalnızca Yönetici paneli ve kendi kurum yönetim sayfalarında kalır.
- Öğretmen yalnızca Öğretmen paneli ve kendisine yetkili öğrenci raporlarını kullanır.
- Veli yalnızca Veli paneli ve kendisine bağlı öğrenci raporlarını kullanır.
- Öğrenci yalnızca mevcut öğrenci uygulamasını kullanır.
- Başka rol panelinin URL'si elle yazılırsa kullanıcı kendi rol ana sayfasına geri yönlendirilir.
- Öğrenci uygulamasının profil menüsündeki ortak Yetki Merkezi ve Süper Admin güncelleme bağlantıları kaldırıldı.
- Ortak `rol-paneli.php`, ilk Süper Admin kurulumu tamamlandıktan sonra normal navigasyonda kullanılmaz ve aktif rol paneline yönlendirir.
- `hesap-guvenligi.php`, işlem sonunda ve geri butonunda kullanıcının kendi rol paneline döner.
- `ogrenci-raporu.php` geri bağlantısı görüntüleyen kullanıcının kendi rol paneline döner.
- Güncelleme merkezi yalnızca etkin rolü Süper Admin olan hesapta açılır ve menüsü öğrenci uygulamasına geçmez.
- Yönetici panelinden Süper Admin'e, Öğretmen/Veli panellerinden Yetki Merkezi'ne geçiş bağlantıları kaldırıldı.
- Birden fazla rol kaydı olan hesaplarda öğrenci erişimleri de etkin role göre izole edilir.
- Mevcut kurum, kullanıcı, öğrenci ilerleme verileri, CSS dosyaları ve görseller değiştirilmedi.
