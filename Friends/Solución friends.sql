-- Crea una base de datos llamada "friends". Esto creará dos nuevas tablas: usuarios y amistades.
-- Ejecutar archivo "DB friends.sql"
-- **************************************************************

-- Uso de BD
use friends;
-- **************************************************************

-- Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de usuarios junto con los 
-- nombres de sus amigos.
-- Resultado
SELECT concat(users.first_name, " ",users.last_name) as "Nombre Usuario", concat(user2.first_name, " ", user2.last_name) as "Nombre Amigo" 
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id;
-- **************************************************************

-- **************************************************************
-- Ejercicio Adicional
-- También escriba las consultas SQL necesarias para realizar las siguientes tareas:
-- **************************************************************

-- **************************************************************
-- 1. Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
SELECT concat(users.first_name, " ",users.last_name) as "Nombre Usuario", concat(user2.first_name, " ", user2.last_name) as "Nombre Amigo" 
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id and user2.first_name = "Kermit";

	
-- **************************************************************
-- 2. Devuelve el recuento de todas las amistades.
SELECT count(*) as "Cantidad de Amistades"
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id;

-- **************************************************************
-- 3. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
SELECT concat(users.first_name, " ",users.last_name) as "Nombre Usuario", count(*) as "Máxima Cantidad de Amistades"
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id
group by users.id;

-- **************************************************************
-- 4. Crea un nuevo usuario y hazlo amigo de Eli Byers, Kermit The Frog y Marky Mark.

select * from users;
INSERT INTO `users` VALUES (6,'Nuevo Nombre','Nuevo Apellido','2019-02-08 11:12:11',NULL);
select * from users;

select * from friendships;
INSERT INTO `friendships` VALUES (7,2,6,'2019-02-08 11:13:27',NULL),
(8,4,6,'2019-02-08 11:14:03',NULL),(9,5,6,'2019-02-08 11:14:38',NULL);
select * from friendships;

-- **************************************************************
-- 5. Devuelve a los amigos de Eli en orden alfabético.
SELECT concat(users.first_name, " ",users.last_name) as "Nombre Usuario", concat(user2.first_name, " ", user2.last_name) as "Nombre Amigo" 
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id and users.first_name = "Eli"
order by user2.first_name;

-- **************************************************************
-- 6. Eliminar a Marky Mark de los amigos de Eli.

SELECT * 
FROM friendships
WHERE friendships.user_id in (select id from users where first_name = "Eli")
and friendships.friend_id in (select id from users where first_name = "Marky");

DELETE 
FROM friendships
WHERE friendships.user_id in (select id from users where first_name = "Eli")
and friendships.friend_id in (select id from users where first_name = "Marky");

-- **************************************************************
-- 7. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
SELECT concat(users.first_name, " ",users.last_name) as "Nombre Usuario", concat(user2.first_name, " ", user2.last_name) as "Nombre Amigo" 
FROM users  
JOIN friendships  ON users.id = friendships.user_id 
JOIN users as user2 ON user2.id = friendships.friend_id
order by users.id;
-- **************************************************************
