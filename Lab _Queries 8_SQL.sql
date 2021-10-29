-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
	-- In your output, only select the columns title, length, and the rank.
    
    use sakila;
    
   
    
    select title, length, dense_rank() over(order by length asc) as 'Rank'
    from film
    where length != 0 and length != 'NULL';
    
-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
	-- In your output, only select the columns title, length, rating and the rank.
    
    select title, length, rating, dense_rank() over(partition by rating order by length asc) as 'Rank'
    from film
    where length != 0 and length != 'NULL';
    
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query

select count(a.film_id), a.category_id, b.name, c.title
from film_category a
left join category b on b.category_id = a.category_id
left join film c on c.film_id = a.film_id
group by a.category_id;

-- Which actor has appeared in the most films?

select a.actor_id, count(a.film_id) as appearences, c.first_name, c.last_name
from film_actor a
left join actor c on c.actor_id = a.actor_id
group by a.actor_id
order by count(a.film_id) desc;

-- Most active customer (the customer that has rented the most number of films)

select count(a.rental_id) as loans, b.first_name, b.last_name
from rental a
left join customer b on b.customer_id = a.customer_id
group by a.customer_id
order by count(a.rental_id) desc;

-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement.
	--  Give it a try. We will talk about queries with multiple join statements later in the lessons.
    
 select a.inventory_id, count(b.rental_id) as rentals, c.title
 from inventory a
 left join rental b on b.inventory_id = a.inventory_id
 left join film c on c.film_id = a.film_id
 group by c.title
 order by count(b.rental_id) desc;