-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.34-0ubuntu0.13.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for e_arsip2
DROP DATABASE IF EXISTS `e_arsip2`;
CREATE DATABASE IF NOT EXISTS `e_arsip2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `e_arsip2`;


-- Dumping structure for table e_arsip2.arsipnew
DROP TABLE IF EXISTS `arsipnew`;
CREATE TABLE IF NOT EXISTS `arsipnew` (
  `id` int(11) NOT NULL,
  `code_archive` varchar(50) NOT NULL,
  `fk_gudang` int(11) NOT NULL,
  `fk_lajur` int(11) NOT NULL,
  `fk_box` int(11) NOT NULL,
  `fk_skpd` int(11) NOT NULL,
  `fk_file` int(11) NOT NULL,
  `file` varchar(50) NOT NULL,
  `kode_klasifikasi` varchar(50) NOT NULL,
  `hasil_pelaksanaan` varchar(50) NOT NULL,
  `nomor_definitif` int(10) NOT NULL,
  `isi_berkas` text NOT NULL,
  `unit_pengolah` varchar(50) NOT NULL,
  `bln_thn` date NOT NULL,
  `month` varchar(50) NOT NULL,
  `years` varchar(50) NOT NULL,
  `bentuk_redaksi` varchar(50) NOT NULL,
  `media` varchar(50) NOT NULL,
  `kelengkapan` varchar(1000) NOT NULL,
  `masalah` varchar(100) NOT NULL,
  `uraian_masalah` text NOT NULL,
  `kode_mslh` varchar(50) NOT NULL,
  `r_aktif` int(5) NOT NULL,
  `r_inaktif` int(5) NOT NULL,
  `j_retensi` int(5) NOT NULL,
  `thn_retensi` year(4) NOT NULL,
  `batas_retensi` date NOT NULL,
  `masa_retensi` varchar(50) NOT NULL,
  `action` enum('DIMUSNAHKAN','DISIMPAN') DEFAULT NULL,
  `c_action` enum('0','1') NOT NULL DEFAULT '0',
  `nilai_guna` varchar(50) NOT NULL,
  `tingkat_perkembangan` varchar(50) NOT NULL,
  `pelaksana_hasil` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `hasil` varchar(250) NOT NULL,
  `approval` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  KEY `fk_skpd` (`fk_skpd`),
  KEY `kode_mslh` (`kode_mslh`),
  KEY `fk_box` (`fk_box`),
  KEY `code_archive` (`code_archive`),
  KEY `fk_file` (`fk_file`),
  CONSTRAINT `FK_arsipnew_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_arsipnew_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_box` FOREIGN KEY (`fk_box`) REFERENCES `box` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_file` FOREIGN KEY (`fk_file`) REFERENCES `file` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lembaga` FOREIGN KEY (`fk_skpd`) REFERENCES `lembaga` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_masalah` FOREIGN KEY (`kode_mslh`) REFERENCES `masalah` (`code_masalah`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip2.arsipnew: ~0 rows (approximately)
/*!40000 ALTER TABLE `arsipnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `arsipnew` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.bentuk_redaksi
DROP TABLE IF EXISTS `bentuk_redaksi`;
CREATE TABLE IF NOT EXISTS `bentuk_redaksi` (
  `id` int(11) NOT NULL,
  `type_media` enum('T','NT') DEFAULT NULL,
  `bentuk_redaksi` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk master bentuk redaksi';

-- Dumping data for table e_arsip2.bentuk_redaksi: ~8 rows (approximately)
/*!40000 ALTER TABLE `bentuk_redaksi` DISABLE KEYS */;
REPLACE INTO `bentuk_redaksi` (`id`, `type_media`, `bentuk_redaksi`, `create_at`, `update_at`, `by_user`) VALUES
	(1, 'T', 'Surat', '2015-03-09 10:14:06', NULL, NULL),
	(2, 'T', 'Laporan', '2015-03-09 10:14:06', NULL, NULL),
	(3, 'T', 'Kontrak', '2015-03-09 10:15:01', NULL, NULL),
	(4, 'T', 'Notulen', '2015-03-09 10:15:18', NULL, NULL),
	(5, 'NT', 'Audio', '2015-03-09 10:15:18', NULL, NULL),
	(6, 'NT', 'Gambar', '2015-03-09 10:15:18', NULL, NULL),
	(7, 'NT', 'Video', '2015-03-09 10:15:18', NULL, NULL),
	(8, 'NT', 'Lainnya', '2015-03-09 10:15:18', NULL, NULL);
/*!40000 ALTER TABLE `bentuk_redaksi` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.box
DROP TABLE IF EXISTS `box`;
CREATE TABLE IF NOT EXISTS `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_gudang` int(11) DEFAULT NULL,
  `fk_lajur` int(11) DEFAULT NULL,
  `kode_box` varchar(50) DEFAULT NULL,
  `nama_box` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_box` (`kode_box`),
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  CONSTRAINT `FK1_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='tempat untuk box / rack';

-- Dumping data for table e_arsip2.box: ~0 rows (approximately)
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
/*!40000 ALTER TABLE `box` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.file
DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL,
  `file_name` varchar(127) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip2.file: ~0 rows (approximately)
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.gudang
DROP TABLE IF EXISTS `gudang`;
CREATE TABLE IF NOT EXISTS `gudang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_gudang` varchar(50) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabel gudang tempat penyimpanan arsip fisik';

-- Dumping data for table e_arsip2.gudang: ~0 rows (approximately)
/*!40000 ALTER TABLE `gudang` DISABLE KEYS */;
/*!40000 ALTER TABLE `gudang` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.history_arsip
DROP TABLE IF EXISTS `history_arsip`;
CREATE TABLE IF NOT EXISTS `history_arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_archive` varchar(127) DEFAULT NULL,
  `action` varchar(127) DEFAULT NULL,
  `desc` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `by_user` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='table untuk menampung history arsip setelah dilakukan tindakan';

-- Dumping data for table e_arsip2.history_arsip: ~0 rows (approximately)
/*!40000 ALTER TABLE `history_arsip` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_arsip` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.kelengkapan
DROP TABLE IF EXISTS `kelengkapan`;
CREATE TABLE IF NOT EXISTS `kelengkapan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_arsip` int(11) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arsip` (`fk_arsip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk menyimpan kelengkapan arsip';

-- Dumping data for table e_arsip2.kelengkapan: ~0 rows (approximately)
/*!40000 ALTER TABLE `kelengkapan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelengkapan` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.klasifikasi
DROP TABLE IF EXISTS `klasifikasi`;
CREATE TABLE IF NOT EXISTS `klasifikasi` (
  `kode_klasifikasi` varchar(50) NOT NULL,
  `nama_klasifikasi` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_klasifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menampung kode klasifikasi instansi';

-- Dumping data for table e_arsip2.klasifikasi: ~0 rows (approximately)
/*!40000 ALTER TABLE `klasifikasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasifikasi` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.lajur
DROP TABLE IF EXISTS `lajur`;
CREATE TABLE IF NOT EXISTS `lajur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_lajur` varchar(50) NOT NULL,
  `fk_gudang` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gudang` (`fk_gudang`),
  CONSTRAINT `FK_lajur_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Tabel lajur gudang tempat penyimpanan arsip fisik';

-- Dumping data for table e_arsip2.lajur: ~0 rows (approximately)
/*!40000 ALTER TABLE `lajur` DISABLE KEYS */;
/*!40000 ALTER TABLE `lajur` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.lembaga
DROP TABLE IF EXISTS `lembaga`;
CREATE TABLE IF NOT EXISTS `lembaga` (
  `id` int(127) NOT NULL AUTO_INCREMENT,
  `kode_skpd` varchar(127) DEFAULT NULL,
  `nama_skpd` varchar(127) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='table untuk master skpd/perusahaan ataupun lembaga ';

-- Dumping data for table e_arsip2.lembaga: ~1 rows (approximately)
/*!40000 ALTER TABLE `lembaga` DISABLE KEYS */;
REPLACE INTO `lembaga` (`id`, `kode_skpd`, `nama_skpd`, `keterangan`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, '001', 'PROYEK BANK JATENG', 'Jl. Madukoro A/B', '2015-03-09 09:33:37', '2015-03-09 09:33:37', 'admin');
/*!40000 ALTER TABLE `lembaga` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.masalah
DROP TABLE IF EXISTS `masalah`;
CREATE TABLE IF NOT EXISTS `masalah` (
  `code_masalah` varchar(50) NOT NULL,
  `name_masalah` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_masalah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Dumping data for table e_arsip2.masalah: ~1 rows (approximately)
/*!40000 ALTER TABLE `masalah` DISABLE KEYS */;
/*!40000 ALTER TABLE `masalah` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.nilai_guna
DROP TABLE IF EXISTS `nilai_guna`;
CREATE TABLE IF NOT EXISTS `nilai_guna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_guna` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Dumping data for table e_arsip2.nilai_guna: ~4 rows (approximately)
/*!40000 ALTER TABLE `nilai_guna` DISABLE KEYS */;
REPLACE INTO `nilai_guna` (`id`, `nilai_guna`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'Administrasi', '2015-03-09 09:34:32', '2015-03-09 09:34:32', 'admin'),
	(2, 'Keuangan', '2015-03-09 09:34:45', '2015-03-09 09:34:45', 'admin'),
	(3, 'Hukum', '2015-03-09 09:34:51', '2015-03-09 09:34:51', 'admin'),
	(4, 'IPTEK', '2015-03-09 09:35:00', '2015-03-09 09:35:00', 'admin');
/*!40000 ALTER TABLE `nilai_guna` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.preferences
DROP TABLE IF EXISTS `preferences`;
CREATE TABLE IF NOT EXISTS `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip2.preferences: ~1 rows (approximately)
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
REPLACE INTO `preferences` (`id`, `program_name`) VALUES
	(1, 'BADAN ARSIP JAWA TENGAH 2015');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name_person` varchar(50) NOT NULL,
  `auth_key` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `fk_level` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_level` (`fk_level`),
  CONSTRAINT `FK1_user_level` FOREIGN KEY (`fk_level`) REFERENCES `user_level` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip2.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id_user`, `username`, `password`, `name_person`, `auth_key`, `email`, `keterangan`, `fk_level`, `status`, `last_login`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'admin', '6382d2a9202d9c8c24733dd82c102bbb', 'Administrator', '54fd03ca7cc120.95651809', 'admin@admin.com', '', 1, '1', '2015-03-15 11:21:10', '2015-03-09 09:22:02', '2015-03-09 09:22:02', 'Guest');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.user_level
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE IF NOT EXISTS `user_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Untuk membuat user leveling access';

-- Dumping data for table e_arsip2.user_level: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
REPLACE INTO `user_level` (`id_level`, `level`) VALUES
	(1, 'Administrator'),
	(2, 'Supervisor'),
	(3, 'User');
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.user_log
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL,
  `ip_host` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `access_type` varchar(255) NOT NULL,
  `by_user` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table for saved log logging user proccess';

-- Dumping data for table e_arsip2.user_log: ~95 rows (approximately)
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;


-- Dumping structure for table e_arsip2.user_profile
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `fk_user` int(11) NOT NULL,
  `address` varchar(127) DEFAULT NULL,
  `about_me` text,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fk_user`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip2.user_profile: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
