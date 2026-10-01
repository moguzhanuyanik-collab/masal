# İlkAdım 1.2.28

## Kurum İçerikleri performans dashboard'u

Bu sürüm, Yönetici / Süper Admin tarafındaki Kurum İçerikleri ekranını yalnız yayın listesinden çıkarıp kurum geneli performans dashboard'una dönüştürür.

### Yeni performans filtresi

Kurum içerikleri artık mevcut Öğretmen / İçerik türü / Yayın durumu filtrelerine ek olarak şu performans durumlarıyla filtrelenebilir:

- Dikkat gerekiyor
- Bekliyor
- Tümü tamamlandı
- Hedef öğrenci yok
- Bilgi içerikleri

### Soru performansı

Soru yayınlarında:

- Hedef öğrenci
- Cevaplayan
- Doğru
- Yanlış
- Bekleyen
- Doğruluk oranı

birlikte gösterilir.

Performans durumu:

- En az bir yanlış cevap varsa Dikkat gerekiyor
- Yanlış yok ama cevap bekleyen varsa Bekliyor
- Tüm geçerli hedef öğrenciler doğru tamamladıysa Tümü tamamlandı
- Geçerli hedef kalmadıysa Hedef öğrenci yok

olarak hesaplanır.

### Ödev performansı

Ödev yayınlarında:

- Hedef öğrenci
- Tamamlayan
- Geciken
- Bekleyen
- Tamamlama oranı
- Teslim tarihi

gösterilir.

Performans durumu:

- En az bir geciken öğrenci varsa Dikkat gerekiyor
- Gecikme yok ama bekleyen öğrenci varsa Bekliyor
- Tüm geçerli hedef öğrenciler tamamladıysa Tümü tamamlandı
- Geçerli hedef kalmadıysa Hedef öğrenci yok

olarak hesaplanır.

### Dashboard özeti

Filtrelenmiş içerikler için:

- İçerik sayısı
- Aktif yayın
- Toplam hedef atama
- Dikkat gereken yayın
- Yanlış öğrenci cevabı
- Geciken öğrenci ödevi
- Soru doğruluk oranı
- Ödev tamamlama oranı

gösterilir.

### Tenant ve hedef güvenliği

Yeni src/kurum_icerik_dashboard.php domain katmanı:

- öğretmenin aktif olmasını
- öğretmenin içerik kurumunda aktif üyeliğini
- öğretmen–öğrenci ilişkisinin aynı kurumda bulunmasını
- öğrencinin aktif profilini
- öğrencinin aktif kullanıcı hesabını
- öğrencinin aynı kurumda aktif üyeliğini
- seçili öğrenci hedeflemesini

birlikte doğrular.

Pasif kullanıcılar ve başka kurum öğrencileri hedef / cevap / ödev performans sayılarına dahil edilmez.

### Salt okunur yönetici akışı

Kurum İçerikleri yine denetim amaçlı salt okunurdur. Düzenleme, kopyalama ve aktif/pasif işlemleri ilgili öğretmenin İçeriklerim ekranında kalır.

### Test

Yeni testler:

- tests/institution-content-performance-153.cjs
- tests/institution-content-performance-db-153.php

MariaDB entegrasyon testi yanlış cevap, geciken ödev, seçili hedef, hedefsiz yayın, pasif öğrenci, öğretmen filtresi, tür/yayın/performance filtreleri ve kurum izolasyonunu doğrular.
