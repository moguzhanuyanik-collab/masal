# İlkAdım AdımBot v1.1.77

## Değişiklikler

- AdımBot seslendirme betiğinin adresi güncellendi; tarayıcılar v1.1.76 önbelleğindeki eski betiği yeniden kullanmaz.
- İpucu öğeleri sınıf, kimlik ve erişilebilirlik etiketlerinde daha geniş biçimde tanınır.
- Sınıfı olmayan, “İpucu:” veya “Mina Öğretmen bir ipucu verir misin?” gibi etiketlerle başlayan ipucu blokları ders ekranında ayrı okunabilir alan olur.
- Soru metni hazırlanırken ipucu blokları ve etiketli ipucu paragrafları çıkarılır; “İpucu nedir?” gibi normal soru cümleleri korunur.
- “Birlikte keşfedelim” ders kartlarının ses metni de ipucu temizliğinden geçer; ipucu, kartın genel metnine karışmaz.
- Bir ipucu alanına dokunulduğunda üstteki soru kartı ikinci kez seslendirilmez.

## Doğrulama

- v1.1.76 GitHub `main` tabanındaki dosyalar yerel çalışma kopyasıyla eşleştirildi.
- JavaScript sözdizimi ve ipucu etiketi sınıflandırma kontrolleri yapıldı.
- Gerçek tarayıcı, telefon ve canlı sistem testi yapılmadı.
