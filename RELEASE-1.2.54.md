# İlkAdım 1.2.54

## Kurum Hesap Ekstresi Dönem Filtresi ve Güvenli CSV Dışa Aktarım

Bu sürüm 1.2.53 Kurum Ticari 360 görünümüne gerçek dönemsel hesap ekstresi ve güvenli CSV / Excel dışa aktarımı ekler.

Yeni migration yoktur.

Migration zinciri:

`083`

olarak kalır.

## Amaç

Kurum Ticari 360 şu ana kadar:

- sözleşme geçmişini,
- aktif ve iptal tahsilat audit geçmişini,
- yenileme/risk/hatırlatma bağlantılarını,
- kurum portföy özetini

gösteriyordu.

1.2.54 bunların üstüne finansal hareket ekstresi ekler.

## Ekstre Finansal Mantığı

Ekstre bakiyesini yalnız şu hareketler etkiler:

### Borç

`aktif` veya `tamamlandi` durumundaki sözleşmelerin toplam tutarı.

Sözleşme hareket tarihi:

`baslangic_tarihi`

olarak kabul edilir.

### Tahsilat

Yalnız:

`kurum_tahsilatlari.durum = aktif`

olan tahsilatlar.

İptal edilmiş tahsilat ekstre bakiyesini azaltmaz.

## Taslak ve İptal Sözleşme

Taslak veya iptal sözleşmeler:

- açılış bakiyesine,
- dönem borcuna,
- kapanış bakiyesine

girmez.

Ancak 1.2.53 sözleşme audit tablosunda görünmeye devam eder.

## İptal Tahsilat

İptal tahsilat:

- finansal hesap ekstresine kredi olarak girmez,
- running balance değiştirmez,
- 360 ekranındaki Aktif & İptal Tahsilat Geçmişi bölümünde audit kaydı olarak korunur.

## Tarih Filtresi

Ekstre için:

- başlangıç tarihi,
- bitiş tarihi

seçilebilir.

Varsayılan dönem:

`mevcut yılın 1 Ocak tarihi → bugün`

olarak açılır.

Başlangıç bitişten sonra olamaz.

Tek sorguda en fazla:

`3 yıl`

ekstre dönemi seçilebilir.

## Para Birimi Filtresi

Filtre:

- Tümü
- TRY
- USD
- EUR

seçeneklerini destekler.

TRY/USD/EUR bakiyeleri birbirine eklenmez.

## Hareket Türü Filtresi

Görüntülenen satırlar:

- Tüm hareketler
- Sözleşme borçları
- Tahsilatlar

olarak daraltılabilir.

Önemli davranış:

Hareket türü filtresi yalnız ekranda görünen satırları etkiler.

Running balance her zaman seçilen dönemdeki tüm geçerli finansal hareketlerle hesaplanır.

Örneğin sözleşme borcu satırı gizlenip yalnız tahsilatlar gösterilse bile tahsilat satırındaki bakiye gerçek finansal bakiyeyi korur.

## Açılış Bakiyesi

Açılış bakiyesi seçilen başlangıç tarihinden önceki:

- aktif/tamamlanmış sözleşme borçları
- eksi aktif tahsilatlar

olarak hesaplanır.

Her para birimi bağımsız hesaplanır.

## Dönem Özeti

Her para birimi için:

- Açılış Bakiyesi
- Dönem Sözleşme Borcu
- Dönem Tahsilatı
- Kapanış Bakiyesi

gösterilir.

Formül:

`Kapanış = Açılış + Dönem Borcu - Dönem Tahsilatı`

## Negatif Bakiye

Hesap ekstresi bakiyesi KPI ekranından farklı olarak sıfıra zorlanmaz.

Kurumun fazla ödeme / kredi bakiyesi varsa negatif bakiye finansal gerçeği göstermek için korunur.

## Hareket Satırları

Ekstre satırı:

- tarih
- hareket türü
- referans
- açıklama
- para birimi
- borç
- tahsilat
- hareket sonrası bakiye

alanlarını gösterir.

Tahsilat hareketinde ödeme yöntemi de görüntülenir.

