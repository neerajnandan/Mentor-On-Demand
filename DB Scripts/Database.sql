-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mentor_on_demand
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mentor`
--

DROP TABLE IF EXISTS `mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor` (
  `mentor_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `mentor_linkedin_url` varchar(100) NOT NULL,
  `mentor_years_of_experience` float(2,1) NOT NULL,
  `mentor_timeslot` varchar(11) NOT NULL,
  `mentor_user_id` bigint(10) NOT NULL,
  PRIMARY KEY (`mentor_id`),
  UNIQUE KEY `mentor_linkedin_url_UNIQUE` (`mentor_linkedin_url`),
  KEY `user_idx` (`mentor_user_id`),
  CONSTRAINT `user` FOREIGN KEY (`mentor_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor`
--

LOCK TABLES `mentor` WRITE;
/*!40000 ALTER TABLE `mentor` DISABLE KEYS */;
INSERT INTO `mentor` VALUES (25,'ramkrishna',8.0,'09:00-11:00',102),(26,'satyam',7.0,'11:00-13:00',103),(27,'sunantha',4.0,'13:00-15:00',104),(28,'jasmine',6.0,'15:00-17:00',105),(29,'sheela',9.0,'17:00-19:00',106),(30,'aziz',5.0,'19:00-21:00',107),(31,'joseph111',3.0,'11:00-13:00',111),(32,'anu11',3.0,'13:00-15:00',112),(33,'Priya222',3.0,'11:00-13:00',113),(34,'aNNE2322',4.0,'13:00-15:00',114);
/*!40000 ALTER TABLE `mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_skill`
--

DROP TABLE IF EXISTS `mentor_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_skill` (
  `ms_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `ms_mentor_id` bigint(11) NOT NULL,
  `ms_skill_id` bigint(11) NOT NULL,
  `ms_self_rating` float(2,1) NOT NULL,
  `ms_years_of_experience` float(2,1) NOT NULL,
  PRIMARY KEY (`ms_id`),
  KEY `Mentor_idx` (`ms_mentor_id`),
  KEY `Skill_idx` (`ms_skill_id`),
  CONSTRAINT `Mentor` FOREIGN KEY (`ms_mentor_id`) REFERENCES `mentor` (`mentor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Skill` FOREIGN KEY (`ms_skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_skill`
--

LOCK TABLES `mentor_skill` WRITE;
/*!40000 ALTER TABLE `mentor_skill` DISABLE KEYS */;
INSERT INTO `mentor_skill` VALUES (9,25,1,9.0,8.0),(10,26,2,6.0,5.0),(11,27,3,8.0,2.0),(12,28,4,8.0,3.0),(13,29,6,9.0,8.0),(14,30,7,5.0,2.0),(15,30,1,8.0,1.0),(16,31,4,5.0,4.0),(17,34,8,8.0,4.0);
/*!40000 ALTER TABLE `mentor_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `skill_id` bigint(11) NOT NULL,
  `skill_name` varchar(45) NOT NULL,
  `skill_toc` varchar(45) DEFAULT NULL,
  `skill_prerequisite` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `prerequisite_idx` (`skill_prerequisite`),
  CONSTRAINT `prerequisite` FOREIGN KEY (`skill_prerequisite`) REFERENCES `skill` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'html','notepad++',NULL),(2,'css','notepad++',1),(3,'bootstrap','notepad++',2),(4,'java','eclipse',NULL),(5,'advance-java','eclipse',4),(6,'spring','eclipse',5),(7,'typescript','angular',NULL),(8,'javascript','notepad++',4);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `training_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `training_user_id` bigint(10) NOT NULL,
  `training_mentor_id` bigint(10) NOT NULL,
  `training_skill_id` bigint(10) NOT NULL,
  `training_status` varchar(20) NOT NULL,
  `training_progress` int(11) NOT NULL,
  `training_rating` float(2,1) DEFAULT NULL,
  `training_start_date` date NOT NULL,
  `training_end_date` date NOT NULL,
  PRIMARY KEY (`training_id`),
  UNIQUE KEY `training_id_UNIQUE` (`training_id`),
  KEY `Mentor_Training_idx` (`training_mentor_id`),
  KEY `Skill_Training_idx` (`training_skill_id`),
  KEY `User_Training_idx` (`training_user_id`),
  CONSTRAINT `Mentor_Training` FOREIGN KEY (`training_mentor_id`) REFERENCES `mentor` (`mentor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Skill_Training` FOREIGN KEY (`training_skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_Training` FOREIGN KEY (`training_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (2,108,30,1,'Accepted',0,0.0,'2019-12-12','2019-12-14');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(75) NOT NULL,
  `user_first_name` varchar(45) NOT NULL,
  `user_last_name` varchar(45) NOT NULL,
  `user_contact_number` varchar(10) NOT NULL,
  `user_role` varchar(6) NOT NULL,
  `user_reset_password` tinyint(1) NOT NULL DEFAULT '0',
  `user_reset_password_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (101,'neerajnandan@cognizant.com','$2a$10$ICz.U631Dr7fl.Ux0wc4d.8EyL72aRIZHRz2U.bBlwWNAQ57CrlYW','Neeraj','Nandan','7845965874','ROLE_U',0,NULL),(102,'ramkrishna@cognizant.com','$2a$10$ti45KHYC70C8hcO0PZxg2.vmqx9SgncS6odHjQqAH8S6nlOpT2uh.','Ramkrishna','Sri','7847789564','ROLE_M',0,NULL),(103,'satyam@cognizant.com','$2a$10$Tmd1scx8oueSNLXGeDBlsexIpf0b6120zEXBPE7tbng/ym8lj3Sr.','Satyam','Doneti','1245789632','ROLE_M',0,NULL),(104,'sunantha@cognizant.com','$2a$10$pbnxzvzCA1k84jH5aaAVg.eta1Zi647DLmOknbBkkW2KPNP0pdTdO','Sunantha','Kakkara','7478547852','ROLE_M',0,NULL),(105,'jasmine@cognizant.com','$2a$10$K58lPo9m4fWdDQQErw3.s.NjMfjKbJliiUIhT46JVsMBR0na8rsmq','Jasmine','Bhaskar','4525685214','ROLE_M',0,NULL),(106,'sheela@cognizant.com','$2a$10$BildvkM80B92cSvTYVz6oegabBzP/qOU7x9h8KvrRabJajjtncgp6','Sheela','Madam','4585696325','ROLE_M',0,NULL),(107,'aziz@cognizant.com','$2a$10$dfnMn9N5DRVz46oFems8f.6uKiSHugjHSq3qKI/b.jkuUPJ4yYmnO','Aziz','Khan','4585792541','ROLE_M',0,NULL),(108,'jomol@cognizant.com','$2a$10$ha226zr5TtqdVJjrT1g9Mu1HLF9./rPPKLR3IsyqOz/u6XR9y.cE6','Jomol','Geo','4521452145','ROLE_U',0,NULL),(109,'shubham@cognizant.com','$2a$10$Dy4djFNzplmPc7S1C6geeuTXck4UXfIQdU1g9/xitHqKdRdnpOmwK','Shubham','Yadav','4521466369','ROLE_U',0,NULL),(110,'joseph@cognizant.com','$2a$10$x.PLf4nBk65yuto22bso0etyRtu0XYoUvj2ZheV5TPH1anAtOztvK','Joseph','VVVVVV','4578547236','ROLE_M',0,NULL),(111,'joseph1@cognizant.com','$2a$10$vHTfOxyok.RX4hqvwnCNLO7zz1A/M0.inH8KbN3no9EzeoPEMkLXO','Joseph','VVVVVV','4545454545','ROLE_M',0,NULL),(112,'anu@cognizant.com','$2a$10$DR1PSeO7CO5SJWlhFlmPne4y2f4050ENUted4goAS.rWGmZZUWvW6','Anu','Joseph','7774747474','ROLE_M',0,NULL),(113,'priya@cognizant.com','$2a$10$As4/9etK//DC13AWCoMxPe.sLpLtYFUEr1VGpmmASLw901SlZPAx6','Priya','ssss','4444444444','ROLE_M',0,NULL),(114,'anne@cognizant.com','$2a$10$FMxOj7ddFVj3tRpQDtdFlOJ/RGypij7D.ohxDheNCzKmoeH9/77Q6','Anne','George','9546152512','ROLE_M',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-11 15:25:13
