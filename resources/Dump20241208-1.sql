CREATE DATABASE  IF NOT EXISTS `comlabdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `comlabdb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: comlabdb
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_logs`
--

DROP TABLE IF EXISTS `admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_logs` (
  `alog_id` int NOT NULL AUTO_INCREMENT,
  `alog_date` date DEFAULT NULL,
  `alog_time` time DEFAULT NULL,
  `alog_admin_email` varchar(255) DEFAULT NULL,
  `alog_activity` varchar(100) DEFAULT NULL,
  `alog_admin_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`alog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_logs`
--

LOCK TABLES `admin_logs` WRITE;
/*!40000 ALTER TABLE `admin_logs` DISABLE KEYS */;
INSERT INTO `admin_logs` VALUES (1,'2024-12-01','09:41:23','hash@usep.edu.ph','Logged in','Faculty'),(2,'2024-12-01','09:46:28','hash@usep.edu.ph','Logged in','Faculty'),(3,'2024-12-01','09:47:24','admin','Logged in','Super Admin'),(4,'2024-12-01','09:49:54','admin','Logged in','Super Admin'),(5,'2024-12-01','09:50:46','admin','Logged in','Super Admin'),(6,'2024-12-01','09:50:57','admin','Logged out','Super Admin'),(7,'2024-12-01','09:51:10','hash@usep.edu.ph','Logged in','Faculty'),(8,'2024-12-01','09:53:32','admin','Logged in','Super Admin'),(9,'2024-12-01','09:53:43','admin','Password reset for student ID: 2022-00151','Super Admin'),(10,'2024-12-01','09:53:53','admin','Logged out','Super Admin'),(11,'2024-12-01','09:54:06','hash@usep.edu.ph','Logged in','Faculty'),(12,'2024-12-01','09:56:14','admin','Logged in','Super Admin'),(13,'2024-12-01','09:56:26','admin','Password reset for student ID: 2022-00294','Super Admin'),(14,'2024-12-01','09:56:30','admin','Logged out','Super Admin'),(15,'2024-12-01','09:56:42','hash@usep.edu.ph','Logged in','Faculty'),(16,'2024-12-01','09:56:59','hash@usep.edu.ph','Password reset for student ID: 2022-00509','Faculty'),(17,'2024-12-01','09:57:01','hash@usep.edu.ph','Logged out','Faculty'),(18,'2024-12-01','09:57:12','admin','Logged in','Super Admin'),(19,'2024-12-01','10:00:17','karl','Logged in','Super Admin'),(20,'2024-12-01','10:01:52','admin','Logged in','Super Admin'),(21,'2024-12-01','10:02:04','admin','Password reset for student ID: 2022-00509','Super Admin'),(22,'2024-12-01','10:02:55','admin','Logged in','Super Admin'),(23,'2024-12-01','10:03:21','hash@usep.edu.ph','Logged in','Faculty'),(24,'2024-12-01','10:03:33','hash@usep.edu.ph','Password reset for student ID: 2022-00509','Faculty'),(25,'2024-12-01','10:04:50','admin','Logged in','Super Admin'),(26,'2024-12-01','10:05:10','admin','Logged out','Super Admin'),(27,'2024-12-01','10:05:21','hash@usep.edu.ph','Logged in','Faculty'),(28,'2024-12-01','10:05:55','karl','Logged in','Super Admin'),(29,'2024-12-01','10:06:05','hash@usep.edu.ph','Logged in','Faculty'),(30,'2024-12-01','10:06:49','karl','Logged in','Super Admin'),(31,'2024-12-01','10:07:54','admin','Logged in','Super Admin'),(32,'2024-12-01','10:08:04','admin','Password reset for student ID: 2022-00151','Super Admin'),(33,'2024-12-01','10:08:17','admin','Logged out','Super Admin'),(34,'2024-12-01','10:08:31','hash@usep.edu.ph','Logged in','Faculty'),(35,'2024-12-01','10:08:42','hash@usep.edu.ph','Password reset for student ID: 2022-00509','Faculty'),(36,'2024-12-01','10:08:53','hash@usep.edu.ph','Logged out','Faculty'),(37,'2024-12-01','10:08:59','admin','Logged in','Super Admin'),(38,'2024-12-01','10:09:06','admin','Logged in','Super Admin'),(39,'2024-12-01','10:09:25','admin','Logged out','Super Admin'),(40,'2024-12-01','10:10:16','admin','Logged in','Super Admin'),(41,'2024-12-01','10:11:10','admin','Edited faculty ID: hash@usep.edu.ph','Super Admin'),(42,'2024-12-01','10:11:47','karl','Logged in','Super Admin'),(43,'2024-12-01','10:12:56','admin','Added faculty ID: test@usep.edu.ph','Super Admin'),(44,'2024-12-01','10:14:13','admin','Edited student ID: 2022-00294','Super Admin'),(45,'2024-12-01','10:14:27','admin','Logged in','Super Admin'),(46,'2024-12-01','10:15:03','karl','Logged in','Super Admin'),(47,'2024-12-01','10:15:18','admin','Logged in','Super Admin'),(48,'2024-12-01','10:15:53','admin','Edited faculty ID: hash@usep.edu.ph','Super Admin'),(49,'2024-12-01','10:16:59','admin','Logged in','Super Admin'),(50,'2024-12-01','10:19:45','karl','Logged in','Super Admin'),(51,'2024-12-01','10:22:22','karl','Logged in','Super Admin'),(52,'2024-12-01','10:23:17','admin','Logged in','Super Admin'),(53,'2024-12-01','10:24:35','admin','Logged in','Super Admin'),(54,'2024-12-01','10:25:25','admin','Added faculty ID: test@usep.edu.ph','Super Admin'),(55,'2024-12-01','10:25:38','karl','Logged in','Super Admin'),(56,'2024-12-01','10:26:33','admin','Logged out','Super Admin'),(57,'2024-12-01','10:26:49','hash@usep.edu.ph','Logged in','Faculty'),(58,'2024-12-01','10:28:06','karl','Logged in','Super Admin'),(59,'2024-12-01','10:28:54','hash@usep.edu.ph','Logged in','Faculty'),(60,'2024-12-01','10:31:33','admin','Logged in','Super Admin'),(61,'2024-12-01','10:31:48','admin','Logged in','Super Admin'),(62,'2024-12-01','10:32:13','karl','Logged in','Super Admin'),(63,'2024-12-01','10:32:58','admin','Logged in','Super Admin'),(64,'2024-12-01','10:35:51','karl','Logged in','Super Admin'),(65,'2024-12-01','10:41:00','karl','Logged in','Super Admin'),(66,'2024-12-01','10:43:38','karl','Logged in','Super Admin'),(67,'2024-12-01','10:46:44','karl','Logged in','Super Admin'),(68,'2024-12-01','10:48:38','karl','Logged in','Super Admin'),(69,'2024-12-01','10:50:16','admin','Logged in','Super Admin'),(70,'2024-12-01','10:51:58','karl','Logged in','Super Admin'),(71,'2024-12-01','10:53:13','karl','Logged in','Super Admin'),(72,'2024-12-01','10:54:29','karl','Logged in','Super Admin'),(73,'2024-12-01','11:09:42','karl','Logged in','Super Admin'),(74,'2024-12-01','11:10:32','admin','Logged in','Super Admin'),(75,'2024-12-01','11:12:23','karl','Logged in','Super Admin'),(76,'2024-12-01','11:13:59','admin','Logged in','Super Admin'),(77,'2024-12-01','11:15:32','karl','Logged in','Super Admin'),(78,'2024-12-01','11:16:49','karl','Logged in','Super Admin'),(79,'2024-12-01','11:19:07','admin','Logged in','Super Admin'),(80,'2024-12-01','11:19:55','karl','Logged in','Super Admin'),(81,'2024-12-01','11:21:21','admin','Logged in','Super Admin'),(82,'2024-12-01','11:24:23','karl','Logged in','Super Admin'),(83,'2024-12-01','11:25:24','admin','Logged in','Super Admin'),(84,'2024-12-01','11:26:48','admin','Logged in','Super Admin'),(85,'2024-12-01','11:27:48','karl','Logged in','Super Admin'),(86,'2024-12-01','11:28:21','karl','Edited student ID: 2022-00294','Super Admin'),(87,'2024-12-01','11:32:24','admin','Logged in','Super Admin'),(88,'2024-12-01','11:34:26','admin','Logged in','Super Admin'),(89,'2024-12-01','11:39:48','admin','Logged in','Super Admin'),(90,'2024-12-01','11:41:06','admin','Logged in','Super Admin'),(91,'2024-12-01','11:42:51','hash@usep.edu.ph','Logged in','Faculty'),(92,'2024-12-01','11:43:04','hash@usep.edu.ph','Password reset for student ID: 2022-00151','Faculty'),(93,'2024-12-01','11:44:00','hash@usep.edu.ph','Logged out','Faculty'),(94,'2024-12-01','11:44:01','admin','Logged in','Super Admin'),(95,'2024-12-01','11:46:32','admin','Logged in','Super Admin'),(96,'2024-12-01','11:47:37','admin','Logged in','Super Admin'),(97,'2024-12-01','11:58:28','admin','Logged in','Super Admin'),(98,'2024-12-01','12:00:07','admin','Logged in','Super Admin'),(99,'2024-12-01','12:01:37','hash@usep.edu.ph','Logged in','Faculty'),(100,'2024-12-01','12:01:47','hash@usep.edu.ph','Password reset for student ID: 2022-00294','Faculty'),(101,'2024-12-01','12:01:50','hash@usep.edu.ph','Password reset for student ID: 2022-00151','Faculty'),(102,'2024-12-01','12:03:20','hash@usep.edu.ph','Password reset for student ID: 2022-00294','Faculty'),(103,'2024-12-01','12:06:06','admin','Logged in','Super Admin'),(104,'2024-12-01','12:07:11','admin','Logged in','Super Admin'),(105,'2024-12-01','12:11:11','hash@usep.edu.ph','Password reset for student ID: 2022-00151','Faculty'),(106,'2024-12-01','12:17:46','karl','Password reset for student ID: 2022-00294','Super Admin'),(107,'2024-12-01','12:21:51','admin','Logged in','Super Admin'),(108,'2024-12-01','12:22:48','admin','Logged in','Super Admin'),(109,'2024-12-01','12:23:16','admin','Logged in','Super Admin'),(110,'2024-12-01','12:24:36','admin','Logged in','Super Admin'),(111,'2024-12-01','12:34:26','admin','Logged in','Super Admin'),(112,'2024-12-01','12:35:50','admin','Logged in','Super Admin'),(113,'2024-12-01','12:37:09','admin','Logged in','Super Admin'),(114,'2024-12-01','12:39:23','admin','Logged in','Super Admin'),(115,'2024-12-01','12:41:25','admin','Logged in','Super Admin'),(116,'2024-12-01','12:43:33','admin','Logged in','Super Admin'),(117,'2024-12-01','12:44:32','admin','Logged in','Super Admin'),(118,'2024-12-01','12:47:31','admin','Logged in','Super Admin'),(119,'2024-12-01','12:53:34','admin','Logged in','Super Admin'),(120,'2024-12-01','13:07:44','admin','Logged in','Super Admin'),(121,'2024-12-01','13:09:52','admin','Logged in','Super Admin'),(122,'2024-12-01','13:15:32','hash@usep.edu.ph','Password reset for student ID: 2022-00151','Faculty'),(123,'2024-12-01','13:15:55','admin','Logged in','Super Admin'),(124,'2024-12-01','13:18:06','admin','Logged in','Super Admin'),(125,'2024-12-01','13:20:12','hash@usep.edu.ph','Password reset for student ID: 2022-00151','Faculty'),(126,'2024-12-01','13:22:14','admin','Logged in','Super Admin'),(127,'2024-12-01','13:23:21','admin','Logged in','Super Admin'),(128,'2024-12-01','13:24:50','hash@usep.edu.ph','Logged out','Faculty'),(129,'2024-12-01','13:26:05','admin','Logged in','Super Admin'),(130,'2024-12-01','13:28:48','admin','Logged in','Super Admin'),(131,'2024-12-01','13:32:58','admin','Logged in','Super Admin'),(132,'2024-12-01','13:43:18','jpcosorio00256@usep.edu.ph','Logged in','Super Admin'),(133,'2024-12-01','14:00:45','admin','Logged in','Super Admin'),(134,'2024-12-01','14:25:57','admin','Logged in','Super Admin'),(135,'2024-12-01','14:28:12','admin','Logged in','Super Admin'),(136,'2024-12-01','14:28:23','karl','Password reset for student ID: 2022-00294','Super Admin'),(137,'2024-12-01','14:29:23','admin','Logged in','Super Admin'),(138,'2024-12-01','14:30:03','admin','Logged in','Super Admin'),(139,'2024-12-01','14:32:05','admin','Logged in','Super Admin'),(140,'2024-12-01','14:32:40','admin','Logged in','Super Admin'),(141,'2024-12-01','14:33:54','admin','Updated property item: MRJTG11007351006365920','Super Admin'),(142,'2024-12-01','14:35:25','admin','Logged in','Super Admin'),(143,'2024-12-01','14:37:26','admin','Logged in','Super Admin'),(144,'2024-12-01','14:41:48','karl','Logged in','Super Admin'),(145,'2024-12-01','14:42:13','karl','Shutdown 2 PC(s).','Super Admin'),(146,'2024-12-01','14:42:14','admin','Logged in','Super Admin'),(147,'2024-12-01','14:45:16','admin','Logged in','Super Admin'),(148,'2024-12-01','14:46:54','admin','Logged in','Super Admin'),(149,'2024-12-01','14:49:20','karl','Logged in','Super Admin'),(150,'2024-12-01','14:55:18','karl','Logged in','Super Admin'),(151,'2024-12-01','14:55:20','admin','Logged in','Super Admin'),(152,'2024-12-01','14:57:17','karl','Logged in','Super Admin'),(153,'2024-12-01','14:57:27','karl','Shutdown 1 PC(s).','Super Admin'),(154,'2024-12-01','14:58:07','admin','Added an inventory item: P1','Super Admin'),(155,'2024-12-01','15:01:39','karl','Shutdown 1 PC(s).','Super Admin'),(156,'2024-12-01','15:02:24','karl','Logged in','Super Admin'),(157,'2024-12-01','15:02:48','karl','Shutdown 1 PC(s).','Super Admin'),(158,'2024-12-01','15:05:20','admin','Logged in','Super Admin'),(159,'2024-12-01','15:06:04','admin','Shutdown 1 PC(s).','Super Admin'),(160,'2024-12-02','09:23:52','karl','Logged in','Super Admin'),(161,'2024-12-03','01:38:22','karl','Logged in','Super Admin'),(162,'2024-12-03','01:42:16','karl','Logged in','Super Admin'),(163,'2024-12-03','01:45:28','karl','Logged in','Super Admin'),(164,'2024-12-03','01:48:59','karl','Logged in','Super Admin'),(165,'2024-12-03','01:51:23','karl','Logged in','Super Admin'),(166,'2024-12-03','01:55:37','karl','Logged in','Super Admin'),(167,'2024-12-03','02:05:04','karl','Logged in','Super Admin'),(168,'2024-12-03','02:05:44','karl','Logged in','Super Admin'),(169,'2024-12-03','02:11:29','karl','Logged in','Super Admin'),(170,'2024-12-03','02:16:27','karl','Logged in','Super Admin'),(171,'2024-12-03','02:19:59','karl','Logged in','Super Admin'),(172,'2024-12-03','02:23:44','karl','Logged in','Super Admin'),(173,'2024-12-03','02:25:05','karl','Logged in','Super Admin'),(174,'2024-12-03','02:27:12','karl','Logged in','Super Admin'),(175,'2024-12-03','02:38:44','karl','Logged in','Super Admin'),(176,'2024-12-03','02:40:50','karl','Logged in','Super Admin'),(177,'2024-12-03','02:48:33','karl','Logged in','Super Admin'),(178,'2024-12-03','02:52:16','karl','Logged in','Super Admin'),(179,'2024-12-03','02:53:54','karl','Logged in','Super Admin'),(180,'2024-12-03','02:56:12','karl','Logged in','Super Admin'),(181,'2024-12-03','02:57:42','karl','Logged in','Super Admin'),(182,'2024-12-03','02:58:17','karl','Logged in','Super Admin'),(183,'2024-12-03','02:59:05','karl','Logged in','Super Admin'),(184,'2024-12-03','03:00:39','karl','Logged in','Super Admin'),(185,'2024-12-03','03:01:38','karl','Logged in','Super Admin'),(186,'2024-12-03','03:02:02','karl','Logged in','Super Admin'),(187,'2024-12-03','03:02:48','karl','Logged in','Super Admin'),(188,'2024-12-03','03:03:14','karl','Logged in','Super Admin'),(189,'2024-12-03','03:03:58','karl','Logged in','Super Admin'),(190,'2024-12-03','03:04:34','karl','Logged in','Super Admin'),(191,'2024-12-03','03:06:47','karl','Logged in','Super Admin'),(192,'2024-12-03','03:08:43','karl','Logged in','Super Admin'),(193,'2024-12-03','03:27:47','karl','Logged in','Super Admin'),(194,'2024-12-03','03:32:36','karl','Logged in','Super Admin'),(195,'2024-12-03','03:33:12','karl','Logged in','Super Admin'),(196,'2024-12-03','03:33:55','karl','Logged in','Super Admin'),(197,'2024-12-03','03:36:24','karl','Logged in','Super Admin'),(198,'2024-12-03','03:52:20','karl','Logged in','Super Admin'),(199,'2024-12-03','03:53:04','karl','Logged in','Super Admin'),(200,'2024-12-03','03:53:56','karl','Logged in','Super Admin'),(201,'2024-12-03','03:58:30','karl','Logged in','Super Admin'),(202,'2024-12-03','04:02:06','karl','Logged in','Super Admin'),(203,'2024-12-03','04:03:15','karl','Logged in','Super Admin'),(204,'2024-12-03','04:04:35','karl','Logged in','Super Admin'),(205,'2024-12-03','04:05:32','karl','Logged in','Super Admin'),(206,'2024-12-03','04:06:52','karl','Logged in','Super Admin'),(207,'2024-12-03','04:07:31','karl','Logged in','Super Admin'),(208,'2024-12-03','04:08:49','karl','Logged in','Super Admin'),(209,'2024-12-03','04:10:52','karl','Logged in','Super Admin'),(210,'2024-12-03','04:12:15','karl','Logged in','Super Admin'),(211,'2024-12-03','04:13:43','karl','Logged in','Super Admin'),(212,'2024-12-03','04:16:22','karl','Logged in','Super Admin'),(213,'2024-12-03','05:16:04','karl','Logged in','Super Admin'),(214,'2024-12-03','05:16:56','karl','Logged in','Super Admin'),(215,'2024-12-03','05:19:11','karl','Logged in','Super Admin'),(216,'2024-12-03','05:20:52','karl','Logged in','Super Admin'),(217,'2024-12-03','05:24:09','karl','Logged in','Super Admin'),(218,'2024-12-03','05:25:54','karl','Logged in','Super Admin'),(219,'2024-12-03','12:03:39','admin','Logged in','Super Admin'),(220,'2024-12-03','12:07:22','admin','Logged in','Super Admin'),(221,'2024-12-03','12:08:25','karl','Logged in','Super Admin'),(222,'2024-12-03','12:08:55','karl','Logged out','Super Admin'),(223,'2024-12-03','12:10:14','admin','Logged in','Super Admin'),(224,'2024-12-03','12:10:14','admin','Logged in','Super Admin'),(225,'2024-12-03','12:12:38','admin','Logged in','Super Admin'),(226,'2024-12-03','12:13:37','karl','Logged in','Super Admin'),(227,'2024-12-03','12:14:39','admin','Logged in','Super Admin'),(228,'2024-12-03','12:15:29','admin','Logged in','Super Admin'),(229,'2024-12-03','12:16:46','admin','Logged in','Super Admin'),(230,'2024-12-03','12:18:43','karl','Logged in','Super Admin'),(231,'2024-12-03','12:19:16','admin','Logged in','Super Admin'),(232,'2024-12-03','12:20:46','admin','Logged in','Super Admin'),(233,'2024-12-03','12:26:32','karl','Logged in','Super Admin'),(234,'2024-12-03','12:27:54','karl','Logged in','Super Admin'),(235,'2024-12-03','12:28:18','admin','Logged in','Super Admin'),(236,'2024-12-03','12:29:30','admin','Logged in','Super Admin'),(237,'2024-12-03','12:29:54','karl','Logged in','Super Admin'),(238,'2024-12-03','12:30:26','admin','Logged in','Super Admin'),(239,'2024-12-03','12:33:51','admin','Logged in','Super Admin'),(240,'2024-12-03','12:34:28','karl','Logged in','Super Admin'),(241,'2024-12-03','12:36:52','karl','Logged in','Super Admin'),(242,'2024-12-03','12:39:43','admin','Logged in','Super Admin'),(243,'2024-12-03','12:40:57','admin','Logged in','Super Admin'),(244,'2024-12-03','12:42:23','jpcosorio00256@usep.edu.ph','Logged in','Super Admin'),(245,'2024-12-03','12:43:45','karl','Logged in','Super Admin'),(246,'2024-12-03','12:47:50','jpcosorio00256@usep.edu.ph','Added admin email: dmbgerodias00151@usep.edu.ph','Super Admin'),(247,'2024-12-03','12:48:47','jpcosorio00256@usep.edu.ph','Logged out','Super Admin'),(248,'2024-12-03','12:49:56','karl','Logged in','Super Admin'),(249,'2024-12-03','12:49:57','jpcosorio00256@usep.edu.ph','Logged in','Super Admin'),(250,'2024-12-03','12:51:20','karl','Logged in','Super Admin'),(251,'2024-12-03','12:54:18','admin','Logged in','Super Admin'),(252,'2024-12-03','12:55:21','admin','Logged in','Super Admin'),(253,'2024-12-03','12:56:48','admin','Logged in','Super Admin'),(254,'2024-12-03','12:58:54','admin','Logged in','Super Admin'),(255,'2024-12-03','13:04:38','karl','Logged in','Super Admin'),(256,'2024-12-03','13:10:25','karl','Logged in','Super Admin'),(257,'2024-12-03','13:34:52','karl','Logged in','Super Admin'),(258,'2024-12-03','13:35:15','admin','Logged in','Super Admin'),(259,'2024-12-03','13:35:42','admin','Logged in','Super Admin'),(260,'2024-12-03','13:38:45','admin','Logged in','Super Admin'),(261,'2024-12-03','13:40:42','admin','Logged in','Super Admin'),(262,'2024-12-03','13:41:21','karl','Logged in','Super Admin'),(263,'2024-12-03','13:44:37','admin','Marked equipment as returned for log ID: 1','Super Admin'),(264,'2024-12-03','13:46:56','karl','Logged in','Super Admin'),(265,'2024-12-03','13:47:47','admin','Logged in','Super Admin'),(266,'2024-12-03','13:48:57','admin','Logged in','Super Admin'),(267,'2024-12-03','13:49:25','jpcosorio00256@usep.edu.ph','Logged in','Super Admin'),(268,'2024-12-03','13:50:31','admin','Logged in','Super Admin'),(269,'2024-12-03','13:57:40','admin','Logged in','Super Admin'),(270,'2024-12-03','13:59:27','admin','Logged in','Super Admin'),(271,'2024-12-03','14:03:35','admin','Logged in','Super Admin'),(272,'2024-12-03','14:05:49','admin','Logged in','Super Admin'),(273,'2024-12-03','14:06:03','admin','Logged in','Super Admin'),(274,'2024-12-03','14:08:01','admin','Logged in','Super Admin'),(275,'2024-12-03','14:08:14','admin','Logged in','Super Admin'),(276,'2024-12-03','14:09:44','admin','Logged in','Super Admin'),(277,'2024-12-03','14:09:34','admin','Logged in','Super Admin'),(278,'2024-12-03','14:11:16','admin','Logged in','Super Admin'),(279,'2024-12-03','14:13:02','admin','Logged in','Super Admin'),(280,'2024-12-03','14:18:28','admin','Logged in','Super Admin'),(281,'2024-12-03','14:25:24','admin','Logged in','Super Admin'),(282,'2024-12-03','14:26:11','admin','Logged in','Super Admin'),(283,'2024-12-03','14:29:28','jpcosorio00256@usep.edu.ph','Logged in','Super Admin'),(284,'2024-12-03','14:31:38','admin','Logged in','Super Admin'),(285,'2024-12-03','14:32:36','admin','Logged in','Super Admin'),(286,'2024-12-03','14:34:08','admin','Logged in','Super Admin'),(287,'2024-12-03','14:34:43','karl','Logged in','Super Admin'),(288,'2024-12-03','14:35:48','admin','Logged in','Super Admin'),(289,'2024-12-03','14:37:17','admin','Logged in','Super Admin'),(290,'2024-12-03','14:41:09','admin','Logged in','Super Admin'),(291,'2024-12-03','14:43:23','admin','Logged in','Super Admin'),(292,'2024-12-03','14:44:59','admin','Logged in','Super Admin'),(293,'2024-12-03','14:45:01','karl','Logged in','Super Admin'),(294,'2024-12-03','14:45:19','karl','Logged in','Super Admin'),(295,'2024-12-03','14:49:43','admin','Logged in','Super Admin'),(296,'2024-12-03','14:50:08','admin','Logged in','Super Admin'),(297,'2024-12-03','14:52:31','karl','Logged in','Super Admin'),(298,'2024-12-03','14:52:48','karl','Edited student ID: 2022-00294','Super Admin'),(299,'2024-12-03','14:53:07','karl','Edited student ID: 2022-00151','Super Admin'),(300,'2024-12-03','14:53:26','admin','Logged in','Super Admin'),(301,'2024-12-03','14:53:58','admin','Logged in','Super Admin'),(302,'2024-12-03','14:54:44','admin','Logged in','Super Admin'),(303,'2024-12-03','14:56:06','admin','Logged in','Super Admin'),(304,'2024-12-03','14:59:38','karl','Logged in','Super Admin'),(305,'2024-12-03','15:00:48','karl','Logged in','Super Admin'),(306,'2024-12-03','15:01:00','admin','Logged in','Super Admin'),(307,'2024-12-03','15:02:52','karl','Logged in','Super Admin'),(308,'2024-12-03','15:04:06','admin','Logged in','Super Admin'),(309,'2024-12-03','15:04:37','admin','Marked equipment as returned for log ID: 1','Super Admin'),(310,'2024-12-03','15:05:25','karl','Logged in','Super Admin'),(311,'2024-12-03','15:06:56','admin','Logged in','Super Admin'),(312,'2024-12-03','15:08:36','admin','Logged in','Super Admin'),(313,'2024-12-03','15:10:59','admin','Logged in','Super Admin'),(314,'2024-12-03','15:12:44','admin','Logged in','Super Admin'),(315,'2024-12-03','15:12:47','admin','Logged in','Super Admin'),(316,'2024-12-03','15:14:13','admin','Logged in','Super Admin'),(317,'2024-12-03','15:14:33','karl','Edited equipment number: S123','Super Admin'),(318,'2024-12-03','15:16:17','karl','Password reset for student ID: 2022-00151','Super Admin'),(319,'2024-12-03','15:16:55','admin','Logged in','Super Admin'),(320,'2024-12-03','15:20:56','karl','Added student ID: 2022-00138','Super Admin'),(321,'2024-12-03','15:25:07','karl','Logged in','Super Admin'),(322,'2024-12-03','15:28:11','admin','Logged in','Super Admin'),(323,'2024-12-03','15:32:27','admin','Logged in','Super Admin'),(324,'2024-12-03','15:33:54','admin','Logged in','Super Admin'),(325,'2024-12-03','15:47:44','karl','Logged in','Super Admin'),(326,'2024-12-03','15:49:10','karl','Logged in','Super Admin'),(327,'2024-12-03','15:50:44','karl','Logged in','Super Admin'),(328,'2024-12-03','15:52:21','karl','Logged in','Super Admin'),(329,'2024-12-03','15:56:10','karl','Logged in','Super Admin'),(330,'2024-12-03','15:57:18','karl','Logged in','Super Admin'),(331,'2024-12-03','16:04:54','karl','Logged in','Super Admin'),(332,'2024-12-03','16:22:13','karl','Logged in','Super Admin'),(333,'2024-12-03','16:38:04','karl','Logged in','Super Admin'),(334,'2024-12-03','16:38:38','karl','Logged in','Super Admin'),(335,'2024-12-03','16:40:37','karl','Logged in','Super Admin'),(336,'2024-12-03','16:41:42','karl','Logged in','Super Admin'),(337,'2024-12-03','16:51:04','karl','Logged in','Super Admin'),(338,'2024-12-03','18:42:06','karl','Logged in','Super Admin'),(339,'2024-12-03','18:48:31','karl','Logged in','Super Admin'),(340,'2024-12-03','18:57:27','karl','Logged in','Super Admin'),(341,'2024-12-03','19:00:36','karl','Logged in','Super Admin'),(342,'2024-12-03','19:05:58','karl','Logged in','Super Admin'),(343,'2024-12-03','19:07:46','karl','Logged in','Super Admin'),(344,'2024-12-03','19:18:03','karl','Logged in','Super Admin'),(345,'2024-12-03','19:19:39','karl','Logged in','Super Admin'),(346,'2024-12-03','19:21:18','karl','Logged in','Super Admin'),(347,'2024-12-03','19:23:22','karl','Logged in','Super Admin'),(348,'2024-12-03','19:23:58','karl','Edited faculty ID: hash@usep.edu.ph','Super Admin'),(349,'2024-12-03','19:24:32','karl','Edited faculty ID: test@usep.edu.ph','Super Admin'),(350,'2024-12-03','19:24:57','karl','Edited faculty ID: test@usep.edu.ph','Super Admin'),(351,'2024-12-03','19:26:48','karl','Edited faculty ID: hash@usep.edu.ph','Super Admin'),(352,'2024-12-03','19:37:09','karl','Logged in','Super Admin'),(353,'2024-12-03','19:38:38','karl','Logged in','Super Admin'),(354,'2024-12-03','20:43:42','karl','Logged in','Super Admin'),(355,'2024-12-03','21:04:11','karl','Logged in','Super Admin'),(356,'2024-12-03','21:08:13','karl','Logged in','Super Admin'),(357,'2024-12-03','21:32:29','karl','Logged in','Super Admin'),(358,'2024-12-03','21:42:33','karl','Logged in','Super Admin'),(359,'2024-12-03','21:43:35','karl','Shutdown 4 PC(s).','Super Admin'),(360,'2024-12-03','21:44:22','karl','Shutdown 2 PC(s).','Super Admin'),(361,'2024-12-03','21:44:32','karl','Shutdown 2 PC(s).','Super Admin'),(362,'2024-12-03','22:02:46','karl','Logged in','Super Admin'),(363,'2024-12-03','22:03:05','karl','Edited equipment number: S124','Super Admin'),(364,'2024-12-03','22:03:14','karl','Logged in','Super Admin'),(365,'2024-12-03','22:29:54','karl','Logged in','Super Admin'),(366,'2024-12-03','22:30:03','karl','Password reset for student ID: 2022-00294','Super Admin'),(367,'2024-12-04','18:22:20','karl','Logged in','Super Admin'),(368,'2024-12-04','18:27:50','karl','Logged in','Super Admin'),(369,'2024-12-04','18:30:40','karl','Logged in','Super Admin'),(370,'2024-12-04','18:37:01','karl','Logged in','Super Admin'),(371,'2024-12-04','18:40:22','karl','Logged in','Super Admin'),(372,'2024-12-04','18:54:16','karl','Logged in','Super Admin'),(373,'2024-12-04','19:08:04','karl','Logged in','Super Admin'),(374,'2024-12-04','19:31:50','karl','Logged in','Super Admin'),(375,'2024-12-04','19:36:13','karl','Logged in','Super Admin'),(376,'2024-12-04','19:38:41','karl','Logged in','Super Admin'),(377,'2024-12-04','19:46:57','karl','Logged in','Super Admin'),(378,'2024-12-04','20:53:22','karl','Logged in','Super Admin'),(379,'2024-12-04','21:16:43','karl','Logged in','Super Admin'),(380,'2024-12-04','21:18:50','karl','Logged in','Super Admin'),(381,'2024-12-04','21:20:25','karl','Logged in','Super Admin'),(382,'2024-12-04','21:25:26','karl','Logged in','Super Admin'),(383,'2024-12-04','21:27:39','karl','Logged in','Super Admin'),(384,'2024-12-04','21:30:50','karl','Logged in','Super Admin'),(385,'2024-12-04','21:32:39','karl','Logged in','Super Admin'),(386,'2024-12-04','21:39:43','karl','Logged in','Super Admin'),(387,'2024-12-04','21:41:08','karl','Logged in','Super Admin'),(388,'2024-12-04','21:44:20','karl','Logged in','Super Admin'),(389,'2024-12-04','21:47:25','karl','Logged in','Super Admin'),(390,'2024-12-04','21:55:11','karl','Logged in','Super Admin'),(391,'2024-12-04','21:55:47','karl','Added faculty ID: karl@usep.edu.ph','Super Admin'),(392,'2024-12-04','21:55:50','karl','Logged out','Super Admin'),(393,'2024-12-04','21:57:40','karl','Logged in','Super Admin'),(394,'2024-12-04','21:58:04','karl','Edited faculty ID: karl@usep.edu.ph','Super Admin'),(395,'2024-12-04','21:58:09','karl','Logged out','Super Admin'),(396,'2024-12-04','21:58:26','karl@usep.edu.ph','Logged in','Faculty'),(397,'2024-12-04','22:18:13','karl','Logged in','Super Admin'),(398,'2024-12-04','22:36:32','karl','Logged in','Super Admin'),(399,'2024-12-04','22:36:35','karl','Logged out','Super Admin'),(400,'2024-12-04','22:37:04','karl@usep.edu.ph','Logged in','Faculty'),(401,'2024-12-04','22:37:20','karl@usep.edu.ph','Logged out','Faculty'),(402,'2024-12-04','22:37:26','karl','Logged in','Super Admin'),(403,'2024-12-04','22:37:53','karl','Edited faculty ID: karl@usep.edu.ph','Super Admin'),(404,'2024-12-04','22:38:23','karl','Logged out','Super Admin'),(405,'2024-12-04','22:48:54','karl','Logged in','Super Admin'),(406,'2024-12-04','22:48:58','karl','Logged out','Super Admin'),(407,'2024-12-04','23:02:15','karl','Logged in','Super Admin'),(408,'2024-12-04','23:02:35','karl','Logged out','Super Admin'),(409,'2024-12-04','23:04:35','karl','Logged in','Super Admin'),(410,'2024-12-04','23:04:47','karl','Deleted 1 Faculty(s):','Super Admin'),(411,'2024-12-04','23:06:12','karl','Added faculty ID: kocornejo00294@usep.edu.ph','Super Admin'),(412,'2024-12-04','23:06:21','karl','Logged out','Super Admin'),(413,'2024-12-04','23:09:59','kocornejo00294@usep.edu.ph','Changed Password.','Faculty'),(414,'2024-12-04','23:10:00','kocornejo00294@usep.edu.ph','Logged in','Faculty'),(415,'2024-12-04','23:10:23','kocornejo00294@usep.edu.ph','Logged out','Faculty'),(416,'2024-12-04','23:10:38','karl','Logged in','Super Admin'),(417,'2024-12-04','23:11:13','karl','Added admin email: kocornejo00294@usep.edu.ph','Super Admin'),(418,'2024-12-04','23:13:28','karl','Logged in','Super Admin'),(419,'2024-12-04','23:14:46','karl','Logged out','Super Admin'),(420,'2024-12-04','23:15:37','karl','Logged in','Super Admin'),(421,'2024-12-04','23:20:40','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(422,'2024-12-04','23:20:40','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(423,'2024-12-04','23:21:35','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(424,'2024-12-04','23:22:14','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(425,'2024-12-04','23:22:16','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(426,'2024-12-04','23:22:40','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(427,'2024-12-04','23:22:54','kocornejo00294@usep.edu.ph','Edited faculty ID: kocornejo00294@usep.edu.ph','Super Admin'),(428,'2024-12-04','23:22:57','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(429,'2024-12-04','23:23:27','karl','Logged in','Super Admin'),(430,'2024-12-04','23:23:46','karl','Edited faculty ID: kocornejo00294@usep.edu.ph','Super Admin'),(431,'2024-12-04','23:24:37','karl','Logged out','Super Admin'),(432,'2024-12-04','23:25:29','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(433,'2024-12-04','23:25:30','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(434,'2024-12-04','23:26:01','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(435,'2024-12-04','23:26:23','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(436,'2024-12-04','23:26:38','kocornejo00294@usep.edu.ph','Edited admin email: kocornejo00294@usep.edu.ph','Super Admin'),(437,'2024-12-04','23:26:41','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(438,'2024-12-04','23:51:18','karl','Changed Password.','Super Admin'),(439,'2024-12-04','23:51:18','karl','Logged in','Super Admin'),(440,'2024-12-04','23:51:25','karl','Logged out','Super Admin'),(441,'2024-12-04','23:52:30','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(442,'2024-12-04','23:52:30','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(443,'2024-12-04','23:52:35','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(444,'2024-12-04','23:53:53','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(445,'2024-12-04','23:53:54','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(446,'2024-12-04','23:54:29','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(447,'2024-12-04','23:55:15','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(448,'2024-12-04','23:55:16','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(449,'2024-12-05','00:05:44','kocornejo00294@usep.edu.ph','Changed Password.','Super Admin'),(450,'2024-12-05','00:05:44','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(451,'2024-12-05','00:08:57','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(452,'2024-12-05','00:25:53','kocornejo00294@usep.edu.ph','Logged in','Faculty'),(453,'2024-12-05','00:27:11','kocornejo00294@usep.edu.ph','Logged in','Faculty'),(454,'2024-12-05','00:30:14','archie@usep.edu.ph','Changed Password.','Faculty'),(455,'2024-12-05','00:30:14','archie@usep.edu.ph','Logged in','Faculty'),(456,'2024-12-05','00:32:04','archie@usep.edu.ph','Logged in','Faculty'),(457,'2024-12-05','00:33:50','archie@usep.edu.ph','Logged in','Faculty'),(458,'2024-12-05','00:35:28','archie@usep.edu.ph','Logged in','Faculty'),(459,'2024-12-05','01:09:55','archie@usep.edu.ph','Changed Password.','Faculty'),(460,'2024-12-05','01:09:56','archie@usep.edu.ph','Changed Password.','Faculty'),(461,'2024-12-05','01:09:57','archie@usep.edu.ph','Logged in','Faculty'),(462,'2024-12-05','01:12:39','archie@usep.edu.ph','Changed Password.','Faculty'),(463,'2024-12-05','01:15:43','archie@usep.edu.ph','Logged in','Faculty'),(464,'2024-12-05','01:23:51','archie@usep.edu.ph','Logged in','Faculty'),(465,'2024-12-05','01:26:10','karl','Logged in','Super Admin'),(466,'2024-12-05','01:27:12','karl','Edited admin email: karl','Super Admin'),(467,'2024-12-05','09:24:11','Kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(468,'2024-12-05','09:24:49','Kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(469,'2024-12-05','09:25:24','kocornejo00294@usep.edu.ph','Logged in','Super Admin'),(470,'2024-12-05','09:25:42','kocornejo00294@usep.edu.ph','Edited admin email: karl','Super Admin'),(471,'2024-12-05','09:25:50','kocornejo00294@usep.edu.ph','Logged out','Super Admin'),(472,'2024-12-05','09:26:10','karl','Logged in','Super Admin'),(473,'2024-12-05','09:26:18','karl','Logged out','Super Admin'),(474,'2024-12-05','09:26:38','karl','Logged in','Super Admin'),(475,'2024-12-05','09:26:40','karl','Logged out','Super Admin'),(476,'2024-12-05','09:28:09','karl','Logged in','Super Admin'),(477,'2024-12-05','09:29:28','karl','Logged out','Super Admin'),(478,'2024-12-05','09:30:02','karl','Changed Password.','Faculty'),(479,'2024-12-05','09:30:03','karl','Changed Password.','Faculty'),(480,'2024-12-05','09:30:04','karl','Logged in','Faculty'),(481,'2024-12-05','09:30:39','karl','Logged out','Faculty'),(482,'2024-12-05','09:30:58','archie@usep.edu.ph','Logged in','Faculty'),(483,'2024-12-05','09:33:35','archie@usep.edu.ph','Logged out','Faculty'),(484,'2024-12-05','09:33:44','karl','Logged in','Super Admin'),(485,'2024-12-05','11:01:37','karl','Logged out','Super Admin'),(486,'2024-12-05','11:09:38','karl','Logged in','Super Admin'),(487,'2024-12-05','12:57:19','karl','Logged in','Super Admin'),(488,'2024-12-05','12:59:47','karl','Logged in','Super Admin'),(489,'2024-12-05','14:00:27','karl','Logged in','Super Admin'),(490,'2024-12-05','14:06:19','karl','Logged in','Super Admin'),(491,'2024-12-05','14:13:02','karl','Logged in','Super Admin'),(492,'2024-12-05','15:07:33','karl','Logged in','Super Admin'),(493,'2024-12-05','15:12:10','karl','Logged in','Super Admin'),(494,'2024-12-05','15:33:48','karl','Logged in','Super Admin'),(495,'2024-12-05','15:34:16','karl','Logged out','Super Admin'),(496,'2024-12-05','15:34:54','karl','Logged in','Faculty'),(497,'2024-12-05','15:42:24','karl','Logged in','Super Admin'),(498,'2024-12-05','15:57:55','karl','Logged in','Super Admin'),(499,'2024-12-05','16:00:17','karl','Logged in','Super Admin'),(500,'2024-12-05','16:02:18','karl','Logged in','Super Admin'),(501,'2024-12-05','16:05:48','karl','Logged in','Super Admin'),(502,'2024-12-05','16:07:37','karl','Logged in','Super Admin'),(503,'2024-12-05','16:08:57','karl','Logged in','Super Admin'),(504,'2024-12-05','16:38:51','karl','Logged in','Super Admin'),(505,'2024-12-05','16:41:00','karl','Logged in','Super Admin'),(506,'2024-12-05','16:54:05','karl','Logged in','Super Admin'),(507,'2024-12-05','16:56:52','karl','Logged in','Super Admin'),(508,'2024-12-05','17:00:44','karl','Logged in','Super Admin'),(509,'2024-12-06','20:24:41','karl','Logged in','Super Admin'),(510,'2024-12-06','20:29:59','karl','Logged in','Super Admin'),(511,'2024-12-06','20:41:09','karl','Logged in','Super Admin'),(512,'2024-12-06','20:46:15','karl','Logged in','Super Admin'),(513,'2024-12-06','20:53:44','karl','Logged in','Super Admin'),(514,'2024-12-06','21:14:08','karl','Logged in','Super Admin'),(515,'2024-12-06','21:18:38','karl','Logged in','Super Admin'),(516,'2024-12-06','21:19:08','karl','Logged in','Super Admin'),(517,'2024-12-06','21:19:59','karl','Logged in','Super Admin'),(518,'2024-12-06','21:21:02','karl','Logged in','Super Admin'),(519,'2024-12-06','21:26:12','karl','Logged in','Super Admin'),(520,'2024-12-06','21:28:53','karl','Logged in','Super Admin'),(521,'2024-12-06','21:30:36','karl','Logged in','Super Admin'),(522,'2024-12-06','21:32:16','karl','Logged in','Super Admin'),(523,'2024-12-06','21:35:03','karl','Logged in','Super Admin'),(524,'2024-12-06','22:27:02','karl','Logged in','Super Admin'),(525,'2024-12-06','22:28:38','karl','Logged in','Super Admin'),(526,'2024-12-06','22:33:17','karl','Logged in','Super Admin'),(527,'2024-12-06','22:33:51','karl','Logged in','Super Admin'),(528,'2024-12-06','22:34:26','karl','Logged in','Super Admin'),(529,'2024-12-06','22:34:58','karl','Logged in','Super Admin'),(530,'2024-12-06','22:40:48','karl','Logged in','Super Admin'),(531,'2024-12-06','22:44:44','karl','Logged in','Super Admin'),(532,'2024-12-06','22:50:30','karl','Logged in','Super Admin'),(533,'2024-12-06','22:59:51','karl','Logged in','Super Admin'),(534,'2024-12-06','23:00:20','karl','Logged in','Super Admin'),(535,'2024-12-06','23:03:42','karl','Logged in','Super Admin'),(536,'2024-12-06','23:06:33','karl','Logged in','Super Admin'),(537,'2024-12-06','23:20:39','karl','Logged in','Super Admin'),(538,'2024-12-06','23:27:33','karl','Logged in','Super Admin'),(539,'2024-12-06','23:37:25','karl','Logged in','Super Admin'),(540,'2024-12-06','23:50:51','karl','Logged in','Super Admin'),(541,'2024-12-06','23:51:33','karl','Logged in','Super Admin'),(542,'2024-12-06','23:54:17','karl','Logged in','Super Admin'),(543,'2024-12-06','23:55:22','karl','Logged in','Super Admin'),(544,'2024-12-06','23:58:51','karl','Logged in','Super Admin'),(545,'2024-12-06','23:59:54','karl','Logged in','Super Admin'),(546,'2024-12-07','00:01:38','karl','Logged in','Super Admin'),(547,'2024-12-07','00:05:16','karl','Logged in','Super Admin'),(548,'2024-12-07','00:11:50','karl','Logged in','Super Admin'),(549,'2024-12-07','00:15:58','karl','Logged in','Super Admin'),(550,'2024-12-07','00:16:49','karl','Logged in','Super Admin'),(551,'2024-12-07','00:20:18','karl','Logged in','Super Admin'),(552,'2024-12-07','00:23:13','karl','Logged in','Super Admin'),(553,'2024-12-07','00:27:04','karl','Logged in','Super Admin'),(554,'2024-12-07','00:29:33','karl','Logged in','Super Admin'),(555,'2024-12-07','00:33:37','karl','Logged in','Super Admin'),(556,'2024-12-07','00:39:37','karl','Logged in','Super Admin'),(557,'2024-12-07','00:42:22','karl','Logged in','Super Admin'),(558,'2024-12-07','00:45:59','karl','Logged in','Super Admin'),(559,'2024-12-07','00:48:04','karl','Logged in','Super Admin'),(560,'2024-12-07','00:49:33','karl','Logged in','Super Admin'),(561,'2024-12-07','00:51:31','karl','Logged in','Super Admin'),(562,'2024-12-07','00:53:03','karl','Logged in','Super Admin'),(563,'2024-12-07','08:56:11','karl','Logged in','Super Admin'),(564,'2024-12-07','09:27:00','karl','Logged in','Super Admin'),(565,'2024-12-07','09:29:30','karl','Logged in','Super Admin'),(566,'2024-12-07','09:31:10','karl','Logged in','Super Admin'),(567,'2024-12-07','09:32:06','karl','Logged in','Super Admin'),(568,'2024-12-07','09:42:23','karl','Logged in','Super Admin'),(569,'2024-12-07','09:47:36','karl','Logged in','Super Admin'),(570,'2024-12-07','09:48:49','karl','Logged in','Super Admin'),(571,'2024-12-07','09:52:09','karl','Logged in','Super Admin'),(572,'2024-12-07','09:52:54','karl','Logged in','Super Admin'),(573,'2024-12-07','09:56:02','karl','Logged in','Super Admin'),(574,'2024-12-07','09:58:34','karl','Logged in','Super Admin'),(575,'2024-12-07','10:00:58','karl','Logged in','Super Admin'),(576,'2024-12-07','10:01:44','karl','Logged in','Super Admin'),(577,'2024-12-07','10:02:59','karl','Logged in','Super Admin'),(578,'2024-12-07','10:05:39','karl','Logged in','Super Admin'),(579,'2024-12-07','10:07:49','karl','Logged in','Super Admin'),(580,'2024-12-07','10:10:36','karl','Logged out','Super Admin'),(581,'2024-12-07','10:11:11','karl','Logged in','Faculty'),(582,'2024-12-07','10:11:18','karl','Logged out','Faculty'),(583,'2024-12-07','10:11:35','archie@usep.edu.ph','Logged in','Faculty'),(584,'2024-12-07','10:16:59','archie@usep.edu.ph','Logged in','Faculty'),(585,'2024-12-07','10:20:15','archie@usep.edu.ph','Logged in','Faculty'),(586,'2024-12-07','10:23:09','archie@usep.edu.ph','Logged in','Faculty'),(587,'2024-12-07','10:25:42','archie@usep.edu.ph','Logged in','Faculty'),(588,'2024-12-07','10:28:23','archie@usep.edu.ph','Logged in','Faculty'),(589,'2024-12-07','10:31:18','archie@usep.edu.ph','Logged in','Faculty'),(590,'2024-12-07','10:32:09','archie@usep.edu.ph','Logged out','Faculty'),(591,'2024-12-07','10:32:17','archie@usep.edu.ph','Logged in','Faculty'),(592,'2024-12-07','10:34:12','karl','Logged in','Super Admin'),(593,'2024-12-07','10:36:46','karl','Logged in','Super Admin'),(594,'2024-12-07','10:37:52','karl','Logged in','Super Admin'),(595,'2024-12-07','10:38:18','karl','Logged out','Super Admin'),(596,'2024-12-07','10:38:40','archie@usep.edu.ph','Logged in','Faculty'),(597,'2024-12-07','10:40:19','archie@usep.edu.ph','Logged in','Faculty'),(598,'2024-12-07','10:41:46','archie@usep.edu.ph','Logged out','Faculty'),(599,'2024-12-07','10:41:50','karl','Logged in','Super Admin'),(600,'2024-12-07','10:50:49','karl','Logged in','Super Admin'),(601,'2024-12-07','11:00:18','karl','Logged in','Super Admin'),(602,'2024-12-07','11:10:31','karl','Logged in','Super Admin'),(603,'2024-12-07','11:20:52','karl','Logged in','Super Admin'),(604,'2024-12-07','11:22:09','karl','Logged in','Super Admin'),(605,'2024-12-07','11:23:03','karl','Logged in','Super Admin'),(606,'2024-12-07','11:28:01','karl','Logged in','Super Admin'),(607,'2024-12-07','11:37:56','karl','Logged in','Super Admin'),(608,'2024-12-07','11:40:50','karl','Logged in','Super Admin'),(609,'2024-12-07','11:44:18','karl','Logged in','Super Admin'),(610,'2024-12-07','11:45:42','karl','Logged in','Super Admin'),(611,'2024-12-07','11:48:25','karl','Logged in','Super Admin'),(612,'2024-12-07','11:51:35','karl','Logged in','Super Admin'),(613,'2024-12-07','11:54:06','karl','Logged in','Super Admin'),(614,'2024-12-07','11:59:18','karl','Logged in','Super Admin'),(615,'2024-12-07','12:00:58','karl','Logged in','Super Admin'),(616,'2024-12-07','12:06:26','karl','Logged in','Super Admin'),(617,'2024-12-07','12:06:33','karl','Password reset for student ID: 2022-00151','Super Admin'),(618,'2024-12-07','12:06:57','karl','Requested to print Admin/Faculty Activity Logs.).','Super Admin'),(619,'2024-12-07','12:07:26','karl','Requested to save Admin/Faculty Activity Logs as PDF file.).','Super Admin'),(620,'2024-12-07','12:12:08','karl','Logged in','Super Admin'),(621,'2024-12-07','12:12:20','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(622,'2024-12-07','12:12:55','karl','Requested to print Admin/Faculty Activity Logs.','Super Admin'),(623,'2024-12-07','12:23:30','karl','Logged in','Super Admin'),(624,'2024-12-07','12:28:00','karl','Logged in','Super Admin'),(625,'2024-12-07','12:34:40','karl','Logged in','Super Admin'),(626,'2024-12-07','12:35:24','karl','Logged in','Super Admin'),(627,'2024-12-07','12:36:39','karl','Logged in','Super Admin'),(628,'2024-12-07','12:37:05','karl','Logged in','Super Admin'),(629,'2024-12-07','12:39:02','karl','Logged in','Super Admin'),(630,'2024-12-07','13:50:14','karl','Logged in','Super Admin'),(631,'2024-12-07','13:52:45','karl','Logged in','Super Admin'),(632,'2024-12-07','13:55:08','karl','Logged in','Super Admin'),(633,'2024-12-07','13:56:33','karl','Logged in','Super Admin'),(634,'2024-12-07','13:56:55','karl','Logged out','Super Admin'),(635,'2024-12-07','13:58:12','karl','Logged in','Super Admin'),(636,'2024-12-07','13:59:20','karl','Logged out','Super Admin'),(637,'2024-12-07','13:59:25','karl','Logged in','Super Admin'),(638,'2024-12-07','14:12:30','karl','Logged in','Super Admin'),(639,'2024-12-07','14:16:38','karl','Logged in','Super Admin'),(640,'2024-12-07','14:21:05','karl','Logged in','Super Admin'),(641,'2024-12-07','14:31:32','karl','Logged in','Super Admin'),(642,'2024-12-07','14:33:20','karl','Logged in','Super Admin'),(643,'2024-12-07','14:36:20','karl','Logged in','Super Admin'),(644,'2024-12-07','14:36:58','karl','Logged in','Super Admin'),(645,'2024-12-07','14:42:30','karl','Logged in','Super Admin'),(646,'2024-12-07','14:45:41','karl','Logged in','Super Admin'),(647,'2024-12-07','14:46:47','karl','Logged in','Super Admin'),(648,'2024-12-07','14:48:58','karl','Logged in','Super Admin'),(649,'2024-12-07','14:50:12','karl','Logged in','Super Admin'),(650,'2024-12-07','14:51:33','karl','Logged in','Super Admin'),(651,'2024-12-07','14:52:28','karl','Logged in','Super Admin'),(652,'2024-12-07','15:04:24','karl','Logged in','Super Admin'),(653,'2024-12-07','15:14:46','karl','Logged in','Super Admin'),(654,'2024-12-07','15:18:01','karl','Logged in','Super Admin'),(655,'2024-12-07','15:20:28','karl','Logged in','Super Admin'),(656,'2024-12-07','15:22:12','karl','Logged in','Super Admin'),(657,'2024-12-07','15:22:38','karl','Logged in','Super Admin'),(658,'2024-12-07','15:23:25','karl','Logged in','Super Admin'),(659,'2024-12-07','15:25:58','karl','Logged in','Super Admin'),(660,'2024-12-07','15:26:22','karl','Logged in','Super Admin'),(661,'2024-12-07','15:27:15','karl','Logged in','Super Admin'),(662,'2024-12-07','15:31:55','karl','Logged in','Super Admin'),(663,'2024-12-07','15:32:14','karl','Logged in','Super Admin'),(664,'2024-12-07','15:33:19','karl','Logged in','Super Admin'),(665,'2024-12-07','15:33:57','karl','Logged in','Super Admin'),(666,'2024-12-07','15:35:07','karl','Logged in','Super Admin'),(667,'2024-12-07','15:36:59','karl','Logged in','Super Admin'),(668,'2024-12-07','15:38:15','karl','Logged in','Super Admin'),(669,'2024-12-07','15:39:13','karl','Logged in','Super Admin'),(670,'2024-12-07','15:39:42','karl','Logged in','Super Admin'),(671,'2024-12-07','15:40:31','karl','Logged in','Super Admin'),(672,'2024-12-07','15:41:14','karl','Logged in','Super Admin'),(673,'2024-12-07','15:41:38','karl','Logged in','Super Admin'),(674,'2024-12-07','15:43:07','karl','Logged in','Super Admin'),(675,'2024-12-07','15:43:39','karl','Logged in','Super Admin'),(676,'2024-12-07','15:44:18','karl','Logged in','Super Admin'),(677,'2024-12-07','15:44:59','karl','Logged in','Super Admin'),(678,'2024-12-07','15:45:21','karl','Logged in','Super Admin'),(679,'2024-12-07','15:49:46','karl','Logged in','Super Admin'),(680,'2024-12-07','15:59:42','karl','Logged in','Super Admin'),(681,'2024-12-07','16:15:03','karl','Logged in','Super Admin'),(682,'2024-12-07','16:15:47','karl','Logged in','Super Admin'),(683,'2024-12-07','16:18:43','karl','Logged in','Super Admin'),(684,'2024-12-07','16:18:56','karl','Logged in','Super Admin'),(685,'2024-12-07','16:19:45','karl','Logged in','Super Admin'),(686,'2024-12-07','16:20:31','karl','Logged in','Super Admin'),(687,'2024-12-07','16:23:10','karl','Logged in','Super Admin'),(688,'2024-12-07','16:24:28','karl','Logged in','Super Admin'),(689,'2024-12-07','16:26:37','karl','Logged in','Super Admin'),(690,'2024-12-07','16:39:46','karl','Logged in','Super Admin'),(691,'2024-12-07','16:42:47','karl','Logged in','Super Admin'),(692,'2024-12-07','16:46:13','karl','Logged in','Super Admin'),(693,'2024-12-07','16:47:42','karl','Logged in','Super Admin'),(694,'2024-12-07','16:50:11','karl','Logged in','Super Admin'),(695,'2024-12-07','16:51:04','karl','Logged in','Super Admin'),(696,'2024-12-07','16:53:34','karl','Logged in','Super Admin'),(697,'2024-12-07','16:55:33','karl','Logged in','Super Admin'),(698,'2024-12-07','16:57:16','karl','Logged in','Super Admin'),(699,'2024-12-07','16:59:01','karl','Logged in','Super Admin'),(700,'2024-12-07','17:04:12','karl','Logged in','Super Admin'),(701,'2024-12-07','17:05:10','karl','Logged in','Super Admin'),(702,'2024-12-07','17:07:46','karl','Logged in','Super Admin'),(703,'2024-12-07','17:09:17','karl','Logged in','Super Admin'),(704,'2024-12-07','17:10:58','karl','Logged in','Super Admin'),(705,'2024-12-07','17:13:21','karl','Logged in','Super Admin'),(706,'2024-12-07','17:19:29','karl','Logged in','Super Admin'),(707,'2024-12-07','17:20:17','karl','Logged in','Super Admin'),(708,'2024-12-07','17:22:16','karl','Logged in','Super Admin'),(709,'2024-12-07','17:23:09','karl','Logged in','Super Admin'),(710,'2024-12-07','17:23:56','karl','Logged in','Super Admin'),(711,'2024-12-07','17:26:50','karl','Logged in','Super Admin'),(712,'2024-12-07','17:27:14','karl','Logged in','Super Admin'),(713,'2024-12-07','17:28:33','karl','Logged in','Super Admin'),(714,'2024-12-07','17:28:58','karl','Logged in','Super Admin'),(715,'2024-12-07','17:32:16','karl','Logged in','Super Admin'),(716,'2024-12-07','17:36:17','karl','Logged in','Super Admin'),(717,'2024-12-07','17:38:01','karl','Logged in','Super Admin'),(718,'2024-12-07','17:44:10','karl','Logged in','Super Admin'),(719,'2024-12-07','17:45:15','karl','Logged in','Super Admin'),(720,'2024-12-07','18:02:14','karl','Logged in','Super Admin'),(721,'2024-12-07','18:02:32','karl','Logged in','Super Admin'),(722,'2024-12-07','18:03:44','karl','Logged in','Super Admin'),(723,'2024-12-07','18:04:49','karl','Logged in','Super Admin'),(724,'2024-12-07','18:06:54','karl','Logged in','Super Admin'),(725,'2024-12-07','18:09:14','karl','Logged in','Super Admin'),(726,'2024-12-07','18:10:07','karl','Logged in','Super Admin'),(727,'2024-12-07','18:11:45','karl','Logged in','Super Admin'),(728,'2024-12-07','18:12:22','karl','Logged in','Super Admin'),(729,'2024-12-07','18:14:00','karl','Logged in','Super Admin'),(730,'2024-12-07','18:14:15','karl','Logged in','Super Admin'),(731,'2024-12-07','18:16:23','karl','Logged in','Super Admin'),(732,'2024-12-07','18:17:38','karl','Logged in','Super Admin'),(733,'2024-12-07','18:19:56','karl','Logged in','Super Admin'),(734,'2024-12-07','18:22:34','karl','Logged in','Super Admin'),(735,'2024-12-07','18:23:30','karl','Logged in','Super Admin'),(736,'2024-12-07','18:29:40','karl','Logged in','Super Admin'),(737,'2024-12-07','18:31:15','karl','Logged in','Super Admin'),(738,'2024-12-07','18:33:53','karl','Logged in','Super Admin'),(739,'2024-12-07','18:37:54','karl','Logged in','Super Admin'),(740,'2024-12-07','18:43:14','karl','Logged in','Super Admin'),(741,'2024-12-07','19:44:46','karl','Logged in','Super Admin'),(742,'2024-12-07','19:55:18','karl','Logged in','Super Admin'),(743,'2024-12-07','20:00:30','karl','Logged in','Super Admin'),(744,'2024-12-07','20:01:44','karl','Logged in','Super Admin'),(745,'2024-12-07','20:06:23','karl','Logged in','Super Admin'),(746,'2024-12-07','20:10:04','karl','Logged in','Super Admin'),(747,'2024-12-07','20:12:15','karl','Logged in','Super Admin'),(748,'2024-12-07','20:15:30','karl','Logged in','Super Admin'),(749,'2024-12-07','20:15:54','karl','Logged in','Super Admin'),(750,'2024-12-07','20:23:34','karl','Logged in','Super Admin'),(751,'2024-12-07','20:24:12','karl','Logged in','Super Admin'),(752,'2024-12-07','20:26:29','karl','Logged in','Super Admin'),(753,'2024-12-07','20:28:05','karl','Logged in','Super Admin'),(754,'2024-12-07','20:29:01','karl','Logged in','Super Admin'),(755,'2024-12-07','20:33:40','karl','Logged in','Super Admin'),(756,'2024-12-07','20:45:49','karl','Logged in','Super Admin'),(757,'2024-12-07','21:16:20','karl','Logged in','Super Admin'),(758,'2024-12-07','21:59:10','karl','Logged in','Super Admin'),(759,'2024-12-07','22:02:29','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(760,'2024-12-07','22:02:44','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(761,'2024-12-07','22:43:47','karl','Logged in','Super Admin'),(762,'2024-12-07','22:44:07','karl','Logged in','Super Admin'),(763,'2024-12-07','22:46:06','karl','Logged in','Super Admin'),(764,'2024-12-07','22:46:48','karl','Logged in','Super Admin'),(765,'2024-12-07','22:47:31','karl','Logged in','Super Admin'),(766,'2024-12-07','22:58:49','karl','Logged in','Super Admin'),(767,'2024-12-07','23:00:56','karl','Logged in','Super Admin'),(768,'2024-12-07','23:03:46','karl','Logged in','Super Admin'),(769,'2024-12-07','23:10:20','karl','Logged in','Super Admin'),(770,'2024-12-07','23:11:06','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(771,'2024-12-07','23:23:26','karl','Logged in','Super Admin'),(772,'2024-12-08','07:21:56','karl','Logged in','Super Admin'),(773,'2024-12-08','07:28:24','karl','Logged in','Super Admin'),(774,'2024-12-08','07:29:23','karl','Logged in','Super Admin'),(775,'2024-12-08','07:31:20','karl','Logged in','Super Admin'),(776,'2024-12-08','07:32:00','karl','Logged in','Super Admin'),(777,'2024-12-08','08:21:48','karl','Logged in','Super Admin'),(778,'2024-12-08','08:26:03','karl','Logged out','Super Admin'),(779,'2024-12-08','08:26:12','karl','Logged in','Super Admin'),(780,'2024-12-08','08:26:39','karl','Logged in','Super Admin'),(781,'2024-12-08','08:28:12','karl','Logged out','Super Admin'),(782,'2024-12-08','08:47:28','karl','Logged in','Super Admin'),(783,'2024-12-08','08:49:40','karl','Logged in','Super Admin'),(784,'2024-12-08','08:52:04','karl','Logged in','Super Admin'),(785,'2024-12-08','08:52:06','karl','Logged out','Super Admin'),(786,'2024-12-08','08:52:11','karl','Logged in','Super Admin'),(787,'2024-12-08','08:56:26','karl','Logged in','Super Admin'),(788,'2024-12-08','09:18:58','karl','Logged in','Super Admin'),(789,'2024-12-08','09:30:17','karl','Logged in','Super Admin'),(790,'2024-12-08','09:32:49','karl','Logged in','Super Admin'),(791,'2024-12-08','09:34:56','karl','Logged in','Super Admin'),(792,'2024-12-08','09:36:26','karl','Logged in','Super Admin'),(793,'2024-12-08','09:39:03','karl','Logged in','Super Admin'),(794,'2024-12-08','09:42:27','karl','Logged in','Super Admin'),(795,'2024-12-08','09:43:45','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(796,'2024-12-08','09:46:01','karl','Logged in','Super Admin'),(797,'2024-12-08','09:47:10','karl','Logged in','Super Admin'),(798,'2024-12-08','09:49:50','karl','Logged in','Super Admin'),(799,'2024-12-08','09:54:32','karl','Logged in','Super Admin'),(800,'2024-12-08','09:55:57','karl','Logged in','Super Admin'),(801,'2024-12-08','09:59:58','karl','Logged in','Super Admin'),(802,'2024-12-08','10:01:37','karl','Logged in','Super Admin'),(803,'2024-12-08','10:03:12','karl','Logged in','Super Admin'),(804,'2024-12-08','10:05:11','karl','Logged in','Super Admin'),(805,'2024-12-08','10:07:32','karl','Logged in','Super Admin'),(806,'2024-12-08','10:09:16','karl','Logged in','Super Admin'),(807,'2024-12-08','10:11:08','karl','Logged in','Super Admin'),(808,'2024-12-08','10:14:31','karl','Logged in','Super Admin'),(809,'2024-12-08','10:15:04','karl','Logged in','Super Admin'),(810,'2024-12-08','10:23:33','karl','Logged in','Super Admin'),(811,'2024-12-08','10:28:12','admin','Logged in','Super Admin'),(812,'2024-12-08','10:31:56','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(813,'2024-12-08','10:32:26','admin','Logged in','Super Admin'),(814,'2024-12-08','10:33:11','karl','Edited equipment number: S123','Super Admin'),(815,'2024-12-08','10:34:00','admin','Logged in','Super Admin'),(816,'2024-12-08','10:34:59','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(817,'2024-12-08','10:35:05','admin','Logged in','Super Admin'),(818,'2024-12-08','10:53:30','karl','Logged in','Super Admin'),(819,'2024-12-08','10:53:52','admin','Logged in','Super Admin'),(820,'2024-12-08','10:54:59','karl','Logged in','Super Admin'),(821,'2024-12-08','10:55:46','karl','Logged in','Super Admin'),(822,'2024-12-08','10:58:10','karl','Logged in','Super Admin'),(823,'2024-12-08','10:59:38','admin','Logged in','Super Admin'),(824,'2024-12-08','11:00:05','karl','Logged in','Super Admin'),(825,'2024-12-08','11:01:33','karl','Logged in','Super Admin'),(826,'2024-12-08','11:06:22','admin','Logged in','Super Admin'),(827,'2024-12-08','11:09:33','admin','Logged out','Super Admin'),(828,'2024-12-08','11:10:10','admin','Logged in','Super Admin'),(829,'2024-12-08','11:11:14','admin','Logged out','Super Admin'),(830,'2024-12-08','11:11:41','admin','Logged in','Super Admin'),(831,'2024-12-08','11:14:26','admin','Logged in','Super Admin'),(832,'2024-12-08','11:15:09','admin','Logged out','Super Admin'),(833,'2024-12-08','11:15:33','admin','Logged in','Super Admin'),(834,'2024-12-08','11:16:29','admin','Logged out','Super Admin'),(835,'2024-12-08','11:16:52','admin','Logged in','Super Admin'),(836,'2024-12-08','11:18:48','karl','Logged in','Super Admin'),(837,'2024-12-08','11:20:33','karl','Auto logged out','Super Admin'),(838,'2024-12-08','11:23:33','admin','Auto logged out','Super Admin'),(839,'2024-12-08','11:23:48','admin','Logged in','Super Admin'),(840,'2024-12-08','11:24:45','karl','Logged in','Super Admin'),(841,'2024-12-08','11:28:33','admin','Auto logged out','Super Admin'),(842,'2024-12-08','11:28:26','admin','Logged in','Super Admin'),(843,'2024-12-08','11:33:47','karl','Auto logged out','Super Admin'),(844,'2024-12-08','11:33:47','karl','Logged out','Super Admin'),(845,'2024-12-08','11:34:31','archie@usep.edu.ph','Logged in','Faculty'),(846,'2024-12-08','11:36:49','archie@usep.edu.ph','Logged in','Faculty'),(847,'2024-12-08','11:38:21','archie@usep.edu.ph','Logged in','Faculty'),(848,'2024-12-08','11:38:33','admin','Auto logged out','Super Admin'),(849,'2024-12-08','11:38:20','admin','Logged in','Super Admin'),(850,'2024-12-08','11:38:52','admin','Added borrower log for: equipment: S123','Super Admin'),(851,'2024-12-08','11:38:52','admin','Added borrower log for: equipment: S126','Super Admin'),(852,'2024-12-08','11:39:26','archie@usep.edu.ph','Logged out','Faculty'),(853,'2024-12-08','11:44:02','admin','Marked equipment as returned for log ID: 5','Super Admin'),(854,'2024-12-08','11:44:06','admin','Marked equipment as returned for log ID: 6','Super Admin'),(855,'2024-12-08','11:44:38','archie@usep.edu.ph','Logged in','Faculty'),(856,'2024-12-08','11:44:47','archie@usep.edu.ph','Auto logged out','Faculty'),(857,'2024-12-08','11:44:48','archie@usep.edu.ph','Logged out','Faculty'),(858,'2024-12-08','11:45:03','archie@usep.edu.ph','Logged in','Faculty'),(859,'2024-12-08','11:46:38','admin','Deleted 2 borrower log entries.','Super Admin'),(860,'2024-12-08','11:46:58','archie@usep.edu.ph','Auto logged out','Faculty'),(861,'2024-12-08','11:46:54','admin','Added borrower log for: equipment: S124','Super Admin'),(862,'2024-12-08','11:46:54','admin','Added borrower log for: equipment: S125','Super Admin'),(863,'2024-12-08','11:47:02','admin','Marked equipment as returned for log ID: 7','Super Admin'),(864,'2024-12-08','11:47:05','admin','Marked equipment as returned for log ID: 8','Super Admin'),(865,'2024-12-08','11:48:33','admin','Auto logged out','Super Admin'),(866,'2024-12-08','11:51:49','admin','Logged in','Super Admin'),(867,'2024-12-08','11:51:57','admin','Deleted 2 borrower log entries.','Super Admin'),(868,'2024-12-08','11:52:11','admin','Added borrower log for: equipment: S124','Super Admin'),(869,'2024-12-08','11:52:11','admin','Added borrower log for: equipment: S126','Super Admin'),(870,'2024-12-08','11:52:16','admin','Marked equipment as returned for log ID: 9','Super Admin'),(871,'2024-12-08','11:52:17','admin','Marked equipment as returned for log ID: 10','Super Admin'),(872,'2024-12-08','12:01:33','admin','Auto logged out','Super Admin'),(873,'2024-12-08','12:01:20','admin','Logged in','Super Admin'),(874,'2024-12-08','12:02:15','karl','Logged in','Super Admin'),(875,'2024-12-08','12:02:55','admin','Auto logged out','Super Admin'),(876,'2024-12-08','12:02:37','admin','Logged out','Super Admin'),(877,'2024-12-08','12:03:12','admin','Logged in','Super Admin'),(878,'2024-12-08','12:03:51','admin','Deleted 2 borrower log entries.','Super Admin'),(879,'2024-12-08','12:04:03','admin','Added borrower log for: equipment: S123','Super Admin'),(880,'2024-12-08','12:04:03','admin','Added borrower log for: equipment: S125','Super Admin'),(881,'2024-12-08','12:04:03','admin','Added borrower log for: equipment: S126','Super Admin'),(882,'2024-12-08','12:04:13','admin','Marked equipment as returned for log ID: 11','Super Admin'),(883,'2024-12-08','12:04:13','admin','Marked equipment as returned for log ID: 12','Super Admin'),(884,'2024-12-08','12:04:13','admin','Marked equipment as returned for log ID: 13','Super Admin'),(885,'2024-12-08','12:12:35','karl','Auto logged out','Super Admin'),(886,'2024-12-08','12:14:21','karl','Logged in','Super Admin'),(887,'2024-12-08','12:17:24','karl','Auto logged out','Super Admin'),(888,'2024-12-08','12:17:24','karl','Logged out','Super Admin'),(889,'2024-12-08','12:17:43','karl','Logged in','Super Admin'),(890,'2024-12-08','12:21:03','karl','Edited equipment number: S124','Super Admin'),(891,'2024-12-08','12:23:05','karl','Edited equipment number: S124','Super Admin'),(892,'2024-12-08','12:25:13','karl','Auto logged out','Super Admin'),(893,'2024-12-08','12:25:13','karl','Logged out','Super Admin'),(894,'2024-12-08','12:25:20','karl','Logged in','Super Admin'),(895,'2024-12-08','12:29:12','karl','Auto logged out','Super Admin'),(896,'2024-12-08','12:29:12','karl','Logged out','Super Admin'),(897,'2024-12-08','12:29:16','karl','Logged in','Super Admin'),(898,'2024-12-08','12:30:16','karl','Auto logged out','Super Admin'),(899,'2024-12-08','12:30:53','karl','Logged in','Super Admin'),(900,'2024-12-08','12:33:53','karl','Auto logged out','Super Admin'),(901,'2024-12-08','13:22:27','karl','Auto logged out','Super Admin'),(902,'2024-12-08','13:25:10','karl','Logged in','Super Admin'),(903,'2024-12-08','13:26:10','karl','Auto logged out','Super Admin'),(904,'2024-12-08','13:27:20','karl','Logged in','Super Admin'),(905,'2024-12-08','13:28:20','karl','Auto logged out','Super Admin'),(906,'2024-12-08','13:37:27','karl','Logged in','Super Admin'),(907,'2024-12-08','13:38:27','karl','Auto logged out','Super Admin'),(908,'2024-12-08','13:40:12','karl','Logged in','Super Admin'),(909,'2024-12-08','13:42:33','karl','Auto logged out','Super Admin'),(910,'2024-12-08','13:42:44','karl','Logged in','Super Admin'),(911,'2024-12-08','13:44:44','karl','Auto logged out','Super Admin'),(912,'2024-12-08','13:44:52','karl','Logged in','Super Admin'),(913,'2024-12-08','13:49:53','karl','Auto logged out','Super Admin'),(914,'2024-12-08','13:50:07','karl','Logged in','Super Admin'),(915,'2024-12-08','13:52:05','admin','Auto logged out','Super Admin'),(916,'2024-12-08','13:53:07','karl','Auto logged out','Super Admin'),(917,'2024-12-08','13:53:30','karl','Logged in','Super Admin'),(918,'2024-12-08','14:07:10','karl','Auto logged out','Super Admin'),(919,'2024-12-08','14:19:46','karl','Logged in','Super Admin'),(920,'2024-12-08','14:20:39','karl','Auto logged out','Super Admin'),(921,'2024-12-08','14:20:42','karl','Logged in','Super Admin'),(922,'2024-12-08','14:25:03','karl','Auto logged out','Super Admin'),(923,'2024-12-08','14:39:02','karl','Logged in','Super Admin'),(924,'2024-12-08','14:47:54','karl','Auto logged out','Super Admin'),(925,'2024-12-08','14:47:58','karl','Logged in','Super Admin'),(926,'2024-12-08','14:49:35','karl','Auto logged out','Super Admin'),(927,'2024-12-08','14:49:42','karl','Logged in','Super Admin'),(928,'2024-12-08','14:50:32','karl','Auto logged out','Super Admin'),(929,'2024-12-08','14:50:41','karl','Logged in','Super Admin'),(930,'2024-12-08','14:57:30','karl','Auto logged out','Super Admin'),(931,'2024-12-08','14:57:36','karl','Logged in','Super Admin'),(932,'2024-12-08','14:59:16','karl','Auto logged out','Super Admin'),(933,'2024-12-08','15:00:19','karl','Logged in','Super Admin'),(934,'2024-12-08','15:03:59','karl','Auto logged out','Super Admin'),(935,'2024-12-08','15:04:03','karl','Logged in','Super Admin'),(936,'2024-12-08','15:06:23','karl','Auto logged out','Super Admin'),(937,'2024-12-08','15:11:31','karl','Logged in','Super Admin'),(938,'2024-12-08','15:13:11','karl','Auto logged out','Super Admin'),(939,'2024-12-08','15:14:22','karl','Logged in','Super Admin'),(940,'2024-12-08','15:15:22','karl','Auto logged out','Super Admin'),(941,'2024-12-08','15:19:12','karl','Logged in','Super Admin'),(942,'2024-12-08','15:20:53','karl','Auto logged out','Super Admin'),(943,'2024-12-08','15:22:07','karl','Logged in','Super Admin'),(944,'2024-12-08','15:23:48','karl','Auto logged out','Super Admin'),(945,'2024-12-08','15:26:19','karl','Logged in','Super Admin'),(946,'2024-12-08','15:27:19','karl','Auto logged out','Super Admin'),(947,'2024-12-08','15:27:58','karl','Logged in','Super Admin'),(948,'2024-12-08','15:28:58','karl','Auto logged out','Super Admin'),(949,'2024-12-08','15:29:23','karl','Logged in','Super Admin'),(950,'2024-12-08','15:32:24','karl','Auto logged out','Super Admin'),(951,'2024-12-08','15:48:07','karl','Logged in','Super Admin'),(952,'2024-12-08','15:51:47','karl','Auto logged out','Super Admin'),(953,'2024-12-08','15:52:58','karl','Logged in','Super Admin'),(954,'2024-12-08','15:53:58','karl','Auto logged out','Super Admin'),(955,'2024-12-08','15:54:52','karl','Logged in','Super Admin'),(956,'2024-12-08','15:55:52','karl','Auto logged out','Super Admin'),(957,'2024-12-08','16:03:52','karl','Logged in','Super Admin'),(958,'2024-12-08','16:08:13','karl','Auto logged out','Super Admin'),(959,'2024-12-08','16:08:17','karl','Logged in','Super Admin'),(960,'2024-12-08','16:09:16','karl','Auto logged out','Super Admin'),(961,'2024-12-08','16:09:19','karl','Logged in','Super Admin'),(962,'2024-12-08','16:11:00','karl','Auto logged out','Super Admin'),(963,'2024-12-08','16:11:10','karl','Logged in','Super Admin'),(964,'2024-12-08','16:20:58','admin','Logged in','Super Admin'),(965,'2024-12-08','16:24:11','karl','Auto logged out','Super Admin'),(966,'2024-12-08','16:25:38','karl','Logged in','Super Admin'),(967,'2024-12-08','16:27:18','karl','Auto logged out','Super Admin'),(968,'2024-12-08','16:27:45','karl','Logged in','Super Admin'),(969,'2024-12-08','16:29:57','admin','Auto logged out','Super Admin'),(970,'2024-12-08','16:29:39','admin','Logged out','Super Admin'),(971,'2024-12-08','16:30:05','karl','Auto logged out','Super Admin'),(972,'2024-12-08','16:30:54','admin','Logged in','Super Admin'),(973,'2024-12-08','16:31:39','karl','Logged in','Super Admin'),(974,'2024-12-08','16:32:39','karl','Auto logged out','Super Admin'),(975,'2024-12-08','16:33:56','karl','Logged in','Super Admin'),(976,'2024-12-08','16:34:27','karl','Requested to save Admin/Faculty Activity Logs as PDF file.','Super Admin'),(977,'2024-12-08','16:34:53','admin','Auto logged out','Super Admin'),(978,'2024-12-08','16:34:59','admin','Logged in','Super Admin'),(979,'2024-12-08','16:35:44','karl','Auto logged out','Super Admin'),(980,'2024-12-08','16:35:47','karl','Logged in','Super Admin'),(981,'2024-12-08','16:37:27','karl','Auto logged out','Super Admin'),(982,'2024-12-08','16:38:17','karl','Logged in','Super Admin'),(983,'2024-12-08','16:41:58','karl','Auto logged out','Super Admin'),(984,'2024-12-08','16:46:13','admin','Deleted 4 borrower log entries.','Super Admin'),(985,'2024-12-08','16:49:17','karl','Logged in','Super Admin'),(986,'2024-12-08','16:50:17','karl','Auto logged out','Super Admin'),(987,'2024-12-08','16:51:29','karl','Logged in','Super Admin'),(988,'2024-12-08','16:52:04','karl','Edited equipment number: S126','Super Admin'),(989,'2024-12-08','16:53:30','karl','Added equipment number: S127','Super Admin'),(990,'2024-12-08','16:53:39','karl','Edited equipment number: S127','Super Admin'),(991,'2024-12-08','16:54:29','karl','Auto logged out','Super Admin'),(992,'2024-12-08','17:05:14','karl','Logged in','Super Admin'),(993,'2024-12-08','17:05:42','admin','Auto logged out','Super Admin'),(994,'2024-12-08','17:06:54','karl','Auto logged out','Super Admin'),(995,'2024-12-08','17:06:55','karl','Logged in','Super Admin'),(996,'2024-12-08','17:07:32','admin','Logged in','Super Admin'),(997,'2024-12-08','17:07:55','karl','Auto logged out','Super Admin'),(998,'2024-12-08','17:09:39','admin','Auto logged out','Super Admin'),(999,'2024-12-08','17:09:21','admin','Logged out','Super Admin'),(1000,'2024-12-08','17:11:29','lomanguilimotan00277@usep.edu.ph','Logged in','Staff'),(1001,'2024-12-08','17:12:12','karl','Logged in','Super Admin'),(1002,'2024-12-08','17:12:58','lomanguilimotan00277@usep.edu.ph','Auto logged out','Staff'),(1003,'2024-12-08','17:12:39','lomanguilimotan00277@usep.edu.ph','Logged out','Staff'),(1004,'2024-12-08','17:13:12','karl','Auto logged out','Super Admin'),(1005,'2024-12-08','17:13:34','karl','Logged in','Super Admin'),(1006,'2024-12-08','17:14:22','lomanguilimotan00277@usep.edu.ph','Logged in','Staff'),(1007,'2024-12-08','17:17:55','karl','Auto logged out','Super Admin'),(1008,'2024-12-08','17:23:40','karl','Logged in','Super Admin'),(1009,'2024-12-08','17:24:41','karl','Auto logged out','Super Admin'),(1010,'2024-12-08','17:30:54','lomanguilimotan00277@usep.edu.ph','Auto logged out','Staff'),(1011,'2024-12-08','17:30:36','lomanguilimotan00277@usep.edu.ph','Logged out','Staff'),(1012,'2024-12-08','17:33:33','admin','Logged in','Super Admin'),(1013,'2024-12-08','17:38:17','karl','Logged in','Super Admin'),(1014,'2024-12-08','17:39:17','karl','Auto logged out','Super Admin'),(1015,'2024-12-08','17:40:18','karl','Logged in','Super Admin'),(1016,'2024-12-08','17:41:18','karl','Auto logged out','Super Admin'),(1017,'2024-12-08','17:47:10','karl','Logged in','Super Admin'),(1018,'2024-12-08','17:48:10','karl','Auto logged out','Super Admin'),(1019,'2024-12-08','17:50:06','karl','Logged in','Super Admin'),(1020,'2024-12-08','17:51:46','karl','Auto logged out','Super Admin'),(1021,'2024-12-08','17:53:12','karl','Logged in','Super Admin'),(1022,'2024-12-08','17:54:12','karl','Auto logged out','Super Admin'),(1023,'2024-12-08','18:03:36','admin','Auto logged out','Super Admin'),(1024,'2024-12-08','18:18:25','karl','Logged in','Super Admin'),(1025,'2024-12-08','18:19:25','karl','Auto logged out','Super Admin'),(1026,'2024-12-08','18:21:43','admin','Auto logged out','Super Admin'),(1027,'2024-12-08','18:21:49','admin','Logged in','Super Admin'),(1028,'2024-12-08','18:23:12','admin','Auto logged out','Super Admin'),(1029,'2024-12-08','18:22:53','admin','Logged out','Super Admin'),(1030,'2024-12-08','18:23:37','admin','Logged in','Super Admin'),(1031,'2024-12-08','18:23:57','admin','Auto logged out','Super Admin'),(1032,'2024-12-08','18:23:39','admin','Logged out','Super Admin'),(1033,'2024-12-08','18:24:26','admin','Logged in','Super Admin'),(1034,'2024-12-08','18:25:45','admin','Auto logged out','Super Admin'),(1035,'2024-12-08','18:26:10','admin','Logged in','Super Admin'),(1036,'2024-12-08','18:28:54','admin','Auto logged out','Super Admin'),(1037,'2024-12-08','18:28:35','admin','Logged out','Super Admin'),(1038,'2024-12-08','18:29:22','admin','Logged in','Super Admin'),(1039,'2024-12-08','18:30:47','admin','Auto logged out','Super Admin'),(1040,'2024-12-08','18:30:29','admin','Logged out','Super Admin'),(1041,'2024-12-08','18:30:59','admin','Logged in','Super Admin'),(1042,'2024-12-08','18:31:10','admin','Added borrower log for: equipment: S123','Super Admin'),(1043,'2024-12-08','18:31:10','admin','Added borrower log for: equipment: S124','Super Admin'),(1044,'2024-12-08','18:31:10','admin','Added borrower log for: equipment: S125','Super Admin'),(1045,'2024-12-08','18:33:38','admin','Auto logged out','Super Admin'),(1046,'2024-12-08','18:33:44','admin','Logged in','Super Admin'),(1047,'2024-12-08','18:34:46','karl','Logged in','Super Admin'),(1048,'2024-12-08','18:35:02','admin','Auto logged out','Super Admin'),(1049,'2024-12-08','18:35:03','admin','Logged in','Super Admin'),(1050,'2024-12-08','18:35:29','karl','Auto logged out','Super Admin'),(1051,'2024-12-08','18:35:40','karl','Logged in','Super Admin'),(1052,'2024-12-08','18:39:42','admin','Auto logged out','Super Admin'),(1053,'2024-12-08','18:42:01','karl','Auto logged out','Super Admin'),(1054,'2024-12-08','18:42:15','karl','Logged in','Super Admin'),(1055,'2024-12-08','18:42:06','admin','Logged in','Super Admin'),(1056,'2024-12-08','18:43:55','karl','Auto logged out','Super Admin'),(1057,'2024-12-08','18:45:25','admin','Auto logged out','Super Admin'),(1058,'2024-12-08','18:45:59','karl','Logged in','Super Admin'),(1059,'2024-12-08','18:46:25','karl','Auto logged out','Super Admin'),(1060,'2024-12-08','18:46:30','karl','Logged in','Super Admin'),(1061,'2024-12-08','18:46:31','admin','Logged in','Super Admin'),(1062,'2024-12-08','18:46:58','admin','Auto logged out','Super Admin'),(1063,'2024-12-08','18:46:40','admin','Logged out','Super Admin'),(1064,'2024-12-08','18:47:30','karl','Auto logged out','Super Admin'),(1065,'2024-12-08','18:48:40','admin','Logged in','Super Admin'),(1066,'2024-12-08','18:49:07','admin','Auto logged out','Super Admin'),(1067,'2024-12-08','18:48:49','admin','Logged out','Super Admin'),(1068,'2024-12-08','18:49:29','admin','Logged in','Super Admin'),(1069,'2024-12-08','18:49:48','admin','Auto logged out','Super Admin'),(1070,'2024-12-08','18:49:30','admin','Logged out','Super Admin'),(1071,'2024-12-08','18:49:56','admin','Logged in','Super Admin');
/*!40000 ALTER TABLE `admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `admin_logs_view`
--

DROP TABLE IF EXISTS `admin_logs_view`;
/*!50001 DROP VIEW IF EXISTS `admin_logs_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin_logs_view` AS SELECT 
 1 AS `LogId`,
 1 AS `Date`,
 1 AS `Time`,
 1 AS `AdminEmail`,
 1 AS `Activity`,
 1 AS `AdminName`,
 1 AS `Role`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `admin_salt` varchar(255) DEFAULT NULL,
  `admin_type` varchar(50) DEFAULT NULL,
  `admin_fname` varchar(100) DEFAULT NULL,
  `admin_mname` varchar(100) DEFAULT NULL,
  `admin_lname` varchar(100) DEFAULT NULL,
  `admin_secured` tinyint(1) DEFAULT NULL,
  `admin_status` tinyint DEFAULT '1',
  `admin_online` varchar(50) DEFAULT NULL,
  `admin_update` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES ('admin','3pspsK4u4rNdmQ3XysTSREYf+9JnORb+HnfHfgA3hLk=','pKWnK7OdzwvOapvOLZ3Rfg==','Super Admin','Default','Built-in','Admin',1,1,'Online','2024-12-08 18:52:14'),('dmbgerodias00151@usep.edu.ph','+4Uf1a2ivjVSI/vlIPr+xZy3affaQpq6gLicoBinquo=','Iv0RInuGwUKVRZgYxuIVuQ==','Staff','Debbie Michelle','Buragay','Gerodias',0,1,NULL,NULL),('jpcosorio00256@usep.edu.ph','gfJus6b0mlj1gdSQhuyAbkxqvUmDZ2lJRBH/SyK/hd0=','W5m1xw8i0p6amQEWnGjwZA==','Super Admin','John Paul','Canete','Osorio',1,1,NULL,NULL),('karl','RlOsB+MWQ8mBTSivUA6xLX1qL9KVsZgc0O2955p8QZQ=','WI2avvx/NixL7Ow8mZUj4w==','Super Admin','Karl','Olaer','Cornejo',1,1,'Offline',NULL),('kocornejo00294@usep.edu.ph','LLOHP5GBunAoKZ1uSTYfGpLqWYdv+PtrtCUOWlJ8ZVc=','uZ1XTulp1o/pxwD30XJ8AQ==','Super Admin','Karl','Olaer','Cornejo',1,1,NULL,NULL),('lomanguilimotan00277@usep.edu.ph','GZ2p7/90EUq+L99QHBwvu/+mN71AhLMXwaRgc29cfrc=','pznxeJgCFLDmxl7h/tsVWQ==','Staff','Lanz','Omandac','Manguilimotan',1,1,'Offline',NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_admin_update` AFTER UPDATE ON `admin_user` FOR EACH ROW BEGIN
    -- Check if the admin status is being set to 'Offline'
    IF OLD.admin_online <> 'Offline' AND NEW.admin_online = 'Offline' THEN
        INSERT INTO admin_logs (alog_date, alog_time, alog_admin_email, alog_activity, alog_admin_type)
        VALUES (
            CURDATE(),
            CURTIME(),
            OLD.admin_email, -- Assuming there is an `admin_email` column in the `admin_user` table
            'Auto logged out',
            OLD.admin_type  -- Assuming there is an `admin_type` column in the `admin_user` table
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `admin_user_view`
--

DROP TABLE IF EXISTS `admin_user_view`;
/*!50001 DROP VIEW IF EXISTS `admin_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin_user_view` AS SELECT 
 1 AS `admin_email`,
 1 AS `admin_full_name`,
 1 AS `admin_type`,
 1 AS `admin_secured`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrower_logs`
--

DROP TABLE IF EXISTS `borrower_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower_logs` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `blog_fname` varchar(100) DEFAULT NULL,
  `blog_mname` varchar(100) DEFAULT NULL,
  `blog_lname` varchar(100) DEFAULT NULL,
  `blog_bdate` date DEFAULT NULL,
  `blog_btime` time DEFAULT NULL,
  `blog_rdate` date DEFAULT NULL,
  `blog_rtime` time DEFAULT NULL,
  `blog_letter` mediumblob,
  `blog_equipment_number` varchar(255) DEFAULT NULL,
  `blog_return_status` varchar(50) DEFAULT NULL,
  `blog_admin_email` varchar(100) DEFAULT NULL,
  `blog_status` tinyint DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `borrower_logs_ibfk_1` (`blog_admin_email`),
  CONSTRAINT `borrower_logs_ibfk_1` FOREIGN KEY (`blog_admin_email`) REFERENCES `admin_user` (`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_logs`
--

LOCK TABLES `borrower_logs` WRITE;
/*!40000 ALTER TABLE `borrower_logs` DISABLE KEYS */;
INSERT INTO `borrower_logs` VALUES (14,'Sample','','Data','2024-12-08',NULL,'2024-12-08',NULL,_binary 'C:\\Users\\lanzm\\Downloads\\SE-Revisions-2_merged.pdf','S123','In Use','admin',1),(15,'Sample','','Data','2024-12-08',NULL,'2024-12-08',NULL,_binary 'C:\\Users\\lanzm\\Downloads\\SE-Revisions-2_merged.pdf','S124','In Use','admin',1),(16,'Sample','','Data','2024-12-08',NULL,'2024-12-08',NULL,_binary 'C:\\Users\\lanzm\\Downloads\\SE-Revisions-2_merged.pdf','S125','In Use','admin',1);
/*!40000 ALTER TABLE `borrower_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsit_inventory`
--

DROP TABLE IF EXISTS `bsit_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsit_inventory` (
  `property_number` varchar(50) NOT NULL,
  `property_type` varchar(50) DEFAULT NULL,
  `property_description` varchar(255) DEFAULT NULL,
  `property_unit` varchar(50) DEFAULT NULL,
  `property_cost` double DEFAULT NULL,
  `property_responsible` varchar(50) DEFAULT NULL,
  `property_assigned` varchar(50) DEFAULT NULL,
  `property_date_time` datetime DEFAULT NULL,
  `property_status` tinyint DEFAULT '1',
  PRIMARY KEY (`property_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsit_inventory`
--

LOCK TABLES `bsit_inventory` WRITE;
/*!40000 ALTER TABLE `bsit_inventory` DISABLE KEYS */;
INSERT INTO `bsit_inventory` VALUES ('MRJTG11007351006145920','Lcd Projector','LCD PROJECTOR, WHITE AND COLOUR BRIGHTNESS AT 3,600LM, WXGA RESOLUTION, HIGH CONTRASTS RATIO OF 15,000:1, HORIZONTAL KEYSTONE SLIDE, 10,000 HOURS LAMP LIFE IN ECO-MODE','UNITS',38000,'Mish  Cempron','Mish  Cempron','2024-12-01 03:21:48',1),('MRJTG11007351006365920','Lcd Projector','LCD PROJECTOR, WHITE AND COLOUR BRIGHTNESS AT 3,600LM, WXGA RESOLUTION, HIGH CONTRASTS RATIO OF 15,000:1, HORIZONTAL KEYSTONE SLIDE, 10,000 HOURS LAMP LIFE IN ECO-MODE','UNITS',38000,'Mish  Cempron','Archie  Cenas','2024-12-01 03:16:31',1),('P1','Cable Tester','METAL CABLES, SIZE:230X135X85MM POWER: 9V ALKALINE BATTERY (EXCLUDED), MEASURE CABLE LENGTH OR RJ45, BNC CABLE, TRACE AND LOCAT RJ45(STP/4-CORE), RJ11, USB, BNC CABLES','PIECE',3850,'Mish  Cempron','Vincent Kyle Orpiano Arsenio','2024-12-01 14:58:05',1);
/*!40000 ALTER TABLE `bsit_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_inventory`
--

DROP TABLE IF EXISTS `cl_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_inventory` (
  `equipment_number` varchar(50) NOT NULL,
  `equipment_name` varchar(50) DEFAULT NULL,
  `equipment_model` varchar(50) DEFAULT NULL,
  `equipment_area` enum('COMPUTER LABORATORY 1','COMPUTER LABORATORY 2','COMPUTER LABORATORY 3') DEFAULT NULL,
  `equipment_status` varchar(50) DEFAULT NULL,
  `equipment_ip_address` varchar(50) DEFAULT NULL,
  `equipment_station_number` varchar(5) DEFAULT NULL,
  `equipment_date_time` datetime DEFAULT NULL,
  `equipment_status_delete` tinyint(1) DEFAULT '1',
  `equipment_return_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`equipment_number`),
  UNIQUE KEY `equipment_ip_address` (`equipment_ip_address`),
  UNIQUE KEY `idx_station_area` (`equipment_station_number`,`equipment_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_inventory`
--

LOCK TABLES `cl_inventory` WRITE;
/*!40000 ALTER TABLE `cl_inventory` DISABLE KEYS */;
INSERT INTO `cl_inventory` VALUES ('S123','Computer','i5','COMPUTER LABORATORY 1','Functional','192.168.218.202','1','2024-11-08 12:59:59',1,0),('S124','Computer','i5','COMPUTER LABORATORY 1','Functional','192.168.137.1','2','2024-11-19 13:26:03',1,0),('S125','Computer','i5','COMPUTER LABORATORY 1','Functional','192.168.227.204','3','2024-11-19 14:36:27',1,0),('S126','Computer','i5','COMPUTER LABORATORY 2','Functional','192.168.227.94','1','2024-11-29 08:39:13',1,1),('S127','Computer','i5','COMPUTER LABORATORY 3','Functional','192.168.1.1','1','2024-12-08 16:53:29',1,1);
/*!40000 ALTER TABLE `cl_inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_cl_inventory` AFTER INSERT ON `cl_inventory` FOR EACH ROW BEGIN
    INSERT INTO pc_tracker (track_equipment_number, track_power_status, track_user_id)
    VALUES (NEW.equipment_number, NULL, NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_cl_inventory` BEFORE DELETE ON `cl_inventory` FOR EACH ROW BEGIN
    DELETE FROM pc_tracker
    WHERE track_equipment_number = OLD.equipment_number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `college_id` varchar(10) NOT NULL,
  `college_abrv` varchar(10) DEFAULT NULL,
  `college_fullname` varchar(255) DEFAULT NULL,
  `college_status` tinyint DEFAULT '1',
  PRIMARY KEY (`college_id`),
  UNIQUE KEY `college_abrv_name` (`college_abrv`,`college_fullname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES ('TMC1','CTET','College of Teacher Education and Technology',1),('TMC2','COE','College of Engineering',1),('TMC3','SOM','School of Medicine',1);
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `combined_logs_view`
--

DROP TABLE IF EXISTS `combined_logs_view`;
/*!50001 DROP VIEW IF EXISTS `combined_logs_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `combined_logs_view` AS SELECT 
 1 AS `LogId`,
 1 AS `Date`,
 1 AS `Time`,
 1 AS `AdminEmail`,
 1 AS `Activity`,
 1 AS `AdminName`,
 1 AS `Role`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_code` varchar(10) NOT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `course_college` varchar(10) DEFAULT NULL,
  `course_program` varchar(10) DEFAULT NULL,
  `course_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`course_code`),
  KEY `course_college` (`course_college`),
  KEY `course_program` (`course_program`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`course_college`) REFERENCES `colleges` (`college_id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`course_program`) REFERENCES `program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('IT 227','Advanced Information Management','TMC1','P5',1),('IT 319','Software Engineering 2','TMC1','P5',1),('ITIS 311','Fundamentals in Security Design','TMC1','P5',1),('ITIS 314','Cybersecurity','TMC1','P5',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_email` varchar(100) NOT NULL,
  `faculty_fname` varchar(100) DEFAULT NULL,
  `faculty_mname` varchar(100) DEFAULT NULL,
  `faculty_lname` varchar(100) DEFAULT NULL,
  `faculty_password` varchar(255) DEFAULT NULL,
  `faculty_salt` varchar(255) DEFAULT NULL,
  `faculty_college` varchar(10) DEFAULT NULL,
  `faculty_program` varchar(10) DEFAULT NULL,
  `faculty_secured` tinyint DEFAULT NULL,
  `faculty_status` tinyint DEFAULT '1',
  `faculty_online` varchar(50) DEFAULT NULL,
  `faculty_update` datetime DEFAULT NULL,
  PRIMARY KEY (`faculty_email`),
  KEY `faculty_college` (`faculty_college`),
  KEY `faculty_program` (`faculty_program`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`faculty_college`) REFERENCES `colleges` (`college_id`),
  CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`faculty_program`) REFERENCES `program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('archie@usep.edu.ph','Archie','','Cenas','/2cnpWyzIkFWQHUQdOHmg2jnTYGWKDH7e9Y1d3mpkoY=','wYFOBVDoxtsu7wtMswyn/A==','TMC1','P5',1,1,'Offline',NULL),('debbie@usep.edu.ph','Debbie Michelle','Buragay','Gerodias',NULL,NULL,'TMC1','P5',1,1,NULL,NULL),('hash@usep.edu.ph','Maximilianus Aurelius Vanderhoeven','Seraphinella ','Dela Cruz','/SwwuIPyRwHEWefh8tagbOPBsbKZ6+bM/wuJDPXYbGU=','ZsrF4/Zzpyp/5yn2G4LN0w==','TMC1','P5',1,1,NULL,NULL),('karl','karl','karl','karl','APx7/QqFMKMc6DCXyHWmBc3ogBfFWRj/sj2SZTArZ8Y=','RFMZCd9nobQcn3PNY0Uymg==','TMC1','P5',1,1,NULL,NULL),('kocornejo00294@usep.edu.ph','Karl','','Cornejo','xDfmJnIRDEhIMolDrgmLBOt43z7xfLJofRmVGAHywwg=','g7aBKOwnEiTZMbUawhqoUA==','TMC1','P1',1,1,NULL,NULL),('mish@usep.edu.ph','Mish','','Cempron',NULL,NULL,'TMC1','P5',1,1,NULL,NULL),('test@usep.edu.ph','John Robert ','Wilson','Doe','mG96U6XOWQETqPqmrhTLxW0BR94idZzoUfwIIE8e/fA=','sLFwYYHspLbaoeoFjddPWQ==','TMC1','P1',1,1,NULL,NULL),('vaughn@usep.edu.ph','Vaughn Rhommer Theodore','Dela Cruz','Gucor',NULL,NULL,'TMC1','P5',1,1,NULL,NULL),('vkoarsenio02205@usep.edu.ph','Vincent Kyle','Orpiano','Arsenio','c9veJrPJUvlVUupEFChQnpjxTgl4rEuzIOBEQA6KFNQ=','JsZVhky1Taa0D70Sa4jcBw==','TMC1','P5',1,1,NULL,NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_faculty_update` AFTER UPDATE ON `faculty` FOR EACH ROW BEGIN
    -- Check if the admin status is being set to 'Offline'
    IF OLD.faculty_online <> 'Offline' AND NEW.faculty_online = 'Offline' THEN
        INSERT INTO admin_logs (alog_date, alog_time, alog_admin_email, alog_activity, alog_admin_type)
        VALUES (
            CURDATE(),
            CURTIME(),
            OLD.faculty_email, -- Assuming there is an `admin_email` column in the `admin_user` table
            'Auto logged out',
            'Faculty'
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `faculty_logs_view`
--

DROP TABLE IF EXISTS `faculty_logs_view`;
/*!50001 DROP VIEW IF EXISTS `faculty_logs_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `faculty_logs_view` AS SELECT 
 1 AS `LogId`,
 1 AS `Date`,
 1 AS `Time`,
 1 AS `AdminEmail`,
 1 AS `Activity`,
 1 AS `AdminName`,
 1 AS `Role`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `faculty_view`
--

DROP TABLE IF EXISTS `faculty_view`;
/*!50001 DROP VIEW IF EXISTS `faculty_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `faculty_view` AS SELECT 
 1 AS `faculty_email`,
 1 AS `faculty_full_name`,
 1 AS `college_abrv`,
 1 AS `program_abrv`,
 1 AS `faculty_secured`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pc_tracker`
--

DROP TABLE IF EXISTS `pc_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc_tracker` (
  `track_equipment_number` varchar(50) NOT NULL,
  `track_power_status` varchar(50) DEFAULT NULL,
  `track_user_id` varchar(50) DEFAULT NULL,
  `track_update` datetime DEFAULT NULL,
  `track_action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`track_equipment_number`),
  KEY `track_user_id` (`track_user_id`),
  CONSTRAINT `pc_tracker_ibfk_1` FOREIGN KEY (`track_equipment_number`) REFERENCES `cl_inventory` (`equipment_number`),
  CONSTRAINT `pc_tracker_ibfk_2` FOREIGN KEY (`track_user_id`) REFERENCES `student_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_tracker`
--

LOCK TABLES `pc_tracker` WRITE;
/*!40000 ALTER TABLE `pc_tracker` DISABLE KEYS */;
INSERT INTO `pc_tracker` VALUES ('S123',NULL,NULL,NULL,NULL),('S124',NULL,NULL,NULL,NULL),('S125',NULL,NULL,NULL,NULL),('S126',NULL,NULL,NULL,NULL),('S127',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pc_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `program_id` varchar(10) NOT NULL,
  `program_college_id` varchar(10) DEFAULT NULL,
  `program_abrv` varchar(10) DEFAULT NULL,
  `program_fullname` varchar(255) DEFAULT NULL,
  `program_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_abrv_name` (`program_abrv`,`program_fullname`) USING BTREE,
  KEY `program_college_id` (`program_college_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`program_college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES ('P1','TMC1','BEEd','Bachelor of Elementary Education',1),('P2','TMC1','BSNEd','Bachelor of Special Needs Education',1),('P3','TMC1','BECEd','Bachelor of Early Childhood Education',1),('P4','TMC1','BSEd','Bachelor of Secondary Education',1),('P5','TMC1','BSIT','Bachelor of Science in Information Technology',1),('P6','TMC1','BTVTEd','Bachelor of Technical-Vocational Teacher Education',1),('P7','TMC2','BSABE','Bachelor of Science in Agricultural and Biosystems Engineering',1),('P8','TMC3','SOM','School of Medicine',1);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_logs`
--

DROP TABLE IF EXISTS `student_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_logs` (
  `slog_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slog_equipment_number` varchar(50) DEFAULT NULL,
  `slog_date_in` date DEFAULT NULL,
  `slog_time_in` time DEFAULT NULL,
  `slog_date_out` date DEFAULT NULL,
  `slog_time_out` time DEFAULT NULL,
  `slog_purpose` varchar(50) DEFAULT NULL,
  `slog_faculty` varchar(50) DEFAULT NULL,
  `slog_user_id` varchar(50) DEFAULT NULL,
  `slog_update` datetime DEFAULT NULL,
  PRIMARY KEY (`slog_id`),
  KEY `slog_equipment_number` (`slog_equipment_number`),
  KEY `slog_user_id` (`slog_user_id`),
  CONSTRAINT `student_logs_ibfk_1` FOREIGN KEY (`slog_equipment_number`) REFERENCES `cl_inventory` (`equipment_number`),
  CONSTRAINT `student_logs_ibfk_2` FOREIGN KEY (`slog_user_id`) REFERENCES `student_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_logs`
--

LOCK TABLES `student_logs` WRITE;
/*!40000 ALTER TABLE `student_logs` DISABLE KEYS */;
INSERT INTO `student_logs` VALUES ('S123-2022-00151-2024-12-03-07-15-24','S123','2024-12-03','15:15:24','2024-12-03','15:17:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-03-07-16-56','S123','2024-12-03','15:16:56','2024-12-03','15:19:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-03-07-20-07','S123','2024-12-03','15:20:07','2024-12-03','15:22:23','IT 227 Advanced Information Management','vaughn@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-20-44-46','S123','2024-12-06','20:44:46','2024-12-06','20:45:56','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-20-46-07','S123','2024-12-06','20:46:06','2024-12-06','20:47:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-16-01','S123','2024-12-06','21:16:00','2024-12-06','21:17:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-06-21-16-47','S123','2024-12-06','21:16:47','2024-12-06','21:18:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-06-21-20-04','S123','2024-12-06','21:20:04','2024-12-06','21:20:28','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-20-42','S123','2024-12-06','21:20:41','2024-12-06','21:22:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-29-52','S123','2024-12-06','21:29:52','2024-12-06','21:30:17','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-30-30','S123','2024-12-06','21:30:29','2024-12-06','21:32:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-06-21-32-01','S123','2024-12-06','21:32:00','2024-12-06','21:32:21','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-32-34','S123','2024-12-06','21:32:34','2024-12-06','21:34:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-38-44','S123','2024-12-06','21:38:44','2024-12-06','21:39:07','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-46-08','S123','2024-12-06','21:46:07','2024-12-06','21:46:36','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-47-13','S123','2024-12-06','21:47:13','2024-12-06','21:48:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-49-21','S123','2024-12-06','21:49:21','2024-12-06','21:50:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-06-21-51-04','S123','2024-12-06','21:51:04','2024-12-06','21:51:24','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-52-21','S123','2024-12-06','21:52:21','2024-12-06','21:52:45','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-21-54-27','S123','2024-12-06','21:54:27','2024-12-06','21:56:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-22-52-14','S123','2024-12-06','22:52:13','2024-12-06','22:54:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-06-23-10-02','S123','2024-12-06','23:10:02','2024-12-06','23:11:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-23-18-32','S123','2024-12-06','23:18:32','2024-12-06','23:22:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-23-22-18','S123','2024-12-06','23:22:18','2024-12-06','23:22:56','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-06-23-25-03','S123','2024-12-06','23:25:03','2024-12-06','23:27:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-11-33-49','S123','2024-12-07','11:33:49','2024-12-07','11:35:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-10-35','S123','2024-12-07','12:10:35','2024-12-07','12:12:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-20-06','S123','2024-12-07','12:20:07','2024-12-07','12:20:30','IT 227 Advanced Information Management','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-21-49','S123','2024-12-07','12:21:49','2024-12-07','12:22:10','ITIS 311 Fundamentals in Security Design','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-22-57','S123','2024-12-07','12:22:57','2024-12-07','12:23:20','IT 319 Software Engineering 2','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-24-29','S123','2024-12-07','12:24:29','2024-12-07','12:24:55','ITIS 311 Fundamentals in Security Design','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-29-36','S123','2024-12-07','12:29:36','2024-12-07','12:29:54','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-32-03','S123','2024-12-07','12:32:03','2024-12-07','12:32:37','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-33-56','S123','2024-12-07','12:33:56','2024-12-07','12:34:15','ITIS 311 Fundamentals in Security Design','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-35-27','S123','2024-12-07','12:35:27','2024-12-07','12:35:45','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-36-38','S123','2024-12-07','12:36:38','2024-12-07','12:36:59','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-12-37-46','S123','2024-12-07','12:37:46','2024-12-07','12:39:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-07-13-21-32','S123','2024-12-07','13:21:32','2024-12-07','13:21:57','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-13-24-52','S123','2024-12-07','13:24:52','2024-12-07','13:26:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-07-13-32-58','S123','2024-12-07','13:32:58','2024-12-07','13:33:54','ITIS 311 Fundamentals in Security Design','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-13-59-08','S123','2024-12-07','13:59:08','2024-12-07','14:01:23','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-14-01-46','S123','2024-12-07','14:01:46','2024-12-07','14:02:39','IT 319 Software Engineering 2','karl','2022-00151',NULL),('S123-2022-00151-2024-12-07-14-03-07','S123','2024-12-07','14:03:08','2024-12-07','14:04:23','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-14-04-19','S123','2024-12-07','14:04:19','2024-12-07','14:05:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-07-14-05-33','S123','2024-12-07','14:05:33','2024-12-07','14:05:55','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-14-06-10','S123','2024-12-07','14:06:10','2024-12-07','14:07:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-07-14-16-23','S123','2024-12-07','14:16:23','2024-12-07','14:18:23','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-14-49-17','S123','2024-12-07','14:49:17','2024-12-07','14:57:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-04-14','S123','2024-12-07','15:04:14','2024-12-07','15:06:23','IT 227 Advanced Information Management','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-05-18','S123','2024-12-07','15:05:18','2024-12-07','15:12:23','ITIS 311 Fundamentals in Security Design','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-12-30','S123','2024-12-07','15:12:30','2024-12-07','15:14:24','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-14-29','S123','2024-12-07','15:14:29','2024-12-07','15:16:23','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-16-51','S123','2024-12-07','15:16:51','2024-12-07','15:19:23','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-18-42','S123','2024-12-07','15:18:42','2024-12-07','15:20:23','IT 319 Software Engineering 2','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-20-09','S123','2024-12-07','15:20:09','2024-12-07','15:22:23','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-21-41','S123','2024-12-07','15:21:41','2024-12-07','15:23:23','IT 319 Software Engineering 2','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-23-24','S123','2024-12-07','15:23:24','2024-12-07','15:25:23','ITIS 311 Fundamentals in Security Design','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-24-31','S123','2024-12-07','15:24:32','2024-12-07','15:26:23','ITIS 314 Cybersecurity','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-26-04','S123','2024-12-07','15:26:04','2024-12-07','15:27:23','ITIS 311 Fundamentals in Security Design','vkoarsenio02205@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-30-19','S123','2024-12-07','15:30:20','2024-12-07','15:32:23','ITIS 314 Cybersecurity','vaughn@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-15-37-11','S123','2024-12-07','15:37:11','2024-12-07','15:51:23','ITIS 311 Fundamentals in Security Design','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-00-43','S123','2024-12-07','16:00:43','2024-12-07','16:16:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-16-18','S123','2024-12-07','16:16:18','2024-12-07','16:19:23','IT 319 Software Engineering 2','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-18-39','S123','2024-12-07','16:18:40','2024-12-07','16:26:23','ITIS 314 Cybersecurity','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-26-02','S123','2024-12-07','16:26:02','2024-12-07','16:29:23','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-35-23','S123','2024-12-07','16:35:23','2024-12-07','16:40:23','IT 319 Software Engineering 2','kocornejo00294@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-40-40','S123','2024-12-07','16:40:40','2024-12-07','16:44:23','ITIS 314 Cybersecurity','karl','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-44-46','S123','2024-12-07','16:44:46','2024-12-07','16:47:23','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-46-31','S123','2024-12-07','16:46:31','2024-12-07','16:49:23','ITIS 311 Fundamentals in Security Design','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-50-02','S123','2024-12-07','16:50:03','2024-12-07','16:51:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-51-56','S123','2024-12-07','16:51:56','2024-12-07','16:53:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-53-34','S123','2024-12-07','16:53:34','2024-12-07','16:55:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-16-54-53','S123','2024-12-07','16:54:54','2024-12-07','17:00:23','ITIS 311 Fundamentals in Security Design','vkoarsenio02205@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-07-17-03-23','S123','2024-12-07','17:03:23','2024-12-07','17:05:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-33-17','S123','2024-12-08','10:33:16','2024-12-08','10:33:49','IT 319 Software Engineering 2','hash@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-34-01','S123','2024-12-08','10:34:01','2024-12-08','10:35:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-37-17','S123','2024-12-08','10:37:16','2024-12-08','10:37:53','IT 227 Advanced Information Management','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-38-06','S123','2024-12-08','10:38:06','2024-12-08','10:39:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-10-39-11','S123','2024-12-08','10:39:10','2024-12-08','10:39:32','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-39-45','S123','2024-12-08','10:39:45','2024-12-08','10:42:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-10-44-19','S123','2024-12-08','10:44:19','2024-12-08','10:51:23','ITIS 311 Fundamentals in Security Design','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-52-29','S123','2024-12-08','10:52:29','2024-12-08','10:54:23','IT 227 Advanced Information Management','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-59-08','S123','2024-12-08','10:59:08','2024-12-08','10:59:29','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-10-59-41','S123','2024-12-08','10:59:41','2024-12-08','11:01:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-13-11','S123','2024-12-08','11:13:10','2024-12-08','11:13:29','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-13-44','S123','2024-12-08','11:13:44','2024-12-08','11:15:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-18-27','S123','2024-12-08','11:18:26','2024-12-08','11:18:49','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-19-05','S123','2024-12-08','11:19:04','2024-12-08','11:20:23','ITIS 311 Fundamentals in Security Design','vaughn@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-20-54','S123','2024-12-08','11:20:53','2024-12-08','11:22:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-22-40','S123','2024-12-08','11:22:39','2024-12-08','11:23:08','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-25-33','S123','2024-12-08','11:25:32','2024-12-08','11:27:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-28-42','S123','2024-12-08','11:28:42','2024-12-08','11:30:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-30-43','S123','2024-12-08','11:30:43','2024-12-08','11:32:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-35-11','S123','2024-12-08','11:35:10','2024-12-08','11:36:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-37-49','S123','2024-12-08','11:37:48','2024-12-08','11:39:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-40-57','S123','2024-12-08','11:40:56','2024-12-08','11:41:14','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-41-25','S123','2024-12-08','11:41:24','2024-12-08','11:43:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-43-16','S123','2024-12-08','11:43:16','2024-12-08','11:44:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-43-56','S123','2024-12-08','11:43:55','2024-12-08','11:45:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-45-03','S123','2024-12-08','11:45:02','2024-12-08','11:45:27','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-48-29','S123','2024-12-08','11:48:28','2024-12-08','11:50:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-11-53-25','S123','2024-12-08','11:53:24','2024-12-08','11:53:47','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-11-58-04','S123','2024-12-08','11:58:04','2024-12-08','12:01:23','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-12-01-51','S123','2024-12-08','12:01:51','2024-12-08','12:03:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-12-04-41','S123','2024-12-08','12:04:41','2024-12-08','12:06:23',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-12-09-40','S123','2024-12-08','12:09:40','2024-12-08','12:09:59','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-12-16-01','S123','2024-12-08','12:16:00','2024-12-08','12:17:01',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-12-17-34','S123','2024-12-08','12:17:34','2024-12-08','12:20:07','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-12-21-11','S123','2024-12-08','12:21:10','2024-12-08','12:22:11',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-12-24-31','S123','2024-12-08','12:24:31','2024-12-08','12:27:54',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-12-32-58','S123','2024-12-08','12:32:57','2024-12-08','13:31:15','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-13-34-30','S123','2024-12-08','13:34:29','2024-12-08','13:34:50','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-13-39-40','S123','2024-12-08','13:39:39','2024-12-08','13:40:40',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-13-43-22','S123','2024-12-08','13:43:21','2024-12-08','13:43:42','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-13-45-56','S123','2024-12-08','13:45:56','2024-12-08','13:46:14','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-13-52-04','S123','2024-12-08','13:52:03','2024-12-08','13:52:25','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-13-57-21','S123','2024-12-08','13:57:20','2024-12-08','13:57:49','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-06-15','S123','2024-12-08','14:06:14','2024-12-08','14:06:32','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-12-28','S123','2024-12-08','14:12:27','2024-12-08','14:12:51','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-13-25','S123','2024-12-08','14:13:24','2024-12-08','14:14:25','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-21-10','S123','2024-12-08','14:21:10','2024-12-08','14:21:32','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-32-17','S123','2024-12-08','14:32:16','2024-12-08','14:32:34','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-33-17','S123','2024-12-08','14:33:16','2024-12-08','14:34:17',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-14-34-40','S123','2024-12-08','14:34:40','2024-12-08','14:34:58','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-37-19','S123','2024-12-08','14:37:18','2024-12-08','14:37:36','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-39-08','S123','2024-12-08','14:39:07','2024-12-08','14:39:27','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-40-40','S123','2024-12-08','14:40:39','2024-12-08','14:41:08','IT 227 Advanced Information Management','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-50-57','S123','2024-12-08','14:50:57','2024-12-08','14:53:17','IT 227 Advanced Information Management','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-54-58','S123','2024-12-08','14:54:57','2024-12-08','14:55:24','IT 227 Advanced Information Management','test@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-57-09','S123','2024-12-08','14:57:08','2024-12-08','14:57:30','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-14-58-39','S123','2024-12-08','14:58:38','2024-12-08','14:59:16','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-04-34','S123','2024-12-08','15:04:33','2024-12-08','15:05:34',NULL,NULL,'2022-00151',NULL),('S123-2022-00151-2024-12-08-15-05-18','S123','2024-12-08','15:05:17','2024-12-08','15:05:54','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-06-38','S123','2024-12-08','15:06:38','2024-12-08','15:07:01','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-08-06','S123','2024-12-08','15:08:06','2024-12-08','15:08:27','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-09-27','S123','2024-12-08','15:09:27','2024-12-08','15:11:17','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-23-25','S123','2024-12-08','15:23:25','2024-12-08','15:26:03','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00151-2024-12-08-15-29-36','S123','2024-12-08','15:29:35','2024-12-08','15:30:41','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S123-2022-00294-2024-12-01-01-51-54','S123','2024-12-01','09:51:54','2024-12-01','09:52:18','Others','hash@usep.edu.ph','2022-00294',NULL),('S123-2022-00294-2024-12-01-01-52-27','S123','2024-12-01','09:52:27','2024-12-01','09:54:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00294',NULL),('S123-2022-00294-2024-12-01-04-01-51','S123','2024-12-01','12:01:51','2024-12-01','12:04:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-05-23','S123','2024-12-01','12:05:23','2024-12-01','12:10:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-09-39','S123','2024-12-01','12:09:39','2024-12-01','12:12:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-18-04','S123','2024-12-01','12:18:04','2024-12-01','12:20:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-24-47','S123','2024-12-01','12:24:47','2024-12-01','12:27:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-32-01','S123','2024-12-01','12:32:01','2024-12-01','12:34:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-33-49','S123','2024-12-01','12:33:49','2024-12-01','12:35:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-36-51','S123','2024-12-01','12:36:51','2024-12-01','12:38:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-04-40-24','S123','2024-12-01','12:40:24','2024-12-01','12:43:23',NULL,NULL,'2022-00294',NULL),('S123-2022-00294-2024-12-01-06-29-07','S123','2024-12-01','14:29:07','2024-12-01','14:32:23','IT 319 Software Engineering 2','mish@usep.edu.ph','2022-00294',NULL),('S124-2022-00151-2024-12-01-02-01-08','S124','2024-12-01','10:01:07','2024-12-01','10:03:23','ITIS 311 Fundamentals in Security Design','vaughn@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-02-35-27','S124','2024-12-01','10:35:26','2024-12-01','10:50:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-03-31-38','S124','2024-12-01','11:31:37','2024-12-01','11:33:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-03-33-05','S124','2024-12-01','11:33:04','2024-12-01','11:35:23','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-03-36-43','S124','2024-12-01','11:36:42','2024-12-01','11:39:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-03-39-12','S124','2024-12-01','11:39:10','2024-12-01','11:40:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-03-40-53','S124','2024-12-01','11:40:52','2024-12-01','11:43:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-03-43-09','S124','2024-12-01','11:43:08','2024-12-01','11:51:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-03-50-57','S124','2024-12-01','11:50:55','2024-12-01','11:52:23','IT 319 Software Engineering 2','mish@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-03-52-04','S124','2024-12-01','11:52:03','2024-12-01','11:54:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-04-02-55','S124','2024-12-01','12:02:54','2024-12-01','12:05:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-04-03-53','S124','2024-12-01','12:03:52','2024-12-01','12:05:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-05-13-10','S124','2024-12-01','13:13:09','2024-12-01','13:18:23','ITIS 311 Fundamentals in Security Design','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-05-17-39','S124','2024-12-01','13:17:37','2024-12-01','13:19:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-06-37-19','S124','2024-12-01','14:37:17','2024-12-01','14:39:16','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-06-39-30','S124','2024-12-01','14:39:28','2024-12-01','14:41:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-06-40-38','S124','2024-12-01','14:40:36','2024-12-01','14:42:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-06-43-08','S124','2024-12-01','14:43:06','2024-12-01','14:44:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00151-2024-12-01-06-43-41','S124','2024-12-01','14:43:38','2024-12-01','14:45:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-06-59-55','S124','2024-12-01','14:59:52','2024-12-01','15:01:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-07-01-21','S124','2024-12-01','15:01:19','2024-12-01','15:02:23','IT 319 Software Engineering 2','debbie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-07-04-41','S124','2024-12-01','15:04:38','2024-12-01','15:06:23','ITIS 311 Fundamentals in Security Design','archie@usep.edu.ph','2022-00151',NULL),('S124-2022-00151-2024-12-01-07-06-07','S124','2024-12-01','15:06:05','2024-12-01','15:08:23',NULL,NULL,'2022-00151',NULL),('S124-2022-00294-2024-12-03-14-03-53','S124','2024-12-03','22:03:53','2024-12-03','22:08:23',NULL,NULL,'2022-00294',NULL),('S124-2022-00294-2024-12-03-14-07-25','S124','2024-12-03','22:07:25','2024-12-03','22:11:23',NULL,NULL,'2022-00294',NULL),('S124-2022-00294-2024-12-03-14-30-31','S124','2024-12-03','22:30:31','2024-12-03','22:32:23',NULL,NULL,'2022-00294',NULL),('S124-2022-00294-2024-12-03-14-31-17','S124','2024-12-03','22:31:17','2024-12-04','00:09:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00294',NULL),('S124-2022-00294-2024-12-04-11-06-09','S124','2024-12-04','19:06:09','2024-12-04','19:16:23','IT 227 Advanced Information Management','archie@usep.edu.ph','2022-00294',NULL),('S124-2022-00294-2024-12-04-19-15-24','S124','2024-12-04','19:15:24','2024-12-04','22:50:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00294',NULL),('S124-2022-00294-2024-12-08-12-23-34','S124','2024-12-08','12:23:34','2024-12-08','12:26:23','IT 319 Software Engineering 2','archie@usep.edu.ph','2022-00294',NULL),('S124-2022-00294-2024-12-08-12-26-48','S124','2024-12-08','12:26:48','2024-12-08','12:27:14','ITIS 311 Fundamentals in Security Design','archie@usep.edu.ph','2022-00294',NULL),('S124-2022-00294-2024-12-08-13-40-44','S124','2024-12-08','13:40:44','2024-12-08','13:41:29','IT 319 Software Engineering 2','karl','2022-00294',NULL),('S126-2022-00151-2024-12-01-05-20-28','S126','2024-12-01','13:20:28','2024-12-01','13:25:23',NULL,NULL,'2022-00151',NULL),('S126-2022-00509-2024-12-01-05-25-09','S126','2024-12-01','13:25:09','2024-12-01','13:27:23',NULL,NULL,'2022-00509',NULL);
/*!40000 ALTER TABLE `student_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_student_logs` BEFORE INSERT ON `student_logs` FOR EACH ROW BEGIN
    IF NEW.slog_date_in IS NULL THEN
        SET NEW.slog_date_in = CURDATE();
    END IF;
    IF NEW.slog_time_in IS NULL THEN
        SET NEW.slog_time_in = CURTIME();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `student_logs_purpose_view`
--

DROP TABLE IF EXISTS `student_logs_purpose_view`;
/*!50001 DROP VIEW IF EXISTS `student_logs_purpose_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_logs_purpose_view` AS SELECT 
 1 AS `log_date`,
 1 AS `Faculty`,
 1 AS `Purpose`,
 1 AS `LogCount`,
 1 AS `ComLab`,
 1 AS `Program`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student_user`
--

DROP TABLE IF EXISTS `student_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_user` (
  `user_id` varchar(15) NOT NULL,
  `user_fname` varchar(100) DEFAULT NULL,
  `user_mname` varchar(100) DEFAULT NULL,
  `user_lname` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_salt` varchar(255) DEFAULT NULL,
  `user_college` varchar(10) DEFAULT NULL,
  `user_program` varchar(10) DEFAULT NULL,
  `user_year_level` enum('1st Year','2nd Year','3rd Year','4th Year','5th Year','6th Year') DEFAULT NULL,
  `user_sem` enum('1st Semester','2nd Semester','Summer') DEFAULT NULL,
  `user_secured` tinyint DEFAULT '0',
  `user_status` tinyint DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `user_college` (`user_college`),
  KEY `user_program` (`user_program`),
  CONSTRAINT `student_user_ibfk_1` FOREIGN KEY (`user_college`) REFERENCES `colleges` (`college_id`),
  CONSTRAINT `student_user_ibfk_2` FOREIGN KEY (`user_program`) REFERENCES `program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_user`
--

LOCK TABLES `student_user` WRITE;
/*!40000 ALTER TABLE `student_user` DISABLE KEYS */;
INSERT INTO `student_user` VALUES ('2022-00138','Dave Angelo','','Labad','p1Z3koBh+oaBg+Vk0r+9rut30KnYJ5U0FEYqPcHJt7I=','ENwEqHY4U1Z200PJKOyigA==','TMC1','P5','3rd Year','1st Semester',0,1),('2022-00151','Debbie Michelle','Buragay','Gerodias','MqDmWIXJ1KMnYpQX4pP1Sa4dxZKxYOljKKb/oUiSjdU=','F0KCyYUDAhpDTrDGU3rCKg==','TMC1','P2','3rd Year','1st Semester',1,1),('2022-00294','Karl','Olaer','Cornejo','yr0g5V1c6iEjbh0JMXbSoa5t01Lki4xeL7YPir+i7BQ=','xnrZZ5D3yyemQWytos0SNQ==','TMC1','P1','3rd Year','1st Semester',1,1),('2022-00509','Vincent Kyle','Orpiano','Arsenio','qrbjz24NOW4rsZktcxeaMlbVeceZ+kuZluoqMlVpWCM=','19jj9qiqQRNRAa98jNLfDw==','TMC1','P5','3rd Year','1st Semester',0,1);
/*!40000 ALTER TABLE `student_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_user_view`
--

DROP TABLE IF EXISTS `student_user_view`;
/*!50001 DROP VIEW IF EXISTS `student_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_user_view` AS SELECT 
 1 AS `user_id`,
 1 AS `student_full_name`,
 1 AS `college_abrv`,
 1 AS `program_abrv`,
 1 AS `user_year_level`,
 1 AS `user_sem`,
 1 AS `user_secured`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'comlabdb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `auto_admin_log_out` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`comlab2024`@`%`*/ /*!50106 EVENT `auto_admin_log_out` ON SCHEDULE EVERY 1 SECOND STARTS '2024-12-08 08:15:33' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- Update `admin_user` where `track_update` is more than 1 minute old

    UPDATE admin_user

    SET admin_update = NULL,

        admin_online = 'Offline'

    WHERE admin_update IS NOT NULL

      AND admin_update < (NOW() - INTERVAL 1 MINUTE);

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `auto_faculty_log_out` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`comlab2024`@`%`*/ /*!50106 EVENT `auto_faculty_log_out` ON SCHEDULE EVERY 1 SECOND STARTS '2024-12-08 08:15:58' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- Update `admin_user` where `track_update` is more than 1 minute old

    UPDATE faculty

    SET faculty_update = NULL,

        faculty_online = 'Offline'

    WHERE faculty_update IS NOT NULL

      AND faculty_update < (NOW() - INTERVAL 1 MINUTE);

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `auto_student_log_out` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `auto_student_log_out` ON SCHEDULE EVERY 1 SECOND STARTS '2024-11-18 19:38:23' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- Update `pc_tracker` where `track_update` is more than 1 minute old

    UPDATE student_logs

    SET slog_date_out = NOW(),

        slog_time_out = NOW(),

        slog_update = NULL

    WHERE slog_update IS NOT NULL

      AND slog_update < (NOW() - INTERVAL 1 MINUTE);

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `pc_tracker_auto_nullify` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `pc_tracker_auto_nullify` ON SCHEDULE EVERY 1 SECOND STARTS '2024-11-15 11:13:30' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- Update `pc_tracker` where `track_update` is more than 1 minute old

    UPDATE pc_tracker

    SET track_power_status = NULL,

        track_user_id = NULL,

        track_update = NULL,

        track_action = NULL

    WHERE track_update IS NOT NULL

      AND track_update < (NOW() - INTERVAL 1 MINUTE);

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'comlabdb'
--
/*!50003 DROP FUNCTION IF EXISTS `CheckAccountLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CheckAccountLogin`(userID VARCHAR(100)) RETURNS tinyint
    DETERMINISTIC
BEGIN
    DECLARE accountExists TINYINT DEFAULT 0;
    
    -- Check if the UserID exists in the database
    SELECT COUNT(*) INTO accountExists
    FROM pc_tracker
    WHERE track_user_id = userID;
    
    -- Return 1 if exists, 0 if not
    RETURN IF(accountExists > 0, 1, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShutdownPC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShutdownPC`(IN equipment_number VARCHAR(100))
BEGIN
    -- Perform the update for the specific equipment number
    UPDATE pc_tracker
    SET track_action = 'Shutdown',
        track_power_status = 'Shutting Down'
    WHERE track_equipment_number = equipment_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `admin_logs_view`
--

/*!50001 DROP VIEW IF EXISTS `admin_logs_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_logs_view` AS select `admin_logs`.`alog_id` AS `LogId`,`admin_logs`.`alog_date` AS `Date`,`admin_logs`.`alog_time` AS `Time`,`admin_logs`.`alog_admin_email` AS `AdminEmail`,`admin_logs`.`alog_activity` AS `Activity`,concat(`admin_user`.`admin_fname`,' ',`admin_user`.`admin_lname`) AS `AdminName`,`admin_logs`.`alog_admin_type` AS `Role` from (`admin_logs` join `admin_user` on((`admin_logs`.`alog_admin_email` = `admin_user`.`admin_email`))) order by `admin_logs`.`alog_date` desc,`admin_logs`.`alog_time` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `admin_user_view`
--

/*!50001 DROP VIEW IF EXISTS `admin_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_user_view` AS select `admin_user`.`admin_email` AS `admin_email`,concat(`admin_user`.`admin_fname`,' ',ifnull(`admin_user`.`admin_mname`,''),' ',`admin_user`.`admin_lname`) AS `admin_full_name`,`admin_user`.`admin_type` AS `admin_type`,`admin_user`.`admin_secured` AS `admin_secured` from `admin_user` where (`admin_user`.`admin_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `combined_logs_view`
--

/*!50001 DROP VIEW IF EXISTS `combined_logs_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combined_logs_view` AS select `combined`.`LogId` AS `LogId`,`combined`.`Date` AS `Date`,`combined`.`Time` AS `Time`,`combined`.`AdminEmail` AS `AdminEmail`,`combined`.`Activity` AS `Activity`,`combined`.`AdminName` AS `AdminName`,`combined`.`Role` AS `Role` from (select `admin_logs_view`.`LogId` AS `LogId`,`admin_logs_view`.`Date` AS `Date`,`admin_logs_view`.`Time` AS `Time`,`admin_logs_view`.`AdminEmail` AS `AdminEmail`,`admin_logs_view`.`Activity` AS `Activity`,`admin_logs_view`.`AdminName` AS `AdminName`,`admin_logs_view`.`Role` AS `Role` from `admin_logs_view` union all select `faculty_logs_view`.`LogId` AS `LogId`,`faculty_logs_view`.`Date` AS `Date`,`faculty_logs_view`.`Time` AS `Time`,`faculty_logs_view`.`AdminEmail` AS `AdminEmail`,`faculty_logs_view`.`Activity` AS `Activity`,`faculty_logs_view`.`AdminName` AS `AdminName`,`faculty_logs_view`.`Role` AS `Role` from `faculty_logs_view`) `combined` order by `combined`.`Date` desc,`combined`.`Time` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `faculty_logs_view`
--

/*!50001 DROP VIEW IF EXISTS `faculty_logs_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `faculty_logs_view` AS select `admin_logs`.`alog_id` AS `LogId`,`admin_logs`.`alog_date` AS `Date`,`admin_logs`.`alog_time` AS `Time`,`admin_logs`.`alog_admin_email` AS `AdminEmail`,`admin_logs`.`alog_activity` AS `Activity`,concat(`faculty`.`faculty_fname`,' ',`faculty`.`faculty_lname`) AS `AdminName`,`admin_logs`.`alog_admin_type` AS `Role` from (`admin_logs` join `faculty` on((`admin_logs`.`alog_admin_email` = `faculty`.`faculty_email`))) where (`admin_logs`.`alog_admin_type` = 'Faculty') order by `admin_logs`.`alog_date` desc,`admin_logs`.`alog_time` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `faculty_view`
--

/*!50001 DROP VIEW IF EXISTS `faculty_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `faculty_view` AS select `faculty`.`faculty_email` AS `faculty_email`,concat(`faculty`.`faculty_fname`,' ',ifnull(`faculty`.`faculty_mname`,''),' ',`faculty`.`faculty_lname`) AS `faculty_full_name`,`colleges`.`college_abrv` AS `college_abrv`,`program`.`program_abrv` AS `program_abrv`,`faculty`.`faculty_secured` AS `faculty_secured` from ((`faculty` join `colleges` on((`faculty`.`faculty_college` = `colleges`.`college_id`))) join `program` on((`faculty`.`faculty_program` = `program`.`program_id`))) where (`faculty`.`faculty_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_logs_purpose_view`
--

/*!50001 DROP VIEW IF EXISTS `student_logs_purpose_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_logs_purpose_view` AS select `student_logs`.`slog_date_in` AS `log_date`,`student_logs`.`slog_faculty` AS `Faculty`,`student_logs`.`slog_purpose` AS `Purpose`,count(0) AS `LogCount`,`cl_inventory`.`equipment_area` AS `ComLab`,`student_user`.`user_program` AS `Program` from ((`student_logs` left join `cl_inventory` on((`student_logs`.`slog_equipment_number` = `cl_inventory`.`equipment_number`))) left join `student_user` on((`student_logs`.`slog_user_id` = `student_user`.`user_id`))) where ((`student_logs`.`slog_faculty` is not null) and (`student_logs`.`slog_purpose` is not null)) group by `student_logs`.`slog_date_in`,`student_logs`.`slog_faculty`,`student_logs`.`slog_purpose`,`cl_inventory`.`equipment_area`,`student_user`.`user_program` order by `student_logs`.`slog_date_in` desc,`student_logs`.`slog_faculty`,`student_logs`.`slog_purpose` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_user_view`
--

/*!50001 DROP VIEW IF EXISTS `student_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_user_view` AS select `student_user`.`user_id` AS `user_id`,concat(`student_user`.`user_fname`,' ',ifnull(`student_user`.`user_mname`,''),' ',`student_user`.`user_lname`) AS `student_full_name`,`colleges`.`college_abrv` AS `college_abrv`,`program`.`program_abrv` AS `program_abrv`,`student_user`.`user_year_level` AS `user_year_level`,`student_user`.`user_sem` AS `user_sem`,`student_user`.`user_secured` AS `user_secured` from ((`student_user` join `colleges` on((`student_user`.`user_college` = `colleges`.`college_id`))) join `program` on((`student_user`.`user_program` = `program`.`program_id`))) where (`student_user`.`user_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 18:52:22
