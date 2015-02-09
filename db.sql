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
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gudang` (`fk_gudang`),
  KEY `fk_lajur` (`fk_lajur`),
  CONSTRAINT `FK_arsipnew_gudang` FOREIGN KEY (`fk_gudang`) REFERENCES `gudang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_arsipnew_lajur` FOREIGN KEY (`fk_lajur`) REFERENCES `lajur` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.arsipnew: ~13 rows (approximately)
/*!40000 ALTER TABLE `arsipnew` DISABLE KEYS */;
REPLACE INTO `arsipnew` (`id`, `fk_gudang`, `fk_lajur`, `file`, `kode_klasifikasi`, `hasil_pelaksanaan`, `nomor_definitif`, `isi_berkas`, `unit_pengolah`, `bln_thn`, `month`, `years`, `bentuk_redaksi`, `media`, `kelengkapan`, `masalah`, `uraian_masalah`, `kode_mslh`, `r_aktif`, `r_inaktif`, `j_retensi`, `thn_retensi`, `nilai_guna`, `tingkat_perkembangan`, `pelaksana_hasil`, `status`, `create_at`, `edit_at`, `by_user`) VALUES
	(2, 3, 5, 'G.211.12.0001.pdf', '213', 'sipp', 4, 'aku tidak bisa lepas lagi', 'esdm', '0000-00-00', '8', '2006', 'L', 'T', 'sip', 'HARI RAYA/BESAR', 'SE Menyambut ldul Adha 1423 H Th 2003 dari Panitia Pelaksana ldul Adha 1423', 1, 2, 3, 5, '2011', 'Administrasi', 'Salinan', '3/345', '0', '2015-01-21 14:59:37', '2015-02-03 13:14:36', 'wisnu'),
	(3, 1, 4, 'G.231.11.0001.pdf', '123', 'asdfas', 321, 'aku jika kamu kan mengerti', 'esdm', '0000-00-00', '3', '2007', 'K', 'T', 'soppp', 'HARI RAYA/BESAR', 'SE Menyambut ldul Adha 1423 H Th 2003 dari Panitia Pelaksana ldul Adha 1423', 1, 1, 2, 3, '2010', 'Keuangan', 'Tembusan', '3/349', '0', '2015-01-21 15:25:05', '2015-02-03 13:14:12', 'wisnu'),
	(5, 2, 2, 'G.131.14.0060.pdf', '10213', 'sipp', 1, 'jdfj', 'aspek', '0000-00-00', '6', '2008', 'K', 'NT', 'fgasdf', 'HARI RAYA/BESAR', 'Pengumpulan hewan qurban dan shodaqoh hari raya idul Adha 1426 H', 1, 1, 2, 3, '2010', 'Administrasi', 'Asli', '4/234', '1', '2015-01-22 11:36:23', '2015-01-22 11:36:23', 'admin'),
	(6, 2, 3, 'G.211.10.0001.pdf', '002', 'sa', 192, 'MAsalah kelembagaan', 'aspek', '0000-00-00', '7', '2014', 'S', 'T', 'ok', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'sambutan Gubernur Jawa Tengah dalam rangka HUT Rl Ke 56', 1, 1, 2, 3, '2015', 'Administrasi', 'Tembusan', '1/221', '0', '2015-01-28 18:08:44', '2015-01-28 18:08:44', 'admin'),
	(7, 1, 4, 'G.231.11.0040.pdf', '213', 'sipp', 1, 'sdfsafafaf', 'esdm', '0000-00-00', '1', '2009', 'K', 'NT', 'fgasdf', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'penyeleng garaan upacara\r\r\nperingatan Hari Kesaktian Pancasila Tahun 2001', 1, 1, 2, 3, '2015', 'Keuangan', 'Tembusan', '1/221', '0', '2015-01-28 18:58:07', '2015-01-28 18:58:07', 'admin'),
	(8, 2, 2, 'earsip.pdf', '212', 'baik', 5, 'selalu siap sedia', 'esdm', '0000-00-00', '1', '2002', 'S', 'T', 'OK', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'upacara bendera penngatan Hari Sumpah Pemuda', 1, 1, 2, 3, '2018', 'Administrasi', 'Tembusan', '3/346', '1', '2015-01-29 15:16:19', '2015-01-29 15:16:19', 'admin'),
	(9, 2, 2, 'G.131.14.0012 (1).pdf', '005', 'baik', 14, 'Perayaan Hari ultah', 'aspek', '0000-00-00', '3', '2012', 'L', 'T', 'sip', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'Pedoman Peringatan HUT RI ke-59 iahun 2004', 1, 1, 4, 5, '2017', 'Keuangan', 'Tembusan', '3/347', '0', '2015-01-31 08:36:48', '2015-01-31 08:36:48', 'wisnu'),
	(10, 2, 3, 'G.211.11.0001.pdf', '007', 'baik', 4, 'coba lagi', 'esdm', '0000-00-00', '3', '2010', 'N', 'T', 'OK', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'Pedoman penyelenggaraan upacara harkitnas 2006', 1, 2, 3, 5, '2015', 'Keuangan', 'Tembusan', '3/348', '1', '2015-01-31 08:38:45', '2015-02-03 11:53:56', 'wisnu'),
	(11, 3, 5, 'G.131.14.0014.pdf', '213', 'sipp', 4, 'Perayaan hari jadi bayangakara', 'esdm', '0000-00-00', '4', '2010', 'L', 'NT', 'sip', 'HARI RAYA KEAGAMAAN', 'undangan pengajian keliling putaran ke 4', 1, 1, 2, 3, '2013', 'Keuangan', 'Tembusan', '1/221', '0', '2015-01-31 08:40:10', '2015-01-31 08:40:10', 'wisnu'),
	(12, 4, 6, 'G.231.11.0100.pdf', '219', 'sipp', 9, 'haloooo', 'akon', '0000-00-00', '5', '2015', 'L', 'T', 'OK', 'HARI RAYA KEAGAMAAN', 'jadwal tarawih keliling\r\r\nIahun 142412003\r', 1, 1, 3, 4, '2019', 'Keuangan', 'Copy', '3/348', '0', '2015-01-31 08:42:53', '2015-01-31 08:42:53', 'wisnu'),
	(13, 3, 5, 'contoh paper_Konsep Sistem Informasi.pdf', '009', 'sipp', 19, 'heeeelp', 'esdm', '0000-00-00', '9', '2013', 'K', 'NT', 'sip', 'HARI RAYA KEAGAMAAN', 'peningkatan amalan di\r\r\nbulan ramadhan\r', 1, 1, 3, 4, '2017', 'Keuangan', 'Asli', '1/221', '0', '2015-01-31 08:44:06', '2015-01-31 08:44:06', 'wisnu'),
	(14, 4, 6, 'G.131.14.0014.pdf', '008', 'baik', 1, 'tesss', 'aspek', '0000-00-00', '9', '2010', 'L', 'T', 'OK', 'Perayaan Hari jadi Pahlawan OK', 'aku pun ingin mengerti', 1, 1, 2, 3, '2013', 'Keuangan', 'Salinan', '3/350', '0', '2015-02-02 14:34:04', '2015-02-02 14:34:04', 'wisnu'),
	(15, 2, 3, 'G.211.12.0035.pdf', '212', 'baik', 9, 'test', 'akon', '0000-00-00', '3', '2011', 'L', 'T', 'sip', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'Hari ultah indonesia', 1, 2, 3, 5, '2016', 'Keuangan', 'Tembusan', '1/229', '1', '2015-02-03 13:16:49', '2015-02-03 13:17:15', 'wisnu'),
	(16, 3, 5, 'G.131.14.0012 (1).pdf', '009', 'baik', 321, 'halo', 'esdm', '0000-00-00', '3', '2012', 'L', 'NT', 'sip', 'HARI NASTONAL (17AGUSTUS. HARI PAHLAWAN, HARI ANAK,HKSN dsb)', 'test', 1, 2, 3, 5, '2017', 'Administrasi', 'Asli', '3/348', '1', '2015-02-03 13:25:54', '2015-02-03 13:25:54', 'wisnu');
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


-- Dumping structure for table e_arsip.preferences
DROP TABLE IF EXISTS `preferences`;
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
  `status` tinyint(4) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_level` (`fk_level`),
  CONSTRAINT `FK1_user_level` FOREIGN KEY (`fk_level`) REFERENCES `user_level` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id_user`, `username`, `password`, `name_person`, `auth_key`, `email`, `keterangan`, `fk_level`, `status`, `create_at`, `edit_at`, `by_user`) VALUES
	(1, 'wisnu', '338d726bd8f3fbec819b48b99b38df44', 'Wisnu Agung Pro', '54d032d2588928.12755677', 'wisnu@multisolusi.info', 'iok', 1, 1, '2015-01-30 11:55:35', '2015-02-03 09:30:42', 'wisnu'),
	(2, 'narto', 'a73cb87c28575a48761f5bfd19bd54a9', 'Wihanarto', '54d0340f8b3171.24447708', 'narto@nar.com', 'narto', 1, 1, '2015-01-30 14:31:20', '2015-02-03 09:35:59', 'wisnu'),
	(3, 'wahyu', '3564c12391a8e060a7f324988d8875c0', 'Wahyu Hendro', '54cc57a2d5f355.26165726', 'whhendro91@gmail.com', '', 2, 1, '2015-01-31 11:18:42', '2015-01-31 11:18:42', 'wisnu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table e_arsip.user_level
DROP TABLE IF EXISTS `user_level`;
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
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `fk_user` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `about_me` text,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fk_user`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e_arsip.user_profile: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
REPLACE INTO `user_profile` (`fk_user`, `address`, `about_me`, `photo`) VALUES
	(1, 'Desa Sodong Rt 6 Rw 2 Mijen Semarang', 'a programmer', 'slfdjksfd'),
	(2, 'jl .wologito tengah 59', 'Kepala Arsip', 'photo.jpg'),
	(3, 'Desa Gowok Rt. 8 Rw 1 Kel. Ngabean Kec. Boja Kenda', 'IT Support', 'xxx.jpg');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
