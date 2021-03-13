-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Mar 2021 pada 19.00
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pepek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `atms`
--

CREATE TABLE `atms` (
  `id` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posrx` float NOT NULL,
  `posry` float NOT NULL,
  `posrz` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `atms`
--

INSERT INTO `atms` (`id`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`, `interior`, `world`) VALUES
(0, 2248.51, -1759.95, 1014.38, 0, 0, -176.5, 1, 0),
(5, 1760.83, -1750.86, 13.235, 0, 0, 0, 0, 0),
(6, 391.069, -1805.93, 7.53812, 0, 0, 180, 0, 0),
(8, 317.072, -158.875, 999.253, 0, 0, 0, 6, 10),
(9, -11.9034, -30.933, 1003.22, 0, 0, 91.1, 10, 11),
(10, -19.6629, -57.9933, 1003.18, 0, 0, 179.4, 6, 2),
(11, -31.2823, -58.0181, 1002.99, 0, 0, -179.7, 6, 2),
(12, -19.6204, -57.8527, 1003.15, 0, 0, -179.9, 6, 12),
(13, 252.641, 111.664, 1002.81, 0, 0, -89.6, 10, 0),
(14, 1396.8, -15.4888, 1000.67, 0, 0, -90.5, 1, 0),
(15, 1745.92, -1769.29, 13.1919, 0, 0, 89.9, 0, 0),
(16, -11.8383, -31.0091, 1003.14, 0, 0, 89.9, 10, 0),
(17, 1596.93, -1784.84, 13.1823, 0, 0, 91.9, 0, 0),
(18, 1432.88, -33.1054, 1000.54, 0, 0, -179.4, 1, 0),
(19, -2025.11, -56.0082, 1060.52, 0, 0, -88.6, 1, 0),
(21, 1290.27, -792.651, 87.9251, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `banneds`
--

CREATE TABLE `banneds` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(24) DEFAULT 'None',
  `ip` varchar(24) DEFAULT 'None',
  `longip` int(11) DEFAULT 0,
  `ban_expire` bigint(16) DEFAULT 0,
  `ban_date` bigint(16) DEFAULT 0,
  `last_activity_timestamp` bigint(16) DEFAULT 0,
  `admin` varchar(40) DEFAULT 'Server',
  `reason` varchar(128) DEFAULT 'None'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bisnis`
--

CREATE TABLE `bisnis` (
  `ID` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `name` varchar(40) NOT NULL DEFAULT 'Bisnis',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `money` int(11) NOT NULL DEFAULT 0,
  `prod` int(11) NOT NULL DEFAULT 50,
  `bprice0` int(11) NOT NULL DEFAULT 500,
  `bprice1` int(11) NOT NULL DEFAULT 500,
  `bprice2` int(11) NOT NULL DEFAULT 500,
  `bprice3` int(11) NOT NULL DEFAULT 500,
  `bprice4` int(11) NOT NULL DEFAULT 500,
  `bprice5` int(11) NOT NULL DEFAULT 500,
  `bprice6` int(11) NOT NULL DEFAULT 500,
  `bprice7` int(11) NOT NULL DEFAULT 500,
  `bprice8` int(11) NOT NULL DEFAULT 500,
  `bprice9` int(11) NOT NULL DEFAULT 500,
  `bprice10` int(11) NOT NULL DEFAULT 500,
  `bint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `pointx` float DEFAULT 0,
  `pointy` float DEFAULT 0,
  `pointz` float DEFAULT 0,
  `visit` bigint(16) NOT NULL DEFAULT 0,
  `restock` tinyint(2) NOT NULL DEFAULT 0,
  `worker1` varchar(30) NOT NULL DEFAULT 'Vacant',
  `worker2` varchar(30) NOT NULL DEFAULT 'Vacant',
  `worker3` varchar(30) NOT NULL DEFAULT 'Vacant',
  `worker4` varchar(30) NOT NULL DEFAULT 'Vacant',
  `worker5` varchar(30) NOT NULL DEFAULT 'Vacant',
  `work` tinyint(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bisnis`
--

INSERT INTO `bisnis` (`ID`, `owner`, `name`, `price`, `type`, `locked`, `money`, `prod`, `bprice0`, `bprice1`, `bprice2`, `bprice3`, `bprice4`, `bprice5`, `bprice6`, `bprice7`, `bprice8`, `bprice9`, `bprice10`, `bint`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `pointx`, `pointy`, `pointz`, `visit`, `restock`, `worker1`, `worker2`, `worker3`, `worker4`, `worker5`, `work`) VALUES
(0, 'Zsolt_Petreny', '{FF5500}HRJ Mart', 20000, 2, 0, 6723, 134, 8, 10, 20, 15, 20, 15, 5, 10, 1000, 0, 500, 10, 1833.62, -1842.45, 13.5781, 60.384, 5.73, -31.04, 1003.54, 355.73, 2.46679, -29.0183, 1003.55, 1610212843, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(1, 'Cesar_Vilcenvia', 'Anugrah Equipment Store', 20000, 4, 0, 82795, 0, 4, 5, 5, 3, 5, 3, 3, 1, 0, 0, 500, 4, 1352.55, -1759.22, 13.5078, 1.51543, 285.93, -86, 1001.52, 352.95, 291.823, -84.0325, 1001.52, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(2, 'Diego_Walkerr', '{00ff00}M&L Market Idlewood', 125000, 2, 0, 23716, 87, 5, 5, 7, 4, 35, 50, 10, 35, 100, 0, 500, 6, 1928.58, -1776.29, 13.5469, 88.4593, -26.68, -57.92, 1003.54, 357.58, -23.5659, -55.6246, 1003.55, 1611672720, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(3, 'Cesar_Vilcenvia', 'The Idlestack Pizza', 23000, 1, 0, 547277, 0, 10, 5, 2, 1, 0, 0, 0, 0, 0, 0, 500, 5, 2105.49, -1806.52, 13.5547, 270.218, 372.34, -133.25, 1001.49, 4.8, 374.656, -118.924, 1001.5, 1610268237, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(4, '-', 'tokoh murah', 150000, 4, 1, 0, 0, 50, 50, 50, 50, 50, 25, 10, 5, 0, 0, 500, 6, 2001.89, -1761.95, 13.5391, 351.744, 316.34, -169.6, 999.6, 357.73, 0, 0, 0, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(5, 'Alexander_Eastwood', '{ff00ff}J&K Clothing', 100000, 3, 0, 10051, 97, 175, 100, 200, 150, 0, 0, 0, 0, 0, 0, 500, 15, 2244.42, -1665.36, 15.4766, 330.584, 207.55, -110.67, 1005.13, 0.159997, 207.595, -100.327, 1005.26, 1611614372, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(6, 'Ray_Alexandrovich', 'H&T Equipment', 20000, 4, 0, 18, 140, 250, 100, 50, 50, 75, 40, 100, 10, 0, 0, 500, 6, 1133.4, -1370.03, 13.9844, 165.222, 316.34, -169.6, 999.6, 357.73, 312.211, -166.141, 999.601, 1612599901, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(7, '-', 'Chiken Restourant', 9999999, 1, 1, 0, 0, 50, 80, 100, 70, 0, 0, 0, 0, 0, 0, 500, 10, 1104.8, -1370.14, 13.9844, 176.94, 363.22, -74.86, 1001.5, 319.72, 376.601, -67.8019, 1001.52, 0, 1, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(8, '-', 'toko baju', 999999, 3, 1, 0, 0, 5, 1, 4, 2, 0, 0, 0, 0, 0, 0, 500, 14, 1126.04, -1370.06, 13.9844, 177.519, 204.49, -168.26, 1000.52, 358.74, 204.393, -159.354, 1000.52, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(9, '-', 'Alfamart', 200000, 2, 1, 0, 0, 2, 2, 20, 50, 70, 100, 15, 30, 500, 0, 500, 6, 1119.2, -1370.03, 13.9844, 167.331, -26.68, -57.92, 1003.54, 357.58, -29.8522, -55.6217, 1003.55, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(10, 'Lucio_Ladanza', 'Barakatih Mukthariah', 25000, 4, 0, 1528, 41, 30, 15, 30, 15, 35, 30, 15, 5, 0, 0, 500, 6, -223.835, -2263.39, 29.3, 124.292, 316.34, -169.6, 999.6, 357.73, 312.358, -166.14, 999.601, 1613296648, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(11, 'Vanny_Meylita', '{C71585}2JZ {0000CC}Gas Vinewoo', 25000, 2, 0, 2304, 52, 8, 8, 30, 30, 35, 35, 25, 35, 15, 0, 500, 10, 1000.58, -919.908, 42.3281, 97.3756, 5.73, -31.04, 1003.54, 355.73, 2.16455, -29.0144, 1003.55, 1597004867, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(12, 'Cesar_Vilcenvia', 'Kelontong Mullholand', 1, 2, 0, 0, 0, 10, 10, 45, 30, 35, 25, 20, 20, 10, 0, 500, 6, 1315.51, -897.691, 39.5781, 180.253, -26.68, -57.92, 1003.54, 357.58, -23.2932, -55.641, 1003.55, 1610959376, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(13, 'Vika_Valerianpola', '{00ffff}Burger King', 1, 1, 0, 1506, 0, 25, 20, 30, 15, 0, 0, 0, 0, 0, 0, 500, 10, 1199.28, -918.145, 43.1231, 183.448, 363.22, -74.86, 1001.5, 319.72, 377.44, -67.4358, 1001.51, 1597546798, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(14, '-', '{ff00ff}Mafia Burger Shoot', 250000, 1, 1, 0, 0, 20, 25, 30, 30, 0, 0, 0, 0, 0, 0, 500, 10, 810.508, -1616.24, 13.5469, 267.205, 363.22, -74.86, 1001.5, 319.72, 377.483, -67.4345, 1001.51, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(15, '-', 'James Market', 100000, 2, 0, 0, 0, 10, 10, 30, 5, 50, 30, 10, 20, 0, 0, 500, 6, 2095.91, -1211.59, 23.9631, 180.67, -26.68, -57.92, 1003.54, 357.58, -23.261, -55.6436, 1003.55, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(16, '-', '~EFH~ Market 24/7', 100000, 2, 1, 0, 0, 50, 50, 150, 100, 200, 250, 150, 100, 500, 0, 500, 6, 661.361, -573.632, 16.3359, 73.5235, -26.68, -57.92, 1003.54, 357.58, -23.3457, -55.1314, 1003.55, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(17, '-', '~EFH~ Food Meal', 200000, 1, 1, 0, 0, 50, 100, 150, 100, 0, 0, 0, 0, 0, 0, 500, 5, 203.496, -201.993, 1.57812, 170.677, 372.34, -133.25, 1001.49, 4.8, 374.61, -118.96, 1001.5, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(18, 'Cesar_Vilcenvia', 'Verdant Bluffs', 100000, 4, 0, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 4, 1078.85, -1861.91, 13.5469, 182.048, 285.93, -86, 1001.52, 352.95, 0, 0, 0, 1610256686, 1, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(19, 'Fadhlan_Syauqi', 'H U N T E R Market', 0, 4, 0, 1000, 0, 50, 250, 35, 20, 35, 35, 100, 150, 0, 0, 500, 6, 1102.41, -1451.39, 15.7969, 85.2098, 316.34, -169.6, 999.6, 357.73, 0, 0, 0, 0, 1, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(20, '-', '{FDF123}KING RING DONUT MARKET', 125000, 1, 1, 0, 0, 20, 25, 30, 15, 0, 0, 0, 0, 0, 0, 500, 5, 1038.15, -1340.73, 13.7451, 179.354, 372.34, -133.25, 1001.49, 4.8, 375.269, -118.968, 1001.5, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(21, '-', 'Flint County', 250000, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 6, -78.3681, -1169.88, 2.13552, 249.212, -26.68, -57.92, 1003.54, 357.58, -23.5229, -55.6299, 1003.55, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(22, 'Syak_Hasya', 'SKNX Restaurant', 0, 1, 0, 1000, 0, 12, 30, 42, 15, 0, 0, 0, 0, 0, 0, 500, 5, 2420.08, -1508.97, 24, 87.3195, 372.34, -133.25, 1001.49, 4.8, 375.436, -118.965, 1001.5, 1610619670, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(23, 'Jordi_Pratama', 'JP Market Restaurant', 0, 1, 0, -714, 136, 5, 10, 15, 10, 0, 0, 0, 0, 0, 0, 500, 10, 1154.56, -1440.15, 15.7969, 269.897, 363.22, -74.86, 1001.5, 319.72, 376.467, -67.4342, 1001.51, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(24, 'Diego_Walkerr', '{ff00ff}Kings Steak', 0, 1, 0, 20665, 108, 8, 15, 20, 15, 0, 0, 0, 0, 0, 0, 500, 5, 928.915, -1352.97, 13.3438, 271.929, 372.34, -133.25, 1001.49, 4.8, 375.583, -118.802, 1001.5, 1610782768, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(25, '-', 'Palomino Creek', 300000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 5, 2331.81, 75.0591, 26.621, 87.2152, 372.34, -133.25, 1001.49, 4.8, 0, 0, 0, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0),
(26, '-', 'Willowfield', 100000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 5, 2397.79, -1899.18, 13.5469, 182.072, 372.34, -133.25, 1001.49, 4.8, 0, 0, 0, 0, 0, 'Vacant', 'Vacant', 'Vacant', 'Vacant', 'Vacant', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

CREATE TABLE `contacts` (
  `ID` int(12) DEFAULT 0,
  `contactID` int(12) NOT NULL,
  `contactName` varchar(32) DEFAULT NULL,
  `contactNumber` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `doors`
--

CREATE TABLE `doors` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT 'None',
  `password` varchar(50) DEFAULT '',
  `icon` int(11) DEFAULT 19130,
  `locked` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `faction` int(11) NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT -1,
  `garage` tinyint(3) NOT NULL DEFAULT 0,
  `custom` int(11) NOT NULL DEFAULT 0,
  `extvw` int(11) DEFAULT 0,
  `extint` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intvw` int(11) DEFAULT 0,
  `intint` int(11) NOT NULL DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `doors`
--

INSERT INTO `doors` (`ID`, `name`, `password`, `icon`, `locked`, `admin`, `vip`, `faction`, `family`, `garage`, `custom`, `extvw`, `extint`, `extposx`, `extposy`, `extposz`, `extposa`, `intvw`, `intint`, `intposx`, `intposy`, `intposz`, `intposa`) VALUES
(0, 'San Andreas Police Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1555.3, -1675.69, 16.1953, 87.1144, 0, 10, 246.327, 107.473, 1003.22, 11.6004),
(1, 'San Andreas Police Departement', '', 19130, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1564.9, -1666.98, 28.3956, 163.063, 0, 10, 218.228, 123.704, 1007.26, 266.488),
(2, 'San Andreas Police Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1568.68, -1690.12, 6.21875, 184.131, 0, 10, 227.041, 117.665, 999.034, 88.3912),
(3, 'City Hall', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1481.02, -1817.8, 15.3196, 0.63025, 0, 1, 1387.57, -12.7882, 1000.98, 274.031),
(4, 'San Andreas Goverment Service', '', 19130, 0, 0, 0, 2, -1, 0, 1, 0, 0, 1485.14, -1824.97, 13.5469, 183.735, 0, 1, 1405.66, -12.4833, 1000.98, 187.405),
(5, 'San Andreas Medical Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 2034.35, -1401.86, 17.2965, 182.651, 0, 1, -2035.83, -58.028, 1060.99, 273.832),
(6, 'San Andreas Medical Departement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 1, -2007.88, -73.2096, 1060.99, 6.41084, 0, 0, 0, 0, 0, 0),
(7, 'San Andreas Medical Departement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 1, -2013.29, -73.1903, 1060.99, 2.65063, 0, 0, 0, 0, 0, 0),
(8, 'ASGH Medical Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1172.08, -1323.28, 15.4028, 272.005, 0, 1, 1429.34, -13.8795, 1000.92, 263.117),
(9, 'ASGH Medical Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1144.88, -1324.18, 13.5853, 78.0049, 0, 1, 1458.09, -32.89, 1000.92, 2.44448),
(10, 'ASGH Medical Departement', '', 19130, 0, 0, 0, 3, -1, 0, 1, 0, 0, 1163.41, -1329.97, 31.4847, 12.2057, 0, 1, 1445.18, 6.96744, 1004.57, 181.023),
(11, 'San Andreas News Agency', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 649.305, -1357.31, 14.1492, 75.3488, 0, 1, 2451.8, 2282.38, 91.6744, 232.272),
(12, 'San Andreas News Agency Studio', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 739.991, -1351.49, 14.7142, 94.0077, 0, 1, 248.441, 1783.74, 701.086, 196.479),
(13, 'Bank Los Santos', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1462.48, -1010.18, 26.8438, 185.685, 0, 1, 2248.83, -1744.54, 1014.78, 178.418),
(14, 'Taxi Longue', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1752.63, -1894.08, 13.5574, 276.873, 0, 1, -2158.5, 642.905, 1052.38, 184.752),
(15, 'VIP Longue', '', 19130, 0, 0, 1, 0, -1, 0, 1, 0, 0, 1797.65, -1578.89, 14.0861, 280.855, 0, 1, -4107.23, 906.906, 3.10072, 176.818),
(16, 'SANEWS', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 737.635, -1353.18, 25.2202, 92.2759, 0, 1, 2473.37, 2278.44, 91.6868, 348.316),
(17, 'SANews Base', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 1, 253.447, 1780.27, 701.086, 86.788, 0, 1, 2467.58, 2253.87, 91.6868, 89.1242),
(18, 'Black Market', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1566.67, 23.3435, 24.1641, 93.6559, 0, 1, -3799.72, 1319.11, 75.5875, 85.1959),
(19, 'Alhambra', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1837.03, -1682.21, 13.323, 87.4758, 0, 3, -2636.87, 1402.56, 906.461, 12.1067),
(20, 'VIP Car Garage', '', 19130, 0, 0, 1, 0, -1, 1, 1, 0, 0, 1827.26, -1538.06, 13.5469, 165.884, 0, 0, 1818.76, -1537.02, 13.3813, 84.7065),
(21, 'VIP Bike Garage', '', 19130, 0, 0, 1, 0, -1, 1, 1, 0, 0, 1754.34, -1594.77, 13.537, 79.0899, 0, 0, 1753.36, -1587.71, 13.3052, 357.622),
(22, 'Pengadilan San Andreas', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1411.82, -1699.65, 13.5395, 238.772, 0, 1, 1356.01, 717.951, -15.7573, 260.304),
(23, 'Willowfield Gym', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2493.03, -1958.55, 13.5827, 3.07504, 0, 6, 774.372, -50.2732, 1000.59, 2.59314),
(24, 'FBI ', '', 19130, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1783.23, -1705.54, 13.5234, 179.148, 5, 3, 1038.14, -2.79025, 1001.28, 1.82928),
(27, 'Parkiran', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 1574.57, -1637.43, 13.5677, 180.336, 0, 10, 213.987, 118.339, 1003.22, 88.2424),
(25, 'Tempat Maksiat', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1940, -2115.88, 13.6953, 270.514, 0, 3, 964.285, -53.2305, 1001.12, 88.7388),
(26, 'Room 2', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 10, 266.434, 114.167, 1004.62, 90.3947, 0, 3, 231.438, 170.277, 1003.02, 1.82617);

-- --------------------------------------------------------

--
-- Struktur dari tabel `familys`
--

CREATE TABLE `familys` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'None',
  `leader` varchar(50) NOT NULL DEFAULT 'None',
  `motd` varchar(100) NOT NULL DEFAULT 'None',
  `color` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0,
  `fint` int(11) NOT NULL DEFAULT 0,
  `rankname1` varchar(32) NOT NULL DEFAULT 'Outsider',
  `rankname2` varchar(32) NOT NULL DEFAULT 'Associate',
  `rankname3` varchar(32) NOT NULL DEFAULT 'Soldier',
  `rankname4` varchar(32) NOT NULL DEFAULT 'Advisor',
  `rankname5` varchar(32) NOT NULL DEFAULT 'UnderBoss',
  `rankname6` varchar(32) NOT NULL DEFAULT 'GodFather',
  `Weapon1` int(11) NOT NULL DEFAULT 0,
  `Ammo1` int(11) NOT NULL DEFAULT 0,
  `Weapon2` int(11) NOT NULL DEFAULT 0,
  `Ammo2` int(11) NOT NULL DEFAULT 0,
  `Weapon3` int(11) NOT NULL DEFAULT 0,
  `Ammo3` int(11) NOT NULL DEFAULT 0,
  `Weapon4` int(11) NOT NULL DEFAULT 0,
  `Ammo4` int(11) NOT NULL DEFAULT 0,
  `Weapon5` int(11) NOT NULL DEFAULT 0,
  `Ammo5` int(11) NOT NULL DEFAULT 0,
  `Weapon6` int(11) NOT NULL DEFAULT 0,
  `Ammo6` int(11) NOT NULL DEFAULT 0,
  `Weapon7` int(11) NOT NULL DEFAULT 0,
  `Ammo7` int(11) NOT NULL DEFAULT 0,
  `Weapon8` int(11) NOT NULL DEFAULT 0,
  `Ammo8` int(11) NOT NULL DEFAULT 0,
  `Weapon9` int(11) NOT NULL DEFAULT 0,
  `Ammo9` int(11) NOT NULL DEFAULT 0,
  `Weapon10` int(11) NOT NULL DEFAULT 0,
  `Ammo10` int(11) NOT NULL DEFAULT 0,
  `safex` float DEFAULT 0,
  `safey` float DEFAULT 0,
  `safez` float DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `familys`
--

INSERT INTO `familys` (`ID`, `name`, `leader`, `motd`, `color`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `fint`, `rankname1`, `rankname2`, `rankname3`, `rankname4`, `rankname5`, `rankname6`, `Weapon1`, `Ammo1`, `Weapon2`, `Ammo2`, `Weapon3`, `Ammo3`, `Weapon4`, `Ammo4`, `Weapon5`, `Ammo5`, `Weapon6`, `Ammo6`, `Weapon7`, `Ammo7`, `Weapon8`, `Ammo8`, `Weapon9`, `Ammo9`, `Weapon10`, `Ammo10`, `safex`, `safey`, `safez`, `money`, `marijuana`, `component`, `material`) VALUES
(1, '168th_Ganton_Blocks_Crips', 'James_Washington', 'None', 0, 2455.06, -1707.67, 13.6187, 171.988, 302.112, 1276.2, 1080.95, 187.318, 1, 'Outsider', 'Associate', 'Soldier', 'Advisor', 'UnderBoss', 'GodFather', 1, 1, 0, 0, 1, 1, 5, 1, 1, 1, 5, 1, 5, 1, 41, 1800, 1, 1, 1, 1, 270.264, 1265.74, 1080.95, 0, 0, 0, 0),
(2, 'The_Rebels', 'Ozora_Farhan', 'None', 0, 1154.54, -1181.05, 32.8187, 92.1858, 326.068, 1854.62, 268.976, 182.45, 1, 'Outsider', 'Associate', 'Soldier', 'Advisor', 'UnderBoss', 'GodFather', 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 325.047, 1843.4, 268.302, 0, 0, 0, 1),
(3, 'The_Blue_MC', 'Bimo_Hermansyah', 'None', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Outsider', 'Associate', 'Soldier', 'Advisor', 'UnderBoss', 'GodFather', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'La_Costra_Mafia', 'Arturo_Radislav', 'None', 0, 1303.1, -792.337, 88.305, 232.138, 1224.17, -749.309, 1085.73, 268.383, 0, 'Outsider', 'Associate', 'Soldier', 'Advisor', 'UnderBoss', 'GodFather', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1275.92, -739.807, 1096.52, 200, 1957, 0, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gates`
--

CREATE TABLE `gates` (
  `ID` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `password` varchar(36) NOT NULL DEFAULT '',
  `admin` tinyint(3) NOT NULL DEFAULT 0,
  `vip` tinyint(3) NOT NULL DEFAULT 0,
  `faction` tinyint(3) NOT NULL DEFAULT 0,
  `family` int(10) NOT NULL DEFAULT -1,
  `speed` float NOT NULL DEFAULT 2,
  `cX` float NOT NULL,
  `cY` float NOT NULL,
  `cZ` float NOT NULL,
  `cRX` float NOT NULL,
  `cRY` float NOT NULL,
  `cRZ` float NOT NULL,
  `oX` float NOT NULL,
  `oY` float NOT NULL,
  `oZ` float NOT NULL,
  `oRX` float NOT NULL,
  `oRY` float NOT NULL,
  `oRZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gates`
--

INSERT INTO `gates` (`ID`, `model`, `password`, `admin`, `vip`, `faction`, `family`, `speed`, `cX`, `cY`, `cZ`, `cRX`, `cRY`, `cRZ`, `oX`, `oY`, `oZ`, `oRX`, `oRY`, `oRZ`) VALUES
(0, 980, '', 0, 0, 1, -1, 2, 1539.41, -1627.56, 15.0128, 0, 0, 90.2, 1539.41, -1627.56, 9.51278, 0, 0, 90.2),
(1, 986, '', 0, 0, 4, -1, 2, 777.918, -1385.11, 13.6232, 0, 0, 0, 769.928, -1385.11, 13.6232, 0, 0, 0),
(2, 986, '', 0, 0, 3, -1, 2, 1147.43, -1290.87, 13.6388, 0, 0, 1.1, 1153.97, -1290.74, 13.6388, 0, 0, 1.1),
(3, 980, 'Fakhri11072008', 0, 0, 0, -1, 5, 265.306, -1333.1, 54.7343, 0, -0.599997, 34.1, 272.377, -1328.31, 54.8237, 0, -0.599997, 34.1),
(4, 2930, '', 0, 0, 1, 0, 5, 1539.67, -1618.55, 14.9769, 0, 0, 0.40001, 1539.67, -1618.55, 12.5169, 0, 0, 0.40001),
(6, 2990, '', 0, 0, 0, -1, 3, 1587.68, -1638.01, 14.7028, 0, -0.7, 0, 1587.76, -1638.01, 8.43321, 0, -0.7, 0),
(5, 19912, '', 0, 0, 0, -1, 2, 1251.47, -766.88, 91.9345, 0, 0, 0, 1251.47, -766.88, 88.2545, 0, 0, 0),
(7, 976, 'HE4NG', 0, 0, 0, -1, 3, 731.763, -586.702, 15.4861, 0, 0, 90.2001, 731.792, -595.132, 15.4861, 0, 0, 90.2001),
(8, 19912, '', 0, 0, 2, -1, 7, 1270.32, -2051.26, 60.8179, 0, 0, 0, 1270.32, -2051.26, 55.4479, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gstations`
--

CREATE TABLE `gstations` (
  `id` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 10000,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gstations`
--

INSERT INTO `gstations` (`id`, `stock`, `posx`, `posy`, `posz`) VALUES
(0, 8426, 1937.56, -1772.77, 13.3828),
(1, 7390, 1944.66, -1772.42, 13.3906),
(2, 7599, -96.0828, -1160.66, 2.18832),
(3, 7746, -93.6488, -1174.95, 2.26908),
(4, 7846, 1004.67, -940.464, 42.1797),
(5, 7959, 1004.12, -933.524, 42.1797),
(6, 10700, 658.764, -565.936, 16.3359);

-- --------------------------------------------------------

--
-- Struktur dari tabel `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT '-',
  `address` varchar(50) DEFAULT 'None',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `money` int(11) NOT NULL DEFAULT 0,
  `houseint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `visit` bigint(16) DEFAULT 0,
  `houseWeapon1` int(12) DEFAULT 0,
  `houseAmmo1` int(12) DEFAULT 0,
  `houseWeapon2` int(12) DEFAULT 0,
  `houseAmmo2` int(12) DEFAULT 0,
  `houseWeapon3` int(12) DEFAULT 0,
  `houseAmmo3` int(12) DEFAULT 0,
  `houseWeapon4` int(12) DEFAULT 0,
  `houseAmmo4` int(12) DEFAULT 0,
  `houseWeapon5` int(12) DEFAULT 0,
  `houseAmmo5` int(12) DEFAULT 0,
  `houseWeapon6` int(12) DEFAULT 0,
  `houseAmmo6` int(12) DEFAULT 0,
  `houseWeapon7` int(12) DEFAULT 0,
  `houseAmmo7` int(12) DEFAULT 0,
  `houseWeapon8` int(12) DEFAULT 0,
  `houseAmmo8` int(12) DEFAULT 0,
  `houseWeapon9` int(12) DEFAULT 0,
  `houseAmmo9` int(12) DEFAULT 0,
  `houseWeapon10` int(12) DEFAULT 0,
  `houseAmmo10` int(12) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `houses`
--

INSERT INTO `houses` (`ID`, `owner`, `address`, `price`, `type`, `locked`, `money`, `houseint`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `visit`, `houseWeapon1`, `houseAmmo1`, `houseWeapon2`, `houseAmmo2`, `houseWeapon3`, `houseAmmo3`, `houseWeapon4`, `houseAmmo4`, `houseWeapon5`, `houseAmmo5`, `houseWeapon6`, `houseAmmo6`, `houseWeapon7`, `houseAmmo7`, `houseWeapon8`, `houseAmmo8`, `houseWeapon9`, `houseAmmo9`, `houseWeapon10`, `houseAmmo10`) VALUES
(0, 'Arya_Stancee', 'Ganton', 136000, 1, 0, 0, 1, 2495.36, -1691.13, 14.7656, 1.02431, 845.89, -2048, 1476.91, 92.6, 1596920389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 'Fattra_Ramadhan', 'Ganton', 18000, 1, 0, 0, 1, 2514.33, -1691.56, 14.046, 51.4927, 337.61, 1854.1, 1002.08, 265.14, 1599296133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Made_Hilton', 'Ganton', 40000, 2, 0, 0, 1, 2523.25, -1679.43, 15.497, 90.5578, 338.78, 1734.95, 1002.08, 268.46, 1610537791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Javin_Hermansyah', 'Ganton', 20000, 1, 1, 11000, 1, 2524.69, -1658.66, 15.824, 92.563, 337.61, 1854.1, 1002.08, 265.14, 1598448489, 9, 1, 9, 1, 25, 202, 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Kenneth_Alfaro', 'Ganton', 18500, 1, 0, 0, 1, 2513.69, -1650.26, 14.3557, 136.012, 845.89, -2048, 1476.91, 92.6, 1597673863, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'James_Washington', 'Ganton', 18000, 1, 0, 0, 1, 2498.51, -1642.27, 14.1131, 180.464, 337.61, 1854.1, 1002.08, 265.14, 1598508111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Dudung_Sunandar', 'Ganton', 65000, 2, 0, 30500, 1, 2486.49, -1644.54, 14.0772, 179.796, 736.03, 1672.08, 501.08, 356.23, 1598356829, 0, 0, 0, 0, 9, 1, 9, 1, 9, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Loyd_Brawson', 'Ganton', 25000, 1, 0, 1550, 1, 2469.45, -1646.36, 13.7801, 180.799, 338.29, 1794.87, 1002.17, 269.09, 1597780803, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '-', 'Ganton', 85000, 2, 1, 0, 1, 2459.38, -1691.65, 13.5469, 1.94873, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'Andi_Sidahuru', 'Ganton', 24000, 1, 1, 0, 1, 2451.91, -1641.42, 14.0662, 184.102, 337.61, 1854.1, 1002.08, 265.14, 1598084405, 24, 70, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Jaco_Winshine', 'Ganton', 34000, 2, 1, 0, 1, 2413.98, -1646.81, 14.0119, 182.096, 338.78, 1734.95, 1002.08, 268.46, 1598605445, 30, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Ferizal_Arif', 'Ganton', 30000, 1, 0, 0, 1, 2409.01, -1674.92, 14.375, 1.467, 337.61, 1854.1, 1002.08, 265.14, 1598509776, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 'Ridho_Ketong', 'Ganton', 26000, 1, 0, 2000, 1, 2384.57, -1675.82, 15.2457, 0.424284, 338.29, 1794.87, 1002.17, 269.09, 1598083336, 5, 1, 1, 3, 24, 276, 15, 2, 9, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'Bonar_Cartez', 'Ganton', 18500, 1, 0, 15000, 1, 2393.19, -1646.04, 13.9051, 182.617, 338.29, 1794.87, 1002.17, 269.09, 1598490084, 0, 0, 0, 0, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'Tatang_Sumejang', 'Ganton', 42000, 2, 0, 0, 1, 2362.88, -1643.16, 14.3516, 178.606, 338.78, 1734.95, 1002.08, 268.46, 1599120219, 23, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'Mile_Olsen', 'Ganton', 21000, 1, 1, 9500, 1, 2368.28, -1675.29, 14.1682, 359.796, 338.29, 1794.87, 1002.17, 269.09, 1597744626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 'Vanny_Meylita', 'Ganton', 37500, 2, 1, 0, 1, 2326.89, -1681.96, 14.9297, 271.56, 338.78, 1734.95, 1002.08, 268.46, 1598802399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'Ahmad_Gilang', 'Ganton', 20000, 1, 0, 0, 1, 2307.03, -1679.18, 14.3316, 4.14085, 337.61, 1854.1, 1002.08, 265.14, 1599121030, 46, 1, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 'Fico_Felix', 'Ganton', 17300, 1, 1, 0, 1, 2282.34, -1641.24, 15.8898, 178.98, 845.89, -2048, 1476.91, 92.6, 1597658764, 0, 0, 0, 0, 0, 0, 0, 0, 24, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 'Steven_Albert', 'Ganton', 16700, 1, 1, 0, 1, 2257.07, -1643.95, 15.8082, 170.624, 338.29, 1794.87, 1002.17, 269.09, 1597541019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 'Takashi_Akiyama', 'Ganton', 16200, 1, 0, 0, 1, 2244.42, -1637.63, 16.2379, 156.921, 338.29, 1794.87, 1002.17, 269.09, 1614327624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 'Roberto_Agustino', 'Ganton', 17000, 1, 0, 5300, 1, 2308.91, -1714.36, 14.9801, 181.715, 845.89, -2048, 1476.91, 92.6, 1597396656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 'Josh_Blanco', 'Ganton', 17000, 1, 0, 26500, 1, 2326.8, -1716.74, 14.2379, 178.707, 338.29, 1794.87, 1002.17, 269.09, 1597649476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 'Anthony_Carington', 'Ganton', 37000, 2, 1, 2000, 1, 2385.43, -1711.67, 14.2422, 181.676, 736.03, 1672.08, 501.08, 356.23, 1614233766, 46, 1, 42, 1800, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 'Asep_Kardi', 'Ganton', 20000, 1, 0, 0, 1, 2402.6, -1715.01, 14.1328, 181.007, 337.61, 1854.1, 1002.08, 265.14, 1597940303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 'Xin_Ramorez', 'Idlewood', 23000, 1, 1, 0, 1, 2067.06, -1731.58, 14.2066, 270.796, 845.89, -2048, 1476.91, 92.6, 1597402512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 'Fikhi_Nugraha', 'Idlewood', 14000, 1, 0, 0, 1, 2066.27, -1717.08, 14.1363, 271.799, 337.61, 1854.1, 1002.08, 265.14, 1597689623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 'Jayson_Brooklyn', 'Idlewood', 50000, 2, 0, 86346, 1, 2065.11, -1703.53, 14.1484, 270.462, 338.78, 1734.95, 1002.08, 268.46, 1597257653, 24, 342, 25, 48, 30, 179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 'Reagan_Hamilton', 'Idlewood', 17800, 1, 1, 13000, 1, 2066.75, -1656.57, 14.1328, 270.462, 845.89, -2048, 1476.91, 92.6, 1597494338, 0, 0, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 'Tommy_Leon', 'Idlewood', 26000, 1, 0, 0, 1, 2067.6, -1643.79, 14.1363, 270.462, 845.89, -2048, 1476.91, 92.6, 1598694852, 5, 1, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 'Rafly_Herrz', 'Idlewood', 26000, 1, 1, 0, 1, 2067.72, -1628.85, 14.2066, 273.136, 337.61, 1854.1, 1002.08, 265.14, 1598107727, 0, 0, 23, 1000, 23, 1000, 22, 1000, 22, 1487, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 'Rex_Rexaver', 'Idlewood', 21000, 1, 0, 0, 1, 2018.04, -1629.92, 14.0426, 89.2724, 337.61, 1854.1, 1002.08, 265.14, 1597636907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 'Dhams_Martinez', 'Idlewood', 26800, 1, 0, 34000, 1, 2016.53, -1641.69, 14.1129, 89.2724, 845.89, -2048, 1476.91, 92.6, 1597716064, 0, 0, 0, 0, 0, 0, 25, 192, 24, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 'Sean_McHanzo', 'Idlewood', 26800, 1, 1, 16000, 1, 2013.57, -1656.41, 14.1363, 89.9409, 337.61, 1854.1, 1002.08, 265.14, 1598452671, 30, 257, 24, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 'Brooks_Harvey', 'Idlewood', 42100, 2, 1, 0, 1, 2018.21, -1703.2, 14.2344, 87.6014, 736.03, 1672.08, 501.08, 356.23, 1610537519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 'Joni_Nurlaena', 'Idlewood', 18000, 1, 0, 0, 1, 2016.19, -1717.04, 14.125, 90.2752, 338.29, 1794.87, 1002.17, 269.09, 1598621373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 'Miftahul_Hamri', 'Idlewood', 28500, 1, 1, 0, 1, 2015.34, -1732.65, 14.2344, 90.9437, 338.29, 1794.87, 1002.17, 269.09, 1598772784, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 'Jordi_Pratama', 'Idlewood', 150000, 2, 0, 0, 1, 1980.41, -1718.9, 17.0303, 269.42, 351.59, 1669.31, 1002.17, 176.03, 1598645329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 'Jimmy_Cooper', 'Idlewood', 103000, 3, 0, 0, 1, 1981.02, -1682.9, 17.0538, 269.086, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, '-', 'Jefferson', 155000, 3, 1, 0, 1, 2148.93, -1484.88, 26.6241, 90.3447, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 'Rendi_Harellson', 'Jefferson', 16000, 1, 0, 0, 1, 2146.76, -1470.47, 26.0426, 93.0186, 337.61, 1854.1, 1002.08, 265.14, 1597652564, 1, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 'Joko_Boyo', 'Jefferson', 25900, 1, 1, 15500, 1, 2152.2, -1446.38, 26.1051, 91.6816, 338.29, 1794.87, 1002.17, 269.09, 1598885184, 41, 2000, 46, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 'Santorios_Deltoro', 'Jefferson', 25000, 1, 1, 0, 1, 2149.84, -1433.71, 26.0703, 88.3001, 338.29, 1794.87, 1002.17, 269.09, 1598762583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 'Bobby_Markuez', 'Jefferson', 28000, 1, 0, 0, 1, 2150.91, -1419.04, 25.9219, 89.6369, 338.29, 1794.87, 1002.17, 269.09, 1598858373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 'Veron_Verozan', 'Jefferson', 20000, 1, 0, 0, 1, 2151.17, -1400.64, 26.1285, 87.9266, 338.29, 1794.87, 1002.17, 269.09, 1598158585, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 'Bintang_Koswara', 'Jefferson', 16300, 1, 1, 746, 1, 2196.23, -1404.08, 25.9488, 271.804, 338.29, 1794.87, 1002.17, 269.09, 1598452627, 24, 373, 25, 50, 1, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, '-', 'Jefferson', 22000, 1, 1, 0, 1, 2188.56, -1419.28, 26.1562, 272.473, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 'Franklin_Jhonson', 'Jefferson', 22000, 1, 0, 0, 1, 2194.39, -1443.05, 26.0738, 269.377, 338.29, 1794.87, 1002.17, 269.09, 1598602966, 7, 1, 5, 1, 9, 1, 15, 1, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 'Exonix_Zahher', 'Jefferson', 25000, 1, 1, 0, 1, 2191.15, -1455.81, 26, 267.372, 337.61, 1854.1, 1002.08, 265.14, 1610540000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 'Daniel_Fihadinata', 'Jefferson', 28000, 1, 1, 0, 1, 2190.48, -1470.33, 25.9141, 270.38, 338.29, 1794.87, 1002.17, 269.09, 1598540732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 'Kenzo_Barayev', 'Jefferson', 22400, 1, 1, 0, 1, 2190.38, -1487.63, 26.1051, 270.046, 338.29, 1794.87, 1002.17, 269.09, 1599332087, 23, 598, 1, 1, 24, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 'Tyrese_Angelo', 'Jefferson', 15000, 1, 0, 0, 1, 2232.66, -1469.35, 24.5816, 3.80236, 337.61, 1854.1, 1002.08, 265.14, 1597579538, 43, 1000, 41, 6900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 'Taymore_Mchon', 'Jefferson', 15000, 1, 0, 0, 1, 2247.64, -1469.37, 24.4801, 181.797, 338.29, 1794.87, 1002.17, 269.09, 1598285318, 24, 38, 30, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 'Izumi_Renka', 'Jefferson', 15000, 1, 1, 0, 1, 2263.91, -1469.36, 24.3707, 180.124, 337.61, 1854.1, 1002.08, 265.14, 1598762930, 0, 0, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 'Varez_Shelby', 'Jefferson', 18800, 1, 0, 0, 1, 2256.5, -1397.23, 24.5738, 359.643, 845.89, -2048, 1476.91, 92.6, 1598854663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 'Adi_Ningrat', 'Jefferson', 15000, 1, 0, 2200, 1, 2243.46, -1397.21, 24.5738, 359.643, 338.29, 1794.87, 1002.17, 269.09, 1598207104, 0, 0, 9, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 'Joni_Setia', 'Jefferson', 15000, 1, 1, 0, 1, 2230.47, -1397.11, 24.5738, 2.4812, 338.29, 1794.87, 1002.17, 269.09, 1598942138, 5, 1, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 'Fadly_Iswanto', 'Jefferson', 19000, 1, 1, 0, 1, 2202.72, -1363.7, 26.191, 179.064, 337.61, 1854.1, 1002.08, 265.14, 1599203176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 'Falih_Naufal', 'Jefferson', 19000, 1, 1, 301, 1, 2185.19, -1363.72, 26.1598, 177.059, 338.29, 1794.87, 1002.17, 269.09, 1599211575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 'Jevon_Arsah', 'Jefferson', 19000, 1, 0, 0, 1, 2147.68, -1366.16, 25.9723, 177.656, 337.61, 1854.1, 1002.08, 265.14, 1599197111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 'Alfanza_Arrozy', 'Jefferson', 22500, 1, 1, 40000, 1, 2129.53, -1361.7, 26.1363, 177.656, 337.61, 1854.1, 1002.08, 265.14, 0, 24, 69, 24, 140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 'Irfan_Nugroho', 'Jefferson', 35000, 1, 0, 0, 1, 2100.88, -1321.88, 25.9531, 357.388, 845.89, -2048, 1476.91, 92.6, 1598256870, 0, 0, 0, 0, 5, 1, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, '-', 'Jefferson', 65000, 2, 1, 0, 1, 2126.7, -1320.84, 26.6241, 359.354, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 'Owen_Piere', 'Jefferson', 32000, 1, 1, 3000, 1, 2148.56, -1320.06, 26.0738, 359.688, 338.29, 1794.87, 1002.17, 269.09, 1599017257, 0, 0, 30, 100, 28, 9, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, '-', 'Jefferson', 40000, 1, 1, 0, 1, 2250.13, -1280.06, 25.4766, 180.504, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 'Matt_Stanley', 'Jefferson', 21000, 1, 1, 400, 1, 2230.16, -1280.14, 25.6285, 0.67173, 845.89, -2048, 1476.91, 92.6, 1598667472, 24, 70, 0, 0, 0, 0, 0, 0, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, '-', 'Jefferson', 30000, 1, 1, 0, 1, 2207.93, -1280.84, 25.1207, 179.54, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, '-', 'Jefferson', 38000, 1, 1, 0, 1, 2191.63, -1275.62, 25.1562, 178.872, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 'Fariz_Riger', 'Jefferson', 18000, 1, 1, 0, 1, 2150.22, -1285.08, 24.5269, 178.538, 845.89, -2048, 1476.91, 92.6, 1599299169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 'Fadil_Khan', 'Jefferson', 35000, 1, 1, 0, 1, 2132.29, -1280.07, 25.8906, 178.872, 338.29, 1794.87, 1002.17, 269.09, 1598523005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, 'Tobio_Kageyama', 'Jefferson', 24000, 1, 0, 0, 1, 2111.24, -1279.01, 25.8359, 179.875, 845.89, -2048, 1476.91, 92.6, 1598781577, 0, 0, 24, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, 'Hanz_Walker', 'Jefferson', 32000, 1, 1, 32300, 1, 2091.11, -1277.87, 26.1797, 176.532, 338.29, 1794.87, 1002.17, 269.09, 1598185053, 5, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(72, 'Tony_Cipria', 'Jefferson', 17500, 1, 0, 0, 1, 2090.73, -1235.17, 26.0191, 358.351, 338.29, 1794.87, 1002.17, 269.09, 1598617797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(73, 'Waluyo_Setyo', 'Jefferson', 33500, 1, 0, 0, 1, 2110.97, -1244.36, 25.8516, 0.356081, 337.61, 1854.1, 1002.08, 265.14, 1598766043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 'Sizuma_Yamaguchi', 'Jefferson', 15000, 1, 0, 3000, 1, 2133.46, -1232.81, 24.4219, 3.23307, 337.61, 1854.1, 1002.08, 265.14, 1599211254, 9, 2, 41, 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 'Jordan_Stone', 'Jefferson', 29000, 1, 0, 0, 1, 2153.84, -1243.65, 25.3672, 359.899, 845.89, -2048, 1476.91, 92.6, 1598103888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 'Fadil_Gilatar', 'Jefferson', 19000, 1, 1, 0, 1, 2191.82, -1239.23, 24.4879, 2.51412, 338.29, 1794.87, 1002.17, 269.09, 1598928878, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 'Rasya_Aprilisansyah', 'Jefferson', 20000, 1, 1, 8449, 1, 2209.82, -1240.23, 24.4801, 359.354, 338.29, 1794.87, 1002.17, 269.09, 1598883770, 5, 1, 24, 3551, 0, 0, 4, 1, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, '-', 'Jefferson', 32700, 1, 1, 0, 1, 2229.62, -1241.58, 25.6562, 359.688, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, '-', 'Jefferson', 34100, 1, 1, 0, 1, 2249.91, -1238.88, 25.8984, 359.688, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, '-', 'Jefferson', 27400, 1, 1, 0, 1, 2091.83, -1184.31, 27.0571, 181.012, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 'Fatih_Ikal', 'Jefferson', 29500, 1, 0, 10000, 1, 2092.2, -1166.59, 26.5859, 90.7712, 845.89, -2048, 1476.91, 92.6, 1599160317, 0, 0, 0, 0, 9, 10, 15, 2, 25, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 'Lucas_Harrison', 'Jefferson', 24700, 1, 0, 0, 1, 2095.22, -1145.17, 26.5929, 96.862, 845.89, -2048, 1476.91, 92.6, 1598454287, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, '-', 'Las Colinas', 21500, 1, 1, 0, 1, 2094.1, -1122.7, 27.6899, 180.344, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(84, 'Nabil_Mudzaki', 'Glen Park', 24000, 1, 1, 0, 1, 2045.46, -1116.61, 26.3617, 1.45455, 338.29, 1794.87, 1002.17, 269.09, 1598326915, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(85, 'Stev_Cris', 'Glen Park', 20000, 1, 1, 8000, 1, 2022.82, -1120.3, 26.421, 178.968, 845.89, -2048, 1476.91, 92.6, 1598660172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, 'Gio_Mahendra', 'Glen Park', 28000, 1, 1, 5000, 1, 2000.15, -1114.09, 27.125, 180.305, 337.61, 1854.1, 1002.08, 265.14, 1599384205, 24, 30, 22, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, 'Hanshel_Charles', 'Glen Park', 20000, 1, 1, 26, 1, 1955.14, -1115.34, 27.8305, 269.208, 337.61, 1854.1, 1002.08, 265.14, 1599293968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(88, 'Erick_Kennedy', 'Glen Park', 22000, 1, 0, 29500, 1, 1939.12, -1114.51, 27.4523, 180.303, 845.89, -2048, 1476.91, 92.6, 1598151298, 24, 1690, 41, 10800, 0, 0, 0, 0, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(89, 'Rizal_Khamsey', 'Glen Park', 18000, 1, 1, 2000, 1, 1921.33, -1115.12, 27.0883, 269.837, 338.29, 1794.87, 1002.17, 269.09, 1598253139, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90, 'Arex_Gened', 'Glen Park', 22300, 1, 0, 9000, 1, 1906.01, -1112.94, 26.6641, 180.923, 337.61, 1854.1, 1002.08, 265.14, 1598103444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91, '-', 'Glen Park', 21700, 1, 1, 0, 1, 1885.91, -1113.55, 26.2758, 273.18, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, '-', 'Las Colinas', 23000, 1, 1, 0, 1, 2023.09, -1052.88, 25.5961, 241.738, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93, 'Claymore_Morrow', 'Las Colinas', 18500, 1, 0, 0, 1, 2035.89, -1059.21, 25.6508, 242.741, 845.89, -2048, 1476.91, 92.6, 1598947525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 'Bondan_Aji', 'Las Colinas', 18500, 1, 1, 0, 1, 2050.77, -1065.68, 25.7836, 245.749, 337.61, 1854.1, 1002.08, 265.14, 1598852715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95, '-', 'Las Colinas', 42500, 2, 1, 0, 1, 2061.07, -1075.37, 25.6727, 155.174, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96, '-', 'Las Colinas', 28700, 1, 1, 0, 1, 2091.66, -1068.25, 28.0737, 321.92, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, '-', 'Las Colinas', 38000, 2, 1, 0, 1, 2108.73, -1082.26, 25.4763, 320.281, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 'Paijo_Sugianto', 'Las Colinas', 17000, 1, 0, 8000, 1, 2083.11, -1039.73, 32.188, 145.147, 845.89, -2048, 1476.91, 92.6, 1598425977, 0, 0, 0, 0, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 'Michael_Jhonson', 'Las Colinas', 15000, 1, 0, 0, 1, 2093.78, -1047.38, 30.0619, 148.155, 338.29, 1794.87, 1002.17, 269.09, 1598359245, 15, 1, 24, 69, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 'Farhan_Galang', 'Las Colinas', 15000, 1, 0, 0, 1, 2099.83, -1051.79, 28.7808, 139.131, 338.29, 1794.87, 1002.17, 269.09, 1598090437, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, 'Supri_Yadi', 'Las Colinas', 24000, 1, 0, 0, 1, 2105.57, -1056.16, 27.1315, 139.131, 845.89, -2048, 1476.91, 92.6, 1598451854, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, 'Trippier_Rutherford', 'Las Colinas', 26000, 1, 0, 0, 1, 2157.16, -1072.34, 40.4708, 57.5408, 845.89, -2048, 1476.91, 92.6, 1598545571, 24, 70, 24, 34, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, '-', 'Las Colinas', 75000, 2, 1, 0, 1, 2145.21, -1084.67, 25.0121, 152.795, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(104, '-', 'Las Colinas', 100000, 1, 1, 0, 1, 2207.48, -1100.46, 31.5547, 214.454, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, '-', 'Las Colinas', 40000, 1, 1, 0, 1, 2000.24, -991.647, 32.1314, 219.202, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(106, '-', 'Las Colinas', 32000, 1, 1, 0, 1, 2015.44, -977.658, 36.9531, 206.836, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, '-', 'Las Colinas', 75000, 2, 1, 0, 1, 2045.16, -965.911, 44.5338, 93.1655, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, '-', 'Las Colinas', 45000, 1, 1, 0, 1, 2044.59, -991.32, 43.2091, 6.9354, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, '-', 'Las Colinas', 33000, 1, 1, 0, 1, 2049.01, -987.256, 44.9566, 358.914, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, '-', 'Las Colinas', 50000, 2, 1, 0, 1, 2051.24, -954.814, 48.0333, 91.1995, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, 'Moch_Gilang', 'Las Colinas', 21000, 1, 1, 0, 1, 2066.12, -993.16, 48.7995, 343.668, 845.89, -2048, 1476.91, 92.6, 1599138023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, '-', 'Las Colinas', 28000, 1, 1, 0, 1, 2073.51, -965.209, 49.3664, 167.492, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, '-', 'Las Colinas', 25000, 1, 1, 0, 1, 2089.44, -996.198, 53.0547, 340.994, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, 'Rey_Naga', 'Las Colinas', 18500, 1, 1, 0, 1, 2090.75, -972.317, 51.8782, 214.323, 845.89, -2048, 1476.91, 92.6, 1599074278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, 'Dava_Mardina', 'Las Colinas', 21500, 1, 0, 0, 1, 2108.99, -1000.79, 60.5078, 342.063, 337.61, 1854.1, 1002.08, 265.14, 1598777472, 1, 2, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 'Tata_Pradita', 'Las Colinas', 17000, 1, 0, 0, 1, 2139.9, -1008.42, 61.9434, 342.771, 337.61, 1854.1, 1002.08, 265.14, 1599273086, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(117, 'Kiyho_Hito', 'Las Colinas', 28300, 1, 0, 5000, 1, 2186.35, -997.319, 66.4688, 166.261, 338.29, 1794.87, 1002.17, 269.09, 1599210326, 6, 2, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(118, 'Deniel_Santana', 'Las Colinas', 15000, 1, 1, 0, 1, 2208.06, -1026.55, 61.3266, 331.964, 845.89, -2048, 1476.91, 92.6, 1598618135, 9, 1, 9, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(119, '-', 'Las Colinas', 33200, 1, 1, 0, 1, 2218.88, -1031.75, 60.2402, 325.614, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, '-', 'Las Colinas', 26000, 1, 1, 0, 1, 2249.38, -1060.33, 55.9688, 312.253, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(121, '-', 'Las Colinas', 140500, 3, 1, 0, 1, 2259.41, -1019.16, 59.2968, 228.697, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(122, '-', 'Las Colinas', 150000, 3, 1, 0, 1, 2288.19, -1104.67, 38.5743, 169.767, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(123, 'Trudo_Cleary', 'Las Colinas', 15000, 1, 0, 0, 1, 2287.43, -1080.98, 48.2225, 338.256, 337.61, 1854.1, 1002.08, 265.14, 1598423002, 1, 1, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(124, 'Mark_Andersson', 'Las Colinas', 15000, 1, 1, 0, 1, 2278.81, -1077.42, 48.2168, 333.242, 338.29, 1794.87, 1002.17, 269.09, 1598505680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(125, 'Julian_Wicaksono', 'Las Colinas', 16000, 1, 0, 0, 1, 2439.97, -1010.98, 54.3438, 278.844, 338.29, 1794.87, 1002.17, 269.09, 1598100326, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 'Ahmad_Gazali', 'Las Colinas', 17000, 1, 1, 0, 1, 2440.51, -1057.32, 54.7387, 359.728, 845.89, -2048, 1476.91, 92.6, 1599347764, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 'Raff_Muhamad', 'Las Colinas', 17000, 1, 0, 27000, 1, 2462.43, -1011.13, 60.1137, 177.293, 845.89, -2048, 1476.91, 92.6, 1597623742, 25, 50, 30, 100, 28, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(128, 'Purz_Walker', 'Las Colinas', 17000, 1, 0, 0, 1, 2457.74, -1054.66, 59.9592, 82.7077, 337.61, 1854.1, 1002.08, 265.14, 1597811118, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 'Paul_Kent', 'Las Colinas', 15000, 1, 0, 0, 1, 2491.4, -1012.2, 65.3984, 61.348, 845.89, -2048, 1476.91, 92.6, 1598874013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(130, 'Hafizh_Wybert', 'Las Colinas', 16000, 1, 0, 54000, 1, 2479.68, -1063.89, 66.9982, 74.0486, 337.61, 1854.1, 1002.08, 265.14, 1597459950, 24, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(131, 'Claude_Smith', 'Las Colinas', 16000, 1, 0, 40000, 1, 2499.74, -1065.63, 70.2359, 90.0915, 845.89, -2048, 1476.91, 92.6, 1597835877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 'Angga_Fachriza', 'Las Colinas', 16000, 1, 1, 0, 1, 2512.81, -1027.18, 70.0859, 182.003, 845.89, -2048, 1476.91, 92.6, 1598895562, 25, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(133, 'Arya_Dharma', 'Las Colinas', 16000, 1, 1, 0, 1, 2526.11, -1060.77, 69.9708, 272.586, 338.29, 1794.87, 1002.17, 269.09, 1597922103, 4, 1, 22, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 'Fadhlur_Rohman', 'Las Colinas', 17000, 1, 0, 23870, 1, 2534.44, -1063.33, 69.5655, 87.3859, 337.61, 1854.1, 1002.08, 265.14, 1597849661, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 'Sam_Rebecca', 'Las Colinas', 16000, 1, 1, 0, 1, 2526.89, -1033.54, 69.5794, 182.64, 337.61, 1854.1, 1002.08, 265.14, 1597898146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(136, 'Ilham_Ardian', 'Las Colinas', 17000, 1, 1, 2350, 1, 2549.22, -1032.32, 69.5789, 273.884, 337.61, 1854.1, 1002.08, 265.14, 1599010243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 'Ridho_Smith', 'Las Colinas', 16000, 1, 0, 0, 1, 2562.07, -1034.39, 69.8692, 83.6701, 338.29, 1794.87, 1002.17, 269.09, 1598616000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(138, 'Kenshi_Renka', 'Las Colinas', 17500, 1, 1, 0, 1, 2579.71, -1033.22, 69.5798, 176.919, 337.61, 1854.1, 1002.08, 265.14, 1597923086, 41, 900, 24, 412, 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(139, '-', 'Las Colinas', 27500, 1, 1, 0, 1, 2628.12, -1067.95, 69.7156, 269.452, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(140, '-', 'Las Colinas', 27500, 1, 1, 0, 1, 2627.67, -1085.18, 69.7156, 270.455, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(141, '-', 'Las Colinas', 25000, 1, 1, 0, 1, 2625.96, -1098.79, 69.3547, 269.452, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 'Nurul_Anam', 'Las Colinas', 25000, 1, 0, 0, 1, 2625.96, -1112.53, 67.9953, 269.118, 338.29, 1794.87, 1002.17, 269.09, 1598422566, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 'Marco_Jason', 'Las Colinas', 22000, 1, 1, 6600, 1, 2576.65, -1070.71, 69.8322, 89.5247, 338.29, 1794.87, 1002.17, 269.09, 1599226226, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(144, '-', 'Las Colinas', 28500, 1, 1, 0, 1, 2572.34, -1091.78, 67.2257, 45.407, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 'Sendi_Buckman', 'Las Colinas', 25000, 1, 0, 2000, 1, 2519.06, -1113.02, 56.5926, 271.919, 337.61, 1854.1, 1002.08, 265.14, 1598621681, 5, 1, 24, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(146, 'Trevor_Walker', 'Las Colinas', 20000, 1, 1, 0, 1, 2470.65, -1105.31, 44.4879, 0.690405, 845.89, -2048, 1476.91, 92.6, 1598104277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(147, 'Gilang_Gunadarma', 'Las Colinas', 26800, 1, 1, 800, 1, 2457.05, -1102.48, 43.8672, 359.688, 337.61, 1854.1, 1002.08, 265.14, 1598876260, 9, 1, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, 'Bara_Athaya', 'Las Colinas', 20500, 1, 1, 196, 1, 2438.58, -1105.77, 43.0816, 2.69573, 338.29, 1794.87, 1002.17, 269.09, 1599254012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(149, '-', 'Las Colinas', 37000, 1, 1, 0, 1, 2407.85, -1106.95, 40.2957, 356.68, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(150, '-', 'East Los Santos', 30000, 1, 1, 0, 1, 2374.04, -1138.96, 29.0588, 178.739, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151, '-', 'Las Colinas', 35000, 1, 1, 0, 1, 2394.9, -1133.58, 30.7188, 180.474, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(152, 'Mike_Delwyn', 'East Los Santos', 22000, 1, 0, 0, 1, 2427.44, -1135.8, 34.7109, 179.805, 845.89, -2048, 1476.91, 92.6, 1598498787, 0, 0, 9, 1, 15, 1, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(153, 'Hans_Escobar', 'East Los Santos', 18000, 1, 1, 0, 1, 2487.97, -1135.25, 39.5859, 179.623, 337.61, 1854.1, 1002.08, 265.14, 1599234853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(154, 'Ucok_Susanto', 'Las Colinas', 21000, 1, 0, 0, 1, 2510.56, -1132.7, 41.6207, 90.0505, 337.61, 1854.1, 1002.08, 265.14, 1598265443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(155, '-', 'East Los Santos', 27700, 1, 1, 0, 1, 2383.53, -1366.29, 24.4914, 91.3709, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(156, 'Iqlil_Fuadi', 'East Los Santos', 24500, 1, 0, 2500, 1, 2389.72, -1346.18, 25.077, 90.3133, 845.89, -2048, 1476.91, 92.6, 1599236338, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(157, 'Irhaz_Urizen', 'East Los Santos', 22000, 1, 0, 12000, 1, 2387.84, -1328.34, 25.1242, 90.3133, 337.61, 1854.1, 1002.08, 265.14, 1599239373, 28, 157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(158, 'Annie_Elizabert', 'East Los Santos', 25000, 1, 0, 0, 1, 2388.37, -1279.66, 25.1291, 89.5645, 845.89, -2048, 1476.91, 92.6, 1599238467, 25, 200, 0, 0, 23, 200, 25, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(159, 'Zain_Alfalah', 'East Los Santos', 17500, 1, 0, 13700, 1, 2433.61, -1275.09, 24.7567, 272.821, 338.29, 1794.87, 1002.17, 269.09, 1597736154, 0, 0, 0, 0, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(160, 'Mirza_Alhakim', 'East Los Santos', 17000, 1, 0, 0, 1, 2434.84, -1289.4, 25.3479, 273.824, 338.29, 1794.87, 1002.17, 269.09, 1597843484, 9, 1, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, '-', 'East Los Santos', 41000, 2, 1, 0, 1, 2433.97, -1303.37, 25.3234, 270.147, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(162, '-', 'East Los Santos', 42000, 2, 1, 0, 1, 2433.96, -1320.63, 25.3234, 271.15, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 'Drax_Kennedy', 'East Los Santos', 20000, 1, 0, 0, 1, 2439.63, -1338.77, 24.1016, 267.808, 845.89, -2048, 1476.91, 92.6, 1599239655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(164, '-', 'East Los Santos', 20000, 1, 1, 0, 1, 2439.61, -1357.25, 24.1009, 268.142, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, '-', 'East Los Santos', 43000, 1, 1, 0, 1, 2470.35, -1295.47, 30.2332, 88.3288, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, '-', 'East Los Santos', 43000, 1, 1, 0, 1, 2469.17, -1278.46, 30.3664, 91.6711, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(167, '-', 'East Los Santos', 27000, 1, 1, 0, 1, 2472.94, -1238.13, 32.5695, 179.185, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(168, '-', 'East Los Santos', 27000, 1, 1, 0, 1, 2492.22, -1239.06, 37.9054, 179.519, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, '-', 'East Los Santos', 87000, 2, 1, 0, 1, 2514.57, -1240.47, 39.3406, 177.514, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(170, '-', 'East Los Santos', 53000, 2, 1, 0, 1, 2529.63, -1243.36, 43.9719, 180.972, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(171, '-', 'East Los Santos', 32000, 1, 1, 0, 1, 2551.04, -1233.81, 49.3318, 178.298, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(172, 'Amur_Tigro', 'East Los Santos', 74000, 2, 1, 280000, 1, 2550.21, -1197.48, 60.8397, 358.424, 338.78, 1734.95, 1002.08, 268.46, 1598952544, 24, 201, 0, 0, 25, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, '-', 'East Los Santos', 78000, 2, 1, 0, 1, 2520.65, -1197.98, 56.5974, 358.09, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(174, '-', 'East Los Santos', 28300, 1, 1, 0, 1, 2467.59, -1200.4, 36.8117, 0.094871, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, '-', 'East Beach', 82000, 2, 1, 0, 1, 2756.3, -1182.79, 69.4034, 359.98, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, '-', 'East Beach', 55000, 2, 1, 0, 1, 2750.37, -1205.66, 67.4844, 90.9724, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, '-', 'East Beach', 55000, 2, 1, 0, 1, 2750.35, -1222.14, 64.6016, 90.9056, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178, '-', 'East Beach', 50000, 2, 1, 0, 1, 2750.37, -1238.65, 61.5245, 91.692, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 'Selvia_Maranzano', 'East Beach', 150000, 3, 0, 0, 1, 2851.85, -1365.96, 14.1708, 88.2285, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(180, '-', 'East Beach', 73000, 2, 1, 0, 1, 2842.17, -1334.8, 14.7421, 187.993, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181, '-', 'East Beach', 71000, 2, 1, 0, 1, 2847.01, -1309.7, 14.7046, 274.691, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 'Evan_Setiawan', 'East Beach', 60000, 2, 0, 0, 1, 2808.23, -1175.94, 25.3751, 182.417, 351.59, 1669.31, 1002.17, 176.03, 1599359604, 0, 0, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(183, 'Dana_Aqli', 'East Beach', 60000, 2, 0, 13000, 1, 2807.99, -1190.87, 25.3435, 0.59807, 736.03, 1672.08, 501.08, 356.23, 1599359618, 15, 1, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 'Taymore_Mchon', 'Willowfield', 20000, 1, 0, 0, 1, 2437.9, -2020.83, 13.9025, 355.38, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 41, 800, 41, 600, 46, 1, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 'Vinzel_Pradana', 'Willowfield', 21500, 1, 1, 0, 1, 2465.31, -2020.78, 14.1242, 359.39, 338.29, 1794.87, 1002.17, 269.09, 1599129610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(186, 'Drax_Vazcez', 'Willowfield', 21000, 1, 1, 0, 1, 2465.04, -1995.78, 14.0193, 175.861, 338.29, 1794.87, 1002.17, 269.09, 1598688273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(187, '-', 'Willowfield', 25000, 1, 1, 0, 1, 2483.49, -1995.37, 13.8343, 179.872, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(188, 'Bruce_Lawrence', 'Willowfield', 23000, 1, 0, 6000, 1, 2486.43, -2021.52, 13.9988, 358.388, 337.61, 1854.1, 1002.08, 265.14, 1598793877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(189, '-', 'Willowfield', 20000, 1, 1, 0, 1, 2507.93, -2021.02, 14.2101, 359.724, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(190, 'Luke_Mclowwel', 'Willowfield', 19000, 1, 0, 0, 1, 2508.4, -1998.48, 13.9025, 186.594, 338.29, 1794.87, 1002.17, 269.09, 1598278736, 25, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(191, 'Jack_Wilson', 'Willowfield', 23500, 1, 0, 0, 1, 2522.73, -2018.99, 14.0744, 44.5106, 337.61, 1854.1, 1002.08, 265.14, 1599287659, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(192, '-', 'Willowfield', 25000, 1, 1, 0, 1, 2524.27, -1998.41, 14.1131, 133.08, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(193, '-', 'Willowfield', 25500, 1, 1, 0, 1, 2696.3, -1990.4, 14.2229, 177.369, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(194, 'Valen_Rick', 'Willowfield', 26000, 1, 0, 0, 1, 2695.46, -2020.46, 14.0223, 358.498, 337.61, 1854.1, 1002.08, 265.14, 1597706810, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(195, '-', 'Willowfield', 21500, 1, 1, 0, 1, 2673.42, -2020.21, 14.1682, 3.51146, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(196, 'Shelby_Blevins', 'Willowfield', 22300, 1, 1, 0, 1, 2672.73, -1989.51, 14.324, 178.962, 337.61, 1854.1, 1002.08, 265.14, 1599345812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(197, '-', 'Willowfield', 24300, 1, 1, 0, 1, 2652.74, -1989.58, 13.9988, 180.209, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(198, '-', 'Willowfield', 22000, 1, 1, 0, 1, 2637.16, -1991.62, 14.324, 224.053, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(199, 'Jhon_Walker', 'Willowfield', 23500, 1, 0, 0, 1, 2635.67, -2012.8, 14.1443, 305.338, 338.29, 1794.87, 1002.17, 269.09, 1598423568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, '-', 'Willowfield', 57000, 2, 1, 0, 1, 2650.63, -2021.79, 14.1766, 88.9587, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(201, '-', 'Willowfield', 72000, 2, 1, 0, 1, 2333.5, -1943.37, 14.9688, 180.565, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(202, '-', 'Willowfield', 75000, 2, 1, 0, 1, 2333.28, -1883.55, 15, 359.79, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203, '-', 'Willowfield', 45000, 1, 1, 0, 1, 2296.56, -1882.04, 14.2344, 180.31, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204, '-', 'Willowfield', 45000, 1, 1, 0, 1, 2269.24, -1882.03, 14.2344, 176.3, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(205, '-', 'Willowfield', 45000, 1, 1, 0, 1, 2241.88, -1882.04, 14.2344, 177.637, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(206, '-', 'Willowfield', 75000, 2, 1, 0, 1, 2284.66, -1906.58, 14.9297, 356.487, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(207, '-', 'Willowfield', 75000, 2, 1, 0, 1, 2261.39, -1906.63, 14.9375, 3.17139, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(208, '-', 'Willowfield', 75000, 2, 1, 0, 1, 2238.17, -1906.8, 14.9375, 358.158, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(209, '-', 'El Corona', 27500, 1, 1, 0, 1, 1928.58, -1915.95, 15.2568, 179.022, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(210, '-', 'El Corona', 25000, 1, 1, 0, 1, 1913.44, -1911.93, 15.2568, 181.362, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, '-', 'El Corona', 25000, 1, 1, 0, 1, 1891.86, -1914.41, 15.2568, 177.017, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 'Kibo_Lasmari', 'El Corona', 27000, 1, 1, 0, 1, 1872.25, -1911.95, 15.2568, 179.586, 338.29, 1794.87, 1002.17, 269.09, 1599111696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(213, '-', 'El Corona', 50000, 1, 1, 0, 1, 1895.5, -2068.91, 15.6689, 1.35321, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(214, '-', 'El Corona', 45000, 1, 1, 0, 1, 1873.59, -2070.69, 15.4971, 1.68911, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(215, '-', 'El Corona', 45000, 1, 1, 0, 1, 1851.83, -2070.41, 15.4812, 359.621, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(216, '-', 'El Corona', 35000, 1, 1, 0, 1, 1894.29, -2133.27, 15.4663, 176.276, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(217, '-', 'El Corona', 35000, 1, 1, 0, 1, 1872.55, -2132.96, 15.482, 182.416, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(218, '-', 'El Corona', 35000, 1, 1, 0, 1, 1851.89, -2134.85, 15.3882, 179.618, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 'Ishigami_Ryu', 'El Corona', 43000, 1, 1, 1500, 1, 1804.34, -2124.83, 13.9424, 0.95736, 338.29, 1794.87, 1002.17, 269.09, 1598199310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(220, '-', 'El Corona', 24000, 1, 1, 0, 1, 1801.96, -2098.97, 14.021, 180.152, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(221, '-', 'El Corona', 26500, 1, 1, 0, 1, 1781.45, -2101.3, 14.0566, 181.15, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(222, '-', 'El Corona', 43500, 1, 1, 0, 1, 1782.21, -2126.48, 14.0679, 358.629, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(223, '-', 'El Corona', 45000, 1, 1, 0, 1, 1761.07, -2125.41, 14.0566, 356.623, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(224, '-', 'El Corona', 44000, 1, 1, 0, 1, 1762.46, -2102.02, 13.857, 181.823, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(225, '-', 'El Corona', 41000, 1, 1, 0, 1, 1734.02, -2098, 14.0366, 180.152, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(226, 'Andi_Abimanyu', 'El Corona', 42000, 1, 1, 0, 1, 1734.84, -2130.33, 14.021, 357.96, 338.29, 1794.87, 1002.17, 269.09, 1598221245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(227, '-', 'El Corona', 44000, 1, 1, 0, 1, 1715.2, -2125.41, 14.0566, 2.34435, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(228, '-', 'El Corona', 42000, 1, 1, 0, 1, 1711.61, -2101.27, 14.021, 183.2, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(229, 'Sammy_Raymond', 'Verdant Bluffs', 48500, 1, 0, 0, 1, 1684.7, -2098.16, 13.8343, 179.931, 338.29, 1794.87, 1002.17, 269.09, 1597328868, 24, 368, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(230, '-', 'El Corona', 41500, 1, 1, 0, 1, 1695.49, -2125.82, 13.8101, 0.712442, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(231, '-', 'Verdant Bluffs', 45000, 1, 1, 0, 1, 1667.42, -2106.98, 14.0723, 178.933, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(232, '-', 'Verdant Bluffs', 45000, 1, 1, 0, 1, 1673.73, -2122.38, 14.146, 315.265, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(233, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 992.632, -1817.57, 13.9001, 344.26, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(234, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 980.751, -1814.72, 13.8939, 338.244, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(235, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 969.757, -1812, 13.8904, 343.258, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(236, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 958.021, -1809.16, 13.8812, 348.42, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(237, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 933.629, -1805.17, 13.8435, 351.279, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(238, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 922.086, -1803.86, 13.8357, 351.279, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(239, '-', 'Verona Beach', 55000, 1, 1, 0, 1, 910.428, -1802.67, 13.7994, 354.621, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(240, 'Vladimir_Lenin', 'Santa Maria Beach', 135000, 3, 1, 2000, 1, 315.879, -1769.45, 4.62318, 176.075, 4577.82, -2527.82, 5.28, 262.63, 1598854448, 0, 0, 30, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(241, 'Vladimir_Lenin', 'Santa Maria Beach', 22000, 1, 1, 0, 1, 305.421, -1770.25, 4.53847, 178.414, 338.29, 1794.87, 1002.17, 269.09, 1610552134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(242, 'Joseph_Arcel', 'Santa Maria Beach', 23000, 1, 1, 0, 1, 295.397, -1764.44, 4.59919, 180.082, 845.89, -2048, 1476.91, 92.6, 1598329927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(243, '-', 'Santa Maria Beach', 50000, 1, 1, 0, 1, 280.982, -1767.08, 4.54688, 176.409, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(244, 'Antonio_Carvajal', 'Santa Maria Beach', 60000, 2, 0, 0, 1, 168.33, -1768.43, 4.48681, 180.42, 338.78, 1734.95, 1002.08, 268.46, 1597907680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(245, 'Garix_Rai', 'Marina', 24000, 1, 1, 0, 1, 653.551, -1714.06, 14.7648, 89.7202, 337.61, 1854.1, 1002.08, 265.14, 1597823221, 9, 1, 24, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(246, 'Haraqa_Caturprasetya', 'Marina', 21000, 1, 1, 0, 1, 652.635, -1693.98, 14.5453, 88.3833, 845.89, -2048, 1476.91, 92.6, 1599031958, 1, 1, 0, 0, 0, 0, 0, 0, 22, 333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(247, 'Sayn_Washington', 'Marina', 25000, 1, 0, 0, 1, 657.192, -1652.61, 15.4062, 88.7175, 338.29, 1794.87, 1002.17, 269.09, 1597742758, 0, 0, 9, 2, 7, 202, 46, 1, 41, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(248, 'Fadhil_Revi', 'Marina', 20500, 1, 0, 0, 1, 656.085, -1636.05, 15.8617, 177.051, 845.89, -2048, 1476.91, 92.6, 1597923622, 0, 0, 6, 1, 24, 35, 9, 1, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(249, 'Alexsander_Zhestokov', 'Marina', 24500, 1, 1, 1, 1, 653.224, -1619.7, 15, 85.3751, 845.89, -2048, 1476.91, 92.6, 1599152632, 24, 400, 29, 600, 25, 400, 25, 197, 24, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(250, 'Made_Vandelion', 'Marina', 150000, 3, 1, 0, 1, 648.818, -1536.84, 14.9417, 88.35, 1224.34, -749.22, 1085.72, 265.59, 1610542018, 30, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(251, '-', 'Marina', 150000, 3, 1, 0, 1, 648.844, -1489.56, 14.8413, 86.8238, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(252, '-', 'Marina', 75000, 2, 1, 0, 1, 648.732, -1442.32, 14.6882, 90.0032, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(253, '-', 'Marina', 120000, 3, 1, 0, 1, 685.556, -1421.88, 14.7687, 359.284, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(254, 'Justin_Stefano', 'Marina', 48000, 1, 1, 8000, 1, 784.408, -1436.24, 13.5469, 273.288, 845.89, -2048, 1476.91, 92.6, 1597226136, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(255, '-', 'Marina', 128000, 3, 1, 0, 1, 782.824, -1464.5, 13.5469, 268.52, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(256, '-', 'Marina', 123000, 3, 1, 0, 1, 771.13, -1510.77, 13.5469, 252.143, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(257, '-', 'Marina', 84000, 2, 1, 0, 1, 761.079, -1564.08, 13.9289, 265.178, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(258, '-', 'Marina', 95000, 2, 1, 0, 1, 813.662, -1456.71, 14.216, 84.3615, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(259, '-', 'Marina', 200000, 3, 1, 0, 1, 841.273, -1471.38, 14.3027, 179.282, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(260, 'Joey_Joestar', 'Marina', 82000, 2, 0, 0, 1, 900.238, -1471.09, 14.348, 266.141, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(261, 'Jonatan_Marcell', 'Marina', 82000, 2, 0, 500000, 1, 900.371, -1447.51, 14.3685, 271.355, 351.59, 1669.31, 1002.17, 176.03, 1598504084, 6, 3, 6, 1, 6, 1, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `houses` (`ID`, `owner`, `address`, `price`, `type`, `locked`, `money`, `houseint`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `visit`, `houseWeapon1`, `houseAmmo1`, `houseWeapon2`, `houseAmmo2`, `houseWeapon3`, `houseAmmo3`, `houseWeapon4`, `houseAmmo4`, `houseWeapon5`, `houseAmmo5`, `houseWeapon6`, `houseAmmo6`, `houseWeapon7`, `houseAmmo7`, `houseWeapon8`, `houseAmmo8`, `houseWeapon9`, `houseAmmo9`, `houseWeapon10`, `houseAmmo10`) VALUES
(262, 'Rio_Saputra', 'Marina', 84000, 2, 0, 1000, 1, 903.423, -1512.93, 14.3635, 268.107, 338.78, 1734.95, 1002.08, 268.46, 1597561181, 15, 1, 1, 1, 15, 1, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(263, '-', 'Marina', 84000, 2, 1, 0, 1, 877.93, -1514.66, 14.3437, 180.913, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(264, 'Jack_Hamilton', 'Marina', 93000, 2, 0, 0, 1, 849.608, -1520.02, 14.3479, 265.473, 351.59, 1669.31, 1002.17, 176.03, 1599272604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(265, '-', 'Marina', 200000, 3, 1, 0, 1, 822.454, -1505.49, 14.3975, 355.379, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(266, '-', 'Marina', 75000, 2, 1, 0, 1, 692.906, -1602.75, 15.0469, 359.857, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(267, 'Sadasi_Brooklyn', 'Marina', 23000, 1, 0, 0, 1, 697.296, -1627.07, 3.74917, 269.617, 845.89, -2048, 1476.91, 92.6, 1599059705, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(268, 'Jimmy_Swan', 'Marina', 25000, 1, 0, 135000, 1, 693.783, -1645.88, 4.09375, 268.614, 337.61, 1854.1, 1002.08, 265.14, 1599210901, 24, 70, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(269, 'Hiroomi_Tosaka', 'Marina', 22000, 1, 0, 10000, 1, 694.7, -1690.71, 4.34612, 3.53402, 845.89, -2048, 1476.91, 92.6, 1599255271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(270, 'Ahmad_Rizki', 'Marina', 23000, 1, 1, 6000, 1, 693.598, -1705.71, 3.81948, 269.951, 845.89, -2048, 1476.91, 92.6, 1597696664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(271, 'Kakang_Kohar', 'Marina', 23000, 1, 0, 6732, 1, 769.205, -1745.9, 13.0773, 91.7695, 845.89, -2048, 1476.91, 92.6, 1598517067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(272, 'Dwi_Huda', 'Marina', 20000, 1, 0, 0, 1, 769.15, -1726.26, 13.4321, 177.331, 845.89, -2048, 1476.91, 92.6, 1598685402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(273, 'Jupri_Maulana', 'Marina', 22500, 1, 0, 0, 1, 769.177, -1696.65, 5.15542, 93.4407, 337.61, 1854.1, 1002.08, 265.14, 1598243067, 1, 1, 9, 1, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(274, 'Benny_Corleone', 'Marina', 25800, 1, 0, 12600, 1, 768.053, -1655.67, 5.60938, 87.759, 338.29, 1794.87, 1002.17, 269.09, 1598164335, 0, 0, 24, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(275, 'Brian_Clark', 'Marina', 24000, 1, 0, 1, 1, 766.909, -1605.86, 13.8039, 91.8996, 845.89, -2048, 1476.91, 92.6, 1599295492, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(276, 'Nandito_Uesugi', 'Marina', 22000, 1, 1, 0, 1, 790.839, -1661.16, 13.4842, 181.277, 338.29, 1794.87, 1002.17, 269.09, 1597880761, 25, 160, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(277, 'Ray_Culture', 'Marina', 20000, 1, 0, 10500, 1, 794.914, -1692.08, 14.4633, 357.547, 338.29, 1794.87, 1002.17, 269.09, 1598060762, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(278, '-', 'Marina', 22500, 1, 1, 0, 1, 794.048, -1707.5, 14.0382, 270.983, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(279, 'Aldo_Bareto', 'Marina', 23400, 1, 0, 0, 1, 797.445, -1729.28, 13.5469, 270.236, 845.89, -2048, 1476.91, 92.6, 1598453083, 24, 70, 9, 1, 5, 1, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(280, 'Genji_Douglas', 'Marina', 25000, 2, 0, 0, 1, 791.539, -1753.23, 13.4601, 181.037, 736.03, 1672.08, 501.08, 356.23, 1598444302, 25, 45, 24, 69, 4, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(281, '-', 'Temple', 150000, 3, 1, 0, 1, 1326.28, -1090.84, 27.9766, 270.013, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(282, '-', 'Temple', 150300, 3, 1, 0, 1, 1325.97, -1067.77, 31.5547, 268.007, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(283, '-', 'Temple', 150300, 3, 1, 0, 1, 1285.25, -1067.25, 31.6789, 88.2737, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(284, '-', 'Temple', 150000, 3, 1, 0, 1, 1285.24, -1090.22, 28.2578, 91.2818, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(285, '-', 'Temple', 150300, 3, 1, 0, 1, 1241.96, -1076.57, 31.5547, 268.087, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(286, '-', 'Temple', 149000, 3, 1, 0, 1, 1242.29, -1099.5, 27.9766, 268.421, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(287, '-', 'Temple', 150300, 3, 1, 0, 1, 1183.46, -1075.97, 31.6789, 89.2524, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(288, '-', 'Temple', 150000, 3, 1, 0, 1, 1183.46, -1099.03, 28.2578, 91.2579, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(289, '-', 'Temple', 150000, 3, 1, 0, 1, 1142.2, -1092.92, 28.1875, 265.723, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(290, '-', 'Temple', 150300, 3, 1, 0, 1, 1141.84, -1069.88, 31.7656, 271.071, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(291, '-', 'Temple', 150300, 3, 1, 0, 1, 1103.38, -1069.48, 31.8899, 90.7692, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(292, '-', 'Temple', 150000, 3, 1, 0, 1, 1103.38, -1092.32, 28.4688, 90.435, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(293, '-', 'Temple', 75000, 2, 1, 0, 1, 1059.3, -1105.15, 28.0451, 179.98, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(294, '-', 'Temple', 75000, 2, 1, 0, 1, 1068.44, -1081.24, 27.5678, 266.867, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(295, '-', 'Temple', 150000, 3, 1, 0, 1, 1050.98, -1059.26, 34.7966, 358.542, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(296, '-', 'Temple', 150000, 3, 1, 0, 1, 993.836, -1059, 33.6995, 2.74117, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(297, '-', 'Temple', 150000, 3, 1, 0, 1, 1118.14, -1021.21, 34.9922, 180.63, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(298, '-', 'Temple', 150000, 3, 1, 0, 1, 1127.95, -1021.19, 34.9922, 181.298, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(299, '-', 'Temple', 150000, 2, 1, 0, 1, 985.745, -1094.4, 27.6041, 182.543, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(300, '-', 'Marina', 115000, 2, 1, 0, 1, 880.099, -1424.79, 14.4844, 356.771, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(301, '-', 'Marina', 145000, 3, 1, 0, 1, 852.221, -1423.25, 14.1368, 0.780843, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(302, '-', 'Marina', 85000, 2, 1, 0, 1, 824.592, -1424.18, 14.4987, 1.78378, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(303, '-', 'Mulholland', 155000, 3, 1, 0, 1, 1440.68, -926.173, 39.6477, 171.683, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(304, '-', 'Mulholland', 145000, 3, 1, 0, 1, 1411.12, -920.911, 38.4219, 171.014, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(305, '-', 'Mulholland', 50000, 1, 1, 0, 1, 1421.78, -886.19, 50.6848, 358.741, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(306, 'Surya_Kotegawa', 'Mulholland Intersection', 58000, 2, 1, 0, 1, 1468.57, -906.157, 54.8359, 358.084, 736.03, 1672.08, 501.08, 356.23, 1598330355, 24, 70, 0, 0, 0, 0, 5, 1, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(307, 'Adit_Yapratama', 'Mulholland Intersection', 50000, 1, 1, 1000, 1, 1540.36, -851.333, 64.3361, 89.2225, 338.29, 1794.87, 1002.17, 269.09, 1599329651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(308, 'Gennadius_Rostislav', 'Mulholland Intersection', 53000, 1, 1, 4000, 1, 1534.91, -800.269, 72.8495, 90.2119, 338.29, 1794.87, 1002.17, 269.09, 1611541928, 30, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(309, '-', 'Mulholland Intersection', 55000, 1, 1, 0, 1, 1527.72, -772.644, 80.5781, 133.209, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(310, 'Ryan_Kenzi', 'Mulholland', 280000, 3, 1, 0, 1, 1497, -688.014, 95.5633, 181.061, 1263.68, -605.3, 1001.08, 189.5, 1613900034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(311, '-', 'Mulholland', 100000, 3, 1, 0, 1, 1442.58, -628.918, 95.7186, 178.622, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(312, 'Miffat_Ling', 'Mulholland', 250000, 3, 0, 0, 1, 1332.11, -633.416, 109.135, 21.0783, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(313, 'Rilley_Valentine', 'Mulholland', 65000, 2, 1, 0, 1, 1112.52, -742.097, 100.133, 90.9476, 736.03, 1672.08, 501.08, 356.23, 0, 43, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(314, 'Vladimir_Lenin', 'Mulholland', 170000, 3, 1, 0, 1, 1093.98, -807.04, 107.419, 7.83561, 1263.68, -605.3, 1001.08, 189.5, 1610899653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(315, '-', 'Mulholland', 145000, 2, 1, 0, 1, 1034.67, -813.095, 101.852, 19.2663, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(316, '-', 'Mulholland', 55000, 1, 1, 0, 1, 989.817, -828.512, 95.4686, 28.2922, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(317, 'N1kol', 'Mulholland', 74000, 2, 1, 0, 1, 937.758, -848.595, 93.5994, 24.081, 338.78, 1734.95, 1002.08, 268.46, 1597277366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(318, 'Xavier_Rainslav', 'Mulholland', 140000, 3, 0, 1, 1, 836.091, -894.817, 68.7689, 322.407, 4577.82, -2527.82, 5.28, 262.63, 1611309229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(319, 'Johan_Subroto', 'Mulholland', 78000, 2, 1, 2000, 1, 827.912, -858.133, 70.3308, 203.05, 338.78, 1734.95, 1002.08, 268.46, 1598749620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(320, 'Agra_Datama', 'Red County', 180000, 3, 0, 624907, 1, 1095.04, -647.79, 113.648, 0.724695, 1855.38, -1709.12, 1720.06, 273.58, 1599024420, 0, 0, 28, 398, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(321, '-', 'Red County', 160000, 3, 1, 0, 1, 1045.16, -642.816, 120.117, 7.37025, 4577.82, -2527.82, 5.28, 262.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(322, 'Zsolt_Petreny', 'Red County', 185000, 2, 0, 0, 1, 980.461, -677.137, 121.976, 36.448, 351.59, 1669.31, 1002.17, 176.03, 1610297461, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(323, 'Ahmad_Zaidan', 'Red County', 83000, 2, 1, 200000, 1, 946.341, -710.519, 122.62, 27.9853, 351.59, 1669.31, 1002.17, 176.03, 1599200802, 25, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(324, '-', 'Red County', 185000, 3, 1, 0, 1, 897.943, -677.09, 116.89, 234.871, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(325, '-', 'Mulholland', 165000, 2, 1, 0, 1, 867.632, -717.514, 105.68, 334.136, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(326, 'Syaputra_Faiza', 'Mulholland', 93000, 2, 0, 2450000, 1, 848.12, -745.462, 94.9693, 311.201, 338.78, 1734.95, 1002.08, 268.46, 1599047759, 30, 100, 25, 26, 0, 0, 6, 1, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(327, '-', 'Mulholland', 175000, 3, 1, 0, 1, 891.194, -782.999, 101.313, 23.0597, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(328, '-', 'Los Santos', 105000, 3, 1, 0, 1, 977.328, -771.582, 112.203, 359.665, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(329, '-', 'Richman', 185000, 3, 1, 0, 1, 724.849, -999.326, 52.7344, 330.021, 1224.34, -749.22, 1085.72, 265.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(330, '-', 'Richman', 83000, 2, 1, 0, 1, 673.061, -1020.07, 55.7596, 60.3007, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(331, 'Marsya_Swan', 'Richman', 100000, 3, 1, 0, 1, 700.237, -1060.2, 49.4217, 58.2954, 1224.34, -749.22, 1085.72, 265.59, 1599319806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(332, '-', 'Richman', 83000, 2, 1, 0, 1, 648.349, -1058.5, 52.5799, 51.9845, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(333, '-', 'Richman', 77000, 2, 1, 0, 1, 645.833, -1117.58, 44.207, 44.2974, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(334, '-', 'Richman', 65000, 2, 1, 0, 1, 559.058, -1076.44, 72.922, 25.6459, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(335, '-', 'Richman', 100000, 3, 1, 0, 1, 497.566, -1095.06, 82.3592, 355.362, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(336, '-', 'Richman', 93000, 2, 1, 0, 1, 470.751, -1163.57, 67.2178, 193.561, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(337, 'Vin_Jhonson', 'Richman', 68000, 2, 0, 507000, 1, 416.645, -1154.05, 76.6876, 150.618, 338.78, 1734.95, 1002.08, 268.46, 1599046630, 6, 2, 6, 1, 6, 1, 0, 0, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(338, 'Alferdo_Rainslav', 'Richman', 60000, 2, 1, 0, 1, 552.952, -1200.27, 44.8315, 20.196, 351.59, 1669.31, 1002.17, 176.03, 1610704104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339, 'Mohd_Rayyan', 'Richman', 53000, 1, 1, 70, 1, 432.179, -1253.91, 51.5809, 21.3203, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340, 'Kenshi_Renka', 'Richman', 70000, 2, 0, 0, 1, 398.336, -1271.28, 50.0198, 19.8498, 338.78, 1734.95, 1002.08, 268.46, 1599260627, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(341, '-', 'Richman', 52000, 1, 1, 0, 1, 355.141, -1280.95, 53.7036, 33.8057, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(342, '-', 'Richman', 200000, 3, 1, 0, 1, 298.854, -1338.49, 53.4415, 33.3316, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(343, 'Cesar_Vilcenvia', 'Richman', 220000, 3, 0, 0, 1, 254.493, -1367.25, 53.1094, 308.946, 1263.68, -605.3, 1001.08, 189.5, 1610257038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(344, '-', 'Rodeo', 150000, 2, 1, 0, 1, 228, -1405.45, 51.6094, 330.851, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(345, '-', 'Rodeo', 55000, 1, 1, 0, 1, 142.631, -1470.36, 25.2109, 321.023, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(346, 'Alexander_Eastwood', 'Richman', 250000, 3, 0, 153000, 1, 189.646, -1308.25, 70.2495, 90.7347, 1855.38, -1709.12, 1720.06, 273.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(347, 'Diego_Walkerr', 'Richman', 200000, 3, 0, 0, 1, 219.26, -1249.82, 78.3363, 215.102, 4577.82, -2527.82, 5.28, 262.63, 1611352445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(348, 'Diego_Walkerr', 'Richman', 50000, 3, 0, 0, 1, 253.049, -1269.78, 74.3102, 32.0236, 1855.38, -1709.12, 1720.06, 273.58, 1611778178, 24, 159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(349, 'Imanuel_Marpaung', 'Richman', 185000, 3, 1, 0, 1, 251.483, -1220.19, 76.1024, 218.088, 4577.82, -2527.82, 5.28, 262.63, 1610811498, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(350, '-', 'Richman', 999999999, 3, 1, 0, 1, 300.207, -1154.45, 81.3808, 134.008, 1263.68, -605.3, 1001.08, 189.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(351, 'Arjuna_Natra', 'Richman', 25000, 1, 0, 100000, 1, 352.269, -1198, 76.5156, 36.1464, 338.29, 1794.87, 1002.17, 269.09, 1597850032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(352, '-', 'Mulholland', 83000, 2, 1, 0, 1, 785.755, -760.233, 73.5607, 106.712, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(354, 'Jack_Silva', 'Blueberry', 53000, 2, 0, 0, 1, 312.755, -121.294, 3.53539, 269.787, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(355, 'Teuku_Zaheer', 'Pershing Square', 10000, 1, 0, 0, 1, 1489.32, -1719.74, 8.24049, 347.326, 337.61, 1854.1, 1002.08, 265.14, 1612594928, 33, 393, 35, 200, 25, 338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(353, '-', 'Dillimore', 100000, 2, 1, 0, 1, 743.336, -509.472, 18.0129, 181.028, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(356, '-', 'Dillimore', 125000, 2, 1, 0, 1, 768.319, -503.749, 18.0129, 182.825, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(357, '-', 'Dillimore', 125000, 2, 1, 0, 1, 745.161, -556.641, 18.0129, 2.4923, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(358, '-', 'Dillimore', 125000, 2, 1, 0, 1, 766.527, -556.785, 18.0129, 182.31, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(364, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2363.82, 187.232, 28.4416, 270.151, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(360, 'Ray_Alexandrovich', 'Dillimore', 5000, 2, 0, 0, 1, 745.325, -591.205, 18.0129, 273.563, 338.78, 1734.95, 1002.08, 268.46, 1611771825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(361, '-', 'Dillimore', 125000, 2, 1, 0, 1, 818.298, -509.522, 18.0129, 179.606, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(362, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2398.41, 111.468, 28.4416, 179.944, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(363, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2374.12, 71.1895, 28.4416, 93.1818, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(359, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2323.86, 191.182, 28.4416, 268.69, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(365, 'Lucio_Ladanza', 'Dillimore', 125000, 2, 0, 0, 1, 795.152, -506.325, 18.0129, 178.184, 351.59, 1669.31, 1002.17, 176.03, 1614472742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(366, '-', 'Palomino Creek', 90000, 1, 1, 0, 1, 2536.12, 128.867, 27.6835, 188.082, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(367, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2323.92, 162.202, 28.4416, 274.079, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(368, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2363.93, 166.163, 28.4416, 92.6407, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(369, '-', 'Palomino Creek', 100000, 2, 1, 0, 1, 2324.01, 136.418, 28.4416, 90.8661, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(370, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2323.85, 116.213, 28.4416, 270.239, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(371, '-', 'Palomino Creek', 100000, 2, 1, 0, 1, 2363.75, 142.045, 28.4416, 272.057, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(372, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2363.99, 116.168, 28.4416, 274.752, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(373, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2285.91, 161.662, 28.4416, 180.223, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(374, '-', 'Palomino Creek', 105000, 2, 1, 0, 1, 2257.92, 168.322, 28.1536, 181.915, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(375, '-', 'Palomino Creek', 100000, 2, 1, 0, 1, 2236.52, 168.123, 28.1535, 182.981, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(376, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2204.13, 106.175, 28.4416, 271.655, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(377, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2204.05, 62.312, 28.4416, 89.0854, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(378, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2249.27, 111.752, 28.4416, 3.77221, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(379, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2269.55, 111.77, 28.4416, 4.21092, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(380, '-', 'Palomino Creek', 120000, 2, 1, 0, 1, 2413.74, 61.7038, 28.4416, 358.822, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(381, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2443.38, 61.586, 28.4416, 358.696, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(382, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2411.22, 21.7405, 27.6835, 273.155, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(383, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2410.98, -5.55975, 27.6835, 268.142, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(384, '-', 'Palomino Creek', 105000, 2, 1, 0, 1, 2373.91, -8.66132, 28.4416, 274.94, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(385, '-', 'Palomino Creek', 105000, 2, 1, 0, 1, 2374.22, 22.0305, 28.4416, 271.068, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(386, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2374.03, 42.3056, 28.4416, 270.065, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(387, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2270.55, -7.60092, 28.1535, 185.949, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(388, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2199.97, -37.2772, 28.1535, 275.768, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(389, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2392.34, -54.9049, 28.1536, 5.85334, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(390, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2367.32, -48.8767, 28.1535, 10.7907, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(391, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2415.45, -52.1634, 28.1535, 5.74218, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(392, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2438.83, -54.8919, 28.1535, 6.31767, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(393, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2484.41, -28.3538, 28.4416, 0.969749, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(394, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2513.28, -28.1812, 28.4416, 359.762, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(395, '-', 'Palomino Creek', 115000, 2, 1, 0, 1, 2551.22, -5.54289, 27.6756, 268.572, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(396, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2509.53, 11.7633, 28.4416, 2.55229, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(397, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2488.44, 11.5843, 28.4416, 180.303, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(398, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2446.63, 18.9495, 27.6835, 84.5186, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(399, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2448.44, -11.0199, 27.6835, 347.092, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(400, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2549.23, 25.199, 27.6756, 257.134, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(401, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2551.18, 91.7909, 27.6756, 268.057, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(402, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2518.44, 128.988, 27.6756, 5.57046, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(403, '-', 'Palomino Creek', 135000, 2, 1, 0, 1, 2480.69, 126.968, 27.6756, 180.079, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(404, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2479.44, 94.3967, 27.6835, 182.679, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(405, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2514.01, 94.3947, 27.6835, 188.843, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(406, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2458.94, 128.988, 27.6756, 356.222, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(407, '-', 'Palomino Creek', 150000, 2, 1, 0, 1, 2443.86, 92.2598, 28.4416, 271.773, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(408, '-', 'Palomino Creek', 125000, 2, 1, 0, 1, 2245.52, -1.6604, 28.1536, 5.18376, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(409, '-', 'El Corona', 25000, 1, 1, 0, 1, 1871.13, -2020.45, 13.5469, 95.5299, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(410, '-', 'El Corona', 25000, 1, 1, 0, 1, 1899.35, -1997.74, 13.5469, 181.486, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(411, '-', 'El Corona', 25000, 1, 1, 0, 1, 1899.4, -1985.88, 13.5469, 0.059347, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(412, '-', 'El Corona', 25000, 1, 1, 0, 1, 1866.91, -1985.9, 13.5469, 0.228141, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(413, '-', 'El Corona', 25000, 1, 1, 0, 1, 1866.82, -1997.51, 13.5469, 181.15, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(414, '-', 'El Corona', 25000, 1, 1, 0, 1, 1827.41, -1981, 13.5469, 4.17753, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(415, '-', 'El Corona', 25000, 1, 1, 0, 1, 1820.74, -1995.06, 13.5544, 88.0264, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(416, '-', 'El Corona', 25000, 1, 1, 0, 1, 1852.55, -1990.98, 13.5469, 88.0891, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(417, '-', 'El Corona', 25000, 1, 1, 0, 1, 1852.86, -2020.63, 13.5469, 85.8331, 337.61, 1854.1, 1002.08, 265.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(418, '-', 'Blueberry', 150000, 2, 1, 0, 1, 312.874, -92.4288, 3.53539, 91.5624, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(419, 'Kevin_Bastian', 'Blueberry', 15000, 2, 1, 0, 1, 252.882, -92.4175, 3.53539, 272.337, 736.03, 1672.08, 501.08, 356.23, 1612633408, 24, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(420, '-', 'Blueberry', 150000, 2, 1, 0, 1, 252.648, -121.278, 3.53539, 266.932, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(421, '-', 'Blueberry', 85000, 1, 1, 0, 1, 295.13, -54.6653, 2.77721, 358.941, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(422, '-', 'Blueberry', 105000, 2, 1, 0, 1, 267.746, -54.6384, 2.77721, 1.82274, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(423, '-', 'Santa Maria Beach', 45000, 1, 1, 0, 1, 192.837, -1769.4, 4.32875, 2.17897, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(424, '-', 'Marina', 85000, 2, 1, 0, 1, 739.063, -1417.97, 13.5234, 181.015, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(425, '-', 'Las Colinas', 45000, 1, 1, 0, 1, 2221.01, -1083.18, 41.7798, 307.353, 338.29, 1794.87, 1002.17, 269.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(426, '-', 'Las Colinas', 45000, 1, 1, 0, 1, 2188.76, -1081.51, 43.8347, 66.3346, 845.89, -2048, 1476.91, 92.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(427, '-', 'Rockshore West', 50000, 2, 1, 0, 1, 2169.17, 772.346, 11.4609, 271.16, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(428, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2123.37, 776.045, 11.4453, 357.461, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(429, '-', 'Rockshore West', 50000, 2, 1, 0, 1, 2094.17, 774.703, 11.4531, 3.29241, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(430, '-', 'Rockshore West', 50000, 2, 1, 0, 1, 2071.59, 776.519, 11.4605, 6.65755, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(431, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2043.34, 776.102, 11.4531, 5.25811, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(432, '-', 'Rockshore West', 50000, 2, 1, 0, 1, 2014.1, 774.744, 11.4609, 0.676664, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(433, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2013.28, 730.36, 11.4531, 181.298, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(434, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2042.46, 731.565, 11.4609, 183.495, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(435, '-', 'Rockshore West', 50000, 2, 1, 0, 1, 2064.95, 730.225, 11.4683, 178.937, 736.03, 1672.08, 501.08, 356.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(436, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2093.29, 730.359, 11.4531, 183.358, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(437, '-', 'Rockshore West', 75000, 2, 1, 0, 1, 2122.48, 731.751, 11.4609, 183.17, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(438, '-', 'Mulholland', 150000, 2, 1, 0, 1, 808.494, -759.41, 76.5314, 286.887, 338.78, 1734.95, 1002.08, 268.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(439, '-', 'Rodeo', 175000, 2, 1, 0, 1, 161.743, -1455.96, 32.845, 54.463, 351.59, 1669.31, 1002.17, 176.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(440, 'Zsolt_Petreny', 'Vinewood', 12, 3, 1, 0, 1, 691.577, -1275.97, 13.5607, 85.3005, 1855.38, -1709.12, 1720.06, 273.58, 1612808607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lockers`
--

CREATE TABLE `lockers` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lockers`
--

INSERT INTO `lockers` (`id`, `type`, `posx`, `posy`, `posz`, `interior`) VALUES
(0, 1, 261.699, 111.026, 1004.62, 10),
(1, 2, 1402.26, -17.4339, 1000.98, 1),
(2, 3, -1992.53, -80.2679, 1060.99, 1),
(3, 4, 2465.24, 2252.1, 91.6868, 1),
(4, 3, 1468.35, -15.5427, 1000.92, 1),
(5, 5, -4120.79, 868.09, 10.0237, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loglogin`
--

CREATE TABLE `loglogin` (
  `no` int(11) NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT 'None',
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `password` varchar(40) NOT NULL DEFAULT 'None',
  `time` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `logpay`
--

CREATE TABLE `logpay` (
  `player` varchar(40) NOT NULL DEFAULT 'None',
  `playerid` int(11) NOT NULL DEFAULT 0,
  `toplayer` varchar(40) NOT NULL DEFAULT 'None',
  `toplayerid` int(11) NOT NULL DEFAULT 0,
  `ammount` int(11) NOT NULL DEFAULT 0,
  `time` bigint(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `logstaff`
--

CREATE TABLE `logstaff` (
  `command` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `adminid` int(11) NOT NULL,
  `player` varchar(50) NOT NULL DEFAULT '*',
  `playerid` int(11) NOT NULL DEFAULT -1,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `time` bigint(15) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `objects`
--

CREATE TABLE `objects` (
  `id` int(11) NOT NULL,
  `model` int(128) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `posRX` float NOT NULL,
  `posRY` float NOT NULL,
  `posRZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ores`
--

CREATE TABLE `ores` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ores`
--

INSERT INTO `ores` (`id`, `type`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`) VALUES
(0, 0, 464.381, 866.534, -28.387, 0, 0, 0),
(1, 1, 555.939, 928.367, -43.5709, 0, 0, 0),
(2, 0, 613.141, 865.3, -43.5509, 0, 0, 0),
(3, 1, 637.747, 831.97, -43.6309, 0, 0, 0),
(4, 0, 671.772, 927.05, -41.4543, 0, 0, 0),
(5, 0, 652.36, 738.067, -11.904, 0, 0, 0),
(6, 1, 640.83, 731.161, -2.64683, 0, 0, 0),
(7, 1, 500.121, 781.126, -21.9991, 0, 0, 0),
(8, 0, 488.845, 785.109, -22.3256, 0, 0, 0),
(9, 1, 685.946, 820.716, -28.3049, 0, 0, 0),
(10, 0, 562.108, 982.26, -7.96277, 0, 0, 0),
(11, 0, 535.467, 909.043, -43.4109, 0, 0, 0),
(12, 0, 539.144, 882.115, -36.6565, 0, 0, 0),
(13, 1, 461.884, 884.778, -28.8179, 0, 0, 0),
(14, 1, 698.502, 841.609, -28.2711, 0, 0, 0),
(15, 1, 487.904, 800.007, -22.22, 0, 0, 0),
(16, 0, 546.501, 824.598, -29.9684, 0, 0, 0),
(17, 1, 576.64, 805.685, -29.4404, 0, 0, 0),
(18, 1, 554.326, 786.207, -19.1056, 0, 0, 0),
(19, 1, 709.745, 921.678, -19.4611, 0, 0, 0),
(20, 0, 714.078, 913.618, -19.2864, 0, 0, 0),
(21, 1, 744.818, 776.606, -8.06283, 0, 0, 0),
(22, 0, 600.437, 932.102, -41.5237, 0, 0, 0),
(23, 0, 597.532, 829.781, -43.959, 0, 0, 0),
(24, 1, 540.974, 842.47, -42.1793, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `plants`
--

CREATE TABLE `plants` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `players`
--

CREATE TABLE `players` (
  `reg_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(24) NOT NULL DEFAULT '',
  `adminname` varchar(24) NOT NULL DEFAULT 'None',
  `ip` varchar(24) NOT NULL DEFAULT '',
  `password` char(64) NOT NULL DEFAULT '',
  `salt` char(16) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT 'None',
  `admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `helper` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `levelup` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(256) NOT NULL,
  `kode` varchar(24) NOT NULL,
  `aktif` int(11) NOT NULL DEFAULT 0,
  `vip` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `vip_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `reg_date` varchar(30) NOT NULL DEFAULT '',
  `last_login` varchar(30) NOT NULL DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `bmoney` int(11) NOT NULL DEFAULT 0,
  `brek` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `phone` mediumint(8) UNSIGNED NOT NULL,
  `phonecredit` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `phonebook` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `wt` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dice` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `tollcard` int(11) NOT NULL DEFAULT 0,
  `hours` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `minutes` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `seconds` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `paycheck` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `skin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `facskin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `age` varchar(30) NOT NULL DEFAULT '',
  `indoor` mediumint(8) NOT NULL DEFAULT -1,
  `inbiz` mediumint(8) NOT NULL DEFAULT -1,
  `workbiz` bigint(24) NOT NULL DEFAULT -1,
  `inhouse` mediumint(8) NOT NULL DEFAULT -1,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `interior` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `world` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `boombox` int(12) NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `armour` float NOT NULL DEFAULT 0,
  `hunger` smallint(5) NOT NULL DEFAULT 100,
  `bladder` smallint(5) NOT NULL DEFAULT 100,
  `energy` smallint(5) NOT NULL DEFAULT 100,
  `sick` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hospital` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `injured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `duty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dutytime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `faction` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionlead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factiondiv` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `family` tinyint(3) NOT NULL DEFAULT -1,
  `familyrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jail` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `arrest` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arrest_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `warn` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sidejobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `exitjob` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `taxitime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `medicine` mediumint(8) NOT NULL DEFAULT 0,
  `medkit` mediumint(8) NOT NULL DEFAULT 0,
  `mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `helmet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `snack` mediumint(8) NOT NULL DEFAULT 0,
  `sprunk` mediumint(8) NOT NULL DEFAULT 0,
  `gas` mediumint(8) NOT NULL DEFAULT 0,
  `bandage` mediumint(8) NOT NULL DEFAULT 0,
  `gps` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `material` mediumint(8) NOT NULL DEFAULT 0,
  `component` mediumint(8) NOT NULL DEFAULT 0,
  `food` mediumint(8) NOT NULL DEFAULT 0,
  `seed` mediumint(8) NOT NULL DEFAULT 0,
  `potato` mediumint(8) NOT NULL DEFAULT 0,
  `wheat` mediumint(8) NOT NULL DEFAULT 0,
  `orange` mediumint(8) NOT NULL DEFAULT 0,
  `price1` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price2` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price3` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price4` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `marijuana` mediumint(8) NOT NULL DEFAULT 0,
  `plant` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `plant_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fishtool` tinyint(3) NOT NULL DEFAULT 0,
  `fish` mediumint(8) NOT NULL DEFAULT 0,
  `trawl` tinyint(3) NOT NULL DEFAULT 0,
  `worm` mediumint(8) NOT NULL DEFAULT 0,
  `idcard` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `idcard_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `flylic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flylic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `trucklic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `trucklic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `lumberlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lumberlic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `gunlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gunlic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `gunlic_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hbemode` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `togpm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `toglog` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togads` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togwt` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Gun1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun13` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo13` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `salary`
--

CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `info` varchar(46) DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `date` varchar(36) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `server`
--

CREATE TABLE `server` (
  `id` int(11) NOT NULL DEFAULT 0,
  `servermoney` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 500,
  `materialprice` int(11) NOT NULL DEFAULT 10,
  `lumberprice` int(11) NOT NULL DEFAULT 800,
  `component` int(11) NOT NULL DEFAULT 500,
  `componentprice` int(11) NOT NULL DEFAULT 10,
  `metalprice` int(11) NOT NULL DEFAULT 500,
  `gasoil` int(11) NOT NULL DEFAULT 1000,
  `gasoilprice` int(11) NOT NULL DEFAULT 10,
  `coalprice` int(11) NOT NULL DEFAULT 500,
  `product` int(11) NOT NULL DEFAULT 500,
  `productprice` int(11) NOT NULL DEFAULT 20,
  `apotek` int(11) NOT NULL DEFAULT 500,
  `medicineprice` int(11) NOT NULL DEFAULT 300,
  `medkitprice` int(11) NOT NULL DEFAULT 500,
  `food` int(11) NOT NULL DEFAULT 500,
  `foodprice` int(11) NOT NULL DEFAULT 100,
  `seedprice` int(11) NOT NULL DEFAULT 10,
  `potatoprice` int(11) NOT NULL DEFAULT 10,
  `wheatprice` int(11) NOT NULL DEFAULT 10,
  `orangeprice` int(11) NOT NULL DEFAULT 10,
  `marijuana` int(11) NOT NULL DEFAULT 500,
  `marijuanaprice` int(11) NOT NULL DEFAULT 10,
  `fishprice` int(11) NOT NULL DEFAULT 100,
  `gstationprice` int(11) NOT NULL DEFAULT 100
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `server`
--

INSERT INTO `server` (`id`, `servermoney`, `material`, `materialprice`, `lumberprice`, `component`, `componentprice`, `metalprice`, `gasoil`, `gasoilprice`, `coalprice`, `product`, `productprice`, `apotek`, `medicineprice`, `medkitprice`, `food`, `foodprice`, `seedprice`, `potatoprice`, `wheatprice`, `orangeprice`, `marijuana`, `marijuanaprice`, `fishprice`, `gstationprice`) VALUES
(0, -1600873147, 9640, 4, 50, 3456, 2, 50, 25483, 3, 45, 235930, 8, 5000, 200, 300, 687, 2, 5, 10, 50, 30, 1198281220, 128, 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `toys`
--

CREATE TABLE `toys` (
  `Id` int(10) NOT NULL,
  `Owner` varchar(40) NOT NULL DEFAULT '',
  `Slot0_Model` int(8) NOT NULL DEFAULT 0,
  `Slot0_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot0_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_Model` int(8) NOT NULL DEFAULT 0,
  `Slot1_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot1_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_Model` int(8) NOT NULL DEFAULT 0,
  `Slot2_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot2_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_Model` int(8) NOT NULL DEFAULT 0,
  `Slot3_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot3_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_Model` int(8) NOT NULL DEFAULT 0,
  `Slot4_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot4_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_Model` int(8) NOT NULL DEFAULT 0,
  `Slot5_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot5_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZScale` float(20,3) NOT NULL DEFAULT 0.000
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `toys`
--

INSERT INTO `toys` (`Id`, `Owner`, `Slot0_Model`, `Slot0_Bone`, `Slot0_XPos`, `Slot0_YPos`, `Slot0_ZPos`, `Slot0_XRot`, `Slot0_YRot`, `Slot0_ZRot`, `Slot0_XScale`, `Slot0_YScale`, `Slot0_ZScale`, `Slot1_Model`, `Slot1_Bone`, `Slot1_XPos`, `Slot1_YPos`, `Slot1_ZPos`, `Slot1_XRot`, `Slot1_YRot`, `Slot1_ZRot`, `Slot1_XScale`, `Slot1_YScale`, `Slot1_ZScale`, `Slot2_Model`, `Slot2_Bone`, `Slot2_XPos`, `Slot2_YPos`, `Slot2_ZPos`, `Slot2_XRot`, `Slot2_YRot`, `Slot2_ZRot`, `Slot2_XScale`, `Slot2_YScale`, `Slot2_ZScale`, `Slot3_Model`, `Slot3_Bone`, `Slot3_XPos`, `Slot3_YPos`, `Slot3_ZPos`, `Slot3_XRot`, `Slot3_YRot`, `Slot3_ZRot`, `Slot3_XScale`, `Slot3_YScale`, `Slot3_ZScale`, `Slot4_Model`, `Slot4_Bone`, `Slot4_XPos`, `Slot4_YPos`, `Slot4_ZPos`, `Slot4_XRot`, `Slot4_YRot`, `Slot4_ZRot`, `Slot4_XScale`, `Slot4_YScale`, `Slot4_ZScale`, `Slot5_Model`, `Slot5_Bone`, `Slot5_XPos`, `Slot5_YPos`, `Slot5_ZPos`, `Slot5_XRot`, `Slot5_YRot`, `Slot5_ZRot`, `Slot5_XScale`, `Slot5_YScale`, `Slot5_ZScale`) VALUES
(1, 'Maximiliano_Hampton', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(2, 'Cesar_Vilcenvia', 19064, 2, 0.159, -0.006, 0.000, -20.200, 77.500, 104.200, 1.000, 1.000, 1.000, 0, 1, 0.135, -0.092, 0.000, -8.000, 90.500, -163.900, 1.737, 1.000, 1.785, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(3, 'Anthony_Carington', 19043, 6, -0.015, -0.005, -0.004, 50.700, -68.800, -97.000, 1.174, 0.823, 1.059, 0, 17, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(4, 'Alvino_Hermanysah', 19022, 2, 0.088, 0.039, -0.001, 3.300, 90.700, 86.200, 0.836, 0.972, 0.962, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(5, 'Takashi_Akiyama', 19023, 2, 0.088, 0.048, -0.006, 10.800, 87.000, 86.500, 1.000, 1.000, 1.000, 0, 2, 0.094, 0.051, 0.000, 94.100, 84.000, -2.000, 1.000, 1.000, 1.000, 0, 2, 0.140, -0.007, -0.003, 0.000, 0.000, 0.000, 1.000, 1.146, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(6, 'Javin_Hermansyah', 0, 2, 0.088, -3.021, -0.002, 88.500, 92.000, 0.600, 1.000, 1.000, 1.000, 0, 2, 0.112, 0.010, -0.002, 0.000, 0.000, 0.000, 0.929, 0.902, 0.937, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(7, 'Made_Vandelion', 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.144, -0.068, -0.136, 69.600, 15.600, -32.800, 5.976, 2.299, 2.765, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(8, 'Made_Hilton', 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 2, 0.151, -0.004, -0.006, 90.800, 88.000, 0.000, 1.170, 1.196, 1.047, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(9, 'Brooks_Harvey', 18929, 2, 0.134, -0.015, 0.008, 178.900, 1.100, 29.700, 1.150, 1.126, 1.083, 19022, 2, 0.093, 0.028, -0.001, -132.200, 94.200, -136.800, 1.026, 1.099, 1.070, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(10, 'Vladimir_Lenin', 0, 2, 0.141, 0.010, 0.000, 0.000, 0.000, 0.000, 0.843, 1.160, 1.000, 0, 2, 0.130, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(11, 'Arturo_Radislav', 0, 2, 0.158, 0.010, -0.006, 0.000, 0.000, 0.000, 1.015, 1.013, 1.066, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(12, 'Arya_Stancee', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(13, 'Alferdo_Rainslav', 0, 2, 0.105, 0.031, 0.000, -2.900, 86.200, 96.000, 1.000, 1.147, 1.099, 0, 2, 0.152, -0.003, -0.005, 0.000, 0.000, 1.200, 1.077, 1.067, 1.027, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(14, 'Alexander_Eastwood', 18918, 2, 0.083, 0.028, 0.008, -90.000, 0.000, -93.900, 1.000, 1.000, 1.000, 18929, 2, 0.153, 0.016, -0.008, 0.000, 0.000, 0.000, 1.131, 1.132, 1.067, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(16, 'Diego_Walkerr', 0, 1, 0.034, 0.060, -0.018, -89.100, 89.600, -94.200, 1.029, 1.263, 1.137, 0, 2, 0.144, 0.014, -0.007, 0.000, 0.000, 0.000, 1.000, 1.016, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(17, 'Vika_Valerianpola', 0, 2, 0.085, 0.036, -0.001, 94.000, 80.600, -2.600, 1.000, 1.000, 1.000, 0, 2, 0.146, 0.000, 0.004, 0.000, 0.000, 0.000, 1.093, 1.037, 1.000, 0, 2, 0.051, 0.023, -0.001, -89.800, 6.800, -92.100, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(18, 'Dedy_Diannor', 19023, 2, 0.098, 0.043, -0.001, 82.600, 86.800, 8.800, 1.000, 1.016, 1.000, 18950, 1, 0.232, -0.144, 0.000, -2.400, -2.900, -62.500, 1.000, 1.013, 1.038, 18919, 2, 0.083, 0.042, 0.000, -89.700, -1.400, -93.100, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(19, 'Shawn_Brooklyn', 18639, 2, 0.181, 0.012, -0.002, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(20, 'Albuquer_Versailles', 0, 2, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(21, 'Teuku_Zaheer', 0, 2, -0.339, 0.044, -0.055, 38.400, 77.000, 131.400, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(22, 'Ray_Alexandrovich', 19064, 2, 0.112, 0.038, 0.007, 26.600, 85.500, 61.600, 1.236, 1.188, 1.000, 19140, 2, 0.093, 0.031, 0.002, 3.100, 91.800, 83.700, 1.059, 1.030, 1.000, 0, 1, 0.089, -0.116, -0.002, -4.600, 89.400, 4.300, 1.110, 1.132, 1.335, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(24, 'Kyle_Conquerra', 18947, 2, 0.130, 0.015, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(25, 'Lucio_Ladanza', 0, 2, 0.129, 0.032, -0.008, 0.000, 0.000, 0.000, 0.726, 0.880, 0.891, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(26, 'William_Jhonson', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(27, 'Alice_Ainsley', 11745, 1, 0.000, -0.064, -0.032, 0.000, 78.700, 92.200, 0.629, 0.679, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(28, 'Ryan_Kenzi', 18933, 2, 0.147, 0.004, -0.009, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 19039, 5, -0.019, -0.012, 0.004, -172.100, 90.700, -7.300, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trees`
--

CREATE TABLE `trees` (
  `id` int(11) NOT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `posrx` float DEFAULT NULL,
  `posry` float DEFAULT NULL,
  `posrz` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trees`
--

INSERT INTO `trees` (`id`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`) VALUES
(0, -523.63, -2247.73, 34.5218, 0, 0, 0),
(1, -623.954, -2261.36, 23.9413, 0, 0, 0),
(2, -628.714, -2394, 29.5843, 0, 0, 0),
(3, -735.625, -2254.4, 27.5423, 0, 0, 0),
(4, -657.756, -2140.98, 24.2563, 0, 0, 0),
(5, -654.44, -2074.7, 25.9842, 0, 0, 0),
(6, -546.637, -1999.71, 48.0892, 0, 0, 0),
(7, -731.541, -2189.38, 34.526, 0, 0, 0),
(8, -732.679, -2200.2, 34.5699, 0, 0, 0),
(9, -739.308, -2193.72, 34.6548, 0, 0, 0),
(10, -865.874, -2199.14, 29.0169, 0, 0, 0),
(11, -814.336, -2247.82, 37.77, 0, 0, 0),
(12, -878.67, -2367.51, 68.2969, 0, 0, 0),
(13, -861.714, -2381.68, 69.0388, 0, 0, 0),
(14, -972.936, -2322.47, 62.7628, 0, 0, 0),
(15, -1043.86, -2303.47, 55.4699, 0, 0, 0),
(16, -979.795, -2391.9, 70.2428, 0, 0, 0),
(17, -928.635, -2531.78, 114.824, 0, 0, 0),
(18, -928.943, -2555.48, 114.897, 0, 0, 0),
(19, -889.914, -2502.48, 110.088, 0, 0, 0),
(20, -874.672, -2612.06, 95.074, 0, 0, 0),
(21, -622.4, -2263.39, 23.9615, 0, 0, 0),
(22, -552.445, -2272.94, 28.3696, 0, 0, 0),
(23, -1065.08, -2548.24, 68.1407, 0, 0, 0),
(24, -744.504, -2441.61, 65.1923, 0, 0, 0),
(25, -818.597, -2657.71, 91.0869, 0, 0, 0),
(26, -734.419, -2690.28, 86.7166, 0, 0, 0),
(27, -686.676, -2630.36, 82.9661, 0, 0, 0),
(28, -707.708, -2695.28, 91.3966, 0, 0, 0),
(29, -757.89, -2538.72, 90.0414, 0, 0, 0),
(30, -748.443, -2509.77, 81.1096, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `color1` int(11) NOT NULL DEFAULT 0,
  `color2` int(11) NOT NULL DEFAULT 0,
  `paintjob` int(11) NOT NULL DEFAULT -1,
  `neon` int(11) NOT NULL DEFAULT 0,
  `locked` int(11) NOT NULL DEFAULT 0,
  `insu` int(11) NOT NULL DEFAULT 1,
  `claim` int(11) NOT NULL DEFAULT 0,
  `claim_time` bigint(15) NOT NULL DEFAULT 0,
  `plate` varchar(50) NOT NULL DEFAULT 'None',
  `plate_time` bigint(16) NOT NULL DEFAULT 0,
  `ticket` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 200000,
  `health` float NOT NULL DEFAULT 1000,
  `fuel` int(11) NOT NULL DEFAULT 1000,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `a` float NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `damage0` int(11) NOT NULL DEFAULT 0,
  `damage1` int(11) NOT NULL DEFAULT 0,
  `damage2` int(11) NOT NULL DEFAULT 0,
  `damage3` int(11) NOT NULL DEFAULT 0,
  `mod0` int(11) NOT NULL DEFAULT 0,
  `mod1` int(11) NOT NULL DEFAULT 0,
  `mod2` int(11) NOT NULL DEFAULT 0,
  `mod3` int(11) NOT NULL DEFAULT 0,
  `mod4` int(11) NOT NULL DEFAULT 0,
  `mod5` int(11) NOT NULL DEFAULT 0,
  `mod6` int(11) NOT NULL DEFAULT 0,
  `mod7` int(11) NOT NULL DEFAULT 0,
  `mod8` int(11) NOT NULL DEFAULT 0,
  `mod9` int(11) NOT NULL DEFAULT 0,
  `mod10` int(11) NOT NULL DEFAULT 0,
  `mod11` int(11) NOT NULL DEFAULT 0,
  `mod12` int(11) NOT NULL DEFAULT 0,
  `mod13` int(11) NOT NULL DEFAULT 0,
  `mod14` int(11) NOT NULL DEFAULT 0,
  `mod15` int(11) NOT NULL DEFAULT 0,
  `mod16` int(11) NOT NULL DEFAULT 0,
  `lumber` int(11) NOT NULL DEFAULT -1,
  `metal` int(11) NOT NULL DEFAULT 0,
  `coal` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `gasoil` int(11) NOT NULL DEFAULT 0,
  `rental` bigint(16) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `admin` varchar(16) NOT NULL DEFAULT 'None',
  `donature` varchar(16) NOT NULL DEFAULT 'None',
  `claim` int(11) NOT NULL DEFAULT 0,
  `sender` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(64) NOT NULL,
  `nominal` int(128) NOT NULL DEFAULT 0,
  `bukti` varchar(128) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment` int(11) NOT NULL,
  `note` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `weaponsettings`
--

CREATE TABLE `weaponsettings` (
  `Owner` int(11) NOT NULL,
  `WeaponID` tinyint(4) NOT NULL,
  `PosX` float DEFAULT -0.116,
  `PosY` float DEFAULT 0.189,
  `PosZ` float DEFAULT 0.088,
  `RotX` float DEFAULT 0,
  `RotY` float DEFAULT 44.5,
  `RotZ` float DEFAULT 0,
  `Bone` tinyint(4) NOT NULL DEFAULT 1,
  `Hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `weaponsettings`
--

INSERT INTO `weaponsettings` (`Owner`, `WeaponID`, `PosX`, `PosY`, `PosZ`, `RotX`, `RotY`, `RotZ`, `Bone`, `Hidden`) VALUES
(3489, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(453, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(527, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(10, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(461, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1827, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3702, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(363, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(40, 24, -0.116, -0.038, -0.345, -110.7, 166, 175.7, 8, 1),
(1002, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 18, 1),
(738, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 0),
(122, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(264, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 1),
(468, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(261, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2070, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 8, 1),
(237, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3785, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(340, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1486, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(164, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(391, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(106, 24, -0.116, 0.035, 0.088, 0, 44.5, 0, 1, 0),
(1494, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2951, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(9, 25, -0.116, -0.171, 0.088, 0, 44.5, 0, 1, 0),
(3723, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(225, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(130, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(130, 25, -0.116, -0.148, 0.088, 0, 44.5, 0, 1, 0),
(2462, 24, -0.099, 0.138, 0.046, 0, 44.5, 0, 18, 1),
(1255, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(418, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 1),
(427, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(485, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1879, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(340, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(4252, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(391, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(730, 24, -0.286, -0.194, 0.042, 4.3, -169.4, 4.3, 1, 0),
(157, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 4, 1),
(37, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(4935, 24, -0.085, -0.031, -0.234, 88.9, 168.9, -0.1, 1, 1),
(427, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 8, 0),
(634, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(320, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1115, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1495, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 8, 0),
(40, 25, -0.116, -0.176, 0.088, 0, 44.5, 0, 1, 0),
(644, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1890, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(687, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1713, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(217, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(40, 30, -0.116, -0.131, 0.088, 0, 44.5, 0, 1, 0),
(713, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(931, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(349, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 6, 1),
(5284, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(132, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(207, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(221, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 8, 0),
(329, 24, 0.004, -0.092, 0.089, -22.5, -88.7, 77.9, 8, 0),
(1879, 30, -0.116, -0.129, 0.088, 0, 44.5, 0, 1, 0),
(4101, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 7, 1),
(2196, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1519, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(264, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 18, 1),
(224, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(145, 25, -0.117, -0.108, 0.088, 0, 44.5, 0, 1, 0),
(28, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1334, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2547, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(28, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1879, 25, -0.116, -0.116, 0.088, 0, 44.5, 0, 1, 0),
(20, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1879, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3974, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(738, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 0),
(669, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(96, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 10, 1),
(96, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(200, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(468, 28, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(750, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3021, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 16, 0),
(90, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2036, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1827, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(80, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 7, 0),
(4305, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(9, 29, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(9, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(686, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3, 25, -0.116, -0.141, 0.088, 0, 44.5, 0, 1, 0),
(1790, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(341, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1663, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(164, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(200, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(821, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1521, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(104, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(4975, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 7, 0),
(20, 29, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(667, 28, -0.116, 0.189, 0.088, 0, 44.5, 0, 8, 1),
(5321, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(3723, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1495, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 18, 0),
(687, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(669, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1998, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(130, 33, -0.116, -0.141, 0.088, 0, 44.5, 0, 1, 0),
(3971, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(803, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1947, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(5047, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2070, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(410, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2384, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(682, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(821, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(130, 29, -0.116, -0.16, 0.045, 0, 44.5, 0, 1, 0),
(2516, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(683, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(426, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1002, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1697, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(404, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(8, 30, 0.296, -0.144, 0.125, 0, 147.2, 0, 1, 0),
(3785, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 0),
(104, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(667, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(2425, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 7, 0),
(1592, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(4101, 33, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(5122, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(3723, 28, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(1341, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(2951, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(191, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(2516, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(4101, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 7, 0),
(641, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(80, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(4243, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(807, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1005, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(683, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(69, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 0),
(3362, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(3742, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 0),
(1255, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(320, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(5526, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(116, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(667, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(329, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1, 24, -0.328, -0.099, 0.07, 0, 96.5, 108, 1, 1),
(3, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(16, 24, -0.325, 0.08, 0.207, 52, 171.9, 9.2, 1, 1),
(70, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(36, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(134, 24, -0.13, -0.017, 0.158, 85.9, 152.1, 0, 1, 0),
(228, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(70, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(224, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(17, 24, -0.062, 0.004, -0.237, 92.1, 175.4, -1.2, 1, 0),
(153, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(40, 31, -0.116, 0.188, 0.088, 0, 44.5, 0, 1, 0),
(299, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(165, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(173, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(42, 24, -0.138, -0.106, -0.214, 108.5, 127, -24.9, 1, 1),
(39, 30, -0.116, -0.14, 0.088, 0, 44.5, 0, 1, 0),
(39, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(292, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(277, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(308, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(25, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(76, 24, -0.1, -0.021, -0.203, 76.1, 166.1, -3.6, 1, 0),
(26, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(84, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(568, 24, 0.076, 0.021, 0.156, -106.9, 0.4, 6.9, 8, 1),
(228, 24, -0.116, -0.16, -0.007, 0, 17.7, 0, 1, 1),
(95, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(95, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 0),
(38, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(111, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(210, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(203, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(386, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(24, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(173, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(243, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(492, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 17, 1),
(448, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(119, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(271, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 6, 1),
(5, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(134, 25, -0.18, -0.133, 0.094, 0, 44.5, 3.7, 1, 0),
(36, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(119, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(343, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(744, 25, -0.112, -0.161, 0.092, 2.5, 40.6, 6.3, 1, 0),
(744, 24, -0.2, -0.038, 0.158, 95.1, 104.1, -3, 1, 0),
(329, 25, -0.116, -0.131, 0.088, 0, 44.5, 0, 1, 0),
(319, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(106, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(76, 25, -0.102, -0.131, 0.106, 0, 44.5, 0, 1, 0),
(624, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(40, 34, -0.116, -0.125, 0.088, 0, 44.5, 0, 1, 0),
(351, 24, -0.125, -0.027, 0.038, 92, 165.2, -1.7, 1, 0),
(351, 25, 0.298, -0.157, -0.106, -3.2, -135.1, 1.5, 1, 0),
(600, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(42, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(624, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(515, 24, -0.081, -0.019, -0.234, -86.1, 20.2, -177.4, 1, 0),
(165, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(210, 22, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(655, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(515, 30, 0.216, -0.04, -0.103, -168.8, 156.7, -0.1, 1, 0),
(13, 23, -0.107, -0.166, 0.03, 0, 44.5, 0, 1, 1),
(299, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(587, 24, -0.09, 0.069, 0.07, -88.2, 39.7, -1.2, 8, 1),
(33, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(210, 29, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(460, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(597, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(566, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(42, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(76, 31, -0.088, -0.127, 0.109, 0, 44.5, 0, 1, 0),
(16, 25, 0.304, -0.07, -0.057, -95.9, -166.2, 9.7, 1, 0),
(36, 29, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(40, 27, 0.005, -0.129, 0.123, 0, 44.5, 0, 1, 0),
(471, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(624, 25, -0.534, 0.241, -0.047, 13.5, 3.5, -13.9, 17, 0),
(600, 25, -0.215, -0.423, 0.22, 11.2, 119.1, -3.3, 1, 0),
(429, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(501, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(36, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(698, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(995, 24, -0.164, -0.164, 0.094, -8.8, 144.7, 10.7, 1, 0),
(17, 27, 0.36, -0.191, 0.219, -1.2, 158.6, 12.6, 1, 0),
(1088, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(489, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(41, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1691, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1532, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(1, 30, -0.116, -0.189, 0.088, 0, 44.5, 0, 1, 0),
(17, 29, -0.086, 0.186, 0.113, -2, 67.4, -1.6, 1, 0),
(909, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(501, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(438, 24, -0.116, 0.103, 0.088, 0, 44.5, 0, 1, 0),
(84, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(10, 25, 0.303, -0.099, -0.05, -93.9, -161.1, 6.3, 1, 0),
(10, 22, -0.056, -0.025, -0.158, 95.3, -175.9, -22.6, 1, 0),
(515, 31, 0.152, -0.092, -0.065, -178.5, 167.8, 0, 1, 0),
(134, 27, -0.269, -0.118, 0.156, 0, 44.5, 0, 1, 0),
(2232, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(121, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(7, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(41, 25, -0.22, -0.071, -0.086, -168.4, 42.3, -0.2, 1, 0),
(41, 27, -0.215, -0.111, 0.151, 0, 44.5, 0, 1, 0),
(123, 30, -0.116, -0.124, 0.066, -0.6, 5.1, 0, 1, 1),
(287, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(123, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(16, 38, -0.287, -0.217, 0.364, 2.9, 52.3, 0, 1, 0),
(14, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(110, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(296, 24, -0.018, -0.12, 0.096, -167.9, -84.9, -76.1, 8, 1),
(296, 29, -0.005, 0.14, -0.028, 0, 44.5, -6.7, 1, 0),
(7, 34, -0.116, 0.185, 0.049, -1.9, 44.5, -4.9, 1, 0),
(7, 31, -0.038, 0.189, 0.041, 4.5, 35.6, -5.2, 1, 0),
(287, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2482, 23, -0.008, -0.013, -0.011, 79.2, 178.8, -2.9, 1, 0),
(110, 23, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2486, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2486, 29, 0.228, -0.099, 0.185, 0, 156.1, 0, 1, 1),
(4, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(4, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(4, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2493, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(23, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(23, 29, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(121, 28, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(64, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(2482, 24, -0.116, 0.064, 0.093, 0, 44.5, 0, 1, 0),
(2482, 29, -0.174, 0.045, 0.029, 0, 44.5, 0, 1, 0),
(296, 31, -0.131, 0.234, 0.067, 23.6, 41.9, -21.5, 1, 0),
(121, 29, -0.123, 0.198, -0.007, 5.3, 43.4, -7, 1, 0),
(2497, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(19, 24, 0.169, -0.096, 0.117, 5.3, -89.6, 115.5, 8, 0),
(2504, 30, 0.306, -0.126, 0.088, 0, 176.9, 0, 1, 0),
(296, 34, -0.131, -0.176, 0.061, 1.5, 44.1, 4.4, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banneds`
--
ALTER TABLE `banneds`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bisnis`
--
ALTER TABLE `bisnis`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`);

--
-- Indeks untuk tabel `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `familys`
--
ALTER TABLE `familys`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `gstations`
--
ALTER TABLE `gstations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `lockers`
--
ALTER TABLE `lockers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `loglogin`
--
ALTER TABLE `loglogin`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ores`
--
ALTER TABLE `ores`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indeks untuk tabel `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `toys`
--
ALTER TABLE `toys`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `id` (`Owner`);

--
-- Indeks untuk tabel `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `weaponsettings`
--
ALTER TABLE `weaponsettings`
  ADD PRIMARY KEY (`Owner`,`WeaponID`),
  ADD UNIQUE KEY `Owner` (`Owner`,`WeaponID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banneds`
--
ALTER TABLE `banneds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loglogin`
--
ALTER TABLE `loglogin`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `players`
--
ALTER TABLE `players`
  MODIFY `reg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `toys`
--
ALTER TABLE `toys`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
