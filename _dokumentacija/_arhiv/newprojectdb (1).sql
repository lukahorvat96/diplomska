-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 01. feb 2021 ob 01.45
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
(45, '2021-01-30 18:38:49', '2021-01-30 22:10:32', 1, NULL, 'Finished'),
(46, '2021-01-31 19:18:41', '2021-01-31 19:25:31', 1, NULL, 'Order updated'),
(47, '2021-01-31 19:26:48', '2021-01-31 19:27:09', 1, NULL, 'Finished'),
(48, '2021-01-31 22:21:12', '2021-02-01 00:55:17', 1, NULL, 'Finished'),
(49, '2021-02-01 00:55:20', NULL, 1, NULL, 'Not served');

-- --------------------------------------------------------

--
-- Struktura tabele `product`
--

CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL,
  `Product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Product_price` float NOT NULL,
  `Product_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Product_calorie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Product_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Product_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProductType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `product`
--

INSERT INTO `product` (`Product_id`, `Product_name`, `Product_price`, `Product_size`, `Product_calorie`, `Product_picture`, `Product_description`, `ProductType_id`) VALUES
(1, 'Somersby Apple', 3, '0.33L', '207', 'somersby-apple.png', NULL, 1),
(2, 'Heineken', 2, '0.25L', '110', 'heineken.png', NULL, 2),
(3, 'Heineken', 3.5, '0.5L', '220', 'heineken.png', NULL, 2),
(4, 'Union', 3, '0.5L', '170', 'union_tocen.png', NULL, 2),
(5, 'Laško', 2.5, '0.5L', '170', 'lasko.jpg', NULL, 3),
(6, 'Tea Fruit', 1, '0.4L', '1', 'tea-fruit.png', NULL, 4),
(7, 'Fructal Strawbarry', 1.5, '0.33L', '50', 'fructal-strawberry.jpg', NULL, 12),
(8, 'Fructal Peach', 1.5, '0.33L', '50', 'fructal-peach.jpg', NULL, 12),
(9, 'Gin Mare', 6, '0.03L', '100', 'ginmare.png', NULL, 5),
(10, 'Hot chocolate', 2.5, '0.4L', '75', 'hotchocolate.png', 'You can choose white or black chocolate.', 4),
(11, 'Gin Beefeater', 3.9, '0.03L', '100', 'beefeater.png', NULL, 5),
(12, 'Gin Beefeater 24', 5, '0.03L', '100', 'beefeater24.png', NULL, 5),
(13, 'Gin Hendrick\'s', 5.5, '0.03L', '100', 'hendricks.png', NULL, 5),
(14, 'Union', 2.5, '0.5L', '180', 'unionbottled.png', NULL, 3),
(15, 'Union', 2, '0.33L', '100', 'unionbottled.png', NULL, 3),
(16, 'Laško', 2, '0.33L', '90', 'lasko.jpg', NULL, 3),
(17, 'Laško', 3, '0.5L', '170', 'laskodraught.png', NULL, 2),
(18, 'Rose', 3.5, '0.1L', '80', 'rosewine.png', 'Batič, demi sec', 6),
(19, 'Rose', 27, '0.7L', '560', 'baticrose.jpg', 'Batič, demi sec', 6),
(20, 'Malvasia', 3, '0.1L', '70', 'whitewine.png', 'Dar sonca, dry', 6),
(21, 'Malvasia', 22, '0.7L', '490', 'malvazijadarsonca.jpg', 'Dar sonca, dry', 6),
(22, 'Cabernet Sauvignon', 3.5, '0.1L', '85', 'redwine.png', 'Marques de Casa Concha, dry', 6),
(23, 'Cabernet Sauvignon', 24, '0.7L', '595', 'cabernetmarques.png', 'Marques de Casa Concha, dry', 6),
(24, 'Römerquelle', 2.5, '0.33L', NULL, 'romerquellenegazirana.png', NULL, 7),
(25, 'Römerquelle lemon grass', 2.5, '0.33L', NULL, 'romerquelletrava.png', NULL, 7),
(26, 'Absolut', 3.5, '0.03L', '250', 'absolutvodka.png', NULL, 9),
(27, 'Smirnoff', 3, '0.03L', '260', 'smirnoff.png', NULL, 9),
(30, 'Coffee with milk', 1.8, NULL, '30', 'coffeemilk.png', 'Illy', 4),
(31, 'coffee latte macchiato', 2.2, NULL, '50', 'lattemacchiato.png', 'Illy', 4),
(32, 'Coca Cola Zero', 2.5, '0.25L', '100', 'cocacolazero.png', NULL, 12),
(33, 'Coca Cola', 2.5, '0.25L', '105', 'cocacola.png', NULL, 12),
(34, 'Sprite', 2.5, '0.25L', '99', 'sprite.png', NULL, 12),
(35, 'Fanta', 2.5, '0.25L', '101', 'fanta.png', NULL, 12),
(36, 'Orange juice', 1.5, '0.1L', NULL, 'naturualorangejuice.png', NULL, 13),
(37, 'Apple juice', 1.5, '0.1L', NULL, 'naturualapplejuice.png', NULL, 13),
(38, 'Octopus salad', 12, NULL, NULL, 'octopus.png', NULL, 15),
(39, 'Margherita', 8.5, '33cm', NULL, 'margeritapizza.png', 'Tomato sauce, cheese, olive', 20),
(42, 'Navona', 9.5, '33cm', NULL, 'navona.png', 'Tomatoes, cheese, ham, mushrooms, artichokes, olive', 20),
(43, 'Garibaldi', 10.5, '33cm', NULL, 'garibaldi.png', 'Tomatoes, cheese, prosciutto, olive, Trieste sauce', 20),
(46, 'Verdi', 9.5, '33cm', NULL, 'verdi.png', 'Tomatoes, cheese, ham, Hungarian salami, ajvar, sour cream, olive', 20),
(47, 'Santa Croce', 10, '33cm', NULL, 'santacroce.png', 'Wholemeal dough, tomatoes, cheese, zucchini, rocket, cherry tomatoes, olives', 20),
(48, 'Popolo', 9.5, '33cm', NULL, 'popolo.png', 'Tomato sauce, cheese, mozzarella, fresh tomatoes, basil, olives', 20),
(49, 'Cuttlefish risotto on black', 11.5, NULL, NULL, 'cuttlefish.png', NULL, 19),
(52, 'Risotto with seafood', 13, NULL, NULL, 'rissotoseafood.png', NULL, 18),
(53, 'Spaghetti bolognese', 10, NULL, NULL, 'spagetibolonese.png', NULL, 18),
(54, 'Gnocchi with gorgonzola', 10.5, NULL, NULL, 'gorgonzola.png', NULL, 18),
(55, 'Ravioli', 14, NULL, NULL, 'ravioli.png', 'Ravioli with turkey, prawns, garlic, peperoncino', 18),
(56, 'Tuscan salad', 10.5, NULL, NULL, 'tuscansalad.png', 'salad mix and rocket with buffalo mozzarella, tomato datterini and Tuscan prosciutto', 17),
(57, 'Salad with roasted sheep cheese', 13.5, NULL, NULL, 'sheepcheese.png', NULL, 17),
(58, 'Pork ribs', 12.9, NULL, NULL, 'porkribs.png', 'Slow roasted pork ribs', 21),
(59, 'Grilled turkey', 11.9, NULL, NULL, 'griledturky.png', 'Grilled turkey with roasted vegetables, potatoes and herb butter', 21),
(60, 'Pumpkin soup with truffles', 5, NULL, NULL, 'pumpkinsoup.png', '', 16),
(61, 'Pad Thai with chicken', 9.9, NULL, NULL, 'padtai.png', '', 22);

-- --------------------------------------------------------

--
-- Struktura tabele `productorder`
--

CREATE TABLE `productorder` (
  `Product_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Product_total_price` float NOT NULL,
  `Product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `productorder`
