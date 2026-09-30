# İlkAdım 1.1.117

## Kurum eşleştirme stabilizasyonu

- Eşleştirme sekmesi kurum filtresi seçilmeden açıldığında tüm aktif kurumların eşleştirmelerini gösterecek şekilde düzeltildi.
- Veli/öğretmen eşleştirme güncellemesinde pasife alınmış eski ilişkilerin görünmez kalıp yeni ilişkiyi engellemesi önlendi.
- API tarafında MariaDB 1452 foreign-key hatası ile 1062 duplicate kayıt hatası birbirinden ayrıldı; 1452 artık yanıltıcı biçimde "e-posta/üyelik zaten kullanılıyor" olarak gösterilmiyor.
- Mevcut kurum izolasyonu korunarak silme yalnızca seçilen kurum + öğrenci kapsamındaki ilişki satırlarını hedefliyor.
- Yeni regression testi CI kalite kapısına eklendi.

## Hata analizi sonucu

MariaDB 1452, child kaydın referans verdiği parent kaydın bulunmadığını belirten foreign-key bütünlük hatasıdır. Bu nedenle uygulama katmanında duplicate kayıt mesajı göstermek yerine ayrı bir hata yolu kullanılması gerekiyor.

## Hedef

Kurum eşleştirme modülünü mevcut tenant izolasyonunu bozmadan daha görünür, tekrar eşleştirmeye dayanıklı ve hata teşhisi daha net hale getirmek.
