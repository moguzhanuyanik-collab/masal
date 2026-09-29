# AdımBot 1.1.88

Taban: 1.1.87 / fcd87105c428bedc80f7219bf1e25b5a9aa7c1d7. Yalnız AdımBot geliştirmesi. Canlı kurulum yapılmadı.

## Tamamlanan 15 ayrı değişiklik ve testleri

1. Metin olmayan/boş başarılı transkripsiyon yanıtı reddedilir. Test: nesne, dizi, sayı, null ve boş string sohbete geçmez.
2. JSON çözümlemesi geç tamamlansa bile iptal/zaman aşımı sonrası transkripsiyon kabul edilmez. Test: abort sonrası geç başarılı yanıt.
3. Bozuk JSON içeren 429 yanıtında Retry-After sayısal/tarih başlığı korunur. Test: iki başlık biçimi.
4. Bekleme süresi yalnız rate_limit/provider_rate_limit için uygulanır; auth hatası kota diye gösterilmez. Test: 401 + Retry-After.
5. Tarayıcıdan gelen uzun transkripsiyon kırpılıp otomatik gönderilmez; düzenleme için tamamı input'ta kalır. Elle gönderme de 400 üstünü reddeder. Test: 401+ karakter ve manuel submit koruması.
6. Yalnız sessizlik/gürültü metadata'sı veya noktalama taşıyan transkripsiyon otomatik gönderilmez. Test: Türkçe/İngilizce köşeli/parantezli metadata; tek harf ve Müzik gibi gerçek kelimeler korunur.
7. Tarayıcı dinlemesi elle bitirilince sonuç için 2.5 saniyelik sınırlı, oturuma ait bekleme kullanılır. Test: timeout temizliği ve yeni oturumun korunması.
8. language-not-supported hatası Türkçe desteği eksikliği olarak açıklanır. Test: sabit Türkçe tanı mesajı.
9. Gerçek ses parçasının MIME türü ve uygun dosya uzantısı kullanılır; bilinmeyen biçim yüklenmez. Test: boş recorder MIME + mp4 parça => m4a; octet-stream engellenir.
10. Bitmiş kayıt oturumunun geç error olayı çalışan transkripsiyonu iptal edemez. Test: eski recorder error, yeni request controller korunur.
11. AudioContext ölçer kurulumu yarıda kalınca oluşturulan kaynak kapatılır; kayıt ölçersiz devam edebilir. Test: createAnalyser hatası, close çağrısı ve null ölçer.
12. Boş/bitmiş/devre dışı ses kanalları erken reddedilir. Test: üç bozuk akış ve bir canlı akış.
13. Bozuk cihaz sesi girdileri elenir; geçerli Türkçe ses seçimi çökmez. Test: null/nesne/sayı/bozuk lang + geçerli tr-TR.
14. Duraklatmadan dönüşte callback yeni konuşma başlatırsa yeni konuşmanın watchdog'u korunur. Başlamamış konuşmanın tanısı start_timeout olarak kalır; gecikmiş başlangıçta normal konuşma süresi kullanılır. Test: deferred onStart yeni konuşma ve doğru startup deadline.
15. Virgül/noktalı virgül/iki nokta kelime sınırlarında ağız kısa dinlenir; dinlenirken ilave kol jesti üretilmez, sonraki kelimede ağız açılır. Test: gerçek source handler'ı yapay word boundary olaylarıyla çalıştırılır.

## Kök nedenler ve gerçekçilik

Transkripsiyon türü doğrulanmıyor, başarılı JSON'dan sonra abort yeniden kontrol edilmiyor, bozuk JSON yolunda kota başlığı kayboluyordu. Uzun metin sessizce kesiliyor; tanıma stop sonucunun hiç gelmemesi oturumu açık bırakabiliyordu. MIME etiketi yalnız recorder'dan alınıyor; kısmi AudioContext kurulumu kaynak sızdırabiliyordu. Resume yolundaki eski callback yeni konuşmanın zamanlayıcısını ezebiliyordu. Ağız dinlenmesi yalnız cümle sonlarına bağlıydı; artık yan cümle durakları da davranışa yansır. Bunlar yaklaşık kelime olayı temelli animasyonlardır, fonem/dudak senkronu değildir.

## Doğrulama ve kapsam

- İki değiştirilmiş JS: node --check geçti.
- Sekiz tests/adimbot-*.cjs dosyası: geçti; yeni test 15 hedefli davranış ve ek sınır örneklerini çalıştırır.
- Önceki ses sıralaması/durdurma/duraklatma, geç ses listesi, güvenlik, mikrofon temizliği, sohbet iptali/odak ve sürükleme regresyonları geçti.
- Dosyalar: adimbot-chat-ui.js, adimbot-student.js, tests/adimbot-audio-88.cjs, version.json, bu release notu.
- CSS/PHP/DB/menü/ders mantığı değişmedi. Mevcut JS asset URL'leri hash_file SHA-256 özeti kullandığından önbellek için PHP değişikliği gerekmedi.
- Tarayıcı görsel doğrulaması yapılamadı: Playwright Chromium çalıştırılabilir dosyası bu ortamda yok.
- Gerçek Groq/Gemini isteği, fiziksel mikrofon/mobil Safari ve ses dinleme yapılmadı. PHP runtime yok ve PHP değişmedi.
- Türkçe ses seçimi dayanıklılığı yapay cihaz ses listeleriyle test edildi; telaffuz/ses kalitesi dinleme ile doğrulanmadı.

## Kalan işler

api/adimbot-transcribe.php sunucuda metni 400 karakterde kesmeye devam ediyor. Bu tur sunucunun bu davranışını düzeltmez; uzun metni inceleme özellikle browser recognition yolunu iyileştirir. Sağlayıcının Retry-After başlığının sunucu transkripsiyon hata yanıtına taşınması hâlâ ayrı backend işi. PHP/API test ortamı gerekir. Cihaz seslendirmesi mevcut yedek olarak korunur.

## Mevcut sağlayıcılarla sunucu TTS araştırması — 30 Eylül 2026

Resmî Gemini dokümanı Türkçeyi desteklenen TTS dilleri arasında listeliyor; mevcut Gemini sağlayıcısı içinde araştırılabilecek bir seçenek. Hesabın model erişimi, ücret/kota ve çocuklara uygun Türkçe sesi gerçek dinleme ile ayrıca doğrulanmalı. Entegrasyon etkinleştirilmedi.
https://ai.google.dev/gemini-api/docs/speech-generation
https://ai.google.dev/gemini-api/docs/pricing

Groq Orpheus resmî destek tablosu İngilizce ve Suudi Arapçasını listeliyor; bu tabloya dayanarak Türkçe TTS garantisi verilemez.
https://console.groq.com/docs/text-to-speech/orpheus

## Kurulum sırası

1. Kullanıcının güncelleme ekranından 1.1.88 paketini kurması.
2. Öğrenci sayfasını yenileyip normal sohbet, tarayıcı mikrofonu ve kayıt tabanlı mikrofonu ayrı denemesi.
3. Uzun tarayıcı transkripsiyonunu düzenleme, durdurma/duraklatma/devam ve hareket azaltmayı denemesi.
4. Süper Admin'de mevcut sağlayıcının ayrı sohbet/mikrofon bağlantı testlerini çalıştırıp cihazdaki Türkçe sesi dinlemesi.
