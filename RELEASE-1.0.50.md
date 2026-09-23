# İlkAdım V1.0.50 — Kurum Eşleştirme Modülü

- Kurumlar Modülü iç menüsüne **Eşleştirme** sekmesi eklendi.
- Eşleştirme tablosunda her öğrenci için:
  - Kurum
  - Öğrenci
  - Veli(ler)
  - Öğretmen(ler)
  görüntülenir.
- Yeni Eşleştirme ve Güncelle işlemleri modal üzerinden yapılır.
- Kurum seçildiğinde modalda yalnızca o kuruma ait aktif öğrenci, veli ve öğretmenler listelenir.
- Bir öğrenci birden fazla veliye bağlanabilir.
- Bir öğrenci birden fazla öğretmene bağlanabilir.
- Kaydetme AJAX ile yapılır; sayfa yenilenmez.
- Bağlantıları Sil işlemi öğrencinin o kurum kapsamındaki veli ve öğretmen eşleştirmelerini kaldırır.
- Eşleştirme işlemleri mevcut `veli_ogrenci` ve `ogretmen_ogrenci` tablolarını kullanır.
- Başka kuruma ait veli veya öğretmenin seçilmesi sunucu tarafında da engellenir.
- Öğrenci de seçilen kurumun aktif öğrencisi olmak zorundadır.
- Tüm işlemler Süper Admin yetkisi ve CSRF doğrulaması ile korunur.
- Mevcut CSS dosyaları değiştirilmedi; yalnızca kurumlar modülünün ayrı CSS/JS dosyaları güncellendi.
