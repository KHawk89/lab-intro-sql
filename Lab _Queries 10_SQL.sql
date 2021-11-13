-- List number of films per category.

select count(a.film_id), c.name from film a
join film_category b
on a.film_id = b.film_id
join category c
on b.category_id = c.category_id
group by c.name;

-- Display the first and last names, as well as the address, of each staff member.

select a.first_name, a.last_name, b.address from staff a
join address b
on a.address_id = b.address_id;

-- Display the total amount rung up by each staff member in August of 2005.

-- > I dont find the column or values of ring up ?

-- List each film and the number of actors who are listed for that film.

select count(a.actor_id), c.title from film_actor a
join actor b 
on a.actor_id = b.actor_id
join film c
on a.film_id = c.film_id 
group by c.title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
	-- List the customers alphabetically by last name.

select sum(amount), a.customer_id, a.first_name, a.last_name from customer a
join payment b
on a.customer_id = b.customer_id
group by a.customer_id
order by a.last_name ASC;
