CREATE TABLE IF NOT EXISTS giris_guvenlik (
    kapsam VARCHAR(16) NOT NULL,
    kapsam_hash CHAR(64) NOT NULL,
    deneme_sayisi SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    pencere_baslangici DATETIME NOT NULL,
    engel_bitis DATETIME NULL,
    son_deneme DATETIME NOT NULL,
    PRIMARY KEY (kapsam,kapsam_hash),
    KEY ix_giris_guvenlik_engel (engel_bitis),
    KEY ix_giris_guvenlik_son (son_deneme)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM giris_guvenlik
WHERE son_deneme < DATE_SUB(NOW(), INTERVAL 7 DAY);
