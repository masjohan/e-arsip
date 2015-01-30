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

-- Dumping database structure for e_arsip
DROP DATABASE IF EXISTS `e_arsip`;
CREATE DATABASE IF NOT EXISTS `e_arsip` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `e_arsip`;


-- Dumping structure for table e_arsip.arsip
DROP TABLE IF EXISTS `arsip`;
CREATE TABLE IF NOT EXISTS `arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_arsip` varchar(50) NOT NULL DEFAULT '0',
  `file` varchar(100) NOT NULL,
  `nama_arsip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='Untuk menyimpan file kearsipan ';

-- Dumping data for table e_arsip.arsip: ~3 rows (approximately)
/*!40000 ALTER TABLE `arsip` DISABLE KEYS */;
REPLACE INTO `arsip` (`id`, `kd_arsip`, `file`, `nama_arsip`) VALUES
	(49, '0345', 'GSG_BeeAccounting.pdf', 'GSG_BeeAccounting.pdf'),
	(50, '006', 'kompak1.pdf', 'kompak1.pdf'),
	(51, '089', 'earsip.pdf', 'earsip.pdf');
/*!40000 ALTER TABLE `arsip` ENABLE KEYS */;


-- Dumping structure for table e_arsip.arsipnew
DROP TABLE IF EXISTS `arsipnew`;
CREATE TABLE IF NOT EXISTS `arsipnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_gudang` int(11) NOT NULL,
  `fk_lajur` int(11) NOT NULL,
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
  `kelengkapan` varchar(50) NOT NULL,
  `masalah` varchar(100) NOT NULL,
  `uraian_masalah` text NOT NULL,
  `kode_mslh` int(10) NOT NULL,
  `r_aktif` int(5) NOT NULL,
  `r_inaktif` int(5) NOT NULL,
  `j_retensi` int(5) NOT NULL,
  `thn_retensi` year(4) NOT NULL,
  `nilai_guna` varchar(50) NOT NULL,
  `tingkat_perkembangan` varchar(50) NOT NULL,
  `pelaksana_hasil` varchar(50) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  CONSTRAINT `FK_arsipnew_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_arsipnew_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.arsipnew: ~6 rows (approximately)
/*!40000 ALTER TABLE `arsipnew` DISABLE KEYS */;
REPLACE INTO `arsipnew` (`id`, `fk_gudang`, `fk_lajur`, `file`, `kode_klasifikasi`, `hasil_pelaksanaan`, `nomor_definitif`, `isi_berkas`, `unit_pengolah`, `bln_thn`, `month`, `years`, `bentuk_redaksi`, `media`, `kelengkapan`, `masalah`, `uraian_masalah`, `kode_mslh`, `r_aktif`, `r_inaktif`, `j_retensi`, `thn_retensi`, `nilai_guna`, `tingkat_perkembangan`, `pelaksana_hasil`, `create_at`, `edit_at`, `by_user`) VALUES
	(2, 1, 1, 'G.131.14.0027.pdf', '213', 'sipp', 4, 'aku tidak bisa lepas lagi', 'esdm', '0000-00-00', '', '2006', 'L', 'T', 'sip', 'tidak ada masalah', 'aku pun tidak tau masalah ', 1, 2, 3, 5, '2015', 'Administrasi', 'Salinan', '3/345', '2015-01-21 14:59:37', '2015-01-21 14:59:37', 'admin'),
	(3, 2, 2, 'G.131.14.0033.pdf', '123', 'asdfas', 321, 'aku jika kamu kan mengerti', 'esdm', '0000-00-00', '', '2007', 'K', 'T', 'soppp', 'tidak ada masalah', 'dan semua yang mengerti', 1, 1, 2, 3, '2014', 'Keuangan', 'Tembusan', '3/349', '2015-01-21 15:25:05', '2015-01-21 15:25:05', 'admin'),
	(5, 2, 2, 'G.131.14.0060.pdf', '10213', 'sipp', 1, 'jdfj', 'aspek', '0000-00-00', '06', '2008', 'K', 'NT', 'fgasdf', 'sdfsg', 'tessss', 1, 1, 2, 3, '2010', 'Administrasi', 'Asli', '4/234', '2015-01-22 11:36:23', '2015-01-22 11:36:23', 'admin'),
	(6, 2, 3, 'G.211.10.0001.pdf', '002', 'sa', 192, 'MAsalah kelembagaan', 'aspek', '0000-00-00', '06', '2014', 'S', 'T', 'ok', 'tidak ada masalah', 'aku tidak tahu', 1, 1, 2, 3, '2015', 'Administrasi', 'Tembusan', '1/221', '2015-01-28 18:08:44', '2015-01-28 18:08:44', 'admin'),
	(7, 1, 4, 'G.231.11.0040.pdf', '213', 'sipp', 1, 'sdfsafafaf', 'esdm', '0000-00-00', '01', '2015', 'K', 'NT', 'fgasdf', 'iaaaaa', 'sdfsfjkl', 1, 1, 2, 3, '2015', 'Keuangan', 'Tembusan', '1/221', '2015-01-28 18:58:07', '2015-01-28 18:58:07', 'admin'),
	(8, 2, 2, 'earsip.pdf', '212', 'baik', 5, 'selalu siap sedia', 'esdm', '0000-00-00', '01', '2015', 'S', 'T', 'OK', 'tidak ada masalah', 'tessssss tahun', 1, 1, 2, 3, '2018', 'Administrasi', 'Tembusan', '3/346', '2015-01-29 15:16:19', '2015-01-29 15:16:19', 'admin');
/*!40000 ALTER TABLE `arsipnew` ENABLE KEYS */;


-- Dumping structure for table e_arsip.gudang
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabel gudang tempat penyimpanan arsip fisik';

-- Dumping data for table e_arsip.gudang: ~4 rows (approximately)
/*!40000 ALTER TABLE `gudang` DISABLE KEYS */;
REPLACE INTO `gudang` (`id`, `kd_gudang`, `nama`, `keterangan`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'GA', 'Gudang A', 'gudang untuk menyimpan arsip tata kelola kota', '2014-12-14 10:45:45', '2014-12-14 11:23:00', 'admin'),
	(2, 'GB', 'Gudang B', 'Gudang untuk menyimpan arsip kedaerahan', '2014-12-14 11:11:27', '2014-12-14 11:23:54', 'admin'),
	(3, 'GC', 'Gudang C', 'Gudang C', '2014-12-14 12:14:44', '2014-12-14 12:14:44', 'admin'),
	(4, 'GD', 'Gudang D', 'Gudang D Brooooo', '2014-12-15 14:02:05', '2014-12-15 14:02:17', 'admin');
/*!40000 ALTER TABLE `gudang` ENABLE KEYS */;


-- Dumping structure for table e_arsip.lajur
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
  CONSTRAINT `FK_lajur_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
