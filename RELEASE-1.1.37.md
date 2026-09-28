# İlkAdım v1.1.37

## Sıralı güncelleme zinciri

Güncelleme motoru artık GitHub'daki en son sürüme doğrudan atlamaz.

### Yeni davranış

- Kurulu sürüm GitHub'daki version.json değişiklik geçmişiyle karşılaştırılır.
- Kurulu sürümden büyük sürümler arasındaki en küçük sürüm seçilir.
- Güncelleme ZIP paketi main dalından değil, seçilen sürümün kendi commit SHA'sından indirilir.
- Paket açıldıktan sonra version.json hedef sürümle doğrulanır.
- Paket sürümü ile beklenen sürüm uyuşmazsa canlı dosyalar değiştirilmeden kurulum durdurulur.

### Örnek

Kurulu sürüm: 1.1.40

GitHub'da:
- 1.1.41
- 1.1.42
- 1.1.43

Sistem önce 1.1.41'i kurar. Sonraki kontrolde 1.1.42, ardından 1.1.43 sunulur.

### Tasarım güvenliği

- Güncelleme ekranının HTML/CSS görünümü değiştirilmedi.
- Öğrenci arayüzü değiştirilmedi.
- Logo, ikon, görseller ve AdımBot değiştirilmedi.
- Değişiklik yalnız güncelleme seçimi ve paket indirme/ doğrulama mantığındadır.

Taban sürüm: v1.1.36
