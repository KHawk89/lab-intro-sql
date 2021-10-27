-- Drop column picture from staff.

alter table staff
drop column picture;
select * from staff;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

insert into staff values
	(3, 'Tammy', 'Sanders',5,' ',1,1,' ',' ','2010-03-15 04:27:35');
select * from staff;


-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
	-- You can use current date for the rental_date column in the rental table. Hint: 
	-- Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
	-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select * from rental;

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

  -- Use similar method to get inventory_id, film_id, and staff_id.

select film_id from sakila.film
where title = 'Academy Dinosaur' ;

select staff_id from sakila.staff
where first_name ='Mike' and last_name = 'Hillyer' ;

select * from sakila.inventory
where store_id = 1 and film_id = 1;

insert into rental values
	(16050, current_timestamp(),4,130,current_timestamp(),1,current_timestamp());
select * from rental order by rental_id desc limit 1;


-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for 
-- the users that would be deleted. Follow these steps:

select * from customer;

	-- Check if there are any non-active users
    
 select * from customer where active = 0;   
    
	-- Create a table backup table as suggested
    
 CREATE TABLE customer_backup (
  `customer_id` int UNIQUE NOT NULL, -- AS PRIMARY KEY
  `email` varchar(255) DEFAULT NULL,
  `create_date` date DEFAULT NULL, -- char() , varchar(255)
  CONSTRAINT PRIMARY KEY (customer_id)  -- constraint keyword is optional but its a good practice
);  

-- Insert the non active users in the table backup table
 
INSERT INTO customer_backup (customer_id, email, create_date)
SELECT customer_id, email, create_date
FROM customer
WHERE active = 0;

-- Delete the non active users from the table customer
SET FOREIGN_KEY_CHECKS = 0;
delete from customer where active = 0;
select * from customer where active = 0;
SET FOREIGN_KEY_CHECKS = 1;

