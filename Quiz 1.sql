--select top 10 district as state, sum(population) as population from city where CountryCode = 'USA' group by district order by sum(population) desc
--select name, population, lifeexpectancy from country where population >= 10000000 and population <= 20000000 and LifeExpectancy < 40

