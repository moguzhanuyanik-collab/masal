# İlkAdım 1.1.119 Recovery

Bu sürüm doğrudan 1.1.97 uygulama kod ağacı üzerine kurulmuştur.

## Ne değişti?

- 1.1.98–1.1.118 arasındaki eski güncelleme/recovery zinciri kullanılmaz.
- Güncelleyici artık commit geçmişini taramaz ve ara sürüm seçmez.
- GitHub `main` dalı önce gerçek 40 karakterlik HEAD SHA değerine çözülür.
- Paket yalnız bu immutable commit SHA üzerinden indirilir.
- 1.1.119 recovery veritabanını downgrade etmez ve migration çalıştırmaz.
- `config/local.php`, `storage`, `assets` ve `v4` korunur.
- Sonraki sürümler 1.1.119 üzerinden 1.1.120, 1.1.121... şeklinde ilerlemelidir.

## Taban

Uygulama tabanı: `be2651c5e375e3b54c0735d7283820a6ec9eb581` (1.1.97).

Updater çekirdeği, daha sonraki güvenlik kontrollerinden yalnız güncelleme altyapısı için alınmış ve 1.1.119 sade sürüm seçimiyle yeniden düzenlenmiştir.
