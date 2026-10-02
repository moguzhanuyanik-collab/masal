# İlkAdım 1.2.70

## Mutabakat Hedef Risk Bildirim Sağlığı & Müdahale Dashboardu

Bu sürüm 1.2.69 hedef-risk bildirimlerinin okunma ve operasyonel devam durumunu salt-okunur bir Süper Admin dashboardunda görünür hale getirir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hedef-risk-saglik.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_saglik.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-saglik.css`

## Salt Okunur Ayrım

1.2.69:

`ticari-mutabakat-hedef-risk-bildirim.php`

bildirim gönderme merkezidir.

1.2.70:

`ticari-mutabakat-hedef-risk-saglik.php`

yalnız raporlama ve müdahale görünümüdür.

Yeni dashboard:

- bildirim göndermez,
- okundu durumunu değiştirmez,
- vaka state'i değiştirmez,
- vaka notu eklemez,
- sorumlu değiştirmez,
- hedef politikası yayınlamaz.

## Okunma Takibi

Merkezi:

`kurum_duyuru_alicilari.okundu_tarihi`

alanı kullanılır.

Her 1.2.69 bildirim kaydı kendi:

- duyuru_id
- alici_kullanici_id

çiftiyle recipient snapshot'a bağlanır.

Bu sayede gönderilmiş ama okunmamış hedef-risk sinyalleri ayrı görülebilir.

## Ana KPI'lar

Seçilen zaman penceresinde:

- toplam bildirim,
- okundu,
- okunmadı,
- okunma oranı,
- güncel açık döngüde kalan bildirim,
- güncel açık + okunmadı,
- hedef dışı + güncel açık,
- ortalama okunma süresi,
- bildirim sonrası ortalama kapanma süresi

hesaplanır.

## Reopen-aware Döngü

En kritik ayrım:

Eski açık döngüde gönderilmiş bir bildirim, vaka kapatılıp yeniden açıldıktan sonra bugünkü açık vaka KPI'sına katılmaz.

Güncel döngü başlangıcı:

son `vaka_yeniden_acildi` olayı,
yoksa vaka `olusturulma_tarihi`

olarak çözülür.

Güncel döngü anahtarı:

`SHA-256(vaka_id | dongu_baslangic_tarihi)`

ile hesaplanır.

Bildirim geçmişindeki:

`dongu_anahtari`

ile güncel anahtar `hash_equals` ile karşılaştırılır.

Böylece eski reopen döngüsü tarihsel geçmiş olarak görünür fakat güncel açık müdahale sayısını şişirmez.

## Güncel Açık Vaka

Bir bildirim ancak:

- vaka halen `acik / incelemede / beklemede`,
- bildirim döngü anahtarı güncel döngü anahtarıyla aynı

ise:

`Güncel döngü hâlâ açık`

sayılır.

## Açık + Okunmadı

Güncel açık döngü bildirimi recipient tarafından henüz okunmamışsa:

`Açık + okunmadı`

KPI'sına girer.

Bu sayaç bildirim teslimi ile operasyon takibi arasındaki görünür boşluğu gösterir.

## Hedef Dışı + Açık

Güncel açık döngüde:

`esik_kodu = hedef_disinda`

olan bildirimler:

`Hedef dışı + açık`

olarak ayrı gösterilir.

Bu bir otomatik performans puanı değildir; mevcut 1.2.67 hedef politikasına göre halen açık olan vaka görünümüdür.

## Okunma Süresi

Bildirim:

`olusturulma_tarihi`

ile recipient:

`okundu_tarihi`

arasındaki dakika farkı hesaplanır.

Negatif/uyumsuz tarih snapshot'ı metrik içine alınmaz.

Dashboard seçilen dönemde geçerli okunmuş bildirimlerin ortalama okunma süresini gösterir.

## Bildirim Sonrası Kapanma Süresi

Vaka kapanmışsa ve kapanma tarihi bildirim tarihinden sonra ise:

`bildirim → vaka kapanışı`

dakika farkı hesaplanır.

Seçilen dönemde bu kapanışların ortalaması gösterilir.

Reopen edilmiş ve bugün tekrar açık olan vaka eski kapanış süresiyle güncel müdahale olarak değerlendirilmez.

## Sorumlu Bazlı Görünüm

Her notification recipient Süper Admin için:

- toplam bildirim,
- okundu,
- okunmadı,
- okunma oranı,
- güncel açık,
- güncel açık + okunmadı,
- hedef dışı + açık,
- ortalama okunma süresi

gösterilir.

Sıralama:

1. hedef dışı açık,
2. güncel açık + okunmadı,
3. güncel açık,
4. toplam bildirim

önceliğiyle yapılır.

Bu görünüm çalışan puanı veya otomatik performans kararı değildir; operasyonel iş yükü görünümüdür.

## Politika Bazlı Görünüm

Bildirim gönderiminde snapshot alınan:

`hedef_politika_id`

kullanılır.

Her politika için:

- kapsam,
- ilk müdahale hedefi,
- çevrim hedefi,
- toplam bildirim,
- %75+ bildirim,
- hedef dışı bildirim,
- güncel açık bildirim,
- okunma oranı

gösterilir.

Bugünkü current policy eski bildirimlerin politika bağlamını değiştirmez.

## Filtreler

Dashboard GET filtreleri:

- 7 / 30 / 90 / 180 / 365 gün,
- %75+ / hedef dışı,
- okundu / okunmadı,
- güncel açık,
- güncel açık + okunmadı,
- hedef dışı + açık,
- kapalı vaka,
- eski reopen döngüsü,
- sorumlu Süper Admin

seçeneklerini destekler.

Filtreler herhangi bir kayıt değiştirmez.

## Eski Döngü Geçmişi

Vaka yeniden açılmışsa önceki döngünün bildirimleri:

`Eski döngü`

etiketiyle görünür.

Bu kayıtlar silinmez.

1.2.69'un dedup ve audit geçmişi korunur.

## Navigasyon

Yeni merkez bağlantısı:

- Süper Admin ana menüsüne,
- Hedef Risk Bildirimleri merkezine,
- Hedef Risk Kuyruğu'na,
- Operasyon Hedefleri ekranına

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-health-195.cjs`
- `tests/reconciliation-target-risk-health-db-195.php`

