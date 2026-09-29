# İlkAdım AdımBot v1.1.78

## Değişiklikler

- Groq ve Gemini ses isteklerinde anahtar reddi, erişim izni, kapanmış model, bulunamayan model, hatalı istek, kota ve geçici servis hataları ayrı sınıflandırılır; sağlayıcının ham hata metni öğrenciye gönderilmez.
- Ses hataları öğrenciye ve yöneticiye anlaşılır, sorunun türüne uygun Türkçe mesajlarla gösterilir.
- MediaRecorder, destek bildiren fakat belirli kayıt biçimiyle başlatılamayan mobil tarayıcılarda sıradaki güvenli biçimi ve son olarak cihazın varsayılan biçimini dener.
- Mobil Safari’deki kısa süreli mikrofon `mute` olayı kaydı hemen bozmaz; ses kanalı 900 ms boyunca kapalı kalırsa kayıt güvenli biçimde sonlandırılır.
- Konuşma yazıya çevrilirken ikinci mikrofon kaydı engellenir; sayfa gizlenir, sohbet kapanır veya metin gönderilirse bekleyen transkripsiyon iptal edilir.
- Tarayıcı ses tanımasında izin, ses yakalama, bağlantı ve boş konuşma hataları birbirinden ayrılır.
- Sohbet geçmişinde e-posta, bağlantı, telefon ve 11 haneli kimlik bilgileri tarayıcı oturumuna ham biçimde yazılmaz; başarısız istek geri alma davranışı maskelenmiş metinle de çalışır.
- İstemci güvenlik filtresi dış bağlantı ve kişisel bilgiyi maskelemeden önce denetler; böylece sakıncalı sağlayıcı yanıtı yalnızca yer tutucuya dönüşüp kabul edilmez.
- Aktif ders sorusunda “2 + 2 = 4” veya “dört eder” gibi dolaylı sonuç açıklamaları da engellenip düşünme ipucuna dönüştürülür.

## Doğrulama

- JavaScript sözdizimi, istemci güvenlik öz testi, mikrofon durum akışı ve değişiklik kapsamı kontrolleri yapıldı.
- Sağlayıcı hata sınıflandırmaları kaynak tabanlı testlerle doğrulandı.
- Bu ortamda PHP yorumlayıcısı, gerçek API anahtarı ve telefon bulunmadığından PHP çalışma testi, gerçek Groq/Gemini isteği ve mobil cihaz testi yapılmadı.
