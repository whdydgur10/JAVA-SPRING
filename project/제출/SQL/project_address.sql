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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `num` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `code` varchar(5) NOT NULL,
  `address` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `isMain` varchar(1) NOT NULL DEFAULT 'N',
  `isTemp` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`num`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (6,'root','13529','경기 성남시 분당구 분당내곡로 117','(백현동)101동','Y','N'),(7,'root','06035','서울 강남구 가로수길 5','(신사동)1105번지','N','N'),(13,'root','02725','서울 성북구 삼양로 11-8',' (길음동)1','N','Y'),(14,'aaa','06267','서울 강남구 강남대로 238',' (도곡동)','N','Y'),(15,'aaa','01214','서울 강북구 삼양로 90',' (미아동)103호','N','Y'),(16,'aaa','06035','서울 강남구 가로수길 5',' (신사동)1','N','Y'),(17,'aaa','06035','서울 강남구 가로수길 5',' (신사동)','N','Y'),(18,'aaa','06307','서울 강남구 개포로 202',' (개포동)','N','Y'),(19,'aaa','08654','서울 금천구 삼성산길 3',' (시흥동)','N','Y'),(20,'aaa','01019','서울 강북구 삼각산로 1',' (수유동)','N','Y'),(21,'aaa','46044','부산 기장군 일광면 삼성2길 3','1','N','Y'),(22,'aaa','02860','서울 성북구 삼선교로 지하 1',' (삼선동1가)','N','Y'),(23,'aaa','01019','서울 강북구 삼각산로 1',' (수유동)','N','Y'),(24,'aaa','47738','부산 동래구 명륜동 450-3','','N','Y'),(25,'aaa','46044','부산 기장군 일광면 삼성2길 3','1','N','Y'),(26,'aaa','46044','부산 기장군 일광면 삼성길 2','11','N','Y'),(27,'aaa','46044','부산 기장군 일광면 삼성리 36-2','1','N','Y'),(28,'aaa','28802','충북 청주시 서원구 궁뜰로33번길 135',' (분평동)1','N','Y'),(29,'aaa','50363','경남 창녕군 길곡면 상길 1','','N','Y'),(30,'aaa','28456','충북 청주시 흥덕구 신봉동 28-2','1','N','Y'),(31,'aaa','47738','부산 동래구 삼성대길 7',' (명륜동)1','Y','N');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
