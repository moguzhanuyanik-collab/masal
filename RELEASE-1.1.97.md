# AdımBot 1.1.97

Taban: 1.1.96 / 4dd88caada2a663c0c872b4705b6ccb865b42105.
Kullanıcının “sürümü kontrol et ve yayınla” talimatıyla bekleyen 8 kapsamlık paket yayımlandı. Bu paket 30 geliştirmelik saatlik tur olarak sayılmıyor. Canlı kurulum yapılmadı.

## Tamamlanan 8 kapsam
1. Normal muhabbette gereksiz ders, teknik ses/mikrofon açıklamaları veya varsayılan sıkıntı/teselli konuşması üretmemesi için sohbet yönergesi düzeltildi. Karşılama ve tekrarlanan yanıt geri dönüşü de gündelik sohbete uygun.
2. Kayıtta konuşma algılandıktan sonra 1.8 saniye sessizlikte otomatik bitirme eklendi. Mevcut transkripsiyon ve gönderim akışı kullanılır. En fazla 15 saniye sınırı korunur; ses analizi kullanılamıyorsa manuel bitirme yedeği korunur.
3. Tarayıcı tanımada mikrofon izni bekleme süresi ile onstart sonrası gerçek dinleme süresi ayrıldı.
4. Mikrofon izin bekleme durumuna iptal düğmesi, kalan süre ve bekleme ifadesi eklendi. Sayaç başarı ve iptal yollarında temizlenir.
5. Eski kayıt meteri/süre callbacklerinin yeni kaydı durdurması engellendi; geç izin sonucu kaynaklarını kapatır.
6. Mikrofon sağlayıcısı normalize edilir; geçersiz seçime kayıt başlatmadan açıklama gösterilir.
7. Türkçe ALKIŞ/Anlaşılmayan ses ve BLANK_AUDIO/NO_SPEECH metadata'sı engellenir; A/İ/2 gibi geçerli kısa girdiler korunur.
8. 401–4000 karakter transkripsiyon tam olarak düzenleme alanına gelir; mevcut 400 karakter sınırı otomatik gönderimi durdurur. Daha uzun çıktı ve bozuk UTF8 güvenli hata verir.

## Kök neden
Kayıt yalnız manuel stop veya toplam süreyle bitiyordu. Tarayıcı izin süresi dinleme süresini tüketiyor; izin durumunda kontrol ve ifadeler tutarsızdı. Türkçe normalizasyon sonrası ipucu regex'i eşleşmiyordu. Sunucu iki karakter ve 400 karakter sınırları geçerli kısa girdi ve düzenlenebilir uzun metni reddediyordu. Sunucu sohbet yönergesi genel muhabbeti sürekli öğrenme yardımına yönlendiriyordu.

## Kontroller
- 12 tests/adimbot-*.cjs dosyası geçti.
- adimbot-chat-ui.js ve eklenen/değişen CJS dosyalarında node --check geçti.
- PHP 8.3 lint: api/adimbot-ai.php, api/adimbot-transcribe.php, src/adimbot_transcript.php ve yeni PHP test dosyası geçti.
- tests/adimbot-transcript-behavior.php kısa giriş, Türkçe noise, uzun metin, sınır ve UTF8 davranış testleri geçti.
- Yeni mikrofon testi sentetik izin, tarayıcı onstart, yinelenen sonuç, sayaç temizliği, sessizlik bitirme ve stale callback yollarını çalıştırır.
- Mevcut audio-88 testindeki eksik yardımcı yüklemesi düzeltildi; bu test harness düzeltmesi geliştirme sayısına eklenmedi.
- Gerçek Groq/Gemini bağlantısı, model sohbet kabul örnekleri, ses dinleme ve fiziksel telefon/Safari testi yapılmadı. Sessizlik algısı ses seviyesine dayalı yaklaşık yöntemdir; gürültülü ortamda gerçek cihaz ayarı gerekebilir.

## Dosya kapsamı
adimbot-chat-ui.js, api/adimbot-ai.php, api/adimbot-transcribe.php, src/adimbot_transcript.php, tests/adimbot-audio-88.cjs, tests/adimbot-microphone-flow.cjs, tests/adimbot-transcript-behavior.php, version.json, bu sürüm notu.
Ders mantığı, menü, roller, veritabanı ve CSS değiştirilmedi. Öğrenci scripti mevcut içerik hash mekanizmasıyla yenilenir. Mikrofon kullanıcı dokunuşu ve izin sonrasında açılır.

## Kurulum
1.1.96 → 1.1.97. Kurulumdan sonra sohbet ekranını yenile, mikrofona dokunup kısa konuş ve durakla. Normal sohbet için Merhaba/Nasılsın/Sohbet edelim örneklerini dene; gerçek ses ve AI davranışı bu aşamada gözlenmeli.

