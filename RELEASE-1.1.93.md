# İlkAdım 1.1.93

Taban: 1.1.92 / e4a68f0319e2ab1128423313652a7faf06534b25.

## Ana hedef

Bu sürüm yeni özellik eklemek yerine güncelleme/migration zincirindeki veri kaybı risklerini kapatır ve giriş güvenliğini eşzamanlı istekler açısından sağlamlaştırır.

## Düzeltilenler

1. Dolu eski `kurum_kullanicilari` tablosu artık otomatik olarak DROP edilmez.
2. Eski kurum tablosu veri içeriyorsa güncelleme güvenli biçimde durur ve kontrollü veri dönüşümü ister.
3. Yalnızca boş legacy kurum tablosunda otomatik yeniden oluşturma yapılabilir.
4. Geçmişte veri silen/sıfırlayan 000, 007, 024, 025, 026, 027, 028 ve 032 migrationları otomatik zincirden çıkarıldı.
5. Aynı tarihsel migration dosyaları manuel çalıştırmada da veri değiştirmeyen no-op haline getirildi.
6. Otomatik migrationlar için yüksek riskli SQL güvenlik kapısı eklendi: DROP TABLE, TRUNCATE TABLE, koşulsuz DELETE ve tüm kayıtları pasife alan kalıplar kurulumdan önce engellenir.
7. Güncelleme ZIP yedeği artık `config/local.php`, `.env` ve `storage/` altındaki canlı sırları/verileri içine almaz.
8. Güncelleme `preserve` listesinden kod niteliğindeki `styles.css`, `app-style.css` ve `features-style.css` çıkarıldı; repoya eklendiklerinde gerçek güncellemeler canlıya geçebilir.
9. `assets` ve `v4` repoda bulunmayan canlı/legacy varlıklar olabileceği için korunmaya devam eder.
10. Login rate-limit ilk sayaç satırında oluşan eşzamanlı yarış `INSERT IGNORE + SELECT ... FOR UPDATE` ile kapatıldı.
11. Hesap kilitleme saldırısını azaltmak için üç katmanlı limit uygulanır: hesap+IP 5/10 dk, hesap geneli 20/10 dk, IP geneli 30/15 dk.
12. Başarılı giriş yalnız hesap ve o hesap+IP sayacını temizler; IP saldırı sayacı korunur.
13. Rate-limit DB hataları hassas ayrıntı yazmadan sunucu güvenlik loguna kod olarak işaretlenir.
14. 1.1.92'de `api/adimbot-transcribe.php` içine giren hatalı PHP dizi/parantez kapanışı düzeltildi; ses transkripsiyon endpoint'i yeniden parse edilebilir.
15. GitHub Actions kalite kapısı eklendi: tüm PHP dosyaları `php -l` ile, 1.1.92 ve 1.1.93 güvenlik regresyonları Node ile kontrol edilir.
16. Eski 1.1.92 kaynak testi, yeni ve daha güçlü login limit politikasını yanlış negatif vermeden doğrulayacak şekilde güncellendi.

## Doğrulama

- GitHub Actions Quality Gate üzerinde PHP syntax kontrolü geçti.
- `tests/security-92.cjs` geçti.
- `tests/migration-safety-93.cjs` geçti.
- 61 migration dosyası yıkıcı SQL kalıpları açısından tarandı; tespit edilen 007 ve 032 de emekliye ayrıldı.

## Bilinen kalan konu

GitHub deposunda `src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql` ve `database/seed.sql` hâlâ izlenmiyor. Bunların gerçek canlı kopyaları görülmeden tahmin edilerek oluşturulmadı. Bu nedenle depo hâlâ tek başına sıfırdan kurulum kaynağı olarak kabul edilmemelidir.

Tam MySQL snapshot/restore mekanizması da sunucu altyapısı doğrulanmadan uygulama koduna eklenmedi. Bunun yerine otomatik yıkıcı migrationlar fail-closed biçimde engellendi.
