CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryNum` int NOT NULL AUTO_INCREMENT,
  `mainCategory` varchar(2) DEFAULT NULL,
  `middleCategory` varchar(255) DEFAULT NULL,
  `subCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryNum`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'M','아우터','코트'),(2,'M','아우터','점퍼'),(3,'M','아우터','자켓'),(4,'M','아우터','패딩'),(5,'M','아우터','다운'),(6,'M','아우터','무스탕'),(7,'M','아우터','블루종'),(8,'M','아우터','항공점퍼'),(9,'M','아우터','가디건'),(10,'M','상의','반팔티'),(11,'M','상의','긴팔티'),(12,'M','상의','셔츠/남방'),(13,'M','상의','맨투맨'),(14,'M','상의','후드티/아노락'),(15,'M','상의','후드집업'),(16,'M','상의','니트/스웨터'),(17,'M','상의','민소매/나시'),(18,'M','상의','트레이닝복'),(19,'M','하의','반바지'),(20,'M','하의','청바지'),(21,'M','하의','슬랙스'),(22,'M','하의','면바지'),(23,'M','하의','트레이닝복'),(24,'M','신발','슬립온'),(25,'M','신발','스니커즈'),(26,'M','신발','운동화'),(27,'M','신발','워커'),(28,'M','신발','부츠'),(29,'M','신발','로퍼'),(30,'M','신발','보트화'),(31,'M','신발','구두'),(32,'M','신발','슬리퍼'),(33,'M','신발','샌들'),(34,'M','etc','가방'),(35,'M','etc','시계'),(36,'M','etc','지갑'),(37,'M','etc','벨트'),(38,'M','etc','장갑'),(39,'M','etc','양말'),(40,'M','etc','모자'),(41,'M','etc','목도리'),(42,'M','etc','안경'),(43,'M','etc','머플러'),(44,'W','아우터','코트'),(45,'W','아우터','점퍼'),(46,'W','아우터','자켓'),(47,'W','아우터','패딩'),(48,'W','아우터','가디건'),(49,'W','원피스','미니원피스'),(50,'W','원피스','롱원피스'),(53,'W','상의','반팔티'),(54,'W','상의','긴팔티'),(55,'W','상의','블라우스'),(56,'W','상의','셔츠/남방'),(57,'W','상의','맨투맨'),(58,'W','상의','후디트/아노락'),(59,'W','상의','후드집업'),(60,'W','상의','니트/스웨터'),(61,'W','상의','민소매/나시'),(62,'W','상의','트레이닝복'),(63,'W','하의','반바지'),(64,'W','하의','청바지'),(65,'W','하의','슬랙스'),(66,'W','하의','와이드팬츠'),(67,'W','하의','면바지'),(68,'W','하의','트레이닝복'),(69,'W','스커트','미니스커트'),(70,'W','스커트','미디스커트'),(71,'W','스커트','롱스커트'),(72,'W','신발','단화'),(73,'W','신발','스니커즈'),(74,'W','신발','부츠'),(75,'W','신발','힐'),(76,'W','신발','구두'),(77,'W','신발','샌들'),(78,'W','etc','가방'),(79,'W','etc','시계'),(80,'W','etc','지갑'),(81,'W','etc','벨트'),(82,'W','etc','장갑'),(83,'W','etc','양말'),(84,'W','etc','모자'),(85,'W','etc','목도리'),(86,'W','etc','안경'),(87,'W','etc','머플러'),(88,'W','etc','귀걸이'),(89,'W','etc','목걸이'),(90,'W','etc','헤어'),(91,'W','etc','반지'),(92,'W','etc','초커'),(93,'W','etc','팔찌'),(94,'W','etc','발찌'),(95,'W','etc','파우치'),(96,'W','etc','클러치'),(97,'W','etc','스타킹'),(98,'W','etc','타이즈'),(99,'MW','아우터','코트'),(100,'MW','아우터','점퍼'),(101,'MW','아우터','자켓'),(102,'MW','아우터','패딩'),(103,'MW','아우터','가디건'),(104,'MW','상의','반팔티'),(105,'MW','상의','긴팔티'),(106,'MW','상의','셔츠/남방'),(107,'MW','상의','맨투맨'),(108,'MW','상의','후드티/아노락'),(109,'MW','상의','후드집업'),(110,'MW','상의','니트/스웨터'),(111,'MW','상의','민소매/나시'),(112,'MW','상의','트레이닝복'),(113,'MW','하의','반바지'),(114,'MW','하의','청바지'),(115,'MW','하의','슬랙스'),(116,'MW','하의','면바지'),(117,'MW','하의','트레이닝복'),(118,'MW','신발','스니커즈'),(119,'MW','신발','부츠'),(120,'MW','신발','구두'),(121,'MW','신발','샌들'),(122,'MW','etc','가방'),(123,'MW','etc','시계'),(124,'MW','etc','지갑'),(125,'MW','etc','벨트'),(126,'MW','etc','장갑'),(127,'MW','etc','양말'),(128,'MW','etc','모자'),(129,'MW','etc','목도리'),(130,'MW','etc','안경'),(131,'MW','etc','머플러'),(132,'MW','etc','가방'),(133,'MW','etc','시계'),(134,'MW','etc','지갑'),(135,'MW','etc','벨트'),(136,'MW','etc','장갑'),(137,'MW','etc','양말'),(138,'MW','etc','모자'),(139,'MW','etc','목도리'),(140,'MW','etc','안경'),(141,'MW','etc','머플러');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:11
