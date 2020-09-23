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
-- Table structure for table `contentsizetext`
--

DROP TABLE IF EXISTS `contentsizetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentsizetext` (
  `contentSizeTextNum` int NOT NULL AUTO_INCREMENT,
  `contentSizeText` longtext NOT NULL,
  `enrollmentNum` int NOT NULL,
  PRIMARY KEY (`contentSizeTextNum`),
  KEY `enrollmentNum_idx` (`enrollmentNum`),
  CONSTRAINT `enrollmentNum` FOREIGN KEY (`enrollmentNum`) REFERENCES `productenrollment` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentsizetext`
--

LOCK TABLES `contentsizetext` WRITE;
/*!40000 ALTER TABLE `contentsizetext` DISABLE KEYS */;
INSERT INTO `contentsizetext` VALUES (2,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',8),(3,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',1),(4,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',9),(6,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r - 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r - 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.\r ',10),(7,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',11),(11,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',12),(12,'- 사이즈는 재는 방법에 따라 1~2 cm 정도 오차가 생길 수 있습니다.\r\n- 사이즈 교환,반품은 배송비가 발생되오니 꼭 상세사이즈 확인후에\r\n- 실제 입고 있는 옷을 측정 후 비교하여 구매하시면 실수없는 구매를 하실 수 있답니다.',13);
/*!40000 ALTER TABLE `contentsizetext` ENABLE KEYS */;
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
