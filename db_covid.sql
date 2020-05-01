-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Bulan Mei 2020 pada 11.14
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_covid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_country`
--

CREATE TABLE `tb_country` (
  `id_country` int(11) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_country`
--

INSERT INTO `tb_country` (`id_country`, `country`) VALUES
(1, 'USA'),
(2, 'Spain'),
(3, 'Italy'),
(4, 'France'),
(5, 'UK'),
(6, 'Germany'),
(7, 'Turkey'),
(8, 'Russia'),
(9, 'Iran'),
(10, 'China');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_covid`
--

CREATE TABLE `tb_covid` (
  `id_covid` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `covid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_covid`
--

INSERT INTO `tb_covid` (`id_covid`, `id_country`, `covid`) VALUES
(1, 1, 1029878),
(2, 2, 232128),
(3, 3, 201505),
(4, 4, 165911),
(5, 5, 161145),
(6, 6, 159431),
(7, 7, 114563),
(8, 8, 93558),
(9, 9, 92584),
(10, 10, 82836);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_covid19`
--

CREATE TABLE `tb_covid19` (
  `id_covid` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `newcases` int(20) NOT NULL,
  `totaldeaths` int(20) NOT NULL,
  `newdeaths` int(20) DEFAULT NULL,
  `totalrecovered` int(20) DEFAULT NULL,
  `activecase` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_covid19`
--

INSERT INTO `tb_covid19` (`id_covid`, `id_country`, `newcases`, `totaldeaths`, `newdeaths`, `totalrecovered`, `activecase`) VALUES
(1, 1, 19522, 58640, 1843, 140138, 831100),
(2, 2, 2706, 23822, 301, 123903, 84403),
(3, 3, 2091, 27359, 382, 68941, 105205),
(4, 4, 2638, 23660, 367, 46886, 95365),
(5, 5, 3996, 21678, 586, NULL, 139123),
(6, 6, 673, 6215, 89, 117400, 35816),
(7, 7, 2392, 2992, 92, 38809, 72852),
(8, 8, 6411, 867, 73, 8456, 84235),
(9, 9, 1112, 5877, 71, 72439, 14628),
(10, 10, 6, 4633, NULL, 77555, 648);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_country`
--
ALTER TABLE `tb_country`
  ADD PRIMARY KEY (`id_country`);

--
-- Indeks untuk tabel `tb_covid`
--
ALTER TABLE `tb_covid`
  ADD PRIMARY KEY (`id_covid`);

--
-- Indeks untuk tabel `tb_covid19`
--
ALTER TABLE `tb_covid19`
  ADD PRIMARY KEY (`id_covid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_country`
--
ALTER TABLE `tb_country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_covid`
--
ALTER TABLE `tb_covid`
  MODIFY `id_covid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
