use sakila;
select* from actor;
select first_name from actor;
select * from film;
select title as New_title from film;
select * from film;
#Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select distinct name as language from language;
select* from inventory;
select count(store_id) from inventory;
#4581
#Find out how many employees staff does the company have?
select count(staff_id) from staff;
#2
select first_name from staff;
#mike and Jon



