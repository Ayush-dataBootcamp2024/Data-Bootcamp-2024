use sakila;

show tables;

-- Basic Level-- 

-- 1. List all actors in the database.
select * from Actor;

-- 2. Retrieve the first and last names of all customers.
select first_name, last_name from customer;

-- 3. Find all films with a rating of 'PG'.
select * from film
where rating = 'pg';

-- 4.	List the titles of films released in 2006.
select title from film
where release_year = 2006;

-- 5.	Count the number of films in the database.
select count(*) as The_number_of_films from film;

-- 6.	Find the email addresses of all customers.
select email from customer;

-- 7.	List all the unique cities where stores are located.
select distinct city from city;

-- 8.	Retrieve the first and last names of all staff members.
SELECT first_name, last_name FROM STAFF

-- 10.	List the titles of films that have 'Love' in their title.
Select title from film
where title like "%Love%";

-- 13.	Find the average rental rate of all films.
select avg(rental_rate) from film;


-- 14.	List the titles of films that have a rental duration of 7 days.
select title, rental_duration from film 
where rental_duration = 7;

-- 16.	Find the total amount of payments made by each customer.
select customer_id, sum(amount) as Total_Payment from payment
group by customer_id;	

-- 17.	List the titles of films that have a replacement cost greater than $20.
select title from film
where replacement_cost > 20;

-- 21.	Find the titles of films that have a length greater than 120 minutes.
selecT title, length from film
where length > 120
order by length desc;

-- 22.	Retrieve the first and last names of customers who have not rented any films.
select first_name, last_name, active from customer
where active = 0;

select 
	customer.first_name,
    customer.last_name
from 
customer
	left join rental using (customer_id)
where rental.rental_date is null;


-- 23.	List the titles of films that have a rental rate less than $2.
select title, rental_rate from film where rental_rate < 2;

-- 7.	List all the unique cities where stores are located.
select distinct
	city.city,
    address.city_id,
    store.store_id
from city
 inner join address using(city_id)
 inner join store using(address_id);

-- 9.	Find all films that have 'Action' in their category.
select 
category.name as category,
film.title,
film.film_id
from film
inner join film_category using(film_id)
inner join category using(category_id)
where category.name = "Action";

-- (using film as the base table)
select 
	film.title,
	film.film_id,
    category.name as category
from film
 inner join film_category using(film_id)
 inner join category using(category_id)
 where category.name like "Action";

-- -- (using category as the base table)
select 
	film.title,
	film.film_id,
    category.name as category
from category
inner join film_category using(category_id)
inner join film using(film_id)
where category.name = "Action";


-- 11.	Count the number of customers in each city.
select 
city.city,
count(*) as no_of_customers 
from city
inner join address using (city_id)
inner join customer using (address_id)
group by city
order by no_of_customers desc;

select
	city.city,
    count(*) as No_of_customers 
    from customer
 
join address using(address_id)
join city using(city_id)
group by city
order by No_of_customers desc;


-- 12.	Retrieve the first and last names of customers who have rented more than 5 films.
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    COUNT(*) AS No_of_films_rented
FROM customer
JOIN rental using(customer_id)
GROUP BY customer_id
HAVING COUNT(*) > 5;

SELECT 
    customer.first_name,
    customer.last_name,
    customer.customer_id,
    COUNT(*) AS number_of_rentals
FROM rental
JOIN customer USING(customer_id)
GROUP BY customer.customer_id, customer.first_name, customer.last_name
Having COUNT(*) > 5
ORDER BY number_of_rentals;


-- 15.	Retrieve the first and last names of customers who have made payments greater than $5.
select 
customer.customer_id,
customer.first_name,
customer.last_name,
sum(payment.amount) as total_payment
from 
payment
join customer using(customer_id)
group by customer_id
having total_payment > 5;

-- 18.	Retrieve the first and last names of customers who live in California.
select
first_name, last_name, district
from customer
join address using (address_id)
where district = "california";

-- 19.	Find the titles of films that have been rented in the last month.
-- select film.title, rental.return_date from film join customer using (customer_id);


