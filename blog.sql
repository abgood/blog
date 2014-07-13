-- MySQL dump 10.13  Distrib 5.6.17, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'技术','tech','技术分类');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `status` enum('pending','approved','spam') NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(140) NOT NULL,
  `email` varchar(140) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_extend`
--

DROP TABLE IF EXISTS `blog_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_extend` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` enum('post','page') NOT NULL,
  `field` enum('text','html','image','file') NOT NULL,
  `key` varchar(160) NOT NULL,
  `label` varchar(160) NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_extend`
--

LOCK TABLES `blog_extend` WRITE;
/*!40000 ALTER TABLE `blog_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_meta`
--

DROP TABLE IF EXISTS `blog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_meta` (
  `key` varchar(140) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_meta`
--

LOCK TABLES `blog_meta` WRITE;
/*!40000 ALTER TABLE `blog_meta` DISABLE KEYS */;
INSERT INTO `blog_meta` VALUES ('auto_published_comments','0'),('comment_moderation_keys',''),('comment_notifications','0'),('current_migration','140'),('date_format','jS M, Y'),('description','Just do it'),('home_page','1'),('last_update_check','2014-07-12 19:31:26'),('posts_page','1'),('posts_per_page','6'),('sitename','jun爷的窝'),('theme','default'),('update_version','0.9.2');
/*!40000 ALTER TABLE `blog_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_page_meta`
--

DROP TABLE IF EXISTS `blog_page_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_page_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `page` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_page_meta`
--

LOCK TABLES `blog_page_meta` WRITE;
/*!40000 ALTER TABLE `blog_page_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_page_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_pages`
--

DROP TABLE IF EXISTS `blog_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_pages` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `parent` int(6) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `redirect` text NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL,
  `menu_order` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_pages`
--

LOCK TABLES `blog_pages` WRITE;
/*!40000 ALTER TABLE `blog_pages` DISABLE KEYS */;
INSERT INTO `blog_pages` VALUES (1,0,'posts','Posts','My posts and thoughts','Welcome!','published','',1,0),(2,0,'about','About me','我的个人信息','欢迎访问，本人github链接:[https://github.com/abgood](https://github.com/abgood)','published','',1,0);
/*!40000 ALTER TABLE `blog_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_meta`
--

DROP TABLE IF EXISTS `blog_post_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_meta`
--

LOCK TABLES `blog_post_meta` WRITE;
/*!40000 ALTER TABLE `blog_post_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_posts` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `html` text NOT NULL,
  `css` text NOT NULL,
  `js` text NOT NULL,
  `created` datetime NOT NULL,
  `author` int(6) NOT NULL,
  `category` int(6) NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `comments` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES (3,'Hello World','hello-world','This is the first post.','Hello World!\r\n\r\nThis is the first post.','','','2014-07-11 22:00:00',1,1,'published',1),(4,'博客新家','create','中文博客','博客落户了，国外不需要备案，国内需要备案，用的是海外的vps，速度不错','','','2014-07-13 03:14:03',1,1,'published',0);
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_sessions`
--

DROP TABLE IF EXISTS `blog_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_sessions` (
  `id` char(32) NOT NULL,
  `expire` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_sessions`
--

LOCK TABLES `blog_sessions` WRITE;
/*!40000 ALTER TABLE `blog_sessions` DISABLE KEYS */;
INSERT INTO `blog_sessions` VALUES ('0lZc6h41TN7iHtI82xnyI9uvEez5R4JU',1405307673,'a:9:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}s:4:\"test\";s:4:\"test\";s:1:\"a\";s:1:\"a\";s:11:\"csrf_tokens\";a:9:{i:0;s:32:\"15dbad1c202c1f70aa7702951764c877\";i:1;s:32:\"3b4ef7e635372db7a3e3efab4bb9bbde\";i:2;s:32:\"2a8fed5825cb30633d621136cb19ef28\";i:3;s:32:\"0192c9934488a24f9f6fd4872b5d0fc2\";i:4;s:32:\"612c666df8e988799c837b4d39adc76c\";i:6;s:32:\"d2b8b0797d32f7ad7c8aa4d08b60cb06\";i:7;s:32:\"f4f8079b5a5dc3534b69b9368b4c622c\";i:8;s:32:\"a051ec71ad22948fb88256bd8ae48b9a\";i:9;s:32:\"cc955d67039c9945fc0604d2e3f3a795\";}s:4:\"auth\";s:1:\"1\";s:5:\"hello\";s:5:\"hello\";s:0:\"\";s:0:\"\";s:2:\"he\";s:2:\"he\";}'),('2YG803UMw8FEPVlbsOtJva2r2FXQwRb6',1405254185,'a:4:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}s:11:\"csrf_tokens\";a:3:{i:0;s:32:\"05a2a5232cedec24b2a3e4ccf7322e02\";i:1;s:32:\"cec4eb3997b9e49e3799fa399fdfd9b9\";i:2;s:32:\"47a217ecf9415beff5154edf9bb67fa0\";}s:4:\"auth\";s:1:\"1\";}'),('6ObX1gS9tif2vyFXBcvQ65DuS1HClA07',1405287626,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('bFMJsjG3S8kBhzw7ejOTw0Q3ILNRq5z4',1405287618,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('bgyqZFLlCKiKQUuJ08eT67190VB3Eaza',1405264483,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('BwIEmBoMfTihWFYG9Ae8UpcxwbRykNEb',1405253722,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('cSKxhTzAFDEW4slPC7FXgGgIsDMLfrUY',1405263094,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('eyCMt1cJHp7mkocfCg4br5NiFpUllasw',1405262854,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('FWI4EFJmMUmxMH1lb2PbIkQLqhyH8js9',1405253722,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('g87XEA2ilRlb3Q62CygIvVJ55NkTM8Or',1405298855,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('j2BQFnHYyE1zHFDWP94v8WtJBD9ufmMr',1405306255,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('KppFJe8fwcOG6IZbQ2Yqe7ahLJU5jjWU',1405264874,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('m4MgRBN1MSlFwgrP2ap3kcTL9BQoHUAk',1405262854,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('ND3OIuZqKpSHXxYotWCCqjyBPUF4nm3J',1405287618,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('O2Fjh2xAuDvQMuaNg0JqCgW991zWemly',1405262183,'a:3:{s:11:\"csrf_tokens\";a:1:{i:0;s:32:\"548e92b8cb4072768934ed10b5ae5557\";}s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('OKUVFSmC5rTvgXcjBxnL8wGH2VS00P3y',1405262853,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('pls39MPU9HhWkMwGJbnEHs7IclttDTZB',1405257360,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('RkSOrzeFfmmEhhAD9qxBb6cLna5tq4rl',1405252757,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('RRlRO6vguXFAmmBeYGQvZzTQjNexIfxp',1405253722,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('vk0fAtGrRpJvqKyz1oY5VbuPIsU7wyxB',1405265478,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('wlJeBZFnwc6I3eJmVNGTW1zT02XSpf9R',1405287617,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('xa4om1gcpZGz1i6MqUAv2fJlywrpx1PH',1405265428,'a:4:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}s:11:\"csrf_tokens\";a:1:{i:0;s:32:\"f01aa4b329efcc6ca9ff6c2f233f4427\";}s:4:\"auth\";s:1:\"1\";}'),('xhcCGJ1jRNU84KSYCrY2wibQu2Fzj6VD',1405266849,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('yksLTTMbmSXISxAxZfYCpWnaRjUV9rUu',1405287617,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('yqWivynA5aUhUGxq5MftSD6GVtQTRhf1',1405253722,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}'),('ZsLcecbVeXtqghy28WjYfuRJQmGi3GP9',1405287895,'a:2:{s:4:\"_out\";a:0:{}s:3:\"_in\";a:0:{}}');
/*!40000 ALTER TABLE `blog_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_users`
--

DROP TABLE IF EXISTS `blog_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(140) NOT NULL,
  `real_name` varchar(140) NOT NULL,
  `bio` text NOT NULL,
  `status` enum('inactive','active') NOT NULL,
  `role` enum('administrator','editor','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_users`
--

LOCK TABLES `blog_users` WRITE;
/*!40000 ALTER TABLE `blog_users` DISABLE KEYS */;
INSERT INTO `blog_users` VALUES (1,'lvjun','$2a$10$QzNgbM1Xazi8W8otEOVvJeXYx38/G6nqadSWHpoqMxrB7s04DNAdi','abgood@sina.com','Administrator','The bouse','active','administrator');
/*!40000 ALTER TABLE `blog_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-13 11:15:43
