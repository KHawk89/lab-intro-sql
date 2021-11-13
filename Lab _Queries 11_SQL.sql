	-- Write a query to display for each store its store ID, city, and country.
    
    select b.store_id, c.city, d.country from address a
    join store b 
    on a.address_id = b.address_id
    join city c
    on a.city_id = c.city_id
    join country d
    on c.country_id =d.country_id
    group by b.store_id;
    
    -- Write a query to display how much business, in dollars, each store brought in.
    
    select a.store_id, sum(c.amount) from store a
    join staff b
    on a.store_id = b.store_id
    join payment c
    on b.staff_id = c.staff_id
    group by a.store_id;
    
    -- What is the average running time of films by category?
    
    select avg(a.rental_duration), c.name from film a
    join film_category b
    on a.film_id = b.film_id
    join category c
    on b.category_id = c.category_id
    group by c.name
    order by avg(a.rental_duration) desc;
    
    -- Which film categories are longest?
    
     select avg(a.length), c.name from film a
    join film_category b
    on a.film_id = b.film_id
    join category c
    on b.category_id = c.category_id
    group by c.name
    order by avg(a.length) desc;
    
    -- Display the most frequently rented movies in descending order.
    
    select a.title, count(c.rental_id) from film a
    join inventory b 
    on a.film_id = b.film_id
    join rental c 
    on b.inventory_id = c.inventory_id
    group by a.title
    order by count(c.rental_id) desc;
    
    
    -- List the top five genres in gross revenue in descending order.
    
    select e.name, sum(f.amount) from film a
    join inventory b 
    on a.film_id = b.film_id
    join rental c 
    on b.inventory_id = c.inventory_id
    join film_category d 
    on a.film_id = d.film_id
    join category e
    on d.category_id = e.category_id
    join payment f
    on c.rental_id = f.rental_id
    group by e.name
    order by sum(f.amount) desc
    limit 5;
    
    -- Is "Academy Dinosaur" available for rent from Store 1?
    select * from rental;
   select a.inventory_id, b.title from inventory a 
   join film b 
   on a.film_id = b.film_id
   where b.title = 'Academy Dinosaur' and a.store_id = '1' ;
    
