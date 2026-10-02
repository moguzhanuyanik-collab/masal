# İlkAdım 1.2.53

## Kurum Ticari 360 / Hesap Ekstresi Görünümü

Bu sürüm 1.2.52 Ticari Yönetim Dashboardu'ndaki kurum satırlarını kurum bazlı salt-okunur ticari 360 görünümüne bağlar.

Yeni migration yoktur.

Migration zinciri:

`083`

olarak kalır.

## Amaç

Ticari dashboard kurum bazında:

- portföy,
- tahsilat,
- açık bakiye,
- gecikmiş bakiye

gösteriyordu.

Ancak tek bir kurumun:

- tüm sözleşme durumlarını,
- aktif ve iptal tahsilat hareketlerini,
- yenileme geçmişini,
- tahsilat risk durumunu,
- yönetici tahsilat hatırlatma geçmişini

aynı ekranda görmek için farklı modüllere tek tek geçmek gerekiyordu.

1.2.53 bu görünümü tek sayfada birleştirir.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`kurum-ticari-360.php?kurum_id=ID`

Yeni domain:

`src/kurum_ticari_360.php`

Yeni stil:

`kurum-ticari-360.css`

## Giriş Noktası

1.2.52 Ticari Dashboard'daki kurum adı artık:

`Kurum Ticari 360`

sayfasını açar.

360 ekranından ayrıca:

- Ticari Finans,
- Tahsilat Risk Merkezi,
- Lisans Yenilemeleri,
- Kurum Yönetimi

sayfalarına geçilebilir.

## Yetki

Kurum Ticari 360 yalnız:

`super_admin`

rolüyle açılır.

Kurum ID GET parametresiyle alınır.

Geçersiz veya bulunmayan kurum ID için veri gösterilmez.

## Salt Okunur Tasarım

Domain:

- INSERT
- UPDATE
- DELETE

işlemi içermez.

Sayfada POST akışı yoktur.

Ekranı görüntülemek:

- sözleşme değiştirmez,
- tahsilat oluşturmaz,
- tahsilat iptal etmez,
- risk vakası değiştirmez,
- yenileme değiştirmez,
- bildirim göndermez.

## Para Birimi Bazında Kurum Özeti

Finansal özet yalnız:

- aktif,
- tamamlanmış

sözleşmeleri kapsar.

Taslak ve iptal sözleşmeler finansal portföy toplamına alınmaz.

TRY, USD ve EUR ayrı tutulur.

Her para birimi için:

- aktif sözleşme değeri,
- ticari portföy,
- tahsil edilen,
- açık bakiye,
- gecikmiş bakiye,
- tahsilat oranı,
- yenilemeye bağlı sözleşme sayısı

gösterilir.

## Double-count Koruması

Tahsilatlar sözleşmeye bağlanmadan önce:

`GROUP BY sozlesme_id`

ile özetlenir.

Bu nedenle bir sözleşmede:

- iki,
- üç,
- daha fazla

tahsilat olması sözleşme toplamını çoğaltmaz.

İptal tahsilatlar finansal özette tahsil edilmiş tutara girmez.

## Tüm Sözleşme Geçmişi

Finansal KPI taslak/iptal sözleşmeleri dışlasa da 360 audit görünümü tüm sözleşmeleri korur:

- Taslak
- Aktif
- Tamamlandı
- İptal

Sözleşme satırı şu bilgileri gösterir:

- sözleşme numarası,
- paket,
- durum,
- başlangıç/bitiş,
- vade,
- toplam tutar,
- aktif tahsilat toplamı,
- açık bakiye,
- aktif tahsilat sayısı,
- toplam tahsilat geçmişi,
- risk durumu,
- yenileme bağlantısı,
- hatırlatma sayısı.

## Gecikmiş Sözleşme

Sözleşme:

- aktif,
- açık bakiyeli,
- vadesi geçmiş

ise 360 tabloda gecikmiş olarak işaretlenir.

Taslak/tamamlanmış/iptal sözleşme gecikmiş risk olarak işaretlenmez.

## Tahsilat Audit Geçmişi

Kurumun tahsilat hareketlerinde hem:

- aktif,
- iptal

kayıtları gösterilir.

Bu görünüm finansal KPI'dan farklı olarak audit içindir.

İptal tahsilat:

