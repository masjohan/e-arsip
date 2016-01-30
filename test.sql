-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             7.0.0.4370
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_archive` varchar(50) NOT NULL,
  `fk_gudang` int(11) NOT NULL,
  `fk_lajur` int(11) NOT NULL,
  `fk_box` int(11) NOT NULL,
  `fk_skpd` int(11) NOT NULL,
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
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  KEY `fk_skpd` (`fk_skpd`),
  KEY `kode_mslh` (`kode_mslh`),
  KEY `fk_box` (`fk_box`),
  KEY `code_archive` (`code_archive`),
  CONSTRAINT `FK_arsipnew_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_arsipnew_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_box` FOREIGN KEY (`fk_box`) REFERENCES `box` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lembaga` FOREIGN KEY (`fk_skpd`) REFERENCES `lembaga` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_masalah` FOREIGN KEY (`kode_mslh`) REFERENCES `masalah` (`code_masalah`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.arsipnew: ~1 rows (approximately)
/*!40000 ALTER TABLE `arsipnew` DISABLE KEYS */;
REPLACE INTO `arsipnew` (`id`, `code_archive`, `fk_gudang`, `fk_lajur`, `fk_box`, `fk_skpd`, `file`, `kode_klasifikasi`, `hasil_pelaksanaan`, `nomor_definitif`, `isi_berkas`, `unit_pengolah`, `bln_thn`, `month`, `years`, `bentuk_redaksi`, `media`, `kelengkapan`, `masalah`, `uraian_masalah`, `kode_mslh`, `r_aktif`, `r_inaktif`, `j_retensi`, `thn_retensi`, `nilai_guna`, `tingkat_perkembangan`, `pelaksana_hasil`, `status`, `create_at`, `edit_at`, `by_user`, `user_id`, `hasil`, `approval`) VALUES
	(1, 'GA/1A/BA.1/1', 1, 1, 1, 5, 'COVER.pdf', '001', '', 0, '', 'coba', '0000-00-00', '3', '2000', 'Surat', 'T', '', 'HARI BESAR KEAGAMAAN', 'HARI BESAR KEAGAMAAN', '003', 1, 2, 3, '2003', '1', 'Asli', '', '1', '2015-03-01 15:22:11', '2015-03-01 09:22:11', 'wisnu', 1, '1', 'wisnu');
/*!40000 ALTER TABLE `arsipnew` ENABLE KEYS */;


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

-- Dumping data for table e_arsip.bentuk_redaksi: ~8 rows (approximately)
/*!40000 ALTER TABLE `bentuk_redaksi` DISABLE KEYS */;
REPLACE INTO `bentuk_redaksi` (`id`, `type_media`, `bentuk_redaksi`, `create_at`, `update_at`, `by_user`) VALUES
	(1, 'T', 'Surat', '2015-02-09 10:20:37', NULL, NULL),
	(2, 'T', 'Laporan', '2015-02-09 10:20:37', NULL, NULL),
	(3, 'T', 'Kontrak', '2015-02-09 10:20:37', NULL, NULL),
	(4, 'T', 'Notulen', '2015-02-09 10:20:37', NULL, NULL),
	(5, 'NT', 'Gambar', '2015-02-09 10:20:37', NULL, NULL),
	(6, 'NT', 'Audio', '2015-02-09 10:20:37', NULL, NULL),
	(7, 'NT', 'Video', '2015-02-09 10:20:37', NULL, NULL),
	(8, 'NT', 'Lainnya', '2015-02-09 10:20:37', NULL, NULL);
/*!40000 ALTER TABLE `bentuk_redaksi` ENABLE KEYS */;


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
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  CONSTRAINT `FK1_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='tempat untuk box / rack';

-- Dumping data for table e_arsip.box: ~6 rows (approximately)
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
REPLACE INTO `box` (`id`, `fk_gudang`, `fk_lajur`, `kode_box`, `nama_box`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 1, 1, 'BA.1', 'box arsip A', '2015-02-09 10:32:04', NULL, NULL),
	(2, 1, 1, 'BA.2', 'Box GA1A2015', '2015-02-09 23:24:05', NULL, NULL),
	(3, 2, 2, 'BB.1', 'GB2B2015', '2015-02-09 23:24:46', NULL, NULL),
	(4, 2, 2, 'BB.2', 'box b', '2015-02-11 20:10:41', NULL, NULL),
	(5, 3, 5, 'BC.1', 'box 1c', '2015-02-11 20:12:51', NULL, NULL),
	(6, 4, 6, 'BD.1', 'box 1 d', '2015-02-11 20:14:50', NULL, NULL);
