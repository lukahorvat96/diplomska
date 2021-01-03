
CREATE TABLE `User`
(
  `User_id` Int NOT NULL AUTO_INCREMENT,
  `User_role` Varchar(255) NOT NULL,
  `User_name` Varchar(255) NOT NULL,
  `User_password` Varchar(255) NOT NULL,
  PRIMARY KEY (`User_id`)
)
;

ALTER TABLE `User` ADD PRIMARY KEY (`User_id`)
;

