# AdımBot 1.1.90

Taban: 1.1.89 / 9ba15ed1193d2379ece393a013adbc031a34a58d. Yalnız robot seslendirmesi, ifadeleri ve kendi sohbet penceresi.

## Tamamlanan 15 değişiklik

1. Geçerli HH:MM saatleri Türkçe saat/dakika olarak hazırlanıyor; geçersiz saatler korunuyor.
2. Ön ve son yüzde gösterimi Türkçe yüzde ifadesine dönüştürülüyor.
3. Sayısal Celsius dereceleri açık Türkçe ifadeye dönüştürülüyor.
4. cm/mm/km/kg/mg/ml ölçü birimleri sayılardan sonra açılıyor; kelime içi benzerlikler korunuyor. Altı birim tek geliştirme olarak sayıldı.
5. Sayılar arasındaki ± işareti artı eksi diye hazırlanıyor.
6. Kare ve küp üst simgeleri okunabilir sözcüklere dönüştürülüyor.
7. Satır başındaki madde işaretleri ses metninden çıkarılıyor.
8. Markdown alıntı işaretleri ses metninden çıkarılıyor; sayısal büyüktür karşılaştırmaları korunuyor.
9. Hareket azaltma tercihi robot içindeki tüm CSS geçişlerini ve yumuşak kaydırmayı kapatıyor.
10. 500px ve daha kısa ekranlarda sohbet penceresi ekran yüksekliğine sığıyor; mesaj alanı küçülebiliyor ve taşan pencere kaydırılabiliyor.
11. Sakin konuşmada ağız açıklığının üst sınırı azaltılıyor.
12. b/p/m ile başlayan kelimelerde kısa kapalı dudak pozu ekleniyor; durdurma, eski istek ve hareket azaltma kontrolleri korunuyor.
13. Konuşurken normal göz kırpma aralığı uzatılıyor.
14. Düşünme ifadesinde sağ göz de sol gözün düşünme kırpmasına katılıyor.
15. Dinleme ve transkripsiyon ifadeleri boşta güç tasarrufunun robotu dondurmasını engelliyor; hem planlama hem zamanlayıcı çalışması denetleniyor.

## Kök neden ve gerçekçilik katkısı

Cihaz TTS motoruna semboller/kısaltmalar ham aktarılıyordu. Ağız açıklığı sakin konuşmada değişmiyordu, dudak başlangıçları ayrılmıyordu; düşünme kırpması yalnız soldaydı. Dinleme ifadesi başladıktan sonra zamanlanabilen boşta güç modu dinleme hareketini dondurabiliyordu. Kısa yatay ekranlarda 180px mesaj minimumu giriş alanına yer bırakmayabiliyordu.

Ağız hareketi kelime sınırı olaylarından yaklaşık hesaplanır; fonem düzeyinde senkron iddiası yoktur. Yeni ses sağlayıcısı veya ücretli servis açılmadı. Görünür soru/metin değiştirilmez, yalnız ses için hazırlanan kopya dönüştürülür.

## Doğrulama

- node --check adimbot-student.js geçti.
- tests/adimbot-notation-90.cjs: 20 metin örneği, dönüşümlerin tekrar uygulandığında sabit kalması, dudak kapanışı, durdurma, hareket azaltma, sakin ağız açıklığı ve dinleme güç modu davranış testleri geçti.
- tests/adimbot-speech-81.cjs ve tests/adimbot-lifecycle-82.cjs önceki ses/duraklatma/iptal/geç olay regresyonları geçti.
- CSS parantez dengesi ve yeni seçici/yerleşim kuralları kaynak kontrolleri geçti.
- Playwright başlatma denendi; Chromium yürütülebilir dosyası yok. Görsel yerleşim ve animasyon doğrulanamadı.
- Ses dinleme, fiziksel telefon, gerçek API ve canlı sistem testi yapılmadı. PHP değişikliği yok.

Değişen dosyalar: adimbot-student.js, adimbot-student.css, tests/adimbot-notation-90.cjs, version.json, RELEASE-1.1.90.md.
JS/CSS önbelleği mevcut dosya hash mekanizmasını kullanır. Veritabanı, menü ve ders mantığı değiştirilmedi.

## Kurulum

1.1.89 → 1.1.90. Canlı kurulum kullanıcı tarafından yapılacak. Sonrasında saat/yüzde/ölçü metinlerini okut, sakin konuşma ve düşünme ifadesini dene, telefonu yatay çevirerek sohbet girişini kontrol et.

