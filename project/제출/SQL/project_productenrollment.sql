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
-- Table structure for table `productenrollment`
--

DROP TABLE IF EXISTS `productenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productenrollment` (
  `num` int NOT NULL AUTO_INCREMENT,
  `mainTitle` varchar(255) DEFAULT NULL,
  `adNum` int DEFAULT NULL,
  `productCode` varchar(255) NOT NULL,
  `discount` int NOT NULL DEFAULT '0',
  `subTitle` varchar(255) DEFAULT NULL,
  `categoryNum` int NOT NULL,
  `finalPrice` int NOT NULL DEFAULT '0',
  `discountPercent` int NOT NULL DEFAULT '0',
  `isDel` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`num`),
  KEY `productCode_idx` (`productCode`),
  KEY `categoryNum_idx` (`categoryNum`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productenrollment`
--

LOCK TABLES `productenrollment` WRITE;
/*!40000 ALTER TABLE `productenrollment` DISABLE KEYS */;
INSERT INTO `productenrollment` VALUES (1,'테스트를 다시 해보겠어요.',NULL,'15754',1000,'테스트라구요',53,13000,7,'N'),(8,'테스트라구요',NULL,'DVWQEQ',2000,'xvxv',62,12000,14,'N'),(9,'어디에나 어울리는 반팔티',NULL,'TQDFSECS',0,'무지 반팔티',10,13000,0,'N'),(10,'쫀쫀하니 기능성 라운드 반팔티',NULL,'TDGBCSQW',1000,'국민 라운드 반팔티',10,9900,9,'N'),(11,'스프링 썸머 컬렉션 반팔티',NULL,'DTGDWDS',2000,'엔 더블 반팔티',10,15800,11,'N'),(12,'7부 스트라이프 반팔티',NULL,'DHNSCV',0,'7부 스트라이프 반팔티',10,18800,0,'N'),(13,'디테일코튼트렌치',NULL,'BVXQWAZ',0,'디테일코튼트렌치',99,35000,0,'N'),(14,NULL,NULL,'DFBWEQR',0,NULL,118,13000,0,'N');
/*!40000 ALTER TABLE `productenrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 14:33:12
