# İlkAdım 1.2.21

## Ödev teslim durumlarında ortak ve tutarlı hesaplama

Bu sürüm, öğrenci, veli ve öğretmen ekranlarında aynı ödevin farklı durum etiketleriyle görünmesi sorununu kapatır.

### Sorun

Öğrencinin Ödevlerim ekranı teslim tarihi geçmiş tamamlanmamış ödevi **Süresi geçti** olarak gösterirken:

- Veli → Ödevler ekranı aynı kaydı **Bekliyor**,
- Öğretmen → Ödev Ayrıntısı aynı öğrenciyi **Bekliyor**

olarak gösterebiliyordu.

Bu nedenle aynı ödev üç rolde farklı yorumlanabiliyordu.

### Ortak ödev durum motoru

Yeni `src/odev_durumu.php` eklendi.

Tüm yeni ödev durum hesapları aynı kurala göre yapılır:

- Öğrenci tamamladıysa: **Tamamlandı**
- Tamamlanmadı ve teslim tarihi geçmişse: **Gecikti**
- Tamamlanmadı ve teslim süresi dolmadıysa: **Bekliyor**
- Teslim tarihi yoksa ve tamamlanmadıysa: **Bekliyor**

Tamamlanmış ödevin teslim tarihi geçmiş olsa bile durum tekrar gecikmişe dönmez.

### Veli Ödevleri

`veli-odevleri.php` geliştirildi.

Yeni:

- Kurum filtresi
- Teslim durumu filtresi
  - Tümü
  - Bekliyor
  - Gecikti
  - Tamamlandı
- Toplam ödev özeti
- Bekleyen sayısı
- Geciken sayısı
- Tamamlanan sayısı
- Gecikmiş ödev kartı
- Tamamlanma tarihi
- Teslim tarihi geçti uyarısı

Veli ödev sorgusu ayrıca yeni paralel SQL yerine 1.2.17'de tenant testleriyle doğrulanmış `vi_parent_contents()` sağlayıcısını kullanır.

Böylece:

- `veli_ogrenci.kurum_id`
- veli aktif kurum üyeliği
- öğrenci aktif kurum üyeliği
- öğretmen aktif kurum üyeliği
- öğretmen–öğrenci kurum ilişkisi
- seçili hedef öğrenci kuralı

aynı merkezi güvenlik katmanından gelir.

### Öğretmen Ödev Ayrıntısı

Öğretmen ödev detayında teslim özeti artık:

- Hedef öğrenci
- Tamamladı
- Gecikti
- Bekliyor

olarak ayrılır.

Geciken öğrenciler artık bekleyen sayısına dahil edilmez.

Her öğrenci satırı ortak durum motorunu kullanır ve:

- Tamamlandı
- Gecikti
- Bekliyor

etiketlerinden birini gösterir.

Öğrenci satırından kurum bağlamı korunarak Öğrenci Raporu'na geçilebilir.

### Arayüz

Yeni stil dosyaları:

- `veli-odevleri.css`
- `ogretmen-odev-detay.css`

Mevcut genel tasarım dosyaları değiştirilmeden yalnız ilgili sayfalar genişletildi.

### Test

Yeni testler:

- `tests/homework-status-consistency-146.cjs`
- `tests/homework-status-consistency-146.php`

Davranış testi:

1. Geç teslim tarihli ama tamamlanmış ödevi **Tamamlandı** tutar.
2. Geç teslim tarihli tamamlanmamış ödevi **Gecikti** yapar.
3. Gelecek teslim tarihli ödevi **Bekliyor** yapar.
4. Teslim tarihi olmayan ödevi **Bekliyor** yapar.
5. Ortak veli sağlayıcısındaki `odev_tamamlandi` alanını destekler.
6. Öğretmen öğrenci satırında ödevin ortak teslim tarihini fallback olarak kullanır.
7. Özet ve durum filtrelerini doğrular.

Eski 1.2.7 ödev regresyonu, veli sayfasının artık tenant-safe ortak sağlayıcıyı kullanmasına göre güncellendi.
