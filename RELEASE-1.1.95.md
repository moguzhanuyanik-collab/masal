# İlkAdım 1.1.95

Taban: 1.1.94 / 8deb20b6bff66d31236e7da98f36bd927c37bdbc.

## Hedef

Mobil/PWA tarafındaki eski cache, çevrimdışı asset eşleşmesi ve öğrenci gizliliği sorunlarını kökten azaltmak.

## Düzeltilenler

1. Service Worker cache nesli 1.1.95'e yükseltildi.
2. Offline çekirdek asset'leri artık query-string içermeyen canonical URL'lerle cache'lenir.
3. Cache eşleşmesi `ignoreSearch:true` kullanır; HTML ile worker üzerindeki farklı `?v=` değerleri çevrimdışı yüklemeyi bozmaz.
4. `offline-v4.html` içindeki CSS/JS sürümleri 1.1.95 ile eşitlendi.
5. Ana öğrenci sayfasında izlenen statik asset'ler sabit elle yazılmış sürüm yerine SHA-256 içerik hash'iyle cache-bust edilir.
6. Bu içerik hash yaklaşımı canlıda bulunan ancak GitHub'da izlenmeyen `styles.css` ve `app-runtime.js` için de güvenli fallback ile çalışır.
7. `api/bootstrap.js.php` artık DB exception ayrıntısını tarayıcıya `ILKADIM_DB_ERROR` içinde sızdırmaz; ayrıntı sunucu loguna gider.
8. Çıkış öncesi çevrimdışı kayıt uyarısı gerçek `logout.php` davranışıyla uyumlu hale getirildi: logout offline paket/IndexedDB/cache'i temizler.
9. Aktif öğrenci işareti çıkış yönlendirmesinden önce de temizlenir.
10. Çevrimdışı öğrenme günleri UTC değil cihazın yerel takvim tarihiyle kaydedilir.
11. PWA regresyon testi eklendi.
12. CI'ya tüm JS/CJS dosyaları için `node --check` sözdizimi kapısı eklendi.

## Bilinen kalan altyapı konusu

Updater eski, yeni pakette artık bulunmayan dosyaları otomatik silmez. Repo hâlâ `src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql`, `database/seed.sql` dosyalarını içermediği için kör stale-file silme özelliği eklemek güvenli değildir; bu dosyalar gerçek kaynaktan repoya alınmadan silme senkronizasyonu açılmamalıdır.
