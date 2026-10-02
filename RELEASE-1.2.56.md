# İlkAdım 1.2.56

## Tahsilat Takvimi ve Beklenen Nakit Akışı

Bu sürüm 1.2.55 taksit/çoklu vade yapısını ve eski tek-vadeli sözleşmeleri tek bir salt-okunur tahsilat takviminde birleştirir.

Yeni migration yoktur.

Migration zinciri:

`084`

olarak kalır.

## Amaç

Ticari yapı artık:

- sözleşme,
- tahsilat,
- tahsilat riski,
- yönetici hatırlatması,
- lisans yenilemesi,
- taksit planı

bilgilerine sahip.

1.2.56'nın amacı bu verilerden:

- bugün ne kadar tahsilat bekleniyor,
- önümüzdeki 7 / 30 / 60 / 90 günde ne kadar açık vade var,
- ne kadar tahsilat gecikmiş,
- hangi açık bakiye vadesiz,
- aktif taksit planlarında hangi taksitler hâlâ açık,
- ödeme iptal edilirse beklenen akış nasıl değişiyor

sorularına tek ekrandan cevap vermektir.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`tahsilat-takvimi.php`

Yeni domain:

`src/tahsilat_takvimi.php`

Yeni stil:

`tahsilat-takvimi.css`

## Salt Okunur

Takvim:

- INSERT
- UPDATE
- DELETE

işlemi yapmaz.

Sayfada POST akışı yoktur.

Görüntülemek:

- sözleşmeyi değiştirmez,
- taksit planını değiştirmez,
- tahsilat oluşturmaz,
- tahsilat iptal etmez,
- risk kuyruğunu senkronize etmez,
- bildirim göndermez.

## Finansal Gerçek

Takvimde finansal gerçek yine:

- `kurum_sozlesmeleri`
- aktif `kurum_tahsilatlari`

tablolarıdır.

Taksit planı yeni borç yaratmaz.

Takvim yalnız mevcut sözleşme borcunun hangi vadelerde açık kaldığını gösterir.

## Açık Sözleşmeler

Takvim yalnız:

`durum = aktif`

sözleşmeleri kullanır.

Taslak, tamamlanmış ve iptal sözleşmeler beklenen gelecekteki tahsilat yükümlülüğü olarak gösterilmez.

Ayrıca:

`toplam_tutar - aktif_tahsilatlar > 0`

koşulu aranır.

Açık bakiyesi kalmayan sözleşme takvimde görünmez.

## Ödeme Double-count Koruması

Aktif tahsilatlar önce sözleşme bazında:

`GROUP BY sozlesme_id`

ile toplanır.

Böylece bir sözleşmede çok sayıda ödeme bulunması:

- sözleşme toplamını çoğaltmaz,
- beklenen tahsilatı şişirmez.

## Aktif Taksit Planı

Sözleşmede aktif taksit planı varsa yalnız:

- planın `aktif_surum` satırları,
- plan durumu `aktif`

olan taksitler kullanılır.

Eski plan sürümleri audit amacıyla DB'de kalır fakat güncel nakit akışına girmez.

## FIFO Tahsilat Dağılımı

Sözleşmenin aktif tahsilat toplamı güncel taksitlere:

1. en eski taksit,
2. sonraki taksit,
3. sonraki taksit

sırasıyla FIFO uygulanır.

Tamamen ödenmiş taksit takvimden çıkar.

Kısmi ödenmiş taksit yalnız kalan tutarıyla görünür.

Örnek:

- Taksit 1: 300
- Taksit 2: 300
- Taksit 3: 400
- Aktif tahsilat: 450

sonucunda:

- Taksit 1 → tamamen ödenmiş, görünmez
- Taksit 2 → 150 açık
- Taksit 3 → 400 açık

olarak hesaplanır.

## Tek Vade Geriye Uyumluluğu

Aktif taksit planı olmayan eski sözleşmeler:

- sözleşmenin mevcut `vade_tarihi`
- sözleşme toplamı eksi aktif tahsilatlar

ile tek açık vade kalemi olarak gösterilir.

Bu nedenle eski kurum/sözleşme kayıtları taksit planı eklenmeden çalışmaya devam eder.

## Vadesiz Açık Bakiye

Aktif ve açık bakiyeli sözleşmede:

`vade_tarihi = NULL`

ise kayıt kaybolmaz.

Takvimde:

`Vade tarihi yok`

olarak ayrı gösterilir.

Para birimi özetinde:

`Vadesiz`

bakiyeye eklenir.

Bu kayıtlar 6 aylık tarihli nakit akışı trendine dahil edilmez.

## Vade Kategorileri

Her para birimi ayrı olmak üzere:

- Gecikmiş
- Bugün
- 1–7 gün
- 8–30 gün
- 31–60 gün
- 61–90 gün
- 90+ gün
- Vadesiz

açık tutarlar gösterilir.

TRY, USD ve EUR birbirine eklenmez.

## 6 Aylık Beklenen Tahsilat

