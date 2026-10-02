# İlkAdım 1.2.58

## Ticari Mutabakat & Kontrol Merkezi

Bu sürüm sözleşme, ticari belge, tahsilat ve belge–tahsilat eşlemelerini salt-okunur bir mutabakat merkezinde birleştirir.

Yeni migration yoktur.

Migration zinciri:

`085`

olarak kalır.

## Amaç

1.2.57 ile:

- sözleşmeye bağlı ticari belge,
- tahsilat eşleme,
- belge kapasitesi,
- ödeme kapasitesi,
- append-only belge audit geçmişi

eklendi.

1.2.58'in amacı artık şu soruları tek ekrandan cevaplamaktır:

- sözleşmenin ne kadarı belgelenmedi,
- aktif belgenin ne kadarı tahsilatla eşlenmedi,
- aktif tahsilatın ne kadarı belgeye dağıtılmadı,
- eşleme toplamı belge veya tahsilat kapasitesini aşıyor mu,
- belge/tahsilat/eşleme kurum-sözleşme-para birimi kimliği tutarlı mı,
- hangi kayıt normal operasyon açığı,
- hangi kayıt gerçek veri bütünlüğü hatasıdır.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat.php`

Yeni domain:

`src/ticari_mutabakat.php`

Yeni stil:

`ticari-mutabakat.css`

## Salt Okunur Tasarım

Mutabakat domaini:

- INSERT
- UPDATE
- DELETE

işlemi içermez.

Sayfada POST akışı yoktur.

Ekranı görüntülemek:

- sözleşme değiştirmez,
- ticari belge değiştirmez,
- tahsilat değiştirmez,
- belge–tahsilat eşlemesini değiştirmez,
- risk vakası açmaz,
- bildirim göndermez.

## Mutabakat Durumları

### Mutabık

Sözleşmede:

- belge toplamı sözleşme toplamına eşit,
- efektif eşleme belge toplamına eşit,
- aktif tahsilat toplamı efektif eşlemeye eşit,
- kapasite aşımı yok

ise kayıt `Mutabık` olarak gösterilir.

### Operasyon Açığı

Normal ticari süreçte tamamlanması gereken fakat veri bozukluğu olmayan durumdur.

Örnekler:

- sözleşmenin henüz tamamen belgelenmemiş kısmı,
- aktif belgenin tahsilatla eşlenmemiş kısmı,
- aktif tahsilatın belgeye dağıtılmamış kısmı.

Bu durum:

`Veri bozuk`

olarak değerlendirilmez.

### Veri Kontrolü Gerekli

Aşağıdaki anomalilerden biri varsa kullanılır:

- aktif belge toplamı sözleşme toplamını aşıyor,
- efektif eşleme belge toplamını aşıyor,
- efektif eşleme aktif tahsilat toplamını aşıyor.

Ayrıca ayrı bütünlük taraması kurum/sözleşme/para birimi kimlik problemlerini de listeler.

## Finansal Kaynaklar

Mutabakat mevcut kaynakları kullanır:

- `kurum_sozlesmeleri`
- `kurum_tahsilatlari`
- `ticari_belgeler`
- `ticari_belge_tahsilat_eslemeleri`

Yeni finansal bakiye tablosu oluşturulmaz.

## Efektif Eşleme

Bir eşlemenin mutabakat toplamına girebilmesi için:

- eşleme aktif,
- belge aktif,
- tahsilat aktif,
- belge ve eşleme aynı sözleşme/kurum,
- tahsilat ve eşleme aynı sözleşme/kurum,
- belge ve tahsilat para birimi aynı

olmalıdır.

Legacy/veri bozulması nedeniyle bu kimliklerden biri uyuşmuyorsa eşleme:

- finansal mutabakat toplamına alınmaz,
- bütünlük uyarısı olarak ayrıca gösterilir.

## Para Birimi Güvenliği

TRY, USD ve EUR birbirine eklenmez.

Para birimi özeti doğrudan SQL seviyesinde tüm portföyü toplar.

UI sözleşme liste limiti para birimi özetini sınırlamaz.

## Ölçek Koruması

`Hata / Eksik / Mutabık`

filtreleri PHP tarafında LIMIT sonrasında uygulanmaz.

Filtre koşulu SQL WHERE seviyesine eklenir.

Bu nedenle yüksek sözleşme sayısında aranan hata ilk ekran limitinin dışında kaldığı için kaybolmaz.

## Para Birimi Özeti

Her para birimi için:

- sözleşme toplamı,
- aktif belge toplamı,
- aktif tahsilat toplamı,
- efektif eşlenen tutar,
- belgesiz sözleşme tutarı,
- açık belge tutarı,
- dağıtılmamış tahsilat,
- hata sayısı,
- operasyon açığı sayısı,
- mutabık sözleşme sayısı

gösterilir.

## Sözleşme Mutabakat Kuyruğu

Her sözleşme satırı:

- kurum,
- sözleşme numarası,
- para birimi,
- sözleşme tutarı,
- aktif belge toplamı,
- aktif tahsilat toplamı,
- efektif eşleme,
- belgesiz tutar,
- açık belge tutarı,
- dağıtılmamış tahsilat,
- mutabakat durumu

alanlarını gösterir.

## Açık Ticari Belgeler

Aktif ve geçerli kimlikli belge:

`belge tutarı - efektif tahsilat eşlemesi > 0`

ise Açık Ticari Belgeler listesinde görünür.

Satır Ticari Belge Merkezi'ndeki belge detayına bağlanır.

## Dağıtılmamış Tahsilatlar

Aktif ve geçerli kimlikli tahsilat:

`tahsilat tutarı - efektif belge eşlemesi > 0`

ise Dağıtılmamış Tahsilatlar listesinde görünür.

Bu tutar yeni borç değildir; mevcut tahsilatın belge referansına henüz dağıtılmamış kısmıdır.

## Veri Bütünlüğü Taraması

Mutabakat Merkezi şu gerçek anomalileri ayrıca tarar:

### Belge Kimlik Uyumsuzluğu

- sözleşme bulunamıyor,
- belge kurum ID'si sözleşmeyle uyuşmuyor,
- belge para birimi sözleşmeyle uyuşmuyor.

### Tahsilat Kimlik Uyumsuzluğu

- sözleşme bulunamıyor,
- tahsilat kurum ID'si sözleşmeyle uyuşmuyor,
- tahsilat para birimi sözleşmeyle uyuşmuyor.

### Eşleme Kimlik Uyumsuzluğu

- belge veya tahsilat kaydı bulunamıyor,
- mapping sözleşme ID'si kaynak kayıtlarla uyuşmuyor,
- mapping kurum ID'si kaynak kayıtlarla uyuşmuyor,
- belge ve tahsilat para birimi uyuşmuyor,
- eşleme tutarı sıfır veya negatif.

### Limit Aşımı

- belge toplamı sözleşme toplamını,
- eşleme belge toplamını,
- veya eşleme aktif tahsilatı

aşıyorsa sözleşme bazlı limit uyarısı oluşur.

## Normal Audit Kayıtları Hata Sayılmaz

İptal edilmiş tahsilat veya belgeye ait eski mapping satırlarının DB'de fiziksel olarak kalması 1.2.57'nin audit tasarımıdır.

Mutabakat yalnız güncel efektif finansal eşlemeleri toplama dahil eder.

Eski audit satırları sırf fiziksel olarak mevcut diye hata üretilmez.

## Kurum Filtresi

Mutabakat ekranı:

`kurum_id`

filtresini destekler.

Kurum Ticari 360 sayfasından ilgili kurumun mutabakat görünümüne doğrudan geçilebilir.

## Arama ve Filtreler

- kurum adı,
- kurum kodu,
- sözleşme numarası,
- TRY/USD/EUR,
- Mutabık,
- Operasyon Açığı,
- Veri Kontrolü Gerekli

filtreleri desteklenir.

## Menü Entegrasyonu

Ticari Mutabakat & Kontrol bağlantısı:

- Süper Admin ana menüsüne,
- Ticari Yönetim Dashboardu'na,
- Ticari Finans'a,
- Ticari Belge & Tahakkuk Merkezi'ne,
- Kurum Ticari 360 ekranına

eklendi.

## Yeni Testler

- `tests/commercial-reconciliation-183.cjs`
- `tests/commercial-reconciliation-db-183.php`

MariaDB testi şunları doğrular:

1. TRY/USD özetlerinin ayrı tutulmasını,
2. çoklu belge/tahsilat/eşleme toplamlarının sözleşmeyi çoğaltmamasını,
3. tam sözleşmenin Mutabık olmasını,
4. eksik belgeleme/eşlemenin Operasyon Açığı olmasını,
5. belge kapasite aşımının Veri Kontrolü Gerekli olmasını,
6. belgesiz tutarı,
7. açık belge tutarını,
8. dağıtılmamış tahsilatı,
9. durum filtresinin LIMIT öncesi SQL seviyesinde çalışmasını,
10. kurum filtresini,
11. yanlış tenant belgelerinin geçerli belge toplamına girmemesini,
12. yanlış para birimli tahsilatın geçerli tahsilat toplamına girmemesini,
13. hatalı mapping'in efektif eşleme sayılmamasını,
14. açık belge kuyruğunu,
15. dağıtılmamış tahsilat kuyruğunu,
16. belge kimlik anomalisini,
17. tahsilat kimlik anomalisini,
18. mapping kimlik anomalisini,
19. kapasite limit anomalisini,
20. mutabakat sorgularının kaynak finansal tabloları değiştirmemesini.

## Migration

Yeni migration yoktur.

Migration zinciri:

`085`

olarak devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur domain,
- parametreli filtreler,
- para birimi izolasyonu,
- tenant/sözleşme/eşleme kimlik doğrulaması,
- efektif allocation filtresi,
- LIMIT öncesi durum filtresi,
- full-portföy SQL özeti,
- kaynak finansal tabloların tek gerçek olarak korunması

ile çalışır.
