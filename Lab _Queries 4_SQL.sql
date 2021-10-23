# Get film ratings.

select rating from sakila.film;

# Get release years.

select release_year from sakila.film;

# Get all films with ARMAGEDDON in the title.

select * from sakila.film where title regexp 'ARMAGEDDON';

# Get all films with APOLLO in the title

select * from sakila.film where title regexp 'APOLLO';

# Get all films which title ends with APOLLO.

select * from sakila.film where title like '%_APOLLO';

# Get all films with word DATE in the title.

select * from sakila.film where title regexp 'DATE';

# Get 10 films with the longest title.

select * from sakila.film order by length(title) DESC limit 10;

# Get 10 the longest films.

select * from sakila.film order by length DESC limit 10;

# How many films include Behind the Scenes content?

select * from sakila.film where special_features like '%Behind_the_Scenes%';

# List films ordered by release year and title in alphabetical order.

select * from sakila.film order by release_year and title asc;



