# How many distinct (different) actors' last names are there?

select count(distinct(last_name)) from sakila.actor;

# In how many different languages where the films originally produced? (Use the column language_id from the film table)

select count(distinct(language_id)) as different_languages from sakila.film;

# How many movies were released with "PG-13" rating?

select count(film_id) from sakila.film where rating = 'PG-13';

# Get 10 the longest movies from 2006.

select title, length from sakila.film where release_year = '2006' order by length DESC limit 10;

# How many days has been the company operating (check DATEDIFF() function)?

select datediff(max(rental_date),min(rental_date)) from sakila.rental;

# Show rental info with additional columns month and weekday. Get 20.

select *, month(rental_date) as month, weekday(rental_date) as weekday from sakila.rental limit 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *,dayname(rental_date),
case
when weekday(rental_date) <= 4 then 'weekday'
else 'weekend'
end as 'day_type'
from sakila.rental;

# How many rentals were in the last month of activity?

select count(rental_id) from sakila.rental where month(rental_date) = 8; 
