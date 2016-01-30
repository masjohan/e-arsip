-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for e_arsip
CREATE DATABASE IF NOT EXISTS `e_arsip` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `e_arsip`;


-- Dumping structure for table e_arsip.arsipnew
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
  `action` enum('DIMUSNAHKAN','DISIMPAN') DEFAULT NULL,
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

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.bentuk_redaksi
CREATE TABLE IF NOT EXISTS `bentuk_redaksi` (
  `id` int(11) NOT NULL,
  `type_media` enum('T','NT') DEFAULT NULL,
  `bentuk_redaksi` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk master bentuk redaksi';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.box
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tempat untuk box / rack';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(127) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.gudang
CREATE TABLE IF NOT EXISTS `gudang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_gudang` varchar(50) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabel gudang tempat penyimpanan arsip fisik';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.kelengkapan
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

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.lajur
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Tabel lajur gudang tempat penyimpanan arsip fisik';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.lembaga
CREATE TABLE IF NOT EXISTS `lembaga` (
  `id` int(127) NOT NULL AUTO_INCREMENT,
  `kode_skpd` varchar(127) DEFAULT NULL,
  `nama_skpd` varchar(127) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk master skpd/perusahaan ataupun lembaga ';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.masalah
CREATE TABLE IF NOT EXISTS `masalah` (
  `code_masalah` varchar(50) NOT NULL,
  `name_masalah` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_masalah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.nilai_guna
CREATE TABLE IF NOT EXISTS `nilai_guna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_guna` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name_person` varchar(50) NOT NULL,
  `auth_key` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `fk_level` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_level` (`fk_level`),
  CONSTRAINT `FK1_user_level` FOREIGN KEY (`fk_level`) REFERENCES `user_level` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.user_level
CREATE TABLE IF NOT EXISTS `user_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Untuk membuat user leveling access';

-- Data exporting was unselected.


-- Dumping structure for table e_arsip.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `fk_user` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `about_me` text,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fk_user`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