## Sıralama

Hareketler:

1. para birimi,
2. tarih,
3. aynı tarihte önce sözleşme borcu,
4. sonra tahsilat,
5. kayıt ID

ile sıralanır.

Bu sıra running balance'ın deterministik olmasını sağlar.

## Ekran Limiti

360 ekranı dönem ekstresinde ilk:

`500`

hareketi gösterir.

Daha fazla kayıt varsa kullanıcıya tarih aralığını daraltma uyarısı gösterilir.

## CSV / Excel Dışa Aktarım

Yeni endpoint:

`kurum-ticari-ekstre-csv.php`

CSV:

- yalnız Süper Admin,
- no-store,
- nosniff,
- UTF-8 BOM,
- noktalı virgül ayraç

ile oluşturulur.

Bu biçim Türkçe Excel kurulumlarında doğrudan kullanım için uygundur.

## CSV İçeriği

CSV önce:

- kurum,
- kurum kodu,
- dönem,
- para birimi filtresi,
- hareket türü

metadata'sını içerir.

Ardından:

### Özet

- Para Birimi
- Açılış Bakiyesi
- Dönem Sözleşme Borcu
- Dönem Tahsilatı
- Kapanış Bakiyesi

### Hareketler

- Tarih
- Tür
- Referans
- Açıklama
- Para Birimi
- Borç
- Tahsilat
- Bakiye
- Sözleşme ID
- Ödeme Yöntemi

alanları gelir.

## CSV Satır Limiti

Dışa aktarım en fazla:

`10.000`

hareket üretir.

Limit aşılırsa dosyanın sonunda daha dar tarih aralığı seçilmesi gerektiğini belirten uyarı satırı bulunur.

## Excel Formula Injection Koruması

CSV hücresi aşağıdaki karakterlerle başlıyorsa:

- `=`
- `+`
- `-`
- `@`
- tab
- carriage return

hücre başına tek tırnak eklenir.

Böylece kurum adı, referans veya başka metin alanı Excel'de formül/komut olarak çalıştırılmaz.

NUL byte da CSV hücresinden temizlenir.

## Tenant / Kurum İzolasyonu

Ekstre sorgularının tamamı:

`kurum_id`

ile sınırlandırılır.

Başka kurumun:

- sözleşmesi,
- tahsilatı,
- bakiyesi

kurum ekstresine giremez.

CSV endpointi de önce kurum kaydını doğrular.

Bilinmeyen kurum:

`404`

döndürür.

Geçersiz tarih/para birimi filtresi:

`400`

döndürür.

## Salt Okunur

Ekstre domaini ve CSV endpointi:

- INSERT
- UPDATE
- DELETE

işlemi içermez.

Ekstre görüntülemek veya dışa aktarmak finansal kaydı değiştirmez.

## Yeni Testler

- `tests/institution-commercial-statement-179.cjs`
- `tests/institution-commercial-statement-db-179.php`

MariaDB testi şunları doğrular:

1. tarih filtre normalizasyonunu,
2. başlangıç > bitiş reddini,
3. 3 yıldan geniş dönem reddini,
4. desteklenmeyen para birimi reddini,
5. TRY/USD özet ayrımını,
6. TRY açılış bakiyesini,
7. dönem sözleşme borcunu,
8. dönem aktif tahsilat toplamını,
9. kapanış bakiyesini,
10. USD bağımsız bakiyesini,
11. taslak sözleşmenin ekstreden çıkmasını,
12. iptal sözleşmenin ekstreden çıkmasını,
13. iptal tahsilatın ekstreden çıkmasını,
14. başka kurum verisinin sızmamasını,
15. TRY running balance sırasını,
16. yalnız tahsilat filtresinde gizli sözleşme borcunun running balance'a dahil kalmasını,
17. para birimi filtresini,
18. CSV normal metnin değişmemesini,
19. = / + / - / @ formül başlangıçlarının nötralize edilmesini,
20. NUL byte temizliğini.

## Migration

Yeni migration yoktur.

Zincir:

`083`

olarak devam eder.
