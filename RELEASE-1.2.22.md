# İlkAdım 1.2.22

## Öğretmen sorularında tek-seferlik yıldız ödülü

Bu sürüm, öğretmen içeriklerinde yıllardır veri modelinde bulunan `yildiz_degeri` alanını uçtan uca tamamlar.

### Öğretmen tarafı

Öğretmen soru oluştururken veya henüz öğrenci aktivitesi oluşmamış bir soruyu düzenlerken:

- 0 ile 20 arasında yıldız ödülü belirleyebilir.
- 0 seçilirse soru ödülsüz çalışır.
- Soru dışındaki içerik türlerinde yıldız değeri otomatik olarak 0 tutulur.

İçerik listesinde soru ödülü görünür.

İçerik detayında:

- yapılandırılmış ilk doğru cevap ödülü,
- öğrencilere dağıtılan toplam yıldız,
- öğrencinin tek tek kazandığı yıldız

görüntülenir.

### Öğrenci tarafı

Öğrenci öğretmen sorusunu ilk kez doğru çözdüğünde:

- yapılandırılmış yıldız ödülü kazanır,
- ekranda `+X yıldız kazandın` bildirimi görür.

Aynı soru tekrar doğru çözülürse ikinci kez yıldız verilmez.

Yanlış cevap ödül üretmez.

### Tek-seferlik ve güvenli kayıt

Yeni tablo:

`ogretmen_icerik_yildiz_odulleri`

Birincil anahtar:

`(icerik_id, ogrenci_id)`

Bu sayede aynı öğrenci aynı öğretmen sorusundan yalnız bir ödül kaydı alabilir.

Ödül yazımı ayrıca `INSERT IGNORE` ile idempotent tutulur.

### Mevcut yıldız sistemiyle uyum

Öğretmen yıldızları doğrudan `ogrenci_yildizlari.toplam_yildiz` alanına eklenmez.

Bunun nedeni mevcut öğrenci durum senkronizasyonunun temel yıldız toplamını yeniden hesaplamasıdır.

Öğretmen bonusları ayrı tabloda korunur ve:

- `normalized_summary()` öğrenci toplam yıldızına ekler,
- V4 ödül mağazası kazanılmış yıldız hesabına ekler,
- mağazada harcanabilir yıldız olarak kullanılabilir.

Böylece yeni bonuslar bir sonraki state senkronizasyonunda kaybolmaz.

### Migration

Yeni migration:

`069_ogretmen_soru_yildiz_odulleri.sql`

Migration yalnız yeni ödül tablosunu oluşturur; mevcut yıldız ve cevap tablolarındaki veriyi değiştirmez.

### Test

Yeni testler:

- `tests/teacher-question-star-reward-147.cjs`
- `tests/teacher-question-star-reward-db-147.php`

MariaDB testi:

1. İlk ödül kaydının yıldızı verdiğini doğrular.
2. Aynı öğrenci + aynı içerik ikinci denemesinde 0 yıldız döndüğünü doğrular.
3. Farklı sorunun ayrı ödül verebildiğini doğrular.
4. 0 yıldız ödülünün kayıt üretmediğini doğrular.
5. 20 üzeri değerin 20'ye kırpıldığını doğrular.
6. Bonus toplamını doğrular.
7. Aynı soru için farklı öğrencinin bağımsız ödül kazanabildiğini doğrular.
