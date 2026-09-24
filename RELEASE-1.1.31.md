# İlkAdım v1.1.31

## Konu kartı tekilleştirme düzeltmesi

v1.1.30 sonrası yeni soru havuzundaki her soru ders listesinde ayrı bir konu kartı gibi görünüyordu.

Bu sürümde:
- Aynı `konu_kodu` altındaki sorular tek konu kartında gruplanır.
- Örneğin “A Sesini Tanıyorum” 6 soru içeriyorsa listede yalnız 1 adet “A Sesini Tanıyorum” kartı görünür.
- Kart üzerindeki “6 soru” bilgisi korunur.
- Konu kartına basıldığında o konunun ilk tamamlanmamış sorusuna gidilir.
- Konu sorularının tamamı bittiyse konu tamamlanmış kabul edilir.
- “mini konu” ve “adım” sayaçları soru sayısı yerine gerçek konu sayısını gösterir.
- Route algılama artık yalnız tek bir hash biçimine bağlı değildir.
- Mevcut lesson-step CSS hidden özelliğini eziyorsa inline display:none !important ile tekrar kartları kesin gizlenir.

## Tasarım güvenliği
- CSS dosyası değiştirilmedi.
- Öğrenci ekranının HTML yapısı değiştirilmedi.
- Logo, ikonlar, görseller ve AdımBot değiştirilmedi.
- Veritabanı şeması veya soru içerikleri değiştirilmedi.
- Güncelleme ekranına dokunulmadı.

Taban sürüm: v1.1.30
