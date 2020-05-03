-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 10:26 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik_achmadnursyafii`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `niy_guru` int(12) NOT NULL,
  `nama_guru` varchar(99) DEFAULT NULL,
  `jekel` enum('L','P') DEFAULT NULL,
  `tmp_lhr` varchar(99) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `alamat` varchar(99) DEFAULT NULL,
  `mapel` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`niy_guru`, `nama_guru`, `jekel`, `tmp_lhr`, `tgl_lhr`, `alamat`, `mapel`) VALUES
(1121345385, 'Mudjtahid', 'L', 'Jepara', '1969-01-26', 'Pekalongan Batealit', 'Sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_didik`
--

CREATE TABLE `peserta_didik` (
  `nis` int(4) NOT NULL,
  `nama_pd` varchar(99) DEFAULT NULL,
  `jekel` enum('L','P') DEFAULT NULL,
  `tmp_lhr` varchar(99) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `alamat` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta_didik`
--

INSERT INTO `peserta_didik` (`nis`, `nama_pd`, `jekel`, `tmp_lhr`, `tgl_lhr`, `alamat`) VALUES
(1234, 'Achmad Nur Syafii', 'L', 'Jakarta', '1998-09-01', 'Wonorejo');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kd_ruang` int(2) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `jurusan` enum('IPA','IPS','Bahasa','Agama') NOT NULL DEFAULT 'IPA',
  `niy_guru` int(12) NOT NULL,
  `nis` int(4) NOT NULL,
  `mapel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kd_ruang`, `kelas`, `jurusan`, `niy_guru`, `nis`, `mapel`) VALUES
(1, 'X IPA', 'IPA', 1121345385, 1234, 'Sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `walikelas`
--

CREATE TABLE `walikelas` (
  `kd_walas` varchar(3) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `jurusan` enum('IPA','IPS','Bahasa','Agama') NOT NULL DEFAULT 'IPA',
  `niy_guru` int(12) NOT NULL,
  `nis` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`niy_guru`);

--
-- Indexes for table `peserta_didik`
--
ALTER TABLE `peserta_didik`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kd_ruang`),
  ADD KEY `niy_guru` (`niy_guru`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `walikelas`
--
ALTER TABLE `walikelas`
  ADD PRIMARY KEY (`kd_walas`),
  ADD KEY `nis` (`nis`),
  ADD KEY `niy_guru` (`niy_guru`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `nis` FOREIGN KEY (`nis`) REFERENCES `peserta_didik` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `niy_guru` FOREIGN KEY (`niy_guru`) REFERENCES `guru` (`niy_guru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `walikelas`
--
ALTER TABLE `walikelas`
  ADD CONSTRAINT `walikelas_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `peserta_didik` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `walikelas_ibfk_2` FOREIGN KEY (`niy_guru`) REFERENCES `guru` (`niy_guru`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
