# İlkAdım 1.2.57

## Ticari Belge & Tahakkuk Merkezi

Bu sürüm sözleşmeye bağlı harici fatura/e-Belge referansı, iç tahakkuk ve diğer ticari belge kayıtlarını aktif tahsilatlarla güvenli biçimde eşleyen yeni bir Süper Admin merkezi ekler.

Yeni migration:

`085_ticari_belge_tahakkuk_merkezi.sql`

Migration zinciri:

`085`

olur.

## Yasal Sınır

Bu modül:

- yasal e-Fatura üretmez,
- e-Arşiv üretmez,
- GİB'e belge göndermez,
- mali mühür/imza işlemi yapmaz,
- resmî muhasebe entegratörü yerine geçmez.

`Harici Fatura / e-Belge Referansı` türü yalnız dış muhasebe veya yetkili e-Belge sisteminde oluşturulmuş belgenin referansını takip eder.

`İç Tahakkuk` ise İlkAdım içindeki operasyonel ticari kayıt niteliğindedir.

## Finansal Gerçek Değişmez

Belge kayıtları:

- sözleşme borcunu artırmaz,
- tahsilat oluşturmaz,
- tahsilatı iptal etmez,
- sözleşme bakiyesini değiştirmez.

Finansal gerçek hâlâ:

- `kurum_sozlesmeleri`
- aktif `kurum_tahsilatlari`

tablolarıdır.

Belge ve ödeme eşlemesi yalnız izleme/audit katmanıdır.

## Yeni Tablolar

### ticari_belgeler

Alanlar:

- id
- sozlesme_id
- kurum_id
- belge_turu
- belge_no
- belge_tarihi
- tutar
- para_birimi
- durum
- notlar
- iptal nedeni/tarihi
- oluşturan/güncelleyen kullanıcı
- timestamp alanları

Belge numarası tekilliği:

`kurum_id + belge_turu + belge_no`

ile korunur.

### ticari_belge_tahsilat_eslemeleri

Belge ile mevcut tahsilat arasındaki current-state eşlemeyi tutar.

Primary key:

`belge_id + tahsilat_id`

Alanlar:

- belge_id
- tahsilat_id
- sozlesme_id
- kurum_id
- tutar
- durum
- iptal nedeni/tarihi
- kullanıcı/timestamp alanları

### ticari_belge_gecmisi

Append-only audit geçmişidir.

Şunları saklar:

- belge oluşturma
- belge güncelleme
- belge iptal
- tahsilat eşleme
- tahsilat eşleme kaldırma

Uygulama akışında fiziksel silme yapılmaz.

## Belge Türleri

- Harici Fatura / e-Belge Referansı
- İç Tahakkuk
- Diğer Ticari Belge

## Sözleşme Kuralları

Belge yalnız:

- aktif
- tamamlanmış

sözleşmeye bağlanabilir.

Taslak veya iptal sözleşmeye belge bağlanamaz.

Belge oluşturulduktan sonra bağlı sözleşme değiştirilemez.

Belgenin para birimi kullanıcı girişinden alınmaz; doğrudan bağlı sözleşmenin para biriminden gelir.

## Sözleşme Belge Toplamı Koruması

Aynı sözleşmeye bağlı aktif belge toplamı:

`sözleşme toplam tutarını`

aşamaz.

Örnek:

- sözleşme: 1.000 TRY
- belge 1: 600 TRY
- belge 2: 400 TRY

ise üçüncü aktif belge için kullanılabilir sözleşme belge kapasitesi kalmaz.

Bir belge iptal edilirse o tutar tekrar kullanılabilir kapasiteye döner.

Bu yalnız belge takip kapasitesidir; sözleşme borcunu değiştirmez.

## Tahsilat Eşleme

Belgeye yalnız:

- aktif,
- aynı kurum,
- aynı sözleşme,
- aynı para birimi

tahsilatı eşlenebilir.

Bir tahsilat birden fazla belgeye bölünebilir.

Bir belge birden fazla tahsilatla kapatılabilir.

## Çift Taraflı Eşleme Limiti

Her eşleme şu iki limiti aynı anda geçemez:

### Belge Limiti

Toplam aktif efektif eşleme:

`belge tutarı`

üzerine çıkamaz.

### Tahsilat Limiti

Aynı tahsilatın farklı aktif belgelere ayrılan toplamı:

`tahsilat tutarı`

üzerine çıkamaz.

Belge ve tahsilat satırları transaction içinde kilitlenir.

## Ödeme İptal Edilirse

Tahsilat sonradan Ticari Finans'tan iptal edilirse eski belge eşleme kaydı fiziksel olarak silinmez.

Ancak iptal tahsilat:

`efektif eşlenen tutar`

hesabına dahil edilmez.

Böylece:

- audit geçmişi korunur,
- güncel belge ödeme durumu finansal gerçekle uyumlu kalır.

## Eşleme Kaldırma

Aktif eşleme:

`Eşlemeyi Kaldır`

