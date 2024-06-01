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

-- 3. ¿Cuál es el tiempo de ejecución promedio de las películas por categoría?


/*
4. ¿Qué categorías de películas son las más largas?
5. Muestra las películas más alquiladas en orden descendente.
6. Enumera los cinco principales géneros en ingresos brutos en orden descendente.
7. ¿Está "Academy Dinosaur" disponible para alquilar en la Tienda 1?
*/
