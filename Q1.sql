SELECT f.title AS film_title, ct.name AS category_name, count(*) AS rental_count
FROM 
film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS ct ON fc.category_id = ct.category_id
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE ct.name IN ('Animation','Children','Classics','Comedy','Family','Music')
GROUP BY f.title, ct.name
ORDER BY ct.name 
