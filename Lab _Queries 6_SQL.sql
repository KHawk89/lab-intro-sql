drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned NOT NULL,
  `rental_duration` int NULL,
  `rental_rate` decimal(4,2) NULL, 
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

show variables like 'local_infile';
set global local_infile = 1;

show variables like 'secure_file_priv';
set sql_safe_updates = 0;

SET sql_mode = "";
SET FOREIGN_KEY_CHECKS=1;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL\ Server\ 8.0/Uploads/films_20201.csv' 
INTO TABLE films_2020
FIELDS TERMINATED BY ',';

UPDATE films_2020 SET rental_duration = 3;
UPDATE films_2020 SET rental_rate = 2.99;
UPDATE films_2020 SET replacement_cost = 8.99;


select * from films_2020;