- tutarı,
- referansı,
- iptal nedeni

ile geçmişte görünmeye devam eder.

Başka kurumun tahsilatı kurum 360 ekranına giremez.

## Lisans Yenileme Geçmişi

080 tablosu mevcutsa kurumun:

- açık,
- temas,
- teklif,
- yenilendi,
- yenilenmedi

yenileme vakaları listelenir.

081 mapping mevcutsa yenileme vakasının bağlı ticari sözleşme ID'si de görünür.

Her yenileme satırı Lisans Yenilemeleri merkezindeki vakaya bağlanır.

## Tahsilat Risk Bağlantısı

082 risk tablosu mevcutsa sözleşme satırında:

- açık,
- temas,
- ödeme sözü,
- ihtilaf,
- kapalı

risk durumu görülebilir.

Risk kaydı olan sözleşmeden Tahsilat Risk Merkezi detayına geçilebilir.

## Yönetici Hatırlatma Geçmişi

083 tablosu mevcutsa kurum için gönderilmiş tahsilat hatırlatmaları gösterilir.

Her geçmiş kaydı:

- sözleşme,
- eşik kodu,
- vade tarihi,
- gönderim anı açık tutar snapshot'ı,
- para birimi,
- yönetici alıcı sayısı,
- gönderim tarihi

bilgisini içerir.

Eski reminder snapshot'ları güncel bakiye değişse bile audit geçmişi olarak korunur.

## 360 Üst Sayaçları

Kurum için:

- toplam sözleşme,
- aktif sözleşme,
- gecikmiş sözleşme,
- açık risk vakası,
- aktif tahsilat hareketi,
- iptal tahsilat hareketi,
- yenileme vakası,
- tahsilat hatırlatma sayısı

gösterilir.

## Tenant/Kurum İzolasyonu

Tüm 360 sorguları kurum ID ile sınırlandırılır.

Test fixture'ında ikinci kurumun:

- sözleşmesi,
- tahsilatı,
- yenilemesi,
- reminder kaydı

oluşturulur ve ilk kurumun 360 sonucuna sızmadığı doğrulanır.

## Opsiyonel Modül Uyumluluğu

Temel Ticari Finans tabloları hazır olduğu sürece 360 açılır.

Aşağıdaki tablolar yoksa ilgili bağlantı bilgisi boş bırakılır:

- lisans_yenileme_sozlesmeleri
- kurum_lisans_yenilemeleri
- ticari_tahsilat_takipleri
- ticari_tahsilat_hatirlatmalari

Böylece eski kurulum/ara migration durumunda temel sözleşme ve tahsilat görünümü çalışmaya devam eder.

## Testler

Yeni testler:

- `tests/institution-commercial-360-178.cjs`
- `tests/institution-commercial-360-db-178.php`

MariaDB testi şunları doğrular:

1. kurum çözümlemesini,
2. bilinmeyen kurumda null dönüşünü,
3. TRY/USD finansal ayrımını,
4. taslak/iptal sözleşmelerin finansal portföye girmemesini,
5. aktif sözleşme değerini,
6. çoklu aktif tahsilatta sözleşme toplamının çoğalmamasını,
7. iptal tahsilatın finansal özete girmemesini,
8. açık bakiyeyi,
9. gecikmiş bakiyeyi,
10. yenileme sözleşme sayısını,
11. tüm sözleşme durumlarının audit görünümünde korunmasını,
12. aktif tahsilat sayısını,
13. toplam tahsilat geçmişinin iptalleri de saymasını,
14. gecikmiş sözleşme bayrağını,
15. yenileme lineage bilgisini,
16. risk durumunu,
17. reminder sayısını,
18. aktif + iptal tahsilat hareket geçmişini,
19. kurumlar arası tahsilat izolasyonunu,
20. açık ve kapanmış yenileme vakalarını,
21. yenileme–sözleşme bağlantısını,
22. kurum reminder geçmişini,
23. 360 üst sayaçlarını,
24. ikinci kurum verisinin sözleşme/ödeme/yenileme/reminder sonuçlarına sızmamasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur domain,
- kurum ID parametreli sorgular,
- para birimi ayrımı,
- payment pre-aggregation,
- fiziksel geçmiş kayıtlarının korunması,
- tenant/kurum izolasyonu

ile çalışır.
