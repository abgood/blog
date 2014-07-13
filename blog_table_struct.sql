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
-- Table structure for table `blog_pages`
--

DROP TABLE IF EXISTS `blog_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_pages` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `parent` int(6) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-13 13:55:37
