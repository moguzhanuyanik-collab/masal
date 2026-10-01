# İlkAdım 1.2.11

## 1.1.97 → 1.2.1 fonksiyonel yeniden kurulum

Bu sürüm, kaybolduğu bildirilen 1.1.97–1.2.1 döneminin **uygulama davranışlarını** mevcut GitHub'daki doğrulanmış 1.2.1 ağacını kaynak kabul ederek yeniden ankrajlar.

### Yeniden kurulan / korunan gerçek fonksiyonlar

- AdımBot kalıcı DB rate-limit: öğrenci, öğrenci+IP ve IP kapsamları.
- AdımBot sohbet ve ses/transkripsiyon endpointlerinin aynı kalıcı limiter altyapısını kullanması.
- Activities API'de CSRF token üretimi ve POST doğrulaması.
- State API'de CSRF doğrulaması.
- Öğrenci raporlarının öğrencinin gerçek kademe/sınıf müfredatına göre sorgulanması.
- V4 özelliklerinin öğrenci kademe/sınıf kapsamına göre sorgulanması.
- Öğretmen ve veli panellerinin kurum kapsamlı `auth_accessible_student_ids()` üzerinden öğrenci görmesi.
- Ortak `normalized_student_curriculum()` kapsam katmanı.
- Kurum bazlı veli/öğrenci ve öğretmen/öğrenci eşleştirme izolasyonu.
- Migration 064/065/066 ve bunların fail-closed doğrulama sözleşmeleri.

### Bu sürümde tespit edilen ek hata

`auth_user_institution_ids()` yalnız `kurum_kullanicilari` kaydının aktifliğini kontrol ediyor, kurumun kendisinin aktif olup olmadığını kontrol etmiyordu. Pasife alınmış bir kurumun aktif üyelik satırı kalırsa kullanıcı kurum kapsamı hâlâ dönebiliyordu.

Bu sürümde sorgu `kurumlar.aktif=1` ile tenant yaşam döngüsüne bağlandı.

### Güncelleme güvenliği

- Önceki 1.2.10 recovery/updater altyapısı korunuyor.
- Bu sürüm production veritabanına doğrudan müdahale etmez.
- Yeni fonksiyonel rebuild regression testi CI kalite kapısına bağlanır.
- Bilinmeyen/kanıtlanmamış özellikler bu rebuild'e eklenmedi.