işlemiyle iptal durumuna alınabilir.

İptal nedeni zorunludur.

Eşleme satırı silinmez.

Belge audit geçmişine:

`tahsilat_esleme_iptal`

olayı eklenir.

## Belge İptali

Aktif efektif tahsilat eşlemesi olan belge iptal edilemez.

Önce aktif finansal eşlemeler kaldırılmalıdır.

Tahsilatı artık iptal edilmiş eski eşleme audit kaydı belge iptalini tek başına engellemez; çünkü finansal olarak efektif değildir.

Belge iptal edildiğinde:

- sözleşme değişmez,
- tahsilatlar değişmez,
- belge geçmişi korunur,
- aktif belge kapasitesi sözleşmede tekrar kullanılabilir.

## Eşleme Geçmişi Sonrası Belge Kimliği Kilidi

Bir belgede herhangi bir tahsilat eşleme geçmişi oluştuğunda:

- belge türü,
- belge numarası,
- belge tarihi,
- belge tutarı

değiştirilemez.

Bu kural eşleme sonradan kaldırılmış veya ilgili tahsilat iptal edilmiş olsa bile geçerlidir.

Amaç geçmiş ödeme-belge anlamını sonradan değiştirmemektir.

Not alanı aynı çekirdek belge bilgileri korunarak güncellenebilir.

## Belge Ödeme Durumu

UI'da türetilmiş durum:

- Eşleşme Yok
- Kısmi Eşleşti
- Ödeme Eşleşti
- Belge İptal

olarak gösterilir.

Bu durum ayrı borç kaynağı değildir.

## Para Birimi Özeti

Aktif belgeler için para birimi bazında:

- belge sayısı,
- belge toplamı,
- efektif eşlenen tahsilat,
- açık belge tutarı,
- eşleme oranı

gösterilir.

TRY/USD/EUR birbirine eklenmez.

## Kurum Filtresi

Belge Merkezi:

`kurum_id`

filtresini destekler.

Kurum Ticari 360 ekranından:

`Ticari Belgeler`

bağlantısıyla yalnız o kurumun belge havuzu açılabilir.

Sorgu kurum ID ile sınırlandırılır.

## Yeni Sayfa

`ticari-belgeler.php`

yalnız Süper Admin tarafından açılır.

Desteklenen işlemler:

- belge referansı oluşturma,
- belge notunu/güvenli alanlarını düzenleme,
- tahsilat eşleme,
- eşleme kaldırma,
- belge iptal,
- filtreleme,
- audit geçmişi görüntüleme.

Tüm write işlemleri CSRF korumalıdır.

## Menü Entegrasyonu

Ticari Belge & Tahakkuk Merkezi bağlantısı:

- Süper Admin ana menüsüne,
- Ticari Yönetim Dashboardu'na,
- Ticari Finans'a,
- Tahsilat Takvimi'ne,
- Kurum Ticari 360 ekranına

eklendi.

## Testler

Yeni testler:

- `tests/commercial-documents-182.cjs`
- `tests/commercial-documents-db-182.php`

MariaDB testi şunları doğrular:

1. aktif sözleşmeye belge oluşturmayı,
2. 600 + 400 belge ile 1.000 sözleşme kapasitesini,
3. belge toplamı aşımının engellenmesini,
4. taslak sözleşmeye belge bağlanmamasını,
5. kurum+tür+belge no tekilliğini,
6. TRY/USD belge ayrımını,
7. 500 tutarlı tahsilatın 400 + 100 şeklinde iki belgeye bölünebilmesini,
8. belgenin birden fazla tahsilatla kapanabilmesini,
9. tahsilat kullanılabilir tutarı aşımının engellenmesini,
10. farklı sözleşme tahsilatının engellenmesini,
11. farklı kurum/para birimi tahsilatının engellenmesini,
12. eşleme geçmişi sonrası belge tutarı değişikliğinin engellenmesini,
13. aynı çekirdek bilgilerle not güncellenebilmesini,
14. aktif eşlemeli belgenin iptal edilememesini,
15. ödeme iptalinde efektif eşlenen tutarın düşmesini,
16. ödeme iptalinin mapping geçmişini silmemesini,
17. eşleme kaldırmayı,
18. efektif eşleme kalmayınca belge iptalini,
19. iptal belge sonrası sözleşme belge kapasitesinin tekrar kullanılmasını,
20. aktif belge para birimi özetini,
21. kurum filtresi izolasyonunu,
22. create/update/allocation/unallocation/cancel audit olaylarını,
23. belge işlemlerinin sözleşme borcunu değiştirmemesini,
24. belge işlemlerinin yeni tahsilat oluşturmamasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- transaction,
- document row lock,
- payment row lock,
- kurum/sözleşme/para birimi eşleşme kontrolü,
- çift taraflı allocation cap,
- DB unique belge numarası,
- append-only audit geçmişi,
- fiziksel silme yasağı,
- yasal belge üretmediğine dair açık UI sınırı

ile çalışır.
