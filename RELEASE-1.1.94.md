# İlkAdım 1.1.94

Taban: 1.1.93 / 246b57265ad98c3a41a69be3c2a893b3c808f751.

## Hedef

Bu sürüm kurulum, güncelleme, hata gizliliği ve runtime storage güvenliğini sertleştirir.

## Düzeltilenler

1. Installer artık `database/schema.sql` ve `database/seed.sql` dosyalarını kurulum başlamadan doğrular.
2. Eksik kurulum paketinde `config/local.php` yazılmaz; sistem yarım yapılandırma bırakmaz.
3. `config/local.php` yalnız DB şema/seed kurulumu tamamlandıktan sonra geçici dosya + rename ile atomik yazılır.
4. Installer DB hata ayrıntılarını kullanıcıya göstermeden sunucu loguna kaydeder.
5. GitHub owner/repo/branch girdileri installer tarafında doğrulanır.
6. `storage/` için Apache üzerinde doğrudan HTTP erişimini engelleyen runtime `.htaccess` koruması üretildi; boş `index.html` de oluşturulur.
7. Güncelleme sırasında runtime storage koruması zorunlu hale getirildi.
8. Güncelleme merkezi beklenmeyen exception ayrıntılarını kullanıcıya döndürmez; yalnız izin verilen güvenli hata mesajları gösterilir.
9. Güncelleme geçmişinde ham exception mesajı saklanmaz; ayrıntı sunucu loguna yazılır.
10. Güncelleme ekranındaki yedek/CSS açıklaması gerçek davranışla uyumlu hale getirildi.
11. `api/activities.php`, `api/state.php` ve `api/kurumlar-modulu.php` ham teknik hata ayrıntılarını response içine koymaz.
12. Login, global öğrenci/veli/eşleştirme, öğretmen içerikleri, öğrenci Öğretmenim ekranı, rol/yetki ve profil sayfalarında beklenmeyen teknik exceptionlar kullanıcıya sızdırılmaz.
13. İş kuralı/validation için kontrollü `RuntimeException` mesajları korunur; beklenmeyen hatalar generic mesaj + server log şeklinde ele alınır.
14. 1.1.94 regresyon testi CI kalite kapısına eklendi.

## Operasyon notu

1.1.93 kurulurken oluşturulmuş eski `storage/backups/onceki_surum.zip` dosyası 1.1.94 kurulumu sırasında 1.1.93 updater tarafından yeniden ve secrets hariç biçimde oluşturulur; böylece eski hassas ZIP yedeği üzerine yazılır.

Apache dışındaki sunucularda (ör. Nginx) `.htaccess` uygulanmaz. Bu ortamlarda `/storage/` erişim engeli web sunucusu yapılandırmasında ayrıca tanımlanmalıdır.

## Bilinen kalan konu

GitHub deposunda `src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql` ve `database/seed.sql` hâlâ izlenmiyor. Installer artık bunu güvenli biçimde tespit edip durur; ancak temiz kurulum için gerçek dosyaların kaynağı yine tamamlanmalıdır.
