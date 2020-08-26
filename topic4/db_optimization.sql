-- Дорабатываем тестовые данные
-- Смотрим все таблицы
USE vk;

SHOW TABLES;


-- Анализируем данные пользователей
SELECT * FROM users LIMIT 10;

-- Смотрим структуру таблицы пользователей
DESC users;

-- Приводим в порядок временные метки для users
UPDATE users SET created_at = (SELECT created_at FROM messages WHERE users.id = messages.id),
                 updated_at = (SELECT updated_at FROM messages WHERE users.id = messages.id);

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру профилей
DESC profiles;

-- Анализируем данные
SELECT * FROM profiles LIMIT 10;

-- Обновляем ссылки на фото:
UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

-- Приводим в порядок временные метки для profiles
UPDATE profiles SET created_at = (SELECT created_at FROM users WHERE profiles.user_id = users.id),
                    updated_at = (SELECT updated_at FROM users WHERE profiles.user_id = users.id);

UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру таблицы сообщений
DESC messages;

-- Анализируем данные
SELECT * FROM messages LIMIT 10;

-- Приводим в порядок временные метки для messages
UPDATE messages SET updated_at = NOW() WHERE updated_at < created_at;


-- Анализируем типы медиаконтента
SELECT * FROM media_types;

-- Приводим в порядок временные метки для media_types
UPDATE media_types SET created_at = (SELECT created_at FROM messages WHERE media_types.id = messages.id),
                       updated_at = (SELECT updated_at FROM messages WHERE media_types.id = messages.id);

UPDATE media_types SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру таблицы медиаконтента 
DESC media;

-- Анализируем данные
SELECT * FROM media LIMIT 10;

-- Переименуем столбец пути к файлу 
ALTER TABLE media RENAME COLUMN filename TO filepath;

-- Обновляем данные для ссылки на тип и владельца
UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);
UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

-- Создаём временную таблицу форматов медиафайлов
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));

-- Заполняем значениями
INSERT INTO extensions VALUES ('jpg'), ('avi'), ('mkv'), ('png');

-- Проверяем
SELECT * FROM extensions;

-- Обновляем ссылку на файл
UPDATE media SET filepath = CONCAT(
  'https://gofile.io/',
  (SELECT last_name FROM users ORDER BY RAND() LIMIT 1),
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

-- Обновляем размер файлов
UPDATE media SET size = FLOOR(1000 + (RAND() * 100000)) WHERE size < 1000;

-- Заполняем метаданные
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  

-- Возвращаем столбцу метеданных правильный тип
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- Приводим в порядок временные метки для medias
UPDATE media SET created_at = (SELECT created_at FROM messages WHERE media.id = messages.id),
                 updated_at = (SELECT updated_at FROM messages WHERE media.id = messages.id);

UPDATE media SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру таблицы дружбы
DESC friendship;

-- Анализируем данные
SELECT * FROM friendship;

-- Исправляем случай когда user_id = friend_id
UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;


-- Приводим в порядок временные метки для friendship
UPDATE friendship SET requested_at = (SELECT created_at FROM messages WHERE friendship.user_id = messages.id),
                      confirmed_at = (SELECT updated_at FROM messages WHERE friendship.user_id  = messages.id);
                
UPDATE friendship SET created_at = (SELECT created_at FROM messages WHERE friendship.user_id = messages.id),
                      updated_at = (SELECT updated_at FROM messages WHERE friendship.user_id  = messages.id);

UPDATE friendship SET confirmed_at = NOW() WHERE confirmed_at < requested_at;
UPDATE friendship SET updated_at = NOW() WHERE updated_at < created_at;
 

-- Анализируем данные 
SELECT * FROM friendship_statuses;

-- Очищаем таблицу
TRUNCATE friendship_statuses;

-- Вставляем значения статусов дружбы
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 
-- Обновляем ссылки на статус 
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); 

-- Приводим в порядок временные метки для friendship_statuses            
UPDATE friendship_statuses SET created_at = (SELECT created_at FROM messages WHERE friendship_statuses.id = messages.id),
                               updated_at = (SELECT updated_at FROM messages WHERE friendship_statuses.id  = messages.id);

UPDATE friendship_statuses SET updated_at = NOW() WHERE updated_at < created_at;


-- Смотрим структуру таблицы групп
DESC communities;

-- Анализируем данные
SELECT * FROM communities;

-- Удаляем часть групп
DELETE FROM communities WHERE id > 20;

-- Приводим в порядок временные метки для communities            
UPDATE communities SET created_at = (SELECT created_at FROM messages WHERE communities.id = messages.id),
                       updated_at = (SELECT updated_at FROM messages WHERE communities.id = messages.id);

UPDATE communities SET updated_at = NOW() WHERE updated_at < created_at;


-- Анализируем таблицу связи пользователей и групп
SELECT * FROM communities_users;

-- Обновляем значения community_id
UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 20);

-- Приводим в порядок временные метки для communities_users            
UPDATE communities_users SET created_at = (SELECT created_at FROM messages WHERE communities_users.user_id = messages.id);
