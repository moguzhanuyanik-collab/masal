# İlkAdım 1.1.108

## Hedef

Eski updater çekirdeğinin hedef paketteki düzeltmeye ulaşamadan DB/migration
aşamasında hata vermesiyle oluşan güncelleme kilitlenmesini kalıcı olarak
önlemek.

## Değişiklikler

- Hedef paketteki `src/updater.php` canlı çekirdekten farklıysa DB aşamasına
  girmeden önce yalnız updater çekirdeği SHA-256 doğrulamasıyla yedeklenip atomik
  olarak etkinleştirilir.
- İlk HTTP isteği temiz biçimde `retry_required` döndürür.
- Güncelleme ekranı ikinci isteği otomatik yapar; kullanıcı ikinci kez butona
  basmak zorunda kalmaz.
- İlk istekte alınan tam uygulama yedeği handoff marker üzerinden ikinci istekte
  tekrar kullanılır; orijinal pre-update yedek ezilmez.
- Updater çekirdeğinin ayrıca ayrı yedeği tutulur.
- Tam sürüm başarıyla kurulduğunda handoff marker temizlenir.
- Handoff, paket sürüm/revision ve exact managed-tree doğrulamasından sonra,
  DB migration/legacy repair değerlendirmesinden önce çalışır.
- PHP davranış ve Node kaynak/regresyon testleri kalite kapısına eklendi.

## Eski 1.1.96 kurulumu

Bu altyapı 1.1.108 ve sonrasında aynı hata sınıfını engeller. Halen 1.1.96
üzerinde çalışan canlı updater bu kodu henüz yüklememiş olduğundan, o mevcut
kurulumun dosya sistemine erişim olmadan repository tarafından uzaktan
değiştirilmesi mümkün değildir.
