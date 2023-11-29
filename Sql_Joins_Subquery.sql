-- Question 1

select customer_id, district
from customer
full join address
on customer.address_id = address.address_id 
where district = 'Texas'

--Question 2
select amount, first_name, last_name
from customer
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99
order by amount desc;

-- Question 3
select first_name, last_name
from customer 
where customer_id  in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) > 175
)

-- Question 4
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id 
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal';

--Question 5

select staff_id , count(distinct payment_id)
from payment 
group by staff_id
order by count(distinct payment_id) desc;

-- Question 6
select rating, count(film_id)
from film
group by rating;

-- Question 7
select amount, customer_id
from payment
where amount > 6.99 and customer_id in (
	select  customer_id 
	from customer
	group by customer_id 
	);

-- Question 8
select count(amount) ,count(distinct rental_id)
from payment 
where amount < 0 ;


