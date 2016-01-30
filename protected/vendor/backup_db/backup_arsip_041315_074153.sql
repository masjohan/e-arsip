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

INSERT INTO gudang VALUES("1","GA","Gudang A","Gudang Untuk Proyek","2015-03-07 14:20:42","2015-03-07 08:20:42","admin");



DROP TABLE IF EXISTS history_arsip;

CREATE TABLE `history_arsip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_archive` varchar(50) DEFAULT NULL,
  `action` varchar(127) DEFAULT NULL,
  `desc` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='menyimpan history arsip';




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
  `nama_klasifikasi` varchar(127) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_klasifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk menyimpan klasifikasi ';




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

INSERT INTO lajur VALUES("1","1A","1","Lajur 1 A","Proyek 5 Paket","2015-03-07 14:21:48","2015-03-07 08:21:48","admin");
INSERT INTO lajur VALUES("2","2A","1","Lajur 2 A","Proyek 5 Paket","2015-03-13 09:31:43","2015-03-13 03:32:29","admin");



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

INSERT INTO lembaga VALUES("1","001","PROYEK BANK JATENG","Madukoro A/B","2015-03-07 14:35:02","2015-03-07 08:35:02","ida");



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

INSERT INTO nilai_guna VALUES("1","Administrasi","2015-03-07 14:23:54","2015-03-07 08:23:54","admin");
INSERT INTO nilai_guna VALUES("2","Keuangan","2015-03-07 14:24:16","2015-03-07 08:24:16","admin");
INSERT INTO nilai_guna VALUES("3","Hukum","2015-03-07 14:24:41","2015-03-07 08:24:41","admin");
INSERT INTO nilai_guna VALUES("4","IPTEK","2015-03-07 14:25:00","2015-03-07 08:25:00","admin");



DROP TABLE IF EXISTS preferences;

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO preferences VALUES("1","PT. BANK PEMBANGUNAN DAERAH BANK JATENG");



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
  `status` tinyint(4) NOT NULL,
  `last_login` varchar(50) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `by_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_level` (`fk_level`),
  CONSTRAINT `FK1_user_level` FOREIGN KEY (`fk_level`) REFERENCES `user_level` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO user VALUES("1","admin","c188b71b17ebd89851edafe5026c4558","Administrator","54faa5fcebc720.64237982","admin@admin.com","","1","1","2015-04-13 07:40:23","2015-03-07 14:17:16","2015-03-07 08:17:16","Guest");
INSERT INTO user VALUES("2","ida","357f5266eaa21b30e61a0fb1f4d3e134","Ida","54faa8448e5d73.13451668","ida@gmail.com","","3","1","2015-04-11 10:26:18","2015-03-07 14:27:00","2015-03-07 08:27:00","admin");
INSERT INTO user VALUES("3","nanto","4028151eb938a95f0ec3405d685ab7fc","Sriwiharnanto","54fab5dd9719d9.83261537","nanto@gmail.com","","2","1","","2015-03-07 15:25:01","2015-03-07 09:25:01","admin");



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
  `ip_host` varchar(50) DEFAULT NULL,
  `user_agent` text,
  `access_type` text,
  `by_user` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table untuk mencatat log hisory user login';

INSERT INTO user_log VALUES("1","http://localhost","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","admin","2015-04-11 10:23:12","127.0.0.1");
INSERT INTO user_log VALUES("2","http://localhost","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","ida","2015-04-11 10:24:18","127.0.0.1");
INSERT INTO user_log VALUES("3","http://localhost","Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8","ida","2015-04-11 10:26:18","127.0.0.1");
INSERT INTO user_log VALUES("4","http://10.42.0.1","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36","text/html, */*; q=0.01","admin","2015-04-13 07:40:24","10.42.0.59");



DROP TABLE IF EXISTS user_profile;

