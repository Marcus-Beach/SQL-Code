select sum(replacement_cost) as Assets from film f join inventory i on f.film_id = i.film_id
select title, replacement_cost from film f join inventory i on f.film_id = i.film_id
select * from inventory
select c.email, count(*) as 'Total rentals' from customer c join rental r on r.customer_id = c.customer_id group by c.customer_id, c.email having count(*) > 25 order by count(*) desc
select r.customer_ID, c.first_name, c.last_name, c.email, count(*) as 'Overdue Rentals' from rental r join customer c on c.customer_id = r.customer_id where r.return_date is null group by r.customer_id, c.first_name, c.last_name, c.email having count(*) > 1 order by count(*) desc
select cl.countrycode, cl.language, c.name, mp.percentage from countrylanguage cl join (select countrycode, max(percentage) as percentage from countrylanguage group by countrycode) mp on mp.CountryCode = cl.CountryCode and mp.percentage = cl.Percentage join country c on mp.countrycode = c.code order by cl.CountryCode