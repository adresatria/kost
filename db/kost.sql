-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 05:37 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kost`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `hunian`
--

CREATE TABLE `hunian` (
  `id_hunian` int(15) NOT NULL,
  `nama_hunian` varchar(100) NOT NULL,
  `jenis_hunian` varchar(100) NOT NULL,
  `deskripsi_hunian` text NOT NULL,
  `status_hunian` varchar(100) NOT NULL,
  `harga_hunian` int(15) NOT NULL,
  `gambar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hunian`
--

INSERT INTO `hunian` (`id_hunian`, `nama_hunian`, `jenis_hunian`, `deskripsi_hunian`, `status_hunian`, `harga_hunian`, `gambar`) VALUES
(21, 'Kamar 1', 'Kost', 'Kasur,bantal,selimut,lemari', 'available', 450000, '1622516196.jpg'),
(22, 'Kamar 2', 'Kost', 'Kasur, Lemari, Bantal, dll', 'available', 500000, '1622516609.jpg'),
(23, 'Kamar 3', 'Kost', 'Kasur, Bantal, Meja belajar, Lemari baju', 'available', 650000, '1622516657.jpg'),
(24, 'Kamar 4', 'Kost', 'Kasur, Sprei, Lemari, KM Dalam', 'available', 750000, '1622516691.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `komplain`
--

CREATE TABLE `komplain` (
  `id_komplain` int(15) NOT NULL,
  `id_member` int(15) NOT NULL,
  `id_hunian` int(15) NOT NULL,
  `perihal` varchar(100) NOT NULL,
  `isi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komplain`
--

INSERT INTO `komplain` (`id_komplain`, `id_member`, `id_hunian`, `perihal`, `isi`) VALUES
(10, 15, 21, 'Lampu', 'Lampunya jedag jedug bikin pusing');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(15) NOT NULL,
  `nama_member` varchar(200) NOT NULL,
  `pass_member` varchar(200) NOT NULL,
  `email_member` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `nohp` varchar(200) NOT NULL,
  `alamat_member` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `pass_member`, `email_member`, `status`, `nohp`, `alamat_member`) VALUES
(14, 'user', 'user', 'user@user.com', 'Pegawai', '08966990906060', 'Trengelung'),
(15, 'Adre Bagus Satria', 'user', 'adre@gmail.com', 'Staf Presiden', '08123456667', 'Denpasar');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(15) NOT NULL,
  `id_hunian` int(15) NOT NULL,
  `id_member` int(15) NOT NULL,
  `tanggal_mulai` varchar(100) NOT NULL,
  `durasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_hunian`, `id_member`, `tanggal_mulai`, `durasi`) VALUES
(19, 21, 15, '2021-06-01', '1 Bulan');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` int(15) NOT NULL,
  `id_member` int(15) NOT NULL,
  `id_hunian` int(15) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `nominal` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `bulan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `id_member`, `id_hunian`, `tanggal`, `nominal`, `gambar`, `status`, `bulan`) VALUES
(2, 15, 21, '2021-06-01', '450000', '1622516384.jpg', 'LUNAS', 'coba');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `hunian`
--
ALTER TABLE `hunian`
  ADD PRIMARY KEY (`id_hunian`);

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
  ADD PRIMARY KEY (`id_komplain`),
  ADD KEY `id_member` (`id_member`,`id_hunian`),
  ADD KEY `id_hunian` (`id_hunian`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_hunian` (`id_hunian`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_hunian_2` (`id_hunian`,`id_member`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_member` (`id_member`,`id_hunian`),
  ADD KEY `id_hunian` (`id_hunian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hunian`
--
ALTER TABLE `hunian`
  MODIFY `id_hunian` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `komplain`
--
ALTER TABLE `komplain`
  MODIFY `id_komplain` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id_sewa` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komplain`
--
ALTER TABLE `komplain`
  ADD CONSTRAINT `komplain_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komplain_ibfk_2` FOREIGN KEY (`id_hunian`) REFERENCES `hunian` (`id_hunian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`id_hunian`) REFERENCES `hunian` (`id_hunian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_hunian`) REFERENCES `hunian` (`id_hunian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
