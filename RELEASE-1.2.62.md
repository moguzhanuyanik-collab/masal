# İlkAdım 1.2.62

## Mutabakat Günlük İş Kutusu

Bu sürüm 1.2.61 toplu planlama ile sorumlu ve aksiyon tarihi verilen açık mutabakat vakalarını kullanıcı merkezli günlük iş görünümüne bağlar.

Yeni migration yoktur.

Migration zinciri:

`086`

olarak kalır.

## Yeni Sayfa

`ticari-mutabakat-is-kutusu.php`

Yeni domain:

`src/ticari_mutabakat_is_kutusu.php`

Yeni stil:

`ticari-mutabakat-is-kutusu.css`

## Varsayılan Görünüm

İş kutusu varsayılan olarak oturumdaki Süper Admin'e atanmış açık vakaları gösterir.

Açık aşamalar:

- Açık
- İncelemede
- Dış Aksiyon Bekleniyor

Kapalı vakalar günlük iş listesine alınmaz.

## Günlük Pencereler

Desteklenen pencereler:

- Gecikmiş
- Bugün
- Önümüzdeki 3 gün
- Önümüzdeki 7 gün
- Aksiyon tarihi yok
- Tüm açık

3 ve 7 günlük pencereler bugünü tekrar içermez; yarından başlayarak ilgili gelecek aralığını gösterir.

## Kapsamlar

- Bana Atanan
- Sahipsiz
- Tüm Ekip

Tüm ekip görünümünde doğrudan owner ID ile filtreleme desteklenir.

Bu nedenle aynı isimli kullanıcılar birbirine karışmaz.

## Sağlık Semantiğini Tekrar Kullanır

Yeni modül vaka yaşını veya ilk müdahaleyi yeniden tanımlamaz.

1.2.60'taki:

- mevcut açık döngü başlangıcı,
- yeniden açılma semantiği,
- ilk müdahale tespiti,
- yaşlandırma grupları

aynı helper'lar üzerinden tekrar kullanılır.

Böylece sağlık dashboardu ile günlük iş kutusu aynı vakaya farklı yaş veya müdahale sonucu üretmez.

## Özet Sayaçları

Oturumdaki Süper Admin için:

- bana atanan açık vaka,
- gecikmiş,
- bugün,
- önümüzdeki 3 gün,
- önümüzdeki 7 gün,
- aksiyon tarihi olmayan,
- dış aksiyon bekleyen

sayıları gösterilir.

Ayrıca ekip genelindeki sahipsiz açık vaka sayısı görünür.

## Ekip İş Yükü

Her sorumlu için:

- açık vaka,
- gecikmiş,
- bugün,
- 7 gün içinde,
- tarihsiz,
- veri bütünlüğü

sayıları gösterilir.

Atanmamış vakalar ayrı satırdır.

Sorumlu satırına tıklanınca ID bazlı ilgili ekip görünümü açılır.

## Salt Okunur

İş kutusu:

- vaka aşamasını değiştirmez,
- sorumlu değiştirmez,
- aksiyon tarihi değiştirmez,
- kaynak finans/belge/eşleme verisini değiştirmez,
- vaka senkronizasyonu yapmaz.

Domain INSERT / UPDATE / DELETE içermez.

Sayfada POST akışı yoktur.

## Operasyon Bağlantıları

Her vaka Mutabakat Aksiyon Merkezi'ndeki detayına gider.

Ekip dağıtımı için Toplu Planlama sayfasına bağlantı verilir.

Yeni İş Kutusu bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Aksiyon Merkezi'ne,
- Mutabakat Aksiyon Sağlığı'na,
- Mutabakat Toplu Planlama'ya,
- Ticari Yönetim Dashboardu'na

eklenmiştir.

## Yeni Migration Yok

1.2.62 yalnız mevcut:

- `ticari_mutabakat_vakalari`
- `ticari_mutabakat_vaka_gecmisi`

verisini salt-okunur kullanır.

Bu nedenle yapay bir 087 migration oluşturulmamıştır.

Migration zinciri 086 olarak devam eder.

## Testler

Yeni testler:

- `tests/reconciliation-inbox-187.cjs`
- `tests/reconciliation-inbox-db-187.php`

MariaDB testi şunları doğrular:

1. bana atanan açık vaka sayısını,
2. gecikmiş aksiyonu,
3. bugün aksiyonunu,
4. 3 günlük pencereyi,
5. 7 günlük pencereyi,
6. tarihsiz vakayı,
7. dış aksiyon bekleyen vakayı,
8. sahipsiz vakayı,
9. başka sorumlunun vakasının kişisel görünümden dışlanmasını,
10. kapalı vakanın dışlanmasını,
11. owner ID filtresini,
12. veri bütünlüğü filtresini,
13. teşhis aramasını,
14. mevcut açık döngü sağlık semantiğini,
15. ilk müdahale bilgisini,
16. ekip iş yükünü,
17. atanmamış iş yükünü,
18. non-super-admin sorgunun fail-closed davranmasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur sorgular,
- parametreli filtreler,
- doğrudan owner ID filtresi,
- mevcut sağlık semantiğinin tekrar kullanımı,
- kapalı vaka izolasyonu

ile çalışır.
