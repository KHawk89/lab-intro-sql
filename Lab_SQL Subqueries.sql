-- How many copies of the film Hunchback Impossible exist in the inventory system?

select count(inventory_id) from inventory a 
join film b 
on a.film_id = b.film_id
where title = 'Hunchback Impossible';

-- List all films whose length is longer than the average of all the films.
    
 select * from film
where length > (
	select avg(length)
	from film
);   
    
-- Use subqueries to display all actors who appear in the film Alone Trip.
    
select * from actor
where actor_id in (
    select actor_id from (
		select actor_id from film_actor 
        where film_id in (
			select film_id
			from film
			where title = 'Alone Trip'
		)
     )sub1      
);


-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films

select * from film
where film_id in (
		select film_id from film_category 
        where category_id in (
			select category_id
			from category
			where name = 'Family'
		)
          
);
    
-- Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
 
 select * from address;
 select first_name, last_name, email, address_id from customer
 where address_id in(
	select address_id from address
	where city_id in (
		select city_id from city
		where country_id in(
			select country_id 
			from country
			where country = 'Canada'
        )
	)
 )
 order by address_id;
 
 
 select a.first_name, a.last_name, a.email from customer a
 join address b
 on a.address_id = b.address_id
 join city c 
 on b.city_id = c.city_id
 join country d
 on c.country_id = d.country_id
 where d.country = 'Canada';
 
    
-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has 
-- acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id 
-- to find the different films that he/she starred.

select title from film
where film_id in(
	select film_id from film_actor
	where actor_id in(
		select actor_id from (
			select actor_id, count(film_id) as appearances from film_actor 
			group by actor_id
			order by count(film_id) desc)sub1
		having max(appearances)
		)
 );

-- Films rented by most profitable customer. You can use the customer table and payment table to find the most 
-- profitable customer is the customer that has made the largest sum of payments

		select film_id, title from film
        where film_id in(
        select rental_id from rental 
        where customer_id in(
			select customer_id from 
        (
				select customer_id, sum(amount) as Balance from payment
				group by customer_id
				order by Balance desc
            )sub1 
		having max(Balance)
        )
        );

-- Customers who spent more than the average payments.

select customer_id, round(avg(amount),2) from payment
where amount > (
  select avg(amount)
  from payment
)
group by customer_id
order by round(avg(amount),2) desc;

