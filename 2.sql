-- Для решения задач используйте базу данных semimar_4.
-- Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей,
-- указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге
-- (первое место у пользователя с максимальным количеством сообщений) (используйте DENSE_RANK).

USE semimar_4;

CREATE OR REPLACE
VIEW nummsg
AS SELECT m.from_user_id AS id, COUNT(m.from_user_id) AS num_msg
FROM messages AS m
GROUP BY m.from_user_id;

SELECT u.firstname, u.lastname, nm.num_msg,
DENSE_RANK() OVER (ORDER BY nm.num_msg DESC) AS D_rank
FROM nummsg AS nm, users AS u
WHERE nm.id = u.id;