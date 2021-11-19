-- List each pair of actors that have worked together.

select sub1.actor_id, sub1.film_id,sub2.actor_id, sub2.film_id from film_actor  sub1
join (select actor_id, film_id from film_actor) sub2
on sub1.actor_id > sub2.actor_id
and sub1.film_id = sub2.film_id;


-- For each film, list actor that has acted in more films.

select a.film_id, c.first_name, c.last_name from film_actor a
join film b 
on a.film_id = b.film_id
join actor c
on a.actor_id = c.actor_id
where a.actor_id in (
select a.actor_id from(
  select a.actor_id, count(film_id) as blobb from film_actor
		group by a.actor_id
        having blobb > 1)sub1
        )
        group by a.film_id,c.first_name, c.last_name ;





