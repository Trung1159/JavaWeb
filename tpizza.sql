-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: new_tpizza
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `id_staff` int DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `total_price` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `id_discount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_idx` (`id_client`),
  KEY `fk_staff_idx` (`id_staff`),
  KEY `fk_discount_idx` (`id_discount`),
  CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_discount` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id`),
  CONSTRAINT `fk_staff` FOREIGN KEY (`id_staff`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (41,14,NULL,'2023-05-06 16:37:43',110000,'PENDING','khachhang01@gmail.com','0123456789','HCM','khachhang01@gmail.com',NULL);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_bill` int NOT NULL,
  `id_product` int NOT NULL,
  `amount` int NOT NULL,
  `price` int NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_details_bill_idx` (`id_bill`),
  KEY `fk_bill_product_idx` (`id_product`),
  CONSTRAINT `fk_bill_details_bill` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_bill_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_details`
--

LOCK TABLES `bill_details` WRITE;
/*!40000 ALTER TABLE `bill_details` DISABLE KEYS */;
INSERT INTO `bill_details` VALUES (58,41,86,1,30000,30000),(59,41,87,2,40000,80000);
/*!40000 ALTER TABLE `bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `ban1` int DEFAULT NULL,
  `ban2` int DEFAULT NULL,
  `ban3` int DEFAULT NULL,
  `ban4` int DEFAULT NULL,
  `ban5` int DEFAULT NULL,
  `ban6` int DEFAULT NULL,
  `ban7` int DEFAULT NULL,
  `ban8` int DEFAULT NULL,
  `ban9` int DEFAULT NULL,
  `ban10` int DEFAULT NULL,
  `ban11` int DEFAULT NULL,
  `ban12` int DEFAULT NULL,
  `ban13` int DEFAULT NULL,
  `ban14` int DEFAULT NULL,
  `ban15` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ban2_fk_idx` (`ban2`),
  KEY `ban3_fk_idx` (`ban3`,`ban5`,`ban4`),
  KEY `ban4_fk_idx` (`ban4`),
  KEY `ban5_fk_idx` (`ban5`),
  KEY `ban6_fk_idx` (`ban6`),
  KEY `ban7_fk_idx` (`ban7`),
  KEY `ban8_fk_idx` (`ban8`),
  KEY `ban9_fk_idx` (`ban9`),
  KEY `ban10_fk_idx` (`ban10`),
  KEY `ban11_fk_idx` (`ban11`),
  KEY `ban12_fk_idx` (`ban12`),
  KEY `ban13_fk_idx` (`ban13`),
  KEY `ban14_fk_idx` (`ban14`),
  KEY `ban15_fk_idx` (`ban15`),
  KEY `ban1_timslot_idx` (`ban1`),
  CONSTRAINT `fk_ban1` FOREIGN KEY (`ban1`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban10` FOREIGN KEY (`ban10`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban11` FOREIGN KEY (`ban11`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban12` FOREIGN KEY (`ban12`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban13` FOREIGN KEY (`ban13`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban14` FOREIGN KEY (`ban14`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban15` FOREIGN KEY (`ban15`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban2` FOREIGN KEY (`ban2`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban3` FOREIGN KEY (`ban3`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban4` FOREIGN KEY (`ban4`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban5` FOREIGN KEY (`ban5`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban6` FOREIGN KEY (`ban6`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban7` FOREIGN KEY (`ban7`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban8` FOREIGN KEY (`ban8`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ban9` FOREIGN KEY (`ban9`) REFERENCES `time_slot` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (419,'2023-05-07 15:29:38',701,702,703,704,705,706,707,708,709,710,711,712,713,714,715),(420,'2023-05-08 15:29:41',801,802,803,804,805,806,807,808,809,810,811,812,813,814,815),(421,'2023-05-09 15:29:44',901,902,903,904,905,906,907,908,909,910,911,912,913,914,915),(422,'2023-05-10 15:29:47',1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015),(423,'2023-05-11 15:29:50',1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115),(424,'2023-05-12 15:29:53',1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215),(425,'2023-05-13 15:29:56',1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315),(426,'2023-05-14 15:29:59',1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415),(427,'2023-05-15 15:30:02',1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515),(428,'2023-05-16 15:30:05',1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615),(429,'2023-05-17 15:30:08',1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715),(430,'2023-05-18 15:30:11',1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815),(431,'2023-05-19 15:30:14',1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1912,1913,1914,1915),(432,'2023-05-20 15:30:17',2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015),(433,'2023-05-21 15:30:36',2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `short_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'MÓN KHAI VỊ','starter'),(2,'MÌ Ý','miy'),(3,'PIZZA','pizza'),(4,'SALADS','salads'),(5,'SOUPS','soups'),(6,'TRÁNG MIỆNG','trangmieng'),(7,'THỨC UỐNG','drink');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `content` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `rating` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_product_idx` (`id_product`),
  KEY `fk_comment_user_idx` (`id_user`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `percentage_reduction` int NOT NULL,
  `amount` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Giảm giá 50%',50,123,'2022-10-20','2022-10-25','Enable'),(2,'Giảm giá 20%',20,12,'2022-10-20','2022-10-29','Enable'),(3,'Giảm giá 10%',10,123,'2022-10-20','2022-10-22','Disable');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `price` int NOT NULL,
  `id_category` int NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cate-prod_idx` (`id_category`),
  CONSTRAINT `fk_cate` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (42,'Pizza Bánh Xèo Tôm Nhảy','Thổi bùng vị giác cùng sự kết hợp mới lạ đến từ hương vị bánh xèo truyền thống trên nền bánh pizza, hòa quyện xốt Mayonnaise, phô mai Mozzarella và nguyên liệu Tôm Nhảy cho khẩu vị cũng phải nhún nhảy từ lát bánh đầu tiên!',149000,3,13,'/images/products/Pizza_Banh_Xeo_Tom_Nhay_400x275.jpg'),(43,'Pizza Rau Củ (Xốt Bơ Tỏi)','Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị',79000,3,0,'/images/products/Pizza_Rau_Cu_400x275.jpg'),(44,'Pizza Gấp Đôi Nhân Phủ Hải Snar Xốt Pesto','',249000,3,15,'/images/products/Pizza_Gap_Doi_Nhan_Phu_Hai_San_Xot_Pesto_400x275.jpg'),(45,'Pizza Gấp Đôi Nhân Phủ Cơn Lốc Hải Sản','',249000,3,43,'/images/products/Pizza_Gap_Doi_Nhan_Phu_Con_Loc_Hai_San_400x275.jpg'),(46,'Pizza Gấp Đôi Nhân Phủ Hải Sản Xốt Tiêu Đen','',249000,3,26,'/images/products/Pizza_Gap_Doi_Nhan_Phu_Hai_San_Xot_Tieu_Den_400x275.jpg'),(47,'Mì Ý Thanh Cua','Mì Spaghetti, Xốt Phô Mai Cay, Thanh Cua, Cà Rốt, Đậu Pháp',49000,2,14,'/images/products/Mi_Y_Thanh_Cua_400x275.jpg'),(48,'Mì Ý Xông Khói Xốt Tiêu Đen','Mì Spaghetti, Xốt Tiêu Đen, Xốt Kem Nấm, Thịt Heo Xông Khói, Xúc Xích Gà, Bí Ngòi',49000,2,14,'/images/products/Mi_Y_Thit_Xong_Khoi_400x275.jpg'),(49,'Mì Ý Bò Bằm Xốt Cà Chua','Mì Ý Xốt Cà Chua Với Thịt Bò',120000,2,24,'/images/products/Mi_Y_Thit_Bam_Xot_Ca_Chua_400x275.jpg'),(53,'Aquafina 500ml','Aquafina 500ml',20000,7,0,'/images/products/drink/Aquafina_400x275.jpg'),(54,'Pepsi Lon 320ml','Pepsi Lon 320ml',30000,7,123,'/images/products/drink/Pepsi_Can_400x275.jpg'),(55,'7Up Can 320ml','7Up Can 320ml',30000,7,23,'/images/products/drink/7Up_Can_400x275.jpg'),(56,'Mirinda Orange Lon 320ml','Mirinda Orange Lon 320ml',30000,7,25,'/images/products/drink/Mirinda_Orange_Can_400x275.jpg'),(57,'Mirinda 1.5L','Mirinda Chai 1.5L',42000,7,14,'/images/products/drink/Mirinda_1lit5_400x275.jpg'),(58,'Bruschetta','Bánh mì nướng với tỏi, phủ dầu ô liu và muối.',115000,1,115,'/images/products/starter/bruschetta.jpg'),(59,'Cheese bombs','Bột bánh quy bọc quanh Phô mai Cheddar cà chua húng quế phết bơ tỏi Ý, nướng hoàn hảo trong chảo gang và ăn kèm với marinara để chấm',79000,1,65,'/images/products/starter/Italian-Cheese-Bombs.jpg'),(60,'Rice balls','Cơm nắm có nước sốt thịt và nhân phô mai mozzarella và lớp vỏ bánh mì giòn',45000,1,100,'/images/products/starter/italian-rice-balls.jpg'),(74,'Neapolitan','Hỗn hợp từ cà chua và phô mai mozzarella.',149000,3,90,'/images/products/pizza/naepolitan.jpg'),(75,'Pepperoni','Hỗn hợp thịt lợn và thịt bò ướp với Paprika hoặc các loại bột ớt khác.',179000,3,30,'/images/products/pizza/pepperoni.jpg'),(76,'Sicilian','Hình vuông, với nước sốt, bột và pho mát, vụn bánh mì, hành tây, cà chua và cá cơm.',210000,3,15,'/images/products/pizza/sicilian.jpg'),(77,'Caesar','Gồm rau diếp romaine và bánh mì nướng với nước cốt chanh, dầu ô liu, trứng, sốt Worrouershire, cá cơm, tỏi, mù tạt Dijon, pho mát Parmesan và tiêu đen',80000,4,70,'/images/products/salads/Caesar.jpg'),(78,'Chef','Gồm trứng luộc chín, một hoặc nhiều loại thịt, cà chua, dưa chuột và pho mát, tất cả được đặt trên một luống rau diếp hoặc các loại rau ăn lá khác.',90000,4,55,'/images/products/salads/chef.jpeg'),(79,'Spinach','Đơn giản với trái cây, các loại hạt và pho mát hoàn hảo như một món ăn nhanh vào bất kỳ ngày nào trong tuần.',70000,4,60,'/images/products/salads/spinach.jpg'),(80,'Minestrone','Bao gồm đậu, hành tây, cần tây, cà rốt, nước dùng và cà chua. Thường có thêm mì ống hoặc cơm',109000,5,100,'/images/products/soups/minestrone.jpg'),(81,'Pappa al pomodoro','Được chế biến với cà chua tươi, bánh mì, dầu ô liu, tỏi, húng quế và nhiều nguyên liệu tươi khác',69000,5,80,'/images/products/soups/pappaalpomodoro.jpg'),(82,'Ribollita','Gồm bánh mì còn sót lại, đậu cannellini và các loại rau theo mùa như cải xoăn, hành tây, cà rốt và bắp cải. Đây là một món ăn đặc trưng của mùa đông, và một trong những thành phần chính của nó, cải xoăn Tuscan, chỉ có vào mùa đông',209000,5,40,'/images/products/soups/ribollita.jpeg'),(83,'Zuppa toscana','Làm từ xúc xích Ý, ớt đỏ nghiền, hành trắng thái hạt lựu, thịt xông khói, tỏi xay nhuyễn, nước dùng gà, kem nặng và khoai tây',179000,5,30,'/images/products/soups/zuppatoscana.jpg'),(84,'Brownie','Bánh nướng vị chocolate bao gồm các loại hạt, phủ sương, kem phô mai, chocolate chip hoặc các thành phần khác.',35000,6,150,'/images/products/trangmieng/brownie.jpg'),(85,'Cannoli','Bánh ngọt bao gồm vỏ hình ống bằng bột bánh ngọt chiên, nhân đầy kem ngọt có chứa ricotta',45000,6,80,'/images/products/trangmieng/cannoli.jpg'),(86,'Profiteroles','Bánh phồng nhân kem thường được phủ thêm lớp chocolate',30000,6,200,'/images/products/trangmieng/Profiteroles.jpg'),(87,'Tiramisu','Các lớp bánh quy Savoiardi,  nhúng cà phê xen kẽ với hỗn hợp trứng, đường, phô mai mascarpone đánh bông, thêm một ít bột cacao.',40000,6,110,'/images/products/trangmieng/tiramisu.jpg'),(90,'test san pham','san pham test',35000,1,10,'/images/products/starter/sptes.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_api`
--

DROP TABLE IF EXISTS `test_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_api` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_api`
--

LOCK TABLES `test_api` WRITE;
/*!40000 ALTER TABLE `test_api` DISABLE KEYS */;
INSERT INTO `test_api` VALUES (1,'duy tan'),(2,'kiem tra'),(3,'hoc mon toan'),(4,'hoc mon van'),(5,'hoc mon ly'),(6,'hoc mon hoa');
/*!40000 ALTER TABLE `test_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `morning` tinyint(1) NOT NULL DEFAULT '0',
  `noon` tinyint(1) NOT NULL DEFAULT '0',
  `afternoon` tinyint(1) NOT NULL DEFAULT '0',
  `date_tbname` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3926 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES (701,0,0,0,7),(702,1,0,1,7),(703,0,0,0,7),(704,0,1,0,7),(705,1,0,0,7),(706,1,1,1,7),(707,0,0,0,7),(708,1,0,0,7),(709,1,0,0,7),(710,0,1,0,7),(711,0,0,0,7),(712,1,0,0,7),(713,1,0,0,7),(714,1,0,0,7),(715,0,0,0,7),(801,0,0,0,8),(802,0,0,0,8),(803,0,0,0,8),(804,0,0,0,8),(805,0,0,0,8),(806,0,0,0,8),(807,0,0,0,8),(808,0,0,0,8),(809,0,0,0,8),(810,0,0,0,8),(811,0,0,0,8),(812,0,0,0,8),(813,0,0,0,8),(814,0,0,0,8),(815,0,0,0,8),(901,0,0,0,9),(902,0,0,0,9),(903,0,0,0,9),(904,0,0,0,9),(905,0,0,0,9),(906,0,0,0,9),(907,0,0,0,9),(908,0,0,0,9),(909,0,0,0,9),(910,0,0,0,9),(911,0,0,0,9),(912,0,0,0,9),(913,0,0,0,9),(914,0,0,0,9),(915,0,0,0,9),(1001,0,0,0,10),(1002,0,0,0,10),(1003,0,0,0,10),(1004,0,0,0,10),(1005,0,0,0,10),(1006,0,0,0,10),(1007,0,0,0,10),(1008,0,0,0,10),(1009,0,0,0,10),(1010,0,0,0,10),(1011,0,0,0,10),(1012,0,0,0,10),(1013,0,0,0,10),(1014,0,0,0,10),(1015,0,0,0,10),(1101,0,0,0,11),(1102,0,0,0,11),(1103,0,0,0,11),(1104,0,0,0,11),(1105,0,0,0,11),(1106,0,0,0,11),(1107,0,0,0,11),(1108,0,0,0,11),(1109,0,0,0,11),(1110,0,0,0,11),(1111,0,0,0,11),(1112,0,0,0,11),(1113,0,0,0,11),(1114,0,0,0,11),(1115,0,0,0,11),(1201,0,0,0,12),(1202,0,0,0,12),(1203,0,0,0,12),(1204,0,0,0,12),(1205,0,0,0,12),(1206,0,0,0,12),(1207,0,0,0,12),(1208,0,0,0,12),(1209,0,0,0,12),(1210,0,0,0,12),(1211,0,0,0,12),(1212,0,0,0,12),(1213,0,0,0,12),(1214,0,0,0,12),(1215,0,0,0,12),(1301,0,0,0,13),(1302,0,0,0,13),(1303,0,0,0,13),(1304,0,0,0,13),(1305,0,0,0,13),(1306,0,0,0,13),(1307,0,0,0,13),(1308,0,0,0,13),(1309,0,0,0,13),(1310,0,0,0,13),(1311,0,0,0,13),(1312,0,0,0,13),(1313,0,0,0,13),(1314,0,0,0,13),(1315,0,0,0,13),(1401,0,0,0,14),(1402,0,0,0,14),(1403,0,0,0,14),(1404,0,0,0,14),(1405,0,0,0,14),(1406,0,0,0,14),(1407,0,0,0,14),(1408,0,0,0,14),(1409,0,0,0,14),(1410,0,0,0,14),(1411,0,0,0,14),(1412,0,0,0,14),(1413,0,0,0,14),(1414,0,0,0,14),(1415,0,0,0,14),(1501,0,0,0,15),(1502,0,0,0,15),(1503,0,0,0,15),(1504,0,0,0,15),(1505,0,0,0,15),(1506,0,0,0,15),(1507,0,0,0,15),(1508,0,0,0,15),(1509,0,0,0,15),(1510,0,0,0,15),(1511,0,0,0,15),(1512,0,0,0,15),(1513,0,0,0,15),(1514,0,0,0,15),(1515,0,0,0,15),(1601,0,0,0,16),(1602,0,0,0,16),(1603,0,0,0,16),(1604,0,0,0,16),(1605,0,0,0,16),(1606,0,0,0,16),(1607,0,0,0,16),(1608,0,0,0,16),(1609,0,0,0,16),(1610,0,0,0,16),(1611,0,0,0,16),(1612,0,0,0,16),(1613,0,0,0,16),(1614,0,0,0,16),(1615,0,0,0,16),(1701,0,0,0,17),(1702,0,0,0,17),(1703,0,0,0,17),(1704,0,0,0,17),(1705,0,0,0,17),(1706,0,0,0,17),(1707,0,0,0,17),(1708,0,0,0,17),(1709,0,0,0,17),(1710,0,0,0,17),(1711,0,0,0,17),(1712,0,0,0,17),(1713,0,0,0,17),(1714,0,0,0,17),(1715,0,0,0,17),(1801,0,0,0,18),(1802,0,0,0,18),(1803,0,0,0,18),(1804,0,0,0,18),(1805,0,0,0,18),(1806,0,0,0,18),(1807,0,0,0,18),(1808,0,0,0,18),(1809,0,0,0,18),(1810,0,0,0,18),(1811,0,0,0,18),(1812,0,0,0,18),(1813,0,0,0,18),(1814,0,0,0,18),(1815,0,0,0,18),(1901,0,0,0,19),(1902,0,0,0,19),(1903,0,0,0,19),(1904,0,0,0,19),(1905,0,0,0,19),(1906,0,0,0,19),(1907,0,0,0,19),(1908,0,0,0,19),(1909,0,0,0,19),(1910,0,0,0,19),(1911,0,0,0,19),(1912,0,0,0,19),(1913,0,0,0,19),(1914,0,0,0,19),(1915,0,0,0,19),(2001,0,0,0,20),(2002,0,0,0,20),(2003,0,0,0,20),(2004,0,0,0,20),(2005,0,0,0,20),(2006,0,0,0,20),(2007,0,0,0,20),(2008,0,0,0,20),(2009,0,0,0,20),(2010,0,0,0,20),(2011,0,0,0,20),(2012,0,0,0,20),(2013,0,0,0,20),(2014,0,0,0,20),(2015,0,0,0,20),(2101,0,0,0,21),(2102,0,0,0,21),(2103,0,0,0,21),(2104,0,0,0,21),(2105,0,0,0,21),(2106,0,0,0,21),(2107,0,0,0,21),(2108,0,0,0,21),(2109,0,0,0,21),(2110,0,0,0,21),(2111,0,0,0,21),(2112,0,0,0,21),(2113,0,0,0,21),(2114,0,0,0,21),(2115,0,0,0,21);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (14,'kh01','$2a$10$iAgBym2gePmdOg9rEpIqreyN.wYfmlrAtDzMXkDkBsW4DMA8D.7xK','khachhang01@gmail.com',NULL,NULL,'ROLE_USER',NULL),(15,'admin','$2a$10$vV2Pc9iBAh363MK7EXKQC.ZC28DVVc.EOxbqU9XmfuK1eEepAyBw2','admin@gmail.com','','','ROLE_ADMIN',NULL);
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

-- Dump completed on 2023-05-06 16:44:10
