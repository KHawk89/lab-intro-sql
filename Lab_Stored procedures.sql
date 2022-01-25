-- Lab | Stored procedures
-- In the previous lab we wrote a query to find first name, last name, and emails of all the customers 
-- who rented Action movies. Convert the query into a simple stored procedure. Use the following query:

DELIMITER //
create procedure get_all_customers_action_proc()
begin
  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = 'Action'
  group by first_name, last_name, email;
end //
DELIMITER ; 

call get_all_customers_action_proc();

-- Now keep working on the previous stored procedure to make it more dynamic. 
-- Update the stored procedure in a such manner that it can take a string argument 
-- for the category name and return the results for all customers that rented movie of that 
-- category/genre. For eg., it could be action, animation, children, classics, etc.

DELIMITER //
create procedure get_all_customersbycat_proc(in param varchar(25))
begin
  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = param
  group by first_name, last_name, email;
end //
DELIMITER ; 

call get_all_customersbycat_proc('classics');

-- Write a query to check the number of movies released in each movie category. 
-- Convert the query in to a stored procedure to filter only those categories that have movies released greater 
-- than a certain number. Pass that number as an argument in the stored procedure.

select c.name, count(distinct(a.film_id)) as films_released from film a
join film_category b 
on a.film_id = b.film_id
join category c 
on b.category_id = c.category_id
group by c.name



delimiter //

create procedure release_proc (in param int)
begin
	select c.name, count(distinct(a.film_id)) as films_released from film a
	join film_category b 
	on a.film_id = b.film_id
	join category c 
	on b.category_id = c.category_id
    group by c.name
    having count(distinct(a.film_id)) > param;
end;
//
delimiter ;

call release_proc(60);

drop procedure IF EXISTS release_proc;
