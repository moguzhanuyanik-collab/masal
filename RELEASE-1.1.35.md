# İlkAdım v1.1.35 — 4. Sınıf SQL Kaçış Kurtarması

## Neden
v1.1.34 içindeki 4. sınıf aktivasyon migrationında MariaDB tek tırnak içeren Türkçe özel ad ve ekleri SQL metin sınırı olarak yorumlayabiliyordu.

Hatalı örnekler:
- Dünya'mızın
- İslam'ı
- Muhammed'i

## Düzeltme
SQL metinleri MariaDB uyumlu çift tek tırnak kaçışıyla düzeltildi:
- Dünya''mızın
- İslam''ı
- Muhammed''i

## Kurtarma davranışı
034 migrationı hata aldığı kurulumlarda sistem_migrations tablosuna tamamlandı olarak yazılmadığı için v1.1.35 güncellemesi sırasında yeniden çalışır.
Önceki idempotent INSERT/DELETE adımları tekrar çalışmaya uygundur.
033 tamamlandıysa atlanır; 034 başarıyla tamamlandıktan sonra 035 normal sırada uygulanır.

## Etki alanı
- Yalnız 4. sınıf SQL içerik şeması ve 034 aktivasyon migrationı düzeltildi.
- Öğrenci HTML/CSS tasarımı değiştirilmedi.
- Görsel, logo, ikon ve AdımBot dosyaları değiştirilmedi.
- Updater arayüzüne dokunulmadı.
