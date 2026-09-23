# İlkAdım 1.0.61 — Global Yönetim ve Yetkiler

- Süper admin menüsü Kurum, Global, Yetkiler ve Profil bölümleriyle düzenlendi.
- Global veli ve öğrenci eşleştirmeleri ayrı ekranda kurulup kaldırılabiliyor.
- Kurum yöneticilerine kurum görüntüleme, öğretmen, veli ve öğrenci hesaplarını yönetme izinleri ayrı ayrı atanabiliyor. İzinler sayfa erişiminde de kontrol ediliyor; mevcut yöneticilerin izinleri geçiş sırasında korunuyor.
- Süper admin profilinde ad ve fotoğraf güncellenebiliyor. Fotoğraf 256 piksele küçültülerek en fazla 150 KB olarak saklanıyor.
- Güncelleyici, mevcut öğrenci kaydını her sürüm kurulumunda yeniden yazmıyor. Canlıdaki eski güncelleyici bu düzeltmeyi ilk kurulumdan önce çalıştıramayacağı için 1.0.61 canlıya güvenli PATCH yoluyla geçirilmelidir.
- Öğrenci uygulamasının HTML, CSS, JavaScript ve AJAX dosyaları değiştirilmedi.