-- 20.	List the first and last names of customers who have rented films in the last week.
select distinct
customer.first_name,
customer.last_name,
rental.rental_date
from rental
join customer using (customer_id)
where rental_date <= date_sub(curdate(), interval 7 day);

-- 24.	Find the names of actors who have appeared in more than 10 films.
select 
actor.first_name,
actor.last_name,
count(film_id) as No_of_films
from film_actor
join actor using (actor_id)
group by first_name, last_name
having count(film_actor.film_id)>10;
-- having no_of_films > 10;

select 
	actor.actor_id,
	actor.first_name,
    actor.last_name
from actor
 inner join film_actor using(actor_id)
 group by actor_id
 having count(film_actor.film_id)>10;


-- 25.	Retrieve the first and last names of customers who have a balance greater than $10.
SELECT
customer.first_name,
customer.last_name,
sum(payment.amount) AS balance
FROM payment
JOIN customer USING (customer_id)
GROUP BY customer_id
HAVING Balance > 10;

SELECT 
    customer.first_name, 
    customer.last_name,
    SUM(payment.amount) AS total_balance
FROM    
    customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE 
    customer.customer_id IN (
        SELECT customer_id 
        FROM payment
        GROUP BY customer_id
        HAVING SUM(amount) > 10
    )
GROUP BY customer.customer_id, customer.first_name, customer.last_name;    

 
 
 
-- Intermediate Level --

-- 26.	Find the total revenue generated by each store.
SELECT 
store.store_id,
SUM(payment.amount) AS TOTAL_REVENUE
FROM
staff
JOIN store USING(store_id)
JOIN payment USING(staff_id)
GROUP BY store_id;

-- 30.	List the first and last names of customers who have rented films with a rating of 'R'.
Select Distinct
customer.first_name,
customer.last_name,
film.rating
From
customer
Join rental using (customer_id)
Join inventory using (store_id)
JOin film using (film_id)
Where rating = 'R';

-- 31.	Find the titles of films that have been rented by customers living in New York.
select 
	film.title,
	city.city
from 
inventory
	join store using (store_id)
	join address using (address_id)
    join city using (city_id)
    join film using (film_id)
where city = "New York";

-- 32.	Retrieve the first and last names of customers who have rented films in the last year.
select
	customer.first_name, customer.last_name,
    rental.rental_date
from customer
	join rental using (customer_id)
where rental_date = date_sub(curdate(), interval 1 year);
    
-- 33.	List the titles of films that have been rented by more than 20 different customers.
select 
	film.title,
    count(distinct customer_id) as num_of_customers
from customer
	Join rental using (customer_id)
	Join inventory using (inventory_id)
	Join film using (film_id)
group by title
having num_of_customers > 20;

-- 34.	Find the average length of all films in each category.
SELECT 
	category.name as category,
	avg(film.length)
FROM
film_category
	JOIN film using(film_id)
	JOIN category using(category_id)
GROUP BY category.name;
    
-- 35.	Retrieve the first and last names of customers who have rented films with a replacement cost greater than $30.
SELECT 
    customer.first_name,
    customer.last_name,
    SUM(film.replacement_cost) AS replacement_cost
FROM
    customer
        JOIN
    rental USING (customer_id)
        JOIN
    inventory USING (inventory_id)
        JOIN
    film USING (film_id)
GROUP BY customer_id
HAVING replacement_cost > 30;

-- 	36.	List the titles of films that have been rented by customers who have made payments greater than $10.
Select
	film.title as film_title,
	sum(payment.amount) as total_payments
from 
	film
inner join inventory using(film_id)
join rental using (inventory_id)
join payment using(rental_id)
group by film_title
having total_payments > 10
order by total_payments desc;

-- 37.	Find the total number of rentals made by each customer.
select
	customer_id,
	customer.first_name, last_name,
	count(customer_id) as num_of_rentals
from customer
right join rental using (customer_id)
group by customer_id
order by num_of_rentals desc;


	


