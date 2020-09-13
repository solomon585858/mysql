--Транзакции, переменные, представления

--1.В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции:
CREATE DATABASE sample;

#exit
#mysqldump shop > sample.sql
#mysql sample < sample.sql
#mysql
#mysql -Nse 'SHOW TABLES' sample | WHILE READ TABLE; do mysql -e "TRUNCATE TABLE $table" sample; done

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;


--2.Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs:
USE shop;
CREATE VIEW product_names (name, product_type) AS
  SELECT 
    p.name, 
    c.name 
  FROM products AS p JOIN catalogs as c
  ON c.id = p.catalog_id;
  

--3.Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2018-08-04', '2018-08-16' и '2018-08-17'. 
--Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует:
USE shop;
DROP TABLE IF EXISTS testtb;
CREATE TABLE testtb (
	created_at DATE
);

INSERT INTO testtb VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');

SELECT 
	time_period.selected_date AS date,
	(SELECT EXISTS(SELECT * FROM testtb2 WHERE created_at = date)) AS valid
FROM
	(SELECT v.* FROM 
		(SELECT ADDDATE('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date FROM
			(SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
	WHERE selected_date BETWEEN '2018-08-01' AND '2018-08-31') AS time_period
    ORDER BY date;


--4.Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей:
USE shop;
DROP TABLE IF EXISTS testtb2;
CREATE TABLE testtb2 (
	created_at DATE
);

INSERT INTO testtb2 VALUES
	('2020-09-01'),
	('2020-09-02'),
	('2020-09-03'),
	('2020-09-04'),
	('2020-09-05'),
	('2020-09-06'),
	('2020-09-07'),
	('2020-09-08'),
	('2020-09-09'),
	('2020-09-10');

DELETE
  testtb2
FROM
  testtb2
JOIN
 (SELECT
    created_at
  FROM
    testtb2
  ORDER BY
    created_at DESC
  LIMIT 5, 1) AS new
ON
  testtb2.created_at <= new.created_at;
