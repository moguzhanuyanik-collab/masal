# İlkAdım 1.1.8 — AdımBot Sürükleme Stabilizasyonu

- AdımBot sürükleme sonrası artık otomatik “güvenli konum” algoritması tarafından başka köşeye taşınmaz.
- Öğrencinin elle bıraktığı konum manuel konum olarak işaretlenir ve localStorage içinde korunur.
- Kayıtlı manuel konum açılışta geri yüklenir; açılış sonrası otomatik yeniden konumlandırma uygulanmaz.
- Sayfa içeriği değiştiğinde, hash/ekran geçişlerinde ve DOM güncellemelerinde manuel konum korunur.
- Mobil visualViewport kaydırma/klavye olaylarının robotu kendiliğinden taşıması engellendi.
- Manuel konum varken normal pencere resize olayları robotun koordinatlarını değiştirmez.
- Ekran yönü gerçekten değiştiğinde robot yalnızca ekran dışında kalmaması için sınırlar içine alınır.
- Robot hiç elle taşınmadıysa mevcut güvenli başlangıç konumlandırması çalışmaya devam eder.
- 1.1.7 modal odak ve mobil klavye iyileştirmeleri korunur.
