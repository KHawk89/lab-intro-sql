-- Get all pairs of actors that worked together.

select a1.actor_id, a2.actor_id from film_actor a1
join film_actor a2
on a1.actor_id <> a2.actor_id
and a1.film_id = a2.film_id;
    
-- Get all pairs of customers that have rented the same film more than 3 times.
    
    
select a1.customer_id, a2.customer_id
from 
(select customer_id, count(rental_id) from rental
group by inventory_id
having count(rental_id) > 3) as a1 
join (select customer_id, count(rental_id) from rental
group by inventory_id
having count(rental_id) > 3) as a2
on a1.customer_id > a2.customer_id;


-- Get all possible pairs of actors and films.
    
 select * from (
	select distinct last_name from sakila.actor
) sub1
cross join (
	select distinct title from sakila.film
) sub2;   
