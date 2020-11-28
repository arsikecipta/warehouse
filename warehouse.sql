-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2020 at 10:54 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `biayasimpan`
--

CREATE TABLE `biayasimpan` (
  `id_biaya` int(11) NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `bulan` varchar(200) NOT NULL,
  `biaya_sewa` int(11) NOT NULL,
  `jumlah_unit` int(11) NOT NULL,
  `harga_unit` int(11) NOT NULL,
  `rata_rata_jumlah` int(11) NOT NULL,
  `biaya_investasi_persediaan` float NOT NULL,
  `total_biaya_perawatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `biayasimpan`
--

INSERT INTO `biayasimpan` (`id_biaya`, `id_gudang`, `bulan`, `biaya_sewa`, `jumlah_unit`, `harga_unit`, `rata_rata_jumlah`, `biaya_investasi_persediaan`, `total_biaya_perawatan`) VALUES
(1, 1, 'November', 1000000, 6000, 100, 3000, 0.24, 72000),
(2, 2, 'November', 1000000, 6000, 100, 3000, 0.24, 72000);

-- --------------------------------------------------------

--
-- Table structure for table `datagudang`
--

CREATE TABLE `datagudang` (
  `id_gudang` int(11) NOT NULL,
  `kode_gudang` varchar(200) NOT NULL,
  `nama_gudang` varchar(200) NOT NULL,
  `alamat_gudang` varchar(200) NOT NULL,
  `jenis_gudang` varchar(200) NOT NULL,
  `luas_gudang` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datagudang`
--

INSERT INTO `datagudang` (`id_gudang`, `kode_gudang`, `nama_gudang`, `alamat_gudang`, `jenis_gudang`, `luas_gudang`) VALUES
(1, 'G001', 'Gudang A', 'Jl. Mawar', 'Gudang Material Mentah', '1 hektar'),
(2, 'G002', 'Gudang B', 'Jl. Melati', 'Gudang Material Jadi', '1 hektar');

-- --------------------------------------------------------

--
-- Table structure for table `listallbarang`
--

CREATE TABLE `listallbarang` (
  `id_barang` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `kode_barang` varchar(200) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `satuan_barang` varchar(200) NOT NULL,
  `jenis_barang` varchar(200) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `stock_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `listallbarang`
--

INSERT INTO `listallbarang` (`id_barang`, `id_lokasi`, `kode_barang`, `nama_barang`, `satuan_barang`, `jenis_barang`, `harga_barang`, `stock_barang`) VALUES
(1, 1, 'MM-1', 'Besi', 'Ton', 'Material Mentah', 10000000, 100),
(2, 2, 'MJ-1', 'Ban', 'Buah', 'Material Jadi', 2000000, 500),
(3, 3, 'MM-2', 'Karet', 'Kg', 'Material Mentah', 55000, 300);

-- --------------------------------------------------------

--
-- Table structure for table `lokasibarang`
--

CREATE TABLE `lokasibarang` (
  `id_lokasi` int(11) NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `kode_rak` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasibarang`
--

INSERT INTO `lokasibarang` (`id_lokasi`, `id_gudang`, `kode_rak`) VALUES
(1, 1, 'RM-1'),
(2, 2, 'RJ-1'),
(3, 1, 'RM-2'),
(4, 2, 'RJ-2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biayasimpan`
--
ALTER TABLE `biayasimpan`
  ADD PRIMARY KEY (`id_biaya`),
  ADD KEY `id_gudang` (`id_gudang`);

--
-- Indexes for table `datagudang`
--
ALTER TABLE `datagudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `listallbarang`
--
ALTER TABLE `listallbarang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `lokasibarang`
--
ALTER TABLE `lokasibarang`
  ADD PRIMARY KEY (`id_lokasi`),
  ADD KEY `id_gudang` (`id_gudang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `listallbarang`
--
ALTER TABLE `listallbarang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biayasimpan`
--
ALTER TABLE `biayasimpan`
  ADD CONSTRAINT `biayasimpan_ibfk_1` FOREIGN KEY (`id_gudang`) REFERENCES `datagudang` (`id_gudang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `listallbarang`
--
ALTER TABLE `listallbarang`
  ADD CONSTRAINT `listallbarang_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasibarang` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lokasibarang`
--
ALTER TABLE `lokasibarang`
  ADD CONSTRAINT `lokasibarang_ibfk_2` FOREIGN KEY (`id_gudang`) REFERENCES `datagudang` (`id_gudang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
