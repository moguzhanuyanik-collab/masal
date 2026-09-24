# İlkAdım 1.1.3 — AdımBot Modal Sohbet ve Ayrı Ayar Sayfası

- Profil ekranındaki AdımBot sohbet bölümü kaldırıldı.
- Profil > AdımBot Ayarları bağlantısı artık ayrı #/adimbot-ayarlari ekranını açar.
- Ayarlar mevcut profil tasarımının altına eklenmez; #screen içinde bağımsız ayar sayfası olarak gösterilir.
- AdımBot üzerine 💬 sohbet simgesi eklendi.
- 💬 simgesi ana öğrenci ekranında ve öğrenciye ait Öğretmenim ekranında görünür.
- Sohbet, mevcut ders ekranını kapatmadan modal olarak açılır; arka tasarım karartılmış şekilde görünmeye devam eder.
- Modal dışına dokunma, × ve Escape ile sohbet kapatılabilir.
- Sohbet güvenliği, CSRF, timeout, hız limiti, kişisel veri filtreleri ve sesli yanıt 1.1.2'den korunur.
- Son ders/konu/soru bağlamı modal sohbet tarafından kullanılmaya devam eder.
- Profil ayar sayfasından ses, konuşma hızı, rehber modu ve robot görünürlüğü yönetilir.
