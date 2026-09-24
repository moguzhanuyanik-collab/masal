# İlkAdım 1.1.16 — AdımBot Duygu ve Karakter Sistemi

- AdımBot'a beş geçici duygu durumu eklendi: düşünme, mutlu, şaşırma, cesaretlendirme ve bekleme.
- Düşünme durumunda robot hafif düşünme hareketi ve göz tepkisi gösterir.
- Yapay zekâ yanıtı hazırlanırken önce düşünme, işlem uzarsa bekleme durumu kullanılır.
- Yanıt hazır olduğunda kısa şaşırma/uyanıklık tepkisi gösterilebilir.
- Doğru cevap tepkileri mutlu duygu durumuyla, yanlış cevap ve motivasyon tepkileri cesaretlendirme durumuyla eşleştirildi.
- Yardım tepkisi kısa şaşırma/ilgi animasyonuyla desteklendi.
- Duygular için AdimBotStudent.emote() ve clearEmotion() güvenli arayüzleri eklendi.
- Duygu animasyonları yalnızca robotun iç görsel parçalarında çalışır; widget left/top değerlerine ve kayıtlı sürükleme koordinatlarına dokunmaz.
- Sürükleme sırasında mevcut animasyon durdurma kuralları korunur.
- prefers-reduced-motion desteği mevcut genel hareket azaltma kuralıyla korunur.
- Veritabanı, AI API sözleşmesi ve öğrenci kayıt şeması değiştirilmedi.
- v1.1.15 ders sonu mini özet, v1.1.14 birlikte çözelim, v1.1.13 zorlanılan ders algılama ve önceki AdımBot özellikleri korunur.
