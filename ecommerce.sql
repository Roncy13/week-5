-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(19,4) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `picture` text NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total_price` decimal(19,4) DEFAULT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'NIKE'),(2,'ADIDAS'),(3,'WORLD BALANCE');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured`
--

DROP TABLE IF EXISTS `featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `featured_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured`
--

LOCK TABLES `featured` WRITE;
/*!40000 ALTER TABLE `featured` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `gender` varchar(1) NOT NULL,
  `description` varchar(10) NOT NULL,
  PRIMARY KEY (`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES ('F','FEMALE'),('M','MALE'),('U','UNISEX');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `info` varchar(200) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inventory` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `gender` (`gender`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Qui in quam.','9195216176173','Lorem ipsum, dolor sit amet consectetur adipisicin','F',2,466.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(2,'Nihil quod.','2623904911869','Lorem ipsum, dolor sit amet consectetur adipisicin','F',2,406.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(3,'Dicta illo sit.','1436025626885','Lorem ipsum, dolor sit amet consectetur adipisicin','F',2,362.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(4,'Exercitationem consectetur aut.','0773685207957','Lorem ipsum, dolor sit amet consectetur adipisicin','U',3,6879.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(5,'Necessitatibus omnis.','6898126446123','Lorem ipsum, dolor sit amet consectetur adipisicin',NULL,NULL,76.0000,'2019-05-20 20:37:17','2019-08-23 10:33:07',0.0000,1),(6,'Et numquam unde.','5679966664523','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,30.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(7,'Beatae fugit voluptates.','1847149377872','Lorem ipsum, dolor sit amet consectetur adipisicin',NULL,NULL,9353.0000,'2019-05-20 20:37:17','2019-08-23 10:33:07',0.0000,1),(8,'Possimus consequatur quod.','5203106953378','Lorem ipsum, dolor sit amet consectetur adipisicin','U',3,859.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(9,'Soluta quo.','4709309076377','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,85.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(10,'Dolore labore.','2590429453917','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,96.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(11,'Dolorem hic.','6243106162454','Lorem ipsum, dolor sit amet consectetur adipisicin','U',3,4529.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(12,'Beatae ipsa.','8381118398725','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,37.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(13,'Hic consequatur sunt.','8358463940893','Lorem ipsum, dolor sit amet consectetur adipisicin',NULL,NULL,2827.0000,'2019-05-20 20:37:17','2019-08-23 10:33:07',0.0000,1),(14,'Eos eos est.','1722315601886','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,81.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(15,'Ut voluptatum.','4874267237495','Lorem ipsum, dolor sit amet consectetur adipisicin',NULL,NULL,6495.0000,'2019-05-20 20:37:17','2019-08-23 10:33:07',0.0000,1),(16,'Commodi quae.','7307964630735','Lorem ipsum, dolor sit amet consectetur adipisicin','U',3,1523.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(17,'Consequatur ipsum.','5646305194614','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,10.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(18,'Ad ratione totam.','0813974340955','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,52.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1),(19,'Eum quo et.','9721181664157','Lorem ipsum, dolor sit amet consectetur adipisicin',NULL,NULL,2577.0000,'2019-05-20 20:37:17','2019-08-23 10:33:07',0.0000,1),(20,'Natus est.','1733878953886','Lorem ipsum, dolor sit amet consectetur adipisicin','M',1,63.0000,'2019-05-20 20:37:17','2019-05-20 20:37:17',0.0000,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,1,'82c905ff7335b8852ecb42f58ae0845562878d39',1,'2019-05-24 19:57:04');
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'benedict56@hotmail.com','Voluptas praesentium eligendi placeat.','1995-01-01','M','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',1,'2019-05-20 20:37:14','2019-05-20 20:37:14'),(2,'mossie.jenkins@gmail.com','Ut error et.','1995-01-01','M','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',2,'2019-05-20 20:37:14','2019-05-20 20:37:14');
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

-- Dump completed on 2019-08-23 10:43:55
