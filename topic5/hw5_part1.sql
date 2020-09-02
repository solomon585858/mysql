--Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение». Используем существующую БД shop с набором данных.
USE shop;

--1.Обновим столбцы created_at и updated_at в таблице users текущим временем:
UPDATE users SET created_at = NOW(), updated_at = NOW();

--2.Эмулируем ситуацию когда тип данных для столбцов created_at и updated_at представляет собой тип VARCHAR и преобразуем тип обратно в DATETIME.
--Вариант 1:
ALTER TABLE users 
  MODIFY COLUMN created_at VARCHAR(255),
  MODIFY COLUMN updated_at VARCHAR(255);
  
ALTER TABLE users 
  MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  MODIFY COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
  
--Вариант 2:
ALTER TABLE users CHANGE created_at created_at VARCHAR(255);
ALTER TABLE users CHANGE updated_at updated_at VARCHAR(255);
 
ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
  
--3.Заполним таблицу storehoused_products фиктивными данными и отсортируем по value, чтобы они выводились в порядке увеличения значения value, но нулевые запасы выводились в самом конце:
INSERT INTO
  storehouses_products (storehouse_id, product_id, value)
VALUES
  (1, 587, 0),
  (1, 993, 2500),
  (1, 423, 0),
  (1, 245, 30),
  (1, 558, 500),
  (1, 9942, 1);
 
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;

--4.Выведем пользователей, которые родились в мае или в августе. Имена месяцев заданы английскими словами.
--Вариант 1:
SELECT id, name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august'); 

--Вариант 2:
SELECT id, name FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august'); 

--5.Отсортируем записи в таблице catalogs в порядке 5, 1, 2 для id:
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);