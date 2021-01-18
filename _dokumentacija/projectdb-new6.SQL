/*
Created: 1. 09. 2019
Modified: 17. 01. 2021
Model: MySQL 5.0
Database: MySQL 5.0
*/

-- Create tables section -------------------------------------------------

-- Table Product

CREATE TABLE `Product`
(
  `Product_id` Int NOT NULL AUTO_INCREMENT,
  `Product_name` Varchar(255) NOT NULL,
  `Product_price` Float NOT NULL,
  `Product_size` Varchar(255),
  `Product_calorie` Varchar(255),
  `Product_picture` Varchar(255),
  `Product_description` Varchar(255),
  `ProductType_id` Int,
  PRIMARY KEY (`Product_id`)
)
;

CREATE INDEX `IX_Relationship10` ON `Product` (`ProductType_id`)
;

-- Table Order

CREATE TABLE `Order`
(
  `Order_id` Int NOT NULL AUTO_INCREMENT,
  `Order_start` Datetime NOT NULL,
  `Order_end` Datetime NOT NULL,
  `Table_id` Int,
  `User_id` Int,
  `Order_status` Varchar(255) NOT NULL,
  PRIMARY KEY (`Order_id`)
)
;

CREATE INDEX `IX_Relationship13` ON `Order` (`Table_id`)
;

CREATE INDEX `IX_Relationship14` ON `Order` (`User_id`)
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

-- Table ProductType

CREATE TABLE `ProductType`
(
  `ProductType_id` Int NOT NULL AUTO_INCREMENT,
  `ProductType_name` Varchar(255) NOT NULL,
  `ProductType_type` Varchar(255) NOT NULL,
  PRIMARY KEY (`ProductType_id`)
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

-- Table ProductOrder

CREATE TABLE `ProductOrder`
(
  `Product_id` Int NOT NULL,
  `Order_id` Int NOT NULL,
  `Product_total_price` Int NOT NULL,
  `Product_quantity` Float NOT NULL
)
;

ALTER TABLE `ProductOrder` ADD PRIMARY KEY (`Product_id`,`Order_id`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Product` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`ProductType_id`) REFERENCES `ProductType` (`ProductType_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`Table_id`) REFERENCES `Table` (`Table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship14` FOREIGN KEY (`User_id`) REFERENCES `User` (`User_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ProductOrder` ADD CONSTRAINT `Relationship15` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ProductOrder` ADD CONSTRAINT `Relationship16` FOREIGN KEY (`Order_id`) REFERENCES `Order` (`Order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


