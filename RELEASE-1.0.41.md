# İlkAdım V1.0.41 — Global ve Kurum Kullanıcılarını Ayırma

Bu sürüm V1.0.40'taki karma kullanıcı ekranlarını ayrı yönetim sayfalarına böler.

## Global kullanıcılar
- `global-ogrenciler.php`: Kurumu ve öğretmeni olmayan doğrudan öğrenciler.
- `global-veliler.php`: Kurumsuz veli hesapları.
- Global öğrenci oluştururken isteğe bağlı mevcut global veli seçilebilir.
- Global veli–öğrenci eşleştirmesi ayrı formdan yapılabilir.
- Yeni global öğrenciler hiçbir `kurum_kullanicilari` kaydı almaz.
- Global öğrenciler mevcut İlkAdım sistem ders ve etkinliklerini kullanmaya devam eder.
- Global öğrenci için öğretmen eşleştirmesi eklenmedi.

## Kurum kullanıcıları
- Kuruma tıklanınca artık `kurum-detay.php` açılır.
- Kurum yöneticileri: `kurum-yoneticileri.php`
- Kurum öğretmenleri: `kurum-ogretmenleri.php`
- Kurum velileri: `kurum-velileri.php`
- Kurum öğrencileri: `kurum-ogrencileri.php`
- Her kullanıcı türünün ekleme ve listeleme ekranı ayrıdır.
- Kurum yöneticisini yalnızca Süper Admin ekleyebilir.
- Kurum yöneticisi kendi kurumuna öğretmen, veli ve öğrenci ekleyebilir.
- Eski karma `kurum-kullanicilari.php` sayfası kurum detayına yönlendirir.

## Veri yapısı
- V1.0.40'ta geçici olarak İlkAdım platform kurumuna bağlanan öğrenci, veli ve öğretmen üyelikleri kaldırılır.
- İlkAdım kurumu sistemde bizim kurumumuz olarak kalır; yöneticileri ayrıca eklenebilir.
- Global kullanıcılar kurumdan bağımsızdır.
- Mevcut kullanıcı hesapları silinmez.
- Mevcut CSS ve görseller değiştirilmedi.

## Sonraki aşama
- Kuruma özel dersler/içerikler
- Sınıflar ve gruplar
- Kurum raporları

Bu bölümler yalnızca kurum detayında "Sonra" olarak gösterilir; bu sürümde işlev eklenmedi.