/*!40000 ALTER TABLE `box` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabel gudang tempat penyimpanan arsip fisik';

-- Dumping data for table e_arsip.gudang: ~4 rows (approximately)
/*!40000 ALTER TABLE `gudang` DISABLE KEYS */;
REPLACE INTO `gudang` (`id`, `kd_gudang`, `nama`, `keterangan`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'GA', 'Gudang A', 'gudang untuk menyimpan arsip tata kelola kota', '2014-12-14 10:45:45', '2014-12-14 11:23:00', 'admin'),
	(2, 'GB', 'Gudang B', 'Gudang untuk menyimpan arsip kedaerahan', '2014-12-14 11:11:27', '2014-12-14 11:23:54', 'admin'),
	(3, 'GC', 'Gudang C', 'Gudang C', '2014-12-14 12:14:44', '2014-12-14 12:14:44', 'admin'),
	(4, 'GD', 'Gudang D', 'Gudang D Brooooo', '2014-12-15 14:02:05', '2014-12-15 14:02:17', 'admin');
/*!40000 ALTER TABLE `gudang` ENABLE KEYS */;


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

-- Dumping data for table e_arsip.kelengkapan: ~0 rows (approximately)
/*!40000 ALTER TABLE `kelengkapan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelengkapan` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Tabel lajur gudang tempat penyimpanan arsip fisik';

-- Dumping data for table e_arsip.lajur: ~6 rows (approximately)
/*!40000 ALTER TABLE `lajur` DISABLE KEYS */;
REPLACE INTO `lajur` (`id`, `kd_lajur`, `fk_gudang`, `nama`, `keterangan`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, '1A', 1, 'Lajur 1A', 'Lajur untuk 1A', '2014-12-14 11:55:47', '2015-01-21 10:19:05', 'admin'),
	(2, '2B', 2, 'Lajur 2B', 'Lajur 2 B', '2014-12-18 22:40:05', '2014-12-18 22:40:05', 'admin'),
	(3, '1B', 2, 'Lajur 1 B', 'Lajur gudang 1 B', '2015-01-22 13:48:19', '2015-01-22 13:48:19', 'admin'),
	(4, '2A', 1, 'Lajur 2A', 'Lajur 2A', '2015-01-22 13:54:59', '2015-01-22 13:54:59', 'admin'),
	(5, '1C', 3, 'Lajur 1 C', 'Lajur untuk 1 C', '2015-01-28 19:41:17', '2015-01-28 19:41:17', 'admin'),
	(6, '1D', 4, 'Lajur 1 D', 'Lajur Untuk 1 D', '2015-01-28 19:42:02', '2015-01-28 19:42:02', 'admin');
/*!40000 ALTER TABLE `lajur` ENABLE KEYS */;


