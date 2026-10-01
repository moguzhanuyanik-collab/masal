# İlkAdım 1.2.27

## Öğrenci Öğretmenim içerik takip dashboard'u

Bu sürüm, Öğrenci → Öğretmenim ekranını yalnız öğretmen/konu bazlı içerik listesinden çıkarıp filtrelenebilir performans takip ekranına dönüştürür.

### Yeni filtreler

Öğrenci artık öğretmen içeriklerini:

- Kurum
- İçerik türü: Soru, Tekrar, Ödev, Not, Diğer
- Durum: Dikkat gereken, Bekleyen, Tamamlanan, Bilgi içerikleri

ile filtreleyebilir.

Kurum seçenekleri yalnız öğrencinin mevcut oi_student_contents() erişiminden gelen aktif içeriklerden üretilir.

URL üzerinden erişilemeyen bir kurum_id verilirse istek 403 ile reddedilir.

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

Seçili kurum kapsamında:
- Aktif içerik
- Yanıtlanan soru / toplam soru
- Soru doğruluk oranı
- Tamamlanan ödev / toplam ödev
- Geciken ödev
- Dikkat gereken toplam içerik

gösterilir.

Dikkat gereken toplam, yanlış cevaplanan sorular ile geciken ödevleri birlikte hesaplar.

### İçerik kartları

Her içerik kartında mevcut tür ve yıldız rozetlerine ek olarak durum rozeti gösterilir.

Mevcut soru cevaplama, doğru cevap kilidi ve yıldız ödülü davranışları korunur.

### Filtre sürekliliği

Öğrenci filtreli görünümde bir soruya cevap verdiğinde POST işlemi aktif filtre query'sini korur. Böylece kullanıcı filtreli dashboard bağlamından çıkmaz.

### Öğretmen grupları

Filtre aktifken sonucu kalmayan öğretmenler boş grup olarak gösterilmez. Filtre sonucu tamamen boşsa tek bir açıklayıcı boş durum gösterilir. Filtre yokken mevcut öğretmen gruplama davranışı korunur.

### Tenant güvenliği

Yeni dashboard yeni bir öğrenci içerik sorgusu açmaz. Kaynak veri yine mevcut oi_student_contents() fonksiyonundan gelir ve aktif öğrenci hesabı, aktif kurum üyeliği, aktif öğretmen üyeliği, öğretmen–öğrenci kurum ilişkisi, seçili öğrenci hedeflemesi ve içerik aktifliği kurallarını korur.

### Yeni domain

Yeni src/ogrenci_ogretmenim_dashboard.php erişilebilir kurum listesini çıkarır, soru/ödev/bilgi durumunu normalize eder, kurum+tür+durum filtresini uygular ve performans özetlerini üretir.

### Test

Yeni testler:
- tests/student-teacher-content-dashboard-152.cjs
- tests/student-teacher-content-dashboard-db-152.php

MariaDB entegrasyon testi iki kurumlu öğrenci erişimini, seçili hedef izolasyonunu, pasif içerik dışlamasını, kurum/tür/durum filtrelerini, soru doğruluk oranını, ödev tamamlama oranını ve üyelik pasifleşince kurumun dashboard'dan kalkmasını doğrular.