--

INSERT INTO `productorder` (`Product_id`, `Order_id`, `Product_total_price`, `Product_quantity`) VALUES
(1, 6, 9, 3),
(1, 15, 9, 3),
(1, 17, 6, 2),
(1, 19, 3, 1),
(1, 21, 12, 4),
(1, 24, 12, 4),
(1, 32, 12, 4),
(1, 37, 18, 6),
(1, 39, 12, 4),
(1, 41, 3, 1),
(1, 43, 15, 5),
(1, 45, 12, 4),
(1, 46, 3, 1),
(1, 47, 15, 5),
(2, 7, 4, 2),
(2, 18, 8, 4),
(2, 19, 2, 1),
(2, 27, 8, 4),
(2, 35, 2, 1),
(2, 36, 6, 3),
(2, 38, 4, 2),
(2, 45, 6, 3),
(2, 46, 10, 5),
(3, 7, 7, 2),
(3, 19, 4, 1),
(3, 27, 14, 4),
(3, 36, 17.5, 5),
(3, 38, 7, 2),
(4, 7, 5, 2),
(4, 8, 10, 4),
(4, 11, 10, 4),
(4, 12, 3, 1),
(4, 13, 8, 3),
(4, 14, 13, 5),
(4, 16, 3, 1),
(4, 17, 8, 3),
(4, 18, 10, 4),
(4, 19, 13, 5),
(4, 20, 10, 4),
(4, 22, 10, 4),
(4, 23, 3, 1),
(4, 25, 10, 4),
(4, 26, 10, 4),
(4, 28, 10, 4),
(4, 29, 13, 5),
(4, 30, 10, 4),
(4, 31, 10, 4),
(4, 33, 10, 4),
(4, 34, 10, 4),
(4, 35, 3, 1),
(4, 36, 92.5, 37),
(4, 37, 2.5, 1),
(4, 38, 17.5, 7),
(4, 39, 2.5, 1),
(4, 40, 7.5, 3),
(4, 41, 7.5, 3),
(4, 42, 2.5, 1),
(4, 43, 2.5, 1),
(4, 44, 2.5, 1),
(4, 45, 7.5, 3),
(5, 8, 8, 4),
(5, 18, 10, 5),
(5, 19, 6, 3),
(5, 25, 8, 4),
(5, 26, 8, 4),
(5, 34, 2, 1),
(5, 36, 16, 8),
(5, 38, 2, 1),
(5, 40, 2, 1),
(5, 41, 6, 3),
(5, 42, 10, 5),
(5, 43, 2, 1),
(5, 48, 10, 4),
(6, 49, 1, 1),
(7, 19, 6, 4),
(8, 19, 5, 3),
(9, 19, 40, 4),
(30, 49, 1.8, 1),
(31, 49, 2.2, 1),
(38, 46, 11.9, 1),
(39, 46, 25.5, 3),
(42, 48, 38, 4),
(43, 48, 10.5, 1),
(43, 49, 10.5, 1),
(46, 49, 9.5, 1);

