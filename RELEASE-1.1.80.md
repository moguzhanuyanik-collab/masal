# AdımBot v1.1.80

Taban: v1.1.79. Kullanıcının istediği anlık ses iyileştirmesi; saatlik görevin sonraki yayınlarında en az 15 anlamlı değişiklik şartı devam eder.

- Uzun seslendirmede cümle sonlarına 240 ms, virgül/noktalı virgül/iki nokta sonlarına 140 ms, uzun cümlelerin ara bölünmelerine 60 ms bekleme uygulanır.
- Seçilen cihaz sesinin doğal perdesi korunur (pitch 1); kullanıcının kayıtlı hız tercihi değiştirilmez.
- Ağız animasyonunda boşlukları doğru ayırmayan düzenli ifade düzeltilir; kelime takibi Türkçe kelimeleri boşlukta keser.
- Durdur düğmesi bekleyen cümleyi ve duraklamayı iptal etmeye devam eder.

Doğrulama: Node sözdizimi; cümle duraklamaları, sıralı seslendirme, duraklama sırasında iptal, Türkçe kelime sınırı, doğal perde ve hız tercihinin korunması geçti. index.php ve ogretmenim.php içerik hash'iyle JS çağırdığından ek önbellek sürüm değişikliği gerekmedi.

Gerçek cihazda dinleme, fiziksel telefon ve canlı API testi yapılmadı. Ses kalitesi cihazın Türkçe ses motoruna bağlıdır; dinlenmeden daha iyi duyulduğu doğrulanmış sayılmaz. Yeni ücretli ses servisi eklenmedi. Canlı sisteme kurulum yapılmadı.

Kurulum: v1.1.79 → v1.1.80.
