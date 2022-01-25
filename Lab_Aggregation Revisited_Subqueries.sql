-- Write the SQL queries to answer the following questions:

    -- Select the first name, last name, and email address of all the customers who have rented a movie.

select first_name, last_name, email from customer
where customer_id in
(select distinct(customer_id) from rental
);

    -- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
create or replace view the_stuff as
(WITH     Payment_CTE (customer_id, balance)
AS       (SELECT customer_id,
                 avg(amount)
          FROM   payment
          group by customer_id
          ),
         Customer_CTE (customer_id, FirstName, LastName)
AS       (SELECT customer_id,
                 first_name,
                 last_name
                 FROM  customer
          )
SELECT   
         Payment_CTE.customer_id,
         Customer_CTE.FirstName,
         Customer_CTE.LastName,
         Payment_CTE.balance
FROM     Payment_CTE
         JOIN
         Customer_CTE
         ON Payment_CTE.customer_id = Customer_CTE.customer_id);


    -- Select the name and email address of all the customers who have rented the "Action" movies.
        -- Write the query using multiple join statements
        
        select first_name, last_name, email from customer a
        join rental b 
        on a.customer_id = b.customer_id
        join inventory c 
        on b.inventory_id = c.inventory_id
        join film_category d 
        on c.film_id = d.film_id
        where d.category_id = 1;
        
        -- Write the query using sub queries with multiple WHERE clause and IN condition
        
       select first_name, last_name, email from customer
       where customer_id in
       (select customer_id from rental 
       where inventory_id in
       (select inventory_id from inventory 
       where film_id in
       (select film_id from film_category
       where category_id = 1)));
        
        -- Verify if the above two queries produce the same results or not
		-- > Yes it does


    -- Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high.

select
  *,
  case when balance > 4.5 then 'high value Transaction' else 'low value transaction' end classification
from the_stuff;