-- Select all the actors with the first name ‘Scarlett’.

select first_name, last_name from sakila.actor where first_name = 'Scarlett';

-- Select all the actors with the last name ‘Johansson’.

select first_name, last_name from sakila.actor where last_name = 'Johansson';

-- How many films (movies) are available for rent?

select count(distinct film_id) from sakila.film;

-- How many films have been rented?

select count(distinct rental_id) from sakila.rental;

-- What is the shortest and longest rental period?

select column_name,data_type from information_schema.columns where table_schema = 'sakila' and table_name = 'rental';

select max(timestampdiff(day, rental_date, return_date)) as rental_period from sakila.rental;
select min(timestampdiff(hour, rental_date, return_date)) as rental_period from sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select max(length) as max_duration, min(length) as min_duration from sakila.film;


-- What's the average movie duration?

select round(avg(length),0) as avg_duration from sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?

select CONCAT(FLOOR(avg(length)/60),'h ',MOD(round(avg(length),0),60),'m') as avg_duration from sakila.film;

-- How many movies longer than 3 hours?

select CONCAT(FLOOR(length/60),'h ',MOD(length,60),'m') as duration from sakila.film where CONCAT(FLOOR(length/60),'h ',MOD(length,60),'m') > '3h';

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.

select column_name,data_type from information_schema.columns where table_schema = 'sakila' and table_name = 'customer';
select * from sakila.customer;
select concat(first_name," ", last_name," -- " , email) as person from sakila.customer;

-- What's the length of the longest film title?

select title, max(CONCAT(FLOOR(length/60),'h ',MOD(length,60),'m')) as longest_duration from sakila.film;

