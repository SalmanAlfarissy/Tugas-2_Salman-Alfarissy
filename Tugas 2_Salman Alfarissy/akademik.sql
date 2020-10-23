-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 12:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nobp` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `fakultas` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nobp`, `nama`, `nohp`, `jalan`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `fakultas`, `jurusan`) VALUES
(1811081014, 'Mutia', '082280904321', 'jl.payakumbuah', 'kota payakumbuah', 'baru', 'Baru Bana', 'Sumatera Barat', 'Teknologi Informasi', 'Teknologi Rekayasa Perangkat Lunak'),
(1811082014, 'Vira Mistika', '082285000933', 'jl.Bonjol', 'Kampuang Dalam', 'Pasbar', 'Pasaman', 'Sumatera Barat', 'Teknologi Informasi', 'Teknologi Rekayasa Perangkat Lunak'),
(1811082023, 'Bayu gusti paraya', '080904543644', 'jl.payakumbuah Bukik', 'Paya', 'kumbuah', 'Payakumbuah', 'Sumatera Barat', 'Teknologi Informasi', 'Teknologi Rekayasa Perangkat Lunak'),
(1811082026, 'Randi', '080933008988', 'jl.pasaman', 'Pasbar', 'Pasaman', 'Pasaman Barat', 'Sumatera Barat', 'Bahasa', 'Sastra indonesia'),
(1811082027, 'Salman Alfarissy', '082285032741', 'jl.Simalaka', 'Kampuang Tanjuang', 'Patamuan', 'Padang Pariaman', 'Sumatera Barat', 'Teknologi Informasi', 'Teknologi Rekayasa Perangkat Lunak'),
(1813000820, 'Putri Yulia', '080944568799', 'jl.sungai sariak - pariaman', 'Bisati', 'Patamuan', 'Padang Pariaman', 'Sumatera Barat', 'Kimia', 'Kimia Murni');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `namamatkul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `namamatkul`) VALUES
(1, 'Project 2'),
(2, 'Bahasa Indonesia'),
(3, 'Bahasa indonesia'),
(4, 'artificial intelligence'),
(5, 'Kimia'),
(6, 'Web framework'),
(7, 'Pancasila'),
(8, 'Project Management ');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `nobp` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `semester` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`nobp`, `id_matkul`, `nilai`, `semester`) VALUES
(1811082027, 1, 97, 'Semester 5'),
(1811082023, 6, 97, 'Semester 5'),
(1813000820, 5, 98, 'Semester 5'),
(1811082026, 2, 98, 'Semester 5'),
(1811082014, 7, 95, 'Semester 5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nobp`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD KEY `nobp` (`nobp`,`id_matkul`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `nobp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1813000821;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nobp`) REFERENCES `mahasiswa` (`nobp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
