-- İlkAdım 1.1.93
-- RETIRED: Geçmişte legacy FK temizliği sırasında kullanıcı ve profil
-- kayıtlarını fiziksel olarak silebilen migration.
-- Veri kaybını önlemek için artık hiçbir DELETE/DROP işlemi yapmaz.
SET NAMES utf8mb4;
SET @ilkadim_retired_028 = 1;
