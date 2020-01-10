select top 10 i.name as city, o.name as country, o.LifeExpectancy from city i join country o on o.Code = i.CountryCode order by o.LifeExpectancy desc
select i.name as city, o.name as country, l.Language, i.population from city i join countrylanguage l on l.CountryCode = i.CountryCode join country o on o.Code = i.CountryCode where l.Language = 'Spanish' and l.IsOfficial = 'T' order by o.Population desc
select f.title, f.film_id from film f join film_actor fa on fa.film_id = f.film_id join actor a on fa.actor_id = a.actor_id where a.first_name = 'Kevin' and a.last_name = 'Bloom'
select f.title, f.description, c.name as category from film f join film_category fc on fc.film_id = f.film_id join category c on fc.category_id = c.category_id where c.name = 'Documentary' and f.description not like '%documentary%' order by f.title

select c.name, 
c.Population, 
l.Language, 
l.Percentage, 
format((c.Population * (l.Percentage / 100)),'N0') as Speakers 
from country c 
join countrylanguage l 
on c.Code = l.CountryCode

select o.name as country, i.name as capital from country o join city i on o.Capital = i.ID order by o.Name