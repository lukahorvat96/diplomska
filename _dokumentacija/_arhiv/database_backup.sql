-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 31. jan 2021 ob 00.14
-- Različica strežnika: 10.4.8-MariaDB
-- Različica PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `newprojectdb`
--

-- --------------------------------------------------------

--
-- Struktura tabele `order`
--

CREATE TABLE `order` (
  `Order_id` int(11) NOT NULL,
  `Order_start` datetime NOT NULL,
  `Order_end` datetime DEFAULT NULL,
  `Table_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Order_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `order`
--

INSERT INTO `order` (`Order_id`, `Order_start`, `Order_end`, `Table_id`, `User_id`, `Order_status`) VALUES
(6, '2021-01-18 00:25:54', '2021-01-22 02:10:25', 1, NULL, 'Finished'),
(7, '2021-01-18 00:42:09', '2021-01-22 02:10:27', 1, NULL, 'Finished'),
(8, '2021-01-18 00:44:03', '2021-01-22 02:10:28', 1, NULL, 'Finished'),
(10, '2021-01-18 00:52:43', '2021-01-22 02:10:29', 1, NULL, 'Finished'),
(11, '2021-01-18 00:55:13', '2021-01-22 02:10:30', 1, NULL, 'Finished'),
(12, '2021-01-18 00:55:48', '2021-01-22 02:10:30', 1, NULL, 'Finished'),
(13, '2021-01-18 00:58:01', '2021-01-22 02:10:32', 1, NULL, 'Finished'),
(14, '2021-01-18 00:59:07', '2021-01-22 02:10:32', 1, NULL, 'Finished'),
(15, '2021-01-18 01:01:14', '2021-01-22 02:10:33', 1, NULL, 'Finished'),
(16, '2021-01-18 01:02:03', '2021-01-22 02:10:33', 1, NULL, 'Finished'),
(17, '2021-01-18 01:02:25', '2021-01-22 02:10:41', 1, NULL, 'Finished'),
(18, '2021-01-18 01:04:43', '2021-01-22 02:10:42', 1, NULL, 'Finished'),
(19, '2021-01-18 01:06:14', '2021-01-22 02:10:41', 1, NULL, 'Finished'),
(20, '2021-01-18 20:33:45', '2021-01-22 02:10:43', 1, NULL, 'Finished'),
(21, '2021-01-18 20:33:58', '2021-01-22 02:10:42', 1, NULL, 'Finished'),
(22, '2021-01-19 00:21:49', '2021-01-22 02:10:44', 1, NULL, 'Finished'),
(23, '2021-01-19 21:55:41', '2021-01-22 02:10:44', 1, NULL, 'Finished'),
(24, '2021-01-19 22:05:39', '2021-01-22 02:10:46', 1, NULL, 'Finished'),
(25, '2021-01-21 02:09:35', '2021-01-22 02:10:46', 1, NULL, 'Finished'),
(26, '2021-01-21 02:11:16', '2021-01-22 02:10:46', 1, NULL, 'Finished'),
(27, '2021-01-21 02:13:47', '2021-01-22 02:10:46', 1, NULL, 'Finished'),
(28, '2021-01-21 02:15:01', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(29, '2021-01-21 02:16:00', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(30, '2021-01-21 02:18:38', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(31, '2021-01-21 02:22:14', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(32, '2021-01-21 02:23:32', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(33, '2021-01-21 02:31:22', '2021-01-22 02:10:47', 1, NULL, 'Finished'),
(34, '2021-01-21 02:42:04', '2021-01-22 02:10:48', 1, NULL, 'Finished'),
(35, '2021-01-21 02:54:29', '2021-01-22 02:10:49', 1, NULL, 'Finished'),
(36, '2021-01-21 20:43:49', '2021-01-22 02:11:43', 1, NULL, 'Finished'),
(37, '2021-01-22 02:12:23', '2021-01-22 02:13:57', 1, NULL, 'Finished'),
(38, '2021-01-22 02:14:03', '2021-01-22 02:15:56', 1, NULL, 'Finished'),
(39, '2021-01-22 02:16:01', '2021-01-22 02:17:48', 1, NULL, 'Finished'),
(40, '2021-01-22 02:18:28', '2021-01-22 02:18:48', 1, NULL, 'Finished'),
(41, '2021-01-22 02:34:40', '2021-01-22 10:46:08', 1, NULL, 'Finished'),
(42, '2021-01-25 20:58:00', '2021-01-27 21:00:08', 1, NULL, 'Finished'),
(43, '2021-01-27 21:03:45', '2021-01-30 12:16:23', 1, NULL, 'Finished'),
(44, '2021-01-30 16:44:53', '2021-01-30 22:10:32', 1, NULL, 'Finished'),
(45, '2021-01-30 18:38:49', '2021-01-30 22:10:32', 1, NULL, 'Finished');

-- --------------------------------------------------------

--
-- Struktura tabele `table`
--

CREATE TABLE `table` (
  `Table_id` int(11) NOT NULL,
  `Table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Table_postion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `table`
--

INSERT INTO `table` (`Table_id`, `Table_name`, `Table_postion`) VALUES
(1, 'Miza 1', 'Miza ob oknu');

-- --------------------------------------------------------

--
-- Struktura tabele `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `User_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `User_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `User_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `user`
--

INSERT INTO `user` (`User_id`, `User_role`, `User_name`, `User_password`) VALUES
(1, 'Waiter', 'Luka', 'luka1234!'),
(2, 'Cooker', 'Andraz', 'kekec1234!');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_id`),
  ADD KEY `IX_Relationship13` (`Table_id`),
  ADD KEY `IX_Relationship14` (`User_id`);

--
-- Indeksi tabele `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`Table_id`);

--
-- Indeksi tabele `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `order`
--
ALTER TABLE `order`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT tabele `table`
--
ALTER TABLE `table`
  MODIFY `Table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabele `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`Table_id`) REFERENCES `table` (`Table_id`),
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
