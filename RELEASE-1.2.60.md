# İlkAdım 1.2.60

## Mutabakat Aksiyon Sağlığı & Yaşlandırma Dashboardu

Bu sürüm 1.2.59 Ticari Mutabakat Aksiyon Merkezi'ndeki açık vakaları yeni finansal veri üretmeden operasyon sağlığı açısından analiz eder.

Yeni migration yoktur.

Migration zinciri:

`086`

olarak kalır.

## Amaç

1.2.59 ile mutabakat sorunları:

- tekil vaka,
- sorumlu,
- aşama,
- takip notu,
- sonraki aksiyon tarihi,
- otomatik kapanma,
- yeniden açılma

ile yönetilebilir hale geldi.

1.2.60 şu yönetim sorularını cevaplar:

- kaç açık vaka var,
- vaka kaç gündür mevcut açık döngüde,
- hangi aksiyon tarihi geçti,
- hangi aksiyon bugün,
- hangi vaka sahipsiz,
- hangi vakada sonraki aksiyon tarihi yok,
- hangi vaka açıldığı/reopen olduğu halde hiç müdahale görmedi,
- hangi sorumluda ne kadar açık iş var,
- hangi vaka 8+ gündür açık,
- son 30 günde kapanan vakaların ortalama açık döngüsü ne kadar sürdü.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-saglik.php`

Yeni domain:

`src/ticari_mutabakat_saglik.php`

Yeni stil:

`ticari-mutabakat-saglik.css`

## Salt Okunur Tasarım

Sağlık domaini:

- INSERT
- UPDATE
- DELETE

işlemi içermez.

Sayfada POST akışı yoktur.

Sağlık ekranını görüntülemek:

- vaka senkronize etmez,
- vaka aşamasını değiştirmez,
- sorumlu değiştirmez,
- takip tarihi değiştirmez,
- sözleşme değiştirmez,
- belge değiştirmez,
- tahsilat değiştirmez,
- eşleme değiştirmez.

Operasyonel değişiklikler 1.2.59:

`Mutabakat Aksiyon Merkezi`

üzerinden yapılır.

## SLA Kararı Üretmez

1.2.60 keyfi SLA puanı veya otomatik iyi/kötü kararı üretmez.

Sistem yalnız objektif alanları gösterir:

- açık gün,
- sorun türü,
- aşama,
- sorumlu,
- sonraki aksiyon tarihi,
- ilk müdahale var/yok,
- son operasyon tarihi,
- yeniden açılma döngüsü.

Bu nedenle kurumun kendi iş süreçlerinde tanımlanmamış 24 saat / 3 gün / 7 gün gibi yapay SLA hedefleri yazılıma gömülmez.

## Mevcut Açık Döngü

Vaka yaşı doğrudan her zaman:

`ticari_mutabakat_vakalari.olusturulma_tarihi`

alanından hesaplanmaz.

Eğer vaka daha önce kapanmış ve tekrar açılmışsa mevcut açık döngü başlangıcı:

`vaka_yeniden_acildi`

geçmiş kayıtlarının en son tarihidir.

Fallback:

`vaka ilk oluşturulma tarihi`

dir.

Örnek:

- vaka 100 gün önce açıldı,
- sorun çözüldü ve vaka kapandı,
- dün aynı kaynak sorun tekrar oluştu,
- aynı stabil vaka yeniden açıldı.

Sağlık ekranı bu vakayı:

`1 günlük açık döngü`

olarak gösterir.

100 günlük açık vaka gibi yanlış yaşlandırmaz.

## Yaşlandırma Grupları

Açık vakalar:

- 0–1 gün
- 2–3 gün
- 4–7 gün
- 8+ gün

olarak ayrılır.

Bu gruplar SLA değildir.

Yalnız açık vaka yaşını operasyonel olarak görünür kılar.

## Aksiyon Gecikti

Açık vaka için:

`sonraki_aksiyon_tarihi < bugün`

ise:

`Aksiyon gecikti`

olarak gösterilir.

## Aksiyon Bugün

`sonraki_aksiyon_tarihi = bugün`

ayrı sayaç ve filtre olarak gösterilir.

Bu iki durum birbirine karıştırılmaz.

## Sahipsiz Vaka

Açık vakada:

- sorumlu NULL,
- veya 0

ise:

`Sahipsiz`

olarak gösterilir.

## Aksiyon Tarihi Yok

Açık vaka için:

`sonraki_aksiyon_tarihi IS NULL`

durumu ayrı takip edilir.

Sahipsiz vaka ile aksiyon tarihi olmayan vaka farklı kavramlardır ve ayrı sayaçlarda tutulur.

## İlk Müdahale

Mevcut açık döngü başladıktan sonra append-only vaka geçmişinde:

- `takip_notu`
- veya `asama_*`

olayı varsa vaka müdahale görmüş kabul edilir.

Önceki kapanmış döngüdeki eski not veya aşama değişikliği yeni reopen döngüsünün ilk müdahalesi sayılmaz.

Bu nedenle:

- eski döngü notları audit olarak korunur,
- yeni döngünün operasyon sağlığını yanlış iyileştirmez.

## Dış Aksiyon Bekleniyor

1.2.59:

`beklemede`

aşaması sağlık ekranında ayrı filtre ve sayaçtır.

Bu kayıtlar açık vaka olmaya devam eder.

Sistem beklemede olduğu için vakayı otomatik çözülmüş saymaz.

## Sorumlu İş Yükü

Sağlık ekranı her sorumlu için:

- açık vaka,
- veri bütünlüğü vakası,
- gecikmiş aksiyon,
- aksiyon tarihi olmayan vaka,
- 8+ gün açık vaka,
- dış aksiyon bekleyen vaka

sayısını gösterir.

`Atanmamış`

vakalar da ayrı iş yükü satırı olarak görünür.

Sorumlu satırına tıklanınca sağlık kuyruğu ilgili kullanıcıya filtrelenir.

## Son 30 Gün Kapanış Görünümü

Son 30 günde kapanan vakalar için:

- kapanan vaka sayısı,
- ortalama açık döngü günü,
- en uzun açık döngü günü,
- yeniden açılıp sonra kapanan vaka sayısı

gösterilir.

Yeniden açılmış kapalı vakada süre yine:

`son yeniden açılma → kapanma`

döngüsünden hesaplanır.

İlk vaka oluşturma tarihinden bugüne kadar geçen toplam tarih kullanılmaz.

## Sağlık Kuyruğu

Açık vaka kuyruğu destekler:

- kurum/sözleşme/teşhis araması,
- veri bütünlüğü / operasyon açığı filtresi,
- 0–1 / 2–3 / 4–7 / 8+ gün filtresi,
- aksiyon gecikti,
- aksiyon bugün,
- sahipsiz,
- aksiyon tarihi yok,
- ilk müdahale yok,
- dış aksiyon bekliyor,
- sorumlu kullanıcı filtresi.

## SQL Öncesi Filtreleme

Filtreler PHP tarafında ilk N satır alındıktan sonra uygulanmaz.

Koşullar SQL:

`WHERE`

bölümüne eklenir ve daha sonra:

`LIMIT`

uygulanır.

Bu nedenle büyük vaka havuzunda aranan 8+ gün veya sahipsiz vaka ilk 900 kaydın dışında kaldığı için kaybolmaz.

## Kuyruk Sıralaması

Sağlık kuyruğu öncelikle:

1. aksiyon tarihi geçmiş,
2. aksiyon bugün,
3. sahipsiz,
4. veri bütünlüğü,
5. daha uzun açık döngü,
6. son güncellenen

yaklaşımıyla sıralanır.

Bu bir risk skoru değildir.

Sadece operasyonel görünürlük sırasıdır.

## Ticari Dashboard Entegrasyonu

Ticari Yönetim Dashboardu üç yeni operasyon sayacı alır:

- Açık mutabakat vakası
- Gecikmiş mutabakat aksiyonu
- Sahipsiz mutabakat vakası

Sayaçlar doğrudan sağlık özetinden okunur.

Dashboard salt-okunur kalır.

## Menü Entegrasyonu

`Mutabakat Aksiyon Sağlığı` bağlantısı:

- Süper Admin ana menüsüne,
- Ticari Yönetim Dashboardu'na,
- Ticari Mutabakat & Kontrol'e,
- Mutabakat Aksiyon Merkezi'ne

eklendi.

## Yeni Testler

- `tests/reconciliation-health-185.cjs`
- `tests/reconciliation-health-db-185.php`

MariaDB testi şunları doğrular:

1. 0–1 gün yaş grubunu,
2. 2–3 gün yaş grubunu,
3. 4–7 gün yaş grubunu,
4. 8+ gün yaş grubunu,
5. açık vaka sayısını,
6. veri bütünlüğü / operasyon ayrımını,
7. gecikmiş aksiyon sayısını,
8. bugün aksiyon sayısını,
9. sahipsiz vaka sayısını,
10. aksiyon tarihi olmayan vaka sayısını,
11. mevcut döngüde ilk müdahale olmayan vakaları,
12. dış aksiyon bekleyen vaka sayısını,
13. 100 gün önce oluşturulup dün yeniden açılan vakanın 1 günlük sayılmasını,
14. reopen öncesi eski notun yeni döngü müdahalesi sayılmamasını,
15. mevcut döngü aşama/notunun müdahale sayılmasını,
16. 8+ gün SQL filtresini,
17. gecikmiş aksiyon SQL filtresini,
18. sahipsiz SQL filtresini,
19. ilk müdahale yok SQL filtresini,
20. sorumlu kullanıcı filtresini,
21. Atanmamış filtresini,
22. kurum arama filtresini,
23. sorumlu bazlı açık iş yükünü,
24. son 30 gün kapanan vaka sayısını,
25. kapanış ortalama döngü süresini,
26. yeniden açılmış kapalı vaka metriklerini,
27. sağlık sorgularının vaka tablosunu değiştirmemesini,
28. sağlık sorgularının append-only geçmişi değiştirmemesini.

## Migration

Yeni migration yoktur.

Migration zinciri:

`086`

olarak devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur domain,
- POST/write akışı olmaması,
- SQL seviyesinde filtreleme,
- yeniden açılma döngüsünün append-only geçmişten türetilmesi,
- kaynak finansal tablolara dokunmama

ile çalışır.
