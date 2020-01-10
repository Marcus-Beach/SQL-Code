select distinct district from city order by district
select distinct language from countrylanguage
select top 50 * from city order by population 
select top 25 * from country order by surfacearea desc
select * from country where governmentform in('Republic', 'Federal Republic', 'Constitutional Monarchy')
select top 5 * from city where countrycode in(select code from country where surfacearea < '10000') order by population desc