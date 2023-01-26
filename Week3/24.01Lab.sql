use sakila;
#1. Which actor has appeared in the most films?
select count(film_id), first_name, last_name  from actor inner join film_actor using(actor_id)
group by actor_id order by count(film_id) desc limit 1;

#2. Most active customer (the customer that has rented the most number of films)
select count(rental_id), first_name, last_name from rental inner join customer using(customer_id)
group by customer_id
order by count(rental_id)
desc
limit 1;

#3 List number of films per category.
select `name`, count(film_id) from film_category inner join category using(category_id)
group by category_id;

#4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address.address from address inner join staff using(address_id);

#5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
select title, language.name from film inner join sakila.language using(language_id)
where language.name = ('English' or 'italian') and title like 'M%';

#6. Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) from payment inner join staff using(staff_id)
where payment_date like '2005-08-%'
group by staff_id;

#7. List each film and the number of actors who are listed for that film.
select title, count(actor_id) from film_actor LEFT join film using(film_id)
group by film_id
order by count(actor_id)
desc;

#8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name
select first_name, last_name, sum(amount) from customer inner join payment using(customer_id)
group by customer_id
order by last_name
limit 10;

#9 Write sql statement to check if you can find any actor who never particiapted in any film.
select actor_id as Actor from film_actor left join film using(film_id)
where film_id is null;

#10 get the addresses that have NO customers, and ends with the letter "e"
select first_name, last_name, address from address left join customer using(address_id)
where first_name is null and last_name is null and address like '%e';

#11: what is the most rented film?
select title, count(film_id) from film inner join inventory using(film_id)inner join rental using(inventory_id)
group by title
order by count(film_id)
desc limit 1;

#12. Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store join address using(address_id) join country using(country_id);