-- MySQL dump 10.13  Distrib 5.1.44, for apple-darwin8.11.1 (i386)
--
-- Host: localhost    Database: paperbook
-- ------------------------------------------------------
-- Server version	5.1.44

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
-- Table structure for table `brief_comments`
--

DROP TABLE IF EXISTS `brief_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brief_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(800) DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `iiterature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BriefComment_User1_idx` (`user_id`),
  KEY `fk_BriefComment_Literature1_idx` (`iiterature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brief_comments`
--

LOCK TABLES `brief_comments` WRITE;
/*!40000 ALTER TABLE `brief_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `brief_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_config`
--

DROP TABLE IF EXISTS `global_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `literature_type` varchar(500) DEFAULT NULL,
  `book` varchar(500) DEFAULT NULL,
  `book_section` varchar(500) DEFAULT NULL,
  `journal` varchar(500) DEFAULT NULL,
  `conference` varchar(500) DEFAULT NULL,
  `thesis` varchar(500) DEFAULT NULL,
  `report` varchar(500) DEFAULT NULL,
  `online` varchar(500) DEFAULT NULL,
  `rich_comment` varchar(500) DEFAULT NULL,
  `reference_type` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_config`
--

LOCK TABLES `global_config` WRITE;
/*!40000 ALTER TABLE `global_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `literatures`
--

DROP TABLE IF EXISTS `literatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `literatures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `authors` varchar(120) DEFAULT NULL,
  `year` int(5) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `abstract` text,
  `tags` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `publisher` varchar(80) DEFAULT NULL,
  `editors` varchar(100) DEFAULT NULL,
  `edition` varchar(40) DEFAULT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publication` varchar(100) DEFAULT NULL,
  `volumn` int(11) DEFAULT NULL,
  `issue` int(11) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `doi` varchar(40) DEFAULT NULL,
  `college` varchar(40) DEFAULT NULL,
  `references` text,
  `cited` text,
  `file_path` varchar(100) DEFAULT NULL,
  `accessories` varchar(1000) DEFAULT NULL,
  `score_avg` double DEFAULT NULL,
  `score_count` int(11) unsigned DEFAULT NULL,
  `add_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Literature_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `literatures`
--

LOCK TABLES `literatures` WRITE;
/*!40000 ALTER TABLE `literatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `literatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_daily`
--

DROP TABLE IF EXISTS `log_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `log_at` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogDaily_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_daily`
--

LOCK TABLES `log_daily` WRITE;
/*!40000 ALTER TABLE `log_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_global`
--

DROP TABLE IF EXISTS `log_global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_global` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comments` int(11) unsigned DEFAULT NULL,
  `count_rich_comments` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogGlobal_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_global`
--

LOCK TABLES `log_global` WRITE;
/*!40000 ALTER TABLE `log_global` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_month`
--

DROP TABLE IF EXISTS `log_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogMonth_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_month`
--

LOCK TABLES `log_month` WRITE;
/*!40000 ALTER TABLE `log_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_year`
--

DROP TABLE IF EXISTS `log_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_year` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `count_literature` int(11) unsigned DEFAULT NULL,
  `count_accessories` int(11) unsigned DEFAULT NULL,
  `count_simple_comment` int(11) unsigned DEFAULT NULL,
  `count_rich_comment` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LogYear_User1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_year`
--

LOCK TABLES `log_year` WRITE;
/*!40000 ALTER TABLE `log_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rich_comments`
--

DROP TABLE IF EXISTS `rich_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rich_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `problem` text,
  `idea` text,
  `experiment` text,
  `contribution` text,
  `improvement` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `literature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RichComment_User1_idx` (`user_id`),
  KEY `fk_RichComment_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_comments`
--

LOCK TABLES `rich_comments` WRITE;
/*!40000 ALTER TABLE `rich_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `rich_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` decimal(3,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `literature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ScoreList_User1_idx` (`user_id`),
  KEY `fk_Score_Literature1_idx` (`literature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT '0',
  `sign_up_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2013-12-14 21:33:56
