# İlkAdım 1.0.65 — Tek Aktif Süper Admin

- GitHub güncellemesi sırasında çalışan yeni `024_tek_aktif_super_admin.sql` migration'ı eklendi.
- Mevcut öğrenci, veli, öğretmen ve diğer kullanıcı hesapları güvenli silme kuralına uygun biçimde pasife alınır.
- Kurum kullanıcı bağlantıları pasife alınır ve öğretmen içerikleri kapatılır.
- Mevcut kullanıcı ve öğrenci oturum tokenlarının süresi hemen doldurularak eski oturumlar geçersiz hale getirilir.
- Güncelleme sonunda aktif tek kullanıcı olarak Süper Admin hesabı bırakılır.
- Süper Admin e-postası: `m.oguzhanuyanik@gmail.com`
- Kurumlar ve sistem içerikleri korunur.
- Öğrenci tarafındaki HTML/CSS/JavaScript dosyaları değiştirilmedi.

Bu migration tek sefer çalışır; `sistem_migrations` kaydı nedeniyle sonraki güncellemelerde tekrar uygulanmaz.
