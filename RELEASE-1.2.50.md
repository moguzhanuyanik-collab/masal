# İlkAdım 1.2.50

## Ticari Operasyon ve Tahsilat Risk Merkezi

Bu sürüm Ticari Finans'taki sözleşme ve tahsilat verisini operasyonel risk kuyruğuna dönüştürür.

Yeni migration:

`082_ticari_tahsilat_risk_merkezi.sql`

Migration zinciri:

`082`

olur.

## Amaç

Önceki sürümlerde:

- sözleşme bakiyesi,
- vade tarihi,
- tahsilat geçmişi,
- yenileme bağlantısı

mevcuttu.

Ancak Süper Admin için:

- hangi açık bakiyeye bugün aksiyon alınmalı,
- kaç gün gecikti,
- yenilenmiş kurumun tahsilatı gecikti mi,
- kurumla görüşüldü mü,
- ödeme sözü alındı mı,
- sonraki takip tarihi ne,
- ödeme tamamlandığında vaka otomatik kapanıyor mu

tek bir tahsilat operasyon ekranında izlenmiyordu.

1.2.50 bu katmanı ekler.

## Yeni Merkez

Yeni sayfa:

`tahsilat-risk.php`

yalnız Süper Admin tarafından kullanılabilir.

Merkez:

- açık tahsilat riskini,
- vade yaşlandırmasını,
- para birimi bazında risk tutarını,
- yenileme kaynaklı gecikmeleri,
- takip aşamasını,
- takip notlarını,
- sonraki aksiyon tarihini

tek akışta gösterir.

## Finansal Kaynak Tekliği

Risk modülü:

- sözleşme toplamını kopyalamaz,
- tahsil edilen tutarı kopyalamaz,
- açık bakiyeyi kopyalamaz.

Bu değerler her zaman mevcut:

- `kurum_sozlesmeleri`
- `kurum_tahsilatlari`

tablolarından hesaplanır.

Yeni tablo yalnız operasyonel takip durumunu saklar.

Böylece ödeme eklenmesi veya iptali halinde iki ayrı bakiye kaynağı oluşmaz.

## Risk Kuyruğu Senkronizasyonu

Risk vakaları GET/sayfa açılışında sessizce yazılmaz.

Süper Admin:

`Risk Kuyruğunu Senkronize Et`

işlemini çalıştırır.

İşlem CSRF korumalıdır.

Senkronizasyon:

1. aktif sözleşmeleri okur,
2. aktif tahsilat toplamını hesaplar,
3. açık bakiyesi olanları bulur,
4. vade risk penceresini kontrol eder,
5. yeni vakayı açar,
6. kapanmış ancak tekrar risk oluşan vakayı yeniden açar,
7. finansal risk çözülmüş vakaları otomatik kapatır.

## Risk Penceresi

Açık bakiyesi olan aktif sözleşme:

- vade tarihi yoksa,
- vadesi geçmişse,
- veya vadesine en fazla 7 gün kalmışsa

risk kuyruğuna girer.

Vadesine 7 günden fazla olan sözleşme henüz tahsilat aksiyon kuyruğuna alınmaz.

## Yaşlandırma

Deterministik kategoriler:

- 7 gün içinde vade
- 0–7 gün gecikme
- 8–15 gün gecikme
- 16–30 gün gecikme
- 31+ gün gecikme
- Vade tarihi eksik

olarak uygulanır.

## Risk Seviyesi

Risk seviyesi tahmin veya yapay zekâ puanı değildir.

Sadece gecikme süresine göre deterministik görsel sınıflamadır:

- yaklaşan / 0–7 gün → düşük
- 8–15 gün → orta
- 16–30 gün → yüksek
- 31+ gün → kritik
- vade tarihi eksik → orta

Bu sınıflama ticari karar yerine operasyonel sıralama içindir.

## Para Birimi Bazında Risk

TRY, USD ve EUR birbirine çevrilmez.

Her para birimi için:

- risk kuyruğundaki açık bakiye,
- gecikmiş açık bakiye,
- 31+ gün kritik bakiye,
- sözleşme sayısı

ayrı gösterilir.

## Yenileme Kaynaklı Gecikme

1.2.49 ile yenilemeye bağlanan sözleşme gecikmiş ve açık bakiyeli ise:

`Yenileme Gecikmesi`

olarak işaretlenir.

Ayrı filtre:

`Yenileme kaynaklı gecikme`

ile yalnız bu kurumlar görülebilir.

## Takip Aşamaları

Açık risk vakasında:

- Açık
- Temas Edildi
- Ödeme Sözü
- İhtilaf / İnceleme

aşamaları kullanılabilir.

`Kapalı`

durum finansal gerçeğe bağlıdır ve manuel operasyon aşaması değildir.

## Manuel Kapatma Yok

Borç devam ederken tahsilat takip vakasını elle gizleyen:

`Kapat`

işlemi yoktur.

Vaka ancak finansal durum değişince otomatik kapanır.

Bu tasarım gecikmiş borcun operasyon listesinden elle kaybedilmesini engeller.

## Otomatik Kapanma

Senkronizasyon açık vakayı şu durumlarda kapatır:

### Tahsilat Tamamlandı

Açık bakiye sıfırlanmışsa:

`tahsilat_tamamlandi`

kodu kullanılır.

### Sözleşme İptal

Sözleşme iptal edilmişse:

`sozlesme_iptal`

kodu kullanılır.

### Sözleşme Taslak

Sözleşme taslak duruma alınmışsa:

`sozlesme_taslak`

kodu kullanılır.

