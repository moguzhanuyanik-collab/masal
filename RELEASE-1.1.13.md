# İlkAdım 1.1.13 — AdımBot Zorlanılan Dersleri Algılama

- AdımBot mevcut öğrenci cevap geçmişini kullanarak daha fazla pratik gerekebilecek dersleri yerel olarak belirleyebilir.
- Yeni veri toplanmaz; mevcut state içindeki attempts kayıtları kullanılır.
- Bir dersin “biraz daha pratik” olarak işaretlenmesi için en az 3 cevap, en az 2 yanlış ve en az %40 yanlış oranı gerekir.
- Tek bir yanlış cevap öğrenciyi zorlanıyor olarak işaretlemez.
- Birden fazla ders eşik üzerindeyse yanlış oranı ve yanlış sayısına göre önceliklendirilir; en fazla üç ders özetlenir.
- Sohbet bağlam alanında uygun olduğunda “🎯 Biraz pratik: Ders” bilgisi gösterilir.
- AdımBot yardım tepkisinde zorlanılan ders varsa yargılayıcı olmayan kısa bir pratik önerisi kullanabilir.
- Mevcut kayıt yapısı konu adını cevap geçmişinde ayrı alan olarak saklamadığı için kalıcı “konu zayıflığı” uydurulmaz. Ekranda mevcut konu bağlamı varsa yardım sırasında o anki konu kullanılabilir.
- Analiz yalnızca öğrencinin kendi tarayıcıya yüklenmiş mevcut durum verisi üzerinde yapılır; yeni API isteği oluşturmaz.
- Veritabanı şeması, tablolar ve API uçları değiştirilmedi.
- 1.1.12 doğru cevap tepkileri, 1.1.11 yanlış cevap koçluğu, 1.1.10 akıllı ipucu ve 1.1.8 sürükleme stabilizasyonu korunur.
