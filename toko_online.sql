-- Database: `toko_online`

CREATE DATABASE IF NOT EXISTS `toko_online`;
USE `toko_online`;

-- Table structure for table `user`
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `produk`
CREATE TABLE IF NOT EXISTS `produk` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` TEXT NOT NULL,
  `harga` INT(11) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  `gambar` TEXT NOT NULL,
  `created_by` INT(11) UNSIGNED NOT NULL,
  `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(11) UNSIGNED DEFAULT NULL,
  `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `keranjang`
CREATE TABLE IF NOT EXISTS `keranjang` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `produk_id` INT(11) UNSIGNED NOT NULL,
  `jumlah` INT(11) NOT NULL,
  `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `transaksi`
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `total_harga` INT(11) NOT NULL,
  `status` ENUM('pending', 'confirmed', 'canceled') DEFAULT 'pending',
  `bukti_pembayaran` TEXT,
  `status_pembayaran` ENUM('unpaid', 'pending', 'verified') DEFAULT 'unpaid',
  `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `komentar`
CREATE TABLE IF NOT EXISTS `komentar` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` INT(11) UNSIGNED NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `isi` TEXT NOT NULL,
  `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
