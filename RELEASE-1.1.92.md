# İlkAdım 1.1.92

Taban: 1.1.91 / eeef134fa6699a248df6cec50a77aca04bb391e6.

## Düzeltilenler

1. Giriş ekranına kalıcı veritabanı tabanlı başarısız deneme koruması eklendi.
2. Aynı hesap için 15 dakikalık pencerede 5 hatalı denemeden sonra 10 dakika engel uygulanır.
3. Ortak okul/kurum ağlarını yanlış kilitlememek için IP sınırı 30 başarısız deneme ve 15 dakika engel olarak ayrıldı.
4. IP bilgisi yoksa ortak boş-IP sayacı oluşturulmuyor.
5. Başarılı girişte yalnız ilgili hesap sayacı temizleniyor; ağ saldırı sayacı korunuyor.
6. Eski öğrenci hesabı uyumluluk yolunda doğru şifrenin ikinci kez yanlış biçimde doğrulanması düzeltildi.
7. Groq HTTP yanıtındaki Retry-After başlığı okunuyor.
8. OpenAI/Gemini sohbet isteklerinde Retry-After başlığı korunuyor.
9. Provider kota hatasında gerçek bekleme süresi HTTP başlığı ve JSON retry_after alanıyla istemciye aktarılıyor.
10. Gömülü provider hata yanıtlarında da Retry-After korunuyor.
11. Ses transkripsiyonu sağlayıcısının Retry-After başlığı da istemciye aktarılıyor.
12. Güncelleme sistemi aynı anda ikinci kurulumun başlamasını non-blocking dosya kilidiyle engelliyor.
13. Güncelleme kilidi başarı ve hata yollarında serbest bırakılıyor.
14. Giriş güvenliği için 063_login_rate_limit.sql migration'ı eklendi.

## Bilinen kalan altyapı konusu

Canlı MySQL veritabanının tam yedeğini uygulama kodu içinde körlemesine dışa aktaran bir yöntem eklenmedi. Sunucuya özgü güvenli DB snapshot/backup yöntemi doğrulanmadan otomatik tam rollback uygulanmamalı.

GitHub deposunda hiç izlenmemiş olan src/bootstrap.php, styles.css, app-runtime.js, database/schema.sql ve database/seed.sql dosyaları da tahmin edilerek oluşturulmadı. Temiz kurulum için bu gerçek çalışma dosyalarının kaynağı ayrıca tamamlanmalı.
