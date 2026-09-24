# İlkAdım v1.1.20

## Akıllı tekrar
- AdımBot mevcut öğrenci `attempts` verisini kullanarak kısa tekrar ihtiyacını belirler.
- Son denemelerde birden fazla yeniden deneme veya yüksek hata oranı varsa ilgili ders tekrar için öne çıkarılır.
- Uzun aradan sonra geri dönülen çalışma alanları tekrar önerisinde dikkate alınır.
- Ders başlangıcı ve yardım akışında mevcut AdımBot konuşması üzerinden kısa tekrar önerilebilir.
- Yeni tablo, yeni API isteği veya yeni öğrenci verisi eklenmedi.

## Hedefli yanlış cevap koçluğu
- AdımBot artık yalnız soru metnine değil, öğrencinin seçtiği yanlış seçeneğe de bakar.
- Toplama ve çıkarma sorularında olası sayma/işlem karışıklığı için daha özel yönlendirme verir.
- Karşılaştırma sorularında seçilen işaret üzerinden düşünme ipucu verir.
- Türkçe, örüntü ve şekil sorularında seçilen seçenekle soru ipucunu yeniden karşılaştırmaya yönlendirir.
- Doğru cevabı veya doğru şıkkı doğrudan söylemez.

## Yapay zekâ bağlamı
- Mevcut güvenli öğrenme bağlamına yalnızca `reviewLesson` ve `reviewReason` eklendi.
- AdımBot tekrar ihtiyacını eksiklik etiketi olarak değil, kısa pratik fırsatı olarak ele alır.
- Kişisel bilgi gönderim kuralları değişmedi.

## Değiştirilmeyen alanlar
- Öğrenci HTML yapısı değiştirilmedi.
- CSS değiştirilmedi.
- Logo, ikon, AdımBot görseli veya başka resim değiştirilmedi.
- Veritabanı şeması değiştirilmedi.
- Soru verileri ve doğru cevap kayıtları değiştirilmedi.
- AdımBot sürükleme/konum sistemi değiştirilmedi.

Taban sürüm: v1.1.19
