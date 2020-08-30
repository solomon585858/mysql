--Практическое задание по теме «Агрегация данных». Используем существующую БД shop с набором данных.
USE shop;

--1.Подсчитаем средний возраст пользователей в таблице users и округлим в меньшую сторону:
SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))) AS age FROM users;

--2.Подсчитаем количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения:
SELECT
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;
  
--3.Подсчитаем произведение чисел в столбце таблицы (для примера возьмем таблицу users и поле id):
SELECT ROUND(EXP(SUM(LN(id)))) from users;