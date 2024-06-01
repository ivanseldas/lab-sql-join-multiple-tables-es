/*
Lab | SQL Joins en múltiples tablas
En este laboratorio, utilizarás la base de datos Sakila de alquileres de películas.
*/

-- 1. Escribe una consulta para mostrar para cada tienda su ID de tienda, ciudad y país.
SELECT 
	store.store_id AS 'STORE ID',
    city.city AS 'CITY',
    country.country AS 'COUNTRY'
FROM
	store
INNER JOIN
	address ON store.store_id = address.address_id
INNER JOIN
	city ON address.address_id = city.city_id
INNER JOIN
	country ON city.country_id = country.country_id
ORDER BY
	store.store_id;
    
-- 2. Escribe una consulta para mostrar cuánto negocio, en dólares, trajo cada tienda.
SELECT
	customer.store_id AS 'STORE ID',
    SUM(payment.amount) AS 'TOTAL INCOME $'
FROM
	customer
INNER JOIN
	payment ON customer.customer_id = payment.customer_id
GROUP BY
	customer.store_id;

-- 3. ¿Cuál es el tiempo de ejecución (rental_duration?) promedio de las películas por categoría?
SELECT
	category.name AS 'CATEGORY',
    AVG(film.rental_duration) AS 'RENTAL DURATION AVERAGE'
FROM
	film
INNER JOIN
	film_category ON film.film_id = film_category.film_id
INNER JOIN
	category ON film_category.category_id = category.category_id
GROUP BY
	category.name;
    
-- 4. ¿Qué categorías de películas son las más largas?
SELECT
	category.name AS 'CATEGORY',
    AVG(film.length) AS 'AVERAGE LENGTH'
FROM
	film
INNER JOIN
	film_category ON film.film_id = film_category.film_id
INNER JOIN
	category ON film_category.category_id = category.category_id
GROUP BY
	category.name
ORDER BY 
	AVG(film.length) DESC;

-- 5. Muestra las películas más alquiladas en orden descendente.
SELECT 
	film.title AS 'FILM',
	COUNT(rental.rental_id) AS 'MOST RENTED'
FROM
	rental
INNER JOIN
	inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN
	film ON inventory.film_id = film.film_id
GROUP BY
	film.title
ORDER BY
	COUNT(rental.rental_id) DESC
LIMIT 10;

-- 6. Enumera los cinco principales géneros en ingresos brutos en orden descendente.
SELECT
	category.name AS 'GENRE',
	SUM(payment.amount) AS 'TOTAL INCOME $'
FROM
	payment
LEFT JOIN
	rental ON payment.rental_id = rental.rental_id
LEFT JOIN
	inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN
	film_category ON inventory.film_id = film_category.film_id
LEFT JOIN
	category ON film_category.category_id = category.category_id
GROUP BY
	category.name
ORDER BY
	SUM(payment.amount) DESC
LIMIT 5;

-- 7. ¿Está "Academy Dinosaur" disponible para alquilar en la Tienda 1?
SELECT 
	film.title AS 'FILM',
    inventory.inventory_id AS 'INVENTORY'
FROM 
	store
INNER JOIN
	inventory ON store.store_id = inventory.store_id
INNER JOIN
	film ON inventory.film_id = film.film_id
WHERE 
	film.title = 'ACADEMY DINOSAUR' AND inventory.store_id = 1;