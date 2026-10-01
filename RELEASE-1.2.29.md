# İlkAdım 1.2.29

## Veli Öğretmen İçerikleri performans dashboard'u

Bu sürüm, Veli → Öğretmen İçerikleri ekranını yalnız içerik listesi olmaktan çıkarıp durum filtreli bir takip dashboard'una dönüştürür.

### Yeni durum filtresi

Veli, seçili çocuk / kurum / içerik türü kapsamında yayınları şu durumlara göre filtreleyebilir:

- Dikkat gereken
- Bekleyen
- Tamamlanan
- Bilgi içerikleri

### Durum anlamları

Soru:
- Henüz cevap yok → Bekliyor
- Sonuç doğru → Tamamlandı
- Sonuç yanlış → Dikkat gerekiyor

Ödev:
- Tamamlandı → Tamamlandı
- Tamamlanmadı ve teslim tarihi geçti → Dikkat gerekiyor
- Tamamlanmadı ve teslim tarihi geçmedi → Bekliyor

Tekrar / Not / Diğer → Bilgi içeriği.

### Dashboard özeti

Seçili çocuk, kurum ve içerik türü kapsamında:

- Aktif içerik
- Dikkat gereken içerik
- Bekleyen içerik
- Yanıtlanan soru / toplam soru
- Soru doğruluk oranı
- Yanlış soru
- Tamamlanan ödev / toplam ödev
- Geciken ödev

gösterilir.

### Kart durumları

İçerik kartlarının durum rozeti artık tek bir ortak kurala göre üretilir. Böylece filtrede görülen durum ile kart üzerinde yazan durum aynı semantiği kullanır.

### Tenant güvenliği

Yeni dashboard yeni bir veli içerik sorgusu açmaz.

Kaynak veri yine mevcut vi_parent_contents() fonksiyonundan gelir ve şu kontroller korunur:

- gerçek veli_ogrenci.kurum_id ilişkisi
- aktif veli profili
- aktif öğrenci profili ve kullanıcı hesabı
- veli ve öğrencinin aynı kurumda aktif üyeliği
- öğretmenin aynı kurumda aktif üyeliği
- öğretmen–öğrenci ilişkisinin aynı kurumda bulunması
- seçili öğrenci hedeflemesi
- yalnız aktif öğretmen içerikleri

Bu nedenle başka kurum içeriği durum filtresi üzerinden görünür hale gelemez.

### Mevcut akışlar korunur

- Çocuk filtresi
- Kurum filtresi
- İçerik türü filtresi
- Çocuğumun Raporunu Aç
- Yalnız Ödevleri Aç
- Salt okunur veli davranışı

aynen korunur.

### Test

Yeni testler:

- tests/parent-content-performance-154.cjs
- tests/parent-content-performance-db-154.php

MariaDB entegrasyon testi doğru/yanlış/bekleyen soru, tamamlanan/geciken/bekleyen ödev, bilgi içeriği, başka kurum izolasyonu ve veli kurum üyeliği kapanışını doğrular.
