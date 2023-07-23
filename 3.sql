-- Для решения задач используйте базу данных semimar_4.
-- Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at)
-- и найдите разницу дат отправления между соседними сообщениями, получившегося списка (используйте LEAD или LAG)

USE semimar_4;

SELECT m.id, m.body, m.created_at,
TIMESTAMPDIFF(MINUTE, LEAD(m.created_at, 1, '---') OVER (ORDER BY m.created_at), m.created_at) AS 'Разница в минутах с последующим сообщением',
TIMESTAMPDIFF(MINUTE, LAG(m.created_at, 1, '---') OVER (ORDER BY m.created_at), m.created_at) AS 'Разница в минутах с предыдущим сообщением'
FROM messages AS m;
-- Значение по умолчанию '---' вместо NULL не ставится, почему не понял? Ранее всё работало.