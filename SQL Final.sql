--select fa.actor_id, a.first_name, a.last_name, count(*) as numfilms from film_actor fa join actor a on fa.actor_id = a.actor_id join film_category fc on fc.film_id = fa.film_id join category c on c.category_id = fc.category_id where c.name = 'Action' group by fa.actor_id, a.first_name, a.last_name order by count(*) desc
--select top 5 o.name, l.language, sum(o.population * l.percentage / 100) as totalspeakers  from country o join countrylanguage l on o.Code = l.CountryCode where l.Language = 'french' group by o.name, l.Language order by sum(o.population * l.percentage / 100) desc
--Using MSSQL
--select customer_id, amount from payment
--select customer_id, sum(amount) as 'total amount' from payment group by customer_id
--select p.customer_id, c.first_name, c.last_name, sum(p.amount) as 'total amount' from payment p join customer c on p.customer_id = c.customer_id group by p.customer_id, c.first_name, c.last_name
--select top 1 p.customer_id, c.first_name, c.last_name, sum(p.amount) as 'total amount' from payment p join customer c on p.customer_id = c.customer_id group by p.customer_id, c.first_name, c.last_name order by sum(p.amount) desc
--select top 5 p.customer_id, c.first_name, c.last_name, sum(p.amount) as 'total amount' from payment p join customer c on p.customer_id = c.customer_id group by p.customer_id, c.first_name, c.last_name order by sum(p.amount)

--Using MSSQL
--select countrycode, language, percentage from countrylanguage where (Language = 'Chinese' and Percentage > '70') or (Language = 'Arabic' and Percentage > '95')
--select countrycode, language, percentage from countrylanguage where (Language = 'Chinese' and Percentage > '70') or (Language = 'Arabic' and Percentage > '95') order by Language, Percentage
--select o.name, l.Language, l.Percentage, format((o.Population * l.Percentage / 100),'N0') as 'total speakers' from country o join countrylanguage l on o.Code = l.CountryCode where (l.Language = 'Chinese' and l.Percentage > '70') or (l.Language = 'Arabic' and l.Percentage > '95') order by l.Language, l.Percentage

--Using MSSQL
--select top 10 district, sum(population) as 'district population' from city group by district order by sum(population) desc

--Using MSSQL
--select top 1 borough, count(*) as 'number of incidents of crime' from NewYork group by Borough order by count(*)
--select count(*) as 'number of parks' from (select distinct parksname from NewYork where parksname != '0') as parks
--select top 1 parksname, count(*) as 'number of incidents of crime' from NewYork where ParksName != '0' group by ParksName order by count(*) desc
--select count(*) as 'number of bicycle crimes' from (select * from NewYork where DescriptionCd like '%bicycle%') as bikecrimes
--select count(*) as 'misdemeanors with weapons' from (select * from NewYork where LawCatCode = 'misdemeanor' and (DescriptionCd like '%weapon%')) as misdWithWeapon
--select top 1 month(reportdate) as 'Month', count(*) as 'number of crimes' from NewYork group by month(reportdate) order by count(*) desc

--Using MSSQL
--Jurisdiction, 17
--select count(*) as 'number of jurisdictions' from (select distinct jurisdiction from NewYork) as numJur
--LawCatCode, 3
--select count(*) as 'number of crime types' from (select distinct LawCatCode from NewYork) as numCrimeTypes
--Borough, Queens
--select top 1 Borough, num_crimes from (select top 2 Borough, count(*) as num_crimes from NewYork group by Borough order by count(*)) as twoSafest order by num_crimes desc
--Inside
--select top 1 LocationOfOccurance, count(*) as 'number of crimes' from NewYork where LocationOfOccurance in ('inside', 'front of') group by LocationOfOccurance order by count(*) desc