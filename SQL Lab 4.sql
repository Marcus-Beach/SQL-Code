select rating, count(*) from film group by rating
select continent, round(avg(lifeexpectancy),0) as 'Avg Life Span' from country group by continent
select title, replacement_cost as 'Cost' from film where replacement_cost in (select max(replacement_cost) from film)
select continent, format(avg(GNP),'N') as 'Avg GNP' from country group by continent
select region, format(sum(surfacearea),'N') as 'Total Surface Area' from country group by region having sum(surfacearea) > 4000000 order by sum(surfacearea) desc
select region, max(population) as 'Max Population', avg(lifeexpectancy) as 'Average Life Expectancy' from country group by region
select continent, format(sum(GNP),'N') as 'Gross National Product' from country group by continent order by format(sum(GNP),'N') desc
select rating, format(avg(length),'N') as 'Average Runtime' from film group by rating