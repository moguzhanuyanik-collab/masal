# İlkAdım 1.1.15 — AdımBot Ders Sonu Mini Özet

- AdımBot'a mevcut öğrenci verilerinden kısa ders özeti üretme yeteneği eklendi.
- Özet, seçili ders için mevcut cevap geçmişini ve tamamlanan çalışma adımlarını kullanır.
- Uygun veri varsa toplam soru ve doğru cevap sayısı kısa, çocuk dostu bir cümleyle söylenir.
- 1.1.13'teki pratik ihtiyacı aynı ders için geçerliyse özet yargılayıcı olmayan bir “biraz daha pratik” önerisi ekler.
- Öğrenci ilgili soruların tamamını doğru yaptıysa kısa olumlu geri bildirim verilir.
- Özetin sonunda öğrenciye “öğrendiğin bir şeyi kendi cümlenle söyle” çağrısı yapılarak aktif hatırlama desteklenir.
- Sohbet hızlı yardımcılarına “📋 Ders özeti” düğmesi eklendi. Özet yerel olarak hazırlanır ve AdımBot tarafından seslendirilir.
- Mevcut lessonEnd tepkisi de aynı mini özet altyapısını kullanacak şekilde hazırlandı.
- Özet için yeni AI isteği yapılmaz; API maliyeti oluşturmaz.
- Yeni veri toplanmaz, veritabanı şeması ve API uçları değiştirilmez.
- 1.1.14 Birlikte Çözelim, 1.1.13 pratik ihtiyacı algılama, 1.1.12 doğru cevap tepkileri ve 1.1.8 sürükleme stabilizasyonu korunur.
