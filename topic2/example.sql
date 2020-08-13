DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

USE example;

CREATE TABLE users (
  id INT UNSIGNED,
  name VARCHAR(255) COMMENT 'Имя пользователя'
) COMMENT = 'Пользователи';

DESCRIBE users;
