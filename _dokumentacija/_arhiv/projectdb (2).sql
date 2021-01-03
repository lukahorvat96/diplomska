-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 20. maj 2020 ob 23.22
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
-- Zbirka podatkov: `projectdb`
--

-- --------------------------------------------------------

--
-- Struktura tabele `drink`
--

CREATE TABLE `drink` (
  `Drink_id` int(11) NOT NULL,
  `Drink_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Drink_price` float NOT NULL,
  `Drink_alcohol` tinyint(1) NOT NULL,
  `Drink_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Drink_calorie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Drink_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Drink_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DrinkType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `drink`
--

INSERT INTO `drink` (`Drink_id`, `Drink_name`, `Drink_price`, `Drink_alcohol`, `Drink_size`, `Drink_calorie`, `Drink_picture`, `Drink_description`, `DrinkType_id`) VALUES
(1, 'Gin Tonic Mare', 5, 1, '0,03L', '100', 'ginmare.jpg', NULL, 1),
(2, 'Union', 2.5, 1, '0,5l', '170', 'union_tocen.jpg', 'Union Brewery\'s most recognizable beer is the heritage of a 150-year tradition.', 3),
(3, 'Fructal Strawbarry', 1.5, 0, '0.25', NULL, 'fructal-strawberry.jpg', NULL, 2),
(4, 'Fructal Peach', 1.5, 0, '0.25', NULL, 'fructal-peach.jpg', NULL, 2),
(5, 'Laško', 2, 1, '0.5', NULL, 'lasko.jpg', NULL, 3),
(6, 'Tea Fruit', 1, 0, '1', NULL, 'tea-fruit.jpg', NULL, 4);

-- --------------------------------------------------------

--
-- Struktura tabele `drinktype`
--

CREATE TABLE `drinktype` (
  `DrinkType_id` int(11) NOT NULL,
  `Type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `drinktype`
--

INSERT INTO `drinktype` (`DrinkType_id`, `Type_name`) VALUES
(1, 'Cocktail'),
(2, 'Juice'),
(3, 'Beer'),
(4, 'Hot drinks');

-- --------------------------------------------------------

--
-- Struktura tabele `food`
--

CREATE TABLE `food` (
  `Food_id` int(11) NOT NULL,
  `Food_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Food_price` float NOT NULL,
  `Food_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Food_calorie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Food_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Food_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FoodType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `food`
--

INSERT INTO `food` (`Food_id`, `Food_name`, `Food_price`, `Food_size`, `Food_calorie`, `Food_picture`, `Food_description`, `FoodType_id`) VALUES
(1, 'Pizza Classic', 8, 'Big', '3000', NULL, 'Tomato, ham, cheese, mushrooms', 1),
(2, 'Pancakes with Nutella', 5, '2 pancakes ', '400', NULL, 'Pancakes with Nutella', 4);

-- --------------------------------------------------------

--
-- Struktura tabele `foodtype`
--

CREATE TABLE `foodtype` (
  `FoodType_id` int(11) NOT NULL,
  `Type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `foodtype`
--

INSERT INTO `foodtype` (`FoodType_id`, `Type_name`) VALUES
(1, 'Pizza'),
(2, 'Pasta'),
(3, 'Salad'),
(4, 'Desserts');

-- --------------------------------------------------------

--
-- Struktura tabele `order`
--

CREATE TABLE `order` (
  `Order_id` int(11) NOT NULL,
  `Order_start` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Order_end` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `order`
--

INSERT INTO `order` (`Order_id`, `Order_start`, `Order_end`, `Table_id`) VALUES
(1, '2020-03-11 04:00:00', NULL, 1),
(56, '29-03-2020 00:51:19', NULL, 1),
(57, '29-03-2020 00:51:28', NULL, 1),
(58, '29-03-2020 00:55:50', NULL, 1),
(59, '29-03-2020 11:17:17', NULL, 1),
(60, '29-03-2020 11:17:32', NULL, 1),
(61, '29-03-2020 11:20:13', NULL, 1),
(62, '29-03-2020 11:20:28', NULL, 1),
(63, '29-03-2020 11:21:13', NULL, 1),
(64, '29-03-2020 11:21:31', NULL, 1),
(65, '29-03-2020 11:21:53', NULL, 1),
(66, '29-03-2020 11:22:30', NULL, 1),
(67, '29-03-2020 11:22:56', NULL, 1),
(68, '29-03-2020 11:23:00', NULL, 1),
(69, '29-03-2020 13:11:48', NULL, 1),
(70, '29-03-2020 13:12:03', NULL, 1),
(71, '29-03-2020 13:13:27', NULL, 1),
(72, '29-03-2020 13:15:45', NULL, 1),
(73, '29-03-2020 13:16:55', NULL, 1),
(74, '29-03-2020 13:25:11', NULL, 1),
(75, '29-03-2020 13:25:13', NULL, 1),
(76, '29-03-2020 13:29:43', NULL, 1),
(77, '29-03-2020 13:33:50', NULL, 1),
(78, '29-03-2020 13:34:17', NULL, 1),
(79, '29-03-2020 13:35:50', NULL, 1),
(80, '29-03-2020 13:36:05', NULL, 1),
(81, '29-03-2020 13:36:35', NULL, 1),
(82, '29-03-2020 13:36:58', NULL, 1),
(83, '29-03-2020 13:37:11', NULL, 1),
(84, '29-03-2020 13:37:59', NULL, 1),
(85, '29-03-2020 13:38:20', NULL, 1),
(86, '29-03-2020 13:38:35', NULL, 1),
(87, '29-03-2020 14:07:53', NULL, 1),
(88, '29-03-2020 14:08:55', NULL, 1),
(89, '29-03-2020 14:09:21', NULL, 1),
(90, '29-03-2020 14:10:01', NULL, 1),
(91, '29-03-2020 14:11:08', NULL, 1),
(92, '29-03-2020 14:22:05', NULL, 1),
(93, '29-03-2020 14:22:33', NULL, 1),
(94, '29-03-2020 17:28:29', NULL, 1),
(95, '29-03-2020 17:30:38', NULL, 1),
(96, '29-03-2020 18:29:53', NULL, 1),
(97, '29-03-2020 18:50:22', NULL, 1),
(98, '12-04-2020 13:29:33', NULL, 1),
(99, '12-04-2020 14:43:00', NULL, 1),
(100, '12-04-2020 14:56:45', NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabele `orderdrink`
--

CREATE TABLE `orderdrink` (
  `Order_id` int(11) NOT NULL,
  `Drink_id` int(11) NOT NULL,
  `Drink_quantity` int(11) NOT NULL,
  `Drink_total_price` float NOT NULL,
  `Table_id` int(11) NOT NULL,
  `DrinkType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `orderdrink`
--

INSERT INTO `orderdrink` (`Order_id`, `Drink_id`, `Drink_quantity`, `Drink_total_price`, `Table_id`, `DrinkType_id`) VALUES
(72, 1, 1, 5, 1, 1),
(72, 2, 1, 2.5, 1, 3),
(73, 1, 1, 5, 1, 1),
(73, 2, 5, 12.5, 1, 3),
(74, 1, 1, 5, 1, 1),
(74, 2, 5, 12.5, 1, 3),
(75, 1, 1, 5, 1, 1),
(75, 2, 5, 12.5, 1, 3),
(76, 1, 1, 5, 1, 1),
(83, 2, 1, 2.5, 1, 3),
(85, 2, 1, 2.5, 1, 3),
(86, 1, 1, 5, 1, 1),
(86, 2, 1, 2.5, 1, 3),
(87, 1, 1, 5, 1, 1),
(87, 2, 1, 2.5, 1, 3),
(88, 1, 1, 5, 1, 1),
(88, 2, 1, 2.5, 1, 3),
(89, 1, 1, 5, 1, 1),
(90, 1, 1, 5, 1, 1),
(91, 1, 1, 5, 1, 1),
(91, 2, 1, 2.5, 1, 3),
(92, 1, 1, 5, 1, 1),
(93, 1, 1, 5, 1, 1),
(94, 1, 1, 5, 1, 1),
(94, 2, 1, 2.5, 1, 3),
(95, 1, 1, 5, 1, 1),
(95, 2, 1, 2.5, 1, 3),
(96, 1, 1, 5, 1, 1),
(96, 2, 5, 12.5, 1, 3),
(97, 1, 1, 5, 1, 1),
(97, 2, 1, 2.5, 1, 3),
(98, 1, 1, 5, 1, 1),
(98, 2, 1, 2.5, 1, 3),
(99, 1, 1, 5, 1, 1),
(100, 1, 1, 5, 1, 1),
(100, 2, 2, 5, 1, 3);

-- --------------------------------------------------------

--
-- Struktura tabele `orderfood`
--

CREATE TABLE `orderfood` (
  `Food_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Food_quantity` int(11) NOT NULL,
  `Food_total_price` float NOT NULL,
  `Table_id` int(11) NOT NULL,
  `FoodType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'Miza 1', 'Miza ob oknu'),
(2, 'Miza 2', 'Miza ob vratih');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`Drink_id`,`DrinkType_id`),
  ADD KEY `Relationship13` (`DrinkType_id`);

--
-- Indeksi tabele `drinktype`
--
ALTER TABLE `drinktype`
  ADD PRIMARY KEY (`DrinkType_id`);

--
-- Indeksi tabele `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Food_id`,`FoodType_id`),
  ADD KEY `Relationship12` (`FoodType_id`);

--
-- Indeksi tabele `foodtype`
--
ALTER TABLE `foodtype`
  ADD PRIMARY KEY (`FoodType_id`);

--
-- Indeksi tabele `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_id`,`Table_id`),
  ADD KEY `Relationship9` (`Table_id`);

--
-- Indeksi tabele `orderdrink`
--
ALTER TABLE `orderdrink`
  ADD PRIMARY KEY (`Order_id`,`Drink_id`,`Table_id`,`DrinkType_id`),
  ADD KEY `Relationship7` (`Order_id`,`Table_id`),
  ADD KEY `Relationship8` (`Drink_id`,`DrinkType_id`);

--
-- Indeksi tabele `orderfood`
--
ALTER TABLE `orderfood`
  ADD PRIMARY KEY (`Food_id`,`Order_id`,`Table_id`,`FoodType_id`),
  ADD KEY `Relationship1` (`Food_id`,`FoodType_id`),
  ADD KEY `Relationship2` (`Order_id`,`Table_id`);

--
-- Indeksi tabele `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`Table_id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `drink`
--
ALTER TABLE `drink`
  MODIFY `Drink_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabele `drinktype`
--
ALTER TABLE `drinktype`
  MODIFY `DrinkType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `food`
--
ALTER TABLE `food`
  MODIFY `Food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabele `foodtype`
--
ALTER TABLE `foodtype`
  MODIFY `FoodType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `order`
--
ALTER TABLE `order`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT tabele `table`
--
ALTER TABLE `table`
  MODIFY `Table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `drink`
--
ALTER TABLE `drink`
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`DrinkType_id`) REFERENCES `drinktype` (`DrinkType_id`);

--
-- Omejitve za tabelo `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`FoodType_id`) REFERENCES `foodtype` (`FoodType_id`);

--
-- Omejitve za tabelo `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`Table_id`) REFERENCES `table` (`Table_id`);

--
-- Omejitve za tabelo `orderdrink`
--
ALTER TABLE `orderdrink`
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`Order_id`,`Table_id`) REFERENCES `order` (`Order_id`, `Table_id`),
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`Drink_id`,`DrinkType_id`) REFERENCES `drink` (`Drink_id`, `DrinkType_id`);

--
-- Omejitve za tabelo `orderfood`
--
ALTER TABLE `orderfood`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`Food_id`,`FoodType_id`) REFERENCES `food` (`Food_id`, `FoodType_id`),
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`Order_id`,`Table_id`) REFERENCES `order` (`Order_id`, `Table_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
