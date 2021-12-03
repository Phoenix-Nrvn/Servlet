-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_database10
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Current Database: `db_database10`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_database10` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_database10`;

--
-- Table structure for table `db_account`
--

DROP TABLE IF EXISTS `db_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_account` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `susername` varchar(25) DEFAULT NULL,
  `spassword` varchar(25) DEFAULT '',
  `usertype` varchar(25) DEFAULT '',
  `name` varchar(25) DEFAULT '',
  `dept` varchar(25) DEFAULT '',
  `tel` varchar(25) DEFAULT '',
  `email` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_account`
--

LOCK TABLES `db_account` WRITE;
/*!40000 ALTER TABLE `db_account` DISABLE KEYS */;
INSERT INTO `db_account` VALUES (0000000001,'admin1234','12345678','0','管理员1','xaut','13625252525','sasa@qq.com'),(0000000002,'zhangsan','12345678','1','张三','xaut','13625252525','sasa@qq.com'),(0000000003,'teacher1','12345678','2','张桑','西安理工大学','13411112211','haozi2638@163.com'),(0000000004,'admin1234','12345678','1','张桑','西安理工大学','13411112211','haozi2638@163.com'),(0000000009,'saner','123456789','1','张三四','xaut','13245678912','123456@163.com'),(0000000010,'123456789','123456789','1','张张','xaut','13265498711','132654987@qq.com');
/*!40000 ALTER TABLE `db_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_account`
--

DROP TABLE IF EXISTS `tb_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_account` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `susername` varchar(25) DEFAULT '',
  `spassword` varchar(25) DEFAULT '',
  `name` varchar(25) DEFAULT '',
  `usertype` varchar(10) DEFAULT '',
  `tel` varchar(25) DEFAULT '',
  `email` varchar(25) DEFAULT '',
  `apart` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account`
--

LOCK TABLES `tb_account` WRITE;
/*!40000 ALTER TABLE `tb_account` DISABLE KEYS */;
INSERT INTO `tb_account` VALUES (0000000001,'admin','123456','管理员1','0','13625252525','haozi2638@163.com','xaut'),(0000000002,'三儿','123456','张三','1','13089561238','57892156.stu.edu','计算机学院'),(0000000003,'四儿','123456','李四','1','13089264568','57891236.stu.edu','水利学院'),(0000000004,'五儿','123456','王五','2','13082341238','57892756.stu.edu','机械学院'),(0000000005,'3190911','123456','三七','1','13223455699','123456@163.com','xxxx'),(0000000013,'Chrome','987123654','十二','2','13265478911','shier@163.com','Computer');
/*!40000 ALTER TABLE `tb_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_books`
--

DROP TABLE IF EXISTS `tb_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_books` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `bookCount` int unsigned NOT NULL,
  `author` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books`
--

LOCK TABLES `tb_books` WRITE;
/*!40000 ALTER TABLE `tb_books` DISABLE KEYS */;
INSERT INTO `tb_books` VALUES (6,'JavaWeb从入门到精通',57,1240,'明日科技'),(7,'Java从入门到精通',59,234,'明日科技'),(8,'学通JavaWeb的24堂课',69,120,'明日科技');
/*!40000 ALTER TABLE `tb_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `num` int unsigned NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'西红柿',22.8,30,'箱'),(2,'柚子',55.5,100,'箱'),(3,'梨',15.8,55,'箱'),(4,'橘子',40.5,80,'箱'),(5,'苹果',60,100,'箱'),(6,'APPLE',3,100,'个');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `newpro` AFTER INSERT ON `tb_product` FOR EACH ROW SELECT 'Product added' INTO @asd */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_student_batch`
--

DROP TABLE IF EXISTS `tb_student_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_student_batch` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sex` tinyint unsigned NOT NULL,
  `age` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student_batch`
--

LOCK TABLES `tb_student_batch` WRITE;
/*!40000 ALTER TABLE `tb_student_batch` DISABLE KEYS */;
INSERT INTO `tb_student_batch` VALUES (1,'??0',1,10),(2,'??1',0,14),(3,'??2',1,14),(4,'??3',0,13),(5,'??4',1,14),(6,'??5',0,11),(7,'??6',1,14),(8,'??7',0,10),(9,'??8',1,10),(10,'??9',0,12);
/*!40000 ALTER TABLE `tb_student_batch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 17:51:11
