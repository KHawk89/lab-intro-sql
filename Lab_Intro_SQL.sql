-- Explore tables by selecting all columns from each table or using the in built review features for your client.
use sakila;
select * from rental;
select * from actor ;
select * from category ;
select * from city ;
select * from country ;
select * from customer ;
select * from film ;
select * from film_actor ;
select * from film_category ;
select * from film_text ;
select * from inventory ;
select * from language ;
select * from payment ;
select * from staff ;
select * from store ;

-- Select one column from a table. Get film titles.

select title from sakila.film;

-- Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.

select title as film_title from sakila.film;
select distinct(name) from sakila.language;
select f.title, l.name from sakila.film as f join sakila.language as l on f.language_id = l.language_id;


-- Find out how many stores does the company have?

select count(distinct store_id) as number_of_stores from sakila.inventory;

-- Find out how many employees staff does the company have?

select * from sakila.staff;
select count(distinct staff_id) as number_of_employes from sakila.staff;

-- Return a list of employee first names only?

select first_name from sakila.staff;

