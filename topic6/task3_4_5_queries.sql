--3.Определим кто больше поставил лайков (всего) - мужчины или женщины (для получения разбивки по всем полам достаточно будет убрать LIMIT 1 из запроса):
SELECT 
  (SELECT gender from profiles WHERE profiles.user_id = likes.user_id) AS gender,
  COUNT(*) AS 'Number of likes'
    FROM likes 
    GROUP BY gender
    ORDER BY COUNT(*) DESC LIMIT 1;
	
--4.Подсчитать количество лайков, которые получили десять самых молодых пользователей:
SELECT
  target_id,
 (SELECT(CONCAT(first_name, ' ', last_name)) FROM users WHERE users.id = likes.target_id) AS name,
 (SELECT birthday from profiles WHERE profiles.user_id = likes.target_id) AS birthday,
  COUNT(*) AS 'Number of likes'  
FROM likes
GROUP BY target_id
ORDER BY birthday DESC LIMIT 10;

--5.Найдем 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети. В качестве критерия используем такие критерии как наименьшее количество лайков и постов от пользователя:
--10 пользователей с наименьшим количеством лайков, которые были ими инициированы:
SELECT 
  user_id,
  COUNT(user_id) AS 'Number of likes'
    FROM likes 
    GROUP BY user_id
    ORDER BY COUNT(*) LIMIT 10;
	
--10 пользователей с наименьшим количеством постов:
SELECT 
  user_id,
  COUNT(user_id) AS 'Number of posts'
    FROM posts 
    GROUP BY user_id
    ORDER BY COUNT(*) LIMIT 10;
	
--10 пользовалей с наименьшим количеством лайков и постов в сумме:	
SELECT user_id, SUM(count_id) as total 
FROM
(
  SELECT 
    user_id,
    COUNT(user_id) AS count_id
      FROM likes
      GROUP BY user_id
  UNION ALL
  SELECT 
    user_id,
    COUNT(user_id) AS count_id
      FROM posts 
      GROUP BY user_id
) AS user_id
GROUP BY user_id
ORDER BY total LIMIT 10;
