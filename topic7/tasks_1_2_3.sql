--1.Составим список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине:
INSERT INTO orders
  (user_id)
VALUES
  (1),
  (2),
  (3),
  (4); 

INSERT INTO orders_products
  (order_id, product_id, total)
VALUES
  (1, 2, 7),
  (1, 3, 2),
  (2, 4, 3),
  (2, 1, 1),
  (3, 5, 5),
  (3, 6, 2),
  (4, 7, 4),
  (4, 1, 2),
  (4, 5, 4);
 
SELECT
  name
FROM
  users
WHERE
  id = (SELECT user_id FROM orders WHERE user_id = users.id)
ORDER by name;

--2.Выведем список товаров products и разделов catalogs, который соответствует товару:
SELECT
  p.name,
  c.name AS 'product type'
FROM
  catalogs AS c JOIN products AS p
ON
  c.id = p.catalog_id;
  
--3.Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
--Поля from, to и label содержат английские названия городов, поле name — русское. Выведем список рейсов flights с русскими названиями городов:
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  city_from VARCHAR(255) COMMENT 'Город вылета самолета',
  city_to VARCHAR(255) COMMENT 'Город прилета самолета',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Вылеты';

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT 'Английское название города',
  name VARCHAR(255) COMMENT 'Русское название города',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Города';

INSERT INTO flights
  (city_from, city_to)
VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
  
INSERT INTO cities
  (label, name)
VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

SELECT
 id,
 (SELECT name FROM cities WHERE cities.label = flights.city_from) AS 'city_from',
 (SELECT name FROM cities WHERE cities.label = flights.city_to) AS 'city_to'
FROM
  flights;