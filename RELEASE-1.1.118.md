# İlkAdım 1.1.118

## Güncelleme bootstrap kurtarma ve çekirdek sürekliliği

- 1.1.99 rev1001'deki kritik bootstrap hatası belgelendi: recovery kısayolu GitHub dal adını (`main`) commit gibi döndürdüğü için kurulum 40 karakterlik SHA doğrulamasında paket indirilmeden durabiliyordu.
- 1.1.100 rev2 için kontrollü bir recovery anchor sözleşmesi eklendi. Bu anchor, 1.1.99 rev1001 kurulumunu sabit commit SHA üzerinden modern updater çekirdeğine taşımak için kullanılır.
- Recovery anchor kurulduktan sonra yönetilen köprü metadata dosyası doğrulanmış 1.1.118 commitine doğrudan geçiş yaptırır; ara sürümlerde eski updater çekirdeğine geri düşülmez.
- Updater çekirdeğine generation kimliği eklendi. Canlıdaki çekirdek staging paketindekinden daha yeniyse tarihsel paket kurulumu sırasında daha yeni çekirdek staging alanına korunur.
- Köprü metadata hedef commit, hedef sürüm ve release revision değerlerini immutable GitHub commit metadata'sı ile doğrular; uyuşmazlıkta fail-closed durur.
- Güncelleme ekranında "GitHub sürümü" yerine "Sıradaki sürüm", "Commit" yerine "Hedef commit" gösterilir; teşhis mesajları bootstrap hatalarını gizlemez.
- Regression testleri updater generation korumasını, recovery bridge sözleşmesini ve release metadata bütünlüğünü doğrular.

## Amaç

Canlı dosya yüklemeden, özellikle 1.1.99 rev1001'de kilitlenmiş kurulumların GitHub commit geçmişi üzerinden güvenli bir SHA hedefi bulmasını ve ardından tek bir doğrulanmış final sürüme geçmesini sağlamak.
