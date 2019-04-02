SELECT f.title,ct.name,f.rental_duration as rental_duration,
4 * (rank() over (order by f.rental_duration)-1) / count(*) over ()+1 AS standard_quartile
FROM film AS f
JOIN film_category fc
ON fc.film_id = f.film_id
JOIN category AS ct
ON ct.category_id = fc.category_id
WHERE ct.name IN ('Animation','Children','Classics','Comedy','Family','Music')
group by 1,2,3;