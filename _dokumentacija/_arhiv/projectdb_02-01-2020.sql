-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 02. jan 2021 ob 17.51
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
  `Order_start` datetime(6) DEFAULT NULL,
  `Order_end` datetime(6) DEFAULT NULL,
  `Table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `order`
--

INSERT INTO `order` (`Order_id`, `Order_start`, `Order_end`, `Table_id`) VALUES
(120, '2020-12-15 00:07:17.920631', NULL, 1),
(121, '2020-12-15 00:07:46.754022', NULL, 1),
(122, '2020-12-17 02:10:48.502335', NULL, 1),
(123, '2020-12-17 02:14:17.662651', NULL, 1),
(124, '2020-12-17 02:14:49.896734', NULL, 1),
(125, '2020-12-26 22:12:39.995157', NULL, 1),
(126, '2020-12-27 16:20:10.441265', NULL, 1),
(127, '2020-12-27 16:21:07.563271', NULL, 1),
(128, '2020-12-27 16:45:47.277639', NULL, 1),
(129, '2020-12-27 16:48:32.849760', NULL, 1),
(130, '2020-12-27 16:54:48.198466', NULL, 1);

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
(120, 2, 4, 10, 1, 3),
(120, 5, 4, 8, 1, 3),
(121, 2, 1, 2.5, 1, 3),
(121, 3, 1, 1.5, 1, 2),
(121, 4, 1, 1.5, 1, 2),
(122, 2, 3, 7.5, 1, 3),
(122, 5, 3, 6, 1, 3),
(123, 1, 3, 15, 1, 1),
(125, 1, 4, 20, 1, 1),
(125, 2, 3, 7.5, 1, 3),
(126, 3, 3, 4.5, 1, 2),
(126, 4, 4, 6, 1, 2),
(127, 1, 4, 20, 1, 1),
(128, 1, 4, 20, 1, 1),
(129, 2, 1, 2.5, 1, 3),
(129, 4, 1, 1.5, 1, 2),
(130, 2, 3, 7.5, 1, 3);

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
-- Indeksi tabele `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

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
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT tabele `table`
--
ALTER TABLE `table`
  MODIFY `Table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabele `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT;

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