MariaDB testi şunları doğrular:

1. recipient okundu timestamp'ının okunmasını,
2. güncel açık döngü bildirimini,
3. açık + okunmadı ayrımını,
4. hedef dışı + açık ayrımını,
5. kapanmış vaka geçmişini,
6. reopen öncesi eski bildirimin eski döngü sayılmasını,
7. reopen sonrası yeni bildirimin güncel döngü sayılmasını,
8. eski döngünün güncel açık KPI'sını şişirmemesini,
9. okunma dakika hesabını,
10. toplam bildirim sayısını,
11. okundu/okunmadı sayısını,
12. okunma oranını,
13. güncel açık sayısını,
14. güncel açık + okunmadı sayısını,
15. hedef dışı + açık sayısını,
16. eski döngü geçmişi sayısını,
17. kapanma sonrası çözüm metriklerini,
18. ortalama okunma süresini,
19. sorumlu A bildirim ve açık-vaka yükünü,
20. sorumlu B okunmamış yükünü,
21. politika bazlı dağılımı,
22. okunmamış filtresini,
23. güncel açık + okunmadı filtresini,
24. eski döngü filtresini,
25. sorumlu filtresini,
26. hedef dışı sinyal filtresini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur domain,
- POST iş akışı yok,
- merkezi recipient okundu snapshot'ı,
- reopen-aware SHA-256 döngü eşlemesi,
- tarihsel politika snapshot'ı,
- parametreli filtreler,
- eski döngü audit geçmişini koruma

ile çalışır.
