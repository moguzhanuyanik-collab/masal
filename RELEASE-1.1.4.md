# İlkAdım 1.1.4 — AdımBot Kısa Sohbet Hafızası

- AdımBot modal sohbeti aynı öğrenci oturumu içinde kısa konuşma bağlamını hatırlar.
- Yalnız son 6 kullanıcı/AdımBot mesajı sessionStorage içinde tutulur; veritabanına sohbet kaydı yazılmaz.
- Sohbet geçmişi AI isteğine eklenmeden önce tarayıcı ve sunucu tarafında tekrar temizlenir ve kişisel bilgiler maskelenir.
- Sunucu yalnız user/assistant rollerini, en fazla 6 geçmiş mesajı ve mesaj başına en fazla 300 karakteri kabul eder.
- Profil, kullanıcı adı, e-posta, telefon, kimlik veya konum sohbet hafızasına bilinçli olarak eklenmez.
- Modal başlığına “Temizle” düğmesi eklendi; öğrenci kısa sohbet hafızasını tek dokunuşla sıfırlayabilir.
- Modal yeniden açıldığında aynı oturumdaki kısa sohbet ekranda geri gelir.
- 1.1.3 ayrı ayar sayfası ve robot üzerindeki 💬 modal sohbet yapısı korunur.
- 1.1.2 güvenlik, CSRF, timeout, hız limiti ve cevap anahtarı korumaları korunur.
