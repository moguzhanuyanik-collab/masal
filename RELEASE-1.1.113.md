# İlkAdım 1.1.113

## 1.1.97 -> 1.1.98 kurulum kilidi

- Tek dosyalık tarayıcı rescue köprüsü eklendi: `rescue-1.1.97-to-1.1.98.php`.
- Yalnız giriş yapmış Süper Admin kullanabilir; POST + CSRF zorunludur.
- Kurulu sürüm tam olarak 1.1.97 değilse hiçbir dosya değiştirilmez.
- Veritabanına ve kullanıcı/kurum verilerine dokunmaz; yalnız `src/updater.php` yedeklenip rescue updater ile değiştirilir.
- Updater yedeği ve yeni payload SHA-256 ile doğrulanır.
- Etkinleştirme başarısızsa eski updater atomik restore ile geri yüklenir.
- Canonical rescue dosyası sunucuda mevcutsa gömülü payload ayrıca onun SHA-256 değeriyle çapraz doğrulanır.
- İşlem kanıtı storage/updates altında yazılır.

## Yeni 500 madde

- Q1001–Q1500 arasında 500 yeni kalite/güncelleme maddesi eklendi.
- Önceki Q001–Q1000 korunur; toplam katalog 1500 maddedir.
- 14 yeni kritik madde bu sürümde uygulandı, 486 madde plan statüsündedir.

## Rev 2

- Web rescue regresyon testindeki PHP string interpolation kaynaklı syntax hatası giderildi.
- Test artık kritik rescue sözleşmelerini interpolation olmadan kaynak metninden doğrular.

## Rev 3

- 1.1.112 continuity testi sonraki sürümlerde kırılmayacak minimum sürüm sözleşmesine geçirildi.
- Q1001–Q1500 katalog dosyası tarihsel 1.1.113 rev1 artefaktı olarak sabitlendi.
- quality-index.json güncel 1.1.113 rev3 kimliğine taşındı.
- 1.1.113 web-rescue Node testi sonraki sürümler için minimum sürüm sözleşmesine geçirildi.

## Rev 4

- Q001–Q1000 tarihsel kalite testi, toplam katalog büyüdüğünde yanlış negatif üretmeyecek şekilde genişletildi.
- İlk iki katalog ve Q001–Q1000 sürekliliği zorunlu kalırken global quality-index değerlerinin büyümesine izin verildi.
- quality-index güncel 1.1.113 rev4 kimliğine hizalandı.