CREATE TABLE `user_profile` (
  `fk_user` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `about_me` text,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fk_user`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `FK1_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO user_profile VALUES("2","JL. Inon Giri","inputan","skipper.jpg");




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

INSERT INTO arsipnew VALUES("1","GA/1A/BA.1/001/1","1","1","1","1","1","MEKANIKAL ELEKTRIKAL.pdf","051","","0","","Bank Jateng","0000-00-00","10","2011","Laporan","T","","AS BUILT DRAWING"," As Built Drawing Mekanikal Elektrikal Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno","001.A","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-09 09:00:42","2015-03-09 03:05:29","admin","1","1","admin");
INSERT INTO arsipnew VALUES("2","GA/1A/BA.1/001/2","1","1","1","1","2","STRUKTUR.pdf","051","","0","","proyek","0000-00-00","10","2011","Laporan","T","","AS BUILT DRAWING","As Built Drawing Struktur Proyek Pembangunan Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno","001.A","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-09 09:08:36","2015-03-09 03:08:35","admin","1","2","admin");
INSERT INTO arsipnew VALUES("3","GA/1A/BA.1/001/3","1","1","1","1","3","PERJANJIAN KERJASAMA TEKNIS.PDF","027.2","","0","","proyek","0000-00-00","7","2013","Kontrak","T","","PERJANJIAN KERJA SAMA TEKNIS","Kontrak Perjanjian Kerja Sama Teknis antara PT. Bank Pembangunan Daerah Jawa Tengah dengan Dinas Cipta karya dan Tata Ruang tentang  Penyelenggaran Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa  Tengah No. 5680/HT.01.04/UM/2013 pada tanggal 24 Juli 2013","001.B","1","9","10","2023","2023-07-01","","0","1","Copy","","1","2015-03-09 09:32:33","2015-03-09 03:32:33","admin","1","3","admin");
INSERT INTO arsipnew VALUES("4","GA/1A/BA.1/001/4","1","1","1","1","4","PENGUMUMAN LELANG DG PASACAKUALIFIKASI.pdf","027","","0","","proyek","0000-00-00","8","2013","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI","Surat Pengumuman Pelelangan dengan Pascakualifikasi Nomor 028/KEG.BPD8/8/2013 pada tanggal 28 Agustus 2013 untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.D","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-09 09:40:43","2015-03-11 08:16:37","admin","1","4","admin");
INSERT INTO arsipnew VALUES("5","GA/1A/BA.1/001/5","1","1","1","1","5","PENGUMUMAN LELANG SUARA MERDEKA.pdf","027","","0","","proyek","0000-00-00","8","2015","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI","Pengumanan Lelang dengan Pascakualifikasi di Suara Merdeka pada tanggal 21 Agustus 2013","001.D","1","9","10","2025","2025-08-01","","0","1","Copy","","1","2015-03-09 09:47:52","2015-03-09 03:49:32","admin","1","5","admin");
INSERT INTO arsipnew VALUES("6","GA/1A/BA.1/001/6","1","1","1","1","6","SK PEMBENTUKAN PANITIA PENGADAAN JASA.pdf","027","","0","","proyek","0000-00-00","8","2013","Surat","T","","SK PENETAPAN PANITIA LELANG","SK Pemimpin Kegiatan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah No. 020/KEG.BPD8/8/2013 tentang Pembentukan Panitia Pengadaan Jasa Konstruksi dan Konsultasi Pengawasan pada Kegiatan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah pada tanggal 01 Agustus 2013","001.E","1","9","10","2023","2023-08-01","","0","3","Copy","","1","2015-03-09 10:03:30","2015-03-11 08:17:55","admin","1","6","admin");
INSERT INTO arsipnew VALUES("7","GA/1A/BA.1/001/7","1","1","1","1","8","PENDAFTARAN PESERTA LELANG.pdf","027","","0","","proyek","0000-00-00","8","2013","Laporan","T","14258709000_PEMASUKAN DOKUMEN PENAWARAN.PDF","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pendaftaran Peserta Lelang dan Pemasukan Dokumen Penawaran pada bulan Agustus-September 2013 Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri","001.F","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-09 10:15:00","2015-03-11 08:18:15","admin","1","7","admin");
INSERT INTO arsipnew VALUES("8","GA/1A/BA.1/001/8","1","1","1","1","9","ADDEDUM II DOKUMEN PENGADAAN.pdf","027.2","","0","","proyek","0000-00-00","9","2013","Kontrak","T","","ADDENDUM","Addendum II Dokumen Pengadaan Pekerjaan Pembangunan Gedung Kantor Cabang Pembantu Baturetno Wonogiri Tahun Anggaran 2013 pada tanggal 06 September 2013","001.G","1","9","10","2023","2023-09-01","","0","3","Copy","","1","2015-03-09 10:21:29","2015-03-09 05:35:00","admin","1","8","admin");
INSERT INTO arsipnew VALUES("9","GA/1A/BA.1/001/9","1","1","1","1","10","BA RAPAT PENJELASAN PEKERJAAN TAHAP II.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","14258717940_GAMBAR.pdf","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwijzing) Tahap II Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Cabang Pembantu Baturetno, Wonogiri Nomor 040/KEG.BDP8/9/2013 pada tanggal 06 September 2013","001.H","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-09 10:29:54","2015-03-11 08:18:52","admin","1","9","admin");
INSERT INTO arsipnew VALUES("10","GA/1A/BA.1/001/0","1","1","1","1","11","BA PEMBUKAAN DOK. PENAWARAN SAMPUL I.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul I Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri Nomor 046/KEG.BPD8/9/2013 pada tanggal 10 September 2013","001.I","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-09 10:36:33","2015-03-09 05:47:17","admin","1","10","admin");
INSERT INTO arsipnew VALUES("11","GA/1A/BA.1/001/1","1","1","1","1","121212","BA PENELITIAN DOK. PENAWARAN SAMPUL I.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA PENELITIAN DOKUMEN PENAWARAN","Berita Acara Penelitian Dokumen Penawaran Sampul I Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Cabang Pembantu Baturetno, Wonogiri Nomor 092/KEG.BPD8/10/2013 pada tanggal 29 Oktober 2013","001.J","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-09 10:40:47","2015-03-09 05:48:25","admin","1","11","admin");
INSERT INTO arsipnew VALUES("12","GA/1A/BA.1/001/12","1","1","1","1","12","PENGUMUMAN PELELANGAN ULANG UMUM DG PASCAKUALIFIKA","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI (LELANG ULANG)","Pengumuman Pelelangan Umum (Ulang) dengan Pascakualifikasi Nomor 074/KEG.BPD8/10/2013 pada tanggal 16 Oktober 2013","001.DD","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 10:48:45","2015-03-09 04:48:44","admin","1","12","admin");
INSERT INTO arsipnew VALUES("13","GA/1A/BA.1/001/13","1","1","1","1","13","PENGUMUMAN LELANG SUARA MERDEKA.pdf","027","","0","","proyek","0000-00-00","10","2013","Laporan","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI (LELANG ULANG)","Pengumuman Pelelangan Umum dengan Pascakualifikasi di Suara Merdeka pada tanggal 16 Oktober 2013","001.DD","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-09 10:55:52","2015-03-09 04:55:52","admin","1","13","admin");
INSERT INTO arsipnew VALUES("14","GA/1A/BA.1/001/4","1","1","1","1","14","PENDAFTARAN PESERTA LELANG 1.pdf","027","","0","","proyek","0000-00-00","10","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pendaftaran Peserta Lelang pada bulan Oktober Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri","001.F","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 11:06:25","2015-03-11 08:19:39","admin","1","14","admin");
INSERT INTO arsipnew VALUES("15","GA/1A/BA.1/001/5","1","1","1","1","33333","PERSETUJUAN BIAYA PEMB. GEDUNG.PDF","027.2","","0","","Proyek","0000-00-00","7","2013","Surat","T","","PERSETUJUAN BIAYA","Persetujuan biaya Pembangunan Gedung No 5773/UM.01.02/2013 Bulan Juli 2013
\n","001.C","1","9","10","2023","2023-07-01","","0","2","Copy","","1","2015-03-07 14:45:24","2015-03-09 03:13:20","ida","2","1","admin");
INSERT INTO arsipnew VALUES("16","GA/1A/BA.1/001/6","1","1","1","1","16","BA RAPAT PENJELASAN PEK. (AANWIJZING).PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","14258751000_BOQ.pdf","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwijzing) Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri  Nomor 078/KEG.BPD8/10/2013 pada tanggal 22 Oktober 2013","001.H","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 11:25:00","2015-03-09 05:51:29","admin","1","16","admin");
INSERT INTO arsipnew VALUES("17","GA/1A/BA.1/001/7","1","1","1","1","17","BA PEMB. DOK. PENAWARAN SAMPUL I.PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul I Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri Nomor 082/KEG.BPD8/10/2013 pada tanggal 28 Oktober 2013","001.I","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 11:34:10","2015-03-09 05:52:08","admin","1","17","admin");
INSERT INTO arsipnew VALUES("18","GA/1A/BA.1/001/18","1","1","1","1","18","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENGUMAN HASIL EVALUASI PENILAIAN DOKUMEN PENAWARAN","Pengumuman Hasil Evaluasi Penilaian Dokumen Penawaran Sampul I Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Cabang Pembantu Baturetno, Wonogiri Nomor 101/KEG.BPD8/11/2013 pada tanggal 07 Nopember 2013","001.K","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-09 11:44:57","2015-03-09 05:44:57","admin","1","18","admin");
INSERT INTO arsipnew VALUES("19","GA/1A/BA.1/001/19","1","1","1","1","19","BA DOK PENAW SAMPUL II.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul II Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri Nomor 106/KEG.BPD.8/11/2013 pada tanggal 11 Nopember 2013","001.I","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 11:58:12","2015-03-09 05:58:11","admin","1","19","admin");
INSERT INTO arsipnew VALUES("20","GA/1A/BA.1/001/0","1","1","1","1","20","BA PEN DOK. PENAWARAN SAMPUL II.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","14258775280_LK NILAI BIAYA CV NADU WIJAYA.PDF,14258775281_LK NILAI BIAYA CV. SARANA WIJAYA.PDF,14258775282_LK PENILAIAN BIAYA CV. GIRI JATI.PDF","BA PENELITIAN DOKUMEN PENAWARAN","Berita Acara Penelitian Dokumen Penawaran Sampul II Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri Nomor 106.1/KEG.BPD/11/2013 pada tanggal 11 Nopember 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 12:05:28","2015-03-09 06:05:28","admin","1","20","admin");
INSERT INTO arsipnew VALUES("21","GA/1A/BA.1/001/21","1","1","1","1","21","UNDAGAN CV. NADU WIJAYA.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Nomor 104.1/KEG.BPD8/11/2013 pada tanggal 08 November 2013 terhadap CV. Naduwijaya untuk mengikuti Pembukaan Dokumen Penawaran Sampul II","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 12:14:21","2015-03-09 06:14:21","admin","1","21","admin");
INSERT INTO arsipnew VALUES("22","GA/1A/BA.1/001/22","1","1","1","1","23","UNDANGAN CV. GIRI JATI.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Nomor 104.3/KEG.BPD8/11/2013 pada tanggal 08 November 2013 terhadapa CV. GIRI JATI untuk mengikuti Pembukaan Dokumen Penawaran Sampul II ","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 12:24:46","2015-03-09 06:24:46","admin","1","22","admin");
INSERT INTO arsipnew VALUES("23","GA/1A/BA.1/001/23","1","1","1","1","24","UNDANGAN CV. SARANA WIJAYA.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Nomor 104.2/KEG.BPD8/11/2013 pada tanggal 08 Novermber 2013 terhdapan CV. SARANA WIJAYA untuk mengikuti Pembukaan Dokumen Penawaran Sampul II ","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 12:28:25","2015-03-09 06:28:25","admin","1","23","admin");
INSERT INTO arsipnew VALUES("24","GA/1A/BA.1/001/24","1","1","1","1","25","BA PEMBUKTIAN DOK. KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Nomor 111.3/KEG.BPD8/11/2013 pada tanggal 13 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 13:15:29","2015-03-09 07:15:29","admin","1","24","admin");
INSERT INTO arsipnew VALUES("25","GA/1A/BA.1/001/25","1","1","1","1","3512121","PENETAPAN PEMENANG.PDF","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno, Wonogiri Tahun Anggaran 2013 Nomor 116/KEG.BPD8/2013 pada tanggal 15 November 2013","001.N","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-09 13:24:30","2015-03-09 07:24:30","admin","1","25","admin");
INSERT INTO arsipnew VALUES("26","GA/1A/BA.1/001/26","1","1","1","1","3614141","PENGUMUMAN PEMENANG.PDF","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENGUMUMAN PEMENANG","Pengumuman Pemenang Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Nomor 119/KEG.BPD8/11/2013 pada tanggal 19 November 2013","001.O","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-09 13:30:01","2015-03-09 07:30:01","admin","1","26","admin");
INSERT INTO arsipnew VALUES("27","GA/1A/BA.1/001/27","1","1","1","1","27","SPPBJ.PDF","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Barang/Jasa (SPPBJ) Pembangunan Gedung Kantor Capem Baturetno Womnogiri PT. Bank Pembangunan Daerah Jawa Tengah Nomor 122/KEG.BPD8/11/2013 pada tanggal 27 November 2013","001.P","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 13:36:14","2015-03-09 07:36:14","admin","1","27","admin");
INSERT INTO arsipnew VALUES("28","GA/1A/BA.1/001/28","1","1","1","1","28","PENGAMBILAN DOKUMEN PENGADAAN (PELELANGAN ULANG).p","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","PENGAMBILAN DOKUMEN PENGADAAN","Pengambilan Dokumen Pengadaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.Q","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 13:43:17","2015-03-09 07:43:17","admin","1","28","admin");
INSERT INTO arsipnew VALUES("29","GA/1A/BA.1/001/29","1","1","1","1","29","UNDANGAN CV. BAYU SAKTI.pdf","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Pemasukan Dokumen Penawaran CV. BAYU SAKTI  Nomor 080/KEG.BPD8/10/2013 pada tanggal 25 Oktober 2013 ","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 13:58:17","2015-03-09 07:58:17","admin","1","29","admin");
INSERT INTO arsipnew VALUES("30","GA/1A/BA.1/001/30","1","1","1","1","30","UNDANGAN CV. GIRI JATI.pdf","005","","0","","Proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Pemasukan Dokumen Penawaran CV. GIRI JATI Nomor 080/KEG.BPD8/10/2013 pada tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 14:04:18","2015-03-09 08:04:18","admin","1","30","admin");
INSERT INTO arsipnew VALUES("31","GA/1A/BA.1/001/31","1","1","1","1","31","UNDANGAN CV. WIDYA BAKTI UTAMA.pdf","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Pemasukan Dokumen Penawaran CV. WIDYA BAKTI UTAMA Nomor 080/KEG.BPD8/10/2013 pada tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 14:06:33","2015-03-09 08:06:33","admin","1","31","admin");
INSERT INTO arsipnew VALUES("32","GA/1A/BA.1/001/32","1","1","1","1","32","UNDANGAN NADUWIJAYA.pdf","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Pemasukan Dokumen Penawaran CV. NADUWIJAYA Nomor 080/KEG.BPD8/10/2013 pada tanggal 25 Oktober 2015","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 14:08:32","2015-03-09 08:08:32","admin","1","32","admin");
INSERT INTO arsipnew VALUES("33","GA/1A/BA.1/001/33","1","1","1","1","33","UNGADAN CV. BELLA.pdf","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Pemasukan Dokumen Penawaran CV. BELLA Nomor 080/KEG.BPD8/10/2013 pada tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-09 14:10:56","2015-03-09 08:10:56","admin","1","33","admin");
INSERT INTO arsipnew VALUES("34","GA/1A/BA.1/001/4","1","1","1","1","34","PENELITIAN DOKUMEN PENAWARAN CV. GIRI JATI.pdf","027.1","","0","","proyek","0000-00-00","11","2015","Laporan","T","14258858140_LEMBAR KERJA PENILAIAN TEKNIS CV, GIRI JATI.pdf","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. GIRI JATI Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 pada tanggal 11 NOvember 2013","001.J","1","9","10","2025","2025-11-01","","0","1","Asli","","1","2015-03-09 14:23:34","2015-03-09 08:23:34","admin","1","34","admin");
INSERT INTO arsipnew VALUES("35","GA/1A/BA.1/001/5","1","1","1","1","35","PENELITIAN DOKUMEN PENAWARAN CV. NADUWIJAYA.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","14258862880_LEMBAR KERJA PENIALIAN TEKNIS CV. NADUWIJAYA.pdf","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. NADUWIJAYA Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2011 pada tanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 14:31:28","2015-03-09 08:31:28","admin","1","35","admin");
INSERT INTO arsipnew VALUES("36","GA/1A/BA.1/001/6","1","1","1","1","36","PENELITIAN DOKUMEN PENAWARAN CV. SARANA WIJAYA.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","14258865120_LEMBAR KERJA PENILAIAN TEKNIS CV, SARANA WIJAYA.pdf","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Sama Penilaian Teknis CV. SARANA WIJAYA Proyek Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Jawa Tengah pada tanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 14:35:12","2015-03-09 08:35:12","admin","1","36","admin");
INSERT INTO arsipnew VALUES("37","GA/1A/BA.1/001/7","1","1","1","1","37","BERITA ACARA PEMBUKTIAN DOK. KUALIFIKASI CV. GIRI ","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Sama Penilaian Teknis CV. GIRI JATI Proyek Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Jawa Tengah pada tanggal 11 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 14:47:18","2015-03-09 08:54:26","admin","1","37","admin");
INSERT INTO arsipnew VALUES("38","GA/1A/BA.1/001/38","1","1","1","1","38","BERITA ACARA PEMBUKTIAN DOK. KUALIFIKASI CV. NADUW","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi CV. NADUWIJAYA Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Nomor 111.1/KEG.BPD8/11/2013 pada tanggal 13 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-09 14:53:59","2015-03-09 08:53:59","admin","1","38","admin");
INSERT INTO arsipnew VALUES("39","GA/1A/BA.1/001/9","1","1","1","1","39","(1) BERITA ACARA RAPAT PENJELASAN PEKERJAAAN (AANW","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwizjing) Tahap II Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 
\nNomor 048/KEG.BPD8/9/2013 pada tanggal 02 September 2013","001.H","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-09 15:11:25","2015-03-09 09:19:08","admin","1","39","admin");
INSERT INTO arsipnew VALUES("40","GA/1A/BA.1/001/40","1","1","1","1","40","ARSITEKTUR.pdf","051","","0","","proyek","0000-00-00","10","2011","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Detail (DED) Arsitektur Proyek Pembangunan Gedung Kantor Capem Baturetno PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013","001.R","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-09 15:31:53","2015-03-09 09:31:53","admin","1","40","admin");
INSERT INTO arsipnew VALUES("41","GA/1A/BA.1/001/41","1","1","1","1","41","MEKANIKAL ELEKTRIKAL.pdf","051","","0","","Proyek","0000-00-00","10","2011","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Detail (DED) Mekanikal Elektrikal Proyek Pembangunan Gedung Kantor Capem Baturetno PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013","001.R","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-09 15:35:12","2015-03-09 09:35:12","admin","1","41","admin");
INSERT INTO arsipnew VALUES("42","GA/1A/BA.1/001/42","1","1","1","1","42","STRUKTUR.pdf","051","","0","","proyek","0000-00-00","10","2011","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detai Engineering Detail (DED) Struktur Proyek Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Jawa Tengah Tahun Anggran 2013 ","001.R","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-09 15:38:17","2015-03-09 09:38:17","admin","1","42","admin");
INSERT INTO arsipnew VALUES("43","GA/1A/BA.1/001/43","1","1","1","1","43","BA EVALUASI DOK KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Berita Acara Evaluasi Dokumen Kualifikasi Pekerjaan Pengasawan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013 
\nNomor 05/AWS-III/BPD8/11/2013 pada tanggal 07 November 2013","001.S","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:12:46","2015-03-10 02:12:46","admin","1","43","admin");
INSERT INTO arsipnew VALUES("44","GA/1A/BA.1/001/44","1","1","1","1","44","BA EVALUASI DOK PENAWARAN.pdf","027.1","","0","","Proyek","0000-00-00","11","2013","Surat","T","","BA EVALUASI DOKUMEN PENAWARAN","Berita Acara Evaluasi Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jateng Tahun Anggaran 2013
\nNomor 11/AWS-III.BPD8/11/2013 pada tanggal 09 November 2013","001.T","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-10 08:18:24","2015-03-10 02:18:24","admin","1","44","admin");
INSERT INTO arsipnew VALUES("45","GA/1A/BA.1/001/45","1","1","1","1","45","BA HASIL KLARIFIKASI & NEGOSIASI DOK. PENAWARAN.pd","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL KLARIFIKASI & NEGOSIASI","Berita Acara Hasil Klarifikasi dan Negosiasi Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 
\nNomor 13/AWS-II.BPD8/11/2013","001.U","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:24:11","2015-03-10 02:24:11","admin","1","45","admin");
INSERT INTO arsipnew VALUES("46","GA/1A/BA.1/001/6","1","1","1","1","46","BA HASIL PENUNJUKAN LANGSUNG.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Berita Acara Hasil Penunjukan Langsung (BAHPL) Pekerjaan Pengawasan Pembangunan Gedung kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 14/AWS-III.BPD8/11/2013 pada tanggal 27 November 2013","001.V","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:30:20","2015-03-11 03:30:01","admin","1","46","admin");
INSERT INTO arsipnew VALUES("47","GA/1A/BA.1/001/47","1","1","1","1","47","BA PEMB DOK PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013
\nNomor 10/AWS-III.BPD8/11/2013 pada tanggal 15 November 2013","001.I","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:34:28","2015-03-10 02:34:27","admin","1","47","admin");
INSERT INTO arsipnew VALUES("48","GA/1A/BA.1/001/48","1","1","1","1","48","BA PENJELASAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA AANWIJZING","Berita Acara Penjelasan Pekerjaan (Aanwijzing)  Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 09/AWS-III.BPD8/11/2013 pada tanggal 11 November 2013","001.H","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:39:36","2015-03-10 02:39:36","admin","1","48","admin");
INSERT INTO arsipnew VALUES("49","GA/1A/BA.1/001/49","1","1","1","1","49","BA RAPAT PEMBUKTIAN DOK. KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Rapat Pembuktian Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 07/AWS-III.BPD8/11/2013 pada tanggal 08 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 08:43:55","2015-03-10 02:43:55","admin","1","49","admin");
INSERT INTO arsipnew VALUES("50","GA/1A/BA.1/001/50","1","1","1","1","50","BA RAPAT PERSIAPAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","BA RAPAT PERSIAPAN","Berita Acara Rapat Persiapan Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetbo Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 01.1/AWS-BPD8/8/2013 pada tanggal 19 Agustus 2013","001.W","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-10 08:48:53","2015-03-10 02:48:53","admin","1","50","admin");
INSERT INTO arsipnew VALUES("51","GA/1A/BA.1/001/51","1","1","1","1","51","DOKUMEN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN KUALIFIKASI","Dokumen Kualifikasi Nomor 01/AWS-III.BPD8/8/2013 tanggal 19 Agustus 2013 untuk Pekerjaan Jasa Konsultasi Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.X","1","9","10","2023","2023-08-01","","0","3","Asli","","1","2015-03-10 08:55:45","2015-03-10 02:55:45","admin","1","51","admin");
INSERT INTO arsipnew VALUES("52","GA/1A/BA.1/001/52","1","1","1","1","52","DOKUMEN PEMILIHAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN PEMILIHAN","Dokumen Pemilihan Nomor 02/AWS-III.BPD8/8/2013 pada tanggal 19 Agustus 2013 untuk pengadaan Jasa Konsultasi Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.Z","1","9","10","2023","2023-08-01","","0","3","Asli","","1","2015-03-10 09:00:24","2015-03-10 03:00:24","admin","1","52","admin");
INSERT INTO arsipnew VALUES("53","GA/1A/BA.1/001/53","1","1","1","1","53","EVALUASI DOKUMEN KAULIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Evaluasi Dokumen Kualifikasi Penyedia Jasa Konsultasi Pengawasan Pembangaunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.S","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:07:02","2015-03-10 03:07:02","admin","1","53","admin");
INSERT INTO arsipnew VALUES("54","GA/1A/BA.1/001/54","1","1","1","1","54","JADWAL PENUNJUKAN LANGSUNG.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Jadwal Penunjukan Langsung Jasa Konsultasi Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Jawa Tengah Tahun Anggaran 2013 
\ntanggal 09 September 2013","001.V","1","9","10","2023","2023-09-01","","0","1","Copy","","1","2015-03-10 09:11:57","2015-03-10 03:11:57","admin","1","54","admin");
INSERT INTO arsipnew VALUES("55","GA/1A/BA.1/001/55","1","1","1","1","55","PENELITIAN DAN PENILAIAN DOK. ADMINISTRASI DAN TEK","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA EVALUASI DOKUMEN PENAWARAN","Peneliltian dan Penilaian Dokumen Administrasi dan Teknis Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.T","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:18:41","2015-03-10 03:18:40","admin","1","55","admin");
INSERT INTO arsipnew VALUES("56","GA/1A/BA.1/001/56","1","1","1","1","56","PENETAPAN HASIL KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penetapan Hasil Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013
\nNomor 8/AWS-III.BPD8/11/2013 tanggal 08 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:25:10","2015-03-10 03:25:10","admin","1","56","admin");
INSERT INTO arsipnew VALUES("57","GA/1A/BA.1/001/57","1","1","1","1","57","PENETAPAN PEMENANG.pdf","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013
\nNomor 15/AWS-III.BPD8/11/2013 tanggal 29 November 2013","001.N","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:31:52","2015-03-10 03:31:52","admin","1","57","admin");
INSERT INTO arsipnew VALUES("58","GA/1A/BA.1/001/58","1","1","1","1","58","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA 21.pd","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Pengumuman Penunjukan Langsung Penyedia Jasa Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 16/AWS-BPD8/11/2013 tanggal 29 November 2013","001.V","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:41:12","2015-03-10 03:41:12","admin","1","58","admin");
INSERT INTO arsipnew VALUES("59","GA/1A/BA.1/001/59","1","1","1","1","59","SURAT PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Penunjukan Langsung Penyedia Jasa KOnsultasi Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 03/AWS-III.BPD8/10/2013 tanggal 30 Oktober 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:46:08","2015-03-10 03:46:08","admin","1","59","admin");
INSERT INTO arsipnew VALUES("60","GA/1A/BA.1/001/60","1","1","1","1","60","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Udangan Klarifikasi dan Negosiasi Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 12/AWS-III.BPD8/11/2013 tanggal 21 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:50:51","2015-03-10 03:50:51","admin","1","60","admin");
INSERT INTO arsipnew VALUES("61","GA/1A/BA.1/001/61","1","1","1","1","61","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Pembuktian Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 06/AWS-III.BPD8/11/2013 tanggal 07 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-10 09:54:18","2015-03-10 03:54:18","admin","1","61","admin");
INSERT INTO arsipnew VALUES("62","GA/1A/BA.1/001/62","1","1","1","1","62","ANALISA HARGA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Analisa Harga Satuan Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 oleh CV. SARANA WIJAYA","001.Y","1","9","10","2023","2023-10-01","","0","2","Copy","","1","2015-03-10 10:08:05","2015-03-10 04:08:05","admin","1","62","admin");
INSERT INTO arsipnew VALUES("63","GA/1A/BA.1/001/63","1","1","1","1","63","DAFTAR HARGA SATUAN BAHAN ATAU UPAH.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Bahan Atau Upah Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 10:11:34","2015-03-10 04:11:34","admin","1","63","admin");
INSERT INTO arsipnew VALUES("64","GA/1A/BA.1/001/64","1","1","1","1","64","DAFTAR HARGA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 10:17:47","2015-03-10 04:17:47","admin","1","64","admin");
INSERT INTO arsipnew VALUES("65","GA/1A/BA.1/001/65","1","1","1","1","65","PENAWARAN PEKERJAAN.pdf","021.2","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENAWARAN ","Surat Penawaran Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 063/SW-SMG/X/2013 tanggal 28 Oktober 2013","001.AB","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 10:25:09","2015-03-10 04:25:09","admin","1","65","admin");
INSERT INTO arsipnew VALUES("66","GA/1A/BA.1/001/66","1","1","1","1","66","REKAP RENCANA ANGGARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Rekapitulasi Rencana Anggaran Biaya Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 oleh CV. SARANA WIJAYA tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 10:29:19","2015-03-10 04:29:19","admin","1","66","admin");
INSERT INTO arsipnew VALUES("67","GA/1A/BA.1/001/67","1","1","1","1","67","RENCANA ANGGARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Rencana Anggaran Biaya Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 oleh CV. SARANA WIJAYA tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 10:32:08","2015-03-10 04:32:08","admin","1","67","admin");
INSERT INTO arsipnew VALUES("68","GA/1A/BA.1/001/68","1","1","1","1","68","DOKUMEN PENGADAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","DOKUMEN PENGADAAN","Dokumen Pengadaan Nomor 072.1/KEG.BPD8/10/2013 tanggal 11 Oktober 2013 untuk Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.AC","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-10 11:14:56","2015-03-10 05:14:56","admin","1","68","admin");
INSERT INTO arsipnew VALUES("69","GA/1A/BA.1/001/69","1","1","1","1","69","DOKUMEN KUALIFIKASI 2.pdf","027.2","","0","","proyek","0000-00-00","3","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Dokumen Kualifikasi CV. SARANA WIJAYA berisi tentang Pakta Intregritas dan Formulir Isian Kualifikasi ","001.Y","1","9","10","2023","2023-03-01","","0","1","Copy","","1","2015-03-10 13:18:43","2015-03-10 07:18:43","admin","1","69","admin");
INSERT INTO arsipnew VALUES("70","GA/1A/BA.1/001/70","1","1","1","1","70","BA NEGOSIASI PEKERJAAN TAMBAH KURANG.pdf","027.1","","0","","proyek","0000-00-00","4","2014","Surat","T","","BA NEGOSIASI PEKERJAAN TAMBAH KURANG","Berita Acara Negosiasi Pekerjaan Tambah Kurang Pembangaunan Gedung Kantor Capem baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa tengah Tahun Anggaran 2013
\nNomor 198/.KEG.BPD8/04/2014 tanggal 02 April 2014","001.AD","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-10 13:27:01","2015-03-10 07:27:00","admin","1","70","admin");
INSERT INTO arsipnew VALUES("71","GA/1A/BA.1/001/71","1","1","1","1","71","BA RAKOR  EVALUASI 1.pdf","027.9","","0","","proyek","0000-00-00","3","2014","Surat","T","","BA RAPAT KOORDINASI & EVALUASI","Berita Acara Rapat Koordinasi dan Evaluasi Ke 1 Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggran 2013
\nNomor 13/AG-BARKE/III/2014 tanggal 15 Maret 2014","001.AE","1","9","10","2024","2024-03-01","","0","1","Copy","","1","2015-03-10 13:32:29","2015-03-10 07:32:29","admin","1","71","admin");
INSERT INTO arsipnew VALUES("72","GA/1A/BA.1/001/72","1","1","1","1","72","BA RAKOR EVALUASI 2 DAN DAFTAR HADIR 27 MARET 2014","027.9","","0","","proyek","0000-00-00","3","2014","Surat","T","","BA RAPAT KOORDINASI & EVALUASI","Berita Acara Rapat Koordinasi dan Evaluasi Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 27/AG-BARKE/III/2014 tanggal 27 Maret 2014","001.AE","1","9","10","2024","2024-03-01","","0","1","Copy","","1","2015-03-10 13:37:05","2015-03-10 07:37:05","admin","1","72","admin");
INSERT INTO arsipnew VALUES("73","GA/1A/BA.1/001/73","1","1","1","1","73","BA RAKOR EVALUASI 2 DAN DAFTAR HADIR.pdf","027.9","","0","","proyek","0000-00-00","2","2014","Surat","T","","BA RAPAT KOORDINASI & EVALUASI","Berita Acara Rapat Koordinasi dan Evaluasi Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Angggaran 2013
\nNomor 11/AG-BARKE/II/2014 tanggal 12 Februari 2014","001.AE","1","9","10","2024","2024-02-01","","0","1","Copy","","1","2015-03-10 13:40:36","2015-03-10 07:40:36","admin","1","73","admin");
INSERT INTO arsipnew VALUES("74","GA/1A/BA.1/001/74","1","1","1","1","74","BA RAKOR EVALUASI 2.pdf","027.9","","0","","proyek","0000-00-00","4","2014","Surat","T","","BA RAPAT KOORDINASI & EVALUASI","Berita Acara Rapat Koordinasi dan Evaluasi Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 08/AG-BARKE/IV/2014 tanggal 04 April 2014","001.AE","1","9","10","2024","2024-04-01","","0","1","Copy","","1","2015-03-10 13:43:32","2015-03-10 07:43:32","admin","1","74","admin");
INSERT INTO arsipnew VALUES("75","GA/1A/BA.1/001/75","1","1","1","1","75","BA UITZET.pdf","027.1","","0","","proyek","0000-00-00","12","2013","Surat","T","","BA UITZET LAPANGAN","Berita Acara Uitzet/Pengukuran Ulang Lapangan Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 tanggal 12 Desember 2013","001.AF","1","9","10","2023","2023-12-01","","0","1","Copy","","1","2015-03-10 13:59:57","2015-03-10 07:59:56","admin","1","75","admin");
INSERT INTO arsipnew VALUES("76","GA/1A/BA.1/001/76","1","1","1","1","76","PCM.pdf","027.9","","0","","proyek","0000-00-00","12","2013","Laporan","T","","PCM","PCM Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 tanggal 20 Desember 2013","001.AG","1","9","10","2023","2023-12-01","","0","1","Copy","","1","2015-03-10 14:22:18","2015-03-10 08:22:18","admin","1","76","admin");
INSERT INTO arsipnew VALUES("77","GA/1A/BA.1/001/77","1","1","1","1","77","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA TAMBAH KUR","027.1","","0","","proyek","0000-00-00","4","2014","Laporan","T","","BA NEGOSIASI PEKERJAAN TAMBAH KURANG","Rekapitulasi Perhitungan Anggaran Biaya Tambah Kurang (Hasil Negosiasi) Pekerjaan Pembangunan Gedung Kantor Capem Baturetno PT. Bank Pembangunan Jawa Tengah Tahun Anggaran 2013
\nNomor 198/KEG.BPD8/4/2014 tanggal 02 April 2014","001.AD","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-10 14:26:30","2015-03-10 08:26:30","admin","1","77","admin");
INSERT INTO arsipnew VALUES("78","GA/1A/BA.1/001/78","1","1","1","1","78","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA TAMBAH KUR","027.1","","0","","proyek","0000-00-00","3","2014","Laporan","T","","ADDENDUM","Rekapitulasi Perhitungan Anggaran Biaya Tambah Kurang Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 22/IV-SW/2014 tanggal 24 Maret 2014","001.G","1","9","10","2024","2024-03-01","","0","1","Asli","","1","2015-03-10 14:30:04","2015-03-10 08:30:04","admin","1","78","admin");
INSERT INTO arsipnew VALUES("79","GA/1A/BA.1/001/79","1","1","1","1","79","SK PEMIMPIN KEGIATAN PEMBANGUNAN.pdf","027.1","","0","","proyek","0000-00-00","4","2014","Kontrak","T","","SK PENETAPAN PEKERJAAN TAMBAH KURANG","SK Nomor 218/KEG.BPD8/4/2014 tanggal 29 April 2014 tentang Penetapan Pekerjaan Tambah Kurang pada Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.AH","1","9","10","2024","2024-04-01","","0","3","Asli","","1","2015-03-10 14:35:52","2015-03-10 08:35:52","admin","1","79","admin");
INSERT INTO arsipnew VALUES("80","GA/1A/BA.1/001/80","1","1","1","1","80","SURAT PENGAJUAN PEKERJAAN TAMBAH ADDENDUM.pdf","027.1","","0","","proyek","0000-00-00","3","2013","Surat","T","","ADDENDUM","Surat Pengajuan Pekerjaan Tambah Kurang/Addendum Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 
\nNomor 22/IV-SW/2014 tanggal 24 Maret 2014","001.G","1","9","10","2023","2023-03-01","","0","1","Asli","","1","2015-03-10 14:42:43","2015-03-10 08:42:43","admin","1","80","admin");
INSERT INTO arsipnew VALUES("81","GA/1A/BA.1/001/81","1","1","1","1","81","SURAT PERJANJIAN PEKERJAAN JASA KONSTRUKSI.pdf","027.2","","0","","proyek","0000-00-00","4","2014","Kontrak","T","","ADDENDUM","ADDENDUM 01 Surat Perjanjian Pekerjaan Jasa Konstruksi (Kontrak) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 219/KEG.BPD8/4/2014 tanggal 30 April 2014","001.G","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-10 14:48:23","2015-03-10 08:48:23","admin","1","81","admin");
INSERT INTO arsipnew VALUES("82","GA/1A/BA.1/001/82","1","1","1","1","82","LAMPIRAN GAMBAR2.pdf","027.2","","0","","proyek","0000-00-00","4","2014","Laporan","T","","ADDENDUM","Lampiran Gambar Addendum 01 Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.G","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-10 14:52:58","2015-03-10 08:52:58","admin","1","82","admin");
INSERT INTO arsipnew VALUES("83","GA/1A/BA.1/001/83","1","1","1","1","83","LAMPIRAN BACKUP PERHITUNGAN.pdf","027.2","","0","","proyek","0000-00-00","4","2015","Laporan","T","","ADDENDUM","Lampiran Backup Perhitunagan Addendum 01 Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.G","1","9","10","2025","2025-04-01","","0","1","Asli","","1","2015-03-10 14:56:59","2015-03-10 08:56:59","admin","1","83","admin");
INSERT INTO arsipnew VALUES("84","GA/1A/BA.1/001/84","1","1","1","1","84","ADDENDUM 01.pdf","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","ADDENDUM","ADDENDUM 01 Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 191.1/KEG.BPD8/3/2014 tanggal 21 Maret 2014","001.G","1","9","10","2024","2024-03-01","","0","3","Asli","","1","2015-03-10 15:02:25","2015-03-10 09:02:25","admin","1","84","admin");
INSERT INTO arsipnew VALUES("85","GA/1A/BA.1/001/85","1","1","1","1","85","PENETAPAN PENAMBAHAN WAKTU PELAKSANAAN.pdf","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","Surat Keputusan Penetapan Penambahan Waktu Pelaksanaan Pekerjaan pada Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 182/KEG.BPD8/3/2014 tanggal 20 Maret 2014","001.AI","1","9","10","2024","2024-03-01","","0","3","Asli","","1","2015-03-10 15:07:38","2015-03-10 09:07:38","admin","1","85","admin");
INSERT INTO arsipnew VALUES("86","GA/1A/BA.1/001/86","1","1","1","1","86","PERMOHONAN AMANDEMEN KONTRAK.pdf","027.2","","0","","proyek","0000-00-00","2","2013","Surat","T","","ADDENDUM","Surat Permohonan Amandemen Kontrak untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor Pt. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggran 2013
\nNomor 28/AGM/II/2014 tanggal 28 Februari 2014","001.G","1","9","10","2023","2023-02-01","","0","1","Copy","","1","2015-03-10 15:11:13","2015-03-10 09:11:13","admin","1","86","admin");
INSERT INTO arsipnew VALUES("87","GA/1A/BA.1/001/87","1","1","1","1","87","ADDENDUM DOKUMEN PELELANGAN UMUM.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","ADDENDUM","Addendum Dokumen Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Tahun Anggaran 2013 tanggal 22 Oktober 2013","001.G","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-11 08:30:48","2015-03-11 02:30:47","admin","1","87","admin");
INSERT INTO arsipnew VALUES("88","GA/1A/BA.1/001/88","1","1","1","1","88","BA HASIL PELELANGAN (BAHP).pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL PELELANGAN (BAHP)","Berita Acara Hasil Pelelangan (BAHP) Pekerjaan Pembangunan Gedung Kantor Capem Baturetno Wonogiri PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 113/KEG.BPD8/11/2013 tanggal 15 November 2013","001.AJ","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 08:39:55","2015-03-11 02:39:55","admin","1","88","admin");
INSERT INTO arsipnew VALUES("89","GA/1A/BA.1/001/89","1","1","1","1","89","(D) SYARAT-SYARAT KHUSUS KONTRAK1.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 08:56:39","2015-03-11 02:56:39","admin","1","89","admin");
INSERT INTO arsipnew VALUES("90","GA/1A/BA.1/001/90","1","1","1","1","90","(E) SYARAT-SYARAT UMUM KONTRAK1.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 08:59:04","2015-03-11 02:59:04","admin","1","90","admin");
INSERT INTO arsipnew VALUES("91","GA/1A/BA.1/001/91","1","1","1","1","91","(G) SPESIFIKASI UMUM1.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Spesifikasi Umum Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 09:01:33","2015-03-11 03:01:33","admin","1","91","admin");
INSERT INTO arsipnew VALUES("92","GA/1A/BA.1/001/92","1","1","1","1","92","SURAT PERINTAH MULAI KERJA.pdf","027","","0","","proyek","0000-00-00","12","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja (SPMK) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 127/KEG.BPD8/12/2013 tanggal 12 Desember 2013","001.AL","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-11 09:10:15","2015-03-11 03:10:15","admin","1","92","admin");
INSERT INTO arsipnew VALUES("93","GA/1A/BA.1/001/93","1","1","1","1","93","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Nomor 126/KEG.BPD8/12/2013 tanggal 12 Desember 2013 untuk Pelaksanaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013 ","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 09:13:45","2015-03-11 03:13:45","admin","1","93","admin");
INSERT INTO arsipnew VALUES("94","GA/1A/BA.1/001/94","1","1","1","1","94","KERANGKA ACUAN KERJA.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Kerangka Acuan Kerja Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-11 09:32:57","2015-03-11 03:32:56","admin","1","94","admin");
INSERT INTO arsipnew VALUES("95","GA/1A/BA.1/001/95","1","1","1","1","95","SURAT PENAWARAN PEKERJAAN PENGAWASAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENAWARAN ","Surat Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 14/AG/IX/2013 tanggal 14 November 2013","001.AB","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-11 09:40:33","2015-03-11 03:40:32","admin","1","95","admin");
INSERT INTO arsipnew VALUES("96","GA/1A/BA.1/001/96","1","1","1","1","96","SURAT PENUNJUKAN PENYEDIA JASA KONSULTASI (SPPJ).p","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Jasa Konsultasi untuk Pelaksanaan Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 121.1/KEG.BPD8/11/2013 tanggal 27 November 2013","001.P","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 09:46:29","2015-03-11 03:46:29","admin","1","96","admin");
INSERT INTO arsipnew VALUES("97","GA/1A/BA.1/001/97","1","1","1","1","97","SURAT PERINTAH MULAI KERJA (SPMK).pdf","027","","0","","proyek","0000-00-00","12","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013
\nNomor 127.1/KEG.BPD8/12/2013 tanggal 12 Desember 2013 ","001.AL","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 09:53:03","2015-03-11 03:53:03","admin","1","97","admin");
INSERT INTO arsipnew VALUES("98","GA/1A/BA.1/001/98","1","1","1","1","98","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Nomor 126.1/KEG.BPD8/12/2013 tanggal 12 Desember 2013 untuk Melaksanakan Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 09:56:40","2015-03-11 03:56:40","admin","1","98","admin");
INSERT INTO arsipnew VALUES("99","GA/1A/BA.1/001/99","1","1","1","1","99","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 09:59:02","2015-03-11 03:59:01","admin","1","99","admin");
INSERT INTO arsipnew VALUES("100","GA/1A/BA.1/001/100","1","1","1","1","100","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-11 10:01:14","2015-03-11 04:01:14","admin","1","100","admin");
INSERT INTO arsipnew VALUES("101","GA/1A/BA.1/001/101","1","1","1","1","101","REKAPITULASI RENCANA ANGGARAN BIAYA.pdf","027.2","","0","","proyek","0000-00-00","11","2013","Laporan","T","","KONTRAK","Rekapitulasi Rencana Anggaran Biaya Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013 oleh CV. ARSI GRANADA tanggal 13 November 2013","001.AK","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-11 10:09:47","2015-03-11 04:09:46","admin","1","101","admin");
INSERT INTO arsipnew VALUES("102","GA/1A/BA.1/001/102","1","1","1","1","102","LAPORAN AKHIR PENGAWASAN.pdf","051","","0","","proyek","0000-00-00","5","2014","Laporan","T","","LAPORAN","Laporan Akhir Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013 ","001.AM","1","9","10","2024","2024-05-01","","0","1","Asli","","1","2015-03-11 10:20:09","2015-03-11 04:20:09","admin","1","102","admin");
INSERT INTO arsipnew VALUES("103","GA/1A/BA.1/001/103","1","1","1","1","103","LAPORAN BULAN 1 DESEMBER.pdf","051.1","","0","","proyek","0000-00-00","12","2013","Laporan","T","","LAPORAN","Laporan Bulanan Ke 1 (Desember) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggran 2013","001.AM","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-11 10:31:37","2015-03-11 04:31:37","admin","1","103","admin");
INSERT INTO arsipnew VALUES("104","GA/1A/BA.1/001/104","1","1","1","1","104","LAPORAN BULAN 2 JANUARI.pdf","051","","0","","proyek","0000-00-00","1","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 2 (Januari) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-01-01","","0","1","Asli","","1","2015-03-11 10:34:07","2015-03-11 04:34:07","admin","1","104","admin");
INSERT INTO arsipnew VALUES("105","GA/1A/BA.1/001/105","1","1","1","1","105","LAPORAN BULAN 3 FEBRUARI.pdf","051","","0","","proyek","0000-00-00","2","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 3 (Februari) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-02-01","","0","1","Asli","","1","2015-03-11 10:36:38","2015-03-11 04:36:37","admin","1","105","admin");
INSERT INTO arsipnew VALUES("106","GA/1A/BA.1/001/106","1","1","1","1","106","LAPORAN BULAN 4 MARET.pdf","051","","0","","proyek","0000-00-00","3","2014","Laporan","T","","LAPORAN","Laporan Bulanan ke 4 (Maret) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-03-01","","0","1","Asli","","1","2015-03-11 10:38:51","2015-03-11 04:38:51","admin","1","106","admin");
INSERT INTO arsipnew VALUES("107","GA/1A/BA.1/001/107","1","1","1","1","107","LAPORAN BULAN 5 APRIL.pdf","051","","0","","proyek","0000-00-00","4","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 5 (April) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-11 10:41:05","2015-03-11 04:41:05","admin","1","107","admin");
INSERT INTO arsipnew VALUES("108","GA/1A/BA.1/001/108","1","1","1","1","108","LAPORAN BULAN 6 MEI.pdf","051","","0","","proyek","0000-00-00","5","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 5 (Mei) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-05-01","","0","1","Asli","","1","2015-03-11 10:43:34","2015-03-11 04:43:34","admin","1","108","admin");
INSERT INTO arsipnew VALUES("109","GA/1A/BA.3/001/109","1","1","3","1","109","ARSITEKTUR (ARS).pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","AS BUILT DRAWING","As Built Drawing Arsitektur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.A","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 11:49:50","2015-03-11 05:49:50","admin","1","109","admin");
INSERT INTO arsipnew VALUES("110","GA/1A/BA.3/001/110","1","1","3","1","110","MEKANIKAL ELEKTRIKAL.pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","AS BUILT DRAWING","As Built Drawing Mekanikal Elektrikal Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.A","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 11:52:22","2015-03-11 05:52:22","admin","1","110","admin");
INSERT INTO arsipnew VALUES("111","GA/1A/BA.3/001/111","1","1","3","1","111","STRUKTUR (STR).pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","AS BUILT DRAWING","As Built Drawing Struktur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.A","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 11:54:46","2015-03-11 05:54:46","admin","1","111","admin");
INSERT INTO arsipnew VALUES("112","GA/1A/BA.3/001/112","1","1","3","1","112","UNDANGAN.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan untuk mengikuti Proses Pelelang Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 OKtober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 13:38:22","2015-03-11 07:38:22","admin","1","112","admin");
INSERT INTO arsipnew VALUES("113","GA/1A/BA.3/001/113","1","1","3","1","113","BA PEMB DOK PENAWARAN SAMPUL I.PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Tahun Anggaran 2013
\nNomor 083/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.I","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 13:44:34","2015-03-11 07:44:34","admin","1","113","admin");
INSERT INTO arsipnew VALUES("114","GA/1A/BA.3/001/114","1","1","3","1","114","CV SURYA INDAH.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. SURYA INDAH untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 ","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:00:23","2015-03-11 08:00:23","admin","1","114","admin");
INSERT INTO arsipnew VALUES("115","GA/1A/BA.3/001/115","1","1","3","1","115","CV. ALAM JAYA SAKTI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Penilain Teknis CV. ALAM JAYA SAKTI untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:04:03","2015-03-11 08:04:03","admin","1","115","admin");
INSERT INTO arsipnew VALUES("116","GA/1A/BA.3/001/116","1","1","3","1","116","CV. ASKINDO ABADI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. ASKINDO ABADI untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Tahun Anggaran 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:07:27","2015-03-11 08:07:27","admin","1","116","admin");
INSERT INTO arsipnew VALUES("117","GA/1A/BA.3/001/117","1","1","3","1","117","CV. KARTIKA KARYA.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. KARTIKA KARYA untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:09:46","2015-03-11 08:09:46","admin","1","117","admin");
INSERT INTO arsipnew VALUES("118","GA/1A/BA.3/001/118","1","1","3","1","118","CV. TRI KARYA.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. TRI KARYA untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:11:59","2015-03-11 08:11:59","admin","1","118","admin");
INSERT INTO arsipnew VALUES("119","GA/1A/BA.3/001/119","1","1","3","1","119","BA PEMBUKTIAN KUALIFIKASI.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 112.3/KEG.BPD/11/2013 tanggal 13 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-11 14:24:51","2015-03-11 08:24:51","admin","1","119","admin");
INSERT INTO arsipnew VALUES("120","GA/1A/BA.3/001/120","1","1","3","1","120","PENGAMBILAN DOKUMEN PENGADAAN2.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","PENGAMBILAN DOKUMEN PENGADAAN","Pengambilan Dokumen Pengadaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Q","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 14:32:39","2015-03-11 08:32:39","admin","1","120","admin");
INSERT INTO arsipnew VALUES("121","GA/1A/BA.3/001/121","1","1","3","1","121","PENGUMUMAN LELANG ULANG DG PASCAKUALIFIKASI.PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI (LELANG ULANG)","Pengumuman Lelang Ulang dengan Pascakualifikasi Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Wonogiri dan Cepu Blora Tahun Anggaran 2013
\nNomor 073/KEG.BPD8/10/2013 tanggal 16 Oktober 2013","001.DD","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-11 14:37:09","2015-03-11 08:37:09","admin","1","121","admin");
INSERT INTO arsipnew VALUES("122","GA/1A/BA.3/001/122","1","1","3","1","122","UNDANGAN 2.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan untuk mengikuti Penjelasan Pekerjaan (Aanwijzing) tahap II, Batas Pemasukan Dokumen Penawaran dan Pembukaan Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 050/KEG.BPD8/9/2013 tanggal 12 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 14:42:35","2015-03-11 08:42:35","admin","1","122","admin");
INSERT INTO arsipnew VALUES("123","GA/1A/BA.3/001/123","1","1","3","1","123","UNDANGAN PANITIA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan Panitia untuk mengikuti Rapat Kegiatan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 030/KEG.BPD8/9/2013 tanggal 06 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 14:46:29","2015-03-11 08:46:29","admin","1","123","admin");
INSERT INTO arsipnew VALUES("124","GA/1A/BA.3/001/124","1","1","3","1","124","PENGUMUMAN LELANG DG PASCAKUALIFIKASI.pdf","027","","0","","proyek","0000-00-00","9","2013","Kontrak","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI","Pengumuman Lelang dengan Pascakualifikasi Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 035/KEG.BPD8/9/2013 tanggal 04 September 2013","001.D","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 14:54:24","2015-03-11 08:54:24","admin","1","124","admin");
INSERT INTO arsipnew VALUES("125","GA/1A/BA.3/001/125","1","1","3","1","125","PENDAFTARAN PESERTA LELANG.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pendaftaran Peserta Lelang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.F","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 14:57:04","2015-03-11 08:57:04","admin","1","125","admin");
INSERT INTO arsipnew VALUES("126","GA/1A/BA.3/001/126","1","1","3","1","126","ADDEDUM DOK. PELELANGAN UMUM.pdf","027.2","","0","","proyek","0000-00-00","9","2013","Kontrak","T","","ADDENDUM","Addendum Dokumen Pelelangan Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.G","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 15:10:38","2015-03-11 09:10:38","admin","1","126","admin");
INSERT INTO arsipnew VALUES("127","GA/1A/BA.3/001/127","1","1","3","1","127","BA PENJELASAN PEKERJAAN TAHAP I.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA AANWIJZING","Berita Acara Penjelasan Pekerjaan (Aanwijzing) Tahap I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 
\nNomor 044/KEG.BPD8/9/2013 tanggal 09 September 2013","001.H","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 15:14:16","2015-03-11 09:14:16","admin","1","127","admin");
INSERT INTO arsipnew VALUES("128","GA/1A/BA.3/001/128","1","1","3","1","128","BILL OF QUANTITY.pdf","027.2","","0","","proyek","0000-00-00","9","2013","Laporan","T","","ADDENDUM","Bill Of Quantity Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.G","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 15:20:01","2015-03-11 09:20:01","admin","1","128","admin");
INSERT INTO arsipnew VALUES("129","GA/1A/BA.3/001/129","1","1","3","1","129","PEMASUKAN DOK. PENAWARAN.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Daftar Pemasukan Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.F","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 15:35:51","2015-03-11 09:35:51","admin","1","129","admin");
INSERT INTO arsipnew VALUES("130","GA/1A/BA.3/001/0","1","1","3","1","130","BA PEMBUKAAN DOK. PENAWARAN.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 055/KEG.BPD8/9/2013 tanggal 17 September 2013","001.I","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-11 15:41:17","2015-03-11 09:42:12","admin","1","130","admin");
INSERT INTO arsipnew VALUES("131","GA/1A/BA.3/001/131","1","1","3","1","131","PENGUMUMAN LELANG DG PASCAKUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI (LELANG ULANG)","Pengumuman Lelang Dengan Pascakualifikasi (Lelng Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 075/KEG.BPD8/10/2013 tanggal 16 Oktober 2013","001.DD","1","9","10","2023","2023-10-01","","0","3","Tembusan","","1","2015-03-11 15:46:05","2015-03-11 09:46:05","admin","1","131","admin");
INSERT INTO arsipnew VALUES("132","GA/1A/BA.3/001/132","1","1","3","1","132","PENDAFTARAN PESERTA LELANG ULANG.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pendaftaran Peserta Lelang Ulang Pekerjaan Pembangunan gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.F","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 15:51:17","2015-03-11 09:51:17","admin","1","132","admin");
INSERT INTO arsipnew VALUES("133","GA/1A/BA.3/001/133","1","1","3","1","133","ADDEDUM DOK. PELELANGAN UMUM (LELANG ULANG).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","ADDENDUM","Addendum Dokumen Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 22 Oktober 2013","001.G","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-11 15:55:50","2015-03-11 09:55:50","admin","1","133","admin");
INSERT INTO arsipnew VALUES("134","GA/1A/BA.3/001/134","1","1","3","1","134","BA RAPAT PENJELASAN PEKERJAAN AANWIJZING.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwizjing) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 079/KEG.BPD8/10/2013 tanggal 22 Oktober 2013","001.H","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 15:59:41","2015-03-11 09:59:41","admin","1","134","admin");
INSERT INTO arsipnew VALUES("135","GA/1A/BA.3/001/135","1","1","3","1","135","BILL OF QUANTITY.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Laporan","T","","ADDENDUM","Bill Of Quantity (lelang ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.G","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:02:13","2015-03-11 10:02:13","admin","1","135","admin");
INSERT INTO arsipnew VALUES("172","GA/1A/BA.3/001/136","1","1","3","1","172","PEMASUKAN DOK. PENAWARAN (PELELANGAN ULANG).pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pemasukan Dokumen Penawaran (Pelelangan Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\n","001.F","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:05:11","2015-03-11 10:05:11","admin","1","136","admin");
INSERT INTO arsipnew VALUES("173","GA/1A/BA.3/001/137","1","1","3","1","173","UNDANGAN CV. ALAM JAYA SAKTI.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. ALAM JAYA SAKTI Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:09:49","2015-03-11 10:09:49","admin","1","137","admin");
INSERT INTO arsipnew VALUES("174","GA/1A/BA.3/001/138","1","1","3","1","174","UNDANGAN CV. ASKINDO SAKTI.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. ASKINDO SAKTI Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:13:00","2015-03-11 10:13:00","admin","1","138","admin");
INSERT INTO arsipnew VALUES("175","GA/1A/BA.3/001/139","1","1","3","1","175","UNDANGAN CV. BOKAMA JAYA MANDIRI.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV.BOKAMA JAYA MANDIRI Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:16:06","2015-03-11 10:16:06","admin","1","139","admin");
INSERT INTO arsipnew VALUES("176","GA/1A/BA.3/001/140","1","1","3","1","176","UNDANGAN CV. FISADA.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. FISADA Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:19:06","2015-03-11 10:19:06","admin","1","140","admin");
INSERT INTO arsipnew VALUES("177","GA/1A/BA.3/001/141","1","1","3","1","177","UNDANGAN CV. KARTIKA KARYA.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. KARTIKA KARYA Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:22:19","2015-03-11 10:22:19","admin","1","141","admin");
INSERT INTO arsipnew VALUES("178","GA/1A/BA.3/001/142","1","1","3","1","178","UNDANGAN CV. SIMPATIK KARYA MANDIRI.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. SIMPATIK KARYA MANDIRI Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:25:09","2015-03-11 10:25:09","admin","1","142","admin");
INSERT INTO arsipnew VALUES("179","GA/1A/BA.3/001/143","1","1","3","1","179","UNDANGAN WIDYA BAKTI UTAMA.PDF","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan CV. WIDYA BAKTI UTAMA Pelelangan Umum (Lelang Ulang) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 081/KEG.BPD8/10/2013 tanggal 25 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-11 16:27:48","2015-03-11 10:27:48","admin","1","143","admin");
INSERT INTO arsipnew VALUES("180","GA/1A/BA.3/001/4","1","1","3","1","180","BA PEMB. DOK PENAWARAN SAMPUL.PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 083/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.I","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-12 08:20:43","2015-03-12 02:22:26","admin","1","144","admin");
INSERT INTO arsipnew VALUES("182","GA/1A/BA.3/001/145","1","1","3","1","182","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENGUMUMAN HASIL EVALUASI PENILAIAN DOKUMEN PENAWARAN","Pengumuman Hasil Evaluasi/Penilaian Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 102/KEG.BPD8/11/2013 tanggal 07 NOvember 2013","001.K","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-12 08:26:17","2015-03-12 02:26:17","admin","1","145","admin");
INSERT INTO arsipnew VALUES("183","GA/1A/BA.3/001/146","1","1","3","1","183","UNDANGAN CV. ASKINDO ABADI.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan CV. ASKINDO ABADI untuk mengikuti Pembukaan Dokumen Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 105.1/KEG.BPD8/11/2013 tanggal 08 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:30:33","2015-03-12 02:30:32","admin","1","146","admin");
INSERT INTO arsipnew VALUES("184","GA/1A/BA.3/001/7","1","1","3","1","184","UNDANGAN CV. JAYA ALAM SAKTI.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan CV. JAYA ALAM SAKTI untuk mengikuti Pembukaan Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 105.3/KEG.BPD8/11/2013 tanggal 08 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:33:55","2015-03-12 02:37:36","admin","1","147","admin");
INSERT INTO arsipnew VALUES("185","GA/1A/BA.3/001/148","1","1","3","1","185","UNDANGAN CV. KARTIKA KARYA.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan CV. KARTIKA KARYA untuk mengikuti Pembukaan Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu tahun Anggaran 2013
\nNomor 105.2/KEG.BPD8/11/2013 tanggal 08 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:36:55","2015-03-12 02:36:55","admin","1","148","admin");
INSERT INTO arsipnew VALUES("186","GA/1A/BA.3/001/149","1","1","3","1","186","BA PEMB. PENAWARAN SAMPUL II.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 107/KEG.BPD8/11/2013 tanggal 11 November 2013","001.I","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:41:41","2015-03-12 02:41:41","admin","1","149","admin");
INSERT INTO arsipnew VALUES("187","GA/1A/BA.3/001/150","1","1","3","1","187","BA PEMBUKTIAN DOK. KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PENELITIAN DOKUMEN PENAWARAN","Berita Acara Penelitian Dokumen Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 107.1/KEG.BPD8/11/2013 tanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:48:10","2015-03-12 02:48:09","admin","1","150","admin");
INSERT INTO arsipnew VALUES("188","GA/1A/BA.3/001/151","1","1","3","1","188","LEMBAR KERJA PENILAIAN BIAYA CV. ALAM JAYA SAKTI.P","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Lembar Kerja Penilaian Biaya CV. ALAM JAYA SAKTI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\ntanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:52:16","2015-03-12 02:52:16","admin","1","151","admin");
INSERT INTO arsipnew VALUES("189","GA/1A/BA.3/001/152","1","1","3","1","189","LEMBAR KERJA PENILAIAN BIAYA CV. ASKINDO ABADI.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Lembar Kerja Penilaian Biaya CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\ntanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:55:21","2015-03-12 02:55:21","admin","1","152","admin");
INSERT INTO arsipnew VALUES("190","GA/1A/BA.3/001/153","1","1","3","1","190","LEMBAR KERJA PENILAIAN BIAYA CV. KARTIKA JAYA.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Lembar Kerja Penilaian Biaya CV. KARTIKA JAYA Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daearh Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\ntanggal 11 November 2013","001.J","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 08:58:06","2015-03-12 02:58:06","admin","1","153","admin");
INSERT INTO arsipnew VALUES("191","GA/1A/BA.3/001/154","1","1","3","1","191","UNDANGAN  CV. ALAM JAYA SAKTI.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Pembuktian dan Klarifikasi Dokumen Penawaran CV. ALAM JAYA SAKTI Pekerjaan Pembangunan Gedung Kantor PT.Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 109.3/KEG.BPD/11/2013 tanggal 12 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:03:01","2015-03-12 03:03:01","admin","1","154","admin");
INSERT INTO arsipnew VALUES("192","GA/1A/BA.3/001/155","1","1","3","1","192","UNDANGAN CV.  ASKINDO ABADI.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Pembuktian dan Klarifikasi Dokumen Penawaran CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 109.1/KEG.BPD8/11/2013 tanggal 12 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:05:58","2015-03-12 03:05:58","admin","1","155","admin");
INSERT INTO arsipnew VALUES("193","GA/1A/BA.3/001/156","1","1","3","1","193","UNDANGAN CV. KARTIKA KARYA.PDF","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Pembuktian dan Klarifikasi Dokumen Penawaran CV. KARTIKA KARYA Pekerjaan Pembangunan Gedung Kantor PT. Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 109.2/KEG.BPD8/11/2013 tanggal 12 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:09:17","2015-03-12 03:09:17","admin","1","156","admin");
INSERT INTO arsipnew VALUES("194","GA/1A/BA.3/001/157","1","1","3","1","194","BA PEMBUKTIAN DOK KUALIFIKASI CV. KARTIKA KARYA.pd","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi CV. KARTIKA KARYA Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 112.2/KEG.BAPD8/11/2013 tanggal 13 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:13:35","2015-03-12 03:13:35","admin","1","157","admin");
INSERT INTO arsipnew VALUES("195","GA/1A/BA.3/001/158","1","1","3","1","195","BA PEMBUKTIAN DOK. KUALIFIKASI CV. ASKINDO ABADI.p","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 112.1/KEG.BPD8/11/2013 tanggal 13 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:16:40","2015-03-12 03:16:39","admin","1","158","admin");
INSERT INTO arsipnew VALUES("196","GA/1A/BA.3/001/159","1","1","3","1","196","BA HASIL PELELANGAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL PELELANGAN (BAHP)","Berita Acara Hasil Pelelangan (BAHP) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 114/KEG.BPD8/11/2013 tanggal 15 November 2013","001.AJ","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:20:40","2015-03-12 03:20:40","admin","1","159","admin");
INSERT INTO arsipnew VALUES("197","GA/1A/BA.3/001/160","1","1","3","1","197","PENETAPAN PEMENANG.PDF","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 117/KEG.BPD8/11/2013 tanggal 18 November 2013","001.N","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:24:05","2015-03-12 03:24:05","admin","1","160","admin");
INSERT INTO arsipnew VALUES("198","GA/1A/BA.3/001/161","1","1","3","1","198","PENGUMUMAN PEMENANG.PDF","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENGUMUMAN PEMENANG","Pengumuman Pemenang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nTahun Anggaran 2013 
\nNomor 120/KEG.BPD8/11/2013 tanggal 19 November 2013","001.O","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-12 09:33:19","2015-03-12 03:33:19","admin","1","161","admin");
INSERT INTO arsipnew VALUES("199","GA/1A/BA.3/001/162","1","1","3","1","199","SPPBJ ASKINDO ABADI.PDF","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Barang Jasa (SPPBJ) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 123/KEG.BPD8/11/2013 tanggal 27 November 2013","001.P","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-12 09:37:40","2015-03-12 03:37:40","admin","1","162","admin");
INSERT INTO arsipnew VALUES("200","GA/1A/BA.3/001/163","1","1","3","1","200","ARSITEKTUR.pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Arsitektur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 ","001.R","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:44:00","2015-03-12 03:43:59","admin","1","163","admin");
INSERT INTO arsipnew VALUES("201","GA/1A/BA.3/001/164","1","1","3","1","201","ELEKTRIKAL MEKANIKAL.pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Elektrikal Mekanikal Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.R","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:46:33","2015-03-12 03:46:33","admin","1","164","admin");
INSERT INTO arsipnew VALUES("202","GA/1A/BA.3/001/165","1","1","3","1","202","STRUKTURAL.pdf","051","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Sruktur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.R","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:48:41","2015-03-12 03:48:41","admin","1","165","admin");
INSERT INTO arsipnew VALUES("203","GA/1A/BA.3/001/166","1","1","3","1","203","BA EVALUASI DOK PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA EVALUASI DOKUMEN PENAWARAN","Berita Acara Evaluasi Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 11/AWS-IV.BPD8/11/2013 tanggal 22 November 2013","001.T","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:52:22","2015-03-12 03:52:22","admin","1","166","admin");
INSERT INTO arsipnew VALUES("204","GA/1A/BA.3/001/167","1","1","3","1","204","BA HASIL EVALUASI DOK KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Berita Acara Evaluasi Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 05/AWS-IV.BPD8/11/2013 tanggal 07 November 2013","001.S","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:56:20","2015-03-12 03:56:20","admin","1","167","admin");
INSERT INTO arsipnew VALUES("205","GA/1A/BA.3/001/168","1","1","3","1","205","BA HASIL PENUNJUKAN LANGSUNG.pdf","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Berita Acara Hasil Penunjukan Langsung (BAHPL) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 14/AWS-IV.BPD8/11/2013 tanggal 29 November 2013","001.V","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 09:59:33","2015-03-12 03:59:33","admin","1","168","admin");
INSERT INTO arsipnew VALUES("206","GA/1A/BA.3/001/169","1","1","3","1","206","BA PEMBUKAAN DOK PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 10/AWS-IV.BPD8/11/2013 tanggal 21 November 2013","001.I","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:03:43","2015-03-12 04:03:43","admin","1","169","admin");
INSERT INTO arsipnew VALUES("207","GA/1A/BA.3/001/170","1","1","3","1","207","BA RAPAT PEMBUKTIAN DOK KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Rapat Pembuktian Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 07/AWS-IV.BPD8/11/2013 tanggal 08 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:07:52","2015-03-12 04:07:51","admin","1","170","admin");
INSERT INTO arsipnew VALUES("208","GA/1A/BA.3/001/171","1","1","3","1","208","BA RAPAT PERSIAPAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","BA RAPAT PERSIAPAN","Berita Acara Rapat Persiapan Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 01.1/AWS-IV.BPD8/8/2013 tanggal 08 Agustus 2013","001.W","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-12 10:11:08","2015-03-12 04:11:08","admin","1","171","admin");
INSERT INTO arsipnew VALUES("209","GA/1A/BA.3/001/172","1","1","3","1","209","DOKUMEN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN KUALIFIKASI","Dokumen Kualifikasi Nomor 01/AWS-IV.BPD8/08/2013 tanggal 19 Asustus 2013 Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.X","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-12 10:14:44","2015-03-12 04:14:44","admin","1","172","admin");
INSERT INTO arsipnew VALUES("210","GA/1A/BA.3/001/173","1","1","3","1","210","DOKUMEN PEMILIHAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN PEMILIHAN","Dokumen Pemilihan Nomor 02/AWS-IV.BPD8/08/2013 tanggal 19 Agustus 2013 Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Z","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-12 10:17:26","2015-03-12 04:17:26","admin","1","173","admin");
INSERT INTO arsipnew VALUES("211","GA/1A/BA.3/001/174","1","1","3","1","211","EVALUASI DOKUMEN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Evaluasi Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggl 07 Novmber 2013","001.S","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:43:54","2015-03-12 04:43:54","admin","1","174","admin");
INSERT INTO arsipnew VALUES("212","GA/1A/BA.3/001/175","1","1","3","1","212","HASIL KLARIFIKASI DAN NEGOSIASI BIAYA.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA HASIL KLARIFIKASI & NEGOSIASI","Hasil Klarifikasi dan Negosiasi Biaya Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora tahun Anggaran 2013
\nNomor 13/AWS-IV.BPD8/11/2013 tanggal 26 November 2013","001.U","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:47:48","2015-03-12 04:47:48","admin","1","175","admin");
INSERT INTO arsipnew VALUES("213","GA/1A/BA.3/001/176","1","1","3","1","213","JADWAL PENUNJUKAN LANGSUNG.pdf","027","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Jadwal Penunjukan Langsung Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 02 September 2013","001.V","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-12 10:52:04","2015-03-12 04:52:04","admin","1","176","admin");
INSERT INTO arsipnew VALUES("214","GA/1A/BA.3/001/177","1","1","3","1","214","PEMBUKTIAN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Pembuktian Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 08 November 2013","001.M","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:55:24","2015-03-12 04:55:24","admin","1","177","admin");
INSERT INTO arsipnew VALUES("215","GA/1A/BA.3/001/178","1","1","3","1","215","PENELITIAN DAN PENILAIAN DOKUMEN ADMINISTRASI DAN ","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA EVALUASI DOKUMEN PENAWARAN","Penelitian dan Penilaian Dokumen Administrasi dan Teknis Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 22 November 2013","001.T","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 10:58:22","2015-03-12 04:58:22","admin","1","178","admin");
INSERT INTO arsipnew VALUES("216","GA/1A/BA.3/001/179","1","1","3","1","216","PENETAPAN PEMENANG.pdf","027","","0","","proyek","0000-00-00","12","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 
\nNomor 15/AWS-IV.BPD8/11/2013 tanggal 01 Desember 2013","001.N","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-12 11:01:13","2015-03-12 05:01:13","admin","1","179","admin");
INSERT INTO arsipnew VALUES("217","GA/1A/BA.3/001/180","1","1","3","1","217","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","027","","0","","proyek","0000-00-00","12","2013","Surat","T","","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA","Pengumuman Penunjukan Langsung Penyedia Jasa Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 16/AWS-IV/BPD8/11/2013 tanggal 01 Desember 2013","001.AN","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-12 11:09:00","2015-03-12 05:09:00","admin","1","180","admin");
INSERT INTO arsipnew VALUES("218","GA/1A/BA.3/001/181","1","1","3","1","218","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Klarifikasi dan Negosiasi CV. SHANDIKA Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 12/AWS-IV.BPD8/11/2013 tanggal 25 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 11:12:50","2015-03-12 05:12:50","admin","1","181","admin");
INSERT INTO arsipnew VALUES("219","GA/1A/BA.3/001/182","1","1","3","1","219","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","005","","0","","proyek","0000-00-00","11","2013","Surat","T","","UNDANGAN","Undangan Pembuktian Dokumen Kualifikasi CV. SHANDIKA Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 06/AWS-IV.BPD8/11/2013 tanggal 07 November 2013","001.L","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-12 11:15:40","2015-03-12 05:15:40","admin","1","182","admin");
INSERT INTO arsipnew VALUES("220","GA/1A/BA.3/001/3","1","1","3","1","220","DAFTAR ANALISA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Analisa Satuan Pekerjaan (Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013) tanggal 22 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 11:19:02","2015-03-12 05:21:37","admin","1","183","admin");
INSERT INTO arsipnew VALUES("221","GA/1A/BA.3/001/4","1","1","3","1","221","DAFTAR HARGA SATUAN BAHAN DAN UPAH.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Bahan dan Upah Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 11:21:12","2015-03-12 05:22:11","admin","1","184","admin");
INSERT INTO arsipnew VALUES("222","GA/1A/BA.3/001/185","1","1","3","1","222","DAFTAR HARGA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Pekerjaan Pembangunan Gedung Kantor Pembangunan Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 11:24:35","2015-03-12 05:24:34","admin","1","185","admin");
INSERT INTO arsipnew VALUES("223","GA/1A/BA.3/001/186","1","1","3","1","223","PENAWARAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENAWARAN ","Penawaran Pekerjaan Pembangunan Gedung kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 32/AA/X/2013 tanggal 28 Oktober 2013","001.AB","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 11:27:24","2015-03-12 05:27:24","admin","1","186","admin");
INSERT INTO arsipnew VALUES("224","GA/1A/BA.3/001/187","1","1","3","1","224","RENCANA ANGGARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Rencana Anggaran Biaya Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 11:30:22","2015-03-12 05:30:22","admin","1","187","admin");
INSERT INTO arsipnew VALUES("225","GA/1A/BA.3/001/188","1","1","3","1","225","DAFTAR BAG. PEKERJAAN YANG DI SUBKONTRAKTORKAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","DOKUMEN PENAWARAN FISIK","Daftar Bagian Pekerjaan yang di Subkontraktorkan (CV. ASKINDO ABADI) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:27:22","2015-03-12 07:27:22","admin","1","188","admin");
INSERT INTO arsipnew VALUES("226","GA/1A/BA.3/001/189","1","1","3","1","226","DAFTAR PERSONIL INTI.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Personil Inti CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:29:44","2015-03-12 07:29:44","admin","1","189","admin");
INSERT INTO arsipnew VALUES("227","GA/1A/BA.3/001/190","1","1","3","1","227","DAFTAR SPESIFIKASI TEKNIS.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Spesifikasi Teknis CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 28 Oktober 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:31:55","2015-03-12 07:31:55","admin","1","190","admin");
INSERT INTO arsipnew VALUES("228","GA/1A/BA.3/001/1","1","1","3","1","228","DOKUMEN TEKNIS.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Dokumen Teknis CV. ASKINDO ABADI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:34:08","2015-03-12 07:37:40","admin","1","191","admin");
INSERT INTO arsipnew VALUES("229","GA/1A/BA.3/001/192","1","1","3","1","229","JADWAL WAKTU PELAKSANAAN BENTUK KURVA S.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Jadwal Waktu Pelaksanaan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:36:20","2015-03-12 07:36:20","admin","1","192","admin");
INSERT INTO arsipnew VALUES("230","GA/1A/BA.3/001/193","1","1","3","1","230","PENAWARAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENAWARAN ","Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 31/AA/X/2013 tanggal 28 Oktober 2013","001.AB","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:40:07","2015-03-12 07:40:07","admin","1","193","admin");
INSERT INTO arsipnew VALUES("231","GA/1A/BA.3/001/194","1","1","3","1","231","SURAT PERNYATAAN KESANGGUPAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","DOKUMEN PENAWARAN FISIK","Surat Pernyataan Kesanggupan CV. ASKINDO ABADI tanggal 28 Oktober 2013
\nPekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:43:01","2015-03-12 07:43:01","admin","1","194","admin");
INSERT INTO arsipnew VALUES("232","GA/1A/BA.3/001/195","1","1","3","1","232","SYARAT TEKNIS YANG LAINNYA.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Syarat Teknis Lainnya CV. ASKINDO ABADI 
\nPekerjaan Pembangunan Gedung Kantor PT. Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-12 13:45:13","2015-03-12 07:45:13","admin","1","195","admin");
INSERT INTO arsipnew VALUES("233","GA/1A/BA.3/001/196","1","1","3","1","233","dokumen pengadaan.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN PENGADAAN","Dokumen Pengadaan Nomor 024.2/KEG.BPD8/08/2013 tanggal 19 Agustus 2013 Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AC","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-12 13:52:19","2015-03-12 07:52:19","admin","1","196","admin");
INSERT INTO arsipnew VALUES("234","GA/1A/BA.3/001/197","1","1","3","1","234","ADDENDUM 01 KONTRAK.pdf","027.2","","0","","proyek","0000-00-00","4","2014","Kontrak","T","","ADDENDUM","Addendum 01 Perjanjian Pekerjaan Jasa Konsultasi (KONTRAK) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 208/KEG.BPD8/4/2014 tanggal 14 April 2014","001.G","1","9","10","2024","2024-04-01","","0","3","Asli","","1","2015-03-12 14:00:26","2015-03-12 08:00:26","admin","1","197","admin");
INSERT INTO arsipnew VALUES("235","GA/1A/BA.3/001/198","1","1","3","1","235","SK PENETAPAN PENAMBAHAN WAKTU PEKERJAAN.pdf","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","SK Penetapan Penambahan Waktu Pekerjaan Pada Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 
\nNomor 207/KEG.BPD8/4/2014 tanggal 21 Maret 2014","001.AI","1","9","10","2024","2024-03-01","","0","3","Asli","","1","2015-03-12 14:12:43","2015-03-12 08:12:43","admin","1","198","admin");
INSERT INTO arsipnew VALUES("236","GA/1A/BA.3/001/199","1","1","3","1","236","SURAT PERMOHONAN PERPANJANGAN WAKTU.pdf","027.2","","0","","proyek","0000-00-00","3","2014","Surat","T","","ADDENDUM","Surat Permohonan Perpanjangan Waktu Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 029-12.2/SND/ADDENDUM/III/14 tanggal 24 Maret 2014","001.G","1","9","10","2024","2024-03-01","","0","1","Asli","","1","2015-03-12 14:20:49","2015-03-12 08:20:49","admin","1","199","admin");
INSERT INTO arsipnew VALUES("237","GA/1A/BA.3/001/200","1","1","3","1","237","BA EVALUASI 1.pdf","027.2","","0","","proyek","0000-00-00","1","2014","Surat","T","","BA RAPAT KOORDINASI & EVALUASI","Berita Acara Rapat Evaluasi Ke 1 Tanggal 15 Januari 2014 Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AE","1","9","10","2024","2024-01-01","","0","1","Copy","","1","2015-03-12 14:24:35","2015-03-12 08:24:35","admin","1","200","admin");
INSERT INTO arsipnew VALUES("238","GA/1A/BA.3/001/201","1","1","3","1","238","BA NEGOSIASI PEKERJAAN TAMBAH KURANG.pdf","027.1","","0","","proyek","0000-00-00","3","2013","Surat","T","","BA NEGOSIASI PEKERJAAN TAMBAH KURANG","Berita Acara Negosiasi Pekerjaan Tambah Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 186/KEG.BPD8/3/2014 tanggal 20 Maret 2014","001.AD","1","9","10","2023","2023-03-01","","0","1","Asli","","1","2015-03-12 14:28:03","2015-03-12 08:28:03","admin","1","201","admin");
INSERT INTO arsipnew VALUES("239","GA/1A/BA.3/001/202","1","1","3","1","239","BA RAPAT PCM DAN DAFTAR HADIR.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Surat","T","","PCM","Berita Acara Rapat PCM Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 23 Desember 2013","001.AG","1","9","10","2023","2023-12-01","","0","1","Copy","","1","2015-03-12 14:31:14","2015-03-12 08:31:14","admin","1","202","admin");
INSERT INTO arsipnew VALUES("240","GA/1A/BA.3/001/203","1","1","3","1","240","SK PENETAPAN PEMANBAHAN PEKERJAAN TAMBAH KURANG.pd","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","SK Penetapan Penambahan Waktu Pekerjaan Tambah Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 189/KEG.BPD8/3/2014 tanggl 21 Maret 2014","001.AI","1","9","10","2024","2024-03-01","","0","3","Copy","","1","2015-03-12 14:43:19","2015-03-12 08:43:19","admin","1","203","admin");
INSERT INTO arsipnew VALUES("241","GA/1A/BA.3/001/204","1","1","3","1","241","SURAT PENGAJUAN TAMBAH KURANG.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Surat","T","","ADDENDUM","Surat Pengajuan Tambah Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 43/AA/XII/2013 tanggal 30 Desember 2013","001.G","1","9","10","2023","2023-12-01","","0","1","Copy","","1","2015-03-12 14:46:36","2015-03-12 08:46:36","admin","1","204","admin");
INSERT INTO arsipnew VALUES("242","GA/1A/BA.3/001/205","1","1","3","1","242","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","3","2013","Kontrak","T","","ADDENDUM","Addendum 01 Surat Perjanjian Pekerjaan Jasa Konstruksi (KONTRAK) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 
\nNomor 190/KEG.BPD8/3/2014 tanggal 21 Maret 2014","001.G","1","9","10","2023","2023-03-01","","0","3","Asli","","1","2015-03-12 14:50:40","2015-03-12 08:50:40","admin","1","205","admin");
INSERT INTO arsipnew VALUES("243","GA/1A/BA.3/001/206","1","1","3","1","243","SURAT PERMOHONAN PENAMBAHAN JANGKA WAKTU PELAKSANA","027.2","","0","","proyek","0000-00-00","2","2014","Surat","T","","ADDENDUM","Surat Permohonan Penambahan Jangka Waktu Pelaksanaan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 07/AA/II/2014 tanggal 10 Februari 2014","001.G","1","9","10","2024","2024-02-01","","0","1","Copy","","1","2015-03-12 14:53:56","2015-03-12 08:53:56","admin","1","206","admin");
INSERT INTO arsipnew VALUES("244","GA/1A/BA.3/001/207","1","1","3","1","244","spesifikasi umum.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Spesifikasi Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","2","3","2016","2016-10-01","","0","1","Copy","","1","2015-03-12 16:13:33","2015-03-12 10:13:33","admin","1","207","admin");
INSERT INTO arsipnew VALUES("245","GA/1A/BA.3/001/208","1","1","3","1","245","SURAT PERINTAH MILAI KERJA (SPMK).pdf","027.2","","0","","proyek","0000-00-00","12","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja (SPMK) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 129/KEG.BPD8/12/2013 tanggal 12 Desember 2013","001.AL","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-12 16:16:45","2015-03-12 10:16:45","admin","1","208","admin");
INSERT INTO arsipnew VALUES("246","GA/1A/BA.3/001/209","1","1","3","1","246","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 128/KEG.BPD8/12/2013 tanggal 13 Desember 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-12 16:19:52","2015-03-12 10:19:52","admin","1","209","admin");
INSERT INTO arsipnew VALUES("247","GA/1A/BA.3/001/210","1","1","3","1","247","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-12 16:21:55","2015-03-12 10:21:55","admin","1","210","admin");
INSERT INTO arsipnew VALUES("248","GA/1A/BA.3/001/1","1","1","3","1","248","SYARAT-SYARAT KHUSUS UMUM (SSUK).pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-12 16:23:40","2015-03-12 10:24:59","admin","1","211","admin");
INSERT INTO arsipnew VALUES("249","GA/1A/BA.3/001/212","1","1","3","1","249","KERANGKA ACUAN KERJA (KAK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Kerangka Acuan Kerja (KAK) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Copy","","1","2015-03-12 16:42:08","2015-03-12 10:42:08","admin","1","212","admin");
INSERT INTO arsipnew VALUES("250","GA/1A/BA.3/001/213","1","1","3","1","250","REKAPITULASI PENAWARAN BIAYA KEGIATAN PEMBANGUNAN2","027.2","","0","","proyek","0000-00-00","11","2013","Laporan","T","","PENAWARAN ","Rekapitulasi Penawaran Biaya Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 tanggal 21 Novmber 2013","001.AB","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-12 16:49:30","2015-03-12 10:49:30","admin","1","213","admin");
INSERT INTO arsipnew VALUES("251","GA/1A/BA.3/001/214","1","1","3","1","251","RENCANA ANGGARAN BIAYA (RAB).pdf","027.2","","0","","proyek","0000-00-00","11","2013","Laporan","T","","KONTRAK","Rencana Anggaran Biaya (RAB) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013 ","001.AK","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-12 16:52:52","2015-03-12 10:52:51","admin","1","214","admin");
INSERT INTO arsipnew VALUES("252","GA/1A/BA.3/001/215","1","1","3","1","252","SURAT PENAWARAN BIAYA UNTUK PENGAWASAN.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","PENAWARAN ","Surat Penawaran Biaya untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 029.a/SND/PNW/X/13 tanggal 21 November 2013","001.AB","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-12 16:56:51","2015-03-12 10:56:51","admin","1","215","admin");
INSERT INTO arsipnew VALUES("253","GA/1A/BA.3/001/216","1","1","3","1","253","SURAT PERINTAH MULAI KERJA (SPMK).pdf","027","","0","","proyek","0000-00-00","12","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja (SPMK) Pekerjaan Pengawasan Pembangunan gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 129.1/KEG.BPD8/12/2013 tanggal 13 Desember 2013","001.AL","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-12 17:04:46","2015-03-12 11:04:46","admin","1","216","admin");
INSERT INTO arsipnew VALUES("254","GA/1A/BA.3/001/217","1","1","3","1","254","SURAT PENUNJUKAN PENYEDIA KONSULTASI.pdf","027","","0","","proyek","0000-00-00","11","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Jasa Konsultasi untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Tahun Anggaran 2013
\nNomor 123.1/KEG.BPD8/11/2013 tanggal 27 November 2013","001.P","1","9","10","2023","2023-11-01","","0","3","Asli","","1","2015-03-12 17:08:17","2015-03-12 11:08:17","admin","1","217","admin");
INSERT INTO arsipnew VALUES("255","GA/1A/BA.3/001/218","1","1","3","1","255","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","12","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013
\nNomor 128.1/KEG.BPD8/12/2013 tanggal 13 Desember 2013","001.AK","1","9","10","2023","2023-12-01","","0","3","Asli","","1","2015-03-12 17:12:10","2015-03-12 11:12:10","admin","1","218","admin");
INSERT INTO arsipnew VALUES("256","GA/1A/BA.3/001/219","1","1","3","1","256","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-12 17:16:14","2015-03-12 11:16:14","admin","1","219","admin");
INSERT INTO arsipnew VALUES("257","GA/1A/BA.3/001/220","1","1","3","1","257","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-12 17:18:24","2015-03-12 11:18:24","admin","1","220","admin");
INSERT INTO arsipnew VALUES("258","GA/1A/BA.3/001/221","1","1","3","1","258","LAPORAN AKHIR PENGAWASAN.pdf","051","","0","","proyek","0000-00-00","4","2013","Laporan","T","","LAPORAN","Laporan Akhir Pengawasan Pekerjaan Pembamngunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AM","1","9","10","2023","2023-04-01","","0","1","Asli","","1","2015-03-13 07:41:05","2015-03-13 01:41:05","admin","1","221","admin");
INSERT INTO arsipnew VALUES("259","GA/1A/BA.3/001/2","1","1","3","1","259","LAPORAN BULAN DESEMBER.pdf","051.1","","0","","proyek","0000-00-00","12","2013","Laporan","T","","LAPORAN","Laporan Bulanan Ke I Desember Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AM","1","9","10","2023","2023-12-01","","0","1","Asli","","1","2015-03-13 07:52:04","2015-03-13 02:02:23","admin","1","222","admin");
INSERT INTO arsipnew VALUES("260","GA/1A/BA.3/001/223","1","1","3","1","260","LAPORAN BULAN JANUARI.pdf","051.1","","0","","proyek","0000-00-00","1","2014","Laporan","T","","LAPORAN","Laporanan Bulan Ke II Januari Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-01-01","","0","1","Asli","","1","2015-03-13 07:54:01","2015-03-13 01:54:01","admin","1","223","admin");
INSERT INTO arsipnew VALUES("261","GA/1A/BA.3/001/224","1","1","3","1","261","LAPORAN BULAN FEBRUARI.pdf","051.1","","0","","proyek","0000-00-00","2","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke III Februari Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu BLora Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-02-01","","0","1","Asli","","1","2015-03-13 07:55:54","2015-03-13 01:55:54","admin","1","224","admin");
INSERT INTO arsipnew VALUES("262","GA/1A/BA.3/001/225","1","1","3","1","262","LAPORAN BULAN MARET.pdf","051.1","","0","","proyek","0000-00-00","3","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke IV Maret Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-03-01","","0","1","Asli","","1","2015-03-13 07:58:37","2015-03-13 01:58:37","admin","1","225","admin");
INSERT INTO arsipnew VALUES("263","GA/1A/BA.3/001/226","1","1","3","1","263","LAPORAN BULAN APRIL.pdf","051.1","","0","","proyek","0000-00-00","4","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke V April Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-13 08:00:29","2015-03-13 02:00:29","admin","1","226","admin");
INSERT INTO arsipnew VALUES("264","GA/1A/BA.3/001/227","1","1","3","1","264","dokumen administrasi dan teknis.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DOKUMEN PENAWARAN PENGAWASAN","Dokumen Penawaran Adminstrasi dan Teknis CV. ARSI GRANADA untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.YY","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-13 08:25:52","2015-03-13 02:25:52","admin","1","227","admin");
INSERT INTO arsipnew VALUES("265","GA/1A/BA.3/001/8","1","1","3","1","265","dokumen penawaran biaya.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DOKUMEN PENAWARAN PENGAWASAN","Dokumen Penawan Biaya CV. ARSI GARANADA untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.YY","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-13 08:28:51","2015-03-13 02:35:54","admin","1","228","admin");
INSERT INTO arsipnew VALUES("266","GA/1A/BA.3/001/229","1","1","3","1","266","dokumen adminstrasi dan teknis.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DOKUMEN PENAWARAN PENGAWASAN","Dokumen Penawaran Adminstrasi dan Teknis CV. SHANDIKA untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.YY","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-13 08:31:45","2015-03-13 02:31:45","admin","1","229","admin");
INSERT INTO arsipnew VALUES("267","GA/1A/BA.3/001/230","1","1","3","1","267","Dokumen Prakualifikasi.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","DOKUMEN PRAKUALIFIKASI","Dokumen Prakualifikasi CV. SHANDIKA untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Cepu Blora Tahun Anggaran 2013","001.XX","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-13 08:33:56","2015-03-13 02:33:56","admin","1","230","admin");
INSERT INTO arsipnew VALUES("268","GA/1A/BA.3/001/1","1","1","3","1","268","ARSITEKTUR RENCANA (ARS).pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","AS BUILT DRAWING","As Build Drawing Arsitektur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.A","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 09:16:35","2015-03-13 03:19:38","admin","1","231","admin");
INSERT INTO arsipnew VALUES("269","GA/1A/BA.3/001/232","1","1","3","1","269","MEKANIKAL ELEKTRIKAL.pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","AS BUILT DRAWING","As Built Drawing Mekanikal Elektrikal Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Aggaran 2013","001.A","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 09:18:55","2015-03-13 03:18:55","admin","1","232","admin");
INSERT INTO arsipnew VALUES("270","GA/1A/BA.3/001/233","1","1","3","1","270","STRUKTUR (STR).pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","AS BUILT DRAWING","As Built Drawing Struktur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.A","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 09:21:51","2015-03-13 03:21:51","admin","1","233","admin");
INSERT INTO arsipnew VALUES("272","GA/2A/BA.3/001/234","1","2","4","1","272","PENGUMUMAN PELELANGAN DG PASCAKUALIFIKASI.pdf","027","","0","","proyek","0000-00-00","8","2013","Surat","T","","PENGUMUMAN LELANG DG PASCAKUALIFIKASI","Pengumuman Pelelangan dengan Pascakualifikasi Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 025.5/KEG.BPD8/8/2013 tanggal 21 Agustus 2013","001.D","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:39:12","2015-03-13 03:39:12","admin","1","234","admin");
INSERT INTO arsipnew VALUES("274","GA/2A/BA.3/001/235","1","2","4","1","274","PENDAFTARAN  PESERTA LELANG (1).pdf","027.1","","0","","proyek","0000-00-00","8","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pendaftaran Peserta Lelang  Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.F","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:44:46","2015-03-13 03:44:46","admin","1","235","admin");
INSERT INTO arsipnew VALUES("275","GA/2A/BA.3/001/236","1","2","4","1","275","PENGAMBILAN DOKUMEN PENGADAAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Laporan","T","","PENGAMBILAN DOKUMEN PENGADAAN","Pengambilan Dokumen Pengadaan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Q","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:46:50","2015-03-13 03:46:50","admin","1","236","admin");
INSERT INTO arsipnew VALUES("277","GA/2A/BA.3/001/237","1","2","4","1","277","BA PENJELASAN PEKERJAAN TAHAP I.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwijzing) Tahap I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 027/KEG.BPD8/8/2013 tanggal 26 Agustus 2013","001.H","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:51:23","2015-03-13 03:51:22","admin","1","237","admin");
INSERT INTO arsipnew VALUES("278","GA/2A/BA.3/001/238","1","2","4","1","278","UNDANGAN LELANG (1).PDF","005","","0","","proyek","0000-00-00","8","2013","Surat","T","","UNDANGAN","Undangan Pelelangan Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggun Tahun Anggaran 2013
\nNomor 029/KEG.BPD8/8/2013 tanggal 29 Agustus 2013","001.L","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:56:29","2015-03-13 03:56:29","admin","1","238","admin");
INSERT INTO arsipnew VALUES("279","GA/2A/BA.3/001/239","1","2","4","1","279","ADDENDUM II DOKUMEN PENGADAAN.pdf","027.2","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","ADDENDUM","Addendum II Dokumen Pengadaan Pekerjaan Pembangunan Gedung Kantor PT. Bak Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\ntanggal 21 Agustus 2013","001.G","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 09:58:44","2015-03-13 03:58:44","admin","1","239","admin");
INSERT INTO arsipnew VALUES("280","GA/2A/BA.3/001/240","1","2","4","1","280","BA PENJELASAN PEKERJAAN AANWIZJING TAHAP II.PDF","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","BA AANWIJZING","Berita Acara Rapat Penjelasan Pekerjaan (Aanwizjing) Tahap II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 030/KEG.BPD8/8/2013 tanggal 30 Agustus 2013","001.H","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 10:02:17","2015-03-13 04:02:17","admin","1","240","admin");
INSERT INTO arsipnew VALUES("281","GA/2A/BA.3/001/241","1","2","4","1","281","GAMBAR.pdf","027.2","","0","","proyek","0000-00-00","8","2013","Laporan","T","","ADDENDUM","Gambar (Addendum II) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 2013","001.G","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 10:05:31","2015-03-13 04:05:31","admin","1","241","admin");
INSERT INTO arsipnew VALUES("282","GA/2A/BA.3/001/242","1","2","4","1","282","PEMASUKAN DOKUMEN PENAWARAN.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","PENDAFTARAN PESERTA LELANG DAN PEMASUKAN DOKUMEN PENAWARAN","Pemasukan Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.F","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:08:08","2015-03-13 04:08:08","admin","1","242","admin");
INSERT INTO arsipnew VALUES("283","GA/2A/BA.3/001/243","1","2","4","1","283","BA PEMB DOK. PENAWARAN SAMPUL I.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung tahun Anggran 2013 
\nNomor 034/KEG.BPD8/9/2013 tanggal 03 September 2013","001.I","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:11:15","2015-03-13 04:11:15","admin","1","243","admin");
INSERT INTO arsipnew VALUES("284","GA/2A/BA.3/001/244","1","2","4","1","284","BA PENELITIAN DOK PENAWARAN SAMPUL I.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PENELITIAN DOKUMEN PENAWARAN","Berita Acara Penelitian Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Nagdirejo Temanggung Tahun Anggaran 2013
\nNomor 039/KEG.BPD8/9/2013 tanggal 06 September 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:14:29","2015-03-13 04:14:28","admin","1","244","admin");
INSERT INTO arsipnew VALUES("285","GA/2A/BA.3/001/245","1","2","4","1","285","UNDANGAN CV. HANDAYANI.PDF","005","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan CV. HANDAYANI untuk mengikuti Pembukaan Dokumen Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 042.1/KEG.BPD8/9/2013 tanggal 09 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:17:58","2015-03-13 04:17:58","admin","1","245","admin");
INSERT INTO arsipnew VALUES("286","GA/2A/BA.3/001/246","1","2","4","1","286","UNDANGAN CV. WIDYA BAKTI UTAMA.PDF","005","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan CV. WIDYA BAKTI UTAMA untuk mengikuti Pembukaan Dokumen Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 042.2/KEG.BPD8/9/2013 tanggal 09 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:19:27","2015-03-13 04:19:27","admin","1","246","admin");
INSERT INTO arsipnew VALUES("287","GA/2A/BA.3/001/247","1","2","4","1","287","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","PENGUMUMAN HASIL EVALUASI PENILAIAN DOKUMEN PENAWARAN","Pengumuman Hasil Evaluasi/Penilaian Dokumen Penawaran Sampul I Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 043/KEG.BPD8/9/2013 ","001.K","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:24:11","2015-03-13 04:24:11","admin","1","247","admin");
INSERT INTO arsipnew VALUES("288","GA/2A/BA.3/001/248","1","2","4","1","288","BA PEMB DOK. PENAWARAN SAMPUL II.PDF","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 045/KEG.BPD8/9/2013 tanggal 10 September 2013","001.I","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:28:23","2015-03-13 04:28:23","admin","1","248","admin");
INSERT INTO arsipnew VALUES("289","GA/2A/BA.3/001/249","1","2","4","1","289","BA PENELITIAN DOK. PENAWARAN SAMPUL II (1).PDF","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PENELITIAN DOKUMEN PENAWARAN","Berita Acara Penelitian Dokumen Penawaran Sampul II Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 049/KEG.BP8/9/2013 tanggal 11 September 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:34:51","2015-03-13 04:34:51","admin","1","249","admin");
INSERT INTO arsipnew VALUES("290","GA/2A/BA.3/001/250","1","2","4","1","290","LEMBAR KERJA PENILAIAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PENELITIAN DOKUMEN PENAWARAN","Lembar Kerja Penilain Biaya CV. HANDAYANI pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 tanggal 10 September 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:37:43","2015-03-13 04:37:43","admin","1","250","admin");
INSERT INTO arsipnew VALUES("291","GA/2A/BA.3/001/251","1","2","4","1","291","UNDANGAN CV. HANDAYANI.PDF","005","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan Pembuktian dan Klarifikasi Dokumen Penawaran CV. HANDAYANI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 048.2/KEG.BPD8/9/2013 tanggal 11 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:41:08","2015-03-13 04:41:08","admin","1","251","admin");
INSERT INTO arsipnew VALUES("292","GA/2A/BA.3/001/252","1","2","4","1","292","UNDANGAN CV. WIDYA BAKTI UTAMA.PDF","005","","0","","proyek","0000-00-00","9","2013","Surat","T","","UNDANGAN","Undangan Pembuktian dan Klarifikasi Dokumen Penawaran CV. WIDYA BAKTI UTAMA Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 048.1/KEG.BPD8/9/2013 tanggal 11 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:42:32","2015-03-13 04:42:32","admin","1","252","admin");
INSERT INTO arsipnew VALUES("293","GA/2A/BA.3/001/253","1","2","4","1","293","BA PEMBUKTIAN DOK. KUALIFIKASI CV. WIDYA BAKTI UTA","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi CV. WIDYA BAKTI UTAMA untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 
\nNomor 051.1/KEG.BPD8/9/2013 tanggal 13 September 2013 ","001.M","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:46:05","2015-03-13 04:46:05","admin","1","253","admin");
INSERT INTO arsipnew VALUES("294","GA/2A/BA.3/001/254","1","2","4","1","294","BA PEMBUKTIAN DOKUMEN KUALIFIKASI CV. HANDAYANI.pd","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Pembuktian Dokumen Kualifikasi CV. HANDAYANI untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 
\nNomor 051.2/KEG.BPD8/9/2013 tanggal 13 September 2013 ","001.M","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:47:15","2015-03-13 04:47:15","admin","1","254","admin");
INSERT INTO arsipnew VALUES("295","GA/2A/BA.3/001/255","1","2","4","1","295","BA HASIL PELELANGAN (BAHP).pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA HASIL PELELANGAN (BAHP)","Berita Acara Hasil Pelelangan (BAHP) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 061/KEG.BPD8/9/2013 tanggal 30 September 2013
\n","001.AJ","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 10:52:10","2015-03-13 04:52:10","admin","1","255","admin");
INSERT INTO arsipnew VALUES("296","GA/2A/BA.3/001/256","1","2","4","1","296","PENETAPAN PEMENANG.PDF","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 063/KEG.BPD8/10/2013 tanggal 02 Oktober 2013","001.N","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 10:55:53","2015-03-13 04:55:53","admin","1","256","admin");
INSERT INTO arsipnew VALUES("297","GA/2A/BA.3/001/257","1","2","4","1","297","PENGUMUMAN PEMENANG (2).PDF","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENGUMUMAN PEMENANG","Pengumuman Pemenang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 064/KEG.BPD8/10/2013 tanggal 02 Oktober 2013","001.O","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:00:13","2015-03-13 05:00:13","admin","1","257","admin");
INSERT INTO arsipnew VALUES("298","GA/2A/BA.3/001/258","1","2","4","1","298","SURAT PENUNJUKAN PENYEDIA JASA (SPPJ).PDF","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Barang Jasa (SPPBJ) CV. HANDAYANI Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 77/KEG.BPD8/10/2013 tanggal 17 Oktober 2013","001.P","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:04:22","2015-03-13 05:04:22","admin","1","258","admin");
INSERT INTO arsipnew VALUES("299","GA/2A/BA.3/001/259","1","2","4","1","299","PENELITIAN DOKUMEN PENAWARAN CV. HANDAYANI2.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. HANDAYANI untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 11:14:26","2015-03-13 05:14:26","admin","1","259","admin");
INSERT INTO arsipnew VALUES("300","GA/2A/BA.3/001/260","1","2","4","1","300","PENELITIAN DOKUMEN PENAWARAN CV. HAPSA MAS2.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. HAPSAMAS untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 11:16:00","2015-03-13 05:16:00","admin","1","260","admin");
INSERT INTO arsipnew VALUES("301","GA/2A/BA.3/001/261","1","2","4","1","301","PENELITIAN DOKUMEN PENAWARAN CV. WIDYA BHAKTI UTAM","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA PENELITIAN DOKUMEN PENAWARAN","Penelitian Dokumen Penawaran dan Lembar Kerja Penilaian Teknis CV. WIDYA BHAKTI UTAMA untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 2013","001.J","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 11:17:22","2015-03-13 05:17:22","admin","1","261","admin");
INSERT INTO arsipnew VALUES("302","GA/2A/BA.3/001/262","1","2","4","1","302","SURAT KUASA CV. HANDAYANI.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Kuasa CV. HANDAYANI Nomor 094/HYN/SK/Adm.U/X/2013 tanggal 18 Oktober 2013","001.P","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:20:13","2015-03-13 05:20:13","admin","1","262","admin");
INSERT INTO arsipnew VALUES("303","GA/2A/BA.3/001/263","1","2","4","1","303","DAFTAR GAMBAR ARSITEKTUR.pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Arsitektur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Tahun Anggaran 2013","001.R","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:22:53","2015-03-13 05:22:53","admin","1","263","admin");
INSERT INTO arsipnew VALUES("304","GA/2A/BA.3/001/264","1","2","4","1","304","DAFTAR GAMBAR MEKANIKAL DAN ELEKTRIKAL.pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Mekanikal Elektrikal Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Tahun Anggaran 2013","001.R","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:24:17","2015-03-13 05:24:17","admin","1","264","admin");
INSERT INTO arsipnew VALUES("305","GA/2A/BA.3/001/265","1","2","4","1","305","DAFTAR GAMBAR STRUKTUR.pdf","051","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DETAIL ENGINEERING DETAIL (DED)","Detail Engineering Design Struktur Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Tahun Anggaran 2013","001.R","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 11:25:27","2015-03-13 05:25:27","admin","1","265","admin");
INSERT INTO arsipnew VALUES("306","GA/2A/BA.3/001/6","1","2","4","1","306","BA EVALUASI DOK KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Berita Acara Evaluasi Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 05/AWSI-BPD8/9/2013 tanggal 19 September 2013","001.S","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 12:36:27","2015-03-13 06:40:23","admin","1","266","admin");
INSERT INTO arsipnew VALUES("307","GA/2A/BA.3/001/267","1","2","4","1","307","BA EVALUASI DOK PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA EVALUASI DOKUMEN PENAWARAN","Berita Acara Evaluasi Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 06/AWSI.BPD8/10/2013 tanggal 03 Oktober 2013","001.T","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 12:39:41","2015-03-13 06:39:41","admin","1","267","admin");
INSERT INTO arsipnew VALUES("308","GA/2A/BA.3/001/268","1","2","4","1","308","BA HASIL PENUNJUKAN LANGSUNG.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA HASIL PENUNJUKAN LANGSUNG (BAHPL)","Berita Acara Hasil Penunjukan Langsung Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 14/AWSI.BPD8/10/2013 tanggal 11 Oktober 2013","001.V","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 12:45:09","2015-03-13 06:45:09","admin","1","268","admin");
INSERT INTO arsipnew VALUES("309","GA/2A/BA.3/001/269","1","2","4","1","309","BA KLARIFIKASI & NEGOSIASI DOK. PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA HASIL KLARIFIKASI & NEGOSIASI","Berita Acara Klarifikasi dan Negosiasi Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 13/AWSI.BPD8/10/2013 tanggal 09 Oktober 2013","001.U","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 12:48:34","2015-03-13 06:48:34","admin","1","269","admin");
INSERT INTO arsipnew VALUES("310","GA/2A/BA.3/001/270","1","2","4","1","310","BA PEMB DOK PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA PEMBUKAAN DOKUMEN PENAWARAN","Berita Acara Pembukaan Dokumen Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 10/AWSI.BPD8/10/2013 tanggal 01 Oktober 2013","001.I","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 12:52:10","2015-03-13 06:52:10","admin","1","270","admin");
INSERT INTO arsipnew VALUES("311","GA/2A/BA.3/001/271","1","2","4","1","311","BA PENJELASAN PEKERJAAN (AANWIZJING).pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA AANWIJZING","Berita Acara Penjelasan Pekerjaan (Aanwizjing) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 09/AWSI.BPD8/9/2013 tanggal 23 Oktober 2013","001.H","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 12:55:31","2015-03-13 06:55:30","admin","1","271","admin");
INSERT INTO arsipnew VALUES("312","GA/2A/BA.3/001/272","1","2","4","1","312","BA RAPAT PEMBUKTIAN DOK. KUALIFIKASI.pdf","027.2","","0","","proyek","0000-00-00","9","2013","Surat","T","","BA PEMBUKTIAN DOKUMEN KUALIFIKASI","Berita Acara Rapat Pembuktian Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 07/AWSI.BPD8/9/2013 tanggal 20 September 2013","001.M","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 12:59:26","2015-03-13 06:59:26","admin","1","272","admin");
INSERT INTO arsipnew VALUES("313","GA/2A/BA.3/001/273","1","2","4","1","313","BA RAPAT PERSIAPAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","BA RAPAT PERSIAPAN","Berita Acara Rapat Persiapan Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 001.1/AWSI.BPD8/8/2013 tanggal 19 Agustus 2013","001.W","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 13:02:36","2015-03-13 07:02:36","admin","1","273","admin");
INSERT INTO arsipnew VALUES("314","GA/2A/BA.3/001/274","1","2","4","1","314","DOKUMEN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN KUALIFIKASI","Dokumen Kualifikasi Nomor 01/AWSI.BPD8/8/2013 tanggal 19 Agustus 2013 Untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.X","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 13:05:28","2015-03-13 07:05:28","admin","1","274","admin");
INSERT INTO arsipnew VALUES("315","GA/2A/BA.3/001/275","1","2","4","1","315","DOKUMEN PEMILIHAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN PEMILIHAN","Dokumen Pemilihan Nomor 02/AWSI.BPD8/8/2013 tanggal 19 Agustus 2013 untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Z","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 13:08:45","2015-03-13 07:08:45","admin","1","275","admin");
INSERT INTO arsipnew VALUES("317","GA/2A/BA.3/001/276","1","2","4","1","317","PENELITIAN DAN PENILAIAN DOKUMEN ADMINISTRASI DAN ","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","BA EVALUASI DOKUMEN KUALIFIKASI","Penelitian dan Penilaian Dokumen Administrasi dan Teknis Untuk Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.S","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:16:15","2015-03-13 07:16:15","admin","1","276","admin");
INSERT INTO arsipnew VALUES("318","GA/2A/BA.3/001/277","1","2","4","1","318","PENETAPAN HASIL KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","PENETAPAN HASIL KUALIFIKASI","Penetapan Hasil Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 08/AWSI.BPD8/9/2013 tanggal 20 September 2013","001.AO","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:23:47","2015-03-13 07:23:47","admin","1","277","admin");
INSERT INTO arsipnew VALUES("319","GA/2A/BA.3/001/278","1","2","4","1","319","PENETAPAN PEMENANG.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENETAPAN PEMENANG","Penetapan Pemenang Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 15/AWSI.BPD/10/2013 tanggal 16 Oktober 2013","001.N","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-13 13:26:33","2015-03-13 07:26:33","admin","1","278","admin");
INSERT INTO arsipnew VALUES("320","GA/2A/BA.3/001/279","1","2","4","1","320","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA","Pengumuman Penunjukan Langsung Penyedia Jasa Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 16/AWSI.BPD8/10/2013 tanggal 16 Oktober 2013","001.AN","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 13:29:46","2015-03-13 07:29:46","admin","1","279","admin");
INSERT INTO arsipnew VALUES("321","GA/2A/BA.3/001/0","1","2","4","1","321","SURAT PENUNJUKAN PENYEDIA DAN PELAKSANA PAKET PEKE","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Barang Jasa (SPPBJ) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 077/KEG.BPD8/10/2013 tanggal 17 Oktober 2013","001.P","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 13:33:26","2015-03-13 07:48:41","admin","1","280","admin");
INSERT INTO arsipnew VALUES("322","GA/2A/BA.3/001/281","1","2","4","1","322","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","005","","0","","proyek","0000-00-00","10","2013","Surat","T","","UNDANGAN","Undangan Klarifikasi dan Negosiasi CV. ADICIPTA MANUNGGAL untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 12/AWSI.BPD8/10/2013 tanggal 08 Oktober 2013","001.L","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-13 13:37:06","2015-03-13 07:37:06","admin","1","281","admin");
INSERT INTO arsipnew VALUES("323","GA/2A/BA.3/001/282","1","2","4","1","323","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","005","","0","","proyek","0000-00-00","9","2013","Laporan","T","","UNDANGAN","Undangan Pembuktian Dokumen Kualifikasi CV. ADICIPTA MANUNGGAL untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 06/AWSI.BPD8/9/2013 tanggal 19 September 2013","001.L","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:39:45","2015-03-13 07:39:45","admin","1","282","admin");
INSERT INTO arsipnew VALUES("324","GA/2A/BA.3/001/283","1","2","4","1","324","DAFTAR ANALISA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Analisa Satuan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:51:44","2015-03-13 07:51:44","admin","1","283","admin");
INSERT INTO arsipnew VALUES("325","GA/2A/BA.3/001/284","1","2","4","1","325","DAFTAR HARGA SATUAN BAHAN, UPAH & ALAT.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Bahan, Upah dan Alat Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:54:02","2015-03-13 07:54:02","admin","1","284","admin");
INSERT INTO arsipnew VALUES("326","GA/2A/BA.3/001/285","1","2","4","1","326","DAFTAR HARGA SATUAN PEKERJAAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Harga Satuan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:56:07","2015-03-13 07:56:07","admin","1","285","admin");
INSERT INTO arsipnew VALUES("328","GA/2A/BA.3/001/286","1","2","4","1","328","REKAP RAB.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Rekap Rencana Anggaran Biaya Pekerjaan Pembangunan Gedung PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 13:59:28","2015-03-13 07:59:28","admin","1","286","admin");
INSERT INTO arsipnew VALUES("329","GA/2A/BA.3/001/287","1","2","4","1","329","RENCANA ANGGARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Rencana Anggaran Biaya Pekerjaan Pembangunan Gedung kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:01:12","2015-03-13 08:01:11","admin","1","287","admin");
INSERT INTO arsipnew VALUES("330","GA/2A/BA.3/001/288","1","2","4","1","330","SURAT PENAWARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","PENAWARAN ","Surat Penawaran Biaya Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 117/HYN/BIAYA/VIII/ 2013 tanggal 13 September 2013","001.AB","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:04:21","2015-03-13 08:04:21","admin","1","288","admin");
INSERT INTO arsipnew VALUES("331","GA/2A/BA.3/001/289","1","2","4","1","331","BROSUR.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Bosur Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggarn 2013 ","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:16:28","2015-03-13 08:16:28","admin","1","289","admin");
INSERT INTO arsipnew VALUES("332","GA/2A/BA.3/001/290","1","2","4","1","332","DAFTAR BAGIAN PEKERJAAN YANG DI SUBKONTRAKTORKAN.p","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Bagian Pekerjaan yang di Subkontraktorkan CV. Hanyadani Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:19:38","2015-03-13 08:19:38","admin","1","290","admin");
INSERT INTO arsipnew VALUES("333","GA/2A/BA.3/001/291","1","2","4","1","333","DAFTAR PENGALAMAN PERUSAHAAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Pengalaman Perusahaan CV. Handayani Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangun Daerah Capem Ngadirejo Temanggung Tahun Anggaran 2013 ","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:22:40","2015-03-13 08:22:40","admin","1","291","admin");
INSERT INTO arsipnew VALUES("334","GA/2A/BA.3/001/292","1","2","4","1","334","DAFTAR PERALATAN UTAMA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Peralatan Utama CV. HANADAYANI Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:26:10","2015-03-13 08:26:10","admin","1","292","admin");
INSERT INTO arsipnew VALUES("335","GA/2A/BA.3/001/293","1","2","4","1","335","DAFTAR PERSONIL INTI.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Personil Inti CV. HANADAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:33:45","2015-03-13 08:33:45","admin","1","293","admin");
INSERT INTO arsipnew VALUES("336","GA/2A/BA.3/001/294","1","2","4","1","336","DAFTAR SPESIFIKASI TEKNIS.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Daftar Spesifikasi Teknis CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:35:59","2015-03-13 08:35:59","admin","1","294","admin");
INSERT INTO arsipnew VALUES("338","GA/2A/BA.3/001/295","1","2","4","1","338","DOKUMEN KUALIFIKASI.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Dokumen Kualifikasi CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bamk Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:39:32","2015-03-13 08:39:32","admin","1","295","admin");
INSERT INTO arsipnew VALUES("339","GA/2A/BA.3/001/296","1","2","4","1","339","JADWAL WAKTU PELAKSANAAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Jadwal Waktu Pelaksanaan CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:41:55","2015-03-13 08:41:54","admin","1","296","admin");
INSERT INTO arsipnew VALUES("340","GA/2A/BA.3/001/297","1","2","4","1","340","METODA PELAKSANAAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Metoda Pelaksanaan CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013 ","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:44:02","2015-03-13 08:44:02","admin","1","297","admin");
INSERT INTO arsipnew VALUES("341","GA/2A/BA.3/001/298","1","2","4","1","341","NETWORK PLANNING.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","DOKUMEN PENAWARAN FISIK","Net Work Planning CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 14:46:44","2015-03-13 08:46:44","admin","1","298","admin");
INSERT INTO arsipnew VALUES("342","GA/2A/BA.3/001/299","1","2","4","1","342","SISTEM KOORDINASI.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN FISIK","Sistem Kordinasi CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-13 15:07:19","2015-03-13 09:07:19","admin","1","299","admin");
INSERT INTO arsipnew VALUES("343","GA/2A/BA.3/001/300","1","2","4","1","343","SURAT JAMINAN PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Surat","T","","DOKUMEN PENAWARAN FISIK","Surat Jaminan Penawaran CV. HANDAYANI untuk Dokumen Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.Y","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-13 15:09:33","2015-03-13 09:09:33","admin","1","300","admin");
INSERT INTO arsipnew VALUES("344","GA/2A/BA.3/001/1","1","2","4","1","344","SURAT KUASA.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","DOKUMEN PENAWARAN FISIK","Surat Kuasa CV. HANDAYANI nomor 115/HYN/SK/Amd.U/IX/2013 tanggal 03 September 2013","001.Y","1","9","10","2023","2023-09-01","","0","1","Copy","","1","2015-03-13 15:11:59","2015-03-13 09:12:36","admin","1","301","admin");
INSERT INTO arsipnew VALUES("345","GA/2A/BA.3/001/302","1","2","4","1","345","SURAT PENAWARAN.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Surat","T","","PENAWARAN ","Surat Penawaran Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung tahun Anggaran 2013
\nNomor 116/HYM/ADM/III/2013 tanggal 03 September 2013 ","001.AB","1","9","10","2023","2023-09-01","","0","1","Copy","","1","2015-03-13 15:15:44","2015-03-13 09:15:44","admin","1","302","admin");
INSERT INTO arsipnew VALUES("347","GA/2A/BA.3/001/303","1","2","4","1","347","dokumen pengadaan.pdf","027.1","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","DOKUMEN PENGADAAN","Dokumen Pengadaan Nomor 024/KEG.BPD8/8/2013 tanggal 19 Agustus 2013 Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AC","1","9","10","2023","2023-08-01","","0","3","Asli","","1","2015-03-13 15:29:00","2015-03-13 09:29:00","admin","1","303","admin");
INSERT INTO arsipnew VALUES("350","GA/2A/BA.3/001/304","1","2","4","1","350","uitzet.pdf","027.1","","0","","proyek","0000-00-00","11","2013","Surat","T","","BA UITZET LAPANGAN","Berita Acara Pengukuran Lapangan (UITZET) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 02/ACM-Aws/2013 tanggal 01 November 2013","001.AF","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 08:59:19","2015-03-14 02:59:19","admin","1","304","admin");
INSERT INTO arsipnew VALUES("351","GA/2A/BA.3/001/305","1","2","4","1","351","PEMERIKSAAN LAPANGAN.pdf","027.2","","0","","proyek","0000-00-00","11","2013","Surat","T","","ADDENDUM","Pemeriksaan Lapangan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 2013 
\nNomor 03/HYN/BPDN/Adm.Proy/X/2013 tanggal 01 November 2013 ","001.G","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 09:03:42","2015-03-14 03:03:42","admin","1","305","admin");
INSERT INTO arsipnew VALUES("353","GA/2A/BA.3/001/306","1","2","4","1","353","PENGAJUAN PEKERJAAN TAMBAH KURANG.pdf","027.2","","0","","proyek","0000-00-00","11","2013","Surat","T","","ADDENDUM","Pengajuan Pekerjaan Tambah Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung 
\nNomor 04/HYN/BPDN/Amd.Proy/X/2013 tanggal 01 November 2013","001.G","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 09:12:22","2015-03-14 03:12:21","admin","1","306","admin");
INSERT INTO arsipnew VALUES("354","GA/2A/BA.3/001/307","1","2","4","1","354","REKAPITULASI ANGGARAN BIAYA KURANG.pdf","027.2","","0","","proyek","0000-00-00","11","2013","Laporan","T","","ADDENDUM","Rekapitulasi Anggaran Biaya Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\ntanggal 01 November 2013","001.G","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 09:14:59","2015-03-14 03:14:59","admin","1","307","admin");
INSERT INTO arsipnew VALUES("355","GA/2A/BA.3/001/308","1","2","4","1","355","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA (HASIL NEG","027.2","","0","","proyek","0000-00-00","11","2012","Laporan","T","","ADDENDUM","Rakapitulasi Perhitungan Anggaran Biaya (Hasil Negosiasi) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 ","001.G","1","9","10","2022","2022-11-01","","0","1","Copy","","1","2015-03-14 09:18:18","2015-03-14 03:18:18","admin","1","308","admin");
INSERT INTO arsipnew VALUES("356","GA/2A/BA.3/001/309","1","2","4","1","356","RINCIAN PERHITUNGAN ANGGARAN BIAYA (HASIL NEGOSIAS","027.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","BA NEGOSIASI PEKERJAAN TAMBAH KURANG","Rincian Perhitungan Anggaran Biaya (Hasil Negosiasi) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AD","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 09:21:37","2015-03-14 03:21:37","admin","1","309","admin");
INSERT INTO arsipnew VALUES("357","GA/2A/BA.3/001/310","1","2","4","1","357","RINCIAN PERHITUNGAN ANGGARAN BIAYA TAMBAH KURANG.p","027.2","","0","","proyek","0000-00-00","11","2013","Laporan","T","","ADDENDUM","Rincian Perhitungan Anggaran Biaya (Hasil Negosiasi) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.G","1","9","10","2023","2023-11-01","","0","1","Copy","","1","2015-03-14 09:24:13","2015-03-14 03:24:13","admin","1","310","admin");
INSERT INTO arsipnew VALUES("358","GA/2A/BA.3/001/311","1","2","4","1","358","SK PENETAPAN PEKERJAAN TAMBAH KURANG.pdf","027.2","","0","","proyek","0000-00-00","3","2013","Kontrak","T","","SK PENETAPAN PEKERJAAN TAMBAH KURANG","SK Penetapan Pekerjaan Tambah Kurang Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 
\nNomor 178/KEG.BPD8/3/2014 tanggal 19 Maret 2013","001.AH","1","9","10","2023","2023-03-01","","0","1","Copy","","1","2015-03-14 09:27:32","2015-03-14 03:27:32","admin","1","311","admin");
INSERT INTO arsipnew VALUES("359","GA/2A/BA.3/001/2","1","2","4","1","359","SURAT KONTRAK ADENDUM 01.pdf","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","ADDENDUM","Addendum 01 Surat Perjanjian Pekerjaan Jasa Konstruksi (KONTRAK) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 179/KEG.BPD8/3/2013 tanggal 19 Maret 2014","001.G","1","9","10","2024","2024-03-01","","0","3","Asli","","1","2015-03-14 09:30:47","2015-03-14 03:38:06","admin","1","312","admin");
INSERT INTO arsipnew VALUES("360","GA/2A/BA.3/001/313","1","2","4","1","360","SURAT PEMBERITAHUAN UITZET.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Surat","T","","BA UITZET LAPANGAN","Surat Pemberitahun Uitzet Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 02/HYN/BPDN/Amd.Proy/X/2013 tanggal 30 Oktober 2013","001.AF","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-14 09:33:44","2015-03-14 03:33:44","admin","1","313","admin");
INSERT INTO arsipnew VALUES("361","GA/2A/BA.3/001/314","1","2","4","1","361","ADDENDUM 01 KONTRAK.pdf","027.2","","0","","proyek","0000-00-00","11","2014","Kontrak","T","","ADDENDUM","Addendum 01 Surat Perjanjian Pekerajaan Konstruksi (KONTRAK) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 179/KEG.BPD8/3/2014 tanggal 19 Maret 2014","001.G","1","9","10","2024","2024-11-01","","0","3","Asli","","1","2015-03-14 09:37:16","2015-03-14 03:37:16","admin","1","314","admin");
INSERT INTO arsipnew VALUES("362","GA/2A/BA.3/001/315","1","2","4","1","362","SK PENETAPAN PENAMBAHAN WAKTU PELAKSANAAN PEKERJAA","027.2","","0","","proyek","0000-00-00","3","2014","Kontrak","T","","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","SK Penetapan Penambahan Waktu Pelaksanaan Pekerjaan untuk Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 178/KEG.BPD8/3/2014 tanggal 19 Maret 2014","001.AI","1","9","10","2024","2024-03-01","","0","3","Asli","","1","2015-03-14 09:41:23","2015-03-14 03:41:23","admin","1","315","admin");
INSERT INTO arsipnew VALUES("363","GA/2A/BA.3/001/316","1","2","4","1","363","SURAT PERMOHONAN PERPANJANGAN WAKTU PELAKSANAAN.pd","027.2","","0","","proyek","0000-00-00","3","2013","Surat","T","","SK PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN","Surat Permohonan Perpanjangan Waktu Pelaksanaan Pekerjaan Pengawasan Pembangunan Gedung Kantor PT> Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 24.04/ACM-SP/III/2014 tanggal 24 Maret 2013","001.AI","1","9","10","2023","2023-03-01","","0","1","Asli","","1","2015-03-14 09:44:39","2015-03-14 03:44:39","admin","1","316","admin");
INSERT INTO arsipnew VALUES("364","GA/2A/BA.3/001/317","1","2","4","1","364","ADDENDUM 2 DOKUMEN PENGADAAN.pdf","027.2","","0","","proyek","0000-00-00","8","2013","Kontrak","T","","ADDENDUM","Addendum II Dokumen Pengadaan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\ntanggal 30 Agustus 2013","001.G","1","9","10","2023","2023-08-01","","0","3","Copy","","1","2015-03-14 10:01:10","2015-03-14 04:01:10","admin","1","317","admin");
INSERT INTO arsipnew VALUES("365","GA/2A/BA.3/001/318","1","2","4","1","365","GAMBAR DENAH2.pdf","027.2","","0","","proyek","0000-00-00","8","2013","Laporan","T","","ADDENDUM","Gambar Denah dalam Addendum Dokumen Pelelangan Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.G","1","9","10","2023","2023-08-01","","0","1","Asli","","1","2015-03-14 10:03:24","2015-03-14 04:03:24","admin","1","318","admin");
INSERT INTO arsipnew VALUES("366","GA/2A/BA.3/001/319","1","2","4","1","366","PT BRI.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENAWARAN ","Garansi Bank untuk Jaminan Pelaksanaan Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 ","001.AB","1","9","10","2023","2023-10-01","","0","3","Copy","","1","2015-03-14 10:06:05","2015-03-14 04:06:05","admin","1","319","admin");
INSERT INTO arsipnew VALUES("367","GA/2A/BA.3/001/320","1","2","4","1","367","spesifikasi umum.pdf","027.2","","0","","proyek","0000-00-00","11","2013","Kontrak","T","","KONTRAK","Spesifikasi Umum Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-11-01","","0","3","Copy","","1","2015-03-14 10:08:33","2015-03-14 04:08:33","admin","1","320","admin");
INSERT INTO arsipnew VALUES("368","GA/2A/BA.3/001/321","1","2","4","1","368","SURAT PENAWARAN PEMBANGUNAN GEDUNG KANTOR CABANG.p","027.2","","0","","proyek","0000-00-00","9","2013","Surat","T","","PENAWARAN ","Surat Penawaran Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 17/HYN/BIAYA/VIII/2013 tanggal 3 September 2013","001.AB","1","9","10","2023","2023-09-01","","0","1","Copy","","1","2015-03-14 10:19:18","2015-03-14 04:19:18","admin","1","321","admin");
INSERT INTO arsipnew VALUES("369","GA/2A/BA.3/001/322","1","2","4","1","369","SURAT PERINTAH MULAI KERJA.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja (SPMK) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013 
\nNomor 088/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.AL","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-14 10:22:53","2015-03-14 04:22:53","admin","1","322","admin");
INSERT INTO arsipnew VALUES("370","GA/2A/BA.3/001/323","1","2","4","1","370","SURAT PERJANJIAN.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 087/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:25:57","2015-03-14 04:25:57","admin","1","323","admin");
INSERT INTO arsipnew VALUES("371","GA/2A/BA.3/001/324","1","2","4","1","371","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:27:37","2015-03-14 04:27:37","admin","1","324","admin");
INSERT INTO arsipnew VALUES("372","GA/2A/BA.3/001/325","1","2","4","1","372","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pembangunan Gedung PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:29:29","2015-03-14 04:29:29","admin","1","325","admin");
INSERT INTO arsipnew VALUES("373","GA/2A/BA.3/001/326","1","2","4","1","373","KERANGKA ACUAN KERJA (KAK).pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Kerangka Acuan Kerja Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","1","Asli","","1","2015-03-14 10:38:09","2015-03-14 04:38:09","admin","1","326","admin");
INSERT INTO arsipnew VALUES("375","GA/2A/BA.3/001/327","1","2","4","1","375","rab.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Laporan","T","","DOKUMEN PENAWARAN PENGAWASAN","Rekapitulasi Anggaran Biaya Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.YY","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-14 10:42:30","2015-03-14 04:42:30","admin","1","327","admin");
INSERT INTO arsipnew VALUES("376","GA/2A/BA.3/001/328","1","2","4","1","376","SURAT PENAWARAN BIAYA.pdf","027.1","","0","","proyek","0000-00-00","10","2013","Surat","T","","PENAWARAN ","Surat Penawaran Biaya Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggarn 2013
\nNomor 1.1a/ACM-PNW/X/2013 tanggal 01 Oktober 2013","001.AB","1","9","10","2023","2023-10-01","","0","1","Copy","","1","2015-03-14 10:45:20","2015-03-14 04:45:20","admin","1","328","admin");
INSERT INTO arsipnew VALUES("377","GA/2A/BA.3/001/329","1","2","4","1","377","SURAT PENUNJUKAN PENYEDIA PELAKSANA.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","SURAT PENUNJUKAN PENYEDIA BARANG/JASA","Surat Penunjukan Penyedia Barang/Jasa (SPPBJ) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 077.1/KEG.BPD8/10/2013 tanggal 17 Oktober 2013","001.P","1","9","10","2023","2023-10-01","","0","3","Copy","","1","2015-03-14 10:48:54","2015-03-14 04:48:54","admin","1","329","admin");
INSERT INTO arsipnew VALUES("378","GA/2A/BA.3/001/330","1","2","4","1","378","SURAT PERINTAH MULAI KERJA.pdf","027","","0","","proyek","0000-00-00","10","2013","Surat","T","","SPMK","Surat Perintah Mulai Kerja (SPMK) Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 090/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.AL","1","9","10","2023","2023-10-01","","0","3","Copy","","1","2015-03-14 10:51:20","2015-03-14 04:51:20","admin","1","330","admin");
INSERT INTO arsipnew VALUES("379","GA/2A/BA.3/001/331","1","2","4","1","379","SURAT PERJANJIAN KERJA.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Surat Perjanjian Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013
\nNomor 088/KEG.BPD8/10/2013 tanggal 28 Oktober 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:55:38","2015-03-14 04:55:38","admin","1","331","admin");
INSERT INTO arsipnew VALUES("380","GA/2A/BA.3/001/332","1","2","4","1","380","SYARAT-SYARAT KHUSUS KONTRAK.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Khusus Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggarn 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:57:31","2015-03-14 04:57:31","admin","1","332","admin");
INSERT INTO arsipnew VALUES("381","GA/2A/BA.3/001/333","1","2","4","1","381","SYARAT-SYARAT UMUM KONTRAT.pdf","027.2","","0","","proyek","0000-00-00","10","2013","Kontrak","T","","KONTRAK","Syarat-syarat Umum Kontrak Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AK","1","9","10","2023","2023-10-01","","0","3","Asli","","1","2015-03-14 10:59:36","2015-03-14 04:59:35","admin","1","333","admin");
INSERT INTO arsipnew VALUES("382","GA/2A/BA.3/001/334","1","2","4","1","382","bulan 1.pdf","051.1","","0","","proyek","0000-00-00","11","2013","Laporan","T","","LAPORAN","Laporan Bulanan Ke 1 (28 Oktober 2013-30 Novmber 2013) Pekerjaan Pembangunan Gedung PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AM","1","9","10","2023","2023-11-01","","0","1","Asli","","1","2015-03-14 11:29:24","2015-03-14 05:29:24","admin","1","334","admin");
INSERT INTO arsipnew VALUES("383","GA/2A/BA.3/001/5","1","2","4","1","383","bulan 2.pdf","051.1","","0","","proyek","0000-00-00","1","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 2 (1 Desember 2013-4 Januari 2014) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-01-01","","0","1","Asli","","1","2015-03-14 11:31:53","2015-03-14 05:35:24","admin","1","335","admin");
INSERT INTO arsipnew VALUES("384","GA/2A/BA.3/001/336","1","2","4","1","384","bulan 3.pdf","051.1","","0","","proyek","0000-00-00","2","2013","Laporan","T","","LAPORAN","Laporan Bulanan Ke 3 (5 Januari 2014 - 1 Februari 2014) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Tahun Anggaran 2013","001.AM","1","9","10","2023","2023-02-01","","0","1","Asli","","1","2015-03-14 11:34:44","2015-03-14 05:34:44","admin","1","336","admin");
INSERT INTO arsipnew VALUES("385","GA/2A/BA.3/001/337","1","2","4","1","385","bulan 4.pdf","051.1","","0","","proyek","0000-00-00","2","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 4 (2 Februari 2014 - 8 Februari 2014) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-02-01","","0","1","Asli","","1","2015-03-14 11:39:06","2015-03-14 05:39:05","admin","1","337","admin");
INSERT INTO arsipnew VALUES("386","GA/2A/BA.3/001/338","1","2","4","1","386","bulan 5.pdf","051.1","","0","","proyek","0000-00-00","3","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 5 (2 Maret 2014 - 28 Maret 2014) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-03-01","","0","1","Asli","","1","2015-03-14 11:41:39","2015-03-14 05:41:39","admin","1","338","admin");
INSERT INTO arsipnew VALUES("387","GA/2A/BA.3/001/339","1","2","4","1","387","bulan 6.pdf","051.1","","0","","proyek","0000-00-00","4","2014","Laporan","T","","LAPORAN","Laporan Bulanan Ke 6 (30 Maret 2014 - 19 April 2014) Pekerjaan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.AM","1","9","10","2024","2024-04-01","","0","1","Asli","","1","2015-03-14 11:44:12","2015-03-14 05:44:12","admin","1","339","admin");
INSERT INTO arsipnew VALUES("388","GA/2A/BA.3/001/0","1","2","4","1","388","dakumen prakualifikasi.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN KUALIFIKASI","Dokumen Kualifikasi Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.X","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-14 12:01:12","2015-03-14 06:04:11","admin","1","340","admin");
INSERT INTO arsipnew VALUES("389","GA/2A/BA.3/001/341","1","2","4","1","389","dokumen teknis adn administrasi.pdf","027.1","","0","","proyek","0000-00-00","9","2013","Laporan","T","","DOKUMEN PENAWARAN PENGAWASAN","Dokumen Teknis dan Administrasi untuk Penawaran Pekerjaan Pengawasan Pembangunan Gedung Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Ngadirejo Temanggung Tahun Anggaran 2013","001.YY","1","9","10","2023","2023-09-01","","0","1","Asli","","1","2015-03-14 12:03:31","2015-03-14 06:03:31","admin","1","341","admin");
INSERT INTO arsipnew VALUES("1001","GA/1A/BA.1/001/2","1","1","1","1","4444","ARSITEKTUR.pdf","051","","0","","proyek","0000-00-00","10","2011","Laporan","T","","AS BUILT DRAWING","As Built Drawing Arsitektur Proyek Pembangunan Kantor PT. Bank Pembangunan Daerah Jawa Tengah Capem Baturetno Tahun Anggaran 2013","001.A","1","9","10","2021","2021-10-01","","0","1","Asli","","1","2015-03-07 16:33:20","2015-03-11 08:14:17","ida","2","2","admin");



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

INSERT INTO bentuk_redaksi VALUES("1","T","Surat","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("2","T","Laporan","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("3","T","Kontrak","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("4","T","Notulen","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("5","NT","Gambar","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("6","NT","Audio","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("7","NT","Video","2015-02-09 10:20:37","","");
INSERT INTO bentuk_redaksi VALUES("8","NT","Lainnya","2015-02-09 10:20:37","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='tempat untuk box / rack';

INSERT INTO box VALUES("1","1","1","BA.1","Box Baturetno","2015-03-07 14:23:08","2015-03-07 08:23:08","admin");
INSERT INTO box VALUES("3","1","1","BA.2","BoxCepu","2015-03-07 15:37:58","2015-03-13 03:34:54","admin");
INSERT INTO box VALUES("4","1","2","BA.3","Box Ngadirejo","2015-03-13 09:33:55","2015-03-13 03:35:10","admin");



DROP TABLE IF EXISTS file;

CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(127) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_at` timestamp NULL DEFAULT NULL,
  `by_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81232324 DEFAULT CHARSET=latin1;

INSERT INTO file VALUES("1","MEKANIKAL ELEKTRIKAL.pdf","2015-03-09 08:53:43","2015-03-09 02:53:43","admin");
INSERT INTO file VALUES("2","STRUKTUR.pdf","2015-03-09 09:05:54","2015-03-09 03:05:54","admin");
INSERT INTO file VALUES("3","PERJANJIAN KERJASAMA TEKNIS.PDF","2015-03-09 09:13:53","2015-03-09 03:13:53","admin");
INSERT INTO file VALUES("4","PENGUMUMAN LELANG DG PASACAKUALIFIKASI.pdf","2015-03-09 09:32:48","2015-03-09 03:32:48","admin");
INSERT INTO file VALUES("5","PENGUMUMAN LELANG SUARA MERDEKA.pdf","2015-03-09 09:40:56","2015-03-09 03:40:56","admin");
INSERT INTO file VALUES("6","SK PEMBENTUKAN PANITIA PENGADAAN JASA.pdf","2015-03-09 09:48:09","2015-03-09 03:48:09","admin");
INSERT INTO file VALUES("7","PEMASUKAN DOKUMEN PENAWARAN.PDF","2015-03-09 10:04:54","2015-03-09 04:04:54","admin");
INSERT INTO file VALUES("8","PENDAFTARAN PESERTA LELANG.pdf","2015-03-09 10:07:41","2015-03-09 04:07:41","admin");
INSERT INTO file VALUES("9","ADDEDUM II DOKUMEN PENGADAAN.pdf","2015-03-09 10:15:17","2015-03-09 04:15:17","admin");
INSERT INTO file VALUES("10","BA RAPAT PENJELASAN PEKERJAAN TAHAP II.pdf","2015-03-09 10:23:12","2015-03-09 04:23:12","admin");
INSERT INTO file VALUES("11","BA PEMBUKAAN DOK. PENAWARAN SAMPUL I.PDF","2015-03-09 10:30:13","2015-03-09 04:30:13","admin");
INSERT INTO file VALUES("12","PENGUMUMAN PELELANGAN ULANG UMUM DG PASCAKUALIFIKASI.pdf","2015-03-09 10:42:28","2015-03-09 04:42:28","admin");
INSERT INTO file VALUES("13","PENGUMUMAN LELANG SUARA MERDEKA.pdf","2015-03-09 10:52:33","2015-03-09 04:52:33","admin");
INSERT INTO file VALUES("14","PENDAFTARAN PESERTA LELANG 1.pdf","2015-03-09 10:58:25","2015-03-09 04:58:25","admin");
INSERT INTO file VALUES("15","ADDED DOK LELANGAN UMUM (LELANG ULANG).pdf","2015-03-09 11:11:25","2015-03-09 05:11:25","admin");
INSERT INTO file VALUES("16","BA RAPAT PENJELASAN PEK. (AANWIJZING).PDF","2015-03-09 11:19:27","2015-03-09 05:19:27","admin");
INSERT INTO file VALUES("17","BA PEMB. DOK. PENAWARAN SAMPUL I.PDF","2015-03-09 11:30:07","2015-03-09 05:30:07","admin");
INSERT INTO file VALUES("18","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN SAMPUL I.PDF","2015-03-09 11:39:48","2015-03-09 05:39:48","admin");
INSERT INTO file VALUES("19","BA DOK PENAW SAMPUL II.PDF","2015-03-09 11:53:29","2015-03-09 05:53:29","admin");
INSERT INTO file VALUES("20","BA PEN DOK. PENAWARAN SAMPUL II.PDF","2015-03-09 12:01:36","2015-03-09 06:01:36","admin");
INSERT INTO file VALUES("21","UNDAGAN CV. NADU WIJAYA.PDF","2015-03-09 12:06:59","2015-03-09 06:06:59","admin");
INSERT INTO file VALUES("22","UNDANGAN CV. GIRI JATI.PDF","2015-03-09 12:14:34","2015-03-09 06:14:34","admin");
INSERT INTO file VALUES("23","UNDANGAN CV. GIRI JATI.PDF","2015-03-09 12:19:42","2015-03-09 06:19:42","admin");
INSERT INTO file VALUES("24","UNDANGAN CV. SARANA WIJAYA.PDF","2015-03-09 12:24:56","2015-03-09 06:24:56","admin");
INSERT INTO file VALUES("25","BA PEMBUKTIAN DOK. KUALIFIKASI.pdf","2015-03-09 13:10:30","2015-03-09 07:10:30","admin");
INSERT INTO file VALUES("26","BERITA ACARA HASIL PELELANGAN (BAHP).PDF","2015-03-09 13:15:43","2015-03-09 07:15:43","admin");
INSERT INTO file VALUES("27","SPPBJ.PDF","2015-03-09 13:30:44","2015-03-09 07:30:44","admin");
INSERT INTO file VALUES("28","PENGAMBILAN DOKUMEN PENGADAAN (PELELANGAN ULANG).pdf","2015-03-09 13:38:08","2015-03-09 07:38:08","admin");
INSERT INTO file VALUES("29","UNDANGAN CV. BAYU SAKTI.pdf","2015-03-09 13:53:56","2015-03-09 07:53:56","admin");
INSERT INTO file VALUES("30","UNDANGAN CV. GIRI JATI.pdf","2015-03-09 14:01:11","2015-03-09 08:01:11","admin");
INSERT INTO file VALUES("31","UNDANGAN CV. WIDYA BAKTI UTAMA.pdf","2015-03-09 14:04:29","2015-03-09 08:04:29","admin");
INSERT INTO file VALUES("32","UNDANGAN NADUWIJAYA.pdf","2015-03-09 14:06:43","2015-03-09 08:06:43","admin");
INSERT INTO file VALUES("33","UNGADAN CV. BELLA.pdf","2015-03-09 14:08:42","2015-03-09 08:08:42","admin");
INSERT INTO file VALUES("34","PENELITIAN DOKUMEN PENAWARAN CV. GIRI JATI.pdf","2015-03-09 14:11:56","2015-03-09 08:11:56","admin");
INSERT INTO file VALUES("35","PENELITIAN DOKUMEN PENAWARAN CV. NADUWIJAYA.pdf","2015-03-09 14:25:26","2015-03-09 08:25:26","admin");
INSERT INTO file VALUES("36","PENELITIAN DOKUMEN PENAWARAN CV. SARANA WIJAYA.pdf","2015-03-09 14:31:36","2015-03-09 08:31:36","admin");
INSERT INTO file VALUES("37","BERITA ACARA PEMBUKTIAN DOK. KUALIFIKASI CV. GIRI JATI.PDF","2015-03-09 14:41:47","2015-03-09 08:41:47","admin");
INSERT INTO file VALUES("38","BERITA ACARA PEMBUKTIAN DOK. KUALIFIKASI CV. NADUWIJAYA.pdf","2015-03-09 14:48:34","2015-03-09 08:48:34","admin");
INSERT INTO file VALUES("39","(1) BERITA ACARA RAPAT PENJELASAN PEKERJAAAN (AANWIZJING) TAHAP II.pdf","2015-03-09 15:07:14","2015-03-09 09:07:14","admin");
INSERT INTO file VALUES("40","ARSITEKTUR.pdf","2015-03-09 15:29:45","2015-03-09 09:29:45","admin");
INSERT INTO file VALUES("41","MEKANIKAL ELEKTRIKAL.pdf","2015-03-09 15:32:03","2015-03-09 09:32:03","admin");
INSERT INTO file VALUES("42","STRUKTUR.pdf","2015-03-09 15:35:23","2015-03-09 09:35:23","admin");
INSERT INTO file VALUES("43","BA EVALUASI DOK KUALIFIKASI.pdf","2015-03-10 08:06:16","2015-03-10 02:06:16","admin");
INSERT INTO file VALUES("44","BA EVALUASI DOK PENAWARAN.pdf","2015-03-10 08:13:02","2015-03-10 02:13:02","admin");
INSERT INTO file VALUES("45","BA HASIL KLARIFIKASI & NEGOSIASI DOK. PENAWARAN.pdf","2015-03-10 08:18:41","2015-03-10 02:18:41","admin");
INSERT INTO file VALUES("46","BA HASIL PENUNJUKAN LANGSUNG.pdf","2015-03-10 08:24:21","2015-03-10 02:24:21","admin");
INSERT INTO file VALUES("47","BA PEMB DOK PENAWARAN.pdf","2015-03-10 08:30:35","2015-03-10 02:30:35","admin");
INSERT INTO file VALUES("48","BA PENJELASAN PEKERJAAN.pdf","2015-03-10 08:34:44","2015-03-10 02:34:44","admin");
INSERT INTO file VALUES("49","BA RAPAT PEMBUKTIAN DOK. KUALIFIKASI.pdf","2015-03-10 08:39:47","2015-03-10 02:39:47","admin");
INSERT INTO file VALUES("50","BA RAPAT PERSIAPAN.pdf","2015-03-10 08:44:06","2015-03-10 02:44:06","admin");
INSERT INTO file VALUES("51","DOKUMEN KUALIFIKASI.pdf","2015-03-10 08:49:16","2015-03-10 02:49:16","admin");
INSERT INTO file VALUES("52","DOKUMEN PEMILIHAN.pdf","2015-03-10 08:55:57","2015-03-10 02:55:57","admin");
INSERT INTO file VALUES("53","EVALUASI DOKUMEN KAULIFIKASI.pdf","2015-03-10 09:00:36","2015-03-10 03:00:36","admin");
INSERT INTO file VALUES("54","JADWAL PENUNJUKAN LANGSUNG.pdf","2015-03-10 09:07:20","2015-03-10 03:07:20","admin");
INSERT INTO file VALUES("55","PENELITIAN DAN PENILAIAN DOK. ADMINISTRASI DAN TEKNIS.pdf","2015-03-10 09:12:12","2015-03-10 03:12:12","admin");
INSERT INTO file VALUES("56","PENETAPAN HASIL KUALIFIKASI.pdf","2015-03-10 09:18:54","2015-03-10 03:18:54","admin");
INSERT INTO file VALUES("57","PENETAPAN PEMENANG.pdf","2015-03-10 09:25:34","2015-03-10 03:25:34","admin");
INSERT INTO file VALUES("58","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA 21.pdf","2015-03-10 09:32:07","2015-03-10 03:32:07","admin");
INSERT INTO file VALUES("59","SURAT PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","2015-03-10 09:41:25","2015-03-10 03:41:25","admin");
INSERT INTO file VALUES("60","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","2015-03-10 09:46:19","2015-03-10 03:46:19","admin");
INSERT INTO file VALUES("61","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","2015-03-10 09:51:05","2015-03-10 03:51:05","admin");
INSERT INTO file VALUES("62","ANALISA HARGA SATUAN PEKERJAAN.pdf","2015-03-10 10:02:13","2015-03-10 04:02:13","admin");
INSERT INTO file VALUES("63","DAFTAR HARGA SATUAN BAHAN ATAU UPAH.pdf","2015-03-10 10:08:15","2015-03-10 04:08:15","admin");
INSERT INTO file VALUES("64","DAFTAR HARGA SATUAN PEKERJAAN.pdf","2015-03-10 10:11:46","2015-03-10 04:11:46","admin");
INSERT INTO file VALUES("65","PENAWARAN PEKERJAAN.pdf","2015-03-10 10:20:35","2015-03-10 04:20:35","admin");
INSERT INTO file VALUES("66","REKAP RENCANA ANGGARAN BIAYA.pdf","2015-03-10 10:25:23","2015-03-10 04:25:23","admin");
INSERT INTO file VALUES("67","RENCANA ANGGARAN BIAYA.pdf","2015-03-10 10:29:37","2015-03-10 04:29:37","admin");
INSERT INTO file VALUES("68","DOKUMEN PENGADAAN.pdf","2015-03-10 11:10:21","2015-03-10 05:10:21","admin");
INSERT INTO file VALUES("69","DOKUMEN KUALIFIKASI 2.pdf","2015-03-10 13:15:03","2015-03-10 07:15:03","admin");
INSERT INTO file VALUES("70","BA NEGOSIASI PEKERJAAN TAMBAH KURANG.pdf","2015-03-10 13:20:55","2015-03-10 07:20:55","admin");
INSERT INTO file VALUES("71","BA RAKOR  EVALUASI 1.pdf","2015-03-10 13:27:12","2015-03-10 07:27:12","admin");
INSERT INTO file VALUES("72","BA RAKOR EVALUASI 2 DAN DAFTAR HADIR 27 MARET 2014.pdf","2015-03-10 13:33:11","2015-03-10 07:33:11","admin");
INSERT INTO file VALUES("73","BA RAKOR EVALUASI 2 DAN DAFTAR HADIR.pdf","2015-03-10 13:37:24","2015-03-10 07:37:24","admin");
INSERT INTO file VALUES("74","BA RAKOR EVALUASI 2.pdf","2015-03-10 13:40:48","2015-03-10 07:40:48","admin");
INSERT INTO file VALUES("75","BA UITZET.pdf","2015-03-10 13:47:14","2015-03-10 07:47:14","admin");
INSERT INTO file VALUES("76","PCM.pdf","2015-03-10 14:18:41","2015-03-10 08:18:41","admin");
INSERT INTO file VALUES("77","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA TAMBAH KURANG (HASIL NEGOSIASI).pdf","2015-03-10 14:22:42","2015-03-10 08:22:42","admin");
INSERT INTO file VALUES("78","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA TAMBAH KURANG.pdf","2015-03-10 14:26:41","2015-03-10 08:26:41","admin");
INSERT INTO file VALUES("79","SK PEMIMPIN KEGIATAN PEMBANGUNAN.pdf","2015-03-10 14:30:16","2015-03-10 08:30:16","admin");
INSERT INTO file VALUES("80","SURAT PENGAJUAN PEKERJAAN TAMBAH ADDENDUM.pdf","2015-03-10 14:36:13","2015-03-10 08:36:13","admin");
INSERT INTO file VALUES("81","SURAT PERJANJIAN PEKERJAAN JASA KONSTRUKSI.pdf","2015-03-10 14:43:23","2015-03-10 08:43:23","admin");
INSERT INTO file VALUES("82","LAMPIRAN GAMBAR2.pdf","2015-03-10 14:50:08","2015-03-10 08:50:08","admin");
INSERT INTO file VALUES("83","LAMPIRAN BACKUP PERHITUNGAN.pdf","2015-03-10 14:54:27","2015-03-10 08:54:27","admin");
INSERT INTO file VALUES("84","ADDENDUM 01.pdf","2015-03-10 14:58:15","2015-03-10 08:58:15","admin");
INSERT INTO file VALUES("85","PENETAPAN PENAMBAHAN WAKTU PELAKSANAAN.pdf","2015-03-10 15:02:35","2015-03-10 09:02:35","admin");
INSERT INTO file VALUES("86","PERMOHONAN AMANDEMEN KONTRAK.pdf","2015-03-10 15:07:55","2015-03-10 09:07:55","admin");
INSERT INTO file VALUES("87","ADDENDUM DOKUMEN PELELANGAN UMUM.pdf","2015-03-11 08:28:14","2015-03-11 02:28:14","admin");
INSERT INTO file VALUES("88","BA HASIL PELELANGAN (BAHP).pdf","2015-03-11 08:31:00","2015-03-11 02:31:00","admin");
INSERT INTO file VALUES("89","(D) SYARAT-SYARAT KHUSUS KONTRAK1.pdf","2015-03-11 08:53:16","2015-03-11 02:53:16","admin");
INSERT INTO file VALUES("90","(E) SYARAT-SYARAT UMUM KONTRAK1.pdf","2015-03-11 08:56:49","2015-03-11 02:56:49","admin");
INSERT INTO file VALUES("91","(G) SPESIFIKASI UMUM1.pdf","2015-03-11 08:59:19","2015-03-11 02:59:19","admin");
INSERT INTO file VALUES("92","SURAT PERINTAH MULAI KERJA.pdf","2015-03-11 09:06:23","2015-03-11 03:06:23","admin");
INSERT INTO file VALUES("93","SURAT PERJANJIAN.pdf","2015-03-11 09:10:26","2015-03-11 03:10:26","admin");
INSERT INTO file VALUES("94","KERANGKA ACUAN KERJA.pdf","2015-03-11 09:30:40","2015-03-11 03:30:40","admin");
INSERT INTO file VALUES("95","SURAT PENAWARAN PEKERJAAN PENGAWASAN.pdf","2015-03-11 09:36:04","2015-03-11 03:36:04","admin");
INSERT INTO file VALUES("96","SURAT PENUNJUKAN PENYEDIA JASA KONSULTASI (SPPJ).pdf","2015-03-11 09:41:03","2015-03-11 03:41:03","admin");
INSERT INTO file VALUES("97","SURAT PERINTAH MULAI KERJA (SPMK).pdf","2015-03-11 09:48:16","2015-03-11 03:48:16","admin");
INSERT INTO file VALUES("98","SURAT PERJANJIAN.pdf","2015-03-11 09:53:15","2015-03-11 03:53:15","admin");
INSERT INTO file VALUES("99","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","2015-03-11 09:56:54","2015-03-11 03:56:54","admin");
INSERT INTO file VALUES("100","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","2015-03-11 09:59:15","2015-03-11 03:59:15","admin");
INSERT INTO file VALUES("101","REKAPITULASI RENCANA ANGGARAN BIAYA.pdf","2015-03-11 10:02:47","2015-03-11 04:02:47","admin");
INSERT INTO file VALUES("102","LAPORAN AKHIR PENGAWASAN.pdf","2015-03-11 10:16:20","2015-03-11 04:16:20","admin");
INSERT INTO file VALUES("103","LAPORAN BULAN 1 DESEMBER.pdf","2015-03-11 10:28:12","2015-03-11 04:28:12","admin");
INSERT INTO file VALUES("104","LAPORAN BULAN 2 JANUARI.pdf","2015-03-11 10:31:50","2015-03-11 04:31:50","admin");
INSERT INTO file VALUES("105","LAPORAN BULAN 3 FEBRUARI.pdf","2015-03-11 10:34:18","2015-03-11 04:34:18","admin");
INSERT INTO file VALUES("106","LAPORAN BULAN 4 MARET.pdf","2015-03-11 10:36:49","2015-03-11 04:36:49","admin");
INSERT INTO file VALUES("107","LAPORAN BULAN 5 APRIL.pdf","2015-03-11 10:39:01","2015-03-11 04:39:01","admin");
INSERT INTO file VALUES("108","LAPORAN BULAN 6 MEI.pdf","2015-03-11 10:41:15","2015-03-11 04:41:15","admin");
INSERT INTO file VALUES("109","ARSITEKTUR (ARS).pdf","2015-03-11 11:41:40","2015-03-11 05:41:40","admin");
INSERT INTO file VALUES("110","MEKANIKAL ELEKTRIKAL.pdf","2015-03-11 11:49:59","2015-03-11 05:49:59","admin");
INSERT INTO file VALUES("111","STRUKTUR (STR).pdf","2015-03-11 11:52:40","2015-03-11 05:52:40","admin");
INSERT INTO file VALUES("112","UNDANGAN.PDF","2015-03-11 13:31:45","2015-03-11 07:31:45","admin");
INSERT INTO file VALUES("113","BA PEMB DOK PENAWARAN SAMPUL I.PDF","2015-03-11 13:39:25","2015-03-11 07:39:25","admin");
INSERT INTO file VALUES("114","CV SURYA INDAH.pdf","2015-03-11 13:55:25","2015-03-11 07:55:25","admin");
INSERT INTO file VALUES("115","CV. ALAM JAYA SAKTI.pdf","2015-03-11 14:00:36","2015-03-11 08:00:36","admin");
INSERT INTO file VALUES("116","CV. ASKINDO ABADI.pdf","2015-03-11 14:04:12","2015-03-11 08:04:12","admin");
INSERT INTO file VALUES("117","CV. KARTIKA KARYA.pdf","2015-03-11 14:07:36","2015-03-11 08:07:36","admin");
INSERT INTO file VALUES("118","CV. TRI KARYA.pdf","2015-03-11 14:09:54","2015-03-11 08:09:54","admin");
INSERT INTO file VALUES("119","BA PEMBUKTIAN KUALIFIKASI.PDF","2015-03-11 14:21:26","2015-03-11 08:21:26","admin");
INSERT INTO file VALUES("120","PENGAMBILAN DOKUMEN PENGADAAN2.PDF","2015-03-11 14:27:05","2015-03-11 08:27:05","admin");
INSERT INTO file VALUES("121","PENGUMUMAN LELANG ULANG DG PASCAKUALIFIKASI.PDF","2015-03-11 14:33:07","2015-03-11 08:33:07","admin");
INSERT INTO file VALUES("122","UNDANGAN 2.pdf","2015-03-11 14:37:49","2015-03-11 08:37:49","admin");
INSERT INTO file VALUES("123","UNDANGAN PANITIA.pdf","2015-03-11 14:42:45","2015-03-11 08:42:45","admin");
INSERT INTO file VALUES("124","PENGUMUMAN LELANG DG PASCAKUALIFIKASI.pdf","2015-03-11 14:51:15","2015-03-11 08:51:15","admin");
INSERT INTO file VALUES("125","PENDAFTARAN PESERTA LELANG.pdf","2015-03-11 14:54:58","2015-03-11 08:54:58","admin");
INSERT INTO file VALUES("126","ADDEDUM DOK. PELELANGAN UMUM.pdf","2015-03-11 15:07:58","2015-03-11 09:07:58","admin");
INSERT INTO file VALUES("127","BA PENJELASAN PEKERJAAN TAHAP I.pdf","2015-03-11 15:10:51","2015-03-11 09:10:51","admin");
INSERT INTO file VALUES("128","BILL OF QUANTITY.pdf","2015-03-11 15:14:25","2015-03-11 09:14:25","admin");
INSERT INTO file VALUES("129","PEMASUKAN DOK. PENAWARAN.PDF","2015-03-11 15:32:55","2015-03-11 09:32:55","admin");
INSERT INTO file VALUES("130","BA PEMBUKAAN DOK. PENAWARAN.PDF","2015-03-11 15:37:09","2015-03-11 09:37:09","admin");
INSERT INTO file VALUES("131","PENGUMUMAN LELANG DG PASCAKUALIFIKASI.pdf","2015-03-11 15:42:40","2015-03-11 09:42:40","admin");
INSERT INTO file VALUES("132","PENDAFTARAN PESERTA LELANG ULANG.pdf","2015-03-11 15:49:12","2015-03-11 09:49:12","admin");
INSERT INTO file VALUES("133","ADDEDUM DOK. PELELANGAN UMUM (LELANG ULANG).pdf","2015-03-11 15:53:11","2015-03-11 09:53:11","admin");
INSERT INTO file VALUES("134","BA RAPAT PENJELASAN PEKERJAAN AANWIJZING.pdf","2015-03-11 15:56:04","2015-03-11 09:56:04","admin");
INSERT INTO file VALUES("135","BILL OF QUANTITY.pdf","2015-03-11 15:59:56","2015-03-11 09:59:56","admin");
INSERT INTO file VALUES("172","PEMASUKAN DOK. PENAWARAN (PELELANGAN ULANG).pdf","2015-03-11 16:03:05","2015-03-11 10:03:05","admin");
INSERT INTO file VALUES("173","UNDANGAN CV. ALAM JAYA SAKTI.PDF","2015-03-11 16:05:26","2015-03-11 10:05:26","admin");
INSERT INTO file VALUES("174","UNDANGAN CV. ASKINDO SAKTI.PDF","2015-03-11 16:09:59","2015-03-11 10:09:59","admin");
INSERT INTO file VALUES("175","UNDANGAN CV. BOKAMA JAYA MANDIRI.PDF","2015-03-11 16:13:19","2015-03-11 10:13:19","admin");
INSERT INTO file VALUES("176","UNDANGAN CV. FISADA.PDF","2015-03-11 16:16:14","2015-03-11 10:16:14","admin");
INSERT INTO file VALUES("177","UNDANGAN CV. KARTIKA KARYA.PDF","2015-03-11 16:19:31","2015-03-11 10:19:31","admin");
INSERT INTO file VALUES("178","UNDANGAN CV. SIMPATIK KARYA MANDIRI.PDF","2015-03-11 16:22:28","2015-03-11 10:22:28","admin");
INSERT INTO file VALUES("179","UNDANGAN WIDYA BAKTI UTAMA.PDF","2015-03-11 16:25:22","2015-03-11 10:25:22","admin");
INSERT INTO file VALUES("180","BA PEMB. DOK PENAWARAN SAMPUL.PDF","2015-03-12 08:17:34","2015-03-12 02:17:34","admin");
INSERT INTO file VALUES("181","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN SAMPUL I.PDF","2015-03-12 08:21:13","2015-03-12 02:21:13","admin");
INSERT INTO file VALUES("182","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN SAMPUL I.PDF","2015-03-12 08:22:49","2015-03-12 02:22:49","admin");
INSERT INTO file VALUES("183","UNDANGAN CV. ASKINDO ABADI.PDF","2015-03-12 08:26:41","2015-03-12 02:26:41","admin");
INSERT INTO file VALUES("184","UNDANGAN CV. JAYA ALAM SAKTI.PDF","2015-03-12 08:30:47","2015-03-12 02:30:47","admin");
INSERT INTO file VALUES("185","UNDANGAN CV. KARTIKA KARYA.PDF","2015-03-12 08:34:02","2015-03-12 02:34:02","admin");
INSERT INTO file VALUES("186","BA PEMB. PENAWARAN SAMPUL II.PDF","2015-03-12 08:38:37","2015-03-12 02:38:37","admin");
INSERT INTO file VALUES("187","BA PEMBUKTIAN DOK. KUALIFIKASI.pdf","2015-03-12 08:43:58","2015-03-12 02:43:58","admin");
INSERT INTO file VALUES("188","LEMBAR KERJA PENILAIAN BIAYA CV. ALAM JAYA SAKTI.PDF","2015-03-12 08:48:30","2015-03-12 02:48:30","admin");
INSERT INTO file VALUES("189","LEMBAR KERJA PENILAIAN BIAYA CV. ASKINDO ABADI.PDF","2015-03-12 08:52:23","2015-03-12 02:52:23","admin");
INSERT INTO file VALUES("190","LEMBAR KERJA PENILAIAN BIAYA CV. KARTIKA JAYA.PDF","2015-03-12 08:55:30","2015-03-12 02:55:30","admin");
INSERT INTO file VALUES("191","UNDANGAN  CV. ALAM JAYA SAKTI.PDF","2015-03-12 08:58:21","2015-03-12 02:58:21","admin");
INSERT INTO file VALUES("192","UNDANGAN CV.  ASKINDO ABADI.PDF","2015-03-12 09:03:08","2015-03-12 03:03:08","admin");
INSERT INTO file VALUES("193","UNDANGAN CV. KARTIKA KARYA.PDF","2015-03-12 09:06:06","2015-03-12 03:06:06","admin");
INSERT INTO file VALUES("194","BA PEMBUKTIAN DOK KUALIFIKASI CV. KARTIKA KARYA.pdf","2015-03-12 09:09:47","2015-03-12 03:09:47","admin");
INSERT INTO file VALUES("195","BA PEMBUKTIAN DOK. KUALIFIKASI CV. ASKINDO ABADI.pdf","2015-03-12 09:13:44","2015-03-12 03:13:44","admin");
INSERT INTO file VALUES("196","BA HASIL PELELANGAN.pdf","2015-03-12 09:18:05","2015-03-12 03:18:05","admin");
INSERT INTO file VALUES("197","PENETAPAN PEMENANG.PDF","2015-03-12 09:21:29","2015-03-12 03:21:29","admin");
INSERT INTO file VALUES("198","PENGUMUMAN PEMENANG.PDF","2015-03-12 09:28:25","2015-03-12 03:28:25","admin");
INSERT INTO file VALUES("199","SPPBJ ASKINDO ABADI.PDF","2015-03-12 09:33:35","2015-03-12 03:33:35","admin");
INSERT INTO file VALUES("200","ARSITEKTUR.pdf","2015-03-12 09:39:40","2015-03-12 03:39:40","admin");
INSERT INTO file VALUES("201","ELEKTRIKAL MEKANIKAL.pdf","2015-03-12 09:44:09","2015-03-12 03:44:09","admin");
INSERT INTO file VALUES("202","STRUKTURAL.pdf","2015-03-12 09:46:41","2015-03-12 03:46:41","admin");
INSERT INTO file VALUES("203","BA EVALUASI DOK PENAWARAN.pdf","2015-03-12 09:48:59","2015-03-12 03:48:59","admin");
INSERT INTO file VALUES("204","BA HASIL EVALUASI DOK KUALIFIKASI.pdf","2015-03-12 09:52:31","2015-03-12 03:52:31","admin");
INSERT INTO file VALUES("205","BA HASIL PENUNJUKAN LANGSUNG.pdf","2015-03-12 09:56:28","2015-03-12 03:56:28","admin");
INSERT INTO file VALUES("206","BA PEMBUKAAN DOK PENAWARAN.pdf","2015-03-12 10:00:03","2015-03-12 04:00:03","admin");
INSERT INTO file VALUES("207","BA RAPAT PEMBUKTIAN DOK KUALIFIKASI.pdf","2015-03-12 10:04:10","2015-03-12 04:04:10","admin");
INSERT INTO file VALUES("208","BA RAPAT PERSIAPAN.pdf","2015-03-12 10:08:08","2015-03-12 04:08:08","admin");
INSERT INTO file VALUES("209","DOKUMEN KUALIFIKASI.pdf","2015-03-12 10:11:48","2015-03-12 04:11:48","admin");
INSERT INTO file VALUES("210","DOKUMEN PEMILIHAN.pdf","2015-03-12 10:14:52","2015-03-12 04:14:52","admin");
INSERT INTO file VALUES("211","EVALUASI DOKUMEN KUALIFIKASI.pdf","2015-03-12 10:40:17","2015-03-12 04:40:17","admin");
INSERT INTO file VALUES("212","HASIL KLARIFIKASI DAN NEGOSIASI BIAYA.pdf","2015-03-12 10:44:01","2015-03-12 04:44:01","admin");
INSERT INTO file VALUES("213","JADWAL PENUNJUKAN LANGSUNG.pdf","2015-03-12 10:47:55","2015-03-12 04:47:55","admin");
INSERT INTO file VALUES("214","PEMBUKTIAN KUALIFIKASI.pdf","2015-03-12 10:52:19","2015-03-12 04:52:19","admin");
INSERT INTO file VALUES("215","PENELITIAN DAN PENILAIAN DOKUMEN ADMINISTRASI DAN TEKNIS.pdf","2015-03-12 10:55:37","2015-03-12 04:55:37","admin");
INSERT INTO file VALUES("216","PENETAPAN PEMENANG.pdf","2015-03-12 10:58:36","2015-03-12 04:58:36","admin");
INSERT INTO file VALUES("217","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","2015-03-12 11:01:24","2015-03-12 05:01:24","admin");
INSERT INTO file VALUES("218","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","2015-03-12 11:09:12","2015-03-12 05:09:12","admin");
INSERT INTO file VALUES("219","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","2015-03-12 11:13:07","2015-03-12 05:13:07","admin");
INSERT INTO file VALUES("220","DAFTAR ANALISA SATUAN PEKERJAAN.pdf","2015-03-12 11:16:16","2015-03-12 05:16:16","admin");
INSERT INTO file VALUES("221","DAFTAR HARGA SATUAN BAHAN DAN UPAH.pdf","2015-03-12 11:19:10","2015-03-12 05:19:10","admin");
INSERT INTO file VALUES("222","DAFTAR HARGA SATUAN PEKERJAAN.pdf","2015-03-12 11:22:24","2015-03-12 05:22:24","admin");
INSERT INTO file VALUES("223","PENAWARAN PEKERJAAN.pdf","2015-03-12 11:24:42","2015-03-12 05:24:42","admin");
INSERT INTO file VALUES("224","RENCANA ANGGARAN BIAYA.pdf","2015-03-12 11:28:13","2015-03-12 05:28:13","admin");
INSERT INTO file VALUES("225","DAFTAR BAG. PEKERJAAN YANG DI SUBKONTRAKTORKAN.pdf","2015-03-12 13:24:23","2015-03-12 07:24:23","admin");
INSERT INTO file VALUES("226","DAFTAR PERSONIL INTI.pdf","2015-03-12 13:27:30","2015-03-12 07:27:30","admin");
INSERT INTO file VALUES("227","DAFTAR SPESIFIKASI TEKNIS.pdf","2015-03-12 13:29:59","2015-03-12 07:29:59","admin");
INSERT INTO file VALUES("228","DOKUMEN TEKNIS.pdf","2015-03-12 13:32:33","2015-03-12 07:32:33","admin");
INSERT INTO file VALUES("229","JADWAL WAKTU PELAKSANAAN BENTUK KURVA S.pdf","2015-03-12 13:34:32","2015-03-12 07:34:32","admin");
INSERT INTO file VALUES("230","PENAWARAN PEKERJAAN.pdf","2015-03-12 13:37:53","2015-03-12 07:37:53","admin");
INSERT INTO file VALUES("231","SURAT PERNYATAAN KESANGGUPAN.pdf","2015-03-12 13:40:24","2015-03-12 07:40:24","admin");
INSERT INTO file VALUES("232","SYARAT TEKNIS YANG LAINNYA.pdf","2015-03-12 13:43:10","2015-03-12 07:43:10","admin");
INSERT INTO file VALUES("233","dokumen pengadaan.pdf","2015-03-12 13:49:13","2015-03-12 07:49:13","admin");
INSERT INTO file VALUES("234","ADDENDUM 01 KONTRAK.pdf","2015-03-12 13:54:15","2015-03-12 07:54:15","admin");
INSERT INTO file VALUES("235","SK PENETAPAN PENAMBAHAN WAKTU PEKERJAAN.pdf","2015-03-12 14:00:35","2015-03-12 08:00:35","admin");
INSERT INTO file VALUES("236","SURAT PERMOHONAN PERPANJANGAN WAKTU.pdf","2015-03-12 14:12:54","2015-03-12 08:12:54","admin");
INSERT INTO file VALUES("237","BA EVALUASI 1.pdf","2015-03-12 14:21:09","2015-03-12 08:21:09","admin");
INSERT INTO file VALUES("238","BA NEGOSIASI PEKERJAAN TAMBAH KURANG.pdf","2015-03-12 14:24:44","2015-03-12 08:24:44","admin");
INSERT INTO file VALUES("239","BA RAPAT PCM DAN DAFTAR HADIR.pdf","2015-03-12 14:28:13","2015-03-12 08:28:13","admin");
INSERT INTO file VALUES("240","SK PENETAPAN PEMANBAHAN PEKERJAAN TAMBAH KURANG.pdf","2015-03-12 14:36:23","2015-03-12 08:36:23","admin");
INSERT INTO file VALUES("241","SURAT PENGAJUAN TAMBAH KURANG.pdf","2015-03-12 14:43:34","2015-03-12 08:43:34","admin");
INSERT INTO file VALUES("242","SURAT PERJANJIAN.pdf","2015-03-12 14:46:46","2015-03-12 08:46:46","admin");
INSERT INTO file VALUES("243","SURAT PERMOHONAN PENAMBAHAN JANGKA WAKTU PELAKSANAAN.pdf","2015-03-12 14:50:48","2015-03-12 08:50:48","admin");
INSERT INTO file VALUES("244","spesifikasi umum.pdf","2015-03-12 16:11:12","2015-03-12 10:11:12","admin");
INSERT INTO file VALUES("245","SURAT PERINTAH MILAI KERJA (SPMK).pdf","2015-03-12 16:13:41","2015-03-12 10:13:41","admin");
INSERT INTO file VALUES("246","SURAT PERJANJIAN.pdf","2015-03-12 16:17:12","2015-03-12 10:17:12","admin");
INSERT INTO file VALUES("247","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","2015-03-12 16:20:06","2015-03-12 10:20:06","admin");
INSERT INTO file VALUES("248","SYARAT-SYARAT KHUSUS UMUM (SSUK).pdf","2015-03-12 16:22:03","2015-03-12 10:22:03","admin");
INSERT INTO file VALUES("249","KERANGKA ACUAN KERJA (KAK).pdf","2015-03-12 16:39:38","2015-03-12 10:39:38","admin");
INSERT INTO file VALUES("250","REKAPITULASI PENAWARAN BIAYA KEGIATAN PEMBANGUNAN2.pdf","2015-03-12 16:46:53","2015-03-12 10:46:53","admin");
INSERT INTO file VALUES("251","RENCANA ANGGARAN BIAYA (RAB).pdf","2015-03-12 16:50:28","2015-03-12 10:50:28","admin");
INSERT INTO file VALUES("252","SURAT PENAWARAN BIAYA UNTUK PENGAWASAN.pdf","2015-03-12 16:53:55","2015-03-12 10:53:55","admin");
INSERT INTO file VALUES("253","SURAT PERINTAH MULAI KERJA (SPMK).pdf","2015-03-12 16:58:30","2015-03-12 10:58:30","admin");
INSERT INTO file VALUES("254","SURAT PENUNJUKAN PENYEDIA KONSULTASI.pdf","2015-03-12 17:04:56","2015-03-12 11:04:56","admin");
INSERT INTO file VALUES("255","SURAT PERJANJIAN.pdf","2015-03-12 17:08:41","2015-03-12 11:08:41","admin");
INSERT INTO file VALUES("256","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","2015-03-12 17:12:22","2015-03-12 11:12:22","admin");
INSERT INTO file VALUES("257","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","2015-03-12 17:16:30","2015-03-12 11:16:30","admin");
INSERT INTO file VALUES("258","LAPORAN AKHIR PENGAWASAN.pdf","2015-03-13 07:39:21","2015-03-13 01:39:21","admin");
INSERT INTO file VALUES("259","LAPORAN BULAN DESEMBER.pdf","2015-03-13 07:50:17","2015-03-13 01:50:17","admin");
INSERT INTO file VALUES("260","LAPORAN BULAN JANUARI.pdf","2015-03-13 07:52:16","2015-03-13 01:52:16","admin");
INSERT INTO file VALUES("261","LAPORAN BULAN FEBRUARI.pdf","2015-03-13 07:54:11","2015-03-13 01:54:11","admin");
INSERT INTO file VALUES("262","LAPORAN BULAN MARET.pdf","2015-03-13 07:56:06","2015-03-13 01:56:06","admin");
INSERT INTO file VALUES("263","LAPORAN BULAN APRIL.pdf","2015-03-13 07:58:49","2015-03-13 01:58:49","admin");
INSERT INTO file VALUES("264","dokumen administrasi dan teknis.pdf","2015-03-13 08:22:35","2015-03-13 02:22:35","admin");
INSERT INTO file VALUES("265","dokumen penawaran biaya.pdf","2015-03-13 08:26:34","2015-03-13 02:26:34","admin");
INSERT INTO file VALUES("266","dokumen adminstrasi dan teknis.pdf","2015-03-13 08:29:09","2015-03-13 02:29:09","admin");
INSERT INTO file VALUES("267","Dokumen Prakualifikasi.pdf","2015-03-13 08:31:56","2015-03-13 02:31:56","admin");
INSERT INTO file VALUES("268","ARSITEKTUR RENCANA (ARS).pdf","2015-03-13 09:12:26","2015-03-13 03:12:26","admin");
INSERT INTO file VALUES("269","MEKANIKAL ELEKTRIKAL.pdf","2015-03-13 09:17:00","2015-03-13 03:17:00","admin");
INSERT INTO file VALUES("270","STRUKTUR (STR).pdf","2015-03-13 09:19:51","2015-03-13 03:19:51","admin");
INSERT INTO file VALUES("271","PENGUMUMAN PELELANGAN DG PASCAKUALIFIKASI.pdf","2015-03-13 09:30:35","2015-03-13 03:30:35","admin");
INSERT INTO file VALUES("272","PENGUMUMAN PELELANGAN DG PASCAKUALIFIKASI.pdf","2015-03-13 09:36:02","2015-03-13 03:36:02","admin");
INSERT INTO file VALUES("273","pendaftan dan pengambilan dokumen pengadaan.pdf","2015-03-13 09:40:18","2015-03-13 03:40:18","admin");
INSERT INTO file VALUES("274","PENDAFTARAN  PESERTA LELANG (1).pdf","2015-03-13 09:43:26","2015-03-13 03:43:26","admin");
INSERT INTO file VALUES("275","PENGAMBILAN DOKUMEN PENGADAAN.pdf","2015-03-13 09:44:54","2015-03-13 03:44:54","admin");
INSERT INTO file VALUES("276","ADDEDUM DOK PELELANGAN UMUM.pdf","2015-03-13 09:47:10","2015-03-13 03:47:10","admin");
INSERT INTO file VALUES("277","BA PENJELASAN PEKERJAAN TAHAP I.pdf","2015-03-13 09:48:13","2015-03-13 03:48:13","admin");
INSERT INTO file VALUES("278","UNDANGAN LELANG (1).PDF","2015-03-13 09:53:18","2015-03-13 03:53:18","admin");
INSERT INTO file VALUES("279","ADDENDUM II DOKUMEN PENGADAAN.pdf","2015-03-13 09:56:39","2015-03-13 03:56:39","admin");
INSERT INTO file VALUES("280","BA PENJELASAN PEKERJAAN AANWIZJING TAHAP II.PDF","2015-03-13 09:58:55","2015-03-13 03:58:55","admin");
INSERT INTO file VALUES("281","GAMBAR.pdf","2015-03-13 10:03:07","2015-03-13 04:03:07","admin");
INSERT INTO file VALUES("282","PEMASUKAN DOKUMEN PENAWARAN.PDF","2015-03-13 10:06:03","2015-03-13 04:06:03","admin");
INSERT INTO file VALUES("283","BA PEMB DOK. PENAWARAN SAMPUL I.PDF","2015-03-13 10:08:21","2015-03-13 04:08:21","admin");
INSERT INTO file VALUES("284","BA PENELITIAN DOK PENAWARAN SAMPUL I.pdf","2015-03-13 10:11:25","2015-03-13 04:11:25","admin");
INSERT INTO file VALUES("285","UNDANGAN CV. HANDAYANI.PDF","2015-03-13 10:15:01","2015-03-13 04:15:01","admin");
INSERT INTO file VALUES("286","UNDANGAN CV. WIDYA BAKTI UTAMA.PDF","2015-03-13 10:18:06","2015-03-13 04:18:06","admin");
INSERT INTO file VALUES("287","PENGUMUMAN HASIL EVALUASI PENILAIAN DOK. PENAWARAN SAMPUL I.PDF","2015-03-13 10:20:29","2015-03-13 04:20:29","admin");
INSERT INTO file VALUES("288","BA PEMB DOK. PENAWARAN SAMPUL II.PDF","2015-03-13 10:24:23","2015-03-13 04:24:23","admin");
INSERT INTO file VALUES("289","BA PENELITIAN DOK. PENAWARAN SAMPUL II (1).PDF","2015-03-13 10:31:35","2015-03-13 04:31:35","admin");
INSERT INTO file VALUES("290","LEMBAR KERJA PENILAIAN BIAYA.pdf","2015-03-13 10:34:59","2015-03-13 04:34:59","admin");
INSERT INTO file VALUES("291","UNDANGAN CV. HANDAYANI.PDF","2015-03-13 10:37:55","2015-03-13 04:37:55","admin");
INSERT INTO file VALUES("292","UNDANGAN CV. WIDYA BAKTI UTAMA.PDF","2015-03-13 10:41:15","2015-03-13 04:41:15","admin");
INSERT INTO file VALUES("293","BA PEMBUKTIAN DOK. KUALIFIKASI CV. WIDYA BAKTI UTAMA.pdf","2015-03-13 10:43:00","2015-03-13 04:42:59","admin");
INSERT INTO file VALUES("294","BA PEMBUKTIAN DOKUMEN KUALIFIKASI CV. HANDAYANI.pdf","2015-03-13 10:46:12","2015-03-13 04:46:12","admin");
INSERT INTO file VALUES("295","BA HASIL PELELANGAN (BAHP).pdf","2015-03-13 10:48:58","2015-03-13 04:48:58","admin");
INSERT INTO file VALUES("296","PENETAPAN PEMENANG.PDF","2015-03-13 10:52:44","2015-03-13 04:52:44","admin");
INSERT INTO file VALUES("297","PENGUMUMAN PEMENANG (2).PDF","2015-03-13 10:56:29","2015-03-13 04:56:29","admin");
INSERT INTO file VALUES("298","SURAT PENUNJUKAN PENYEDIA JASA (SPPJ).PDF","2015-03-13 11:00:32","2015-03-13 05:00:32","admin");
INSERT INTO file VALUES("299","PENELITIAN DOKUMEN PENAWARAN CV. HANDAYANI2.pdf","2015-03-13 11:10:25","2015-03-13 05:10:25","admin");
INSERT INTO file VALUES("300","PENELITIAN DOKUMEN PENAWARAN CV. HAPSA MAS2.pdf","2015-03-13 11:14:35","2015-03-13 05:14:35","admin");
INSERT INTO file VALUES("301","PENELITIAN DOKUMEN PENAWARAN CV. WIDYA BHAKTI UTAMA2.pdf","2015-03-13 11:16:09","2015-03-13 05:16:09","admin");
INSERT INTO file VALUES("302","SURAT KUASA CV. HANDAYANI.pdf","2015-03-13 11:17:46","2015-03-13 05:17:46","admin");
INSERT INTO file VALUES("303","DAFTAR GAMBAR ARSITEKTUR.pdf","2015-03-13 11:20:43","2015-03-13 05:20:43","admin");
INSERT INTO file VALUES("304","DAFTAR GAMBAR MEKANIKAL DAN ELEKTRIKAL.pdf","2015-03-13 11:23:01","2015-03-13 05:23:01","admin");
INSERT INTO file VALUES("305","DAFTAR GAMBAR STRUKTUR.pdf","2015-03-13 11:24:24","2015-03-13 05:24:24","admin");
INSERT INTO file VALUES("306","BA EVALUASI DOK KUALIFIKASI.pdf","2015-03-13 12:31:55","2015-03-13 06:31:55","admin");
INSERT INTO file VALUES("307","BA EVALUASI DOK PENAWARAN.pdf","2015-03-13 12:36:37","2015-03-13 06:36:37","admin");
INSERT INTO file VALUES("308","BA HASIL PENUNJUKAN LANGSUNG.pdf","2015-03-13 12:40:34","2015-03-13 06:40:34","admin");
INSERT INTO file VALUES("309","BA KLARIFIKASI & NEGOSIASI DOK. PENAWARAN.pdf","2015-03-13 12:45:17","2015-03-13 06:45:17","admin");
INSERT INTO file VALUES("310","BA PEMB DOK PENAWARAN.pdf","2015-03-13 12:49:24","2015-03-13 06:49:24","admin");
INSERT INTO file VALUES("311","BA PENJELASAN PEKERJAAN (AANWIZJING).pdf","2015-03-13 12:52:19","2015-03-13 06:52:19","admin");
INSERT INTO file VALUES("312","BA RAPAT PEMBUKTIAN DOK. KUALIFIKASI.pdf","2015-03-13 12:55:40","2015-03-13 06:55:40","admin");
INSERT INTO file VALUES("313","BA RAPAT PERSIAPAN.pdf","2015-03-13 12:59:33","2015-03-13 06:59:33","admin");
INSERT INTO file VALUES("314","DOKUMEN KUALIFIKASI.pdf","2015-03-13 13:02:44","2015-03-13 07:02:44","admin");
INSERT INTO file VALUES("315","DOKUMEN PEMILIHAN.pdf","2015-03-13 13:05:36","2015-03-13 07:05:36","admin");
INSERT INTO file VALUES("316","PEMBUKTIAN KUALIFIKASI.pdf","2015-03-13 13:09:18","2015-03-13 07:09:18","admin");
INSERT INTO file VALUES("317","PENELITIAN DAN PENILAIAN DOKUMEN ADMINISTRASI DAN TEKNIS.pdf","2015-03-13 13:10:06","2015-03-13 07:10:06","admin");
INSERT INTO file VALUES("318","PENETAPAN HASIL KUALIFIKASI.pdf","2015-03-13 13:16:27","2015-03-13 07:16:27","admin");
INSERT INTO file VALUES("319","PENETAPAN PEMENANG.pdf","2015-03-13 13:23:57","2015-03-13 07:23:57","admin");
INSERT INTO file VALUES("320","PENGUMUMAN PENUNJUKAN LANGSUNG PENYEDIA JASA.pdf","2015-03-13 13:26:48","2015-03-13 07:26:48","admin");
INSERT INTO file VALUES("321","SURAT PENUNJUKAN PENYEDIA DAN PELAKSANA PAKET PEKERJAAN PENGAWASAN.pdf","2015-03-13 13:30:33","2015-03-13 07:30:33","admin");
INSERT INTO file VALUES("322","UNDANGAN KLARIFIKASI DAN NEGOSIASI.pdf","2015-03-13 13:33:35","2015-03-13 07:33:35","admin");
INSERT INTO file VALUES("323","UNDANGAN PEMBUKTIAN DOKUMEN KUALIFIKASI.pdf","2015-03-13 13:37:17","2015-03-13 07:37:17","admin");
INSERT INTO file VALUES("324","DAFTAR ANALISA SATUAN PEKERJAAN.pdf","2015-03-13 13:49:01","2015-03-13 07:49:01","admin");
INSERT INTO file VALUES("325","DAFTAR HARGA SATUAN BAHAN, UPAH & ALAT.pdf","2015-03-13 13:51:56","2015-03-13 07:51:56","admin");
INSERT INTO file VALUES("326","DAFTAR HARGA SATUAN PEKERJAAN.pdf","2015-03-13 13:54:10","2015-03-13 07:54:10","admin");
INSERT INTO file VALUES("327","DOK. PENAWARAN BIAYA.pdf","2015-03-13 13:56:19","2015-03-13 07:56:19","admin");
INSERT INTO file VALUES("328","REKAP RAB.pdf","2015-03-13 13:57:34","2015-03-13 07:57:34","admin");
INSERT INTO file VALUES("329","RENCANA ANGGARAN BIAYA.pdf","2015-03-13 13:59:36","2015-03-13 07:59:36","admin");
INSERT INTO file VALUES("330","SURAT PENAWARAN BIAYA.pdf","2015-03-13 14:01:23","2015-03-13 08:01:23","admin");
INSERT INTO file VALUES("331","BROSUR.pdf","2015-03-13 14:04:50","2015-03-13 08:04:50","admin");
INSERT INTO file VALUES("332","DAFTAR BAGIAN PEKERJAAN YANG DI SUBKONTRAKTORKAN.pdf","2015-03-13 14:16:39","2015-03-13 08:16:39","admin");
INSERT INTO file VALUES("333","DAFTAR PENGALAMAN PERUSAHAAN.pdf","2015-03-13 14:20:04","2015-03-13 08:20:04","admin");
INSERT INTO file VALUES("334","DAFTAR PERALATAN UTAMA.pdf","2015-03-13 14:23:55","2015-03-13 08:23:55","admin");
INSERT INTO file VALUES("335","DAFTAR PERSONIL INTI.pdf","2015-03-13 14:31:41","2015-03-13 08:31:41","admin");
INSERT INTO file VALUES("336","DAFTAR SPESIFIKASI TEKNIS.pdf","2015-03-13 14:33:57","2015-03-13 08:33:57","admin");
INSERT INTO file VALUES("337","DOKUMEN ADNISTRASI.pdf","2015-03-13 14:36:12","2015-03-13 08:36:12","admin");
INSERT INTO file VALUES("338","DOKUMEN KUALIFIKASI.pdf","2015-03-13 14:37:02","2015-03-13 08:37:02","admin");
INSERT INTO file VALUES("339","JADWAL WAKTU PELAKSANAAN.pdf","2015-03-13 14:39:51","2015-03-13 08:39:51","admin");
INSERT INTO file VALUES("340","METODA PELAKSANAAN.pdf","2015-03-13 14:42:14","2015-03-13 08:42:14","admin");
INSERT INTO file VALUES("341","NETWORK PLANNING.pdf","2015-03-13 14:44:12","2015-03-13 08:44:12","admin");
INSERT INTO file VALUES("342","SISTEM KOORDINASI.pdf","2015-03-13 14:46:54","2015-03-13 08:46:54","admin");
INSERT INTO file VALUES("343","SURAT JAMINAN PENAWARAN.pdf","2015-03-13 15:07:29","2015-03-13 09:07:29","admin");
INSERT INTO file VALUES("344","SURAT KUASA.pdf","2015-03-13 15:09:41","2015-03-13 09:09:41","admin");
INSERT INTO file VALUES("345","SURAT PENAWARAN.pdf","2015-03-13 15:12:47","2015-03-13 09:12:47","admin");
INSERT INTO file VALUES("346","SURAT UNDANGAN.pdf","2015-03-13 15:15:54","2015-03-13 09:15:54","admin");
INSERT INTO file VALUES("347","dokumen pengadaan.pdf","2015-03-13 15:26:15","2015-03-13 09:26:15","admin");
INSERT INTO file VALUES("348","ADENDUM 1.pdf","2015-03-14 08:43:53","2015-03-14 02:43:53","admin");
INSERT INTO file VALUES("349","BA PENGUKURAN LAPANGAN (UITZET).pdf","2015-03-14 08:49:39","2015-03-14 02:49:39","admin");
INSERT INTO file VALUES("350","uitzet.pdf","2015-03-14 08:56:53","2015-03-14 02:56:53","admin");
INSERT INTO file VALUES("351","PEMERIKSAAN LAPANGAN.pdf","2015-03-14 08:59:27","2015-03-14 02:59:27","admin");
INSERT INTO file VALUES("352","PENGAJUAN PEKERJAAN TAMBAH KURANG.pdf","2015-03-14 09:03:52","2015-03-14 03:03:52","admin");
INSERT INTO file VALUES("353","PENGAJUAN PEKERJAAN TAMBAH KURANG.pdf","2015-03-14 09:06:15","2015-03-14 03:06:15","admin");
INSERT INTO file VALUES("354","REKAPITULASI ANGGARAN BIAYA KURANG.pdf","2015-03-14 09:12:31","2015-03-14 03:12:31","admin");
INSERT INTO file VALUES("355","REKAPITULASI PERHITUNGAN ANGGARAN BIAYA (HASIL NEGOSIASI).pdf","2015-03-14 09:15:09","2015-03-14 03:15:09","admin");
INSERT INTO file VALUES("356","RINCIAN PERHITUNGAN ANGGARAN BIAYA (HASIL NEGOSIASI).pdf","2015-03-14 09:18:32","2015-03-14 03:18:32","admin");
INSERT INTO file VALUES("357","RINCIAN PERHITUNGAN ANGGARAN BIAYA TAMBAH KURANG.pdf","2015-03-14 09:21:45","2015-03-14 03:21:45","admin");
INSERT INTO file VALUES("358","SK PENETAPAN PEKERJAAN TAMBAH KURANG.pdf","2015-03-14 09:24:22","2015-03-14 03:24:22","admin");
INSERT INTO file VALUES("359","SURAT KONTRAK ADENDUM 01.pdf","2015-03-14 09:27:42","2015-03-14 03:27:42","admin");
INSERT INTO file VALUES("360","SURAT PEMBERITAHUAN UITZET.pdf","2015-03-14 09:30:57","2015-03-14 03:30:57","admin");
INSERT INTO file VALUES("361","ADDENDUM 01 KONTRAK.pdf","2015-03-14 09:34:16","2015-03-14 03:34:16","admin");
INSERT INTO file VALUES("362","SK PENETAPAN PENAMBAHAN WAKTU PELAKSANAAN PEKERJAAN.pdf","2015-03-14 09:38:16","2015-03-14 03:38:16","admin");
INSERT INTO file VALUES("363","SURAT PERMOHONAN PERPANJANGAN WAKTU PELAKSANAAN.pdf","2015-03-14 09:41:30","2015-03-14 03:41:30","admin");
INSERT INTO file VALUES("364","ADDENDUM 2 DOKUMEN PENGADAAN.pdf","2015-03-14 09:58:47","2015-03-14 03:58:47","admin");
INSERT INTO file VALUES("365","GAMBAR DENAH2.pdf","2015-03-14 10:01:21","2015-03-14 04:01:21","admin");
INSERT INTO file VALUES("366","PT BRI.pdf","2015-03-14 10:03:33","2015-03-14 04:03:33","admin");
INSERT INTO file VALUES("367","spesifikasi umum.pdf","2015-03-14 10:06:18","2015-03-14 04:06:18","admin");
INSERT INTO file VALUES("368","SURAT PENAWARAN PEMBANGUNAN GEDUNG KANTOR CABANG.pdf","2015-03-14 10:13:23","2015-03-14 04:13:23","admin");
INSERT INTO file VALUES("369","SURAT PERINTAH MULAI KERJA.pdf","2015-03-14 10:19:27","2015-03-14 04:19:27","admin");
INSERT INTO file VALUES("370","SURAT PERJANJIAN.pdf","2015-03-14 10:23:00","2015-03-14 04:23:00","admin");
INSERT INTO file VALUES("371","SYARAT-SYARAT KHUSUS KONTRAK (SSKK).pdf","2015-03-14 10:26:04","2015-03-14 04:26:04","admin");
INSERT INTO file VALUES("372","SYARAT-SYARAT UMUM KONTRAK (SSUK).pdf","2015-03-14 10:27:45","2015-03-14 04:27:45","admin");
INSERT INTO file VALUES("373","KERANGKA ACUAN KERJA (KAK).pdf","2015-03-14 10:36:12","2015-03-14 04:36:12","admin");
INSERT INTO file VALUES("374","REKAPITULASI.pdf","2015-03-14 10:38:24","2015-03-14 04:38:24","admin");
INSERT INTO file VALUES("375","rab.pdf","2015-03-14 10:40:18","2015-03-14 04:40:18","admin");
INSERT INTO file VALUES("376","SURAT PENAWARAN BIAYA.pdf","2015-03-14 10:42:41","2015-03-14 04:42:41","admin");
INSERT INTO file VALUES("377","SURAT PENUNJUKAN PENYEDIA PELAKSANA.pdf","2015-03-14 10:45:28","2015-03-14 04:45:28","admin");
INSERT INTO file VALUES("378","SURAT PERINTAH MULAI KERJA.pdf","2015-03-14 10:49:03","2015-03-14 04:49:03","admin");
INSERT INTO file VALUES("379","SURAT PERJANJIAN KERJA.pdf","2015-03-14 10:51:30","2015-03-14 04:51:30","admin");
INSERT INTO file VALUES("380","SYARAT-SYARAT KHUSUS KONTRAK.pdf","2015-03-14 10:55:45","2015-03-14 04:55:45","admin");
INSERT INTO file VALUES("381","SYARAT-SYARAT UMUM KONTRAT.pdf","2015-03-14 10:57:45","2015-03-14 04:57:45","admin");
INSERT INTO file VALUES("382","bulan 1.pdf","2015-03-14 11:27:09","2015-03-14 05:27:09","admin");
INSERT INTO file VALUES("383","bulan 2.pdf","2015-03-14 11:29:35","2015-03-14 05:29:35","admin");
INSERT INTO file VALUES("384","bulan 3.pdf","2015-03-14 11:32:03","2015-03-14 05:32:03","admin");
INSERT INTO file VALUES("385","bulan 4.pdf","2015-03-14 11:35:37","2015-03-14 05:35:37","admin");
INSERT INTO file VALUES("386","bulan 5.pdf","2015-03-14 11:39:16","2015-03-14 05:39:16","admin");
INSERT INTO file VALUES("387","bulan 6.pdf","2015-03-14 11:41:55","2015-03-14 05:41:55","admin");
INSERT INTO file VALUES("388","dakumen prakualifikasi.pdf","2015-03-14 11:59:01","2015-03-14 05:59:01","admin");
INSERT INTO file VALUES("389","dokumen teknis adn administrasi.pdf","2015-03-14 12:01:22","2015-03-14 06:01:22","admin");
INSERT INTO file VALUES("4444","ARSITEKTUR.pdf","2015-03-07 16:28:20","2015-03-07 10:28:20","ida");
INSERT INTO file VALUES("6555","STRUKTUR.pdf","2015-03-09 09:05:53","2015-03-09 03:05:53","admin");
INSERT INTO file VALUES("13222","PENGUMUMAN LELANG SUARA MERDEKA.pdf","2015-03-09 10:42:00","2015-03-09 04:42:00","admin");
INSERT INTO file VALUES("33333","PERSETUJUAN BIAYA PEMB. GEDUNG.PDF","2015-03-07 14:32:49","2015-03-07 08:32:49","ida");
INSERT INTO file VALUES("42111","UNDANGAN CV. GIRI JATI.pdf","2015-03-09 13:58:27","2015-03-09 07:58:27","admin");
INSERT INTO file VALUES("44444","BA UITZET.pdf","2015-03-10 13:47:10","2015-03-10 07:47:10","admin");
INSERT INTO file VALUES("117666","ADDENDUM DOKUMEN PELELANGAN UMUM.pdf","2015-03-11 08:23:41","2015-03-11 02:23:41","ida");
INSERT INTO file VALUES("120878","BA RAPAT PENJELASAN PEKERJAAN (AANWIJZING).pdf","2015-03-11 08:40:10","2015-03-11 02:40:10","admin");
INSERT INTO file VALUES("121212","BA PENELITIAN DOK. PENAWARAN SAMPUL I.pdf","2015-03-09 10:36:50","2015-03-09 04:36:50","admin");
INSERT INTO file VALUES("124222","SURAT PENAWARAN PEMBANGUNAN.pdf","2015-03-11 09:01:51","2015-03-11 03:01:51","admin");
INSERT INTO file VALUES("127555","BA HASIL PENUNJUKAN LANGSUNG.pdf","2015-03-11 09:24:53","2015-03-11 03:24:53","admin");
INSERT INTO file VALUES("146222","BERITA ACARA RAPAT PERSIAPAN.PDF","2015-03-11 13:30:14","2015-03-11 07:30:14","admin");
INSERT INTO file VALUES("273333","BA PEN DOK. PENAWARAN SAMPUL II.PDF","2015-03-09 12:00:24","2015-03-09 06:00:24","admin");
INSERT INTO file VALUES("392222","PAKTA INTEGRITAS.PDF","2015-03-09 13:43:29","2015-03-09 07:43:29","admin");
INSERT INTO file VALUES("402222","PEMBUKAAN DOKUMEN PENAWARAN.pdf","2015-03-09 13:48:01","2015-03-09 07:48:01","admin");
INSERT INTO file VALUES("522212","UNDANGAN CV. GIRI JATI.PDF","2015-03-09 14:54:41","2015-03-09 08:54:41","admin");
INSERT INTO file VALUES("542222","(2) BERITA ACARA RAPAT PENJELASAN PEKERJAAN (AANWIJZING) TAHAP II.pdf","2015-03-09 15:12:40","2015-03-09 09:12:40","admin");
INSERT INTO file VALUES("614444","STRUKTUR.pdf","2015-03-09 17:27:41","2015-03-09 11:27:41","admin");
INSERT INTO file VALUES("909999","BA SERAH TERIMA KEDUA.pdf","2015-03-10 10:32:25","2015-03-10 04:32:25","admin");
INSERT INTO file VALUES("919999","DOKUMEN PENGADAAN.pdf","2015-03-10 11:10:18","2015-03-10 05:10:18","admin");
INSERT INTO file VALUES("939999","METODE PELAKSANAAN.pdf","2015-03-10 13:00:12","2015-03-10 07:00:12","admin");
INSERT INTO file VALUES("949999","METODE PELAKSANAAN.pdf","2015-03-10 13:10:24","2015-03-10 07:10:24","admin");
INSERT INTO file VALUES("1029999","BA UITZET.pdf","2015-03-10 13:47:12","2015-03-10 07:47:12","admin");
INSERT INTO file VALUES("1116666","SURAT TINDAK LANJUT PEMESANGAN LISTRIK.pdf","2015-03-10 14:48:40","2015-03-10 08:48:40","admin");
INSERT INTO file VALUES("1652222","BA PEMBUKAAN DOK. PENAWARAN.PDF","2015-03-11 15:36:11","2015-03-11 09:36:11","admin");
INSERT INTO file VALUES("3512121","PENETAPAN PEMENANG.PDF","2015-03-09 13:19:05","2015-03-09 07:19:05","admin");
INSERT INTO file VALUES("3614141","PENGUMUMAN PEMENANG.PDF","2015-03-09 13:25:15","2015-03-09 07:25:15","admin");
INSERT INTO file VALUES("5521212","BOQ 2.pdf","2015-03-09 15:16:49","2015-03-09 09:16:49","admin");
INSERT INTO file VALUES("5622222","BOQ .pdf","2015-03-09 15:17:39","2015-03-09 09:17:39","admin");
INSERT INTO file VALUES("5721212","ARSITEKTUR.pdf","2015-03-09 15:21:13","2015-03-09 09:21:13","admin");
INSERT INTO file VALUES("8585555","PENAWARAN PEKERJAAN.pdf","2015-03-10 10:19:22","2015-03-10 04:19:22","admin");
INSERT INTO file VALUES("8858585","PENAWARAN PEKERJAAN PENGAWASAN.pdf","2015-03-10 10:17:58","2015-03-10 04:17:58","admin");
INSERT INTO file VALUES("9696968","PCM.pdf","2015-03-10 14:11:03","2015-03-10 08:11:03","admin");
INSERT INTO file VALUES("81232323","ANALISA HARGA SATUAN PEKERJAAN.pdf","2015-03-10 09:54:41","2015-03-10 03:54:41","admin");



