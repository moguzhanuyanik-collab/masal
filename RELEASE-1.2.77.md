# İlkAdım 1.2.77

## Hedef Risk Takip Planı Sağlığı

Bu sürüm 1.2.76 ile planlanan okunmamış hedef-risk takiplerinin sonradan ne olduğunu salt-okunur olarak görünür hale getirir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.76 şu akışı tamamladı:

- current owner,
- current reopen döngüsü,
- exact current signal,
- exact current notification,
- okunmamış durum,
- owner koruyarak sonraki aksiyon tarihi planlama.

Ancak planlandıktan sonra şu sorular tek ekranda cevaplanmıyordu:

- bildirim hâlâ okunmamış mı,
- aksiyon tarihi geçti mi,
- aksiyon bugün mü,
- owner değişti mi,
- reopen döngüsü değişti mi,
- hedef-risk sinyali değişti mi,
- exact current notification değişti mi,
- risk çözüldü mü,
- vaka kapandı mı.

1.2.77 bu görünürlüğü ekler.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hedef-risk-takip-saglik.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_takip_saglik.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-takip-saglik.css`

## Yeni State Yok

Bu sürüm:

- vaka oluşturmaz,
- vaka güncellemez,
- owner değiştirmez,
- aksiyon tarihi değiştirmez,
- notification göndermez,
- notification okundu durumu yazmaz,
- hedef politikası değiştirmez.

Yalnız mevcut append-only plan geçmişini bugünkü current state ile karşılaştırır.

Bu nedenle migration zinciri `090` olarak kalır.

## Kaynak Plan

Sağlık hesabı yalnız:

`ticari_mutabakat_vaka_gecmisi.kod = toplu_takip_planlama`

olaylarını kullanır.

Bir vakada birden fazla takip planı varsa current health görünümüne yalnız en son:

`MAX(id)`

planı girer.

Eski planlar append-only geçmişte korunur ancak güncel sağlık KPI'sını şişirmez.

## Plan Anındaki Bildirim

Plan olayının oluşturulma zamanında o vaka için mevcut olan en son hedef-risk bildirimi çözülür.

Bildirim:

`bildirim.olusturulma_tarihi <= plan.olusturulma_tarihi`

koşuluyla seçilir.

Böylece plan sonrasında üretilmiş yeni notification geçmiş planın bildirimi gibi değerlendirilmez.

## Current Resolver Tekrar Kullanımı

Yeni sağlık domaini ikinci bir current notification algoritması yazmaz.

Mevcut:

`mi_target_risk_map()`

resolver'ını yeniden kullanır.

Bu resolver mevcut zincirde:

- current owner,
- current reopen cycle,
- exact current target-risk signal,
- current notification id,
- current read state

bağlamını üretir.

## Reopen-Aware Döngü

Plan anındaki bildirimin:

`dongu_anahtari`

değeri bugünkü:

`mrh_cycle_key()`

ile karşılaştırılır.

Vaka planlandıktan sonra yeniden açılmışsa plan:

`Reopen Döngüsü Değişti`

olarak tarihsel/stale bağlamda görünür.

## Owner Değişimi

Plan anındaki notification recipient ile bugünkü:

`sorumlu_kullanici_id`

aynı değilse:

`Owner Değişti`

durumu üretilir.

Eski owner bildirimi yeni owner için teslim edilmiş veya takip edilmiş sayılmaz.

## Current Signal Değişimi

Plan anındaki:

- `hedef_75`
- `hedef_disinda`

sinyali bugünkü exact current beklenen eşikle aynı değilse:

`Hedef-Risk Sinyali Değişti`

olarak görünür.

## Current Notification Değişimi

Owner ve reopen döngüsü aynı olsa bile exact current notification id artık plan anındaki notification değilse:

`Güncel Bildirim Değişti`

durumu üretilir.

Bu, eski notification üzerinden yanlış operasyon takibi yapılmasını önler.

## Sağlık Durumları

Yeni read-only sınıflandırma:

- Owner Değişti
- Reopen Döngüsü Değişti
- Hedef-Risk Sinyali Değişti
- Güncel Bildirim Değişti
- Aksiyon Gecikmiş
- Aksiyon Bugün
- Aksiyon Tarihi Yok
- Planlı · Okunmadı
- Bildirim Okundu
- Hedef-Risk Çözüldü
- Vaka Kapandı
- Plan Bildirimi Bulunamadı

durumlarını üretir.

## Aksiyon Gecikmiş

Vaka:

- hâlâ açık,
- current owner aynı,
- current cycle aynı,
- current signal aynı,
- exact notification aynı,
- notification okunmamış

ve:

`sonraki_aksiyon_tarihi < bugün`

ise:

`Aksiyon Gecikmiş`

olarak gösterilir.

## Aksiyon Bugün

Aynı current context korunurken aksiyon tarihi bugünse:

`Aksiyon Bugün`

durumu gösterilir.

## Aksiyon Tarihi Yok

Planlanmış current unread risk vakasında sonradan aksiyon tarihi kaldırılmışsa veya kaybolmuşsa:

`Aksiyon Tarihi Yok`

dikkat durumu üretilir.

## Planlı · Okunmadı

Current owner, cycle, signal ve notification aynıysa; bildirim okunmamış ve aksiyon tarihi gelecekteyse:

`Planlı · Okunmadı`

durumu gösterilir.

## Bildirim Okundu

Plan anındaki exact notification okunmuşsa:

`Bildirim Okundu`

durumu gösterilir.

Bu ekran okundu state'ini kendisi değiştirmez.

## Risk Çözüldü

Vaka hâlâ açık olabilir ancak current target-risk resolver artık notification üreten:

- `hedef_75`
- veya `hedef_disinda`

sinyali üretmiyorsa:

`Hedef-Risk Çözüldü`

olarak görünür.

## Vaka Kapandı

Vaka artık açık stage'de değilse takip planı:

`Vaka Kapandı`

olarak tarihsel sonuçta tutulur.

## Öncelik Sırası

Operasyon listesi şu sırayla düzenlenir:

1. owner değişti
2. reopen döngüsü değişti
3. sinyal değişti
4. current notification değişti
5. aksiyon gecikmiş
6. aksiyon bugün
7. aksiyon tarihi yok
8. planlı + okunmadı
9. plan bildirimi bulunamadı
10. okundu
11. risk çözüldü
12. vaka kapandı

Bu sıra çalışan değerlendirmesi değildir.

Yalnız müdahale gerektiren operasyon bağlamlarını öne taşır.

## Özet KPI

Üst bölüm:

- son takip planı,
- aksiyon gecikmiş,
- aksiyon bugün,
- aksiyon tarihi yok,
- aktif + okunmadı,
- okundu,
- bağlam değişti,
- çözüldü / kapandı

sayılarını gösterir.

## Owner Görünümü

Current owner bazında:

- toplam plan,
- dikkat gereken,
- aktif okunmadı,
- gecikmiş,
- bugün,
- okundu,
- bağlam değişti

sayıları gösterilir.

Bu tablo:

- çalışan puanı değildir,
- performans notu değildir,
- sıralama değildir,
- İK kararı değildir.

Yalnız mevcut takip yükünün operasyon durumudur.

## Filtreler

Yeni ekran:

- 7 / 30 / 90 / 180 / 365 gün,
- sağlık durumu,
- plan sinyali,
- current owner,
- kurum / sözleşme / owner / plan notu araması

ile filtrelenebilir.

## Salt Okunur

Sayfa:

- GET,
- SELECT,
- mevcut resolver'lar

ile çalışır.

Domain:

- INSERT,
- UPDATE,
- DELETE

içermez.

## Navigasyon

Takip Planı Sağlığı bağlantısı:

- Süper Admin menüsüne,
- Okunmamış Hedef Risk Takibi ekranına,
- Hedef Risk Bildirim Sağlığı ekranına,
- Mutabakat Günlük İş Kutusu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-followup-health-202.cjs`
- `tests/reconciliation-target-risk-followup-health-db-202.php`

MariaDB testi şunları doğrular:

1. bir vaka için yalnız son takip planının current health'e girmesini,
2. plan anındaki en son notification'ın doğru çözülmesini,
3. planlı + okunmamış durumu,
4. gecikmiş aksiyon durumunu,
5. bugün aksiyon durumunu,
6. aksiyon tarihi olmayan durumu,
7. okundu durumunu,
8. owner değişimi durumunu,
9. reopen döngüsü değişimi durumunu,
10. current signal değişimi durumunu,
11. target-risk çözülmesini,
12. kapanmış vaka durumunu,
13. plan bildirimi bulunamayan durumu,
14. exact current notification değişimini,
15. özet KPI sayılarını,
16. state filtresini,
17. current owner filtresini,
18. plan signal filtresini,
19. serbest metin aramasını,
20. current owner bazlı operasyon yükünü,
21. normal yöneticinin sağlık resolver'ına erişememesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin görünümü,
- read-only domain,
- latest-plan-per-case,
- plan-time notification çözümü,
- current owner kontrolü,
- reopen-aware cycle key,
- exact current signal,
- exact current notification id,
- gerçek recipient read state,
- mevcut current resolver reuse,
- yeni state üretmeme

ile çalışır.
