-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor 
	-- by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
	-- These three actors have the same last name. So we do not want to include this last name in our output. 
	-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
    
use sakila;
    
select *, count(last_name) from actor 
group by last_name;
    
    -- Which last names appear more than once? We would use the same logic as in the previous 
		-- question but this time we want to include the last names of the actors where the last name was present more than once

select *, count(last_name) from actor 
group by  last_name
having count(last_name) > 1;
        
    -- Using the rental table, find out how many rentals were processed by each employee.
    
 select staff_id , count(rental_id) from rental
 group by staff_id;   
    
    -- Using the film table, find out how many films were released each year.

select release_year, count(film_id)  from film
group by release_year;

    
    -- Using the film table, find out for each rating how many films were there.
    
select rating, count(film_id)  from film
group by rating;    
    
    -- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
    
select rating, avg(length) from film
group by rating;  
    
    
    -- Which kind of movies (rating) have a mean duration of more than two hours?
    
select rating, avg(length) as duration from film
group by rating
having avg(length) > 120;

