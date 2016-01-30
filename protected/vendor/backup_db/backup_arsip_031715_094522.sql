DROP TABLE IF EXISTS arsipnew;

CREATE TABLE `arsipnew` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menampung semua data arsip';

INSERT INTO arsipnew VALUES("1","ASP/GA/1A/BA.1/001/001.YY/1/2015","1","1","1","1","1","3_Posisi_Pompa.pdf","027.1","","0","","proyek","0000-00-00","2","2015","Surat","T","","DOKUMEN PENAWARAN PENGAWASAN","DOKUMEN PENAWARAN PENGAWASA","001.YY","1","2","3","2018","2018-02-01","","","0","1","Copy","","1","2015-03-16 08:57:52","2015-03-16 10:00:40","admin","1","1","admin");
INSERT INTO arsipnew VALUES("2","GA/2A/BA.3/001/001.AC/2/2013","1","2","3","1","2","3_Posisi_Pompa.pdf","027.1","","0","","proyek","0000-00-00","4","2013","Surat","T","","DOKUMEN PENGADAAN","dokumen ini mengandung hal - hal di bidang perindustrian dan penawaran hasil yang membuat pengadilan hidup","001.AC","1","1","2","2015","2015-04-01","16","","0","1","Copy","","1","2015-03-16 09:33:34","2015-03-17 08:12:01","admin","1","2","admin");
INSERT INTO arsipnew VALUES("3","GA/2A/BA.3/001/001.AK/3/2012","1","2","3","1","3","3_Posisi_Pompa.pdf","027.1","","0","","proyek","0000-00-00","2","2012","Surat","T","","KONTRAK","KONTRAK","001.AK","1","2","3","2015","2015-02-01","","DIMUSNAHKAN","1","1","Copy","","0","2015-03-16 11:06:31","2015-03-16 11:06:57","admin","1","3","admin");



DROP TABLE IF EXISTS bentuk_redaksi;

