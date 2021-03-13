-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Mar 2021 pada 10.49
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

--
-- Dumping data untuk tabel `banneds`
--

INSERT INTO `banneds` (`id`, `name`, `ip`, `longip`, `ban_expire`, `ban_date`, `last_activity_timestamp`, `admin`, `reason`) VALUES

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
(24, 'Parkiran', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 1574.57, -1637.43, 13.5677, 180.336, 0, 10, 213.987, 118.339, 1003.22, 88.2424),

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

--
-- Dumping data untuk tabel `loglogin`
--

INSERT INTO `loglogin` (`no`, `username`, `reg_id`, `password`, `time`) VALUES


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

--
-- Dumping data untuk tabel `logpay`
--

INSERT INTO `logpay` (`player`, `playerid`, `toplayer`, `toplayerid`, `ammount`, `time`) VALUES


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

--
-- Dumping data untuk tabel `logstaff`
--

INSERT INTO `logstaff` (`command`, `admin`, `adminid`, `player`, `playerid`, `str`, `time`) VALUES


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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loglogin`
--
ALTER TABLE `loglogin`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3801;

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
