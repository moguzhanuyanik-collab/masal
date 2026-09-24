# İlkAdım v1.1.21

## Birlikte Keşfedelim açıklaması
- Ders içindeki “Birlikte keşfedelim” bölümü artık HTML etiket türüne bağlı olmadan metinden bulunur.
- Başlık `h1-h4` veya `strong` dışında bir elemanda olsa da yakınındaki açıklama bloğu AdımBot okuma sistemine bağlanır.
- Öğrenci açıklama alanına dokunduğunda AdımBot başlıkla birlikte soru öncesi açıklamayı seslendirir.
- Soru ve şıklar açıklama metnine karıştırılmaz; “Şimdi sıra sende” bölümünden sonraki içerik açıklama okumasına alınmaz.

## Sayfa geçişlerinde konuşma
- Ana sayfa karşılama mesajı aynı tarayıcı sekmesi/oturumu boyunca yalnızca bir kez gösterilir.
- Dersler, Etkinlikler, Profil ve Öğretmenim gibi diğer sayfalarda AdımBot kendiliğinden yeniden karşılama başlatmaz.
- Diğer ekranlarda öğrenci bir kart, bağlantı, uygun buton, açıklama veya AdımBot kontrolüyle etkileştiğinde konuşma devam eder.
- Genel ekran butonları da mevcut “ilk dokunuşta oku, ikinci dokunuşta işlemi yap” davranışına dahil edildi; form gönderme düğmeleri güvenlik için bunun dışında bırakıldı.

## Tasarım güvenliği
- CSS değiştirilmedi.
- Öğrenci ekranının HTML yapısı değiştirilmedi.
- Logo, ikon, AdımBot görseli veya başka resim değiştirilmedi.
- `index.php` ve `ogretmenim.php` içinde yalnızca değişen JavaScript dosyalarının cache sürüm parametresi 1.1.21 yapıldı; DOM/tasarım yapısı değiştirilmedi.
- Veritabanı ve API şeması değiştirilmedi.

Taban sürüm: v1.1.20