Önümüzdeki 6 ay için açık tarihli vade kalemleri:

- ay,
- para birimi,
- beklenen açık tutar,
- açık kalem sayısı

bazında gösterilir.

Bu görünüm tahsil edilmiş tutarı tekrar beklenen gelir olarak saymaz.

Gecikmiş ve vadesiz tutarlar 6 aylık gelecek tahsilat trendine eklenmez.

## Filtreler

Takvim destekler:

- başlangıç tarihi,
- bitiş tarihi,
- TRY/USD/EUR,
- kurum adı,
- kurum kodu,
- sözleşme numarası,
- gecikmiş kayıtları dahil et / çıkar,
- vadesiz kayıtları dahil et / çıkar.

Varsayılan tarih aralığı:

`bugün → +90 gün`

olarak açılır.

## Tarih Aralığı Güvenliği

Tek sorgu/görünüm aralığı en fazla:

`366 gün`

olabilir.

Başlangıç tarihi bitiş tarihinden sonra olamaz.

Geçersiz filtre durumunda kullanıcıya hata gösterilir ve ekran güvenli varsayılan 90 günlük aralığa döner.

## Gecikmiş Kayıt Davranışı

Varsayılan görünümde tarih aralığından bağımsız olarak açık gecikmiş vadeler de gösterilir.

Böylece geçmiş vade:

`bugün → +90 gün`

filtre aralığının dışında kaldığı için operasyon ekranından kaybolmaz.

İstenirse:

`Gecikmişleri dahil et`

seçimi kapatılabilir.

## Taksit ve Tek Vade Ayrımı

Her satır:

- Taksit #N
- veya Tek vade

kaynağını açıkça gösterir.

Taksit satırı ayrıca taksit açıklamasını gösterebilir.

## Ödeme İptali Sonrası Anlık Yeniden Hesaplama

Takvim snapshot saklamaz.

Aktif ödeme sonradan iptal edilirse bir sonraki görüntülemede FIFO dağılımı yeniden hesaplanır.

Daha önce kapanmış taksit:

- tekrar açık,
- gerekiyorsa tekrar gecikmiş

hale gelir.

Yeni ayrı vade kaydı yazılmaz; görünüm finansal kaynaktan türetilir.

## N+1 Sorgu Koruması

Aktif sözleşmeler tek sorguda alınır.

Aktif taksit planlarının güncel satırları da sözleşme başına ayrı sorgu yerine:

`WHERE sozlesme_id IN (...)`

ile toplu olarak alınır.

FIFO dağılım PHP tarafında sözleşme bazında hesaplanır.

Bu sayede yüzlerce sözleşmede taksit satırları için N+1 sorgu paterni oluşmaz.

## Menü Entegrasyonu

Tahsilat Takvimi bağlantısı:

- Süper Admin ana menüsüne,
- Ticari Yönetim Dashboardu'na,
- Ticari Finans'a,
- Tahsilat Risk Merkezi'ne

eklendi.

## Yeni Testler

- `tests/collection-calendar-181.cjs`
- `tests/collection-calendar-db-181.php`

MariaDB testi şunları doğrular:

1. varsayılan takvim tarih aralığını,
2. 366 günden geniş aralığın reddini,
3. başlangıç > bitiş reddini,
4. aktif planın güncel sürüm taksitlerinin kullanılmasını,
5. FIFO ödeme dağılımını,
6. tamamen ödenen ilk taksidin takvimden çıkmasını,
7. kısmi ikinci taksidin yalnız kalan tutarla görünmesini,
8. üçüncü taksidin açık tutarını,
9. tek-vadeli eski sözleşme fallback'ini,
10. tek vade açık bakiye hesabını,
11. gecikmiş tek vade sınıflamasını,
12. vadesiz açık sözleşmenin görünmesini,
13. taslak/iptal sözleşmelerin takvimden çıkmasını,
14. TRY/USD ayrımını,
15. gecikmiş TRY toplamını,
16. 1–7 gün TRY toplamını,
17. 31–60 gün TRY toplamını,
18. vadesiz TRY toplamını,
19. 8–30 gün USD toplamını,
20. varsayılan 90 günlük görünümü,
21. gecikmiş/vadesiz kayıtları kapatma filtresini,
22. USD filtresini,
23. kurum arama filtresini,
24. 6 aylık TRY beklenen tahsilat toplamını,
25. 6 aylık USD beklenen tahsilat toplamını,
26. ödeme iptal edildiğinde açık taksitlerin anlık geri gelmesini,
27. ödeme iptali sonrası gecikmiş tahsilat tahmininin yeniden hesaplanmasını.

## Migration

Yeni migration yoktur.

Migration zinciri:

`084`

olarak devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur domain,
- para birimi izolasyonu,
- payment pre-aggregation,
- aktif plan sürümü seçimi,
- FIFO dağılım,
- maksimum 366 günlük tarih filtresi,
- HTML escaping,
- finansal kaynakların tek gerçek olarak korunması

ile çalışır.
