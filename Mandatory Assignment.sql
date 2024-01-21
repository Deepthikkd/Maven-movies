use mavenmovies;

-- count the no of characters except spaces,return 1st 10 actors name lengths along with names
select concat_ws(" ",first_name,last_name) actor_name, 
length(concat(first_name,last_name)) name_length from actor limit 10;

-- List all oscar awardees with full names and length of their names
select concat_ws(" ",first_name,last_name) actor_name, 
length(concat(first_name,last_name)) name_length from actor_award 
where awards like '%oscar%';

-- find actors who have acted in film 'Frost Head'
select concat_ws(" ",a.first_name,a.last_name) actor_name from actor a 
inner join  film_actor fa 
on a.actor_id = fa.actor_id inner join film f on 
fa.film_id = f.film_id where f.title = 'Frost Head';

-- Pull all the films acteed by the actor 'Will Wilson'
select  f.title from film f  
inner join  film_actor fa 
on fa.film_id = f.film_id 
inner join  actor a 
on a.actor_id = fa.actor_id 
where concat_ws(" ",first_name,last_name) = 'Will Wilson';

-- pull all the films which were rented and return them in the month of may
select distinct f.title from film f 
inner join inventory i 
on f.film_id = i.film_id
inner join rental r 
on i.inventory_id = r.inventory_id 
where month(r.rental_date)=5 and month(r.return_date)=5;

-- pull all the films with comedy category
select f.title from film f 
inner join film_category fc 
on f.film_id = fc.film_id 
inner join category c 
on fc.category_id = c.category_id 
where c.name = 'Comedy'; 


