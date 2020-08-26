-- Таблица постов
CREATE TABLE IF NOT EXISTS posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор поста",
  author_id INT UNSIGNED NOT NULL COMMENT "Ссылка на создателя поста",
  title VARCHAR(100) NOT NULL COMMENT "Заголовок поста",
  content TEXT NOT NULL COMMENT "Текст поста",  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания поста",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления поста"
) COMMENT "Посты";

-- Таблица лайков постов
CREATE TABLE IF NOT EXISTS posts_likes (
  post_id INT UNSIGNED NOT NULL COMMENT "Идентификатор поста",
  from_user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, который поставил лайк",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время постановки лайка пользователем", 
  PRIMARY KEY (post_id, from_user_id) COMMENT "Составной первичный ключ"
) COMMENT "Лайки постов";

-- Таблица лайков сообщений
CREATE TABLE IF NOT EXISTS messages_likes (
  message_id INT UNSIGNED NOT NULL COMMENT "Идентификатор сообщения",
  from_user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, который поставил лайк",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время постановки лайка пользователем", 
  PRIMARY KEY (message_id, from_user_id) COMMENT "Составной первичный ключ"
) COMMENT "Лайки сообщений";

-- Таблица лайков пользователей
CREATE TABLE IF NOT EXISTS users_likes (
  to_user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, которому поставили лайк",
  from_user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, который поставил лайк",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время постановки лайка пользователем", 
  PRIMARY KEY (to_user_id, from_user_id) COMMENT "Составной первичный ключ"
) COMMENT "Лайки пользователей";
