-- **************************************************************
-- Respuestas a Sakila - Consultas (Queries)
-- **************************************************************
-- Base de Datos Usada
USE sakila;
-- **************************************************************

-- **************************************************************
-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT b.city_id, a.first_name, a.last_name, a.email, c.address
FROM customer a, city b, address c 
WHERE b.city_id = 312 and b.city_id = c.city_id and a.address_id = c.address_id;
-- **************************************************************

-- **************************************************************
-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
-- las características especiales y el género (categoría).
SELECT a.film_id, a.title, a.description, a.release_year, a.rating, a.special_features, c.name as "Género"
FROM film a, film_category b, category c 
WHERE c.name = "Comedy" and b.category_id = c.category_id and a.film_id = b.film_id;
-- **************************************************************

-- **************************************************************
-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
-- la descripción y el año de lanzamiento.
SELECT b.actor_id, concat(b.first_name, " ", b.last_name) as NombreActor, c.film_id, a.title, a.description, a.release_year
FROM film a, actor b, film_actor c
WHERE b.actor_id = 5 and b.actor_id = c.actor_id and a.film_id = c.film_id;
-- **************************************************************

-- **************************************************************
-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
SELECT a.store_id, b.city_id, a.first_name, a.last_name, a.email, d.address
FROM customer a, city b, store c, address d
WHERE a.store_id = 1 and a.store_id = c.store_id and b.city_id in (1, 42, 312, 459) 
and a.address_id = d.address_id and b.city_id = d.city_id;
-- **************************************************************

-- **************************************************************
-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
-- "característica especial = detrás de escena", unidas por actor_id = 15? 
-- Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, 
-- la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
SELECT a.title, a.description, a.release_year, a.rating, a.special_features
FROM film a, actor b, film_actor c
WHERE a.rating = "G" and a.special_features like "%Behind the Scenes%" and b.actor_id = 15 
and b.actor_id = c.actor_id and a.film_id = c.film_id;
-- **************************************************************

-- **************************************************************
-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.
SELECT a.film_id, a.title, b.actor_id, concat(b.first_name, " ", b.last_name) as NombreActor
FROM film a, actor b, film_actor c
WHERE a.film_id = 369 and b.actor_id = c.actor_id and a.film_id = c.film_id;
-- **************************************************************

-- **************************************************************
-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
-- las características especiales y el género (categoría).
SELECT a.film_id, a.title, a.description, a.release_year, a.rating, a.special_features, c.name as "Género", a.rental_rate
FROM film a, film_category b, category c 
WHERE a.rental_rate = 2.99 and c.name = "Drama" and b.category_id = c.category_id and a.film_id = b.film_id;
-- **************************************************************

-- **************************************************************
-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
-- las características especiales, el género (categoría) y el nombre y apellido del actor.
SELECT b.actor_id, concat(b.first_name, " ", b.last_name) as NombreActor, c.film_id, a.title, 
a.description, a.release_year, a.rating, a.special_features, e.name as "Género"
FROM film a, actor b, film_actor c, film_category d, category e
WHERE b.first_name = "SANDRA" and b.last_name = "KILMER" and b.actor_id = c.actor_id and a.film_id = c.film_id and 
e.name = "Action" and d.category_id = e.category_id and a.film_id = d.film_id;
-- **************************************************************


