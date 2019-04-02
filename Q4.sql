WITH top_10 AS (SELECT CONCAT(c.first_name,' ',c.last_name) AS customer, c.customer_id AS customer_id, SUM(p.amount) AS sum
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10)
SELECT DATE_TRUNC('month', p.payment_date) AS month, customer, SUM(p.amount) AS sum
FROM top_10
JOIN payment p
ON top_10.customer_id = p.customer_id
GROUP BY 1,2
ORDER BY 2

