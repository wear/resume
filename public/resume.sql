-- MySQL dump 10.11
--
-- Host: localhost    Database: wear_resume
-- ------------------------------------------------------
-- Server version	5.0.45

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
-- Table structure for table `additionalinfos`
--

DROP TABLE IF EXISTS `additionalinfos`;
CREATE TABLE `additionalinfos` (
  `id` int(11) NOT NULL auto_increment,
  `resume_id` int(11) default NULL,
  `interests` text,
  `groups` text,
  `awards` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `additionalinfos`
--

LOCK TABLES `additionalinfos` WRITE;
/*!40000 ALTER TABLE `additionalinfos` DISABLE KEYS */;
INSERT INTO `additionalinfos` VALUES (1,1,'æš‚æ— ',NULL,NULL,'2009-07-06 06:07:07','2009-07-06 06:07:07'),(2,2,'å¬éŸ³ä¹ï¼Œçœ‹ä¹¦','è±†ç“£','å°è±¡é‡Œå¥½åƒæœ‰','2009-07-06 07:49:10','2009-07-07 15:53:45'),(3,3,'æš‚æ— ',NULL,NULL,'2009-07-06 08:13:06','2009-07-06 08:13:06'),(4,4,'æš‚æ— ',NULL,NULL,'2009-07-12 10:07:19','2009-07-12 10:07:19'),(5,5,'æš‚æ— ',NULL,NULL,'2009-07-12 13:52:45','2009-07-12 13:52:45'),(6,6,'æš‚æ— ',NULL,NULL,'2009-07-15 03:46:17','2009-07-15 03:46:17'),(7,7,'æš‚æ— ',NULL,NULL,'2009-07-15 15:14:23','2009-07-15 15:14:23'),(8,8,'ç»˜ç”» å¬æ­Œ çœ‹ä¹¦','','','2009-07-15 15:21:54','2009-07-15 15:27:47'),(9,9,'æš‚æ— ',NULL,NULL,'2009-07-18 03:55:51','2009-07-18 03:55:51'),(10,10,'æš‚æ— ',NULL,NULL,'2009-07-18 04:00:31','2009-07-18 04:00:31'),(11,11,'æš‚æ— ',NULL,NULL,'2009-07-23 15:37:41','2009-07-23 15:37:41'),(12,12,'æš‚æ— ',NULL,NULL,'2009-07-24 09:03:46','2009-07-24 09:03:46'),(13,13,'éŸ³ä¹ã€ä½“è‚²è¿åŠ¨ã€æ‰“ç¾½æ¯›çƒã€ä¹’ä¹“çƒç­‰','å­¦ä¹ ä¸€ä¸ªæœˆçš„ç”µè„‘åŠ¨ç”»ç€è‰²ï¼','','2009-07-24 18:56:27','2009-07-24 19:30:39'),(14,14,'æš‚æ— ',NULL,NULL,'2009-07-27 08:56:13','2009-07-27 08:56:13'),(15,15,'æš‚æ— ',NULL,NULL,'2009-08-02 03:15:04','2009-08-02 03:15:04'),(16,16,'æ¸¸æ³³ï¼Œæ—…è¡Œ','','çŽ°ä»»å·¥ç¨‹éƒ¨ä¸»ç®¡','2009-08-03 03:10:05','2009-08-03 03:18:20'),(17,17,'æš‚æ— ',NULL,NULL,'2009-08-03 11:00:59','2009-08-03 11:00:59'),(18,18,'æš‚æ— ',NULL,NULL,'2009-08-07 00:28:47','2009-08-07 00:28:47'),(19,19,'æš‚æ— ',NULL,NULL,'2009-08-07 00:29:23','2009-08-07 00:29:23'),(20,20,'æš‚æ— ',NULL,NULL,'2009-08-07 09:20:33','2009-08-07 09:20:33'),(21,21,'è®¡ç®—æœºè‹±è¯­è¡Œæ”¿äººäº‹æ–‡èŒæ•™è‚²åŸ¹è®­','','æ ¡å›­ä¸»æŒå¥–','2009-08-10 06:02:54','2009-08-10 06:35:39'),(22,22,'è¿åŠ¨,å¬éŸ³ä¹,çœ‹ç”µå½±,å¼€è½¦å‡ºæ¸¸ç­‰!','','','2009-08-11 06:15:03','2009-08-11 06:34:24'),(23,23,'çœ‹ä¹¦','å‚åŠ å«ç”Ÿä¸Žå¥åº·åä¼š','æœ¬äººæ¯•ä¸šäºŽ2009å¹´6æœˆï¼Œåœ¨æ ¡æœŸé—´å­¦ä¹ åŠªåŠ›ï¼Œå¤šæ¬¡èŽ·å¾—å­¦æ ¡å¥–å­¦é‡‘ï¼Œåœ¨ç­çº§æ‹…ä»»å‰¯ç­é•¿ã€å›¢æ”¯ä¹¦ã€ç”Ÿæ´»å§”å‘˜ç­‰èŒåŠ¡ï¼Œå¹¶èŽ·å¾—ä¼˜ç§€ç­å¹²éƒ¨ç§°å·ã€‚äºŽ2009å¹´æ­£å¼å…¥å…šï¼Œæˆä¸ºä¸€åå…‰è£çš„ä¸­å…±å…šå‘˜ã€‚\r\n','2009-08-12 00:38:13','2009-08-12 00:45:02'),(24,24,'å”±æ­Œ ä¸Šç½‘ å‰ä»–','','','2009-08-12 02:01:23','2009-08-12 02:02:37'),(25,25,'ä¹¦æ³•,éŸ³ä¹ç­‰ç­‰','','2006èŽ·å¤§å­¦ç”Ÿå®‰å…¨çŸ¥è¯†ç«žèµ›ç¬¬ä¸€å,äºŒç­‰å¥–å­¦é‡‘','2009-08-12 04:06:54','2009-08-12 04:27:32'),(26,26,'æš‚æ— ',NULL,NULL,'2009-08-12 15:09:20','2009-08-12 15:09:20'),(27,27,'æš‚æ— ',NULL,NULL,'2009-08-13 06:24:09','2009-08-13 06:24:09'),(28,28,'æš‚æ— ',NULL,NULL,'2009-08-13 14:37:43','2009-08-13 14:37:43'),(29,29,'æš‚æ— ',NULL,NULL,'2009-08-15 10:13:36','2009-08-15 10:13:36'),(30,30,'æš‚æ— ',NULL,NULL,'2009-08-15 10:17:17','2009-08-15 10:17:17');
/*!40000 ALTER TABLE `additionalinfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asserts`
--

DROP TABLE IF EXISTS `asserts`;
CREATE TABLE `asserts` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `size` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `attachable_id` int(11) default NULL,
  `updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `thumbnail` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asserts`
--

LOCK TABLES `asserts` WRITE;
/*!40000 ALTER TABLE `asserts` DISABLE KEYS */;
INSERT INTO `asserts` VALUES (1,'http_imgload_40_.jpg',77,99,'image/pjpeg',81473,'Profile',17,'2009-08-03 03:10:05','2009-08-03 03:10:05',NULL,NULL),(2,'2.bmp',77,99,'image/bmp',960822,'Profile',18,'2009-08-03 11:00:59','2009-08-03 11:00:59',NULL,NULL),(3,'Vdison.jpg',77,99,'image/pjpeg',2040,'Profile',20,'2009-08-10 06:02:54','2009-08-10 06:02:54',NULL,NULL),(4,'200921220222.jpg',77,99,'image/pjpeg',14261,'Profile',21,'2009-08-11 06:32:43','2009-08-11 06:32:43',NULL,NULL),(5,'QQ_____.bmp',77,99,'image/bmp',38890,'Profile',23,'2009-08-12 02:01:23','2009-08-12 02:01:23',NULL,NULL),(6,'SP_A0298.jpg',77,99,'image/pjpeg',28065,'Profile',26,'2009-08-13 14:37:43','2009-08-13 14:37:43',NULL,NULL);
/*!40000 ALTER TABLE `asserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comatose_page_versions`
--

DROP TABLE IF EXISTS `comatose_page_versions`;
CREATE TABLE `comatose_page_versions` (
  `id` int(11) NOT NULL auto_increment,
  `comatose_page_id` int(11) default NULL,
  `version` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `full_path` text,
  `title` varchar(255) default NULL,
  `slug` varchar(255) default NULL,
  `keywords` varchar(255) default NULL,
  `body` text,
  `filter_type` varchar(25) default 'Textile',
  `author` varchar(255) default NULL,
  `position` int(11) default '0',
  `updated_on` datetime default NULL,
  `created_on` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comatose_page_versions`
--

LOCK TABLES `comatose_page_versions` WRITE;
/*!40000 ALTER TABLE `comatose_page_versions` DISABLE KEYS */;
INSERT INTO `comatose_page_versions` VALUES (1,1,1,NULL,NULL,'Home Page',NULL,NULL,'h1. Welcome\n\nYour content goes here...','Textile','System',0,'2009-07-30 09:02:08','2009-07-30 09:02:08');
/*!40000 ALTER TABLE `comatose_page_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comatose_pages`
--

DROP TABLE IF EXISTS `comatose_pages`;
CREATE TABLE `comatose_pages` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `full_path` text,
  `title` varchar(255) default NULL,
  `slug` varchar(255) default NULL,
  `keywords` varchar(255) default NULL,
  `body` text,
  `filter_type` varchar(25) default 'Textile',
  `author` varchar(255) default NULL,
  `position` int(11) default '0',
  `version` int(11) default NULL,
  `updated_on` datetime default NULL,
  `created_on` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comatose_pages`
--

LOCK TABLES `comatose_pages` WRITE;
/*!40000 ALTER TABLE `comatose_pages` DISABLE KEYS */;
INSERT INTO `comatose_pages` VALUES (1,NULL,NULL,'Home Page',NULL,NULL,'h1. Welcome\n\nYour content goes here...','Textile','System',0,1,'2009-07-30 09:02:08','2009-07-30 09:02:08');
/*!40000 ALTER TABLE `comatose_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
CREATE TABLE `educations` (
  `id` int(11) NOT NULL auto_increment,
  `resume_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `degree` varchar(255) default NULL,
  `field` varchar(255) default NULL,
  `start_at` datetime default NULL,
  `end_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (1,2,'è‹å·žå¤§å­¦','æœ¬ç§‘','å“²å­¦','1999-08-31 16:00:00','2003-05-31 16:00:00','æš‚æ— '),(2,7,'åŒ—äº¬å†œä¸šå¤§å­¦','åœ¨è¯»å¤§ä¸“','è®¡ç®—æœºç»´æŠ¤ä»¥åŠç½‘ç»œåº”ç”¨','2006-10-31 16:00:00','2009-10-31 16:00:00',''),(3,8,'æ²³å—ç§‘æŠ€å­¦é™¢','æœ¬ç§‘','å›½é™…ç»æµŽä¸Žè´¸æ˜“','2005-08-31 16:00:00','2009-06-30 16:00:00','2006å¹´ä¸‹å­¦æœŸèŽ·äºŒç­‰å¥–å­¦é‡‘ â€œä¼˜ç§€å›¢å‘˜â€ç§°å·\r\n2007å¹´ä¸Šå­¦æœŸèŽ·ä¸‰ç­‰å¥–å­¦é‡‘ \r\n2008ä¸‹åŠå¹´èŽ·â€œä¸‰å¥½å­¦ç”Ÿâ€ç§°å·\r\n2009å¹´ä¸Šå­¦æœŸèŽ·â€œä¼˜ç§€ç­å¹²â€ç§°å·ç­‰'),(4,13,'å¾å·žå¸‚åˆçº§ä¸­å­¦','åˆä¸­','æ–‡ç§‘','1994-06-30 16:00:00','1997-06-30 16:00:00',''),(5,13,'å¾å·žå¸‚èŒä¸šé«˜çº§ä¸­å­¦','èŒé«˜','ç”µå·¥ç”µå­','1997-06-30 16:00:00','2000-07-31 16:00:00',''),(6,16,'å¹¿ä¸œæ•™è‚²å­¦é™¢','ä¸­ä¸“','æœºç”µä¸€ä½“åŒ–','2003-08-31 16:00:00','2006-07-31 16:00:00','ä¸­ä¸“æ¯•ä¸š'),(7,21,'é•‡æ±Ÿå¸‚é«˜ç­‰ä¸“ç§‘å­¦é™¢','å¤§ä¸“','æ•™å¸ˆæ•™è‚²+å¤–è¯­ç³»','2005-07-31 16:00:00','2010-07-31 16:00:00',''),(8,22,'é«˜ä¸­','é«˜ä¸­','è¯åˆ¸','2000-07-31 16:00:00','2009-07-31 16:00:00','è™½ç„¶å­¦åŽ†ä¸ç®—é«˜,ä½†æ˜¯æˆ‘è¾¹å·¥ä½œ,è¾¹å­¦ä¹ ,ä¸€ç›´æ²¡æœ‰è½åŽ~'),(9,23,'å®‰å¾½å•†è´¸èŒä¸šæŠ€æœ¯å­¦é™¢','å¤§ä¸“','ç‰©æµç®¡ç†','2006-08-31 16:00:00','2009-05-31 16:00:00','åœ¨æ ¡å­¦ä¹ åŒ…æ‹¬ã€Šç®¡ç†å­¦ã€‹ã€Šä¼šè®¡å­¦ã€‹ ã€Šå¸‚åœºè¥é”€å­¦ã€‹ç­‰è¾…åŠ©å­¦ç§‘ï¼Œä¸»è¦ä¸“ä¸šçŸ¥è¯†åŒ…æ‹¬ã€Šä»“å‚¨ä¸Žé…é€ã€‹ ã€Šä¾›åº”é“¾ç®¡ç†ã€‹ ã€Š çŽ°ä»£ç‰©æµ ã€‹ç­‰ä¸€ç³»åˆ—ä¸“ä¸šè¯¾ç¨‹ï¼ŒæŽŒæ¡ç‰©æµæ–¹é¢çš„ä¸“ä¸šçŸ¥è¯†ã€‚ \r\n \r\n'),(10,24,'è‹å±±ä¸€ä¸­','é«˜ä¸­','é«˜ä¸­','2003-06-30 16:00:00','2006-06-30 16:00:00',''),(11,25,'ä¸Šé¥¶å¸ˆèŒƒå­¦é™¢','å¤§ä¸“','è¯­æ–‡æ•™è‚²','2006-08-31 16:00:00','2009-06-30 16:00:00',''),(12,26,'é’å²›æ¸¯æ¹¾èŒä¸šæŠ€æœ¯å­¦é™¢','å¤§ä¸“','ç‰©æµç®¡ç†','2004-06-30 16:00:00','2009-06-30 16:00:00','');
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL auto_increment,
  `friend_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `status` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `sender_id` int(11) default NULL,
  `recipient_id` int(11) default NULL,
  `sender_deleted` tinyint(1) default '0',
  `recipient_deleted` tinyint(1) default '0',
  `subject` varchar(255) default NULL,
  `body` text,
  `read_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `req` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL auto_increment,
  `resume_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `start_at` datetime default NULL,
  `end_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,2,'web developer','å’Œå®¶ç½‘','2008-09-30 16:00:00','2009-06-30 16:00:00','ç½‘ç«™å¼€å‘'),(2,7,'åŠ©ç†å·¥ç¨‹å¸ˆ','è”æƒ³ï¼ˆåŒ—äº¬ï¼‰æœ‰é™å…¬å¸','2004-01-31 16:00:00','2009-06-30 16:00:00','2004å¹´---2005å¹´ä¸»è¦ä»Žäº‹è”æƒ³å°å¼ç”µè„‘æ–°äº§å“å‰æœŸæ€§èƒ½æµ‹è¯•å·¥ä½œï¼Œåœ¨æ­¤æœŸé—´èŽ·å¾—åŽ‚â€œä¼˜ç§€æ–°å‘˜å·¥å¥–â€\r\n2005å¹´---2006å¹´ä¸»è¦ä»Žäº‹è”æƒ³å°å¼ç”µè„‘æ–°äº§å“å‰æœŸæ€§èƒ½æµ‹è¯•æ•…éšœåˆ¤æ–­åŠåˆ†æžå·¥ä½œï¼Œåœ¨æ­¤æœŸé—´èŽ·å¾—åŽ‚â€œå“è´¨æ”¹å–„å¥–â€\r\n2006å¹´---2007å¹´å¤–æ´¾è‡³è”æƒ³ï¼ˆæƒ é˜³ï¼‰åŽ‚å­¦ä¹ ã€‚\r\n2007å¹´---2009å¹´ä¸»è¦ä»Žäº‹è”æƒ³å°å¼ç”µè„‘æ–°äº§å“å¼•å…¥å·¥åŽ‚æµç¨‹å·¥ç¨‹åŒ–ä»¥åŠå¤±æ•ˆåˆ†æžé¡¹ç›®ç»„å·¥ä½œï¼Œåœ¨æ­¤æœŸé—´å†æ¬¡å¾—åŽ‚â€œå“è´¨æ”¹å–„å¥–â€\r\n'),(3,8,'å¸‚åœºè°ƒç ”å‘˜','æ²³å—éƒ‘å·žå¸‚åœºè°ƒç ”éƒ¨','2008-04-30 16:00:00','2008-04-30 16:00:00','å…¼èŒï¼›åœ¨å¸‚åœºä¸­ï¼Œé¡¾å®¢å¯¹ä¼Šåˆ©å¥¶ç²‰çš„è´­ä¹°åŠ›åº¦åšå‡ºè¯¦ç»†è°ƒæŸ¥'),(4,11,'rubyonrailså¼€å‘','asap','2007-03-31 16:00:00',NULL,'ä¸æƒ³æ··äº†'),(5,13,'é¢†ç­','æ— é”¡7+7é¤é¥®è¿žé”','2002-01-31 16:00:00','2004-02-29 16:00:00','åˆšæ¥åˆ°æ— é”¡æŽ¥è§¦çš„ç¬¬ä¸€æ¬¡å·¥ä½œæœºä¼šã€å½“ç„¶å¹¶ä¸æ˜¯è¿›åº—å°±å¯ä»¥æ‹…å½“é¢†ç­ä¸€èŒçš„ã€ä¹Ÿæ˜¯ç»è¿‡æœåŠ¡å‘˜çš„é”»ç‚¼ã€ä»Žæ“¦æ¡Œå­ã€æ‹–åœ°ã€æ¯ä¸€ä¸ªç»†å°çš„å·¥ä½œä¸­ç§¯ç´¯çš„ç»éªŒã€å½“ä¸­è¾›è‹¦è‡ªç„¶ä»–äººæ˜¯ä½“ä¼šä¸åˆ°çš„ã€å¤å¤©çš„æ—¶å€™ç”¨æ‰‹æŠ“åžƒåœ¾çš„äº‹ç»å¸¸æœ‰çš„ã€é—»åˆ°æ¶è‡­éƒ½æƒ³åèƒƒã€ä½†æ˜¯è¿˜æ˜¯åšæŒä¸‹æ¥ã€‚æœ€åŽè§‰å¾—è¿™ä¹Ÿæ˜¯ä¸€ç§äººç”Ÿçš„åŽ†ç»ƒå§ï¼'),(6,13,'ä¸»ç®¡','å®œå…´â€œå¿«ç‚¹â€é¤é¥®','2004-03-31 16:00:00','2006-05-31 16:00:00','æœ‹å‹å¼€çš„åº—ã€è‡ªç„¶å°‘ä¸äº†äº²æˆšå¥½å‹ã€å®¶æ—å¼çš„ç®¡ç†æ²¡æœ‰ç›¸åº”çš„è§„ç« åˆ¶åº¦æ˜¯åšä¸é•¿ä¹…çš„ã€æžœç„¶ä¸å‡ºæ‰€é¢„ã€å¼€ä¸šç¬¬äºŒå¹´å› ç®¡ç†ä¸å½“åº—é¢è½¬è®©ï¼è¿™ç‚¹æ˜¯æˆ‘è§‰å¾—éžå¸¸å¯æƒœçš„åœ°æ–¹ï¼'),(7,13,'æŸœé•¿','æ— é”¡åäº¨æ‰‹æœºè¿žé”','2006-03-31 16:00:00','2009-08-31 16:00:00','å‹¾å¿ƒæ–—è§’æ˜¯å¸¸æœ‰çš„äº‹ã€ä¸ºäº†äº‰æŠ¢ä¸€ä¸ªé¡¾å®¢ã€éª‚äººçš„è¯æ—¶å¸¸å……æ–¥ç€å–åœºé‡Œã€æ²¡åŠžæ³•ï¼ä¸ºäº†ç”Ÿè®¡ã€ç£¨ç ´å˜´çš®è®©é¡¾å®¢è´­ä¹°åˆ°è‡ªå·±æŽ¨èçš„æ‰‹æœºã€æœ‰æ—¶è¦èŠ±å‡ ä¸ªå°æ—¶çš„æ—¶é—´ï¼ä»‹ç»åŠŸèƒ½ã€è®²è§£ä¸‰åŒ…è§„å®šã€è¯´ä¸€äº›å¥‰æ‰¿çš„è¯ï¼æœ€åŽçš„ç»“æžœå°±æ˜¯ä½¿é¡¾å®¢ç©ºæ‰‹è€Œæ¥ã€æ»¡æ„è€Œå½’ï¼åŽ‹åŠ›æ˜¯è›®å¤§çš„ï¼æœˆæœ«è¾¾åˆ°é”€å”®ç¬¬ä¸€è¿˜æœ‰é¢å¤–å¥–é‡‘ï¼è¿™ä¸ªä¹Ÿæ˜¯ä¿ƒä½¿å·¥ä½œå–åŠ›çš„åŽŸå› ä¹‹ä¸€å§ï¼'),(9,16,'å·¥ç¨‹å¸ˆåŠ©ç†','ä¸‡æ±Ÿæ°¸é‘«æœºæ¢°åŽ‚','2006-07-31 16:00:00','2008-05-31 16:00:00',''),(10,16,'LEDç¼–ç¨‹å‘˜','ä¸œèŽžé‡‘è‰²å¹´åŽä¿±ä¹éƒ¨','2008-03-31 16:00:00',NULL,''),(11,1,'ruby','asap','2006-06-30 16:00:00',NULL,'sfasdfasdfasd'),(12,22,'èŒå‘˜','è¯åˆ¸','2008-12-31 16:00:00',NULL,'æ¥è‡ªå†œæ‘çš„æˆ‘ä»Žå°å°±åŸ¹å…»äº†èƒ½åƒè‹¦è€åŠ³çš„ç²¾ç¥žï¼›å…·æœ‰å›¢é˜Ÿåˆä½œç²¾ç¥žï¼Œåšäº‹ç»†è‡´æœ‰ä¸»è§ï¼Œèƒ½åƒè‹¦ï¼›æ€§æ ¼å¼€æœ—ä¹è§‚ï¼Œç§¯æžä¸Šè¿›ï¼›æœ‰è¾ƒå¼ºç»„ç»‡èƒ½åŠ›ï¼Œé€‚åº”èƒ½åŠ›å¼ºï¼›å·¥ä½œç»éªŒåŸ¹å…»äº†æˆ‘è¾ƒå¼ºçš„åˆ†æžèƒ½åŠ›å’Œè§£å†³é—®é¢˜çš„èƒ½åŠ›ï¼Œå¹¶ä¸”èƒ½å¤Ÿä»Žå¤´è‡³å°¾çš„ç›‘æŽ§å¹¶å®Œæˆå·¥ä½œé¡¹ç›®å®žæ–½çš„æ•´ä¸ªæµç¨‹ã€‚ \r\n'),(13,24,'ç”Ÿäº§è¦å‘˜','å®æ³¢æçˆ±æ­»æ±½è½¦å†…é¥°æœ‰é™å…¬å¸','2006-07-31 16:00:00','2008-07-31 16:00:00',''),(14,24,'ç”Ÿäº§è¦å‘˜','å®æ³¢æçˆ±æ­»æ±½è½¦å†…é¥°æœ‰é™å…¬å¸','2006-07-31 16:00:00','2008-07-31 16:00:00',''),(15,25,'è¯­æ–‡æ•™å¸ˆ','æ±Ÿè¥¿é»„é‡‘åŸ ä¸­å­¦','2008-08-31 16:00:00','2008-10-31 16:00:00',''),(16,26,'æ“ä½œ','é’å²›æºæºå›½é™…ç‰©æµæœ‰é™å…¬å¸','2008-09-30 16:00:00','2009-01-31 16:00:00','');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
CREATE TABLE `posters` (
  `id` int(11) NOT NULL auto_increment,
  `position` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `content` text,
  `resume_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES (1,'æ“ç›˜æ‰‹+æŠ€èƒ½+è¯šå®ž','906872622@qq.com','ä½ å¥½è¿™æ˜¯æˆ‘çš„ç®€åŽ†!,æˆ‘åŒæ—¶ä¼šå¼€è½¦,æœ‰é©¾é©¶è¯,è¿˜ä¼šä¿®ç”µè„‘!å¸Œæœ›èƒ½åœ¨å…¬å¸å·¥ä½œ~!',22,'2009-08-11 06:42:09','2009-08-11 06:42:09'),(2,'64552790@qq.com','64552790@qq.com','64552790@qq.com64552790@qq.com64552790@qq.com64552790@qq.com',22,'2009-08-11 06:43:18','2009-08-11 06:43:18');
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `birthday` datetime default NULL,
  `marital_status` tinyint(1) default NULL,
  `sex` varchar(255) default NULL,
  `hometwon` varchar(255) default NULL,
  `hukou` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'å­”ä»¤äº®','15001912259','ä¸Šæµ·æµ¦ä¸œ','wear21@hotmail.com','1981-10-31 16:00:00',NULL,'m','é³Œæ±Ÿ','é³Œæ±Ÿ','2009-07-06 06:07:07','2009-07-23 15:28:56',2),(2,'æ¨è¿›ä¸œ','13764548868','æµ¦ä¸œæ–°åŒºé¾™ä¸‰è·¯','yangjindong@gmail.com','1979-12-21 16:00:00',NULL,'m','æ±Ÿè‹æ·®é˜´','æ±Ÿè‹å—äº¬','2009-07-06 07:49:10','2009-07-23 15:28:56',3),(3,'åˆ˜å”ç¨','13585511543','æµ¦ä¸œå¤§é“1460å¼„40å·102å®¤','jimimiao628@hotmail.com','1982-08-07 16:00:00',NULL,'f','æ±Ÿè¥¿','æ±Ÿè¥¿','2009-07-06 08:13:06','2009-07-23 15:28:56',4),(4,'åˆ˜è–‡','13564876415','ä¸Šæµ·å¸‚è™¹å¤è·¯270å¼„16å·301å®¤','liuwei0524@live.jp','1984-04-27 16:00:00',NULL,'f','æ±Ÿè‹å¸¸å·ž','æ±Ÿè‹å¸¸å·ž','2009-07-12 10:07:19','2009-07-23 15:28:56',6),(5,'ä½•å»ºæ ‘','13211111111','å¤©æ´¥','hejianshu@163.com','1981-07-11 16:00:00',NULL,'m','','','2009-07-12 13:52:45','2009-07-23 15:28:56',8),(6,'å”çªä¼Ÿ','13852483319','æµ™æ±Ÿçœæ¹–å·žå¸‚ä¸œæž—é•‡','kiwigiving@gmail.com','1987-10-27 16:00:00',NULL,'m','æµ™æ±Ÿæ¹–å·ž','æµ™æ±Ÿæ¹–å·ž','2009-07-15 03:46:17','2009-07-23 15:28:56',12),(7,'è°¢ä¸šé£ž','13683546141','åŒ—äº¬å¸‚ï¼Œæµ·æ·€åŒºï¼Œä¸Šåœ°åˆ›ä¸šè·¯6å·','xieyefei@126.com','1984-01-25 16:00:00',NULL,'m','1984.01.26','å®‰å¾½çœï¼Œå·¢æ¹–å¸‚æ— ä¸ºåŽ¿ï¼Œçº¢åº™é•‡','2009-07-15 15:14:23','2009-07-23 15:28:56',14),(8,'å®—æ–‡','15165881978','å±±ä¸œçœæž£åº„å¸‚å¸‚ä¸­åŒºè¥¿å²­å°åŒº8å·æ¥¼ä¸€å•å…ƒ','yoyowen_z@126.com','1986-11-21 16:00:00',NULL,'f','å±±ä¸œçœæž£åº„å¸‚','å±±ä¸œçœæž£åº„å¸‚','2009-07-15 15:21:53','2009-07-23 15:28:56',13),(9,'é«˜æ¨','13015015644','å†…è’™å¤åŒ…å¤´å¸‚è¨æ‹‰é½','gaoyang@msn.cn','1986-03-15 16:00:00',NULL,'m','å†…è’™å¤åŒ…å¤´å¸‚è¨æ‹‰é½','å†…è’™å¤åŒ…å¤´å¸‚','2009-07-18 03:55:51','2009-07-18 03:55:51',NULL),(10,'é«˜æ¨','13015015644','å†…è’™å¤åŒ…å¤´å¸‚è¨æ‹‰é½','gaoy2ang@msn.cn','1986-03-15 16:00:00',NULL,'m','å†…è’™å¤åŒ…å¤´å¸‚è¨æ‹‰é½','å†…è’™å¤åŒ…å¤´å¸‚','2009-07-18 04:00:31','2009-07-18 04:00:31',NULL),(11,'stephen','15001912259','ä¸Šæµ·æµ¦ä¸œ','wear63659220@yahoo.com.cn','1981-11-30 16:00:00',NULL,'m','æ¸©å·ž','æ¸©å·ž','2009-07-23 15:37:33','2009-07-23 15:37:33',29),(12,'å­™ç¼','13914256868','æ— é”¡ æ›¹å¼ æ–°æ‘','sqmy0@163.com','1982-04-07 16:00:00',NULL,'m','æ±Ÿè‹å¾å·žå¸‚','å¾å·ž','2009-07-24 18:55:52','2009-07-24 18:55:52',30),(13,'æ²ˆå­æ„‰','15958717169','æµ™æ±Ÿçœæ¸©å·žå¸‚èŒ¶å±±é•‡ç“¯æµ·åŒºæ¸©å·žå¤§å­¦åŒ—æ ¡åŒº','szycandy@163.com','1987-08-09 15:00:00',NULL,'f','æµ™æ±ŸçœèˆŸå±±å¸‚å²±å±±åŽ¿é«˜äº­é•‡','æµ™æ±ŸçœèˆŸå±±å¸‚å²±å±±åŽ¿','2009-07-27 08:55:36','2009-07-27 08:55:36',33),(14,'baichenlin','15877653273','æ²³åŒ—çŸ³å®¶åº„','baichenlin@sina.com','1988-06-20 15:00:00',NULL,'f','æ²³åŒ—çŸ³å®¶åº„','æ²³åŒ—çŸ³å®¶åº„','2009-07-28 01:30:08','2009-07-28 01:30:08',34),(15,'æŽå¢žæœ¯','13802096813','å¤©æ´¥å¸‚çº¢æ¡¥åŒºç«¹å±±è·¯7å·','lizengshu@126.com','1988-04-27 15:00:00',NULL,'m','å¤©æ´¥å®å»éƒå„åº„é•‡','å¤©æ´¥å®å»éƒå„åº„é•‡','2009-07-29 03:44:22','2009-07-29 03:44:58',NULL),(16,'huihui','13913304733','nanjing','huihui7187@126.com','1981-08-01 16:00:00',NULL,'f','','','2009-08-02 03:15:04','2009-08-02 03:15:04',37),(17,'é’Ÿæµ·çª','13268475785','å¹¿ä¸œä¸œèŽžå¸¸å¹³','zhonghaiqi@qq.com','1988-09-08 15:00:00',NULL,'m','å¹¿è¥¿','å¹¿è¥¿çŽ‰æž—','2009-08-03 03:10:05','2009-08-03 03:10:05',38),(18,'zhangle','13672191310','é•¿äº†è¥¿è·¯145å¥½','banrenshou@126.com','1981-08-02 16:00:00',NULL,'m','ä¸‰é—¨å³¡','ä¸‰é—¨å³¡','2009-08-03 11:00:59','2009-08-03 11:00:59',39),(19,'å†µèŠ¸','13794626561','å¹¿ä¸œçœä½›å±±å¸‚å—æµ·åŒºæ¡‚åŸŽè¡—é“å—äº”è·¯å…«å·','290455530@qq.com','1988-08-23 15:00:00',NULL,'f','19880824','æ±Ÿè¥¿','2009-08-07 09:20:33','2009-08-07 09:20:33',43),(20,'åˆ˜ç£Š','13862456961','é•‡æ±Ÿå¸‚é…’æµ·è¡—49æ ‹302å·','liuleimind98@126.com','1989-12-03 16:00:00',NULL,'m','é•‡æ±Ÿå¸‚','é•‡æ±Ÿ','2009-08-10 06:02:54','2009-08-10 06:02:54',45),(21,'æŽç«‹å³°','13503127297','æ²³åŒ—çœä¿å®š','64552790@qq.com','1981-05-04 16:00:00',NULL,'m','æ²³åŒ—çœä¿å®šå¸‚','æ²³åŒ—çœä¿å®šå¸‚','2009-08-11 06:15:03','2009-08-11 06:15:03',47),(22,'é»„å‹¤çº¢','15255868685','å®‰å¾½ä¸´æ³‰åŽ¿','280355327@qq.com','1987-12-07 16:00:00',NULL,'f','å®‰å¾½å…¨æ¤’åŽ¿','å®‰å¾½å…¨æ¤’åŽ¿','2009-08-12 00:38:13','2009-08-12 00:38:13',48),(23,'é‚±ç£Š','15067412500','å®æ³¢å¸‚åŒ—ä»‘åŒºå¤§ç¢¶é•‡è€è´ºæ‘','171085579@qq.com','1987-09-25 16:00:00',NULL,'m','å±±ä¸œçœä¸´æ²‚å¸‚è‹å±±åŽ¿å°šå²©é•‡çŽ‹æ¥¼å—åº„æ‘','å±±ä¸œçœä¸´æ²‚å¸‚è‹å±±åŽ¿å°šå²©é•‡çŽ‹æ¥¼å—åº„æ‘','2009-08-12 02:01:23','2009-08-12 02:01:23',49),(24,'æˆ´å«è','13641677391','ä¸Šæµ·é—µè¡Œ','daidai_988@163.com','1988-10-24 16:00:00',NULL,'f','æ±Ÿè¥¿ä¸Šé¥¶å¸‚ä½™å¹²åŽ¿','æ±Ÿè¥¿ä¸Šé¥¶å¸‚ä½™å¹²åŽ¿é»„é‡‘åŸ é•‡','2009-08-12 04:06:54','2009-08-12 04:06:54',50),(25,'çŽ‹æ¢¦é›ª','13665326079','é’å²›å¸‚å¸‚å—åŒºç£å±±è·¯2å·','wangmengxue1988@163.com','1988-09-08 15:00:00',NULL,'f','é’å²›','é’å²›','2009-08-12 15:09:20','2009-08-12 15:09:20',51),(26,'jiarui','13425765887','chengdu','rebeccawoo1987@hotmail.com','1987-11-09 16:00:00',NULL,'f','æˆéƒ½å¸‚','æˆéƒ½å¸‚','2009-08-13 14:37:43','2009-08-13 14:40:47',54),(27,'æ»•å®¶ç¥¥','15154588064','å±±ä¸œçœçƒŸå°å¸‚','yytjx822@126.com','1987-02-09 16:00:00',NULL,'m','å±±ä¸œçœèŽ±å·žå¸‚','å±±ä¸œçœèŽ±å·žå¸‚','2009-08-15 10:13:36','2009-08-15 10:18:56',55);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL auto_increment,
  `sender_id` int(11) default NULL,
  `receiver_id` int(11) default NULL,
  `visible` tinyint(1) default '0',
  `recommendable_type` varchar(255) default NULL,
  `recommandable_id` int(11) default NULL,
  `desc` text,
  `sender_role` varchar(255) default NULL,
  `refer_type` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
CREATE TABLE `resumes` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  `salt` varchar(255) default NULL,
  `usage` varchar(255) default NULL,
  `type` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (1,NULL,'2009-07-06 06:07:07','2009-07-23 15:34:20',2,'XLnnhvfusRYq2',NULL,NULL),(2,NULL,'2009-07-06 07:49:10','2009-07-06 07:50:01',3,'qEn7WWraQ3Az5',NULL,NULL),(3,NULL,'2009-07-06 08:13:06','2009-07-06 08:13:06',4,NULL,NULL,NULL),(4,NULL,'2009-07-12 10:07:19','2009-07-12 10:07:19',6,NULL,NULL,NULL),(5,NULL,'2009-07-12 13:52:45','2009-07-12 13:52:45',8,NULL,NULL,NULL),(6,NULL,'2009-07-15 03:46:17','2009-07-15 03:46:17',12,NULL,NULL,NULL),(7,NULL,'2009-07-15 15:14:23','2009-07-15 15:14:23',14,NULL,NULL,NULL),(8,NULL,'2009-07-15 15:21:53','2009-07-15 15:21:53',13,NULL,NULL,NULL),(11,NULL,'2009-07-23 15:37:41','2009-07-23 15:37:41',29,'Gv4Q3APL3G4ks',NULL,NULL),(12,NULL,'2009-07-24 09:03:46','2009-07-24 09:03:46',3,'HElDn27uPVmkD',NULL,NULL),(13,NULL,'2009-07-24 18:56:27','2009-07-24 18:56:27',30,'vdVVaHjhfFhLp',NULL,NULL),(14,NULL,'2009-07-27 08:56:13','2009-07-27 08:56:13',33,'xEFic71oFNbXZ',NULL,NULL),(15,NULL,'2009-08-02 03:15:04','2009-08-02 03:15:04',37,'npyYwoov2zAT2','æš‚æ— ',NULL),(16,NULL,'2009-08-03 03:10:05','2009-08-03 03:10:05',38,'O3YPj8tYAq5QM','æš‚æ— ',NULL),(17,NULL,'2009-08-03 11:00:59','2009-08-03 11:00:59',39,'G71KgOpyxLwEp','æš‚æ— ',NULL),(20,NULL,'2009-08-07 09:20:33','2009-08-07 09:20:33',43,'lgvl3Ln26u6Kc','æš‚æ— ',NULL),(21,NULL,'2009-08-10 06:02:54','2009-08-10 06:02:54',45,'ZXQ1zrKYBRHqg','æš‚æ— ',NULL),(22,NULL,'2009-08-11 06:15:03','2009-08-11 06:15:03',47,'YFvsOsplu2XsY','æš‚æ— ',NULL),(23,NULL,'2009-08-12 00:38:13','2009-08-12 00:38:13',48,'jmRuKtHdRee7P','æš‚æ— ',NULL),(24,NULL,'2009-08-12 02:01:23','2009-08-12 02:01:23',49,'JCKkJkSu7CrBD','æš‚æ— ',NULL),(25,NULL,'2009-08-12 04:06:54','2009-08-12 04:06:54',50,'6eSWCwngfwoo8','æš‚æ— ',NULL),(26,NULL,'2009-08-12 15:09:20','2009-08-12 15:09:20',51,'EQZVpdfb6Sevx','æš‚æ— ',NULL),(28,NULL,'2009-08-13 14:37:43','2009-08-13 14:38:40',54,'QazrZxOtdOsW5','æš‚æ— ',NULL),(29,NULL,'2009-08-15 10:13:36','2009-08-15 10:13:36',55,'JlFKA5JR8IaaZ','æš‚æ— ',NULL),(30,NULL,'2009-08-15 10:17:17','2009-08-15 10:17:17',55,'yET375puHE8Xg','æš‚æ— ',NULL);
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user'),(2,'superuser');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (2,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090617070807'),('20090617080744'),('20090617080827'),('20090617081239'),('20090619025408'),('20090619025830'),('20090625025406'),('20090625025727'),('20090702072135'),('20090706025004'),('20090706041116'),('20090706091808'),('20090707054722'),('20090721142042'),('20090723133042'),('20090723150717'),('20090725073510'),('20090725090036'),('20090729062155');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summaries`
--

DROP TABLE IF EXISTS `summaries`;
CREATE TABLE `summaries` (
  `id` int(11) NOT NULL auto_increment,
  `resume_id` int(11) default NULL,
  `content` text,
  `specialties` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `summaries`
--

LOCK TABLES `summaries` WRITE;
/*!40000 ALTER TABLE `summaries` DISABLE KEYS */;
INSERT INTO `summaries` VALUES (1,1,'æš‚æ— ','æš‚æ— ','2009-07-06 06:07:07','2009-07-06 06:07:07'),(2,2,'çœŸä¸çŸ¥è¯¥å¦‚ä½•æ€»ç»“ï¼','æš‚æ— ','2009-07-06 07:49:10','2009-07-07 15:52:13'),(3,3,'æš‚æ— ','æš‚æ— ','2009-07-06 08:13:06','2009-07-06 08:13:06'),(4,4,'æš‚æ— ','æš‚æ— ','2009-07-12 10:07:19','2009-07-12 10:07:19'),(5,5,'æš‚æ— ','æš‚æ— ','2009-07-12 13:52:45','2009-07-12 13:52:45'),(6,6,'æš‚æ— ','æš‚æ— ','2009-07-15 03:46:17','2009-07-15 03:46:17'),(7,7,'æš‚æ— ','æš‚æ— ','2009-07-15 15:14:23','2009-07-15 15:14:23'),(8,8,'é€‚åº”å¼ºï¼Œè´£ä»»å¿ƒé‡','æš‚æ— ','2009-07-15 15:21:53','2009-07-15 15:26:52'),(9,9,'æš‚æ— ','æš‚æ— ','2009-07-18 03:55:51','2009-07-18 03:55:51'),(10,10,'æš‚æ— ','æš‚æ— ','2009-07-18 04:00:31','2009-07-18 04:00:31'),(11,11,'æˆ‘å¾ˆéƒé—·','æš‚æ— ','2009-07-23 15:37:41','2009-07-23 15:38:44'),(12,12,'æš‚æ— ','æš‚æ— ','2009-07-24 09:03:46','2009-07-24 09:03:46'),(13,13,'å¯¹å·¥ä½œè´Ÿè´£ã€èƒ½æŒ‰æ—¶å®Œæˆé¢†å¯¼äº¤ä»£çš„ä»»åŠ¡ã€‚','æš‚æ— ','2009-07-24 18:56:27','2009-07-24 19:05:21'),(14,14,'æš‚æ— ','æš‚æ— ','2009-07-27 08:56:13','2009-07-27 08:56:13'),(15,15,'æš‚æ— ','æš‚æ— ','2009-08-02 03:15:04','2009-08-02 03:15:04'),(16,16,'æš‚æ— ','æš‚æ— ','2009-08-03 03:10:05','2009-08-03 03:10:05'),(17,17,'æš‚æ— ','æš‚æ— ','2009-08-03 11:00:59','2009-08-03 11:00:59'),(18,18,'æš‚æ— ','æš‚æ— ','2009-08-07 00:28:47','2009-08-07 00:28:47'),(19,19,'æš‚æ— ','æš‚æ— ','2009-08-07 00:29:23','2009-08-07 00:29:23'),(20,20,'æœ‰è¾ƒå¼ºçš„ç»„ç»‡èƒ½åŠ›ã€æ´»åŠ¨ç­–åˆ’èƒ½åŠ›å’Œå…¬å…³èƒ½åŠ›','æš‚æ— ','2009-08-07 09:20:33','2009-08-07 09:26:16'),(21,21,'å…·æœ‰å›¢é˜Ÿç²¾ç¥žï¼Œèƒ½å¤Ÿä¸Žå›¢é˜Ÿå…±è¿›é€€','æš‚æ— ','2009-08-10 06:02:54','2009-08-10 06:12:56'),(22,22,'æˆ‘ä¸æ˜¯æœ€ä¼˜ç§€çš„,ä½†æ˜¯æˆ‘ä¼šæ˜¯æœ€åŠªåŠ›çš„.','æš‚æ— ','2009-08-11 06:15:03','2009-08-11 06:23:40'),(23,23,'å­¦ä¹ åŠªåŠ›ï¼Œå¯¹äººçƒ­æƒ…ã€å›¢ç»“ã€‚','æš‚æ— ','2009-08-12 00:38:13','2009-08-12 00:43:51'),(24,24,'æœ‰è´£ä»»å¿ƒ å·¥ä½œè®¤çœŸ ä¸ºäººäº²å’Œ','æš‚æ— ','2009-08-12 02:01:23','2009-08-12 02:08:22'),(25,25,'æš‚æ— ','æš‚æ— ','2009-08-12 04:06:54','2009-08-12 04:06:54'),(26,26,'åŠžäº‹å¹²è„†åˆ©è½è®¤çœŸä»”ç»†ï¼Œæœ‰å›¢é˜Ÿç²¾ç¥žï¼Œèƒ½åƒè‹¦','æš‚æ— ','2009-08-12 15:09:20','2009-08-12 15:13:16'),(27,27,'æš‚æ— ','æš‚æ— ','2009-08-13 06:24:09','2009-08-13 06:24:09'),(28,28,'æš‚æ— ','æš‚æ— ','2009-08-13 14:37:43','2009-08-13 14:37:43'),(29,29,'æš‚æ— ','æš‚æ— ','2009-08-15 10:13:36','2009-08-15 10:13:36'),(30,30,'æš‚æ— ','æš‚æ— ','2009-08-15 10:17:17','2009-08-15 10:17:17');
/*!40000 ALTER TABLE `summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,20,'Summary','2009-08-07 09:26:16'),(2,2,21,'Summary','2009-08-10 06:12:56'),(3,3,24,'Summary','2009-08-12 02:08:22');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'ç»˜ç”»ï¼Œæ²Ÿé€šï¼Œå”±æ­Œ'),(2,'è®¡ç®—æœº è‹±è¯­'),(3,'ç†Ÿç»ƒ è¿ç”¨ç”µè„‘å„ç§åŠžå…¬è½¯ä»¶ å¶å°”å¼¹å¼¹å‰ä»–');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `name` varchar(100) default '',
  `email` varchar(100) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(40) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activation_code` varchar(40) default NULL,
  `activated_at` datetime default NULL,
  `invitation_code` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','','admin@urc.com','650faf816827a8d7264400228e7cd49a232ae71d','aa462e398b76d7a39c37e242504de37b8a44dbc0','2009-07-06 05:56:22','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-06 05:56:24',NULL),(2,'wear','','wear63659220@gmail.com','efdfc0a3ce47f0f717f51566e4bdea2e0b4beadd','82b7e4eb1f6786e1b095eb630a566c3b50d66435','2009-07-06 06:05:38','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-06 06:06:06',NULL),(3,'yangjindong','','yangjindong@gmail.com','222070049b3d5de6f0d7b5dd912acd29827f3cab','f1aed2f6bde2b776b9368159d52025e85d4a0d24','2009-07-06 07:43:18','2009-07-30 09:02:08','fc2137d27e8d36314b26ec8e26d39280005d4a9b','2009-07-20 07:44:44',NULL,'2009-07-06 07:44:29',NULL),(4,'å‰ç±³å–µ','','jimimiao628@hotmail.com','42a6996e574a3d5255185f109029308b5b5f99e9','ab223a4a96aaebacdf168fb8544307282d32fa7f','2009-07-06 07:53:17','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-06 07:54:37',NULL),(5,'gfzh0930','','windygf@sohu.com','d70ea18cd19d78a40f2ffe94277f2ba9a6668c95','d1c51655cc845159ec6bd5015e369f66b5e315fa','2009-07-11 17:01:29','2009-07-30 09:02:08',NULL,NULL,'9cf8512a593e01eb28cca05f901297ae9c6dcdf0',NULL,NULL),(6,'liuwei0524','','liuwei0524@live.jp','19de90e3895bbcb324000f8077e45578715188f8','4c46d5a0fad986f905e686ab8800de283c50a927','2009-07-12 09:52:54','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-12 10:02:47',NULL),(7,'liyanhua66','','liyanhua.2001@126.com','bdb81b533cfa640db32eaa5e47aba6b144e2fd95','e7a3ff3af2d59aac586b5208f433643721c101bc','2009-07-12 10:41:54','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-12 10:43:03',NULL),(8,'hejianshu','','hejianshu1235@163.com','66e250ac7f75bc3dfcfe8481cfce3b9c61947b1e','3fd118328b5cdfc4be8dbb118ce5d967d9206c12','2009-07-12 13:49:21','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-12 13:51:53',NULL),(9,'651142001','','651142001@qq.com','f0f6ced28d02bf4af0274d219c3c294395794c3a','450184c5c979c639335a61cfdb83876a6b899e7c','2009-07-13 08:42:15','2009-07-30 09:02:08',NULL,NULL,'4c2e066f7658423cc955709601c9fc2fa42f22e1',NULL,NULL),(10,'hanxinli1026','','hanxinli1026@163.com','9a0f4968e77b4bc4330735c706dac301d5668f6b','54f900f9727428c89fe36cf7f6b2b3242aa19ab7','2009-07-14 14:13:58','2009-07-30 09:02:08',NULL,NULL,'67fb81cc1944e9043684dd79c0670c61ad357f33',NULL,NULL),(11,'sophia1200','','sophia12001200@yahoo.com.cn','601f7b6e05ba5752484f653158b2c266223c2f6e','b0b603452c98f0781b4a44021b4c8cb0d7d3e853','2009-07-15 02:16:28','2009-07-30 09:02:08',NULL,NULL,'f9863d630a55f51bbe7bd5d1e56aaa313dd91a4c',NULL,NULL),(12,'kiwiii','','kiwiii@126.com','01b98f96231670c536670543e126170abf5b9893','2fc8aadd11efc3cd9ca9695b1a272d4d0625c0d7','2009-07-15 03:43:08','2009-07-30 09:02:08','51e0f1a16854c7647ce87aa67af2ef5ceaf0b00c','2009-07-29 03:44:47',NULL,'2009-07-15 03:44:25',NULL),(13,'yoyowenz','','yoyowen_z@126.com','23b1543b7ce62b8122138443a0b3a618e84317f5','f2df205e1d7755be04a490a875698be16028ffcf','2009-07-15 15:05:25','2009-07-30 09:02:08','16bdc1aee8b4ca8844448f9896cb1ace3a3aceb6','2009-07-29 15:06:55',NULL,'2009-07-15 15:06:40',NULL),(14,'xieyefei','','xieyefei@126.com','f738e4cdca3e08f706b8f93431f8473dfc50095e','9e77a30da6e433d73d5ba5e1db2e803573bb8be4','2009-07-15 15:09:44','2009-07-30 09:02:08','2004d7925ea882b72c409e5398bd9580c8265607','2009-07-29 15:11:42',NULL,'2009-07-15 15:11:23',NULL),(15,'jl.zsq','','jl.zsq@163.com','69553564c160e047faf608293ea29e4de5bc2f39','f73e43a992d97c5ae193dddb9972395796707051','2009-07-16 02:58:29','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-16 03:03:00',NULL),(16,'870280176','','870280176@qq.com','7ed840e6c0f1f5e199c6991511cedcc3646ea18b','3c310ed335eb6833c852b056f723ff8d921e70e7','2009-07-16 12:10:12','2009-07-30 09:02:08',NULL,NULL,'8d0e7573b5f32418006e536b6a99c13326e766cb',NULL,NULL),(17,'climboy','','climboy@126.com','4a0b5462f86fb0cf9f44f7c7911587c1a496f5aa','938d25a146121a1adc002da4de62af8f49f8e629','2009-07-18 03:46:05','2009-07-30 09:02:08',NULL,NULL,NULL,'2009-07-18 03:47:06',NULL),(18,'ashgzs','','kjgv@qq.com','8e6a29ecd80ac33c2641cb986f03fb32f34c1bcd','9e95f4a8745b2b1a1f3ce94f4a1b0fbea9901b1c','2009-07-19 06:57:13','2009-07-30 09:02:08',NULL,NULL,'09127bb3521690516647731f82d4d19d9838d20a',NULL,NULL),(19,'æŸ³å¼„ç¢§','','735018716@qq.com','376aed35451db88e12c61cbdc2850c0eeae78cda','22531a9c8501e58e9af5416909bafb938add3d44','2009-07-20 04:50:23','2009-07-30 09:02:08',NULL,NULL,'2c7fb27bb149077b87311a73206d0dd3b44a84cc',NULL,NULL),(20,'anatasiayy','','anatasiayy@qq.com','8337ae7616b97c792575cba8a68fc10219c335ad','c869759554635f0710485742ec9082ca2e573dc4','2009-07-20 05:22:56','2009-07-30 09:02:08',NULL,NULL,'deeb4e8abe70eb1010fa6be324b5d4c3ba9427e0',NULL,NULL),(25,'wear2001','','wear21@hotmaf.com','7e2416c8bfe54296c66d8defbc39ff2c6513a0e2','41535089794fe9221a3a962a0a587ed622c666a8','2009-07-22 14:31:57','2009-07-30 09:02:08',NULL,NULL,'d53c175c4cc7093b4595f0acef5c005f33551e88',NULL,NULL),(28,'plutosatan','','wangsencn@126.com','73adf0b48e02f87187d2ad3db3a16d8ebdd246d6','487dee1428d332cd2fd9e66ae4c0251715428115','2009-07-23 05:54:56','2009-07-30 09:02:08',NULL,NULL,'791280bcaf0b2f8ba33a4c4bb360be55cb486168',NULL,NULL),(29,'wear22','','wear21@gmail.com','aa8db023c847cdd0a3ba5e6fe2b08beed720c632','09d3fcd153e30ec13c6c5e9a42a80c7fcc196d2d','2009-07-23 15:35:48','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(30,'sqmy','','sqmy0@163.com','18726bd26654702ea8d01c409dff646159c9ade3','b5ce5200dfcdc4b18fd62fa94095ef9a6fa1b629','2009-07-24 18:53:25','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(31,'06120282','','yuntao203@hotmail.com','34a3adf39011caa5d64de2030ab37fe435cce74d','35f9105475658ac2abd0300315c9b42d99f6d16e','2009-07-26 16:06:24','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(32,'we_chr','','helix.chenran@gmail.com','e3b5bbac50c682d5c7708ed96a23b6df70bf6d3a','6279e08e8b1ba68281c37ed53ea153051e25a9cc','2009-07-27 07:46:37','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(33,'larashi','','szycandy@163.com','0ec204774911b7bb2a4f6665809ef5a1bee81868','8ef673826098301ea359e2ce7f673cd3a58d1f1e','2009-07-27 08:51:14','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(34,'bailin','','baichenlin@sina.com','011d11eb97a3dc504cd3777db1e84156f1e14655','ca32e2f3ca5a5698c4dba9497b6062620d7e6f1f','2009-07-28 01:27:04','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(35,'20817630','','20817630@qq.com','8a508c20afe9115f9d471e18c30698587833917d','ac629fff3a06b817a1dca24b89f84b993c09c657','2009-07-28 10:42:11','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(36,'lizengshu','','lizengshu22@126.com','c1181cc009e30fdce1b723e1b5a7c4e5d8a92aca','46de0e55d7b37892cb03ed1b54517bebfb05547d','2009-07-29 03:41:14','2009-07-30 09:02:08',NULL,NULL,NULL,NULL,NULL),(37,'ä¼šä¼š','','huihui7187@126.com','5a9e2b20d67b2aea3cfd4fe3c8b8fe5b89d98136','57013a7d6f779316f1b3651886a699af5ef9b7a8','2009-08-02 03:14:25','2009-08-02 03:14:25',NULL,NULL,NULL,NULL,NULL),(38,'é’Ÿæµ·çª','','zhonghaiqi@qq.com','922ea81712528463d4925de51aa4e447ce6a7a8a','514e56da7631ab353dcd0fdbba8639b6be010920','2009-08-03 03:06:52','2009-08-03 03:06:52',NULL,NULL,NULL,NULL,NULL),(39,'zhangke2009','','banrenshou@126.com','1c6135f09cdb03f04d028c4d80c561aa2ba51496','da9809d2270db251368ae7b540657ced543ffb71','2009-08-03 10:58:45','2009-08-03 10:58:45',NULL,NULL,NULL,NULL,NULL),(40,'ekin','','ekin-ke@163.com','6780510cbfa0a9f8c09b38ef9dae5b5ff7aacc12','24d05663da66edfa49dcd62a3c786062017695ac','2009-08-03 13:04:57','2009-08-03 13:04:57',NULL,NULL,NULL,NULL,NULL),(41,'æ›¹çº³','','active2046@163.com','2e3a1a0ab1ffd90324a1827e31600caa3a8f12de','552c81e2f1bae99023f3e0e9086b83352202ef8b','2009-08-05 01:49:40','2009-08-05 01:49:40',NULL,NULL,NULL,NULL,NULL),(42,'zhouzhoulove','','zhouyan870704@126.com','223f8c678a8bec24cf05f206b5023efa29d51a9a','582d8bf579e41b765b2bc27963a958467d700bf1','2009-08-07 00:28:15','2009-08-07 00:28:15',NULL,NULL,NULL,NULL,NULL),(43,'åŸŽåŒ—å²¸','','290455530@qq.com','3989fb51e3c9e4c16e653dd07ec74fbb11777994','7c92dac780c66a1dd0373f7bc0601675e3bd2189','2009-08-07 09:19:27','2009-08-07 09:19:27',NULL,NULL,NULL,NULL,NULL),(44,'baiyunmonv','','baiyunmonv@163.com','de89d63116e8c6307c97b21174b5a593084542be','da358e2d29f2ffad6507570552f8ed606a1baebc','2009-08-07 14:44:08','2009-08-07 14:44:08',NULL,NULL,NULL,NULL,NULL),(45,'284713751','','liuleimind98@126.com','a63cf5e35b44222a242ca13bdb09d6a4a852be40','cba15387aa24ff1e343eec764dfeb3732a9f52da','2009-08-10 05:59:29','2009-08-10 05:59:29',NULL,NULL,NULL,NULL,NULL),(46,'wear21','','wear21@hotmail.com','ba1e383e4401ff49f98ae9856982112165a4544f','3a0a0b5fd73c4fdeb073080296d461f8c283577f','2009-08-10 07:40:06','2009-08-10 07:40:06',NULL,NULL,NULL,NULL,NULL),(47,'æŽç«‹å³°','','64552790@qq.com','07ff4800f32382b42c7db17928863485b8d35189','97c897229d3b2ae6934e33a3a2d12849b9410bd6','2009-08-11 06:13:36','2009-08-11 06:13:36',NULL,NULL,NULL,NULL,NULL),(48,'zhoudigua','','280355327@qq.com','814c472a81400e0a3adc475f7daf9afbfb58a4bf','24ef06f600b0394ec4a21b29b944235dac0c1625','2009-08-12 00:37:09','2009-08-12 00:37:09',NULL,NULL,NULL,NULL,NULL),(49,'é‚±ç£Š','','171085579@qq.com','f9b5d6c4b8784370c3f6f269fe89fc5ce7db86a9','c3a0baa56fedcbfc36b321a82bdcd05e910185b9','2009-08-12 01:50:48','2009-08-12 01:50:48',NULL,NULL,NULL,NULL,NULL),(50,'dwp1','','daidai_988@163.com','2b29f7e100e1512f93cdc11ba20d045f4dd36247','92010f81dfc28bffa70a592460f4ca55aacc080e','2009-08-12 04:01:53','2009-08-12 04:01:53',NULL,NULL,NULL,NULL,NULL),(51,'wangmengxue','','wangmengxue1988@163.com','b692df27265dabb49cae6f782f47e6fb001d115c','bb6c57ef5f9e5a20c752cfb62b188f8da6321031','2009-08-12 15:07:00','2009-08-12 15:07:00',NULL,NULL,NULL,NULL,NULL),(52,'æ”¹å˜è‡ªå·±','','t-jack111@163.com','95dda12466d0c1bc586dde49c0927b8eb2e322c9','cb4a837aad1857c2166bca7f1ec08d5e531663c7','2009-08-13 06:22:15','2009-08-13 06:22:15',NULL,NULL,NULL,NULL,NULL),(53,'masterjin10000','','xinshuo1314@tom.com','22b9b26d2ab78a77ac565f7a1b1387ee9146ff8e','33f7c3a9067dabccc39d147c88c23c5b60ad3273','2009-08-13 12:39:45','2009-08-13 12:39:45',NULL,NULL,NULL,NULL,NULL),(54,'rebeccawoo','','rebeccawoo1987@hotmail.com','feede65b2c8cf4e8f64514f16576ae0bac9d2630','6e18fab8819252c8a66e1df6f35c0205d93228b4','2009-08-13 14:36:30','2009-08-13 14:36:30',NULL,NULL,NULL,NULL,NULL),(55,'yytjx','','yytjx822@126.com','f606cbbf784a56428733570e36cb3eee0d9b616b','168aeadd8f94a1031aaf4405976f225dc1003e90','2009-08-15 10:12:11','2009-08-15 10:12:11',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2009-08-17  8:26:39
