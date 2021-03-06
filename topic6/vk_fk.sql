-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'Distinctio totam veritatis.','2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,'In vero.','2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,'Est soluta magni.','2020-05-19 01:09:48','2020-08-26 09:27:30'),(4,'Qui perspiciatis.','2019-11-25 01:43:31','2020-01-03 09:19:05'),(5,'Ea culpa aut.','2019-09-15 00:23:21','2019-10-15 13:04:57'),(6,'Dolore rerum et.','2020-05-16 07:20:51','2020-08-04 17:12:25'),(7,'Iusto sed.','2020-07-11 02:21:50','2020-08-26 09:27:30'),(8,'Nulla asperiores.','2020-07-03 15:59:20','2020-08-26 09:27:30'),(9,'Culpa ea et.','2020-08-17 21:02:09','2020-08-26 09:27:30'),(10,'Quos alias ut.','2020-02-02 19:30:22','2020-08-17 01:24:21'),(11,'Modi placeat officiis.','2019-11-18 02:44:27','2020-06-18 10:28:37'),(12,'Nesciunt harum vel.','2019-12-21 16:13:08','2020-08-26 09:27:30'),(13,'Repellat necessitatibus.','2020-03-17 00:19:38','2020-08-26 09:27:30'),(14,'Esse culpa.','2020-05-06 08:08:10','2020-06-01 22:39:41'),(15,'Officiis placeat.','2020-03-15 16:25:02','2020-08-26 09:27:30'),(16,'Autem et ducimus.','2020-01-13 04:10:14','2020-08-26 09:27:30'),(17,'Praesentium quae odio.','2019-09-14 19:11:05','2020-05-22 08:16:46'),(18,'Voluptatem aut aut.','2020-01-30 00:19:42','2020-08-26 09:27:30'),(19,'Molestiae similique.','2020-07-01 19:54:30','2020-08-26 09:27:30'),(20,'Soluta quasi.','2020-01-24 05:15:09','2020-07-09 05:17:47');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` int unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `communities_users_user_id_fk` (`user_id`),
  CONSTRAINT `communities_users_community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,7,'2020-07-11 02:21:50'),(1,11,'2019-11-18 02:44:27'),(1,19,'2020-07-01 19:54:30'),(1,42,'2019-11-09 04:35:10'),(2,27,'2020-05-22 08:13:51'),(2,63,'2020-06-26 13:33:49'),(2,93,'2019-11-17 18:18:33'),(3,30,'2019-12-12 00:41:24'),(3,31,'2019-08-31 13:10:16'),(3,50,'2020-08-06 23:37:55'),(3,59,'2020-01-03 12:17:36'),(4,9,'2020-08-17 21:02:09'),(4,34,'2020-02-29 00:43:01'),(4,51,'2020-01-19 14:32:56'),(4,79,'2019-10-12 13:18:20'),(4,86,'2020-07-03 23:08:30'),(4,93,'2019-11-17 18:18:33'),(5,31,'2019-08-31 13:10:16'),(5,56,'2020-06-01 01:25:15'),(5,66,'2019-10-26 12:26:17'),(6,6,'2020-05-16 07:20:51'),(6,26,'2020-05-02 06:02:37'),(6,29,'2019-09-29 22:09:37'),(6,50,'2020-08-06 23:37:55'),(6,52,'2020-03-18 08:09:17'),(6,55,'2020-02-24 06:55:55'),(6,65,'2019-11-16 05:47:25'),(6,67,'2020-05-06 15:16:22'),(6,87,'2020-05-24 14:38:59'),(6,95,'2019-12-07 08:38:18'),(7,5,'2019-09-15 00:23:21'),(7,6,'2020-05-16 07:20:51'),(7,47,'2020-01-31 11:26:59'),(7,89,'2019-10-09 12:28:52'),(8,4,'2019-11-25 01:43:31'),(8,6,'2020-05-16 07:20:51'),(8,34,'2020-02-29 00:43:01'),(8,62,'2020-04-17 13:44:12'),(9,22,'2020-01-05 15:34:39'),(9,44,'2019-11-25 22:57:53'),(9,98,'2020-02-27 19:46:43'),(10,42,'2019-11-09 04:35:10'),(10,62,'2020-04-17 13:44:12'),(10,77,'2019-10-12 12:43:43'),(10,94,'2020-07-27 23:11:30'),(10,97,'2019-11-24 01:31:17'),(11,3,'2020-05-19 01:09:48'),(11,5,'2019-09-15 00:23:21'),(11,15,'2020-03-15 16:25:02'),(11,16,'2020-01-13 04:10:14'),(11,18,'2020-01-30 00:19:42'),(11,64,'2019-12-01 00:11:28'),(11,82,'2019-10-22 11:36:49'),(12,30,'2019-12-12 00:41:24'),(12,33,'2020-05-12 08:33:48'),(12,44,'2019-11-25 22:57:53'),(12,61,'2020-06-02 09:01:28'),(12,66,'2019-10-26 12:26:17'),(12,70,'2020-01-28 07:55:52'),(12,89,'2019-10-09 12:28:52'),(13,2,'2020-02-06 20:49:21'),(13,23,'2020-05-12 08:00:55'),(13,34,'2020-02-29 00:43:01'),(13,43,'2020-04-28 15:05:44'),(13,72,'2019-08-21 11:02:37'),(13,92,'2019-09-07 06:30:36'),(14,71,'2020-02-09 07:24:10'),(14,100,'2020-08-04 21:50:36'),(15,52,'2020-03-18 08:09:17'),(15,63,'2020-06-26 13:33:49'),(15,73,'2020-04-19 23:59:46'),(15,81,'2019-09-04 07:27:22'),(15,91,'2019-10-10 16:34:30'),(16,12,'2019-12-21 16:13:08'),(16,64,'2019-12-01 00:11:28'),(16,73,'2020-04-19 23:59:46'),(16,81,'2019-09-04 07:27:22'),(16,82,'2019-10-22 11:36:49'),(16,100,'2020-08-04 21:50:36'),(17,3,'2020-05-19 01:09:48'),(17,23,'2020-05-12 08:00:55'),(17,65,'2019-11-16 05:47:25'),(17,78,'2020-04-11 05:49:13'),(17,81,'2019-09-04 07:27:22'),(17,82,'2019-10-22 11:36:49'),(18,22,'2020-01-05 15:34:39'),(18,97,'2019-11-24 01:31:17'),(19,31,'2019-08-31 13:10:16'),(19,44,'2019-11-25 22:57:53'),(19,53,'2019-10-11 17:39:53'),(19,62,'2020-04-17 13:44:12'),(19,75,'2020-01-11 21:42:25'),(19,90,'2020-06-05 05:39:55'),(19,91,'2019-10-10 16:34:30'),(20,9,'2020-08-17 21:02:09'),(20,19,'2020-07-01 19:54:30'),(20,48,'2020-06-20 01:37:12'),(20,61,'2020-06-02 09:01:28'),(20,64,'2019-12-01 00:11:28'),(20,89,'2019-10-09 12:28:52');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `status_id` int unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ',
  KEY `friendship_friend_id_fk` (`friend_id`),
  KEY `friendship_status_id_fk` (`status_id`),
  CONSTRAINT `friendship_friend_id_fk` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `friendship_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `friendship_statuses` (`id`),
  CONSTRAINT `friendship_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (11,59,3,'2019-11-18 02:44:27','2020-06-18 10:28:37','2019-11-18 02:44:27','2020-08-26 10:23:15'),(11,90,2,'2019-11-18 02:44:27','2020-06-18 10:28:37','2019-11-18 02:44:27','2020-08-26 10:23:15'),(13,17,1,'2020-03-17 00:19:38','2020-08-26 09:27:30','2020-03-17 00:19:38','2020-08-26 10:23:15'),(13,28,3,'2020-03-17 00:19:38','2020-08-26 09:27:30','2020-03-17 00:19:38','2020-08-26 09:27:30'),(25,92,1,'2020-04-30 05:22:20','2020-08-26 09:27:30','2020-04-30 05:22:20','2020-08-26 10:23:15'),(41,59,3,'2019-12-18 01:58:44','2020-03-27 12:19:13','2019-12-18 01:58:44','2020-03-27 12:19:13'),(46,17,1,'2019-11-27 04:43:15','2020-03-12 03:43:20','2019-11-27 04:43:15','2020-08-26 10:23:15'),(47,30,2,'2020-01-31 11:26:59','2020-08-26 09:27:30','2020-01-31 11:26:59','2020-08-26 10:23:15'),(49,16,3,'2019-10-15 02:28:26','2020-08-26 09:27:30','2019-10-15 02:28:26','2020-08-26 10:23:15'),(53,36,2,'2019-10-11 17:39:53','2019-12-19 10:54:20','2019-10-11 17:39:53','2020-08-26 10:23:15'),(54,11,3,'2020-07-06 05:05:36','2020-08-26 09:27:30','2020-07-06 05:05:36','2020-08-26 10:23:15'),(55,50,2,'2020-02-24 06:55:55','2020-07-07 03:46:02','2020-02-24 06:55:55','2020-08-26 10:23:15'),(56,68,3,'2020-06-01 01:25:15','2020-08-26 09:27:30','2020-06-01 01:25:15','2020-08-26 10:23:15'),(63,43,2,'2020-06-26 13:33:49','2020-08-26 09:27:30','2020-06-26 13:33:49','2020-08-26 10:23:15'),(64,25,2,'2019-12-01 00:11:28','2020-03-09 06:23:49','2019-12-01 00:11:28','2020-03-09 06:23:49'),(87,7,3,'2020-05-24 14:38:59','2020-08-26 09:27:30','2020-05-24 14:38:59','2020-08-26 10:23:15'),(90,61,1,'2020-06-05 05:39:55','2020-08-26 09:27:30','2020-06-05 05:39:55','2020-08-26 09:27:30'),(91,29,1,'2019-10-10 16:34:30','2020-05-06 09:23:31','2019-10-10 16:34:30','2020-08-26 10:23:15'),(92,51,1,'2019-09-07 06:30:36','2020-06-13 19:46:00','2019-09-07 06:30:36','2020-08-26 10:23:15'),(95,56,3,'2019-12-07 08:38:18','2020-08-18 17:55:05','2019-12-07 08:38:18','2020-08-18 17:55:05');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_statuses`
--

DROP TABLE IF EXISTS `friendship_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статусы дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (1,'Requested','2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,'Confirmed','2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,'Rejected','2020-05-19 01:09:48','2020-08-26 09:27:30');
/*!40000 ALTER TABLE `friendship_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `target_id` int unsigned NOT NULL,
  `target_type_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_fk` (`user_id`),
  KEY `likes_target_id_fk_4` (`target_id`),
  KEY `likes_target_type_id_fk` (`target_type_id`),
  CONSTRAINT `likes_target_id_fk_1` FOREIGN KEY (`target_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_target_id_fk_2` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_target_id_fk_3` FOREIGN KEY (`target_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_target_id_fk_4` FOREIGN KEY (`target_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_target_type_id_fk` FOREIGN KEY (`target_type_id`) REFERENCES `target_types` (`id`),
  CONSTRAINT `likes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,8,14,2,'2020-09-02 08:21:32'),(2,72,30,2,'2020-09-02 08:21:32'),(3,83,9,4,'2020-09-02 08:21:32'),(4,48,56,2,'2020-09-02 08:21:32'),(5,4,15,3,'2020-09-02 08:21:32'),(6,67,48,2,'2020-09-02 08:21:32'),(7,37,76,3,'2020-09-02 08:21:32'),(8,9,41,4,'2020-09-02 08:21:32'),(9,70,14,3,'2020-09-02 08:21:32'),(10,50,75,1,'2020-09-02 08:21:32'),(11,100,22,1,'2020-09-02 08:21:32'),(12,96,41,1,'2020-09-02 08:21:32'),(13,52,15,1,'2020-09-02 08:21:32'),(14,53,3,3,'2020-09-02 08:21:32'),(15,69,76,3,'2020-09-02 08:21:32'),(16,39,73,2,'2020-09-02 08:21:32'),(17,27,86,2,'2020-09-02 08:21:32'),(18,88,93,4,'2020-09-02 08:21:32'),(19,11,59,3,'2020-09-02 08:21:32'),(20,38,1,4,'2020-09-02 08:21:32'),(21,48,70,1,'2020-09-02 08:21:32'),(22,18,70,4,'2020-09-02 08:21:32'),(23,77,89,1,'2020-09-02 08:21:32'),(24,18,37,2,'2020-09-02 08:21:32'),(25,37,96,3,'2020-09-02 08:21:32'),(26,59,85,2,'2020-09-02 08:21:32'),(27,87,91,4,'2020-09-02 08:21:32'),(28,81,32,1,'2020-09-02 08:21:32'),(29,92,6,3,'2020-09-02 08:21:32'),(30,56,16,1,'2020-09-02 08:21:32'),(31,6,98,3,'2020-09-02 08:21:32'),(32,64,6,2,'2020-09-02 08:21:32'),(33,56,74,1,'2020-09-02 08:21:32'),(34,88,32,4,'2020-09-02 08:21:32'),(35,93,72,4,'2020-09-02 08:21:32'),(36,72,28,1,'2020-09-02 08:21:32'),(37,23,49,4,'2020-09-02 08:21:32'),(38,40,66,1,'2020-09-02 08:21:32'),(39,50,23,3,'2020-09-02 08:21:32'),(40,36,95,3,'2020-09-02 08:21:32'),(41,53,60,2,'2020-09-02 08:21:32'),(42,21,82,2,'2020-09-02 08:21:32'),(43,95,31,3,'2020-09-02 08:21:32'),(44,48,34,2,'2020-09-02 08:21:32'),(45,29,65,2,'2020-09-02 08:21:32'),(46,89,36,1,'2020-09-02 08:21:32'),(47,53,27,4,'2020-09-02 08:21:32'),(48,2,77,4,'2020-09-02 08:21:32'),(49,72,19,4,'2020-09-02 08:21:32'),(50,23,85,3,'2020-09-02 08:21:32'),(51,32,85,2,'2020-09-02 08:21:32'),(52,85,41,3,'2020-09-02 08:21:32'),(53,29,93,4,'2020-09-02 08:21:32'),(54,3,84,1,'2020-09-02 08:21:32'),(55,96,51,3,'2020-09-02 08:21:32'),(56,88,33,4,'2020-09-02 08:21:32'),(57,97,87,2,'2020-09-02 08:21:32'),(58,67,96,4,'2020-09-02 08:21:32'),(59,99,62,1,'2020-09-02 08:21:32'),(60,69,14,3,'2020-09-02 08:21:32'),(61,67,47,2,'2020-09-02 08:21:32'),(62,22,14,1,'2020-09-02 08:21:32'),(63,66,24,1,'2020-09-02 08:21:32'),(64,33,1,1,'2020-09-02 08:21:32'),(65,20,88,4,'2020-09-02 08:21:32'),(66,28,2,2,'2020-09-02 08:21:32'),(67,23,37,1,'2020-09-02 08:21:32'),(68,76,24,4,'2020-09-02 08:21:32'),(69,99,10,3,'2020-09-02 08:21:32'),(70,35,16,3,'2020-09-02 08:21:32'),(71,25,99,1,'2020-09-02 08:21:32'),(72,11,89,1,'2020-09-02 08:21:32'),(73,82,80,3,'2020-09-02 08:21:32'),(74,31,93,3,'2020-09-02 08:21:32'),(75,76,66,1,'2020-09-02 08:21:32'),(76,17,74,1,'2020-09-02 08:21:32'),(77,78,30,1,'2020-09-02 08:21:32'),(78,84,74,1,'2020-09-02 08:21:32'),(79,63,62,1,'2020-09-02 08:21:32'),(80,16,19,2,'2020-09-02 08:21:32'),(81,70,14,3,'2020-09-02 08:21:32'),(82,53,87,4,'2020-09-02 08:21:32'),(83,17,56,2,'2020-09-02 08:21:32'),(84,80,12,1,'2020-09-02 08:21:32'),(85,52,8,4,'2020-09-02 08:21:32'),(86,97,30,3,'2020-09-02 08:21:32'),(87,98,19,4,'2020-09-02 08:21:32'),(88,38,94,3,'2020-09-02 08:21:32'),(89,88,77,1,'2020-09-02 08:21:32'),(90,80,33,1,'2020-09-02 08:21:32'),(91,16,12,1,'2020-09-02 08:21:32'),(92,18,58,2,'2020-09-02 08:21:32'),(93,7,24,4,'2020-09-02 08:21:32'),(94,15,83,3,'2020-09-02 08:21:32'),(95,3,2,1,'2020-09-02 08:21:32'),(96,1,98,4,'2020-09-02 08:21:32'),(97,38,32,2,'2020-09-02 08:21:32'),(98,21,74,1,'2020-09-02 08:21:32'),(99,10,31,1,'2020-09-02 08:21:32'),(100,25,52,4,'2020-09-02 08:21:32');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int unsigned NOT NULL COMMENT 'Размер файла',
  `metadata` json DEFAULT NULL,
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `media_user_id_fk` (`user_id`),
  KEY `media_media_type_id_fk` (`media_type_id`),
  CONSTRAINT `media_media_type_id_fk` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,'https://gofile.io/Mills.mkv',2302,'{\"owner\": \"Chaim Jenkins\"}',3,'2020-02-24 22:02:49','2020-09-02 09:42:59'),(2,2,'https://gofile.io/Romaguera.jpg',1511,'{\"owner\": \"Gina King\"}',2,'2020-02-06 20:49:21','2020-09-02 09:42:59'),(3,3,'https://gofile.io/Jacobi.mkv',1128,'{\"owner\": \"Victor Strosin\"}',1,'2020-05-19 01:09:48','2020-09-02 09:42:59'),(4,4,'https://gofile.io/Barton.jpg',2202,'{\"owner\": \"Alex Will\"}',3,'2019-11-25 01:43:31','2020-09-02 09:42:59'),(5,5,'https://gofile.io/Hand.mkv',47088,'{\"owner\": \"Chloe Heller\"}',1,'2019-09-15 00:23:21','2020-09-02 09:42:59'),(6,6,'https://gofile.io/Bartell.avi',45727,'{\"owner\": \"Kasey Nikolaus\"}',3,'2020-05-16 07:20:51','2020-09-02 09:42:59'),(7,7,'https://gofile.io/Jacobi.png',1200,'{\"owner\": \"Emma Hoppe\"}',1,'2020-07-11 02:21:50','2020-09-02 09:42:59'),(8,8,'https://gofile.io/Ritchie.avi',86372,'{\"owner\": \"Leilani Oberbrunner\"}',2,'2020-07-03 15:59:20','2020-09-02 09:42:59'),(9,9,'https://gofile.io/Kemmer.mkv',93678,'{\"owner\": \"Iva Treutel\"}',1,'2020-08-17 21:02:09','2020-09-02 09:42:59'),(10,10,'https://gofile.io/Brown.avi',8278,'{\"owner\": \"Hassan Spinka\"}',2,'2020-02-02 19:30:22','2020-09-02 09:42:59'),(11,11,'https://gofile.io/Heller.avi',59353,'{\"owner\": \"Nat Welch\"}',2,'2019-11-18 02:44:27','2020-09-02 09:42:59'),(12,12,'https://gofile.io/Howell.jpg',70933,'{\"owner\": \"Fermin Doyle\"}',1,'2019-12-21 16:13:08','2020-09-02 09:42:59'),(13,13,'https://gofile.io/Hand.png',2967,'{\"owner\": \"Jaida Murphy\"}',3,'2020-03-17 00:19:38','2020-09-02 09:42:59'),(14,14,'https://gofile.io/Fay.jpg',75605,'{\"owner\": \"Darryl Jacobi\"}',1,'2020-05-06 08:08:10','2020-09-02 09:42:59'),(15,15,'https://gofile.io/Sauer.png',1739,'{\"owner\": \"Elmo Zieme\"}',1,'2020-03-15 16:25:02','2020-09-02 09:42:59'),(16,16,'https://gofile.io/Lind.png',64228,'{\"owner\": \"Randal Cremin\"}',2,'2020-01-13 04:10:14','2020-09-02 09:42:59'),(17,17,'https://gofile.io/Conroy.mkv',93324,'{\"owner\": \"Vergie Predovic\"}',3,'2019-09-14 19:11:05','2020-09-02 09:42:59'),(18,18,'https://gofile.io/Gerhold.jpg',2737,'{\"owner\": \"Aglae Kassulke\"}',3,'2020-01-30 00:19:42','2020-09-02 09:42:59'),(19,19,'https://gofile.io/Davis.png',72938,'{\"owner\": \"Adonis Greenfelder\"}',2,'2020-07-01 19:54:30','2020-09-02 09:42:59'),(20,20,'https://gofile.io/Welch.mkv',2776,'{\"owner\": \"Reese Conroy\"}',1,'2020-01-24 05:15:09','2020-09-02 09:42:59'),(21,21,'https://gofile.io/Crooks.jpg',83719,'{\"owner\": \"Andres Fisher\"}',2,'2020-04-22 09:36:59','2020-09-02 09:42:59'),(22,22,'https://gofile.io/Wintheiser.avi',2748,'{\"owner\": \"Wanda Hintz\"}',2,'2020-01-05 15:34:39','2020-09-02 09:42:59'),(23,23,'https://gofile.io/Hoeger.mkv',98781,'{\"owner\": \"Evelyn Bruen\"}',3,'2020-05-12 08:00:55','2020-09-02 09:42:59'),(24,24,'https://gofile.io/Oberbrunner.avi',2110,'{\"owner\": \"Gisselle Barton\"}',3,'2020-07-08 07:23:17','2020-09-02 09:42:59'),(25,25,'https://gofile.io/Predovic.mkv',2040,'{\"owner\": \"Trinity Kerluke\"}',2,'2020-04-30 05:22:20','2020-09-02 09:42:59'),(26,26,'https://gofile.io/Sanford.png',2792,'{\"owner\": \"Evelyn Bruen\"}',1,'2020-05-02 06:02:37','2020-09-02 09:42:59'),(27,27,'https://gofile.io/Lehner.mkv',41747,'{\"owner\": \"Chloe Heller\"}',1,'2020-05-22 08:13:51','2020-09-02 09:42:59'),(28,28,'https://gofile.io/Stroman.avi',2120,'{\"owner\": \"Emmitt Kemmer\"}',2,'2019-08-20 16:14:14','2020-09-02 09:42:59'),(29,29,'https://gofile.io/Lakin.jpg',2896,'{\"owner\": \"Gina King\"}',1,'2019-09-29 22:09:37','2020-09-02 09:42:59'),(30,30,'https://gofile.io/Franecki.mkv',11394,'{\"owner\": \"Evangeline Ritchie\"}',1,'2019-12-12 00:41:24','2020-09-02 09:42:59'),(31,31,'https://gofile.io/Howell.avi',2678,'{\"owner\": \"Kenya Haley\"}',3,'2019-08-31 13:10:16','2020-09-02 09:42:59'),(32,32,'https://gofile.io/Haley.png',2022,'{\"owner\": \"Reymundo Howell\"}',2,'2019-12-01 23:15:29','2020-09-02 09:42:59'),(33,33,'https://gofile.io/Schultz.png',1011,'{\"owner\": \"Felipe Terry\"}',2,'2020-05-12 08:33:48','2020-09-02 09:42:59'),(34,34,'https://gofile.io/Barton.avi',2173,'{\"owner\": \"Delta Predovic\"}',1,'2020-02-29 00:43:01','2020-09-02 09:42:59'),(35,35,'https://gofile.io/Witting.jpg',2597,'{\"owner\": \"Violette Ritchie\"}',2,'2020-02-11 18:34:07','2020-09-02 09:42:59'),(36,36,'https://gofile.io/Rippin.png',2440,'{\"owner\": \"Evangeline Ritchie\"}',1,'2020-06-23 05:34:54','2020-09-02 09:42:59'),(37,37,'https://gofile.io/Stroman.png',30731,'{\"owner\": \"Delta Predovic\"}',1,'2020-07-09 17:57:07','2020-09-02 09:42:59'),(38,38,'https://gofile.io/Predovic.mkv',2547,'{\"owner\": \"Sally Brown\"}',3,'2020-07-21 06:16:48','2020-09-02 09:42:59'),(39,39,'https://gofile.io/Lind.png',1759,'{\"owner\": \"Wallace Armstrong\"}',1,'2019-11-10 04:47:14','2020-09-02 09:42:59'),(40,40,'https://gofile.io/Johnson.avi',18471,'{\"owner\": \"Rhianna Witting\"}',3,'2019-09-25 17:31:42','2020-09-02 09:42:59'),(41,41,'https://gofile.io/Murphy.avi',1228,'{\"owner\": \"Kelley Davis\"}',2,'2019-12-18 01:58:44','2020-09-02 09:42:59'),(42,42,'https://gofile.io/Cremin.mkv',2642,'{\"owner\": \"Jacky Wintheiser\"}',1,'2019-11-09 04:35:10','2020-09-02 09:42:59'),(43,43,'https://gofile.io/Rippin.jpg',1241,'{\"owner\": \"Liam Ondricka\"}',2,'2020-04-28 15:05:44','2020-09-02 09:42:59'),(44,44,'https://gofile.io/Zieme.avi',99161,'{\"owner\": \"Harmony Mills\"}',1,'2019-11-25 22:57:53','2020-09-02 09:42:59'),(45,45,'https://gofile.io/Hoeger.png',39395,'{\"owner\": \"Treva Lakin\"}',1,'2020-06-16 01:04:49','2020-09-02 09:42:59'),(46,46,'https://gofile.io/Willms.avi',98494,'{\"owner\": \"Liam Ondricka\"}',2,'2019-11-27 04:43:15','2020-09-02 09:42:59'),(47,47,'https://gofile.io/Daugherty.mkv',2594,'{\"owner\": \"Amanda Kunde\"}',2,'2020-01-31 11:26:59','2020-09-02 09:42:59'),(48,48,'https://gofile.io/Tillman.png',2225,'{\"owner\": \"Harry Sauer\"}',1,'2020-06-20 01:37:12','2020-09-02 09:42:59'),(49,49,'https://gofile.io/Doyle.avi',73284,'{\"owner\": \"Gina King\"}',1,'2019-10-15 02:28:26','2020-09-02 09:42:59'),(50,50,'https://gofile.io/Welch.png',1095,'{\"owner\": \"Tiara Kris\"}',2,'2020-08-06 23:37:55','2020-09-02 09:42:59'),(51,51,'https://gofile.io/Jacobi.avi',69937,'{\"owner\": \"Rosamond Stroman\"}',2,'2020-01-19 14:32:56','2020-09-02 09:42:59'),(52,52,'https://gofile.io/Zieme.jpg',2115,'{\"owner\": \"Emmitt Kemmer\"}',2,'2020-03-18 08:09:17','2020-09-02 09:42:59'),(53,53,'https://gofile.io/Terry.png',1403,'{\"owner\": \"Kelley Davis\"}',2,'2019-10-11 17:39:53','2020-09-02 09:42:59'),(54,54,'https://gofile.io/Romaguera.mkv',28835,'{\"owner\": \"Evangeline Ritchie\"}',2,'2020-07-06 05:05:36','2020-09-02 09:42:59'),(55,55,'https://gofile.io/Koch.jpg',1177,'{\"owner\": \"Oran Haley\"}',3,'2020-02-24 06:55:55','2020-09-02 09:42:59'),(56,56,'https://gofile.io/Strosin.mkv',2242,'{\"owner\": \"Reymundo Howell\"}',3,'2020-06-01 01:25:15','2020-09-02 09:42:59'),(57,57,'https://gofile.io/Bruen.avi',1892,'{\"owner\": \"Kasey Nikolaus\"}',1,'2020-05-02 09:12:08','2020-09-02 09:42:59'),(58,58,'https://gofile.io/Treutel.avi',1843,'{\"owner\": \"Elliot Hoeger\"}',1,'2020-04-26 10:42:02','2020-09-02 09:42:59'),(59,59,'https://gofile.io/Rippin.png',2981,'{\"owner\": \"Kenya Haley\"}',1,'2020-01-03 12:17:36','2020-09-02 09:42:59'),(60,60,'https://gofile.io/Cremin.jpg',33363,'{\"owner\": \"Sigurd Carter\"}',1,'2020-04-04 18:29:17','2020-09-02 09:42:59'),(61,61,'https://gofile.io/Bruen.png',2438,'{\"owner\": \"Chaim Jenkins\"}',1,'2020-06-02 09:01:28','2020-09-02 09:42:59'),(62,62,'https://gofile.io/Monahan.png',1193,'{\"owner\": \"Chaim Jenkins\"}',3,'2020-04-17 13:44:12','2020-09-02 09:42:59'),(63,63,'https://gofile.io/Romaguera.jpg',2814,'{\"owner\": \"Rhianna Witting\"}',1,'2020-06-26 13:33:49','2020-09-02 09:42:59'),(64,64,'https://gofile.io/Monahan.jpg',1882,'{\"owner\": \"Gina King\"}',1,'2019-12-01 00:11:28','2020-09-02 09:42:59'),(65,65,'https://gofile.io/Lebsack.mkv',1304,'{\"owner\": \"Fannie Fay\"}',2,'2019-11-16 05:47:25','2020-09-02 09:42:59'),(66,66,'https://gofile.io/Breitenberg.jpg',79312,'{\"owner\": \"Emma Hoppe\"}',3,'2019-10-26 12:26:17','2020-09-02 09:42:59'),(67,67,'https://gofile.io/Prohaska.mkv',1726,'{\"owner\": \"Nichole Hyatt\"}',2,'2020-05-06 15:16:22','2020-09-02 09:42:59'),(68,68,'https://gofile.io/Hoppe.avi',2690,'{\"owner\": \"Gisselle Barton\"}',1,'2020-03-03 16:39:39','2020-09-02 09:42:59'),(69,69,'https://gofile.io/Sporer.mkv',1482,'{\"owner\": \"Ida Monahan\"}',2,'2019-12-08 20:47:39','2020-09-02 09:42:59'),(70,70,'https://gofile.io/Bartell.jpg',1127,'{\"owner\": \"Adonis Greenfelder\"}',3,'2020-01-28 07:55:52','2020-09-02 09:42:59'),(71,71,'https://gofile.io/Hoeger.png',2003,'{\"owner\": \"Peggie Jacobi\"}',3,'2020-02-09 07:24:10','2020-09-02 09:42:59'),(72,72,'https://gofile.io/Romaguera.png',2688,'{\"owner\": \"Evelyn Bruen\"}',1,'2019-08-21 11:02:37','2020-09-02 09:42:59'),(73,73,'https://gofile.io/Jacobi.png',2533,'{\"owner\": \"Colton Haley\"}',2,'2020-04-19 23:59:46','2020-09-02 09:42:59'),(74,74,'https://gofile.io/Fisher.avi',95469,'{\"owner\": \"Herman Lehner\"}',3,'2020-07-06 22:04:50','2020-09-02 09:42:59'),(75,75,'https://gofile.io/Murphy.png',2032,'{\"owner\": \"Alva Barrows\"}',2,'2020-01-11 21:42:25','2020-09-02 09:42:59'),(76,76,'https://gofile.io/Barton.avi',38411,'{\"owner\": \"Garrick Sawayn\"}',3,'2020-02-02 07:02:43','2020-09-02 09:42:59'),(77,77,'https://gofile.io/Schamberger.png',2260,'{\"owner\": \"Wanda Hintz\"}',3,'2019-10-12 12:43:43','2020-09-02 09:42:59'),(78,78,'https://gofile.io/Witting.jpg',4648,'{\"owner\": \"Weldon Romaguera\"}',2,'2020-04-11 05:49:13','2020-09-02 09:42:59'),(79,79,'https://gofile.io/Armstrong.avi',2283,'{\"owner\": \"Felipe Terry\"}',3,'2019-10-12 13:18:20','2020-09-02 09:42:59'),(80,80,'https://gofile.io/Strosin.jpg',1133,'{\"owner\": \"Aglae Kassulke\"}',3,'2020-05-25 18:06:58','2020-09-02 09:42:59'),(81,81,'https://gofile.io/Senger.mkv',1453,'{\"owner\": \"Leo Weissnat\"}',1,'2019-09-04 07:27:22','2020-09-02 09:42:59'),(82,82,'https://gofile.io/Rippin.png',7006,'{\"owner\": \"Virginie Prohaska\"}',2,'2019-10-22 11:36:49','2020-09-02 09:42:59'),(83,83,'https://gofile.io/Murazik.mkv',20090,'{\"owner\": \"Harmony Mills\"}',3,'2020-04-05 09:06:59','2020-09-02 09:42:59'),(84,84,'https://gofile.io/Willms.mkv',2713,'{\"owner\": \"Ida Monahan\"}',2,'2019-11-11 20:48:39','2020-09-02 09:42:59'),(85,85,'https://gofile.io/Klein.jpg',78430,'{\"owner\": \"Vergie Predovic\"}',2,'2020-04-30 21:14:18','2020-09-02 09:42:59'),(86,86,'https://gofile.io/Rohan.png',1054,'{\"owner\": \"Jaida Murphy\"}',1,'2020-07-03 23:08:30','2020-09-02 09:42:59'),(87,87,'https://gofile.io/Kerluke.mkv',1637,'{\"owner\": \"Gina King\"}',3,'2020-05-24 14:38:59','2020-09-02 09:42:59'),(88,88,'https://gofile.io/Schultz.jpg',1244,'{\"owner\": \"Fatima Monahan\"}',3,'2019-09-10 19:32:24','2020-09-02 09:42:59'),(89,89,'https://gofile.io/Hand.png',30880,'{\"owner\": \"Luisa Ziemann\"}',1,'2019-10-09 12:28:52','2020-09-02 09:42:59'),(90,90,'https://gofile.io/Brown.mkv',1659,'{\"owner\": \"Ida Monahan\"}',3,'2020-06-05 05:39:55','2020-09-02 09:42:59'),(91,91,'https://gofile.io/Waelchi.png',2823,'{\"owner\": \"Kenya Haley\"}',2,'2019-10-10 16:34:30','2020-09-02 09:42:59'),(92,92,'https://gofile.io/Hand.avi',2218,'{\"owner\": \"Pablo Tillman\"}',2,'2019-09-07 06:30:36','2020-09-02 09:42:59'),(93,93,'https://gofile.io/Hintz.png',18110,'{\"owner\": \"Pablo Tillman\"}',2,'2019-11-17 18:18:33','2020-09-02 09:42:59'),(94,94,'https://gofile.io/Mann.jpg',96910,'{\"owner\": \"Alex Will\"}',1,'2020-07-27 23:11:30','2020-09-02 09:42:59'),(95,95,'https://gofile.io/Ondricka.mkv',29220,'{\"owner\": \"Duane Romaguera\"}',2,'2019-12-07 08:38:18','2020-09-02 09:42:59'),(96,96,'https://gofile.io/Hand.jpg',1867,'{\"owner\": \"Reese Conroy\"}',3,'2020-01-27 11:25:14','2020-09-02 09:42:59'),(97,97,'https://gofile.io/Hyatt.jpg',54372,'{\"owner\": \"Felipe Terry\"}',2,'2019-11-24 01:31:17','2020-09-02 09:42:59'),(98,98,'https://gofile.io/Predovic.mkv',1010,'{\"owner\": \"Wallace Armstrong\"}',1,'2020-02-27 19:46:43','2020-09-02 09:42:59'),(99,99,'https://gofile.io/Hyatt.jpg',1178,'{\"owner\": \"Luisa Ziemann\"}',3,'2020-02-09 03:46:26','2020-09-02 09:42:59'),(100,100,'https://gofile.io/Barrows.mkv',2057,'{\"owner\": \"Luisa Ziemann\"}',3,'2020-08-04 21:50:36','2020-09-02 09:42:59');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'image','2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,'video','2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,'audio','2020-05-19 01:09:48','2020-08-26 09:27:30');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id_fk` (`from_user_id`),
  KEY `messages_to_user_id_fk` (`to_user_id`),
  CONSTRAINT `messages_from_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id_fk` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,15,'Et possimus aliquam est inventore.',0,0,'2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,2,73,'Quae fuga dicta debitis.',1,0,'2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,3,32,'Qui tempora ut quaerat.',1,1,'2020-05-19 01:09:48','2020-08-26 09:27:30'),(4,4,78,'Beatae et iste quo voluptatem illum.',0,1,'2019-11-25 01:43:31','2020-01-03 09:19:05'),(5,5,14,'Possimus saepe dolorem quia.',1,1,'2019-09-15 00:23:21','2019-10-15 13:04:57'),(6,6,87,'Qui laboriosam dolorum qui ea eum tenetur et.',1,0,'2020-05-16 07:20:51','2020-08-04 17:12:25'),(7,7,14,'Excepturi voluptates quo beatae exercitationem.',0,0,'2020-07-11 02:21:50','2020-08-26 09:27:30'),(8,8,72,'Maiores quas iure dolores sed.',0,0,'2020-07-03 15:59:20','2020-08-26 09:27:30'),(9,9,28,'Velit est nobis earum ut qui eius.',1,0,'2020-08-17 21:02:09','2020-08-26 09:27:30'),(10,10,99,'Illo accusantium porro quis qui sed.',1,0,'2020-02-02 19:30:22','2020-08-17 01:24:21'),(11,11,11,'Totam est sequi eaque rerum.',1,0,'2019-11-18 02:44:27','2020-06-18 10:28:37'),(12,12,86,'Aut officia ipsa possimus.',0,0,'2019-12-21 16:13:08','2020-08-26 09:27:30'),(13,13,98,'Accusantium error sequi est numquam.',1,1,'2020-03-17 00:19:38','2020-08-26 09:27:30'),(14,14,91,'Eos error sint quibusdam molestiae.',1,0,'2020-05-06 08:08:10','2020-06-01 22:39:41'),(15,15,40,'Et odit modi nemo sunt quibusdam saepe quisquam.',0,0,'2020-03-15 16:25:02','2020-08-26 09:27:30'),(16,16,27,'Quis aspernatur in reiciendis optio numquam.',1,1,'2020-01-13 04:10:14','2020-08-26 09:27:30'),(17,17,1,'Recusandae qui architecto nihil.',1,1,'2019-09-14 19:11:05','2020-05-22 08:16:46'),(18,18,19,'Accusamus sapiente aut quo animi recusandae.',1,0,'2020-01-30 00:19:42','2020-08-26 09:27:30'),(19,19,26,'Corporis vel dolores veniam cum corrupti id.',1,0,'2020-07-01 19:54:30','2020-08-26 09:27:30'),(20,20,80,'Nesciunt accusantium et quam aut et.',0,1,'2020-01-24 05:15:09','2020-07-09 05:17:47'),(21,21,51,'Deleniti sed excepturi animi consectetur nihil.',0,0,'2020-04-22 09:36:59','2020-08-26 09:27:30'),(22,22,51,'Rerum cum unde sint est id.',1,0,'2020-01-05 15:34:39','2020-02-07 18:07:32'),(23,23,50,'Qui nostrum et numquam nulla quos dolorem.',0,0,'2020-05-12 08:00:55','2020-08-26 09:27:30'),(24,24,80,'Debitis vel magni quae molestiae.',1,1,'2020-07-08 07:23:17','2020-08-26 09:27:30'),(25,25,94,'Reiciendis ipsam dolores praesentium doloremque.',0,1,'2020-04-30 05:22:20','2020-08-26 09:27:30'),(26,26,24,'Id aut autem atque debitis ea illo.',0,1,'2020-05-02 06:02:37','2020-08-26 09:27:30'),(27,27,55,'Aut ullam numquam aperiam pariatur quia debitis.',1,0,'2020-05-22 08:13:51','2020-08-26 09:27:30'),(28,28,80,'Nemo quam ea atque ea quis id mollitia.',1,1,'2019-08-20 16:14:14','2020-04-04 01:29:39'),(29,29,36,'Et laborum dolor doloremque officia et.',1,1,'2019-09-29 22:09:37','2020-07-14 04:44:18'),(30,30,30,'Qui dolor dignissimos enim.',0,0,'2019-12-12 00:41:24','2020-03-17 19:06:25'),(31,31,87,'Est voluptatum molestiae enim rerum ratione.',1,0,'2019-08-31 13:10:16','2019-12-26 21:11:51'),(32,32,51,'Molestiae nam quos sed voluptatem et eum nostrum.',1,0,'2019-12-01 23:15:29','2020-03-24 04:35:16'),(33,33,3,'Est non ratione reiciendis quisquam.',1,0,'2020-05-12 08:33:48','2020-05-14 18:59:40'),(34,34,19,'Error veritatis quam sit optio.',0,1,'2020-02-29 00:43:01','2020-08-26 09:27:30'),(35,35,28,'Sed iusto repellat ab.',1,0,'2020-02-11 18:34:07','2020-03-18 03:47:49'),(36,36,16,'Ut ea minima sapiente est fugit.',1,1,'2020-06-23 05:34:54','2020-08-14 12:51:11'),(37,37,5,'Itaque accusamus et vero est autem itaque.',1,1,'2020-07-09 17:57:07','2020-08-26 09:27:30'),(38,38,41,'Voluptate in est at et nihil enim et harum.',0,0,'2020-07-21 06:16:48','2020-08-26 09:27:30'),(39,39,88,'Et placeat sequi sed ab est in.',0,0,'2019-11-10 04:47:14','2019-12-18 04:21:03'),(40,40,33,'Voluptatem nemo ipsa non rem.',0,0,'2019-09-25 17:31:42','2020-05-05 02:19:28'),(41,41,40,'Eum repellat ut incidunt maiores hic enim.',1,1,'2019-12-18 01:58:44','2020-03-27 12:19:13'),(42,42,98,'Maxime consequuntur qui velit explicabo quasi.',1,1,'2019-11-09 04:35:10','2020-08-26 09:27:30'),(43,43,18,'Ut quibusdam autem eos facere quisquam accusamus.',1,0,'2020-04-28 15:05:44','2020-08-26 09:27:30'),(44,44,38,'Unde vel ut blanditiis.',1,1,'2019-11-25 22:57:53','2020-02-22 22:21:24'),(45,45,89,'Quam praesentium quas quod quia debitis enim et.',1,0,'2020-06-16 01:04:49','2020-08-08 02:42:24'),(46,46,58,'Mollitia error deleniti doloribus consequatur.',1,1,'2019-11-27 04:43:15','2020-03-12 03:43:20'),(47,47,64,'Quo quasi cupiditate non a molestiae.',1,0,'2020-01-31 11:26:59','2020-08-26 09:27:30'),(48,48,90,'Nisi ex aut rerum voluptatem fuga ipsa.',1,1,'2020-06-20 01:37:12','2020-08-26 09:27:30'),(49,49,76,'Neque iste aut vel cumque odio.',0,1,'2019-10-15 02:28:26','2020-08-26 09:27:30'),(50,50,90,'Ut vitae reprehenderit quaerat at a at.',0,1,'2020-08-06 23:37:55','2020-08-26 09:27:30'),(51,51,69,'Nam provident quia ut eaque.',0,1,'2020-01-19 14:32:56','2020-07-08 16:59:05'),(52,52,27,'Omnis excepturi repellendus et optio.',0,1,'2020-03-18 08:09:17','2020-08-11 12:24:54'),(53,53,41,'Nisi consequatur doloribus qui et numquam.',0,0,'2019-10-11 17:39:53','2019-12-19 10:54:20'),(54,54,19,'Facere sunt et aut qui sapiente et.',1,0,'2020-07-06 05:05:36','2020-08-26 09:27:30'),(55,55,6,'Et repudiandae magni ex ab.',1,1,'2020-02-24 06:55:55','2020-07-07 03:46:02'),(56,56,34,'Assumenda ad quas rerum soluta.',0,0,'2020-06-01 01:25:15','2020-08-26 09:27:30'),(57,57,42,'Amet qui laborum tempora ut dolores quo repellat.',1,0,'2020-05-02 09:12:08','2020-08-26 09:27:30'),(58,58,60,'Quidem at ea officiis.',1,1,'2020-04-26 10:42:02','2020-08-26 09:27:30'),(59,59,14,'Rerum ducimus itaque perspiciatis qui itaque qui.',0,0,'2020-01-03 12:17:36','2020-02-12 05:39:30'),(60,60,77,'Sed possimus amet rerum dolor.',0,1,'2020-04-04 18:29:17','2020-08-26 09:27:30'),(61,61,89,'Esse aspernatur sint aliquid veniam consectetur.',0,1,'2020-06-02 09:01:28','2020-08-26 09:27:30'),(62,62,1,'Distinctio velit tenetur atque.',0,1,'2020-04-17 13:44:12','2020-08-26 09:27:30'),(63,63,27,'Doloribus numquam omnis dolorem accusantium est.',1,1,'2020-06-26 13:33:49','2020-08-26 09:27:30'),(64,64,92,'Iure non totam id atque aperiam est.',1,0,'2019-12-01 00:11:28','2020-03-09 06:23:49'),(65,65,19,'Est magni autem sunt sed sunt.',0,0,'2019-11-16 05:47:25','2020-06-23 05:51:07'),(66,66,55,'Perspiciatis sit modi temporibus hic aperiam.',0,0,'2019-10-26 12:26:17','2020-08-26 09:27:30'),(67,67,7,'Sint quod voluptas sed ipsum vel aliquid error.',0,0,'2020-05-06 15:16:22','2020-08-26 09:27:30'),(68,68,24,'Non occaecati exercitationem sapiente autem fuga.',1,1,'2020-03-03 16:39:39','2020-03-12 02:08:38'),(69,69,96,'Dolore vitae rerum in sit harum animi quia.',1,0,'2019-12-08 20:47:39','2020-07-14 08:01:38'),(70,70,94,'Quia dolor numquam nam ad.',1,0,'2020-01-28 07:55:52','2020-06-10 13:26:46'),(71,71,56,'Reprehenderit magni aut architecto.',1,1,'2020-02-09 07:24:10','2020-07-03 10:14:47'),(72,72,35,'Ullam dolores provident et cumque quo sed ut ut.',1,1,'2019-08-21 11:02:37','2020-05-23 19:50:03'),(73,73,92,'Ducimus tempore id itaque aut minus.',1,1,'2020-04-19 23:59:46','2020-08-26 09:27:30'),(74,74,74,'Dolor quam quae ipsam nisi.',1,1,'2020-07-06 22:04:50','2020-08-26 09:27:30'),(75,75,73,'Quia repellendus neque ratione nihil in.',0,1,'2020-01-11 21:42:25','2020-02-29 02:41:09'),(76,76,81,'A rerum deleniti velit unde soluta.',0,0,'2020-02-02 07:02:43','2020-08-26 09:27:30'),(77,77,32,'Repellat et quibusdam reprehenderit omnis.',1,0,'2019-10-12 12:43:43','2020-08-26 09:27:30'),(78,78,37,'Iusto ea dolorem esse atque.',0,1,'2020-04-11 05:49:13','2020-08-26 09:27:30'),(79,79,70,'Occaecati nobis officiis sed autem voluptas.',1,1,'2019-10-12 13:18:20','2019-11-22 20:39:42'),(80,80,8,'Minus nemo ipsum est et quo ut in alias.',0,0,'2020-05-25 18:06:58','2020-06-09 22:49:40'),(81,81,26,'Est qui eveniet soluta id.',0,0,'2019-09-04 07:27:22','2019-10-31 08:55:43'),(82,82,39,'Provident laudantium inventore tempore ab.',0,0,'2019-10-22 11:36:49','2020-03-18 00:51:31'),(83,83,34,'At ut earum adipisci ex tempore non nulla.',1,1,'2020-04-05 09:06:59','2020-05-08 21:39:31'),(84,84,66,'Nisi corporis totam rem delectus.',0,0,'2019-11-11 20:48:39','2020-01-17 11:58:35'),(85,85,57,'Id rem quo ut consequatur.',0,0,'2020-04-30 21:14:18','2020-06-02 08:24:07'),(86,86,39,'Repellat ab inventore quia aut rem quos ea magni.',1,0,'2020-07-03 23:08:30','2020-08-26 09:27:30'),(87,87,100,'Et earum quo reiciendis aut quis iste.',1,1,'2020-05-24 14:38:59','2020-08-26 09:27:30'),(88,88,98,'Perspiciatis et officia veritatis sunt.',1,1,'2019-09-10 19:32:24','2020-08-15 04:29:19'),(89,89,99,'Ipsa enim sit et mollitia.',0,0,'2019-10-09 12:28:52','2019-12-19 12:26:09'),(90,90,14,'Nam velit nostrum excepturi odit asperiores.',1,1,'2020-06-05 05:39:55','2020-08-26 09:27:30'),(91,91,75,'Aut ipsum qui qui dicta in omnis amet.',1,1,'2019-10-10 16:34:30','2020-05-06 09:23:31'),(92,92,87,'Quasi modi aut et rerum corporis deleniti nam.',0,1,'2019-09-07 06:30:36','2020-06-13 19:46:00'),(93,93,14,'Expedita commodi aliquam neque dolores tenetur.',1,1,'2019-11-17 18:18:33','2019-11-22 20:45:13'),(94,94,2,'Aut nihil iste at et ut.',1,1,'2020-07-27 23:11:30','2020-08-26 09:27:30'),(95,95,78,'Qui libero non corporis ducimus praesentium.',0,0,'2019-12-07 08:38:18','2020-08-18 17:55:05'),(96,96,32,'Molestiae mollitia et eum.',1,0,'2020-01-27 11:25:14','2020-02-28 00:52:20'),(97,97,56,'Dolore nam quia incidunt error maxime qui.',1,0,'2019-11-24 01:31:17','2020-08-26 09:27:30'),(98,98,85,'Rem et ipsa atque praesentium.',0,0,'2020-02-27 19:46:43','2020-07-17 23:56:23'),(99,99,56,'Autem voluptates officia rerum corrupti nam et.',0,1,'2020-02-09 03:46:26','2020-06-27 07:04:07'),(100,100,51,'Deserunt ullam quia non qui eum eum.',0,1,'2020-08-04 21:50:36','2020-08-26 09:27:30');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `community_id` int unsigned DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '1',
  `is_archived` tinyint(1) DEFAULT '0',
  `views_counter` int unsigned DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_fk` (`user_id`),
  KEY `posts_community_id_fk` (`community_id`),
  KEY `posts_media_id_fk` (`media_id`),
  CONSTRAINT `posts_community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_media_id_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,5,'Et','Et possimus',1,0,0,227,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(2,2,11,'Quae','Quae fuga',2,1,0,843,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(3,3,14,'Qui','Qui tempora',3,1,1,970,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(4,4,15,'Beatae','Beatae et',4,0,1,833,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(5,5,19,'Possimus','Possimus saepe',5,1,1,99,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(6,6,15,'Qui','Qui laboriosam',6,1,0,380,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(7,7,14,'Excepturi','Excepturi voluptates',7,0,0,321,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(8,8,11,'Maiores','Maiores quas',8,0,0,683,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(9,9,17,'Velit','Velit est',9,1,0,80,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(10,10,19,'Illo','Illo accusantium',10,1,0,377,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(11,11,3,'Totam','Totam est',11,1,0,432,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(12,12,17,'Aut','Aut officia',12,0,0,814,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(13,13,13,'Accusantium','Accusantium error',13,1,1,570,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(14,14,1,'Eos','Eos error',14,1,0,499,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(15,15,8,'Et','Et odit',15,0,0,351,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(16,16,13,'Quis','Quis aspernatur',16,1,1,177,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(17,17,19,'Recusandae','Recusandae qui',17,1,1,200,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(18,18,4,'Accusamus','Accusamus sapiente',18,1,0,192,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(19,19,10,'Corporis','Corporis vel',19,1,0,848,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(20,20,16,'Nesciunt','Nesciunt accusantium',20,0,1,385,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(21,21,12,'Deleniti','Deleniti sed',21,0,0,680,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(22,22,14,'Rerum','Rerum cum',22,1,0,444,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(23,23,3,'Qui','Qui nostrum',23,0,0,314,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(24,24,4,'Debitis','Debitis vel',24,1,1,958,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(25,25,6,'Reiciendis','Reiciendis ipsam',25,0,1,383,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(26,26,4,'Id','Id aut',26,0,1,652,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(27,27,16,'Aut','Aut ullam',27,1,0,939,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(28,28,8,'Nemo','Nemo quam',28,1,1,970,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(29,29,16,'Et','Et laborum',29,1,1,975,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(30,30,11,'Qui','Qui dolor',30,0,0,790,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(31,31,7,'Est','Est voluptatum',31,1,0,226,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(32,32,4,'Molestiae','Molestiae nam',32,1,0,182,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(33,33,8,'Est','Est non',33,1,0,424,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(34,34,19,'Error','Error veritatis',34,0,1,420,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(35,35,6,'Sed','Sed iusto',35,1,0,160,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(36,36,19,'Ut','Ut ea',36,1,1,260,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(37,37,10,'Itaque','Itaque accusamus',37,1,1,484,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(38,38,2,'Voluptate','Voluptate in',38,0,0,855,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(39,39,2,'Et','Et placeat',39,0,0,876,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(40,40,3,'Voluptatem','Voluptatem nemo',40,0,0,951,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(41,41,9,'Eum','Eum repellat',41,1,1,176,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(42,42,14,'Maxime','Maxime consequuntur',42,1,1,778,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(43,43,19,'Ut','Ut quibusdam',43,1,0,191,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(44,44,5,'Unde','Unde vel',44,1,1,619,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(45,45,8,'Quam','Quam praesentium',45,1,0,43,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(46,46,2,'Mollitia','Mollitia error',46,1,1,236,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(47,47,20,'Quo','Quo quasi',47,1,0,91,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(48,48,12,'Nisi','Nisi ex',48,1,1,599,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(49,49,6,'Neque','Neque iste',49,0,1,561,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(50,50,20,'Ut','Ut vitae',50,0,1,258,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(51,51,7,'Nam','Nam provident',51,0,1,854,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(52,52,6,'Omnis','Omnis excepturi',52,0,1,892,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(53,53,12,'Nisi','Nisi consequatur',53,0,0,267,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(54,54,12,'Facere','Facere sunt',54,1,0,36,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(55,55,10,'Et','Et repudiandae',55,1,1,277,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(56,56,20,'Assumenda','Assumenda ad',56,0,0,932,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(57,57,17,'Amet','Amet qui',57,1,0,216,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(58,58,14,'Quidem','Quidem at',58,1,1,708,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(59,59,11,'Rerum','Rerum ducimus',59,0,0,505,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(60,60,19,'Sed','Sed possimus',60,0,1,219,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(61,61,6,'Esse','Esse aspernatur',61,0,1,616,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(62,62,7,'Distinctio','Distinctio velit',62,0,1,728,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(63,63,14,'Doloribus','Doloribus numquam',63,1,1,282,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(64,64,7,'Iure','Iure non',64,1,0,793,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(65,65,20,'Est','Est magni',65,0,0,531,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(66,66,15,'Perspiciatis','Perspiciatis sit',66,0,0,944,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(67,67,12,'Sint','Sint quod',67,0,0,154,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(68,68,20,'Non','Non occaecati',68,1,1,427,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(69,69,4,'Dolore','Dolore vitae',69,1,0,717,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(70,70,20,'Quia','Quia dolor',70,1,0,787,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(71,71,20,'Reprehenderit','Reprehenderit magni',71,1,1,488,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(72,72,11,'Ullam','Ullam dolores',72,1,1,186,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(73,73,7,'Ducimus','Ducimus tempore',73,1,1,142,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(74,74,14,'Dolor','Dolor quam',74,1,1,16,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(75,75,1,'Quia','Quia repellendus',75,0,1,14,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(76,76,1,'A','A rerum',76,0,0,123,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(77,77,11,'Repellat','Repellat et',77,1,0,211,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(78,78,11,'Iusto','Iusto ea',78,0,1,900,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(79,79,20,'Occaecati','Occaecati nobis',79,1,1,191,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(80,80,1,'Minus','Minus nemo',80,0,0,517,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(81,81,11,'Est','Est qui',81,0,0,99,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(82,82,19,'Provident','Provident laudantium',82,0,0,228,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(83,83,9,'At','At ut',83,1,1,428,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(84,84,18,'Nisi','Nisi corporis',84,0,0,74,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(85,85,16,'Id','Id rem',85,0,0,546,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(86,86,10,'Repellat','Repellat ab',86,1,0,713,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(87,87,4,'Et','Et earum',87,1,1,627,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(88,88,14,'Perspiciatis','Perspiciatis et',88,1,1,484,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(89,89,9,'Ipsa','Ipsa enim',89,0,0,554,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(90,90,12,'Nam','Nam velit',90,1,1,173,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(91,91,4,'Aut','Aut ipsum',91,1,1,299,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(92,92,1,'Quasi','Quasi modi',92,0,1,108,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(93,93,11,'Expedita','Expedita commodi',93,1,1,358,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(94,94,4,'Aut','Aut nihil',94,1,1,829,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(95,95,13,'Qui','Qui libero',95,0,0,527,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(96,96,17,'Molestiae','Molestiae mollitia',96,1,0,553,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(97,97,6,'Dolore','Dolore nam',97,1,0,749,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(98,98,19,'Rem','Rem et',98,0,0,262,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(99,99,13,'Autem','Autem voluptates',99,0,1,228,'2020-09-02 09:45:25','2020-09-02 09:45:25'),(100,100,7,'Deserunt','Deserunt ullam',100,0,1,974,'2020-09-02 09:45:25','2020-09-02 09:45:25');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `photo_id` int unsigned DEFAULT NULL,
  `city` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`),
  KEY `profiles_photo_id_fk` (`photo_id`),
  CONSTRAINT `profiles_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1975-09-13',44,'Port Tomton','Colombia','2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,'m','2015-12-08',49,'Port Francescoshire','Panama','2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,'m','2006-11-06',12,'South Kaileychester','Uganda','2020-05-19 01:09:48','2020-08-26 09:27:30'),(4,'m','1986-03-29',12,'Heaneyview','Lao People\'s Democratic Republic','2019-11-25 01:43:31','2020-01-03 09:19:05'),(5,'m','1990-05-12',26,'East Gloria','Madagascar','2019-09-15 00:23:21','2019-10-15 13:04:57'),(6,'f','1982-02-01',92,'West Cecil','Guatemala','2020-05-16 07:20:51','2020-08-04 17:12:25'),(7,'m','2003-10-25',81,'Lake Jackieland','Equatorial Guinea','2020-07-11 02:21:50','2020-08-26 09:27:30'),(8,'f','1977-08-28',29,'Powlowskishire','Belgium','2020-07-03 15:59:20','2020-08-26 09:27:30'),(9,'m','1986-09-30',100,'Johnstonfort','Holy See (Vatican City State)','2020-08-17 21:02:09','2020-08-26 09:27:30'),(10,'f','1994-03-24',14,'South Jaylan','Cyprus','2020-02-02 19:30:22','2020-08-17 01:24:21'),(11,'m','2002-09-12',71,'Port Hilda','Antigua and Barbuda','2019-11-18 02:44:27','2020-06-18 10:28:37'),(12,'f','1996-08-28',11,'Lake Emelia','Slovakia (Slovak Republic)','2019-12-21 16:13:08','2020-08-26 09:27:30'),(13,'m','2019-09-03',40,'West Caitlyn','Reunion','2020-03-17 00:19:38','2020-08-26 09:27:30'),(14,'m','1990-04-25',66,'New Bertramfurt','Morocco','2020-05-06 08:08:10','2020-06-01 22:39:41'),(15,'m','1996-02-06',9,'Jaskolskibury','Zambia','2020-03-15 16:25:02','2020-08-26 09:27:30'),(16,'f','1993-06-06',47,'Mariaborough','Saint Martin','2020-01-13 04:10:14','2020-08-26 09:27:30'),(17,'m','2018-05-24',7,'Hicklechester','Korea','2019-09-14 19:11:05','2020-05-22 08:16:46'),(18,'m','2014-10-04',96,'New Gretatown','Zambia','2020-01-30 00:19:42','2020-08-26 09:27:30'),(19,'m','2015-12-11',56,'Connville','United States Minor Outlying Islands','2020-07-01 19:54:30','2020-08-26 09:27:30'),(20,'f','2015-11-30',92,'Lockmanshire','Gabon','2020-01-24 05:15:09','2020-07-09 05:17:47'),(21,'m','1979-08-18',94,'Lake Magnoliahaven','Cyprus','2020-04-22 09:36:59','2020-08-26 09:27:30'),(22,'m','2017-01-13',90,'Handburgh','Georgia','2020-01-05 15:34:39','2020-02-07 18:07:32'),(23,'f','1970-07-31',69,'Quigleytown','Switzerland','2020-05-12 08:00:55','2020-08-26 09:27:30'),(24,'m','1987-12-10',75,'West Krystina','Israel','2020-07-08 07:23:17','2020-08-26 09:27:30'),(25,'f','2014-02-01',67,'Claudiebury','Saint Barthelemy','2020-04-30 05:22:20','2020-08-26 09:27:30'),(26,'m','1974-01-21',9,'South Dawn','Seychelles','2020-05-02 06:02:37','2020-08-26 09:27:30'),(27,'f','2009-11-08',42,'South Paige','Liechtenstein','2020-05-22 08:13:51','2020-08-26 09:27:30'),(28,'f','1975-01-16',84,'South Erwinshire','Cote d\'Ivoire','2019-08-20 16:14:14','2020-04-04 01:29:39'),(29,'m','2013-03-28',92,'Konopelskiburgh','Singapore','2019-09-29 22:09:37','2020-07-14 04:44:18'),(30,'f','1990-03-30',10,'New Elisabethmouth','Equatorial Guinea','2019-12-12 00:41:24','2020-03-17 19:06:25'),(31,'m','2019-12-21',71,'Greenmouth','Kyrgyz Republic','2019-08-31 13:10:16','2019-12-26 21:11:51'),(32,'m','1997-08-01',26,'Moenport','Yemen','2019-12-01 23:15:29','2020-03-24 04:35:16'),(33,'f','2000-03-28',15,'South Devontefort','Lesotho','2020-05-12 08:33:48','2020-05-14 18:59:40'),(34,'f','1979-01-02',98,'Leschbury','Uzbekistan','2020-02-29 00:43:01','2020-08-26 09:27:30'),(35,'m','1983-03-12',43,'Leximouth','Eritrea','2020-02-11 18:34:07','2020-03-18 03:47:49'),(36,'m','1986-11-16',19,'Ezraview','Saint Lucia','2020-06-23 05:34:54','2020-08-14 12:51:11'),(37,'f','1993-08-19',68,'New Urbanton','Northern Mariana Islands','2020-07-09 17:57:07','2020-08-26 09:27:30'),(38,'m','1970-09-30',82,'Trantowchester','Lebanon','2020-07-21 06:16:48','2020-08-26 09:27:30'),(39,'m','2013-06-15',7,'Padbergbury','Cape Verde','2019-11-10 04:47:14','2019-12-18 04:21:03'),(40,'m','1985-09-27',88,'East Queenie','Guyana','2019-09-25 17:31:42','2020-05-05 02:19:28'),(41,'f','2004-01-29',19,'North Antoinette','Botswana','2019-12-18 01:58:44','2020-03-27 12:19:13'),(42,'m','1981-04-21',30,'North Lewisfort','Saint Kitts and Nevis','2019-11-09 04:35:10','2020-08-26 09:27:30'),(43,'m','2009-12-28',91,'Orphabury','Nepal','2020-04-28 15:05:44','2020-08-26 09:27:30'),(44,'m','1984-02-25',66,'Port Liliana','Lithuania','2019-11-25 22:57:53','2020-02-22 22:21:24'),(45,'m','1980-08-25',54,'Meredithtown','French Guiana','2020-06-16 01:04:49','2020-08-08 02:42:24'),(46,'f','1991-10-25',73,'North Iciechester','New Zealand','2019-11-27 04:43:15','2020-03-12 03:43:20'),(47,'f','1977-06-21',3,'Lelandborough','French Polynesia','2020-01-31 11:26:59','2020-08-26 09:27:30'),(48,'m','1975-11-16',96,'Nellieville','Guernsey','2020-06-20 01:37:12','2020-08-26 09:27:30'),(49,'f','2019-02-12',68,'Anniehaven','Dominican Republic','2019-10-15 02:28:26','2020-08-26 09:27:30'),(50,'f','1987-02-19',54,'South Lincolnmouth','Turkmenistan','2020-08-06 23:37:55','2020-08-26 09:27:30'),(51,'f','2000-08-01',65,'New Diana','Malawi','2020-01-19 14:32:56','2020-07-08 16:59:05'),(52,'m','1972-01-16',63,'Cassandraville','Albania','2020-03-18 08:09:17','2020-08-11 12:24:54'),(53,'f','1984-11-24',18,'East Verdafort','Monaco','2019-10-11 17:39:53','2019-12-19 10:54:20'),(54,'m','1997-07-24',100,'New Alexandrea','Timor-Leste','2020-07-06 05:05:36','2020-08-26 09:27:30'),(55,'f','2017-09-29',46,'Port Eileen','Ghana','2020-02-24 06:55:55','2020-07-07 03:46:02'),(56,'m','2013-10-10',28,'North Alanaton','United States Minor Outlying Islands','2020-06-01 01:25:15','2020-08-26 09:27:30'),(57,'m','1973-11-13',4,'Dillonberg','United States Virgin Islands','2020-05-02 09:12:08','2020-08-26 09:27:30'),(58,'m','1987-01-07',34,'Lake Ervin','Trinidad and Tobago','2020-04-26 10:42:02','2020-08-26 09:27:30'),(59,'m','2012-04-14',56,'West Donnamouth','Estonia','2020-01-03 12:17:36','2020-02-12 05:39:30'),(60,'m','1970-01-20',78,'North Valentin','Japan','2020-04-04 18:29:17','2020-08-26 09:27:30'),(61,'f','1998-03-09',23,'Macejkovichaven','Kenya','2020-06-02 09:01:28','2020-08-26 09:27:30'),(62,'f','2018-10-30',79,'West Oranstad','Singapore','2020-04-17 13:44:12','2020-08-26 09:27:30'),(63,'f','2002-08-25',26,'South Corinestad','Cameroon','2020-06-26 13:33:49','2020-08-26 09:27:30'),(64,'f','2015-01-13',92,'East Ashtyn','Saint Vincent and the Grenadines','2019-12-01 00:11:28','2020-03-09 06:23:49'),(65,'f','2004-09-18',82,'Kraigville','Iraq','2019-11-16 05:47:25','2020-06-23 05:51:07'),(66,'f','2019-11-12',33,'Lillianamouth','Niue','2019-10-26 12:26:17','2020-08-26 09:27:30'),(67,'f','1998-05-22',18,'Meganefurt','Senegal','2020-05-06 15:16:22','2020-08-26 09:27:30'),(68,'m','1993-12-04',89,'North Harmon','Bouvet Island (Bouvetoya)','2020-03-03 16:39:39','2020-03-12 02:08:38'),(69,'f','1971-01-06',94,'Port Claudia','Guam','2019-12-08 20:47:39','2020-07-14 08:01:38'),(70,'f','1997-10-06',1,'Amanitown','Vanuatu','2020-01-28 07:55:52','2020-06-10 13:26:46'),(71,'f','2011-08-27',21,'Johnsbury','Greece','2020-02-09 07:24:10','2020-07-03 10:14:47'),(72,'m','2019-01-20',2,'South Christina','Tokelau','2019-08-21 11:02:37','2020-05-23 19:50:03'),(73,'f','1984-08-24',46,'Thelmashire','Guam','2020-04-19 23:59:46','2020-08-26 09:27:30'),(74,'m','2013-10-01',24,'Todside','Libyan Arab Jamahiriya','2020-07-06 22:04:50','2020-08-26 09:27:30'),(75,'f','1975-04-25',81,'Jamelmouth','Congo','2020-01-11 21:42:25','2020-02-29 02:41:09'),(76,'f','1980-10-06',34,'Marcelinahaven','French Southern Territories','2020-02-02 07:02:43','2020-08-26 09:27:30'),(77,'f','1980-12-07',25,'Port Alice','United States Minor Outlying Islands','2019-10-12 12:43:43','2020-08-26 09:27:30'),(78,'f','2015-11-30',22,'Macyland','Zambia','2020-04-11 05:49:13','2020-08-26 09:27:30'),(79,'f','1994-06-16',36,'East Tessie','Algeria','2019-10-12 13:18:20','2019-11-22 20:39:42'),(80,'f','1981-08-01',14,'Lake Murraychester','Sao Tome and Principe','2020-05-25 18:06:58','2020-06-09 22:49:40'),(81,'f','1977-10-04',62,'Jovanistad','Saint Martin','2019-09-04 07:27:22','2019-10-31 08:55:43'),(82,'m','2013-11-03',65,'Port Margretborough','Eritrea','2019-10-22 11:36:49','2020-03-18 00:51:31'),(83,'m','1974-12-19',39,'Breannaborough','Cuba','2020-04-05 09:06:59','2020-05-08 21:39:31'),(84,'f','1984-02-04',1,'Brownfurt','Hungary','2019-11-11 20:48:39','2020-01-17 11:58:35'),(85,'f','1992-12-06',88,'Margarettfort','Andorra','2020-04-30 21:14:18','2020-06-02 08:24:07'),(86,'m','2018-09-04',37,'Richardmouth','Canada','2020-07-03 23:08:30','2020-08-26 09:27:30'),(87,'f','1970-10-16',20,'North Emoryton','Kiribati','2020-05-24 14:38:59','2020-08-26 09:27:30'),(88,'m','1994-01-06',86,'East Annetta','Saint Martin','2019-09-10 19:32:24','2020-08-15 04:29:19'),(89,'m','1994-01-12',72,'Port Treviontown','Georgia','2019-10-09 12:28:52','2019-12-19 12:26:09'),(90,'f','2007-04-09',2,'Port Herminio','Tunisia','2020-06-05 05:39:55','2020-08-26 09:27:30'),(91,'f','1993-08-06',94,'Fritschburgh','Bosnia and Herzegovina','2019-10-10 16:34:30','2020-05-06 09:23:31'),(92,'f','1973-12-13',62,'New Cullenhaven','Malta','2019-09-07 06:30:36','2020-06-13 19:46:00'),(93,'m','1986-03-19',29,'Lake Adaline','Somalia','2019-11-17 18:18:33','2019-11-22 20:45:13'),(94,'m','1995-12-01',59,'Eugeniatown','British Indian Ocean Territory (Chagos Archipelago)','2020-07-27 23:11:30','2020-08-26 09:27:30'),(95,'f','1997-12-14',5,'Abbeybury','Malawi','2019-12-07 08:38:18','2020-08-18 17:55:05'),(96,'m','1973-02-07',47,'Waylonland','Monaco','2020-01-27 11:25:14','2020-02-28 00:52:20'),(97,'m','2004-12-23',19,'Mertzmouth','Falkland Islands (Malvinas)','2019-11-24 01:31:17','2020-08-26 09:27:30'),(98,'m','2001-12-09',54,'North Hayleyburgh','Morocco','2020-02-27 19:46:43','2020-07-17 23:56:23'),(99,'m','1985-11-19',13,'Macieshire','Ghana','2020-02-09 03:46:26','2020-06-27 07:04:07'),(100,'f','1984-12-14',3,'Yvettestad','Guatemala','2020-08-04 21:50:36','2020-08-26 09:27:30');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_types`
--

DROP TABLE IF EXISTS `target_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_types`
--

LOCK TABLES `target_types` WRITE;
/*!40000 ALTER TABLE `target_types` DISABLE KEYS */;
INSERT INTO `target_types` VALUES (1,'messages','2020-09-02 08:20:48'),(2,'users','2020-09-02 08:20:48'),(3,'media','2020-09-02 08:20:48'),(4,'posts','2020-09-02 08:20:48');
/*!40000 ALTER TABLE `target_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Meredith','Sanford','renner.fermin@example.net','542-903-5327','2020-02-24 22:02:49','2020-03-11 04:31:13'),(2,'Ellsworth','Willms','hhauck@example.org','1-360-586-9079','2020-02-06 20:49:21','2020-08-26 09:27:30'),(3,'Leilani','Oberbrunner','vreilly@example.org','(839)716-4575','2020-05-19 01:09:48','2020-08-26 09:27:30'),(4,'Kenya','Haley','gglover@example.com','898.756.8745','2019-11-25 01:43:31','2020-01-03 09:19:05'),(5,'Zoie','Turcotte','christiana.kreiger@example.com','03017603453','2019-09-15 00:23:21','2019-10-15 13:04:57'),(6,'Elna','Larkin','mccullough.fred@example.org','917.523.9197x45381','2020-05-16 07:20:51','2020-08-04 17:12:25'),(7,'Tyrel','Lind','saul.zieme@example.com','(135)751-9983x384','2020-07-11 02:21:50','2020-08-26 09:27:30'),(8,'Amanda','Kunde','kenya75@example.com','1-360-036-1054x447','2020-07-03 15:59:20','2020-08-26 09:27:30'),(9,'Alexandrea','Pollich','nicolas.alysson@example.net','245.190.6731','2020-08-17 21:02:09','2020-08-26 09:27:30'),(10,'Clark','Rohan','greenfelder.frida@example.org','591-716-0028','2020-02-02 19:30:22','2020-08-17 01:24:21'),(11,'Dessie','Nicolas','ycronin@example.net','1-644-960-1648x217','2019-11-18 02:44:27','2020-06-18 10:28:37'),(12,'Violette','Ritchie','cortney.roberts@example.com','(169)370-2522x2754','2019-12-21 16:13:08','2020-08-26 09:27:30'),(13,'Coleman','Upton','laisha.schaefer@example.net','1-897-251-3754x96460','2020-03-17 00:19:38','2020-08-26 09:27:30'),(14,'Harmony','Mills','fnikolaus@example.org','1-178-261-2216','2020-05-06 08:08:10','2020-06-01 22:39:41'),(15,'Mathew','Klein','omarvin@example.com','(604)377-8191x00476','2020-03-15 16:25:02','2020-08-26 09:27:30'),(16,'Gaetano','Barton','tillman.felicia@example.com','(239)390-8014x9146','2020-01-13 04:10:14','2020-08-26 09:27:30'),(17,'Carolina','Schamberger','grant.pink@example.com','+16(8)0260830702','2019-09-14 19:11:05','2020-05-22 08:16:46'),(18,'Eriberto','Daugherty','rkreiger@example.org','157.213.5791x836','2020-01-30 00:19:42','2020-08-26 09:27:30'),(19,'Hanna','Gerhold','general35@example.net','417-686-0987x9199','2020-07-01 19:54:30','2020-08-26 09:27:30'),(20,'Alva','Barrows','ischaefer@example.net','1-373-289-5769x804','2020-01-24 05:15:09','2020-07-09 05:17:47'),(21,'Gisselle','Barton','cparker@example.org','+82(2)7770946469','2020-04-22 09:36:59','2020-08-26 09:27:30'),(22,'Evelyn','Bruen','tomas97@example.org','702-876-0328x154','2020-01-05 15:34:39','2020-02-07 18:07:32'),(23,'Herman','Lehner','fisher.brianne@example.net','+23(2)6847240046','2020-05-12 08:00:55','2020-08-26 09:27:30'),(24,'Ned','Bartell','erling.casper@example.org','(679)991-8402','2020-07-08 07:23:17','2020-08-26 09:27:30'),(25,'Remington','Jacobson','douglas.rosalia@example.net','(627)785-1430','2020-04-30 05:22:20','2020-08-26 09:27:30'),(26,'Nat','Welch','marielle.greenholt@example.com','(533)491-0560x323','2020-05-02 06:02:37','2020-08-26 09:27:30'),(27,'Rosamond','Stroman','christian98@example.org','1-081-020-7374x9411','2020-05-22 08:13:51','2020-08-26 09:27:30'),(28,'Fatima','Monahan','nader.kayleigh@example.com','(838)114-6061x2722','2019-08-20 16:14:14','2020-04-04 01:29:39'),(29,'Virginie','Prohaska','rippin.daphney@example.com','505-662-7270','2019-09-29 22:09:37','2020-07-14 04:44:18'),(30,'Fermin','Doyle','vkilback@example.org','1-030-891-1690x500','2019-12-12 00:41:24','2020-03-17 19:06:25'),(31,'Garrick','Sawayn','antonia83@example.com','+43(0)3597659458','2019-08-31 13:10:16','2019-12-26 21:11:51'),(32,'Kasey','Nikolaus','evie20@example.com','1-474-583-6910','2019-12-01 23:15:29','2020-03-24 04:35:16'),(33,'Luisa','Ziemann','walker.zora@example.org','(610)215-0911','2020-05-12 08:33:48','2020-05-14 18:59:40'),(34,'Emmitt','Kemmer','briana17@example.org','(501)730-1469x7420','2020-02-29 00:43:01','2020-08-26 09:27:30'),(35,'Iva','Treutel','izaiah.johnson@example.org','729.270.0288','2020-02-11 18:34:07','2020-03-18 03:47:49'),(36,'Chauncey','Crooks','corbin08@example.com','004-306-5077','2020-06-23 05:34:54','2020-08-14 12:51:11'),(37,'Trinity','Kerluke','skiles.sarina@example.org','983-404-7921x5828','2020-07-09 17:57:07','2020-08-26 09:27:30'),(38,'Elmo','Zieme','nitzsche.lorna@example.com','185.611.3642','2020-07-21 06:16:48','2020-08-26 09:27:30'),(39,'Sally','Brown','deshawn33@example.org','601-767-4048x0702','2019-11-10 04:47:14','2019-12-18 04:21:03'),(40,'Janick','Koch','kmoen@example.net','(049)766-1878x9830','2019-09-25 17:31:42','2020-05-05 02:19:28'),(41,'Nichole','Hyatt','nya.tremblay@example.com','(776)699-0144x70359','2019-12-18 01:58:44','2020-03-27 12:19:13'),(42,'Evangeline','Ritchie','hessel.carmela@example.net','+06(1)5451884566','2019-11-09 04:35:10','2020-08-26 09:27:30'),(43,'Adonis','Greenfelder','ecremin@example.net','(341)890-4928','2020-04-28 15:05:44','2020-08-26 09:27:30'),(44,'Oran','Haley','cbeier@example.com','(740)848-9545x50853','2019-11-25 22:57:53','2020-02-22 22:21:24'),(45,'Duane','Romaguera','d\'amore.sabryna@example.org','1-254-670-9740x64453','2020-06-16 01:04:49','2020-08-08 02:42:24'),(46,'Derek','Johnson','eloy.schuppe@example.org','+35(8)0815447980','2019-11-27 04:43:15','2020-03-12 03:43:20'),(47,'Ernestina','Koch','aniya92@example.org','614.897.7795x8027','2020-01-31 11:26:59','2020-08-26 09:27:30'),(48,'Shawn','Spinka','araceli.lang@example.net','729.486.9012x765','2020-06-20 01:37:12','2020-08-26 09:27:30'),(49,'Rosalia','Leannon','monserrat.grimes@example.net','354-782-3241x3740','2019-10-15 02:28:26','2020-08-26 09:27:30'),(50,'Felipe','Terry','beer.juvenal@example.net','793.007.8179x844','2020-08-06 23:37:55','2020-08-26 09:27:30'),(51,'George','Senger','vandervort.augusta@example.net','02309491489','2020-01-19 14:32:56','2020-07-08 16:59:05'),(52,'Jacky','Wintheiser','charley.hills@example.com','1-667-269-2724','2020-03-18 08:09:17','2020-08-11 12:24:54'),(53,'Andres','Fisher','vrempel@example.com','619-096-1904x8162','2019-10-11 17:39:53','2019-12-19 10:54:20'),(54,'Fannie','Fay','jade.kris@example.com','(804)885-2685','2020-07-06 05:05:36','2020-08-26 09:27:30'),(55,'Keven','Breitenberg','emile24@example.net','791.185.1660x75253','2020-02-24 06:55:55','2020-07-07 03:46:02'),(56,'Alex','Will','auer.bernice@example.com','761-057-5414','2020-06-01 01:25:15','2020-08-26 09:27:30'),(57,'Reese','Conroy','esperanza40@example.org','763.344.5019x6449','2020-05-02 09:12:08','2020-08-26 09:27:30'),(58,'Anthony','Lebsack','anais59@example.com','09037055267','2020-04-26 10:42:02','2020-08-26 09:27:30'),(59,'Harry','Sauer','jbernhard@example.net','1-921-020-2898x85608','2020-01-03 12:17:36','2020-02-12 05:39:30'),(60,'Emma','Hoppe','lucile.kirlin@example.org','+04(6)3923582598','2020-04-04 18:29:17','2020-08-26 09:27:30'),(61,'Bette','Rippin','connor23@example.org','(767)895-5783x13656','2020-06-02 09:01:28','2020-08-26 09:27:30'),(62,'Cordell','Hand','fay.dariana@example.org','06984130352','2020-04-17 13:44:12','2020-08-26 09:27:30'),(63,'Vergie','Predovic','kade90@example.net','(564)101-7807x1466','2020-06-26 13:33:49','2020-08-26 09:27:30'),(64,'Rhianna','Witting','bspencer@example.net','299.387.6046','2019-12-01 00:11:28','2020-03-09 06:23:49'),(65,'Corrine','Emard','schaefer.gaston@example.org','783.458.9891','2019-11-16 05:47:25','2020-06-23 05:51:07'),(66,'Hassan','Spinka','frami.kira@example.net','512.996.2514x251','2019-10-26 12:26:17','2020-08-26 09:27:30'),(67,'Tiara','Kris','dickinson.peter@example.net','(314)773-2664x80365','2020-05-06 15:16:22','2020-08-26 09:27:30'),(68,'Kelley','Murazik','wintheiser.mariela@example.net','(172)333-1765x30110','2020-03-03 16:39:39','2020-03-12 02:08:38'),(69,'Gina','King','darby14@example.org','790-745-9512x22660','2019-12-08 20:47:39','2020-07-14 08:01:38'),(70,'Peggie','Jacobi','streich.dustin@example.org','+00(8)4561962248','2020-01-28 07:55:52','2020-06-10 13:26:46'),(71,'Darryl','Jacobi','considine.ardith@example.org','(309)879-0074x348','2020-02-09 07:24:10','2020-07-03 10:14:47'),(72,'Jaida','Murphy','dpollich@example.net','984.247.5688x53470','2019-08-21 11:02:37','2020-05-23 19:50:03'),(73,'Delta','Predovic','antonina.klocko@example.net','565.201.9965','2020-04-19 23:59:46','2020-08-26 09:27:30'),(74,'Ryder','Johnson','vada.lesch@example.net','645-499-2296x6066','2020-07-06 22:04:50','2020-08-26 09:27:30'),(75,'Randal','Cremin','schulist.phyllis@example.org','00223872183','2020-01-11 21:42:25','2020-02-29 02:41:09'),(76,'Wallace','Armstrong','luella.kuvalis@example.org','(246)257-1102','2020-02-02 07:02:43','2020-08-26 09:27:30'),(77,'Leo','Weissnat','rowena.johns@example.com','831-366-8688x3293','2019-10-12 12:43:43','2020-08-26 09:27:30'),(78,'Pablo','Tillman','jerald.pagac@example.com','1-732-937-1841x84097','2020-04-11 05:49:13','2020-08-26 09:27:30'),(79,'Sigurd','Carter','aliya73@example.net','08867528246','2019-10-12 13:18:20','2019-11-22 20:39:42'),(80,'Elliot','Hoeger','anika46@example.com','+42(0)0955223658','2020-05-25 18:06:58','2020-06-09 22:49:40'),(81,'Ida','Monahan','xmarquardt@example.com','839.772.2344','2019-09-04 07:27:22','2019-10-31 08:55:43'),(82,'Xander','Hand','reyes63@example.net','01644625104','2019-10-22 11:36:49','2020-03-18 00:51:31'),(83,'Celine','Franecki','amiya26@example.com','(040)187-3684','2020-04-05 09:06:59','2020-05-08 21:39:31'),(84,'Chaim','Jenkins','qmills@example.org','1-985-115-9124x54172','2019-11-11 20:48:39','2020-01-17 11:58:35'),(85,'Arnoldo','Waelchi','dee26@example.com','(155)053-4205x61953','2020-04-30 21:14:18','2020-06-02 08:24:07'),(86,'Aglae','Kassulke','squitzon@example.org','450-674-5896','2020-07-03 23:08:30','2020-08-26 09:27:30'),(87,'Treva','Lakin','sortiz@example.com','(064)336-9922x951','2020-05-24 14:38:59','2020-08-26 09:27:30'),(88,'Weldon','Romaguera','lydia47@example.com','989.567.9890x646','2019-09-10 19:32:24','2020-08-15 04:29:19'),(89,'Kelley','Davis','maggio.cara@example.com','(342)246-4523','2019-10-09 12:28:52','2019-12-19 12:26:09'),(90,'Maximilian','Sporer','mreichert@example.net','(045)187-8312x0004','2020-06-05 05:39:55','2020-08-26 09:27:30'),(91,'Selina','Mann','d\'amore.walker@example.org','+60(7)8123737448','2019-10-10 16:34:30','2020-05-06 09:23:31'),(92,'Victor','Strosin','khalid88@example.org','+86(1)8215876775','2019-09-07 06:30:36','2020-06-13 19:46:00'),(93,'Reymundo','Howell','mbednar@example.com','004.130.3271x2596','2019-11-17 18:18:33','2019-11-22 20:45:13'),(94,'Liam','Ondricka','vergie.langworth@example.org','1-810-529-4146x5885','2020-07-27 23:11:30','2020-08-26 09:27:30'),(95,'Anissa','Schultz','kameron36@example.net','(852)109-0924','2019-12-07 08:38:18','2020-08-18 17:55:05'),(96,'Brycen','Schmitt','trisha.kshlerin@example.net','939-904-5337x83842','2020-01-27 11:25:14','2020-02-28 00:52:20'),(97,'Wanda','Hintz','florian.huel@example.com','(956)640-1318x8216','2019-11-24 01:31:17','2020-08-26 09:27:30'),(98,'Colton','Haley','johnathan99@example.net','(142)339-7446','2020-02-27 19:46:43','2020-07-17 23:56:23'),(99,'Christiana','Gulgowski','brook35@example.com','931-843-3513x53882','2020-02-09 03:46:26','2020-06-27 07:04:07'),(100,'Chloe','Heller','oraynor@example.org','200-633-2719x7100','2020-08-04 21:50:36','2020-08-26 09:27:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-02 11:07:15