-- --------------------------------------------------------

--
-- Struktura tabele `producttype`
--

CREATE TABLE `producttype` (
  `ProductType_id` int(11) NOT NULL,
  `ProductType_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProductType_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `producttype`
--

INSERT INTO `producttype` (`ProductType_id`, `ProductType_name`, `ProductType_type`) VALUES
(1, 'Cider', 'Drink'),
(2, 'Draught beer', 'Drink'),
(3, 'Bottled beer', 'Drink'),
(4, 'Hot drinks', 'Drink'),
(5, 'Gin', 'Drink'),
(6, 'Wine', 'Drink'),
(7, 'Water', 'Drink'),
(8, 'Spirit', 'Drink'),
(9, 'Vodka', 'Drink'),
(10, 'Rum', 'Drink'),
(11, 'Tequila', 'Drink'),
(12, 'Bottled beverage', 'Drink'),
(13, 'Natural beverage', 'Drink'),
(14, 'Gin & Tonic', 'Drink'),
(15, 'Starter', 'Food'),
(16, 'Soup', 'Food'),
(17, 'Salad', 'Food'),
(18, 'Pasta', 'Food'),
(19, 'Rissoto', 'Food'),
(20, 'Pizza', 'Food'),
(21, 'Meat', 'Food'),
(22, 'Pad Thai', 'Food');

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
-- Indeksi tabele `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`),
  ADD KEY `IX_Relationship10` (`ProductType_id`);

--
-- Indeksi tabele `productorder`
--
ALTER TABLE `productorder`
  ADD PRIMARY KEY (`Product_id`,`Order_id`),
  ADD KEY `Relationship16` (`Order_id`);

--
-- Indeksi tabele `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`ProductType_id`);

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
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT tabele `product`
--
ALTER TABLE `product`
  MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT tabele `producttype`
--
ALTER TABLE `producttype`
  MODIFY `ProductType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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

--
-- Omejitve za tabelo `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Relationship10` FOREIGN KEY (`ProductType_id`) REFERENCES `producttype` (`ProductType_id`);

--
-- Omejitve za tabelo `productorder`
--
ALTER TABLE `productorder`
  ADD CONSTRAINT `Relationship15` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`),
  ADD CONSTRAINT `Relationship16` FOREIGN KEY (`Order_id`) REFERENCES `order` (`Order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
