/*
Created: 1. 09. 2019
Modified: 28. 10. 2019
Model: MySQL 5.0
Database: MySQL 5.0
*/

-- Create tables section -------------------------------------------------

-- Table Food

CREATE TABLE `Food`
(
  `Food_id` Int NOT NULL AUTO_INCREMENT,
  `Food_name` Varchar(255) NOT NULL,
  `Food_price` Float NOT NULL,
  `Food_size` Varchar(255),
  `Food_calorie` Varchar(255),
  `Food_picture` Varchar(255),
  `Food_description` Varchar(255),
  `FoodType_id` Int NOT NULL,
  PRIMARY KEY (`Food_id`,`FoodType_id`)
)
;

-- Table Order

CREATE TABLE `Order`
(
  `Order_id` Int NOT NULL AUTO_INCREMENT,
  `Order_date` Date NOT NULL,
  `Order_time` Time NOT NULL,
  `Table_id` Int NOT NULL,
  PRIMARY KEY (`Order_id`,`Table_id`)
)
;

-- Table Drink

CREATE TABLE `Drink`
(
  `Drink_id` Int NOT NULL AUTO_INCREMENT,
  `Drink_name` Varchar(255) NOT NULL,
  `Drink_price` Float NOT NULL,
  `Drink_alcohol` Bool NOT NULL,
  `Drink_size` Varchar(255),
  `Drink_calorie` Varchar(255),
  `Drink_picture` Varchar(255),
  `Drink_description` Varchar(255),
  `DrinkType_id` Int NOT NULL,
  PRIMARY KEY (`Drink_id`,`DrinkType_id`)
)
;

-- Table OrderFood

CREATE TABLE `OrderFood`
(
  `Food_id` Int NOT NULL,
  `Order_id` Int NOT NULL,
  `Food_quantity` Int NOT NULL,
  `Food_total_price` Float NOT NULL,
  `Table_id` Int NOT NULL,
  `FoodType_id` Int NOT NULL
)
;

ALTER TABLE `OrderFood` ADD PRIMARY KEY (`Food_id`,`Order_id`,`Table_id`,`FoodType_id`)
;

-- Table Table

CREATE TABLE `Table`
(
  `Table_id` Int NOT NULL AUTO_INCREMENT,
  `Table_name` Varchar(255) NOT NULL,
  `Table_postion` Varchar(255),
  PRIMARY KEY (`Table_id`)
)
;

-- Table OrderDrink

CREATE TABLE `OrderDrink`
(
  `Order_id` Int NOT NULL,
  `Drink_id` Int NOT NULL,
  `Drink_quantity` Int NOT NULL,
  `Drink_total_price` Float NOT NULL,
  `Table_id` Int NOT NULL,
  `DrinkType_id` Int NOT NULL
)
;

ALTER TABLE `OrderDrink` ADD PRIMARY KEY (`Order_id`,`Drink_id`,`Table_id`,`DrinkType_id`)
;

-- Table FoodType

CREATE TABLE `FoodType`
(
  `FoodType_id` Int NOT NULL AUTO_INCREMENT,
  `Type_name` Varchar(255) NOT NULL,
  PRIMARY KEY (`FoodType_id`)
)
;

-- Table DrinkType

CREATE TABLE `DrinkType`
(
  `DrinkType_id` Int NOT NULL AUTO_INCREMENT,
  `Type_name` Varchar(255) NOT NULL,
  PRIMARY KEY (`DrinkType_id`)
)
;

-- Table User

CREATE TABLE `User`
(
  `User_id` Int NOT NULL AUTO_INCREMENT,
  `User_role` Varchar(255) NOT NULL,
  `User_name` Varchar(255) NOT NULL,
  `User_password` Varchar(255) NOT NULL,
  PRIMARY KEY (`User_id`)
)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `OrderFood` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`Food_id`, `FoodType_id`) REFERENCES `Food` (`Food_id`, `FoodType_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `OrderFood` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`Order_id`, `Table_id`) REFERENCES `Order` (`Order_id`, `Table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `OrderDrink` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`Order_id`, `Table_id`) REFERENCES `Order` (`Order_id`, `Table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `OrderDrink` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`Drink_id`, `DrinkType_id`) REFERENCES `Drink` (`Drink_id`, `DrinkType_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`Table_id`) REFERENCES `Table` (`Table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Food` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`FoodType_id`) REFERENCES `FoodType` (`FoodType_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Drink` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`DrinkType_id`) REFERENCES `DrinkType` (`DrinkType_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


