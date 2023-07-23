-- Для решения задач используйте базу данных semimar_4.
-- Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.

USE semimar_4;

CREATE OR REPLACE
VIEW users_under_20_years
AS
(
SELECT p.user_id AS id, p.gender AS gender, p.hometown AS town, (YEAR(CURRENT_DATE) - YEAR(p.birthday)) - (RIGHT(CURRENT_DATE, 5) < RIGHT(p.birthday, 5)) AS age
FROM profiles AS p
WHERE (YEAR(CURRENT_DATE) - YEAR(p.birthday)) - (RIGHT(CURRENT_DATE, 5) < RIGHT(p.birthday, 5)) <= 20
);

CREATE OR REPLACE
VIEW info_users
AS SELECT u.firstname, u.lastname, up.gender, up.age, up.town
FROM users_under_20_years AS up
JOIN users AS u USING(id);

SELECT * FROM info_users;