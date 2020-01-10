select top 10 * from film where description like '%Epic%' order by length
select top 10 * from film where rental_rate < 1 order by replacement_cost desc
select top 5 * from film where rating in('G', 'PG', 'PG-13') and description not like '%Documentary%' and length < 120 order by rental_rate
select top 10 * from film where description like '%database administrator%' order by length