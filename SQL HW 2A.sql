--sakila

--select title, description, length from film where length > 100 and length < 140 order by length
--select top 5 title, rental_rate, rating from film where title like '%y'
--select top 5 title, rental_rate, description, release_year from film where rating = 'G' and description like '%Documentary%'
--select top 1 film_id, title, description from film where rating = 'PG' order by rental_rate

--world

--select * from city where CountryCode in ('NLD', 'BEL') and population > '50000' and name like 'A%' 
--select LocalName, HeadOfState, GNP from country where IndepYear > '1890' and Continent = 'Europe'
--select Name, Population, CountryCode from city where Population > '500000' and Name like 'S%'