# İlkAdım 1.1.18 — AdımBot Öğrenme Asistanı

- AdımBot sohbeti artık aktif ders, konu, etkinlik ve soru bağlamını mevcut öğrenci ilerlemesiyle birlikte değerlendirebilir.
- Yapay zekâ isteğine yalnızca öğrenme için gerekli, kişisel kimlik içermeyen özet alanlar eklenir: tamamlanan çalışma adımı, oyun/okuma sayısı, mevcut dersteki cevap sayıları ve biraz daha pratik yapılabilecek ders.
- Öğrencinin adı, tam adı, kullanıcı kimliği veya iletişim bilgileri öğrenme bağlamına eklenmez.
- Mevcut dersteki deneme/doğru/yanlış ve tamamlanan adım sayıları destek seviyesini ayarlamak için kullanılabilir; öğrenci bu sayılarla etiketlenmez veya başka öğrencilerle kıyaslanmaz.
- “Birlikte çözelim” modu aktifse AI her yanıtta tek küçük düşünme adımı verir ve öğrencinin cevabını bekler; doğru sonucu veya doğru şıkkı doğrudan açıklama yasağı korunur.
- Zorlanılan ders bilgisi kesin bir yetersizlik olarak değil, daha fazla pratik yapılabilecek alan olarak ele alınır.
- Tarayıcı ve sunucu tarafında yeni öğrenme bağlamı alanları ayrı ayrı sınırlandırılır ve sayısal alanlar güvenli aralığa sıkıştırılır.
- OpenAI Responses API akışı korunur; yeni bir sağlayıcı veya ek API çağrısı eklenmedi.
- Veritabanı şeması ve öğrenci kayıt tabloları değiştirilmedi.
- 1.1.17 sesli sohbet, 1.1.16 duygu sistemi, 1.1.15 ders özeti, 1.1.14 birlikte çözelim, yanlış cevap koçluğu, ipucu sistemi ve sürükleme stabilizasyonu korunur.
