
# AdımBot 1.1.89

Taban: 1.1.88 / b2da3bfe9216b19d402fe2bcf1c4c3cb5c889730. Yalnız AdımBot sohbet/robot kapsamı. Canlı kurulum yapılmadı.

## 15 değişiklik ve doğrulama

1. Kayıtlı özel AI sağlayıcısı iptal sinyalini dinlemese bile iptal yarışı sonucu engeller. Test: sinyali yok sayan sağlayıcıya geç başarı verildi.
2. Yalnız noktalama veya emoji içeren model yanıtı anlamlı yanıt sayılmaz; güvenli kısa geri dönüş gösterilir. Test: ?!, ..., 👋.
3. Sohbet bekleme süresi yalnız kota hatasında uygulanır. Test: rate-limit yanıtları gecikiyor; auth/config hataları gecikmiyor.
4. Anahtar/izin/model/ayar hatalarında öğrencinin yazdığı soru kutuda kalır ve düzeltmeden sonra yeniden gönderilebilir. Test: 10 ayrı düzeltilebilir neden.
5. Öğrenciye gösterilen hata metni sağlayıcı kodunu, HTTP durumunu veya anahtar/model bilgisini açıklamaz. Test: auth/izin/config/cURL sabit mesajları.
6. Tekrar denemelerde hata balonu güncellenir; aynı hata için yeni balon birikmez. Test: iki ardışık başarısız deneme, tek balon.
7. Yanıt denetimi, istek başında alınan aynı ders/soru bağlamını kullanır. Test: AI isteği ve teslim aynı snapshot'ı alıyor.
8. Kayıtlı sohbet açılınca görünür alan son mesaja kayar; kapanmış/yeni dialog'a ait olmayan eski animation-frame kaydırmaz. Test: güncel ve stale callback.
9. AI yanıt verirken mikrofon kapatılır ve erişilebilir etiketi nedenini açıklar; istek bitince etkinleşir. Test: aç/kapat ve aria-label.
10. Groq benzeri [BLANK_AUDIO]/[NO_SPEECH] çıktıları boş ses olarak durdurulur. Test: alt çizgili ve boşluklu biçimler.
11. Müzik/alkış/sessizlik metadata'sı gönderilmez; geçerli tek sözcük eğitim soruları korunur. Test: [MUSIC], [APPLAUSE], Müzik, A, 2.
12. requestSubmit bulunmayan eski Safari biçiminde görünür Gönder düğmesi yedeği çalışır. Test: başarılı düğme tıklaması ve düğme yokken anlaşılır uyarı.
13. AdımBot her normal yanıtta şaşırma yüzü kullanmaz; olumlu sözlerde mutlu, diğer yanıtlarda düşünceli ifade seçilir. Test: iki sınıf.
14. Güvenlik/destek yanıtı cesaretlendirici ifadeyi korur. Test: hassas destek yanıtı encourage modunda seslendirilir.
15. Mikrofondan gelen metin yazılmış taslağı silmez; ikisini boşlukla birleştirir, aynı metni iki kez eklemez. Test: taslak + ses, aynı sözcük ve boş taslak.

## Kök nedenler

Özel sağlayıcılarda iptal davranışı sağlayıcı koduna bırakılmıştı. Her HTTP cevabına Retry-After uygulanması auth/config arızasında da öğrenciyi bekletebiliyordu; ayar hataları otomatik yeniden gönderim için soruyu korumuyordu. Aynı tekrarlar hata balonlarını çoğaltıyordu. Geç yanıt ile aktif ders bağlamı farklılaşabiliyor; saklanan sohbet dialog açıldığında son mesajı göstermiyordu. Mikrofon yazı taslağını ezebiliyor, sessiz ses sentinelleri geçerli soruya dönüşebiliyordu. Her AI yanıtına şaşırma ifadesi verilmesi konuşma tonunu tutarsızlaştırıyordu.

## Kapsam ve kontroller

- JS syntax: adimbot-ai-bridge.js, adimbot-chat-ui.js, adimbot-student.js geçti.
- Dokuz tests/adimbot-*.cjs dosyası geçti: 16 yeni chat senaryosu ve önceki ses, güvenlik, animasyon, mikrofon oturumu, mobil sürükleme/diyalog regresyonları.
- Değişenler: adimbot-ai-bridge.js, adimbot-chat-ui.js, yeni tests/adimbot-chat-89.cjs, dialog test harness güncellemesi, version.json, bu release notu.
- CSS/PHP/API/DB/menü/ders mantığı değiştirilmedi. JS cache URL'leri dosya SHA-256 özeti kullandığı için PHP güncellemesi gerekmedi.
- Tarayıcı görsel kontrolü yapılamadı: Playwright Chromium yürütülebilir dosyası ortamda bulunmuyor. Robota özgü animasyon testleri yapay ses/DOM olaylarıyla sınırlı.
- Gerçek sağlayıcı, mikrofon, Safari, API anahtarı ve ses dinleme testi yapılmadı. PHP runtime ve canlı sunucuya erişim yok.

## Kalan işler

Önceki turda not edilen transkripsiyon sunucusunun 400 karakter kesmesi ve Retry-After başlığını PHP hata yanıtına taşıma işi sürüyor; bu sürüm bunlara dokunmadı. Gemini TTS Türkçe desteği resmî belgede var, ancak hesap erişimi/ücret ve çocuklara uygun ses gerçek dinlemeyle doğrulanmalı. Entegrasyon açılmadı; cihaz TTS yedeği korunuyor.

## Kurulum sırası

1. Güncelleme ekranından 1.1.89 paketini kur.
2. Öğrenci ekranını yenile; yazılı taslak varken mikrofonla kısa soru sorup metin birleşimini gör.
3. AI sorusu beklerken mikrofonun kapandığını ve yanıt yüz ifadesini dene.
4. Hatalı sağlayıcı ayarı durumunda sorunun kutuda kaldığını kontrol et; ayarları Süper Admin'den düzeltip aynı soruyu yeniden gönder.
5. Hareket azaltma ve cihaz Türkçe sesini gerçek cihazda ayrıca dene.
