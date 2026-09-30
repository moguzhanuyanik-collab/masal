# İlkAdım 1.1.106

## Hedef

1.1.96 üzerinde kalan kurulumların 1.1.97'ye güvenli biçimde geçebilmesini
sağlamak ve tarihsel sürüm zincirini ara sürüm atlamadan yeniden kurmak.

## Değişiklikler

- 1.1.97 rev 2 tarihsel repair-anchor oluşturuldu.
- 1.1.97 paketine migration-history checkpoint eklendi.
- 1.1.98 -> 1.1.105 tarihsel anchor sırası repair anchor sonrasında yeniden kuruldu.
- Legacy DB repair aşamasında takılan 1.1.96 kurulumları için tek dosyalık rescue updater eklendi.
- Rescue yalnız 1.1.96 -> 1.1.97 geçişinde DB bakımını checkpoint ile sınırlar.
- 1.1.105 release-revision regresyon testi yeni sürümlerde de geçerli hale getirildi.
- Rescue PHP ve Node regresyon testleri kalite kapısına eklendi.

## Not

Canlı 1.1.96 updater normal repair-anchor ile kurulabiliyorsa rescue dosyasına
gerek yoktur. Rescue yalnız eski updater checkpoint'e ulaşmadan legacy DB
kontrolünde durduğu kurulumlar içindir.

## Doğrulama

Bu sürüm önce `update-197-rescue-106` aday dalında tam kalite kapısından geçirilir.
Ayrıca Git commit geçmişi üzerinden 1.1.96 updater'ın sıradaki hedef olarak repair
1.1.97 rev 2 commitini, 1.1.97 updater'ın ise 1.1.98'i seçtiği ayrı doğrulanır.
