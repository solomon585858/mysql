--1.Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
--название таблицы, идентификатор первичного ключа и содержимое поля name:

--Создадим таблицу logs типа Archive:
DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(100) NOT NULL,
	id BIGINT(30) NOT NULL,
	name VARCHAR(100) NOT NULL
) ENGINE = ARCHIVE;

--Создадим триггеры для добавления записей в таблицу logs после создания новых записей в таблицах users, catalogs, products:
DELIMITER //

DROP TRIGGER IF EXISTS logs_users //
DROP TRIGGER IF EXISTS logs_catalogs //
DROP TRIGGER IF EXISTS logs_products //

CREATE TRIGGER logs_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id, name)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //

CREATE TRIGGER logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id, name)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //

CREATE TRIGGER logs_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id, name)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //

DELIMITER ;

--Добавим новые значения в таблицы users, catalogs, products и убедимся, что таблица logs пополнилась новыми значениями:
INSERT INTO users 
  (name, birthday_at)
VALUES 
  ('Fedor Ivanov', '1990-11-11'),
  ('Johh Watson', '1995-21-12');
 
INSERT INTO catalogs
  (name)
VALUES
  ('Периферийные устройства'),
  ('Системы охлаждения');

INSERT INTO products
  (name, description, price, catalog_id)
VALUES 
  ('Intel Core i7-8700 OEM', 'Процессор для ПК', 25500, 1),
  ('Intel Core i7-9700 BOX', 'Процессор для ПК', 27600, 1);

SELECT * FROM logs;


--2.Создайте SQL-запрос, который помещает в таблицу users миллион записей:

--Создадим тестовую таблицу пользователей:
DROP TABLE IF EXISTS test_users;

CREATE TABLE test_users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Добавим 1 миллион пользователей в таблицу test_users:
INSERT INTO test_users 
  (id, name, birthday_at)
SELECT 
  n, CONCAT('User', n), NOW() 
FROM
  (
  SELECT a.N + b.N * 10 + c.N * 100 + d.N * 1000 + e.N * 10000 + f.N * 100000 + 1 N
  FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
        , (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
        , (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
        , (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d
        , (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e
        , (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) f
  ) t;
  
--Проверим 10 строк в таблице test_users для примера и убедимся, что количество записей равно 1 млн:
SELECT * FROM test_users LIMIT 10;
 
SELECT COUNT(*) AS total FROM test_users;