### Risk Penceresi Dışında

Vade tarihi ileri alınıp 7 günlük risk penceresinin dışına çıkmışsa:

`risk_penceresi_disinda`

kodu kullanılır.

## Yeniden Açılma

Örneğin:

1. sözleşme tamamen tahsil edilir,
2. risk vakası otomatik kapanır,
3. tahsilat sonradan iptal/iade edilir,
4. sözleşme tekrar açık bakiyeli hale gelir.

Bir sonraki senkronizasyonda yeni ikinci vaka oluşturulmaz.

Aynı sözleşmenin mevcut takip vakası:

`vaka_yeniden_acildi`

olayıyla tekrar açılır.

Geçmiş korunur.

## Takip Notları

Süper Admin vaka içine:

- görüşme sonucu,
- ödeme sözü,
- dekont bekleniyor,
- itiraz,
- muhasebe dönüşü,
- sonraki adım

gibi notlar ekleyebilir.

Not:

- 2–2000 karakter,
- append-only geçmiş

olarak saklanır.

## Sonraki Aksiyon Tarihi

Takip notuyla birlikte opsiyonel:

`sonraki_aksiyon_tarihi`

tanımlanabilir.

Tarih:

- bugün,
- veya gelecek

olmalıdır.

Geçmiş tarih girilemez.

Bugün veya zamanı gelmiş aksiyonlar dashboard üstünde ayrıca sayılır.

## Sorumlu

İlk aşama/not işlemini yapan Süper Admin:

`sorumlu_kullanici_id`

alanına atanır.

Mevcut sorumlu sonraki işlemde sessizce değiştirilmez.

## Append-only Takip Geçmişi

Yeni:

`ticari_tahsilat_takip_gecmisi`

tablosu şu olayları tutar:

- vaka açıldı,
- vaka yeniden açıldı,
- aşama değişti,
- takip notu,
- otomatik kapanma.

Risk vaka/geçmiş kayıtları fiziksel olarak silinmez.

## Yeni Tablolar

### ticari_tahsilat_takipleri

Bir sözleşme için tek operasyonel takip vakası.

Primary key:

`sozlesme_id`

Alanlar:

- sozlesme_id
- kurum_id
- durum
- sorumlu_kullanici_id
- son_temas_tarihi
- sonraki_aksiyon_tarihi
- kapanma_kodu
- kapanma_tarihi
- oluşturma/güncelleme kullanıcıları
- timestamp alanları

### ticari_tahsilat_takip_gecmisi

Append-only takip izi.

Alanlar:

- id
- sozlesme_id
- kurum_id
- kullanici_id
- tur
- kod
- not_metni
- olusturulma_tarihi

## Kilitleme

Risk senkronizasyonu sözleşme satırını sade:

`SELECT ... FOR UPDATE`

ile kilitler.

Ardından ödeme toplamı ayrı finansal sorgudan okunur.

Aggregate/join sorgusuna locking clause eklenmez.

Bu MariaDB uyumluluğunu ve finansal uzlaştırma güvenliğini artırır.

## Ticari Finans Entegrasyonu

Ticari Finans ekranına:

`Tahsilat Risk Merkezi`

bağlantısı eklendi.

Finans ekranı yine:

- sözleşme,
- tahsilat,
- ödeme iptali,
- finansal durum

kaynağı olmaya devam eder.

Risk Merkezi ödeme kaydı oluşturmaz veya iptal etmez.

## Lisans Yenileme Entegrasyonu

Lisans Yenilemeleri ekranına da Risk Merkezi bağlantısı eklendi.

Yenilemeden gelen ve vadesi geciken sözleşme Risk Merkezi'nde:

`Yenileme Gecikmesi`

olarak görünür.

## Süper Admin Menü Entegrasyonu

Ana Süper Admin menüsüne:

`Tahsilat Risk Merkezi`

eklendi.

## Testler

Yeni testler:

- `tests/commercial-risk-center-175.cjs`
- `tests/commercial-risk-center-db-175.php`

MariaDB testi şunları doğrular:

1. 7 gün içindeki vadenin yaklaşan risk olarak sınıflanmasını,
2. bugün vadenin 0–7 grubuna girmesini,
3. 8–15 gün gecikmeyi,
4. 16–30 gün gecikmeyi,
5. 31+ gün gecikmeyi,
6. vade tarihi eksik riskini,
7. 7 günden uzak sözleşmenin kuyruğa girmemesini,
8. tamamlanmış/tam tahsil edilmiş sözleşmenin kuyruğa girmemesini,
9. senkronizasyonun idempotent olmasını,
10. bir sözleşmede tek takip vakası olmasını,
11. yenileme kaynaklı gecikme filtresini,
12. takip notunu,
13. ödeme sözü aşamasını,
14. sonraki aksiyon tarihini,
15. Süper Admin'in sorumlu atanmasını,
16. append-only not geçmişini,
17. ihtilaf aşamasını,
18. tam tahsilatta otomatik kapanmayı,
19. kapanma kodunu,
20. tahsilat iptalinde aynı vakanın yeniden açılmasını,
21. yeniden açılma geçmişini,
22. vadenin ileri alınmasında otomatik kapanmayı,
23. sözleşme iptalinde otomatik kapanmayı,
24. para birimi bazlı açık/gecikmiş risk tutarını,
25. detay ekranında yenileme lineage bilgisini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- transaction,
- sözleşme row lock,
- mevcut finans domaini,
- append-only geçmiş,
- tek sözleşme → tek takip vakası,
- manuel finansal kapatma yasağı

ile çalışır.
