# İlkAdım 1.2.26

## Öğretmen Soru Performansı dashboard'u

Bu sürüm, öğretmenin yayınladığı soru içeriklerini tek tek açmadan toplu performansını izleyebileceği ayrı bir **Soru Performansı** ekranı ekler.

### Yeni Soru Performansı sayfası

Yeni `ogretmen-sorulari.php` sayfası eklendi.

Öğretmen artık soru içeriklerinde:

- toplam soru,
- yayındaki soru,
- toplam hedef öğrenci,
- cevaplayan öğrenci,
- doğru,
- yanlış,
- cevap bekleyen,
- cevaplanma oranı,
- doğruluk oranı,
- dağıtılan yıldız

metriklerini birlikte görür.

### Filtreler

Dashboard şu filtreleri destekler:

- Kurum
- Yayın durumu
  - Tümü
  - Yayında
  - Pasif
- Performans durumu
  - Tümü
  - Cevap bekliyor
  - Yanlış cevap var
  - Tümü doğru
  - Hedef öğrenci yok

### Soru kartları

Her soru kartında:

- kurum,
- ders,
- konu,
- hedef öğrenci,
- cevaplayan,
- doğru,
- yanlış,
- bekleyen,
- cevaplanma oranı,
- doğruluk oranı,
- yapılandırılmış yıldız ödülü,
- dağıtılan toplam yıldız,
- aktif / pasif yayın durumu

gösterilir.

Karttan mevcut **İçerik Detayı** ekranına geçilerek öğrenciler tek tek incelenebilir.

### Performans durumları

- **Tümü doğru:** Geçerli hedef öğrencilerin tamamı soruyu doğru tamamladı.
- **Yanlış cevap var:** En az bir hedef öğrencinin son kayıtlı sonucu yanlış.
- **Cevap bekliyor:** Hedef öğrencilerden en az biri henüz cevaplamadı.
- **Hedef öğrenci yok:** Seçili hedefler artık aktif/erişilebilir değil veya soru için geçerli hedef bulunmuyor.

### Tenant / kurum izolasyonu

Yeni `src/ogretmen_soru_dashboard.php` domain katmanı:

- içeriğin öğretmene ait olmasını,
- öğretmenin aynı kurumda aktif üyeliğini,
- öğretmen–öğrenci ilişkisinin aynı kurumda bulunmasını,
- öğrencinin aynı kurumda aktif üyeliğini,
- aktif öğrenci kullanıcı hesabını,
- seçili öğrenci hedeflemesini

zorunlu tutar.

Başka kurum öğrencileri performansa karışmaz.

### Pasif öğrenci davranışı

Öğretmene eski ilişki kaydı kalsa bile kullanıcı hesabı veya kurum üyeliği pasif olan öğrenci:

- hedef sayısına,
- cevap sayısına,
- doğru/yanlış sayısına,
- yıldız toplamına

dahil edilmez.

Soru yine dashboard'da kalır ve geçerli hedefi kalmadıysa **Hedef öğrenci yok** olarak gösterilebilir.

### Öğretmen Paneli

Öğretmen Paneli'ne yeni **Soru Performansı** modül bağlantısı eklendi.

Mevcut:

- İçeriklerim
- Ödevlerim

akışları korunur.

### 1.2.25 uyumu

1.2.25 ile doğru tamamlanan soru sonucu final hale geldiği için dashboard doğruluk verisi geriye dönük olarak yanlış cevaba çevrilemez.

### Test

Yeni testler:

- `tests/teacher-question-dashboard-151.cjs`
- `tests/teacher-question-dashboard-db-151.php`

MariaDB entegrasyon testi:

1. Aynı öğretmende yanlış cevaplı, cevap bekleyen, tümü doğru ve hedefsiz sorular oluşturur.
2. Pasif öğrenci hesabını performans hesabından çıkarır.
3. Başka kurum sorusunun sızmadığını doğrular.
4. Ödev içeriğinin soru dashboard'una girmediğini doğrular.
5. Seçili hedef davranışını doğrular.
6. Doğru / yanlış / bekleyen sayılarını doğrular.
7. Cevaplanma ve doğruluk oranlarını doğrular.
8. Dağıtılan yıldız toplamını doğrular.
9. Aktif / pasif yayın filtresini doğrular.
10. Performans filtrelerini doğrular.
11. Öğretmenin kurum üyeliği pasif olunca o kurum dashboard erişiminin kapanmasını doğrular.
