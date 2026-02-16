/*

1️. Obtener el título y año de estreno de todas las películas, ordenadas por año de estreno descendente.

2. Obtener el nombre y fecha de nacimiento de los actores nacidos desde el 01 de enero de 1975.

3. Obtener los actores cuyo nombre comience con la letra 'B'.

4. Obtener los actores cuyo nombre termine con la letra 'T', ordenados por fecha de nacimiento descendente.

5. Obtener los directores cuyo nombre contenga las letras 'V' o 'W'.

6. Obtener los directores cuyo nombre no contenga las letras 'V' o 'W'.

7. Obtener el título y año de las películas estrenadas en el año 1980 o antes.

8. Obtener las 5 películas con más recaudación, ordenadas de manera descendente según su recaudación. Mostrar título, año, cantidad de espectadores y recaudación.

9. Obtener todas las personas que tengan las 5 vocales en su nombre.

10. Obtener la lista de años en que se estrenaron películas. Eliminar duplicados y ordenar de manera ascendente.

11. Utilizando subqueries (subconsultas), obtener los títulos de las películas dirigidas por Christopher Nolan.

12. Utilizando subqueries, obtener los nombres de los actores nacidos en Reino Unido. Ordenar por nombre.

13. Utilizando subqueries, obtener todas las películas de "20th Century Fox" (cualquiera sea su año de estreno) y además, sin importar su estudio, aquellas que fueron estrenadas luego de 2010.

14. Utilizando subqueries, obtener todas las películas de "Warner Bros" estrenadas en 2015 o años posteriores.

*/

-- Soluciones

-- 1. 
SELECT title, release_year FROM movies ORDER BY release_year DESC;

-- 2. 
SELECT name, birth_date FROM people WHERE birth_date >= '1975-01-01' AND category = 'Actor';

-- 3. 
SELECT name FROM people WHERE name LIKE 'B%' AND category = 'Actor';

-- 4. 
SELECT name FROM people WHERE name LIKE '%T' AND category = 'Actor' ORDER BY birth_date DESC;

-- 5. 
SELECT name FROM people WHERE (name LIKE '%V%' OR name LIKE '%W%') AND category = 'Director';

-- 6. 
SELECT name FROM people WHERE (name NOT LIKE '%V%' AND name NOT LIKE '%W%') AND category = 'Director';

-- 7. 
SELECT title, release_year FROM movies WHERE release_year <= 1980;

-- 8. 
SELECT title, release_year, total_viewers, total_revenue FROM movies ORDER BY total_revenue DESC LIMIT 5;

-- 9. 
SELECT name FROM people WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';

-- 10. 
SELECT DISTINCT release_year FROM movies ORDER BY release_year ASC;

-- 11. 
SELECT title FROM movies WHERE director_id = (SELECT people_id FROM people WHERE name = 'Christopher Nolan');

-- 12. 
SELECT name FROM people WHERE country_of_birth_id = (SELECT country_id FROM countries WHERE country_name = 'Reino Unido') ORDER BY name;

-- 13. 
SELECT title, release_year FROM movies WHERE studio_id = (SELECT studio_id FROM studios WHERE studio_name = '20th Century Fox') OR release_year > 2010;

-- 14. 
SELECT title, release_year FROM movies WHERE studio_id = (SELECT studio_id FROM studios WHERE studio_name = 'Warner Bros') AND release_year >= 2015;