-- Dumping structure for table e_arsip.lembaga
CREATE TABLE IF NOT EXISTS `lembaga` (
  `id` int(127) NOT NULL AUTO_INCREMENT,
  `kode_skpd` varchar(50) DEFAULT NULL,
  `nama_skpd` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='table untuk master skpd/perusahaan ataupun lembaga ';

-- Dumping data for table e_arsip.lembaga: ~16 rows (approximately)
/*!40000 ALTER TABLE `lembaga` DISABLE KEYS */;
REPLACE INTO `lembaga` (`id`, `kode_skpd`, `nama_skpd`, `keterangan`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, '001', 'BPPT', NULL, '2015-02-09 12:18:13', NULL, NULL),
	(2, '003', 'PEMKOT', NULL, '2015-02-09 12:18:13', NULL, NULL),
	(3, '002', 'ARSIP JATENG', NULL, '2015-02-09 12:18:13', NULL, NULL),
	(4, '005', 'ARSIP BANYUMANIK', NULL, '2015-02-10 14:48:46', NULL, NULL),
	(5, '004', 'Arsip Semarang', NULL, '2015-02-10 14:51:45', NULL, NULL),
	(6, '007', 'PULSANIS', 'Jl. Madukoro', '2015-02-12 14:46:21', NULL, NULL),
	(7, '007', 'BALITBANG', 'semarang', '2015-02-12 14:55:25', NULL, NULL),
	(8, '100', 'BADAN ARSIP NASIONAL', 'jakarta', '2015-02-12 14:58:34', NULL, NULL),
	(9, '005', 'Bangka', 'bangka belitung', '2015-02-12 15:11:05', NULL, NULL),
	(10, '009', 'BADAN KEPEGAAIAN DAERAH', 'Semarang', '2015-02-12 15:13:32', NULL, NULL),
	(11, '012', 'PT INTAN', '', '2015-02-12 16:34:27', NULL, NULL),
	(12, '008', 'PT. SARASWATI CANDRA', 'jl. kusuma negara semarang', '2015-02-13 09:04:10', NULL, NULL),
	(13, '011', 'DISHUBKOMINFO', 'Semarang', '2015-02-13 09:12:30', '2015-02-13 09:12:30', 'user1'),
	(14, '015', 'DINAS PENDIDIKAN', 'JL. Pemuda Semarang', '2015-03-01 15:25:05', '2015-03-01 09:25:05', 'wisnu'),
	(15, '020', 'DIKLAT', 'Semarang', '2015-03-01 15:39:35', '2015-03-01 09:39:35', 'ida'),
	(16, '001', 'PROYEK BANK JATENG', '', '2015-03-04 18:44:15', '2015-03-04 12:44:15', 'ida');
/*!40000 ALTER TABLE `lembaga` ENABLE KEYS */;


-- Dumping structure for table e_arsip.masalah
CREATE TABLE IF NOT EXISTS `masalah` (
  `code_masalah` varchar(50) NOT NULL,
  `name_masalah` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_masalah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Dumping data for table e_arsip.masalah: ~4 rows (approximately)
/*!40000 ALTER TABLE `masalah` DISABLE KEYS */;
REPLACE INTO `masalah` (`code_masalah`, `name_masalah`, `create_at`, `edit_at`, `by_user`) VALUES
	('003', 'HARI BESAR KEAGAMAAN', '2015-02-09 14:52:53', NULL, NULL),
	('003.1', 'HARI BESAR AGUSTUS', '2015-02-11 20:16:13', NULL, NULL),
	('003.2', 'HARI RAYA KEAGAMAAN DAN IDUL ADHA', '2015-02-09 23:32:58', NULL, NULL),
	('003.5', 'HARI OLAHRAGA NASIONAL', '2015-02-12 15:37:19', NULL, NULL);
/*!40000 ALTER TABLE `masalah` ENABLE KEYS */;


-- Dumping structure for table e_arsip.nilai_guna
CREATE TABLE IF NOT EXISTS `nilai_guna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_guna` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='table untuk menyimpan kode masalah dan nama masalah';

-- Dumping data for table e_arsip.nilai_guna: ~4 rows (approximately)
/*!40000 ALTER TABLE `nilai_guna` DISABLE KEYS */;
REPLACE INTO `nilai_guna` (`id`, `nilai_guna`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'Administrasi', '2015-02-09 10:37:19', NULL, NULL),
	(2, 'Keuangan', '2015-02-09 10:37:19', NULL, NULL),
	(3, 'Hukum', '2015-02-09 10:37:19', NULL, NULL),
	(4, 'IPTEK', '2015-02-09 10:37:19', NULL, NULL);
/*!40000 ALTER TABLE `nilai_guna` ENABLE KEYS */;


-- Dumping structure for table e_arsip.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.preferences: ~1 rows (approximately)
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
REPLACE INTO `preferences` (`id`, `program_name`) VALUES
	(1, 'BADAN ARSIP DAERAH PROVINSI JAWA TENGAH');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.user: ~6 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id_user`, `username`, `password`, `name_person`, `auth_key`, `email`, `keterangan`, `fk_level`, `status`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'wisnu', '338d726bd8f3fbec819b48b99b38df44', 'Wisnu Agung Pro', '54d032d2588928.12755677', 'wisnu@multisolusi.info', 'iok', 1, 1, '2015-01-30 11:55:35', '2015-02-03 09:30:42', 'wisnu'),
	(2, 'narto', 'a73cb87c28575a48761f5bfd19bd54a9', 'Wihanarto', '54d0340f8b3171.24447708', 'narto@nar.com', 'narto', 1, 1, '2015-01-30 14:31:20', '2015-02-03 09:35:59', 'wisnu'),
	(3, 'wahyu', '3564c12391a8e060a7f324988d8875c0', 'Wahyu Hendro', '54cc57a2d5f355.26165726', 'whhendro91@gmail.com', '', 2, 1, '2015-01-31 11:18:42', '2015-01-31 11:18:42', 'wisnu'),
	(4, 'user1', 'ecb7ecd21d65f448abbd48f4fcaaffce', 'user 1', '54db56d3005476.25438972', 'user1@xx.com', '', 3, 1, '2015-02-11 20:19:15', '2015-02-11 20:19:15', 'wisnu'),
	(5, 'admin', 'b2fd6bc9bfde03a0698094ee310b4a7c', 'Administrator', '54f2cddf601135.69884239', 'admin@admin.com', '', 1, 1, '2015-03-01 15:29:19', '2015-03-01 09:29:19', 'wisnu'),
	(6, 'ida', 'd5132541b957507f18894d45c7b1f58d', 'ida', '54f2ceab9d8354.72329863', 'ida@gmail.com', '', 3, 1, '2015-03-01 15:32:43', '2015-03-01 09:32:43', 'admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table e_arsip.user_level
CREATE TABLE IF NOT EXISTS `user_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Untuk membuat user leveling access';

-- Dumping data for table e_arsip.user_level: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
REPLACE INTO `user_level` (`id_level`, `level`) VALUES
	(1, 'Administrator'),
	(2, 'Supervisor'),
	(3, 'User');
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;


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

-- Dumping data for table e_arsip.user_profile: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
REPLACE INTO `user_profile` (`fk_user`, `address`, `about_me`, `photo`) VALUES
	(1, 'Desa Sodong Rt 6 Rw 2 Mijen Semarang', 'a programmer', 'photo'),
	(2, 'jl .wologito tengah 59', 'Kepala Arsip', 'photo.jpg'),
	(3, 'Desa Gowok Rt. 8 Rw 1 Kel. Ngabean Kec. Boja Kenda', 'IT Support', 'xxx.jpg'),
	(4, 'alamat user 1', 'saya user 1', '');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
