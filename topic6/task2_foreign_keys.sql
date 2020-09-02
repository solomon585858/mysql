--2.Создать все необходимые внешние ключи и диаграмму отношений.

-- Для таблицы profiles
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;

ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;
      
-- Для таблицы messages
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

-- Для таблицы media
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT media_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id);

-- Для таблицы communites_users
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;
	  
-- Для таблицы friendship
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
	
-- Для таблицы posts
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT posts_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
	  ON DELETE SET NULL;
	  
-- Для таблицы likes
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_id_fk_1 
    FOREIGN KEY (target_id) REFERENCES messages(id) 
	  ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_id_fk_2 
    FOREIGN KEY (target_id) REFERENCES users(id) 
	  ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_id_fk_3 
    FOREIGN KEY (target_id) REFERENCES media(id) 
	  ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_id_fk_4 
    FOREIGN KEY (target_id) REFERENCES posts(id) 
	  ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_type_id_fk 
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
