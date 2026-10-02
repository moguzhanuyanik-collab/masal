# İlkAdım 1.2.52

## Ticari Yönetim Dashboardu / Gelir–Tahsilat KPI Merkezi

Bu sürüm mevcut Ticari Finans, Lisans Yenileme, Tahsilat Risk ve Tahsilat Hatırlatma verilerini salt-okunur bir Süper Admin yönetim dashboardunda birleştirir.

Yeni migration yoktur.

Migration zinciri:

`083`

olarak kalır.

## Neden Yeni Migration Yok?

Dashboard:

- yeni finansal veri üretmez,
- sözleşme kaydetmez,
- tahsilat kaydetmez,
- risk vakası açmaz,
- bildirim göndermez,
- KPI snapshot tablosu oluşturmaz.

Tüm değerler mevcut kaynak tablolardan anlık hesaplanır.

Bu nedenle salt raporlama özelliği için gereksiz `084` migration üretilmemiştir.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-dashboard.php`

Yeni domain:

`src/ticari_dashboard.php`

Yeni stil:

`ticari-dashboard.css`

## Para Birimi Güvenliği

TRY, USD ve EUR hiçbir toplamda birbirine eklenmez.

Ana KPI'lar:

`para_birimi`

bazında ayrı satır/kart olarak hesaplanır.

Kurum ticari özeti de:

`kurum + para_birimi`

bazında gruplanır.

## Aktif Sözleşme Değeri

`Aktif sözleşme değeri`

yalnız:

`durum = aktif`

olan sözleşmelerin toplamıdır.

Tamamlanan eski sözleşmeler aktif gelir gibi gösterilmez.

## Ticari Portföy

`Ticari portföy`

şu sözleşmeleri kapsar:

- aktif
- tamamlandı

Şunlar hariçtir:

- taslak
- iptal

Bu toplam yönetimsel sözleşme portföyü görünümüdür.

## Tahsil Edilen

Tahsilat önce sözleşme bazında alt sorguda toplanır:

`GROUP BY sozlesme_id`

Daha sonra sözleşme tablosuna bağlanır.

Bu tasarım aynı sözleşmeye birden fazla tahsilat olduğunda:

`sözleşme toplamının tahsilat satırı sayısı kadar çoğalmasını`

engeller.

Yalnız:

`kurum_tahsilatlari.durum = aktif`

kayıtları tahsil edilmiş tutara girer.

İptal edilmiş tahsilatlar KPI toplamında kullanılmaz.

## Açık Bakiye

Açık bakiye:

`ticari portföy - aktif tahsilatlar`

olarak para birimi bazında hesaplanır.

Negatif bakiye gösterilmez.

## Gecikmiş Bakiye

Bir sözleşmenin gecikmiş bakiye sayılması için:

- sözleşme aktif olmalı,
- açık bakiyesi bulunmalı,
- vade tarihi tanımlı olmalı,
- vade tarihi bugünden önce olmalı.

Tamamlanmış sözleşme gecikmiş bakiye olarak sayılmaz.

## Tahsilat Oranı

Her para birimi için:

`aktif tahsilat toplamı / ticari portföy toplamı × 100`

hesaplanır.

Oran:

- aynı para birimi içinde hesaplanır,
- 0–100 aralığında sunulur.

## Yenileme Geliri

1.2.49 yenileme–sözleşme mapping'i mevcutsa dashboard ayrıca:

- yenileme sözleşme sayısı,
- yenileme sözleşme toplamı,
- yenileme tahsil edilen,
- yenileme kalan bakiye,
- yenileme tahsilat oranı

gösterir.

Mapping tablosu bulunmayan eski/veri geçişi durumunda dashboard temel ticari KPI'ları göstermeye devam eder.

## 6 Aylık Tahsilat Trendi

Son 6 ay için gerçek aktif tahsilatlar:

- ay,
- para birimi,
- tahsilat toplamı,
- tahsilat sayısı,
- tahsilat yapılan kurum sayısı

bazında gösterilir.

İptal edilmiş tahsilatlar aylık trende girmez.

Trend TRY/USD/EUR için ayrı ölçeklenir.

## Kurum Bazlı Ticari Performans

Kurum tablosu şu alanları gösterir:

- kurum,
- para birimi,
- sözleşme sayısı,
- aktif sözleşme sayısı,
- ticari portföy,
- tahsil edilen,
- açık bakiye,
- gecikmiş bakiye,
- gecikmiş sözleşme sayısı,
- tahsilat oranı,
- yenileme sözleşme sayısı,
- son tahsilat tarihi.

Kurum satırları:

1. gecikmiş bakiye,
2. açık bakiye,
3. kurum adı

önceliğiyle sıralanır.

## Kurum Filtresi

Dashboard GET filtresiyle:

- kurum adı/kodu arama,
- TRY/USD/EUR seçimi

yapılabilir.

Filtre herhangi bir finansal kayıt değiştirmez.

## Son Aktif Tahsilatlar

Son aktif tahsilatlar:

- kurum,
- sözleşme,
- tahsilat tarihi,
- ödeme yöntemi,
- referans numarası,
- tutar,
- para birimi

ile gösterilir.

İptal edilmiş tahsilatlar bu akışta görünmez.

## Operasyon Nabzı

Dashboard ayrıca mevcut operasyon domainleri hazırsa salt-okunur olarak:

- açık tahsilat risk vakası,
- 31+ gün kritik risk,
- aksiyon zamanı gelen tahsilat takibi,
- gönderilmiş yönetici tahsilat hatırlatması,
- açık lisans yenileme vakası,
- yenilenmiş ancak ticari akışı eksik vaka

sayılarını gösterir.

Bu kutular ilgili operasyon ekranlarına bağlantıdır.

## Salt Okunur Güvence

`src/ticari_dashboard.php`

şunları içermez:

- INSERT
- UPDATE
- DELETE

Dashboard sayfasında POST iş akışı yoktur.

Yani sayfayı görüntülemek:

- risk senkronize etmez,
- tahsilat yazmaz,
- sözleşme değiştirmez,
- yönetici bildirimi göndermez.

## Menü Entegrasyonu

`Ticari Yönetim Dashboardu` bağlantısı:

- Süper Admin ana menüsüne,
- Süper Admin sistem kartlarına,
- Ticari Finans'a,
- Tahsilat Risk Merkezi'ne,
- Lisans Yenileme Merkezi'ne

eklendi.

## Testler

Yeni testler:

- `tests/commercial-dashboard-177.cjs`
- `tests/commercial-dashboard-db-177.php`

MariaDB testi şunları doğrular:

1. TRY ve USD'nin ayrı KPI satırlarında kalmasını,
2. aynı sözleşmede iki aktif tahsilat olsa bile sözleşme toplamının yalnız bir kez sayılmasını,
3. iptal tahsilatın tahsil edilmiş toplamına girmemesini,
4. taslak sözleşmenin portföye girmemesini,
5. iptal sözleşmenin portföye girmemesini,
6. aktif sözleşme değerinin tamamlanmış sözleşmeden ayrı hesaplanmasını,
7. ticari portföy toplamını,
8. tahsil edilen toplamı,
9. açık bakiyeyi,
10. gecikmiş bakiyeyi,
11. gecikmiş sözleşme sayısını,
12. tahsilat oranını,
13. yenileme sözleşme sayısını,
14. yenileme sözleşme toplamını,
15. yenileme tahsilatını,
16. yenileme kalan bakiyesini,
17. USD KPI bağımsızlığını,
18. kurum+para birimi özetini,
19. kurum arama filtresini,
20. aylık aktif tahsilat trendini,
21. iptal tahsilatın trendden çıkmasını,
22. son aktif tahsilat listesini,
23. opsiyonel operasyon domainleri yüklenmediğinde dashboardun güvenli sıfır değerleriyle çalışmasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin görünümü,
- salt-okunur domain,
- parametreli kurum filtreleri,
- para birimi ayrımı,
- ödeme alt sorgusu üzerinden double-count koruması,
- mevcut finansal kaynakların tek gerçek olarak kullanılması

ile çalışır.