CREATE TABLE `bentuk_redaksi` (
  `id` int(11) NOT NULL,
  `type_media` enum('T','NT') DEFAULT NULL,
  `bentuk_redaksi` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk master bentuk redaksi';

INSERT INTO bentuk_redaksi VALUES("1","T","Surat","2015-03-09 10:14:06","","");
INSERT INTO bentuk_redaksi VALUES("2","T","Laporan","2015-03-09 10:14:06","","");
INSERT INTO bentuk_redaksi VALUES("3","T","Kontrak","2015-03-09 10:15:01","","");
INSERT INTO bentuk_redaksi VALUES("4","T","Notulen","2015-03-09 10:15:18","","");
INSERT INTO bentuk_redaksi VALUES("5","NT","Audio","2015-03-09 10:15:18","","");
INSERT INTO bentuk_redaksi VALUES("6","NT","Gambar","2015-03-09 10:15:18","","");
INSERT INTO bentuk_redaksi VALUES("7","NT","Video","2015-03-09 10:15:18","","");
INSERT INTO bentuk_redaksi VALUES("8","NT","Lainnya","2015-03-09 10:15:18","","");



DROP TABLE IF EXISTS box;

CREATE TABLE `box` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='tempat untuk box / rack';

INSERT INTO box VALUES("1","1","1","BA.1","Box Baturetno","2015-03-07 14:23:08","2015-03-07 08:23:08","admin");
INSERT INTO box VALUES("2","1","1","BA.2","BoxCepu","2015-03-07 15:37:58","2015-03-13 03:34:54","admin");
INSERT INTO box VALUES("3","1","2","BA.3","Box Ngadirejo","2015-03-13 09:33:55","2015-03-13 03:35:10","admin");



DROP TABLE IF EXISTS file;

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `file_name` varchar(127) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menampung semua file dari arsip';

INSERT INTO file VALUES("1","3_Posisi_Pompa.pdf","2015-03-16 08:36:25","2015-03-16 08:36:25","admin");
INSERT INTO file VALUES("2","3_Posisi_Pompa.pdf","2015-03-16 09:32:17","2015-03-16 09:32:17","admin");
INSERT INTO file VALUES("3","3_Posisi_Pompa.pdf","2015-03-16 11:05:34","2015-03-16 11:05:34","admin");



DROP TABLE IF EXISTS gudang;

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_gudang` varchar(50) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabel gudang tempat penyimpanan arsip fisik';

INSERT INTO gudang VALUES("1","GA","Gudang A","Gudang Untuk Proyek","2015-03-16 08:47:00","0000-00-00 00:00:00","");



DROP TABLE IF EXISTS history_arsip;

CREATE TABLE `history_arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_archive` varchar(127) DEFAULT NULL,
  `action` varchar(127) DEFAULT NULL,
  `desc` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `by_user` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='table untuk menampung history arsip setelah dilakukan tindakan';

INSERT INTO history_arsip VALUES("1","GA/2A/BA.3/001/001.AK/3/2012","DIMUSNAHKAN","DIBAKAR OLEH API","2015-03-16 11:06:57","admin");



DROP TABLE IF EXISTS kelengkapan;

CREATE TABLE `kelengkapan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_arsip` int(11) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arsip` (`fk_arsip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk menyimpan kelengkapan arsip';




DROP TABLE IF EXISTS klasifikasi;

CREATE TABLE `klasifikasi` (
  `kode_klasifikasi` varchar(50) NOT NULL,
  `nama_klasifikasi` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_klasifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menampung kode klasifikasi instansi';

INSERT INTO klasifikasi VALUES("027.1","Prakualifikasi","2015-03-16 08:56:39","2015-03-16 08:56:39","admin");



DROP TABLE IF EXISTS lajur;

CREATE TABLE `lajur` (
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

INSERT INTO lajur VALUES("1","1A","1","Lajur 1 A","Proyek 5 Paket","2015-03-16 08:52:06","0000-00-00 00:00:00","");
INSERT INTO lajur VALUES("2","2A","1","Lajur 2 A","Proyek 5 Paket","2015-03-16 08:52:06","0000-00-00 00:00:00","");



DROP TABLE IF EXISTS lembaga;

CREATE TABLE `lembaga` (
  `id` int(127) NOT NULL AUTO_INCREMENT,
  `kode_skpd` varchar(127) DEFAULT NULL,
  `nama_skpd` varchar(127) DEFAULT NULL,
  `keterangan` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='table untuk master skpd/perusahaan ataupun lembaga ';

INSERT INTO lembaga VALUES("1","001","PROYEK BANK JATENG","Jl. Madukoro A/B","2015-03-09 09:33:37","2015-03-09 09:33:37","admin");



DROP TABLE IF EXISTS masalah;

CREATE TABLE `masalah` (
  `code_masalah` varchar(50) NOT NULL,
  `name_masalah` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_masalah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menyimpan kode masalah dan nama masalah';

INSERT INTO masalah VALUES("001.A","AS BUILT DRAWING","2015-03-07 16:32:42","2015-03-07 10:32:42","ida");
INSERT INTO masalah VALUES("001.AB","PENAWARAN ","2015-03-10 10:24:07","2015-03-10 04:24:07","admin");
INSERT INTO masalah VALUES("001.AC","DOKUMEN PENGADAAN","2015-03-10 11:14:14","2015-03-10 05:14:14","admin");
INSERT INTO masalah VALUES("001.AD","BA NEGOSIASI PEKERJAAN TAMBAH KURANG","2015-03-10 13:26:21","2015-03-10 07:26:21","admin");
INSERT INTO masalah VALUES("001.AE","BA RAPAT KOORDINASI & EVALUASI","2015-03-10 13:31:49","2015-03-10 07:31:49","admin");
INSERT INTO masalah VALUES("001.AF","BA UITZET LAPANGAN","2015-03-10 13:59:22","2015-03-10 07:59:22","admin");
INSERT INTO masalah VALUES("001.AG","PCM","2015-03-10 14:21:51","2015-03-10 08:21:51","admin");
INSERT INTO masalah VALUES("001.AH","SK PENETAPAN PEKERJAAN TAMBAH KURANG","2015-03-10 14:35:18","2015-03-10 08:35:18","admin");
INSERT INTO masalah VALUES("001.AI","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","2015-03-10 15:06:25","2015-03-10 09:06:25","admin");
INSERT INTO masalah VALUES("001.AJ","BA HASIL PELELANGAN (BAHP)","2015-03-11 08:39:14","2015-03-11 02:39:14","admin");
INSERT INTO masalah VALUES("001.AK","KONTRAK","2015-03-11 08:56:06","2015-03-11 02:56:06","admin");
INSERT INTO masalah VALUES("001.AL","SPMK","2015-03-11 09:09:47","2015-03-11 03:09:47","admin");
INSERT INTO masalah VALUES("001.AM","LAPORAN","2015-03-11 10:19:42","2015-03-11 04:19:42","admin");
INSERT INTO masalah VALUES("001.AN","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA","2015-03-12 11:08:16","2015-03-12 05:08:43","admin");
INSERT INTO masalah VALUES("001.AO","PENETAPAN HASIL KUALIFIKASI","2015-03-13 13:22:12","2015-03-13 07:23:22","admin");
INSERT INTO masalah VALUES("001.B","PERJANJIAN KERJA SAMA TEKNIS","2015-03-09 08:51:14","2015-03-09 03:31:48","admin");
INSERT INTO masalah VALUES("001.C","PERSETUJUAN BIAYA","2015-03-07 14:44:06","2015-03-07 08:44:06","ida");
INSERT INTO masalah VALUES("001.D","PENGUMUMAN LELANG DG PASCAKUALIFIKASI","2015-03-09 09:36:26","2015-03-09 03:36:26","admin");
INSERT INTO masalah VALUES("001.DD","PENGUMUMAN LELANG DG PASCAKUALIFIKASI (LELANG ULANG)","2015-03-09 10:47:17","2015-03-09 04:47:17","admin");
INSERT INTO masalah VALUES("001.E","SK PENETAPAN PANITIA LELANG","2015-03-09 09:57:15","2015-03-09 04:01:10","admin");
INSERT INTO masalah VALUES("001.F","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","2015-03-09 10:11:37","2015-03-09 04:11:37","admin");
INSERT INTO masalah VALUES("001.G","ADDENDUM","2015-03-09 10:20:28","2015-03-09 05:17:47","admin");
INSERT INTO masalah VALUES("001.H","BA AANWIJZING","2015-03-09 10:28:03","2015-03-09 04:28:03","admin");
INSERT INTO masalah VALUES("001.I","BA PEMBUKAAN DOKUMEN PENAWARAN","2015-03-09 10:34:08","2015-03-09 04:34:08","admin");
INSERT INTO masalah VALUES("001.J","BA PENELITIAN DOKUMEN PENAWARAN","2015-03-09 10:39:55","2015-03-09 04:39:55","admin");
INSERT INTO masalah VALUES("001.K","PENGUMUMAN HASIL EVALUASI PENILAIAN DOKUMEN PENAWARAN","2015-03-09 11:44:18","2015-03-10 03:39:02","admin");
INSERT INTO masalah VALUES("001.L","UNDANGAN","2015-03-09 12:12:00","2015-03-09 06:12:00","admin");
INSERT INTO masalah VALUES("001.M","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","2015-03-09 13:14:48","2015-03-09 07:14:48","admin");
INSERT INTO masalah VALUES("001.N","PENETAPAN PEMENANG","2015-03-09 13:23:57","2015-03-09 07:23:57","admin");
INSERT INTO masalah VALUES("001.O","PENGUMUMAN PEMENANG","2015-03-09 13:29:17","2015-03-09 07:29:17","admin");
INSERT INTO masalah VALUES("001.P","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","2015-03-09 13:35:39","2015-03-09 07:35:39","admin");
INSERT INTO masalah VALUES("001.Q","PENGAMBILAN DOKUMEN PENGADAAN","2015-03-09 13:42:47","2015-03-09 07:42:47","admin");
INSERT INTO masalah VALUES("001.R","DETAIL ENGINEERING DETAIL (DED)","2015-03-09 15:28:55","2015-03-09 09:28:55","admin");
INSERT INTO masalah VALUES("001.S","BA EVALUASI DOKUMEN KUALIFIKASI","2015-03-10 08:12:17","2015-03-10 02:12:17","admin");
INSERT INTO masalah VALUES("001.T","BA EVALUASI DOKUMEN PENAWARAN","2015-03-10 08:17:21","2015-03-10 02:17:21","admin");
INSERT INTO masalah VALUES("001.U","BA HASIL KLARIFIKASI & NEGOSIASI","2015-03-10 08:22:24","2015-03-10 02:23:12","admin");
INSERT INTO masalah VALUES("001.V","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","2015-03-10 08:29:06","2015-03-10 02:29:06","admin");
INSERT INTO masalah VALUES("001.W","BA RAPAT PERSIAPAN","2015-03-10 08:48:14","2015-03-10 02:48:14","admin");
INSERT INTO masalah VALUES("001.X","DOKUMEN KUALIFIKASI","2015-03-10 08:54:24","2015-03-10 02:54:24","admin");
INSERT INTO masalah VALUES("001.XX","DOKUMEN PRAKUALIFIKASI","2015-03-13 08:20:39","2015-03-13 02:21:29","admin");
INSERT INTO masalah VALUES("001.Y","DOKUMEN PENAWARAN FISIK","2015-03-10 10:07:13","2015-03-10 04:07:13","admin");
INSERT INTO masalah VALUES("001.YY","DOKUMEN PENAWARAN PENGAWASAN","2015-03-11 10:46:09","2015-03-11 04:47:04","admin");
INSERT INTO masalah VALUES("001.Z","DOKUMEN PEMILIHAN","2015-03-10 08:59:33","2015-03-10 02:59:33","admin");



DROP TABLE IF EXISTS nilai_guna;

CREATE TABLE `nilai_guna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_guna` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='table untuk menyimpan kode masalah dan nama masalah';

INSERT INTO nilai_guna VALUES("1","Administrasi","2015-03-09 09:34:32","2015-03-09 09:34:32","admin");
INSERT INTO nilai_guna VALUES("2","Keuangan","2015-03-09 09:34:45","2015-03-09 09:34:45","admin");
INSERT INTO nilai_guna VALUES("3","Hukum","2015-03-09 09:34:51","2015-03-09 09:34:51","admin");
INSERT INTO nilai_guna VALUES("4","IPTEK","2015-03-09 09:35:00","2015-03-09 09:35:00","admin");



DROP TABLE IF EXISTS preferences;

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='table untuk setting preferences aplikasi (nama)';

INSERT INTO preferences VALUES("1","PT. BANK PEMBANGUNAN DAERAH JATENG");



DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='table untuk menampung user ';

INSERT INTO user VALUES("1","admin","6382d2a9202d9c8c24733dd82c102bbb","Administrator","54fd03ca7cc120.95651809","admin@admin.com","","1","1","2015-03-17 09:41:40","2015-03-09 09:22:02","2015-03-09 09:22:02","Guest");
INSERT INTO user VALUES("2","wisnu","d2336d577b0a65c25fcbc99f8bfd21ec","Wisnu Agung Pro","550516b100b9b0.30273597","wisnuagungpro@gmail.com","","2","1","2015-03-16 22:15:41","2015-03-15 12:20:49","2015-03-15 12:20:49","admin");
INSERT INTO user VALUES("3","ida","6dfab6716cc8914be5f36de8b5f84532","ida","55077d8bb21835.39338481","ida@gmail.com","","3","1","0000-00-00 00:00:00","2015-03-17 08:04:12","2015-03-17 08:04:11","admin");



DROP TABLE IF EXISTS user_level;

CREATE TABLE `user_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Untuk membuat user leveling access';

INSERT INTO user_level VALUES("1","Administrator");
INSERT INTO user_level VALUES("2","Supervisor");
INSERT INTO user_level VALUES("3","User");



DROP TABLE IF EXISTS user_log;

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `ip_host` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `access_type` varchar(255) NOT NULL,
  `by_user` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table for saved log logging user proccess';

INSERT INTO user_log VALUES("1","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-15 11:35:53");
INSERT INTO user_log VALUES("2","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-15 12:21:11");
INSERT INTO user_log VALUES("3","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","wisnu","2015-03-15 12:21:40");
INSERT INTO user_log VALUES("4","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 08:33:31");
INSERT INTO user_log VALUES("5","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 09:32:02");
INSERT INTO user_log VALUES("6","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 09:57:16");
INSERT INTO user_log VALUES("7","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 10:10:55");
INSERT INTO user_log VALUES("8","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","wisnu","2015-03-16 10:18:29");
INSERT INTO user_log VALUES("9","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 11:05:15");
INSERT INTO user_log VALUES("10","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","wisnu","2015-03-16 13:39:31");
INSERT INTO user_log VALUES("11","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-16 15:19:07");
INSERT INTO user_log VALUES("12","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","wisnu","2015-03-16 22:15:41");
INSERT INTO user_log VALUES("13","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-17 07:57:26");
INSERT INTO user_log VALUES("14","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-17 08:48:35");
INSERT INTO user_log VALUES("15","http://localhost","127.0.0.1","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-03-17 09:41:40");



DROP TABLE IF EXISTS user_profile;

CREATE TABLE `user_profile` (
  `fk_user` int(11) NOT NULL,
  `address` varchar(127) DEFAULT NULL,
  `about_me` text,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fk_user`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menampung user profile ';




