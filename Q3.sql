WITH t1 AS (
SELECT ct.name,
NTILE (4) OVER (ORDER BY rental_duration) AS standard_quartile
FROM film AS f
JOIN film_category fc
ON fc.film_id = f.film_id
JOIN category AS ct
ON ct.category_id = fc.category_id
WHERE ct.name IN ('Animation','Children','Classics','Comedy','Family','Music'))
SELECT name,standard_quartile, Count(name) AS count
FROM t1
GROUP BY 1,2
ORDER BY 1,2;