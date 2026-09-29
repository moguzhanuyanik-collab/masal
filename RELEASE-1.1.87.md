# AdımBot 1.1.87

Taban: 1.1.86 / ccb6e177819ffed7fc59a15f7b373404daca0f89. Yalnız AdımBot kapsamı. Canlı kurulum yapılmadı.

## Tamamlanan 15 değişiklik ve doğrulama

1. Görünmez/yön değiştiren Unicode karakterleri temizlenir; gizlenmiş tehlikeli ifadeler yakalanır. NFC Türkçe metin korunur. Test: gizli karakterli bomba/hakaret.
2. Türkçe yerel küçük harf dönüşümü güvenlik karşılaştırmalarında kullanılır. Test: SİLAH, KENDİME, HANGİ ŞIK.
3. Eğitim açıklaması muafiyeti açık kişisel bilgi isteğini geçersiz kılamaz. Test: açıklama + telefon/şifre talebi engellenir; yalnız açıklama geçer.
4. Parantezli Türkçe telefon numaraları girişte engellenir, bağlam/geçmişte gizlenir. Test: +90 (555), (0212).
5. Tehlikeli kullanıcı geçmişi ve kırıcı asistan geçmişi AI isteğinden çıkarılır. Test: normal öğrenme mesajı korunur.
6. İki geçmiş yolunda açıkça etiketlenmiş şifre/parola/API anahtarı değerleri gizlenir. Test: küçük/büyük Türkçe harfler, ':' ve '='.
7. Metin bağlam alanları yalnız string kabul eder; nesne/dizi toString içeriği taşınmaz. Test: özel toString çağrılmaz, normal konu korunur.
8. Doğrudan yanıt temizleyicisinde nesne/dizi/sayı/bool yanıtlar konuşmaya dönüşmez. Test: dört bozuk tür.
9. script/style içeriği görünür ve sesli yanıttan çıkarılır. Test: kod/CSS okunmaz; b etiketi içindeki Merhaba korunur.
10. Aktif soruda birinci/ikinci/üçüncü/dördüncü ve rakamlı seçenek/kart cevap talimatları güvenli ipucuna döner. Test: soru içinde engel, soru dışında normal metin.
11. Porno ve erotik hikâye/foto/video talepleri denetlenir. Test: giriş ve yanıt; normal canlılar konusu korunur.
12. Uzun yanıtlar 600 karakter sınırında tam kelimeyle biter; sığmayan tek kelime güvenli mesaja döner. Test: kelime sınırı ve 601 harflik bozuk yanıt.
13. 400 karakteri aşan giriş açık kısa yazma isteğiyle reddedilir; sessizce farklı bir soruya kırpılmaz. Test: 400/401 ve sağlayıcı çağrısının yapılmaması.
14. deliver ve askAndSpeak yollarında aktif soru denetimi korunur; sohbet teslimi soru bağlamını geçirir. Test: doğrudan ve uçtan uca yapay sağlayıcı teslimi.
15. Güvenlik desteği seslendirmesinde dönüşümlü canlı kol jestleri yerine seyrek açık kol jestleri kullanılır. Test: sakin başlatma/aralık, normal konuşmaya dönüş ve hareket azaltma.

## Kök nedenler

Türkçe olmayan harf karşılaştırması ve görünmez karakterler güvenlik eşleşmelerini bozuyordu. Genel açıklama muafiyeti karma talepleri geçiriyordu. Geçmiş yalnız gizlenip kırpılıyor; içerik güvenliği yeniden değerlendirilmiyordu. Yanıt temizleyici bozuk türleri metne çevirebiliyor, HTML içeriğini okuyabiliyor ve kelime ortasında kesebiliyordu. Teslim katmanı aktif soru bağlamını almıyor; ciddi destek yanıtları normal hareketli konuşma jestlerini kullanıyordu.

## Kontroller ve sınırlar

- Üç JS dosyası node --check: geçti.
- Yedi tests/adimbot-*.cjs dosyası: geçti; yeni testte 15 madde ve eski 11 güvenlik öz denetimi.
- Önceki ses sıralaması/durdurma/duraklatma, geç ses listesi, mikrofon temizliği, sohbet iptali/odak ve sürükleme regresyonları: geçti.
- Kapsam: üç AdımBot JS, bir AdımBot testi, version.json, bu sürüm notu. JS önbellek referansları zaten dosya SHA-256 özeti kullanıyor; PHP/CSS değişmedi.
- Tarayıcı görsel doğrulaması yapılamadı: Playwright Chromium çalıştırılabilir dosyası bu ortamda yok.
- Gerçek Groq/Gemini isteği, fiziksel mikrofon/mobil Safari ve ses dinleme testi yapılmadı. PHP çalıştırılabilir dosyası yok; PHP değiştirilmedi.
- Ses kalitesi veya gerçek ağız senkronu doğrulandı iddiası yok. Jest doğrulaması yapay ses olaylarıyla sınırlı.
- Kelime temelli güvenlik tüm dil varyasyonlarını garanti etmez. Sunucu tarafındaki mevcut kontroller korunur.
- Sonraki inceleme: sağlayıcı kota başlığının transkripsiyon yanıtına taşınması; bunun için PHP/API test ortamı gerekir. Mevcut cihaz seslendirmesi korunur; ücretli/yeni TTS etkinleştirilmedi.

## Kullanıcının kurulum sırası

1. Güncelleme ekranından 1.1.87 paketini alıp kur.
2. Öğrenci ekranını yenile; normal sohbet ve yalnız dokunulan metni okuma akışını dene.
3. Güvenlik örnekleri, uzun seslendirme/durdurma ve hareket azaltmayı dene.
4. Süper Admin'de mevcut sağlayıcıyla ayrı sohbet/mikrofon testlerini çalıştır; cihazda Türkçe sesi dinle.
