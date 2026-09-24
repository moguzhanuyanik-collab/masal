# İlkAdım 1.1.1 — AdımBot AI Chat MVP

- Profil > AdımBot Ayarları içine güvenli “AdımBot ile Sohbet” alanı eklendi.
- Öğrenci sohbet mesajları 400 karakterle sınırlı; yanıtlar kısa ve 1. sınıf seviyesinde tutulur.
- Son ders/konu/soru bağlamı yalnız sessionStorage içinde kısa eğitim bağlamı olarak tutulur; kimlik bilgileri bağlama eklenmez.
- AI istekleri yalnız aynı oturumdaki öğrenci hesabından sunucu endpoint'ine gönderilir.
- OpenAI API anahtarı tarayıcıya gönderilmez; yalnız config/local.php veya OPENAI_API_KEY üzerinden sunucuda okunur.
- Oturum başına 10 dakikalık hız limiti uygulanır.
- AI doğru cevabı/şıkkı doğrudan vermemeye, ipucuyla yönlendirmeye zorlanır.
- Kişisel bilgi, dış bağlantı, özel iletişim ve riskli içerik için hem istemci hem sunucu filtresi uygulanır.
- AI çıktısından yalnız metin kullanılır; uygulama komutu, URL veya DOM işlemi çalıştırılmaz.
- Güvenli yanıt, AdımBot'un mevcut ses motoruyla seslendirilebilir.
- “Birlikte Keşfedelim” ders kartları okunabilir hale getirildi.
- Soru okurken “Şimdi sıra sende” yönergesi seslendirmeden çıkarılır; yalnız gerçek soru okunur.
- AI sağlayıcısı için varsayılan model gpt-6-astra'dır ve config üzerinden değiştirilebilir.
