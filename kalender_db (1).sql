-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2026 at 05:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kalender_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `category` varchar(50) DEFAULT 'event-info',
  `google_event_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_date`, `end_date`, `category`, `google_event_id`) VALUES
(1, 'Penyesuaian Indikator Standar Mutu', 'Juli 2025', '2025-07-01 08:00:00', '2025-08-01 16:00:00', 'event-info', 'dtrir8namrr66obadd65jfhmu0'),
(2, 'Digital Web SPMI', 'Juli 2025', '2025-07-01 08:00:00', '2025-08-01 16:00:00', 'event-info', '63vbfl3e9sbps37rhubgn3bbgg'),
(3, 'Batas Terakhir Pendaftaran Ujian Skripsi', 'Penting', '2025-07-02 08:00:00', '2025-07-03 16:00:00', 'event-important', '8t73b2dn3cq39eau7gm014je0o'),
(4, 'Agenda Harian untuk STPM Divisi IT', 'Divisi IT', '2025-07-02 08:00:00', '2025-07-03 16:00:00', 'event-info', '8oodj7sm2vsicnke9ac5v3415c'),
(5, 'Batas Terakhir Pengumpulan LED Prodi Sosiatri', 'Prodi Sosiatri', '2025-07-03 08:00:00', '2025-07-04 16:00:00', 'event-important', 'mh4sb2pg94agobog8g4151onbk'),
(6, 'Angela Sesion', 'Kegiatan Yayasan', '2025-07-09 08:00:00', '2025-07-10 16:00:00', 'event-success', 'h6hgeek15gadmgki91hm94jkp0'),
(7, 'SDM Pengelolaan perpustakaan', 'Perpustakaan', '2025-07-10 08:00:00', '2025-07-11 16:00:00', 'event-info', 'f1o42scd6mlo4bniq04aiookp0'),
(8, 'ZOOM bersama DPMD dan Kepala Desa KKN', 'Persiapan KKN', '2025-07-10 08:00:00', '2025-07-11 16:00:00', 'event-info', '6oe0ur675fcununc4lmoc00t64'),
(9, 'Batas Akhir Ujian Skripsi', 'Akademik', '2025-07-12 08:00:00', '2025-07-13 16:00:00', 'event-important', 'i9l21oijar8rhf5en5f3fp5j18'),
(10, 'Batas Akhir Pengumpulan Nilai UAS Semester Genap', 'Akademik', '2025-07-12 08:00:00', '2025-07-13 16:00:00', 'event-important', 'firlk7unkne34rf9ev73nrbtkc'),
(11, 'Pelepasan KKN', 'KKN', '2025-07-12 08:00:00', '2025-07-13 16:00:00', 'event-success', 'fudt49kbi4psl9id2qm2j9bs70'),
(13, 'Libur Dosen STPM', 'Libur', '2025-07-14 00:00:00', '2025-07-27 23:59:00', 'event-inverse', 'mhg8gmitenrdrfor926s6oiiq4'),
(14, 'Rekreasi Bersama', 'Refreshing', '2025-07-31 08:00:00', '2025-08-01 16:00:00', 'event-success', '410mbqhrc48mm7aus16hd0b1bg'),
(15, 'Pendampingan Rutin UKM dan ORMAWA', 'Kemahasiswaan', '2025-08-01 08:00:00', '2025-08-02 16:00:00', 'event-info', '6cb183tgugests1rf8dtipkd94'),
(16, 'Her-registrasi semester ganjil 2025/2026', 'Registrasi', '2025-08-03 08:00:00', '2025-08-16 16:00:00', 'event-warning', 'mr9urehh0h6rcac8rlj6oi2dsc'),
(17, 'Monitoring KKN', 'Lapangan', '2025-08-04 08:00:00', '2025-08-10 16:00:00', 'event-info', 'mbblrime1lgd465ioimrbc8ejo'),
(18, 'Rapat Persiapan APT', 'Akreditasi', '2025-08-05 08:00:00', '2025-08-06 16:00:00', 'event-important', 'tfv9ieb9ukjjmgg0m0qjp66ljs'),
(19, 'Pelatihan Penggunaan LMS (Edlink) (PRODI IP)', 'Workshop', '2025-08-08 08:00:00', '2025-08-09 16:00:00', 'event-info', 'gnh4qdvdm30151f9j170lp5d9k'),
(20, 'Evaluasi dan penguatan Dudi', 'Evaluasi', '2025-08-08 08:00:00', '2025-08-09 16:00:00', 'event-warning', '1vi5dnru0ske6orp7qnpfepra4'),
(21, 'Pelatihan Penggunaan LMS (PRODI SOS)', 'Workshop', '2025-08-08 08:00:00', '2025-08-09 16:00:00', 'event-info', '1f8lkadl8lopv32blgolbokcik'),
(22, 'Sosialisasi SPMI ke unit kerja dan prodi', 'SPMI', '2025-08-09 08:00:00', '2025-08-10 16:00:00', 'event-info', 'rk9l981ppbdhnut8rdeb0va448'),
(23, 'Pemeriksaan Perkembangan Pekerjaan (Google Drive)', 'Monitoring', '2025-08-11 08:00:00', '2025-08-12 16:00:00', 'event-warning', '2jegc524j77r4ej4djn3rrq6lk'),
(24, 'Presentasi lulusan tepat waktu (Yudisium)', 'Akademik', '2025-08-11 08:00:00', '2025-08-12 16:00:00', 'event-success', 'pt0k8jh0uf23umi4ncph5lu4vo'),
(25, 'Pendaftaran Anggota KAPSIPI & ADIPSI', 'Keanggotaan', '2025-08-12 08:00:00', '2025-08-13 16:00:00', 'event-info', 'nvr48rv8reuku1gpvrcgt65gco'),
(26, 'Pengerjaan borang terpusat & Presentasi hasil', 'Akreditasi', '2025-08-12 08:00:00', '2025-08-16 16:00:00', 'event-important', '3jeh8cv225rc3pt1psf9g42774'),
(27, 'Lokakarya Penyususan Laporan & LPJ', 'Keuangan', '2025-08-15 08:00:00', '2025-08-16 16:00:00', 'event-warning', '0aea6iiqjqqlj7m3r9j131jhhk'),
(28, 'Lanjutan Pengerjaan Borang', 'Akreditasi', '2025-08-18 08:00:00', '2025-08-21 16:00:00', 'event-important', '83q5mj14oqv4khepkc2k233kqg'),
(29, 'Pra Ospek dan Ospek', 'Mahasiswa Baru', '2025-08-18 08:00:00', '2025-08-23 16:00:00', 'event-success', '24buf39livt79e8bsokq7b54qo'),
(30, 'Finalisasi administrasi pembelajaran', 'Dosen', '2025-08-18 08:00:00', '2025-08-24 16:00:00', 'event-info', '4i1lc2n4carm1ubian6108l5ko'),
(31, 'Perbaiki Dokumen LED', 'Akreditasi', '2025-08-21 08:00:00', '2025-08-22 16:00:00', 'event-important', 'aqi15bjmtt08bjk3uin9q4smas'),
(32, 'Branding dan Media Sosial UKM/Workshop', 'Workshop', '2025-08-22 08:00:00', '2025-08-23 16:00:00', 'event-info', 'mjsvqba20f4mbqjo3k2n5p0654'),
(33, 'Coaching dengan Koordinator SPMI Wilayah Ende', 'SPMI', '2025-08-22 08:00:00', '2025-08-23 16:00:00', 'event-info', 'f5s8k7fiqlbf0fa33tkd7q4lu8'),
(34, 'Menghargai HAM (Unit SD, SMP, STPM)', 'Yayasan', '2025-08-22 08:00:00', '2025-08-23 16:00:00', 'event-success', 'a8puptp9bmidhnobd7biak058o'),
(35, 'Pertemuan awal semester Dosen', 'Rapat Dosen', '2025-08-23 08:00:00', '2025-08-24 16:00:00', 'event-info', 'ki6ubmei375qij2ru64gbtl6sg'),
(36, 'Masa Perbaikan KRS', 'Akademik', '2025-08-24 08:00:00', '2025-09-06 16:00:00', 'event-warning', '2bdaj65usk5r3omihq408dpklc'),
(37, 'Pelaksanaan kuliah', 'Perkuliahan', '2025-08-24 08:00:00', '2025-12-11 16:00:00', 'event-info', 's1ua9fm1mr6gtbr800618he838'),
(38, 'Pengajuan Koleksi Baru', 'Perpustakaan', '2025-08-25 08:00:00', '2025-08-26 16:00:00', 'event-info', 'im9qp98nmj2tthu8a443p9gvn8'),
(39, 'Pendampingan LLDIKTI XV', 'LLDIKTI', '2025-08-25 08:00:00', '2025-08-28 16:00:00', 'event-important', 'jib9ia192f3dso7s4ri03lm7m8'),
(40, 'Kegiatan ZOOM Pemerintahan Desa & STPM', 'Kerjasama', '2025-08-26 08:00:00', '2025-08-27 16:00:00', 'event-info', '6013q3kgvcucrl2cmn99tpl994'),
(41, 'Data dikirim ke BAN-PT di Sapto 2.0', 'Akreditasi', '2025-08-27 08:00:00', '2025-08-28 16:00:00', 'event-important', 'kv7d95f446g8qv969shhjfe97g'),
(42, 'Workshop Penyusunan RPS dan kurikulum OBE', 'Workshop', '2025-08-29 08:00:00', '2025-08-30 16:00:00', 'event-info', '6nmhhd2a2it5pndn2mj5h3q2ds'),
(43, 'Akreditasi Institusi STPM Santa Ursula', 'Akreditasi', '2025-08-30 08:00:00', '2025-08-31 16:00:00', 'event-important', 'ls7dc4lm1k1uvn5tbga9c4828k'),
(44, 'Penarikan Mahasiswa KKN', 'KKN', '2025-08-31 08:00:00', '2025-09-01 16:00:00', 'event-warning', 'vauc7uo9gj4a0cjdkv1neeuuc4'),
(45, 'Implementasi Aplikasi Repository Perpustakaan', 'IT/Perpus', '2025-09-01 08:00:00', '2025-10-01 16:00:00', 'event-info', 'vh974rq75390d3lmdt81jerjq4'),
(46, 'Pertemuan Awal semester Mahasiswa (PRODI IP & SOS)', 'Mahasiswa', '2025-09-06 08:00:00', '2025-09-07 16:00:00', 'event-info', '1lk8vn11gq6ingmnek4k27ub3c'),
(47, 'Evaluasi KKN Tematik & Akreditasi PT', 'Evaluasi', '2025-09-06 08:00:00', '2025-09-07 16:00:00', 'event-warning', '9cl80rv6j4b7nrqnqsn1cua6k4'),
(48, 'Pembentukan Panitia ORMAWA CUP ke 25', 'Kemahasiswaan', '2025-09-08 08:00:00', '2025-09-09 16:00:00', 'event-info', '20b6lnljvf0jkfqjkh7eadhh0c'),
(49, 'Evaluasi Kemitraan & Podcast KKN', 'Humas', '2025-09-09 08:00:00', '2025-09-10 16:00:00', 'event-info', '96do5frekin8fdq3r7evkmd9so'),
(50, 'Capacity Building', 'SDM', '2025-09-09 08:00:00', '2025-09-12 16:00:00', 'event-success', 'fk7t1v1vfvrbsq6ui0kknudhlk'),
(51, 'Kampus Hiring Tahap II', 'Karir', '2025-09-10 08:00:00', '2025-09-12 16:00:00', 'event-info', 'r4n2vbhlq6caog38165e1i54r8'),
(52, 'Monitoring dan Evaluasi RPS (PRODI SOS)', 'Akademik', '2025-09-12 08:00:00', '2025-09-13 16:00:00', 'event-warning', 'p93mqb1hihtm0vftmbhvdrtdak'),
(53, 'Skripsi & Yudisium (Prodi IP)', 'Akademik', '2025-09-13 08:00:00', '2025-09-14 16:00:00', 'event-success', 'bn0k95mc6p53586j5jl1qa7js8'),
(54, 'Monev Penelitian & PKM 2024/2025', 'LP2M', '2025-09-16 08:00:00', '2025-09-17 16:00:00', 'event-warning', 'te27jabel9kalm5v0kln99kufo'),
(55, 'Sidang dan Seminar proposal penelitian & PKM 2026', 'LP2M', '2025-09-16 08:00:00', '2025-09-17 16:00:00', 'event-important', 'db6smmo397ti430r26j3f3n9sk'),
(56, 'Sidang dan Monitoring/Evaluasi Hasil Penelitian /PKM', 'LP2M', '2025-09-16 08:00:00', '2025-09-17 16:00:00', 'event-warning', 'm7rkdnlrjkgmcl8inj1pv8vkfk'),
(57, 'Benchmarking Tingkat Mahasiswa', 'Kemahasiswaan', '2025-09-17 08:00:00', '2025-09-18 16:00:00', 'event-info', 'scocsk2icrdjbpt2t7khf45j2s'),
(58, 'Turnamen Futsal, Lomba Debat, Penulisan Opini (Prodi IP)', 'Lomba', '2025-09-18 08:00:00', '2025-10-01 16:00:00', 'event-success', 'a0ghdcs6er51ege4l0esmsr6m4'),
(59, 'Workshop Manajemen Surat Menyurat Ormawa', 'Workshop', '2025-09-19 08:00:00', '2025-09-20 16:00:00', 'event-info', '9cksm9sfuh83617528icqo3dj4'),
(60, 'Seminar Kerja (Wisuda)', 'Wisuda', '2025-09-19 08:00:00', '2025-09-20 16:00:00', 'event-success', '9gbjfsgji1bed9a1pm9ckhb828'),
(61, 'Wisuda', 'Wisuda', '2025-09-25 08:00:00', '2025-09-26 16:00:00', 'event-success', '4mhniv832hi02df35qo8peh258'),
(62, 'Monitori dan Choacing Karir bersama Alumni', 'Alumni', '2025-09-26 08:00:00', '2025-09-28 16:00:00', 'event-info', '2f6oro1tdl8poapukeal7i4nd0'),
(63, 'Wisuda (Waket Akademik/Panitia)', 'Wisuda', '2025-09-27 08:00:00', '2025-09-28 16:00:00', 'event-success', 'g3l5668l8kskt8iek98sme0n94'),
(64, 'Monitoring/Evaluasi Laporan Kemajuan penelitian BIMA', 'LP2M', '2025-09-30 08:00:00', '2025-10-01 16:00:00', 'event-warning', 'jp47secqrh0rb2bm8b9ra1qlbo'),
(65, 'Monitoring proses pembelajaran (PRODI SOS)', 'Akademik', '2025-10-01 08:00:00', '2025-10-05 16:00:00', 'event-warning', 'ehgbb80sah8ufgngrtbltd94as'),
(66, 'Evaluasi Bimbingan Skripsi', 'Akademik', '2025-10-04 08:00:00', '2025-10-05 16:00:00', 'event-warning', 'gcue3642dkodcdp0frbk6fipmc'),
(67, 'Pelatihan Etika Kerja dan Tim Kerja serta PPKPT', 'Pelatihan', '2025-10-06 08:00:00', '2025-10-10 16:00:00', 'event-info', 'klii02qjtlqinog6oraj0a2cto'),
(68, 'Doa Novena Santa Ursula', 'Pastoral', '2025-10-07 08:00:00', '2025-10-19 16:00:00', 'event-info', '0f1rldq91q47ejsibk8r7geme0'),
(69, 'Presentasi lulusan tepat waktu (Yudisium)', 'Akademik', '2025-10-09 08:00:00', '2025-10-10 16:00:00', 'event-success', 'uece03qv3oqc6beigndoujht10'),
(70, 'Evaluasi Pembelajaran Tengah Semester', 'Evaluasi', '2025-10-10 08:00:00', '2025-10-11 16:00:00', 'event-warning', '9cc8ggd8csok1tkll6mib5g24g'),
(71, 'Monev Ormawa Smester I', 'Kemahasiswaan', '2025-10-10 08:00:00', '2025-10-11 16:00:00', 'event-warning', '2rkmj4816e1h4li9b19o9460so'),
(72, 'Rapat Monev Pembelajaran Tengah Semester (Prodi IP)', 'Rapat', '2025-10-10 08:00:00', '2025-10-11 16:00:00', 'event-warning', 'f113i2indvvrriherrvlgtgel0'),
(73, 'Rapat Monev Pembelajaran Tengah Semester (Prodi SOS)', 'Rapat', '2025-10-11 08:00:00', '2025-10-12 16:00:00', 'event-warning', 'rpr4reckuef4gdb9n0u7aoflvk'),
(74, 'Tanggungan Koor Di Paroki Onekore', 'Pastoral', '2025-10-12 08:00:00', '2025-10-13 16:00:00', 'event-info', '0tkahb59j5008buek5p2cjq5q0'),
(75, 'Ujian Tengah Semester', 'Ujian', '2025-10-13 08:00:00', '2025-10-18 16:00:00', 'event-important', 'toadfj0g1st32jl5ch7j9n0kas'),
(76, 'Hari Pangan Sedunia', 'Peringatan', '2025-10-16 08:00:00', '2025-10-17 16:00:00', 'event-success', 'dcufhkphjf25jopki8m0snig1s'),
(77, 'Mendukung Peningkatan Kualitas Institusi YNTB (Olahraga)', 'Yayasan', '2025-10-18 08:00:00', '2025-10-19 16:00:00', 'event-info', '85chlvsmo2ot2f6d4a2nasi2pg'),
(78, 'Pengumuman & Penyerahan Laporan Penelitan & PKM Tahap 2', 'LP2M', '2025-10-21 08:00:00', '2025-11-01 16:00:00', 'event-info', '0cruar0hu1r2ds36lomtnqbo40'),
(79, 'Pesta Santa Ursula', 'Perayaan', '2025-10-21 08:00:00', '2025-10-22 16:00:00', 'event-success', '1q38qetr11hjop7lejogdb8b9c'),
(80, 'Tanggungan Liturgi Pesta Santa Ursula', 'Pastoral', '2025-10-21 08:00:00', '2025-10-22 16:00:00', 'event-info', 'rvuf0hmoj654rueikset8egsgc'),
(81, 'Pengurusan E-ISSN Jurnal Pengabdian (JPPM) ke BRIN', 'Publikasi', '2025-10-22 08:00:00', '2025-10-23 16:00:00', 'event-info', '72jgrirp5g1uc02fud01rui0dc'),
(82, 'Pelatihan dan Pendampingan PKM', 'LP2M', '2025-10-23 08:00:00', '2025-10-24 16:00:00', 'event-info', '86uimnka7eopn8cb83atk5j8co'),
(83, 'Ratas ORMAWA', 'Rapat', '2025-10-24 08:00:00', '2025-10-25 16:00:00', 'event-warning', 'j9kqtihvpbjv4dsrlv9u0ceen0'),
(84, 'Seminar HAM (Nasional)', 'Seminar', '2025-10-28 08:00:00', '2025-10-29 16:00:00', 'event-info', '8bdoj33d9kh6vtksori7dhjca8'),
(85, 'Pendaftaran dan pendistribusian bimbingan skripsi', 'Akademik', '2025-11-01 08:00:00', '2025-11-30 16:00:00', 'event-info', 'gtm9t39vhd1dj1f9qgq8plorf8'),
(86, 'Simulasi Layanan Darurat', 'K3', '2025-11-03 08:00:00', '2025-11-04 16:00:00', 'event-warning', 'jgfj19q74361g3art61t1k1gak'),
(87, 'Penyerahan Laporan Penelitian & PKM Tahap 1 2024/2025', 'LP2M', '2025-11-03 08:00:00', '2025-11-06 16:00:00', 'event-important', '3pj1q177rk77dt1327314hulcg'),
(88, 'Sidang dan Evaluasi Hasil Penelitian dan PKM Tahap 2', 'LP2M', '2025-11-07 08:00:00', '2025-11-08 16:00:00', 'event-important', '33r1v7jgaluq6f3m3vegec20ts'),
(89, 'Sidang & Seminar Proposal Penelitian dan PKM Tahap 1', 'LP2M', '2025-11-08 08:00:00', '2025-11-09 16:00:00', 'event-important', 'hhok5dd0oou67hpf3dkmv50g74'),
(90, 'Penelitian Mandiri dan Tim', 'Penelitian', '2025-11-09 08:00:00', '2026-02-10 16:00:00', 'event-info', 'g4abeic3nqij90p04ct1opj12g'),
(91, 'Penelitian Kerja Sama Internasional, Nasional dan lokal', 'Penelitian', '2025-11-09 08:00:00', '2026-02-10 16:00:00', 'event-info', 'j50dsqs77i2rra48kkghnqm2n0'),
(92, 'Seminar HMPS', 'Kemahasiswaan', '2025-11-10 08:00:00', '2025-11-11 16:00:00', 'event-info', '1qkqjc8ohr9s7iig7b7cdie3ec'),
(93, 'Kampanye Beasiswa dan Testimoni Alumni', 'Promosi', '2025-11-20 08:00:00', '2025-11-21 16:00:00', 'event-success', 'ni45ig1tb4ukb8rc7kvm85pi24'),
(94, 'SDM Pengelolaan perpustakaan', 'SDM', '2025-12-01 08:00:00', '2025-12-02 16:00:00', 'event-info', 't1g19dq5lrjfo81rifuhr2kpg8'),
(95, 'Penyerahan Laporan dan Publikasi penelitian', 'LP2M', '2025-12-01 08:00:00', '2025-12-07 16:00:00', 'event-important', 'eqevss9vhatvvd6aoi6oqfl7io'),
(96, 'Aksi Natal', 'Pastoral', '2025-12-01 08:00:00', '2025-12-07 16:00:00', 'event-success', 'f6imdkobt0mj6dh0p6859obamk'),
(97, 'Pemutahiran data Pendidikan, Jabatan dan Bidang', 'SDM', '2025-12-06 08:00:00', '2025-12-07 16:00:00', 'event-warning', '7ks2hhp7m77muhtc1nboce8egg'),
(98, 'Rapat Monev pembelajaran akhir semester', 'Rapat', '2025-12-06 08:00:00', '2025-12-07 16:00:00', 'event-warning', 'a3604c69suq8h0j7ln88rc8uk8'),
(99, 'Monitoring Kinerja Semester', 'Evaluasi', '2025-12-09 08:00:00', '2025-12-10 16:00:00', 'event-warning', 'rmod1basi9307t6itsndsdfe0s'),
(100, 'Survei Evaluasi Proses Pemebelajaran', 'Evaluasi', '2025-12-09 08:00:00', '2025-12-19 16:00:00', 'event-info', 'vi8piks6cmpe2clrr5a0kq50jk'),
(101, 'Penyusunan Laporan dan Rekomendasi Program DUDI', 'Laporan', '2025-12-10 08:00:00', '2025-12-11 16:00:00', 'event-info', 'md6mqlpg8njf7bq3od40qo45ks'),
(102, 'Rapat Evaluasi dan Penyerahan Piagam', 'Rapat', '2025-12-11 08:00:00', '2025-12-12 16:00:00', 'event-success', 'ttvas1ebcp47tc8au1sa3atgc4'),
(103, 'Penyebaran kuesioner Tracer Study', 'Alumni', '2025-12-11 08:00:00', '2025-12-12 16:00:00', 'event-info', 'pr914jfevj5jckh0edl7pugibk'),
(104, 'Ibadat Tobat dan Sakramen Rekonsiliasi', 'Pastoral', '2025-12-12 08:00:00', '2025-12-13 16:00:00', 'event-info', 'rskqvj0ss2iq59l43qbkrd0iv0'),
(105, 'Rekoleksi mahasiswa bersama DPA (Persiapan UAS)', 'Pastoral', '2025-12-12 08:00:00', '2025-12-13 16:00:00', 'event-info', 'b1vcq06mchn88nsc7g4o7cj3j4'),
(106, 'Sidang dan Monitoring/Evaluasi Penelitian dan PKM', 'LP2M', '2025-12-13 08:00:00', '2025-12-14 16:00:00', 'event-warning', 'tkba8vqglv4rfjujqgcm19hois'),
(107, 'Ujian Akhir Semester (UAS)', 'Ujian', '2025-12-15 08:00:00', '2025-12-20 16:00:00', 'event-important', '01s4das2m4vkqhh7hkrju9pegg'),
(108, 'Rekoleksi Pendidik dan Tendik YNTB', 'Pastoral', '2025-12-20 08:00:00', '2025-12-21 16:00:00', 'event-success', 'ih8hvh70g61omcru3ms7ppcmtc'),
(109, 'Ujian susulan', 'Ujian', '2025-12-20 08:00:00', '2025-12-23 16:00:00', 'event-warning', 'gvtnf0kr60sigp8fbjdjcmu8mc'),
(110, 'Libur Semester/Natal/Akhir Tahun', 'Libur', '2025-12-22 00:00:00', '2026-01-01 23:59:00', 'event-inverse', 'qc77nm7m1f5pjqrpqn827cklnk'),
(111, 'Rekoleksi Tenaga Penunjang', 'Pastoral', '2025-12-23 08:00:00', '2025-12-24 16:00:00', 'event-info', '1f34i6d5oapfjva7cdobqeddp4'),
(112, 'Stock Opname Barang Selain Buku', 'Inventaris', '2025-12-27 08:00:00', '2025-12-31 16:00:00', 'event-info', 'vr36v4rsmqscq7pigj71jrv55o'),
(113, 'Libur Tahun Baru 2026', 'Libur', '2026-01-01 00:00:00', '2026-01-04 23:59:00', 'event-inverse', 'upvu4r0djvs8pbnk6ta0ntv3k0'),
(114, 'Sidang dan Monitoring/Evaluasi Penelitian dan PKM', 'LP2M', '2026-01-01 08:00:00', '2026-01-31 16:00:00', 'event-info', '0b9a05bfvninlkprck0jacmtag'),
(115, 'Batas Penginputanan Nilai UAS', 'Akademik', '2026-01-10 08:00:00', '2026-01-11 16:00:00', 'event-important', 'mfptva7ni5f487umrtq81d5mmg'),
(116, 'Natal dan Tahun Baru Bersama', 'Perayaan', '2026-01-12 08:00:00', '2026-01-13 16:00:00', 'event-success', 'i09fssdjl5kckavqg915auq0j0'),
(117, 'Coaching Clinic Terpadu Penelitian Mandiri/Tim Dosen', 'Penelitian', '2026-01-12 08:00:00', '2026-02-01 16:00:00', 'event-info', 'mii0g22phe7v7kdovvudh0etag'),
(118, 'Monev IKU', 'Evaluasi', '2026-01-13 08:00:00', '2026-01-14 16:00:00', 'event-warning', '12hd17aptd2cd0ntkck1ila8ms'),
(119, 'Evaluasi Kelembagaan Semester Ganjil 2025/2026', 'Evaluasi', '2026-01-13 08:00:00', '2026-01-14 16:00:00', 'event-warning', 'av8stkhgv9r6e0ns33g454u7ms'),
(120, 'Novena Santa Angela', 'Pastoral', '2026-01-14 08:00:00', '2026-01-27 16:00:00', 'event-info', '6ocj9u2rknt5liq2ifrimla8b4'),
(121, 'Pendaftaran Calon Mahasiswa (Gel. I)', 'PMB', '2026-01-18 08:00:00', '2026-03-31 16:00:00', 'event-info', 'iakh3tmu8lghkpmvnue578dg2g'),
(122, 'Tanggungan Liturgi Pesta Santa Angela', 'Pastoral', '2026-01-27 08:00:00', '2026-01-28 16:00:00', 'event-info', 'dvqivhg7vk6k4utfkdibk6gusg'),
(123, 'Penutupan semester Ganjil 2025/2026', 'Akademik', '2026-01-31 08:00:00', '2026-02-01 16:00:00', 'event-important', '5n9563otdqsim2g1298kkfko8o'),
(124, 'Pembukaan dan Pelaksaan Tournamen Ormawa CUP ke 25', 'Kemahasiswaan', '2026-01-31 08:00:00', '2026-03-06 16:00:00', 'event-success', '499frbofl4j7pi2lnusk2qev38'),
(125, 'Pembukaan Semester Genap 2025/2026, Dies Natalis', 'Akademik', '2026-02-02 08:00:00', '2026-02-03 16:00:00', 'event-success', 'tpigdv73m11sqpbooad4ev44f0'),
(126, 'Registrasi Akademik dan Administrasi 2025/2026, SKKE', 'Registrasi', '2026-02-02 08:00:00', '2026-02-10 16:00:00', 'event-warning', '8l82c16l1m3tnakbk3t4l1e2c4'),
(127, 'Pertemuan awal semester Dosen', 'Rapat', '2026-02-07 08:00:00', '2026-02-08 16:00:00', 'event-info', 'aqbar3miaedsfium5tm8oub6l0'),
(128, 'Sidang dan Monitoring/Evaluasi Penelitian dan PKM', 'LP2M', '2026-02-10 08:00:00', '2026-02-11 16:00:00', 'event-warning', 'e0bt3a01kgu2p03tc48417hq2s'),
(129, 'Finalisasi Administrasi Pembelajaran (Upload RPS)', 'Akademik', '2026-02-10 08:00:00', '2026-02-14 16:00:00', 'event-important', '82uh1ni7ongatk2s1e03cqpg3g'),
(130, 'Pelaksanaan Perkuliahan Genap 2025/2026', 'Perkuliahan', '2026-02-15 08:00:00', '2026-06-11 16:00:00', 'event-info', 'q60q9ceufhic2fpar4k4uj6quk'),
(131, 'Masa Batal Tambah Program Matakuliah (Perbaikan KRS)', 'Akademik', '2026-02-19 08:00:00', '2026-03-01 16:00:00', 'event-warning', 'kf3n9dlfe5khqbs8v7s43c84ts'),
(132, 'Pelatihan Manajemen dan Administrasi ORMAWA', 'Kemahasiswaan', '2026-02-20 08:00:00', '2026-02-22 16:00:00', 'event-info', '5qncool48vo9m2vt5bu6qlo8us'),
(133, 'Pertemuan Awal semester Mahasiswa', 'Mahasiswa', '2026-02-21 08:00:00', '2026-02-22 16:00:00', 'event-info', 'ghpnov24ti909tdqiuh5nhp5bk'),
(134, 'Registrasi akademik dan administrasi', 'Registrasi', '2026-02-28 08:00:00', '2026-03-01 16:00:00', 'event-warning', '3cinantfqjl5f6cn1gfsqofud4'),
(135, 'Klinik Proposal Kompetisi/Pengabdian', 'Workshop', '2026-03-06 08:00:00', '2026-03-07 16:00:00', 'event-info', 'k4o0v6f39ugkc0nj8ovit1k734'),
(136, 'Monitoring dan Evaluasi RPS', 'Evaluasi', '2026-03-07 08:00:00', '2026-03-08 16:00:00', 'event-warning', 'ig5upvodmu51seaonp78cv733c'),
(137, 'APP dan Beasiswa Ursulin', 'Beasiswa', '2026-03-09 08:00:00', '2026-03-15 16:00:00', 'event-success', '9atlh8lqmogoehgstjmqkv9bp4'),
(138, 'Rekoleksi mahasiswa bersama DPA', 'Pastoral', '2026-03-13 08:00:00', '2026-03-14 16:00:00', 'event-info', 'vpg6ofiktfh6qv64r6e6km5peg'),
(139, 'Monitoring proses pembelajaran', 'Evaluasi', '2026-03-19 08:00:00', '2026-03-22 16:00:00', 'event-warning', 'p1t76tv417bf2t3cha78nqpnp8'),
(140, 'Jalan Salib Tematik', 'Pastoral', '2026-03-20 08:00:00', '2026-03-21 16:00:00', 'event-info', '9dd3dbo7l1cpc1pila6r65sp2c'),
(141, 'Kegiatan Evaluasi Pelaksanaan Standar', 'SPMI', '2026-03-25 08:00:00', '2026-03-27 16:00:00', 'event-warning', 's6rc391t9dvqbf71acot5qnbs0'),
(142, 'Ibadat Tobat dan Sakramen Rekonsiliasi', 'Pastoral', '2026-03-27 08:00:00', '2026-03-28 16:00:00', 'event-info', 'joi4mi1h17cmrffaqvm0d8nvo8'),
(143, 'Pendaftaran Calon Mahasiswa (Gel. II)', 'PMB', '2026-04-06 08:00:00', '2026-05-30 16:00:00', 'event-info', '9kfse2ufi64nok3pvhu81ct6f4'),
(144, 'Audit Mutu Internal Masing-Masing Unit', 'SPMI', '2026-04-07 08:00:00', '2026-04-10 16:00:00', 'event-warning', '9kgbt03hea668h85hgn6ll8b1k'),
(145, 'Tes Calon Mahasiswa Baru Gelombang I 2026', 'PMB', '2026-04-09 08:00:00', '2026-04-10 16:00:00', 'event-important', 'a5qv905eoqqs2t70qimd3prres'),
(146, 'Hasil Pengumuman Gelombang I 2026', 'PMB', '2026-04-10 08:00:00', '2026-04-11 16:00:00', 'event-success', '026u7tokagtdt46qv3bivmaeug'),
(147, 'Evaluasi Pembelajaran Tengah Semester', 'Evaluasi', '2026-04-10 08:00:00', '2026-04-11 16:00:00', 'event-warning', 'gfr83jh4bbd0ssg88tuh64r8bc'),
(148, 'Sosialisasi Beasiswa Mahasiswa & Dosen', 'Beasiswa', '2026-04-11 08:00:00', '2026-04-12 16:00:00', 'event-info', '7rflbi6le5qqqpq7oeq2emb0qk'),
(149, 'Her-Registrasi / Daftar Ulang (Gel. I)', 'PMB', '2026-04-12 08:00:00', '2026-05-07 16:00:00', 'event-info', 'ogpgt4rge062gc0n8l1mvdog5g'),
(150, 'Ujian Tengah Semester (UTS)', 'Ujian', '2026-04-13 08:00:00', '2026-04-17 16:00:00', 'event-important', '510s1djcqc2vbupjfnn6qhi23g'),
(151, 'Mendukung Peningkatan Kualitas Institusi YNTB (Evaluasi)', 'Yayasan', '2026-04-18 08:00:00', '2026-04-19 16:00:00', 'event-info', 'qtmdk24sokb2j1f9ivdcatt1gk'),
(152, 'Susksesi Pelaksanaan Pemilihan Ketua STPM', 'Organisasi', '2026-04-18 08:00:00', '2026-05-09 16:00:00', 'event-warning', 'fk5s0nntegigccts93s2ge6s60'),
(153, 'Koor di gereja Wolotopo', 'Pastoral', '2026-04-19 08:00:00', '2026-04-20 16:00:00', 'event-info', 'j5k6i21lo59t2m1s1ti33rmq8s'),
(154, 'Menghargai dan Mencintai Ekologi', 'Lingkungan', '2026-04-22 08:00:00', '2026-04-23 16:00:00', 'event-success', '38ruvf9kgpcjtq63mkls580me8'),
(155, 'Raker Yayasan', 'Rapat', '2026-04-23 08:00:00', '2026-04-26 16:00:00', 'event-important', '0qshs1ukkbrsh6t327rejh15lc'),
(156, 'Penyuluhan dan Klinik Manajemen Stres', 'Kesehatan', '2026-04-24 08:00:00', '2026-04-25 16:00:00', 'event-info', 'd2ohc3ga0rld945nd90qrl3i4c'),
(157, 'Seminar HMPS', 'Kemahasiswaan', '2026-05-02 08:00:00', '2026-05-03 16:00:00', 'event-info', 'd946pp55oeedkjqtdiakg9bh6g'),
(158, 'Survei Desa Abdimas Lembaga', 'Pengabdian', '2026-05-04 08:00:00', '2026-05-10 16:00:00', 'event-info', 'i8rknf8hk3ksen75c9fips5k1c'),
(159, 'Workshop Modifikasi Program Berbasis Isu Bersama UKM', 'Workshop', '2026-05-07 08:00:00', '2026-05-08 16:00:00', 'event-info', 'c8b4i00gluuhp8tuqpsvu1vr70'),
(160, 'Pembekalan Abdimas Lembaga', 'Pengabdian', '2026-05-11 08:00:00', '2026-05-16 16:00:00', 'event-info', 'lblj34ug9on9c8g7hol3q4h548'),
(161, 'Pelaksanaan Abdimas Lembaga', 'Pengabdian', '2026-05-17 08:00:00', '2026-05-23 16:00:00', 'event-success', 'bjlu2t9qssq306khu5c2mlob60'),
(162, 'Survei Kepuasan Pelaksanaan Abdimas', 'Evaluasi', '2026-05-18 08:00:00', '2026-05-24 16:00:00', 'event-warning', 'f504m6gmjqjfb1itekguma381g'),
(163, 'Temu Alumni Lintas Angkatan dan Inspirasi Karir', 'Alumni', '2026-05-29 08:00:00', '2026-05-30 16:00:00', 'event-success', 'm4euqfi9crclh4odioins6g878'),
(164, 'Hari Pancasila (Parade Kebangsaan)', 'Nasional', '2026-06-01 08:00:00', '2026-06-02 16:00:00', 'event-important', '79malb278dbniev6ikndq0pn5s'),
(165, 'Pendaftaran Calon Mahasiswa (Gel. III)', 'PMB', '2026-06-02 08:00:00', '2026-07-16 16:00:00', 'event-info', 'og5dqbq3aacueup9sfuebjpdh0'),
(166, 'Tes Mahasiswa Baru Gelombang II 2026', 'PMB', '2026-06-04 08:00:00', '2026-06-05 16:00:00', 'event-important', 'at9jes934k4qeae1evtshkuoms'),
(167, 'Seminar Nasional dan Diseminasi Penelitian Dosen', 'Seminar', '2026-06-05 08:00:00', '2026-06-06 16:00:00', 'event-success', 'l5psckj5g73skpbqba6irlkupg'),
(168, 'Pengumuman Hasil Tes Mahasiswa Baru Gelombang II', 'PMB', '2026-06-05 08:00:00', '2026-06-06 16:00:00', 'event-success', 'qom2384dlpshlr2f4f8j61hs6k'),
(169, 'Monev pembelajaran akhir semester', 'Evaluasi', '2026-06-06 08:00:00', '2026-06-07 16:00:00', 'event-warning', 'va8lfq1pj9aadaoardv41htqp0'),
(170, 'Her-Registrasi / Daftar Ulang (Gel. II)', 'PMB', '2026-06-07 08:00:00', '2026-06-30 16:00:00', 'event-info', 'cb3mg5va11o85trkqo6iapgp0g'),
(171, 'Konseling Mahasiswa Berisiko Studi', 'Konseling', '2026-06-08 08:00:00', '2026-06-15 16:00:00', 'event-warning', '4oc52p1o45dhfnjcduvikqibe0'),
(172, 'Survei Proses Pembelajaran dan Pelayanan Institusi', 'Evaluasi', '2026-06-08 08:00:00', '2026-06-21 16:00:00', 'event-info', 'cdqb17q0ok1dgjsb7fbugg1m10'),
(173, 'Monev IKU', 'Evaluasi', '2026-06-10 08:00:00', '2026-06-11 16:00:00', 'event-warning', 'gqnvjk691a6fit1gg03e09ne70'),
(174, 'Test Masuk (Gel. II)', 'PMB', '2026-06-11 08:00:00', '2026-06-12 16:00:00', 'event-important', '2778l8oobmaqr4nn39ccfcgsn8'),
(175, 'Ujian Akhir Semester (UAS)', 'Ujian', '2026-06-15 08:00:00', '2026-06-20 16:00:00', 'event-important', 'l5vupv0sdbuedhccv69l1ct3u8'),
(176, 'Survei KKN', 'KKN', '2026-06-17 08:00:00', '2026-06-21 16:00:00', 'event-info', '92f3hjhhfm921b970c7gjutnlg'),
(177, 'Ujian Susulan UAS', 'Ujian', '2026-06-20 08:00:00', '2026-06-21 16:00:00', 'event-warning', 'kpq0requgfdvgu6f3n6ar6c4cg'),
(178, 'Pendaftaran KKN', 'KKN', '2026-06-22 08:00:00', '2026-06-26 16:00:00', 'event-info', '864sgtgbilqgv83udorm9n3ndc'),
(179, 'Raker STPM Santa Ursula', 'Rapat', '2026-06-23 08:00:00', '2026-06-26 16:00:00', 'event-important', 'p1dceo1dnipb4rdfpsipsprohg'),
(180, 'Pembekalan KKN', 'KKN', '2026-06-26 08:00:00', '2026-07-01 16:00:00', 'event-info', 'a97cj0jpjg73sp59m7rfreuml4'),
(181, 'Batas Akhir Pendaftaran Ujian Skripsi', 'Akademik', '2026-06-27 08:00:00', '2026-06-28 16:00:00', 'event-important', '5c0hf784610msd1fi6a8ieob38'),
(182, 'Batas penginputan Nilai UAS', 'Akademik', '2026-06-29 08:00:00', '2026-06-30 16:00:00', 'event-important', 'dvkfna8iiv9g6stkd4o80kmsbs'),
(183, 'Peningkatan mutu laporan tugas akhir', 'Akademik', '2026-07-04 08:00:00', '2026-07-05 16:00:00', 'event-info', '6rcumensqba97kudatoi5i93sc'),
(184, 'Monev pembelajaran akhir semester', 'Evaluasi', '2026-07-06 08:00:00', '2026-07-07 16:00:00', 'event-warning', 'ngbck3nl4l1fda8p4f4l1gm0ro'),
(185, 'Penguatan Akses Dunia Kerja', 'Karir', '2026-07-07 08:00:00', '2026-07-08 16:00:00', 'event-success', '1ahb7d1jp249cd42lc9prkas8g'),
(186, 'Batas Akhir Ujian Skripsi', 'Akademik', '2026-07-10 08:00:00', '2026-07-11 16:00:00', 'event-important', 'kqmrki66i8lm6clj523csvr6g0'),
(187, 'Pelepasan KKN', 'KKN', '2026-07-11 08:00:00', '2026-07-12 16:00:00', 'event-success', '824k8bbplv0u8823im043tok00'),
(188, 'Pelaksanaan KKN', 'KKN', '2026-07-12 08:00:00', '2026-09-12 16:00:00', 'event-warning', 'u37jc5bfr116bk56inrc8h1e94'),
(189, 'Libur dosen', 'Libur', '2026-07-12 00:00:00', '2026-07-27 23:59:00', 'event-inverse', 'e30cprp6gm4tfp1hv5ng2lqa64'),
(190, 'Pendaftaran Calon Mahasiswa (Gel. IV)', 'PMB', '2026-07-15 08:00:00', '2026-08-05 16:00:00', 'event-info', '0cgs502ms9ukn47j2q8rc9j6l8'),
(191, 'Test Masuk (Gel. III)', 'PMB', '2026-07-15 08:00:00', '2026-07-17 16:00:00', 'event-important', 'dtg841mffmcquknr16cd953i58'),
(192, 'Pengumuman Hasil (Gel. III)', 'PMB', '2026-07-17 08:00:00', '2026-07-18 16:00:00', 'event-success', 'tbjbf18kqado0n078c86h0gum8'),
(193, 'Her-Registrasi / Daftar Ulang (Gel. III)', 'PMB', '2026-07-19 08:00:00', '2026-07-31 16:00:00', 'event-info', 'q1ef4fvcoapgr1pofe75c4ena0'),
(194, 'Batas Akhir Ujian Skripsi', 'Akademik', '2026-07-22 08:00:00', '2026-07-23 16:00:00', 'event-important', 'ldbt8dtu9numiovr98mo56tgo0'),
(195, 'Dokumentasi dan Ekspo Aktivitas Mahasiswa', 'Pameran', '2026-07-26 08:00:00', '2026-07-27 16:00:00', 'event-success', 'gdfifrkub0thl9md01qjkpfeok'),
(196, 'Penutupan semester Genap 2025/2026', 'Akademik', '2026-07-31 08:00:00', '2026-08-01 16:00:00', 'event-important', 'navdt7ba8t81aakkk8c4mab0f0'),
(197, 'Yudisium Lulusan', 'Akademik', '2026-08-03 08:00:00', '2026-08-04 16:00:00', 'event-success', '92v8n5dm81h0jnh2t8ut8m8l50'),
(198, 'Test Masuk (Gel. IV)', 'PMB', '2026-08-05 08:00:00', '2026-08-07 16:00:00', 'event-important', 'h9efrkh00p4i487mofe5cpjits'),
(199, 'Pengumuman Hasil (Gel. IV)', 'PMB', '2026-08-07 08:00:00', '2026-08-08 16:00:00', 'event-success', 'ct9jbqdcpde2sdob9d4gjkqfl4'),
(200, 'Her-Registrasi / Daftar Ulang (Gel. IV)', 'PMB', '2026-08-09 08:00:00', '2026-08-12 16:00:00', 'event-info', '5f8gbqddqm7qu8unhov966ga38'),
(201, 'Monev KKN', 'KKN', '2026-08-14 08:00:00', '2026-08-16 16:00:00', 'event-warning', 'ako0jh2elg5c27chg210ljm238'),
(202, 'Survei Kepuasan KKN', 'Evaluasi', '2026-09-07 08:00:00', '2026-09-13 16:00:00', 'event-info', 'fffv0qhj7bc643sv75b7rqe4ks'),
(203, 'Penjemputan Peserta KKN', 'KKN', '2026-09-12 08:00:00', '2026-09-13 16:00:00', 'event-success', 'evadd57ol47i2f9l538uveqg5g'),
(206, 'Rapat', 'Rapat Akreditas', '2025-12-14 20:40:00', '2025-12-15 14:40:00', 'event-info', '804f0cihamgbfb136cbb7cvj9c'),
(207, 'Rapat Akreditasi', 'Pembahasan Sosiatri', '2025-12-12 22:45:00', '2025-12-12 12:41:00', 'event-info', NULL),
(208, 'tes', 'tesssssssssss', '2025-12-15 18:42:00', '2025-12-20 18:43:00', 'event-success', '1bmhh60rhbmbol7jgl3bhvrb4k'),
(213, 'tes 1', 'Tes', '2025-07-04 16:18:00', '2025-12-15 16:18:00', 'event-info', 'esaebdf0a7q4ncjlbt0nqchvrg'),
(219, 'tes 2', 'tes 2', '2024-07-04 16:19:00', '2025-12-15 16:19:00', 'event-success', '8k942h90rlfbtt198fhgubit7s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
