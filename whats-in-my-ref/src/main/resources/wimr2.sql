-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: wimr
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `viewcount` int DEFAULT '0',
  `likes` int DEFAULT '0',
  `created_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_comment`
--

DROP TABLE IF EXISTS `board_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_comment` (
  `bno` int NOT NULL,
  `cmtno` int NOT NULL AUTO_INCREMENT,
  `time` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmtno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_comment`
--

LOCK TABLES `board_comment` WRITE;
/*!40000 ALTER TABLE `board_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_img`
--

DROP TABLE IF EXISTS `manual_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_img` (
  `recipe_recipeno` int NOT NULL,
  `manual_img` varchar(255) DEFAULT NULL,
  `manual_img_key` varchar(255) NOT NULL,
  PRIMARY KEY (`recipe_recipeno`,`manual_img_key`),
  CONSTRAINT `FKaa1dxv7fbprs5cd651m2g0an7` FOREIGN KEY (`recipe_recipeno`) REFERENCES `recipe` (`recipeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_img`
--

LOCK TABLES `manual_img` WRITE;
/*!40000 ALTER TABLE `manual_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_no` int NOT NULL AUTO_INCREMENT,
  `member_email` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `member_nick` varchar(255) NOT NULL,
  `member_pw` varchar(255) NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberCmt`
--

DROP TABLE IF EXISTS `memberCmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberCmt` (
  `cmtno` int NOT NULL AUTO_INCREMENT,
  `bno` int DEFAULT NULL,
  `comment` text,
  `nickname` varchar(10) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmtno`),
  CONSTRAINT `membercmt_ibfk_1` FOREIGN KEY (`cmtno`) REFERENCES `board` (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberCmt`
--

LOCK TABLES `memberCmt` WRITE;
/*!40000 ALTER TABLE `memberCmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberCmt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipeno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `nickname` varchar(10) NOT NULL DEFAULT 'aapl',
  `ingredient` varchar(300) DEFAULT NULL,
  `nutrition` varchar(300) DEFAULT NULL,
  `content` text,
  `likes` int DEFAULT '0',
  `calories` varchar(255) DEFAULT NULL,
  `carbohydrates` varchar(255) DEFAULT NULL,
  `fat` varchar(255) DEFAULT NULL,
  `ingredients` tinytext,
  `protein` varchar(255) DEFAULT NULL,
  `reduction_tip` varchar(255) DEFAULT NULL,
  `sodium` varchar(255) DEFAULT NULL,
  `likecount` int NOT NULL DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recipeno`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'새우 두부 계란찜','aapl','새우두부계란찜\n연두부 75g(3/4모), 칵테일새우 20g(5마리), 달걀 30g(1/2개), 생크림 13g(1큰술), 설탕 5g(1작은술), 무염버터 5g(1작은술)\n고명\n시금치 10g(3줄기)',NULL,NULL,0,'220','3','17',NULL,'14',NULL,'99',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00028_2.png'),(2,'부추 콩가루 찜','aapl','[1인분]조선부추 50g, 날콩가루 7g(1⅓작은술)\n·양념장 : 저염간장 3g(2/3작은술), 다진 대파 5g(1작은술), 다진 마늘 2g(1/2쪽), 고춧가루 2g(1/3작은술), 요리당 2g(1/3작은술), 참기름 2g(1/3작은술), 참깨 약간',NULL,NULL,0,'215','20','9',NULL,'14',NULL,'240',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00029_2.png'),(3,'방울토마토 소박이','aapl','●방울토마토 소박이 : \n방울토마토 150g(5개), 양파 10g(3×1cm), 부추 10g(5줄기)\n●양념장 : \n고춧가루 4g(1작은술), 멸치액젓 3g(2/3작은술), 다진 마늘 2.5g(1/2쪽), 매실액 2g(1/3작은술), 설탕 2g(1/3작은술), 물 2ml(1/3작은술), 통깨 약간',NULL,NULL,0,'45','9','1',NULL,'2',NULL,'277',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00031_2.png'),(4,'순두부 사과 소스 오이무침','aapl','●오이무침 :\n오이 70g(1/3개), 다진 땅콩 10g(1큰술)\n●순두부사과 소스 : \n순두부 40g(1/8봉지), 사과 50g(1/3개)',NULL,NULL,0,'75','10','2',NULL,'4',NULL,'22',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00032_2.png'),(5,'사과 새우 북엇국','aapl','북엇국\n북어채 25g(15개), 새우 10g(3마리), 사과 30g(1/5개), 양파 40g(1/4개),\n표고버섯 20g(2장), 물 300ml(1½컵)',NULL,NULL,0,'65','2','1',NULL,'12',NULL,'78',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00033_2.png'),(6,'저염 된장으로 맛을 낸 황태해장국','aapl','황태해장국\n황태(채) 15g(10개), 콩나물 30g(1/6봉지), 무 30g(5×3×2cm), 저염된장 10g(2작은술), 물 300ml(1½컵), 청양고추 5g(1/2개), 다진 마늘 2g(1/3작은술)',NULL,NULL,0,'100','12','0',NULL,'13',NULL,'361',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00036_2.png'),(7,'된장국','aapl','된장국\n두부 20g(2×2×2cm), 애느타리버섯 20g(4가닥), 감자 10g(4×3×1cm), 양파 10g(2×1cm), 대파 10g(5cm), 된장 5g(1작은술), 물 300ml(1½컵)',NULL,NULL,0,'20','3','0',NULL,'2',NULL,'260',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00037_2.png'),(8,'표고버섯 청경채국','aapl','●멸치육수 : 국물용 멸치 5g(3마리), 다시마 1장(5×1cm), 양파 10g(2×1cm), 표고버섯 기둥, 국간장 5g(1작은술), 물 300ml(1½컵)\n●채소준비 : 청경채 20g(1개), 표고버섯 20g(2장), 다진 마늘 2g(1/3작은술)',NULL,NULL,0,'45','7','1',NULL,'2',NULL,'2441',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00038_2.png'),(9,'치커리샐러드와 올리브 마늘 소스','aapl','●치커리 샐러드 : 치커리 30g(10줄기), 적양배추 15g(5×3cm), 양파 10g(2×1cm), 당근 5g(3×1×1cm)\n●올리브마늘 드레싱 : 올리브유 10g(2작은술), 식초 5g(1작은술), 설탕 5g(1작은술), 마늘 5g(1쪽)',NULL,NULL,0,'170','13','12',NULL,'3',NULL,'74',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00095_2.png'),(10,'스트로베리 샐러드','aapl','스트로베리 샐러드\n딸기 70g(7개), 플레인요거트 85g(1개), 양상추 70g(2장), 메추리알 30g(3개), 블루베리 15g(1큰술), 식초 약간, 소금 약간',NULL,NULL,0,'195','30','5',NULL,'7',NULL,'138',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00087_2.png'),(11,'시금치 우유 소스와 그린매쉬드포테이토','aapl','●그린매쉬드포테이토 : 감자 80g(1/2개), 시금치우유 소스 5g(1작은술), 아몬드 2g(1알), 설탕 2g(1/3작은술), 크랜베리 3g, 치커리 약간\n●시금치우유 소스 : 시금치 10g, 우유 10g(2작은술)',NULL,NULL,0,'155','32','1',NULL,'5',NULL,'24',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00089_2.png'),(12,'버섯구이와 두부타르타르 소스','aapl','●버섯구이 : 새송이버섯 70g(7개), 올리브유 10g(2작은술)\n●곁들임 : 치커리 10g(3줄기)\n●두부타르타르 소스 : 연두부 30g(1/4모), 다진 양파 10g(2작은술), 다진 오이피클 10g(2작은술), 올리브유 2g(1/3작은술), 식초 5g(1작은술), 레몬즙 3g(2/3작은술), 머스터드 3g(2/3작은술), 꿀 2g(1/3작은술), 흰 후추 약간',NULL,NULL,0,'150','18','5',NULL,'8',NULL,'133',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00091_2.png'),(13,'구운채소와 간장레몬 소스','aapl','●구운채소 : 가지 20g(3cm), 호박 50g(1/3개), 새송이버섯 15g(3개), 양파 15g(1/8개), 발사믹크레마 15g(1큰술), 빨강 파프리카 3g(3×1cm), 노랑 파프리카 3g(3×1cm), 청피망 3g(3×1cm), 올리브유 약간\n●간장 레몬 소스 : 저염간장 5g(1작은술), 식초 15g(1큰술), 설탕 10g(1큰술), 레몬즙 5g(1작은술)',NULL,NULL,0,'175','19','9',NULL,'4',NULL,'38',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00093_2.png'),(14,'브로콜리 컬리플라워 샐러드와 두유 요거트 소스','aapl','●브로콜리컬리플라워 샐러드 : 브로콜리 40g(1/5송이), 컬리플라워 40g(1/3송이), 적양파 10g(2×1cm), 강낭콩 5g(1작은술), 건포도 5알, 호두 1/2알, 소금 약간\n●두유요거트 소스 : 두유 50g(3⅓큰술), 플레인요거트 20g(1⅓큰술), 레몬즙 5g(1작은술), 설탕 약간',NULL,NULL,0,'210','30','6',NULL,'9',NULL,'79',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00094_2.png'),(15,'오렌지와 당근 만남주스','aapl','오렌지 당근펀치\n당근 100g(1/2개), 오렌지 100g(1/2개)',NULL,NULL,0,'60','14','0',NULL,'1',NULL,'76',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00108_1.png'),(16,'칠곡석류국수','aapl','●주재료 : 소면 160g, 저염소금 4g(1작은술), 식초 8g(1/2작은술)\n●소스 : 석류 200g(1/2개)\n●장식 : 잣 4g(1작은술), 아몬드 4g(1작은술), 해바라기씨 4g(1작은술), 호두 4g(1작은술), 호박씨 4g(1작은술), 오이 20g(1/4개)',NULL,NULL,0,'73.4','12.7','1.6',NULL,'2.1',NULL,'12.5',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00111_2.png'),(17,'블랙빈 곤약국수','aapl','●주재료\n실곤약 440g, 검은콩 70g, 볶은 흑임자 6g(1작은술), 호두 6g(1알)\n●장식\n오이 20g(1/8개), 토마토 50g(1/2개), 달걀 50g(1개)',NULL,NULL,0,'54.3','4.9','2.4',NULL,'3.4',NULL,'18.5',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00113_2.png'),(18,'닭가슴살 브로콜리 만두','aapl','주재료\n만두피 4g(2장), 브로콜리 100g(1/4개), 숙주 100g, 표고버섯 20g(2개), 닭 가슴살 100g, 참기름 2g(1/2작은술), 저염간장 4g(1작은술), 소금 0.5g, 후춧가루 0.1g',NULL,NULL,0,'123.2','19','1.5',NULL,'8.4',NULL,'167.9',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00114_2.png'),(19,'함초 냉이 국수','aapl','●주재료 : 소면 50g\n●육수 : 함초 3g(1/2작은술), 노루궁뎅이버섯 25g(1/2개), 다시마 17g(15cm), 파 140g(1/2개), 양파 150g(1/2개), 무 250g(1/3개), 모시조개 150g(3/4컵), 냉이 35g, 간장 30g(2큰술)\n●장식 : 달걀 50g(1개), 청고추 20g(1개), 실고추 2g',NULL,NULL,0,'35.8','7.1','0',NULL,'1.8',NULL,'34.5',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00131_2.png'),(20,'된장 두부찌개','aapl','두부 320g(1모), 쌀뜨물 300g(1½컵), 돼지고기 100g, 김치 140g, 된장 20g(1½큰술), 청양고추 10g(1/2개), 홍고추 5g(1/4개),\n대파 10g(2cm), 고춧가루 5g(1작은술)',NULL,NULL,0,'77.3','2.4','4.2',NULL,'7.5',NULL,'124.6',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00137_2.png'),(21,'부대된장찌개','aapl','다시마 1g, 두부 10g, 떡국 떡 10g, 스팸(마일드) 10g, 다진 마늘 5g, 무 20g, 김치 15g, 소시지 10g(1/2개), 우민찌 5g(1작은술), 양파 5g, 저염된장 15g(1큰술), 베이컨 5g, 대파 5g, 청양고추 5g, 홍고추 1g',NULL,NULL,0,'72.6','4.2','3.9',NULL,'5.3',NULL,'191.9',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00138_2.png'),(22,'양배추감자전','aapl','●주재료 : 감자 100g(1개), 양배추 150g(1/2개), 당근 15g(1/10개), 두부 20g(1/20모), 돼지고기 30g, 청양고추 5g(1개), 부침가루 45g(3큰술), 달걀 60g(1개), 식용유 15g(1큰술)\n●소스 : 오렌지즙 15g(1큰술), 간장 2g(1/2작은술), 식초 10g(2작은술)',NULL,NULL,0,'148.9','14.7','6.6',NULL,'7.7',NULL,'107.1',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00181_2.png'),(23,'돌나물 샐러드','aapl','●돌나물 샐러드 : 돌나물 90g, 미니새송이버섯 60g(7개), 참기름 약간\n●레몬마요네즈 소스 : 마요네즈 10g(2작은술), 레몬즙 20g(1⅓큰술), 청양고추 5g(1/2개), 홍고추 5g(1/2개), 참기름 약간',NULL,NULL,0,'235','2','24',NULL,'3',NULL,'151',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00074_2.png'),(24,'석류 보쌈김치','aapl','●주재료 : 배추 70g(1/10개), 석류즙 10g(2작은술), 소금 5g(1/2작은술)\n●양념 : 무 10g(3cm), 미나리 10g, 쪽파 10g(1개), 다진 마늘 5g(1작은술), 다진 생강 5g(1작은술), 새우젓국 15g(1큰술)',NULL,NULL,0,'24.5','4.7','0',NULL,'1.4',NULL,'171.3',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00159_2.png'),(25,'유자 대구조림','aapl','●주재료 : 대구살 120g, 홍파프리카 10g(1/10개), 황파프리카 10g(1/10개),청파프리카 10g(1/10개), 황금팽이버섯 10g, 미나리 20g, 밀가루 25g(2큰술)\n●소스 : 유자청 20g(1⅓큰술), 발사믹식초 10g(2작은술), 화이트와인 10g(2작은술)\n●장식 : 대파 30g(1개)',NULL,NULL,0,'84','10.6','0.4',NULL,'9.6',NULL,'109.7',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00161_2.png'),(26,'파프리카 물김치','aapl','●주재료 : 자색고구마 10g(3cm), 무 10g(2cm), 배 80g(1/4개), 배추 200g(1/3개), 부추 10g, 사과 80g(1/3개), 쪽파 10g(10cm), 소금 20g(1⅓큰술)\n●양념 : 멥쌀 10g(2작은술), 물엿 50g(1/4컵), 황파프리카 140g(1½개)',NULL,NULL,0,'44.9','10.1','0',NULL,'1.1',NULL,'272',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00162_2.png'),(27,'고추장 라따뚜이','aapl','●주재료 : 애호박 70g(1½개), 양송이버섯 60g(3개), 가지 70g(1/2개), 저염살라미 25g, 사과 60g(1/3개)\n●소스 :양파 40g(1/5개), 마늘 10g(2개), 토마토 600g(3개), 설탕 10g(2작은술), 바질 50g, 고추장 15g(1큰술)',NULL,NULL,0,'62.6','7.6','2.2',NULL,'3.1',NULL,'138.5',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00193_2.png'),(28,'민들레 샐러드','aapl','●주재료 : 민들레 잎 40g, 비트 5g(1작은술), 오렌지(껍질) 40g(1/5개)\n●드레싱 : 간장 20g(1⅓큰술), 다진 홍고추 10g(1개), 레몬즙 60g(4큰술), 설탕 6g(1작은술)',NULL,NULL,0,'53.9','10.9','0',NULL,'2.4',NULL,'874.2',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00201_2.png'),(29,'토마토 가지 카프레제','aapl','●주재료 : 가지 100g(1개), 토마토 200g(1½개), 무순 20g, 마늘 10g(2개), 올리브오일 5g(1작은술)\n●드레싱 : 올리브오일 25g(2큰술), 발사믹식초 60g(4큰술), 후춧가루 2g(1/2작은술)',NULL,NULL,0,'90.5','7.4','6.2',NULL,'1.2',NULL,'11.3',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00202_2.png'),(30,'우렁된장소스 배추롤','aapl','돼지고기(50g), 배춧잎(5장), 부추(30g), 쌀(100g), 당근(20g),\n표고버섯(2개), 양파(50g), 애호박(1/2개), 우렁이(100g),\n된장(30g)',NULL,NULL,0,'326.3','43','7.2',NULL,'22.3',NULL,'976',0,'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00636_2.png');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_comment`
--

DROP TABLE IF EXISTS `recipe_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_comment` (
  `cmtno` int NOT NULL AUTO_INCREMENT,
  `rno` int NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmtno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_comment`
--

LOCK TABLES `recipe_comment` WRITE;
/*!40000 ALTER TABLE `recipe_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_manual`
--

DROP TABLE IF EXISTS `recipe_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_manual` (
  `recipe_recipeno` int NOT NULL,
  `manual` varchar(255) DEFAULT NULL,
  `manual_key` varchar(255) NOT NULL,
  PRIMARY KEY (`recipe_recipeno`,`manual_key`),
  CONSTRAINT `FK6dhnofr1ugdequ704yjxea8ya` FOREIGN KEY (`recipe_recipeno`) REFERENCES `recipe` (`recipeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_manual`
--

LOCK TABLES `recipe_manual` WRITE;
/*!40000 ALTER TABLE `recipe_manual` DISABLE KEYS */;
INSERT INTO `recipe_manual` VALUES (1,'1. 손질된 새우를 끓는 물에 데쳐 건진다.a','MANUAL01'),(1,'2. 연두부, 달걀, 생크림, 설탕에 녹인 무염버터를 믹서에 넣고 간 뒤 새우(1)를 함께 섞어 그릇에 담는다.b','MANUAL02'),(1,'3. 시금치를 잘게 다져 혼합물 그릇(2)에 뿌리고 찜기에 넣고 중간 불에서 10분 정도 찐다.c','MANUAL03'),(1,'','MANUAL04'),(1,'','MANUAL05'),(1,'','MANUAL06'),(1,'','MANUAL07'),(1,'','MANUAL08'),(1,'','MANUAL09'),(1,'','MANUAL10'),(1,'','MANUAL11'),(1,'','MANUAL12'),(1,'','MANUAL13'),(1,'','MANUAL14'),(1,'','MANUAL15'),(1,'','MANUAL16'),(1,'','MANUAL17'),(1,'','MANUAL18'),(1,'','MANUAL19'),(1,'','MANUAL20'),(2,'1. 부추는 깨끗이 씻어 물기를 제거하고, 5cm 길이로 썰고 부추에 날콩가루를 넣고 고루 섞이도록 버무린다.','MANUAL01'),(2,'2. 찜기에 면보를 깔고 부추를 넣은 후 김이 오르게 쪄서 파랗게 익힌다.','MANUAL02'),(2,'3. 저염간장에 다진 대파, 다진 마늘, 고춧가루, 요리당 , 참기름, 참깨를 섞어 양념장을 만들고 찐 부추는 그릇에 담아낸다.','MANUAL03'),(2,'','MANUAL04'),(2,'','MANUAL05'),(2,'','MANUAL06'),(2,'','MANUAL07'),(2,'','MANUAL08'),(2,'','MANUAL09'),(2,'','MANUAL10'),(2,'','MANUAL11'),(2,'','MANUAL12'),(2,'','MANUAL13'),(2,'','MANUAL14'),(2,'','MANUAL15'),(2,'','MANUAL16'),(2,'','MANUAL17'),(2,'','MANUAL18'),(2,'','MANUAL19'),(2,'','MANUAL20'),(3,'1. 물기를 빼고 2cm 정도의 크기로 썰은 부추와 양파를 양념장에 섞어 양념속을 만든다.','MANUAL01'),(3,'2. 깨끗이 씻은 방울토마토는 꼭지를 떼고 윗부분에 칼로 십자모양으로 칼집을 낸다.','MANUAL02'),(3,'3. 칼집을 낸 방울토마토에 양념속을 사이사이에 넣어 버무린다.','MANUAL03'),(3,'','MANUAL04'),(3,'','MANUAL05'),(3,'','MANUAL06'),(3,'','MANUAL07'),(3,'','MANUAL08'),(3,'','MANUAL09'),(3,'','MANUAL10'),(3,'','MANUAL11'),(3,'','MANUAL12'),(3,'','MANUAL13'),(3,'','MANUAL14'),(3,'','MANUAL15'),(3,'','MANUAL16'),(3,'','MANUAL17'),(3,'','MANUAL18'),(3,'','MANUAL19'),(3,'','MANUAL20'),(4,'1. 사과, 순두부를 믹서에 넣고 곱게 갈아 소스를 만든다.','MANUAL01'),(4,'2. 오이는 소금으로 문질러 씻어 반을 갈라 씨를 제거하고 어슷썰기를 한다.','MANUAL02'),(4,'3. 썰어 놓은 오이에 순두부사과 소스를 넣고 버무린 후 다진 땅콩을 뿌려 마무리 한다.','MANUAL03'),(4,'','MANUAL04'),(4,'','MANUAL05'),(4,'','MANUAL06'),(4,'','MANUAL07'),(4,'','MANUAL08'),(4,'','MANUAL09'),(4,'','MANUAL10'),(4,'','MANUAL11'),(4,'','MANUAL12'),(4,'','MANUAL13'),(4,'','MANUAL14'),(4,'','MANUAL15'),(4,'','MANUAL16'),(4,'','MANUAL17'),(4,'','MANUAL18'),(4,'','MANUAL19'),(4,'','MANUAL20'),(5,'','MANUAL01'),(5,'2. 북어채를 잘게 손으로 찢어 찬물에 헹구어 준비한 후 양파, 표고버섯, 사과는 채 썰고 새우는 등쪽의 두세 마디에 꼬챙이를 넣어 내장을 뺀 후 헹군다.','MANUAL02'),(5,'3. 찬물에 북어채, 새우, 표고버섯, 양파를 넣고 20분 정도 끓인 후 사과를 넣어 북어의 씁쓸한 맛을 없앤다.','MANUAL03'),(5,'','MANUAL04'),(5,'5. 그릇에 담아낸다.','MANUAL05'),(5,'','MANUAL06'),(5,'','MANUAL07'),(5,'','MANUAL08'),(5,'','MANUAL09'),(5,'','MANUAL10'),(5,'','MANUAL11'),(5,'','MANUAL12'),(5,'','MANUAL13'),(5,'','MANUAL14'),(5,'','MANUAL15'),(5,'','MANUAL16'),(5,'','MANUAL17'),(5,'','MANUAL18'),(5,'','MANUAL19'),(5,'','MANUAL20'),(6,'','MANUAL01'),(6,'','MANUAL02'),(6,'3. 황태는 손질하여 물에 헹궈 건져 놓고 콩나물은 다듬어 씻고 청양고추는 어슷썰기 한다.','MANUAL03'),(6,'4. 냄비에 물을 붓고 황태와 무를 넣고 끓인 후 육수에서 물을 건져내고 저염 된장을 푼다.','MANUAL04'),(6,'5. 콩나물, 다진 마늘, 청양고추를 넣고 뚜껑을 덮어 김이 나게 끓\n여준다.','MANUAL05'),(6,'','MANUAL06'),(6,'','MANUAL07'),(6,'','MANUAL08'),(6,'','MANUAL09'),(6,'','MANUAL10'),(6,'','MANUAL11'),(6,'','MANUAL12'),(6,'','MANUAL13'),(6,'','MANUAL14'),(6,'','MANUAL15'),(6,'','MANUAL16'),(6,'','MANUAL17'),(6,'','MANUAL18'),(6,'','MANUAL19'),(6,'','MANUAL20'),(7,'1. 감자, 양파는 얇게 썰고 애느타리 버섯은 썰어 달궈진 팬에 굽는다.','MANUAL01'),(7,'2. 냄비에 물을 붓고 된장을 푼 뒤 감자, 양파, 두부를 넣어 재료가 투명해지게 끓인 후 된장국의 재료를 건져서 믹서에 넣어 갈고 된장국에 넣어 한번 더 끓인다.','MANUAL02'),(7,'3. 구운 애느타리버섯과 대파를 국에 넣어 끓인 후 그릇에 담는다.','MANUAL03'),(7,'','MANUAL04'),(7,'','MANUAL05'),(7,'','MANUAL06'),(7,'','MANUAL07'),(7,'','MANUAL08'),(7,'','MANUAL09'),(7,'','MANUAL10'),(7,'','MANUAL11'),(7,'','MANUAL12'),(7,'','MANUAL13'),(7,'','MANUAL14'),(7,'','MANUAL15'),(7,'','MANUAL16'),(7,'','MANUAL17'),(7,'','MANUAL18'),(7,'','MANUAL19'),(7,'','MANUAL20'),(8,'1. 찬물에 표고버섯,머리와 내장을 제거한 멸치,\n다시마, 양파를 넣어 중간 불에서 10분 정도\n끓여 멸치육수를 만든다.','MANUAL01'),(8,'2. 육수의 표고버섯 기둥, 멸치, 다시마, 양파를 건진 후 표고버섯은 편으로 썰고 청경채는 4cm 크기로 썬다.','MANUAL02'),(8,'3. 끓는 육수에 준비한 표고버섯과 청경채를 넣고 국간장으로 간을 한 후 마늘을 넣어 한소끔 끓인다.','MANUAL03'),(8,'','MANUAL04'),(8,'','MANUAL05'),(8,'','MANUAL06'),(8,'','MANUAL07'),(8,'','MANUAL08'),(8,'','MANUAL09'),(8,'','MANUAL10'),(8,'','MANUAL11'),(8,'','MANUAL12'),(8,'','MANUAL13'),(8,'','MANUAL14'),(8,'','MANUAL15'),(8,'','MANUAL16'),(8,'','MANUAL17'),(8,'','MANUAL18'),(8,'','MANUAL19'),(8,'','MANUAL20'),(9,'1. 올리브유, 식초, 설탕, 다진 마늘을 섞어 거품기로 충분히 저어주어 올리브마늘 드레싱을 만든다.','MANUAL01'),(9,'2. 치커리는 싱싱하게 찬물에 담갔다가 물기를 뺀 후 한입 크기로 자르고, 적양배추, 양파, 당근은 곱게채를 썬다.','MANUAL02'),(9,'3. 접시에 준비한 치커리, 적양배추, 양파, 당근을 담고 올리브마늘 드레싱을 뿌린다.','MANUAL03'),(9,'','MANUAL04'),(9,'','MANUAL05'),(9,'','MANUAL06'),(9,'','MANUAL07'),(9,'','MANUAL08'),(9,'','MANUAL09'),(9,'','MANUAL10'),(9,'','MANUAL11'),(9,'','MANUAL12'),(9,'','MANUAL13'),(9,'','MANUAL14'),(9,'','MANUAL15'),(9,'','MANUAL16'),(9,'','MANUAL17'),(9,'','MANUAL18'),(9,'','MANUAL19'),(9,'','MANUAL20'),(10,'1. 찬물이 담긴 냄비에 식초, 소금을 넣고 메추리알을 삶는다. 물이 끓어오르면 5분 정도 더 삶아 찬물에 헹군 후 껍질을 벗기고 반으로 자른다.','MANUAL01'),(10,'2. 딸기를 흐르는 물에 가볍게 씻어 꼭지를 제거한 후 물기를 빼고 반으로 자른다.','MANUAL02'),(10,'3. 양상추는 찬물에 담갔다가 물기를 빼고 한입 크기로 찢은 후 접시에 양상추, 딸기, 블루베리, 메추리알을 담고 플레인요거트를 끼얹는다.','MANUAL03'),(10,'','MANUAL04'),(10,'','MANUAL05'),(10,'','MANUAL06'),(10,'','MANUAL07'),(10,'','MANUAL08'),(10,'','MANUAL09'),(10,'','MANUAL10'),(10,'','MANUAL11'),(10,'','MANUAL12'),(10,'','MANUAL13'),(10,'','MANUAL14'),(10,'','MANUAL15'),(10,'','MANUAL16'),(10,'','MANUAL17'),(10,'','MANUAL18'),(10,'','MANUAL19'),(10,'','MANUAL20'),(11,'1. 시금치는 끓는 소금물에 데쳐 찬물에 헹구어 물기를 짜고 우유를 넣고 블렌더에 곱게 갈아 체에 거른다.','MANUAL01'),(11,'2. 껍질 벗긴 감자는 찜기에 넣어 20분 정도 삶고 꺼내서 으깨고, 아몬드는 잘게 다지며, 치커리는 곱게 다진다.','MANUAL02'),(11,'3. 으깬 감자, 다진 치커리, 시금치 우유소스, 설탕을 넣고 섞어 접시에 담고 아몬드, 크랜베리를 올리고 시금치우유 소스를 곁들인다.','MANUAL03'),(11,'','MANUAL04'),(11,'','MANUAL05'),(11,'','MANUAL06'),(11,'','MANUAL07'),(11,'','MANUAL08'),(11,'','MANUAL09'),(11,'','MANUAL10'),(11,'','MANUAL11'),(11,'','MANUAL12'),(11,'','MANUAL13'),(11,'','MANUAL14'),(11,'','MANUAL15'),(11,'','MANUAL16'),(11,'','MANUAL17'),(11,'','MANUAL18'),(11,'','MANUAL19'),(11,'','MANUAL20'),(12,'1. 곱게 다진 양파와 오이피클은 물기를 짠다.','MANUAL01'),(12,'2. 연두부에 다진 양파, 다진 오이피클, 올리브유, 머스터드, 후추, 꿀, 식초, 레몬즙을 넣어 두부타르타르 소스를 만든다.','MANUAL02'),(12,'3. 새송이버섯은 0.5cm 두께로 썰고 프라이팬에 노릇하게 구워준 후 접시에 새송이버섯과 치커리를 담고 소스를 곁들인다.','MANUAL03'),(12,'','MANUAL04'),(12,'','MANUAL05'),(12,'','MANUAL06'),(12,'','MANUAL07'),(12,'','MANUAL08'),(12,'','MANUAL09'),(12,'','MANUAL10'),(12,'','MANUAL11'),(12,'','MANUAL12'),(12,'','MANUAL13'),(12,'','MANUAL14'),(12,'','MANUAL15'),(12,'','MANUAL16'),(12,'','MANUAL17'),(12,'','MANUAL18'),(12,'','MANUAL19'),(12,'','MANUAL20'),(13,'1. 저염간장, 식초, 레몬즙, 설탕을 혼합하여 간장레몬 소스를 만든다.','MANUAL01'),(13,'2. 호박, 가지, 새송이버섯은 3cm 길이로 자른 후 얇은 편으로 채 썰고, 양파, 파프리카, 피망은 호박 길이로 썬다.','MANUAL02'),(13,'3. 가지, 호박, 새송이버섯, 양파, 파프리카, 피망에 올리브유를 바르고 달궈진 그릴 팬에 구운 후 접시에 담고 발사믹 크레타를 뿌리고 간장레몬 소스를 곁들인다.','MANUAL03'),(13,'','MANUAL04'),(13,'','MANUAL05'),(13,'','MANUAL06'),(13,'','MANUAL07'),(13,'','MANUAL08'),(13,'','MANUAL09'),(13,'','MANUAL10'),(13,'','MANUAL11'),(13,'','MANUAL12'),(13,'','MANUAL13'),(13,'','MANUAL14'),(13,'','MANUAL15'),(13,'','MANUAL16'),(13,'','MANUAL17'),(13,'','MANUAL18'),(13,'','MANUAL19'),(13,'','MANUAL20'),(14,'1. 두유에 플레인요거트와 레몬즙, 설탕을 넣고 잘 섞어 두유요거트 소스를 만든다.','MANUAL01'),(14,'2. 강낭콩은 물에 불린 후 콩과 물을 1:2.5로 넣고 20~25분 삶아 건지고 브로콜리와 컬리플라워는 한입 크기로 썰어 끓는 소금물에 살짝 데쳐 찬물에 헹궈 물기를 뺀다.','MANUAL02'),(14,'3. 접시에 데친 브로콜리와 컬리플라워, 삶은 강낭콩, 채썬 적양파, 다진 호두, 건포도를 담고 두유요거트 소스를 곁들여 낸다.','MANUAL03'),(14,'','MANUAL04'),(14,'','MANUAL05'),(14,'','MANUAL06'),(14,'','MANUAL07'),(14,'','MANUAL08'),(14,'','MANUAL09'),(14,'','MANUAL10'),(14,'','MANUAL11'),(14,'','MANUAL12'),(14,'','MANUAL13'),(14,'','MANUAL14'),(14,'','MANUAL15'),(14,'','MANUAL16'),(14,'','MANUAL17'),(14,'','MANUAL18'),(14,'','MANUAL19'),(14,'','MANUAL20'),(15,'1. 오렌지는 깨끗이 씻어 껍질을 벗긴다.','MANUAL01'),(15,'2. 당근은 깨끗이 씻어 작은 토막으로 썬다.','MANUAL02'),(15,'3. 당근, 오렌지, 물(50ml)을 믹서에 곱게 간다.','MANUAL03'),(15,'4. 믹서에 갈아낸 주스는 고운 체로 거른다.','MANUAL04'),(15,'5. 주스를 살얼음이 생길 만큼 시원하게 냉동한다.','MANUAL05'),(15,'6. 컵에 담아 마무리한다.','MANUAL06'),(15,'','MANUAL07'),(15,'','MANUAL08'),(15,'','MANUAL09'),(15,'','MANUAL10'),(15,'','MANUAL11'),(15,'','MANUAL12'),(15,'','MANUAL13'),(15,'','MANUAL14'),(15,'','MANUAL15'),(15,'','MANUAL16'),(15,'','MANUAL17'),(15,'','MANUAL18'),(15,'','MANUAL19'),(15,'','MANUAL20'),(16,'1. 잣, 아몬드, 해바라기씨, 호두, 호박씨는 다진다.','MANUAL01'),(16,'2. 끓는 물에 저염소금과 식초를 넣은 후 소면을 삶은 후 체에 건져 물기를\n뺀다.','MANUAL02'),(16,'3. 석류는 물 600g와 함께 믹서에 갈고 체에 걸러 즙을 낸다. 그릇에 면을 담고 차갑게 식힌 석류즙을 붓고 견과류, 채 썬 오이를 고명으로 올린다.','MANUAL03'),(16,'','MANUAL04'),(16,'','MANUAL05'),(16,'','MANUAL06'),(16,'','MANUAL07'),(16,'','MANUAL08'),(16,'','MANUAL09'),(16,'','MANUAL10'),(16,'','MANUAL11'),(16,'','MANUAL12'),(16,'','MANUAL13'),(16,'','MANUAL14'),(16,'','MANUAL15'),(16,'','MANUAL16'),(16,'','MANUAL17'),(16,'','MANUAL18'),(16,'','MANUAL19'),(16,'','MANUAL20'),(17,'1. 검은콩을 1시간 찬물에 담가 불린 후 삶아 익힌 후 불순물을 제거하고 흑임자, 생수, 삶은 콩, 호두를 믹서에 갈아 살엄음이 생기도록 냉동실에 넣는다.','MANUAL01'),(17,'2. 오이는 돌려 깎아 채 썰고, 토마토는 1/8크기로 썰고, 달걀은 삶아 반으로 자른다.','MANUAL02'),(17,'3. 실곤약은 끓는 물에 데치고 찬물에 헹궈 그릇에 담은 후 콩물을 담고 오이, 토마토, 달걀을 고명으로 올려 완성한다.','MANUAL03'),(17,'','MANUAL04'),(17,'','MANUAL05'),(17,'','MANUAL06'),(17,'','MANUAL07'),(17,'','MANUAL08'),(17,'','MANUAL09'),(17,'','MANUAL10'),(17,'','MANUAL11'),(17,'','MANUAL12'),(17,'','MANUAL13'),(17,'','MANUAL14'),(17,'','MANUAL15'),(17,'','MANUAL16'),(17,'','MANUAL17'),(17,'','MANUAL18'),(17,'','MANUAL19'),(17,'','MANUAL20'),(18,'1. 브로콜리, 숙주, 표고버섯, 닭 가슴살은 다지고 다진 닭 가슴살은 소금과 후추로 밑간 한다.','MANUAL01'),(18,'2. 다진 채소와 닭가슴살, 참기름, 저염간장을 섞어 만두소를 만든다.','MANUAL02'),(18,'3. 준비한 만두피에 만두소를 넣은 후 만두 모양으로 빚고 만두를 찜통에 넣어 찌고 그릇에 담는다.','MANUAL03'),(18,'','MANUAL04'),(18,'','MANUAL05'),(18,'','MANUAL06'),(18,'','MANUAL07'),(18,'','MANUAL08'),(18,'','MANUAL09'),(18,'','MANUAL10'),(18,'','MANUAL11'),(18,'','MANUAL12'),(18,'','MANUAL13'),(18,'','MANUAL14'),(18,'','MANUAL15'),(18,'','MANUAL16'),(18,'','MANUAL17'),(18,'','MANUAL18'),(18,'','MANUAL19'),(18,'','MANUAL20'),(19,'1. 함초, 노루궁뎅이버섯, 다시마, 파, 양파, 무를 물에 넣어 10분 끓이고 향이 강한 모시조개와 냉이를 넣고 30분  끓인 후 간장으로 색을 낸다.','MANUAL01'),(19,'2. 소면은 따로 삶는다.','MANUAL02'),(19,'3. 그릇에 삶은 소면을 담은 후 육수를 붓고 지단, 슬라이스한 청고추, 실고추를 올려 완성한다.','MANUAL03'),(19,'','MANUAL04'),(19,'','MANUAL05'),(19,'','MANUAL06'),(19,'','MANUAL07'),(19,'','MANUAL08'),(19,'','MANUAL09'),(19,'','MANUAL10'),(19,'','MANUAL11'),(19,'','MANUAL12'),(19,'','MANUAL13'),(19,'','MANUAL14'),(19,'','MANUAL15'),(19,'','MANUAL16'),(19,'','MANUAL17'),(19,'','MANUAL18'),(19,'','MANUAL19'),(19,'','MANUAL20'),(20,'1. 두부에 쌀뜨물을 넣고 갈아준다.','MANUAL01'),(20,'2. 돼지고기는 썰고 김치는 물에 씻어 양념을 제거하고 3×3cm로 썬다.','MANUAL02'),(20,'3. 냄비에 돼지고기와 김치를 함께 볶은 후, 망에 거른 된장과 1의 두부, 고춧가루, 청양고추, 홍고추를 넣어 끓이다가 대파를 넣어 완성한다.','MANUAL03'),(20,'','MANUAL04'),(20,'','MANUAL05'),(20,'','MANUAL06'),(20,'','MANUAL07'),(20,'','MANUAL08'),(20,'','MANUAL09'),(20,'','MANUAL10'),(20,'','MANUAL11'),(20,'','MANUAL12'),(20,'','MANUAL13'),(20,'','MANUAL14'),(20,'','MANUAL15'),(20,'','MANUAL16'),(20,'','MANUAL17'),(20,'','MANUAL18'),(20,'','MANUAL19'),(20,'','MANUAL20'),(21,'1. 김치, 베이컨, 스팸, 소시지, 양파, 두부, 무는 두께 0.5cm로 썬다.','MANUAL01'),(21,'2. 다시마와 물을 끓여 다시마물을 만든다.','MANUAL02'),(21,'3. 냄비에 소시지, 베이컨, 두부, 스팸, 무, 우민찌, 김치, 다시마물 300g을 넣어 끓인 후 저염된장, 양파, 대파, 다진 마늘, 떡국 떡을 넣고 재료가 다 익으면 홍고추와 청양고추를 넣어 완성한다.','MANUAL03'),(21,'','MANUAL04'),(21,'','MANUAL05'),(21,'','MANUAL06'),(21,'','MANUAL07'),(21,'','MANUAL08'),(21,'','MANUAL09'),(21,'','MANUAL10'),(21,'','MANUAL11'),(21,'','MANUAL12'),(21,'','MANUAL13'),(21,'','MANUAL14'),(21,'','MANUAL15'),(21,'','MANUAL16'),(21,'','MANUAL17'),(21,'','MANUAL18'),(21,'','MANUAL19'),(21,'','MANUAL20'),(22,'1. 감자는 믹서에 갈고 양배추는 채 썰고 고기, 당근, 청양고추, 두부는 다진다.','MANUAL01'),(22,'2. 준비해둔 재료를 모두 섞고 부침가루와 계란을 넣어 반죽한다.','MANUAL02'),(22,'3. 가열된 팬에 기름을 두르고 반죽을 부어 굽고 소스를 함께 곁들인다.','MANUAL03'),(22,'','MANUAL04'),(22,'','MANUAL05'),(22,'','MANUAL06'),(22,'','MANUAL07'),(22,'','MANUAL08'),(22,'','MANUAL09'),(22,'','MANUAL10'),(22,'','MANUAL11'),(22,'','MANUAL12'),(22,'','MANUAL13'),(22,'','MANUAL14'),(22,'','MANUAL15'),(22,'','MANUAL16'),(22,'','MANUAL17'),(22,'','MANUAL18'),(22,'','MANUAL19'),(22,'','MANUAL20'),(23,'1. 청양고추와 홍고추를 다져서 참기름에 살짝 볶은 후 볶은 고추에 마요네즈와 레몬즙을 넣어 소스를 만든다.','MANUAL01'),(23,'2. 돌나물은 손질하여 찬물에 담구고 새송이버섯은 달군 프라이팬에 참기름을 두르고 노릇\n하게 굽는다.','MANUAL02'),(23,'3. 돌나물은 물기를 빼고 구운 새송이버섯과 레몬마요네즈 소스를 넣고\n버무려 접시에 담는다.','MANUAL03'),(23,'','MANUAL04'),(23,'','MANUAL05'),(23,'','MANUAL06'),(23,'','MANUAL07'),(23,'','MANUAL08'),(23,'','MANUAL09'),(23,'','MANUAL10'),(23,'','MANUAL11'),(23,'','MANUAL12'),(23,'','MANUAL13'),(23,'','MANUAL14'),(23,'','MANUAL15'),(23,'','MANUAL16'),(23,'','MANUAL17'),(23,'','MANUAL18'),(23,'','MANUAL19'),(23,'','MANUAL20'),(24,'1. 배추를 소금물에 하루 동안 절인 후 물기를 빼고 석류는 즙을 낸다.','MANUAL01'),(24,'2. 무는 채 썰고, 쪽파와 미나리는 4cm로 자른다.','MANUAL02'),(24,'3. 무채, 미나리, 쪽파, 다진 마늘, 다진 생강, 새우젓국을 넣고 섞어 소를 만들고 절인 배추에 소를 넣고 오므려 싼다. 석류즙에 소를 채운 배추를 담가 완성한다.','MANUAL03'),(24,'','MANUAL04'),(24,'','MANUAL05'),(24,'','MANUAL06'),(24,'','MANUAL07'),(24,'','MANUAL08'),(24,'','MANUAL09'),(24,'','MANUAL10'),(24,'','MANUAL11'),(24,'','MANUAL12'),(24,'','MANUAL13'),(24,'','MANUAL14'),(24,'','MANUAL15'),(24,'','MANUAL16'),(24,'','MANUAL17'),(24,'','MANUAL18'),(24,'','MANUAL19'),(24,'','MANUAL20'),(25,'1. 발사믹 식초, 화이트와인, 다진 유자청 건더기를 넣고 졸여 소스를 만들고 대구를 손질하여 포를 뜬다.','MANUAL01'),(25,'2. 대파, 청파프리카, 홍파프리카, 황파프리카를 채 썬다.','MANUAL02'),(25,'3. 대구포에 밀가루를 묻혀 청파프리카, 홍파프리카, 황파프리카, 황금팽이버섯을 넣고 말아 미나리로 묶어 찐 후 소스를 뿌리고 썬 대파를 올려 완성한다.','MANUAL03'),(25,'','MANUAL04'),(25,'','MANUAL05'),(25,'','MANUAL06'),(25,'','MANUAL07'),(25,'','MANUAL08'),(25,'','MANUAL09'),(25,'','MANUAL10'),(25,'','MANUAL11'),(25,'','MANUAL12'),(25,'','MANUAL13'),(25,'','MANUAL14'),(25,'','MANUAL15'),(25,'','MANUAL16'),(25,'','MANUAL17'),(25,'','MANUAL18'),(25,'','MANUAL19'),(25,'','MANUAL20'),(26,'1. 황파프리카를 갈아 체에 내리고 멥쌀로 쌀풀을 만들어 황파프리카 즙을 섞고 물엿을 첨가하여 양념을 만든다.','MANUAL01'),(26,'2. 배추를 소금물에 절이고 절인 배추를 찬물로 씻어 소금기를 뺀다.','MANUAL02'),(26,'3. 소금기를 뺀 배추에 채썬 자색고구마, 무, 쪽파, 부추, 사과, 배를 놓고 양념을 부은 후 3일 동안 숙성시켜 완성한다.','MANUAL03'),(26,'','MANUAL04'),(26,'','MANUAL05'),(26,'','MANUAL06'),(26,'','MANUAL07'),(26,'','MANUAL08'),(26,'','MANUAL09'),(26,'','MANUAL10'),(26,'','MANUAL11'),(26,'','MANUAL12'),(26,'','MANUAL13'),(26,'','MANUAL14'),(26,'','MANUAL15'),(26,'','MANUAL16'),(26,'','MANUAL17'),(26,'','MANUAL18'),(26,'','MANUAL19'),(26,'','MANUAL20'),(27,'1. 양파와 마늘은 다져서 볶다가 토마토 과육과 설탕, 바질을 넣고 고추장을 섞어 토마토 소스를 만든다.','MANUAL01'),(27,'2. 가지, 양송이버섯, 애호박, 사과는 썰고 살라미는 데친다.','MANUAL02'),(27,'3. 오븐용 팬에 토마토 소스를 넓게 펴준 뒤 애호박, 가지, 양송이버섯, 살라미를 겹치게 넣고 180℃로 예열한 오븐에 넣고 30분 구워 완성한다','MANUAL03'),(27,'','MANUAL04'),(27,'','MANUAL05'),(27,'','MANUAL06'),(27,'','MANUAL07'),(27,'','MANUAL08'),(27,'','MANUAL09'),(27,'','MANUAL10'),(27,'','MANUAL11'),(27,'','MANUAL12'),(27,'','MANUAL13'),(27,'','MANUAL14'),(27,'','MANUAL15'),(27,'','MANUAL16'),(27,'','MANUAL17'),(27,'','MANUAL18'),(27,'','MANUAL19'),(27,'','MANUAL20'),(28,'1. 간장, 레몬즙, 설탕, 다진 홍고추를 섞어 드레싱을 만든다.','MANUAL01'),(28,'2. 민들레 잎은 4×4cm로 썰고, 비트는 채 썰고 물에 담가 색을 뺀다.','MANUAL02'),(28,'3. 오렌지는 씻어 껍질만 발라 채 썰고 민들레 잎, 비트, 오렌지 껍질을 섞어 접시에 담고 드레싱을 곁들인다.','MANUAL03'),(28,'','MANUAL04'),(28,'','MANUAL05'),(28,'','MANUAL06'),(28,'','MANUAL07'),(28,'','MANUAL08'),(28,'','MANUAL09'),(28,'','MANUAL10'),(28,'','MANUAL11'),(28,'','MANUAL12'),(28,'','MANUAL13'),(28,'','MANUAL14'),(28,'','MANUAL15'),(28,'','MANUAL16'),(28,'','MANUAL17'),(28,'','MANUAL18'),(28,'','MANUAL19'),(28,'','MANUAL20'),(29,'1. 올리브오일, 발사믹식초, 후춧가루를 섞어 차게 식혀 드레싱을 만든다.','MANUAL01'),(29,'2. 가지와 토마토는 5mm두께로 썰고 120도 오븐에 20분 구운 후 구운 가지는 물기를 제거한다.','MANUAL02'),(29,'3. 팬에 올리브오일을 두르고 약불에서 채 썬 마늘을 볶다가, 가지를 넣고 구운 후 접시에 토마토, 가지를 번갈아 담고 무순으로 장식하고 드레싱을 곁들인다.','MANUAL03'),(29,'','MANUAL04'),(29,'','MANUAL05'),(29,'','MANUAL06'),(29,'','MANUAL07'),(29,'','MANUAL08'),(29,'','MANUAL09'),(29,'','MANUAL10'),(29,'','MANUAL11'),(29,'','MANUAL12'),(29,'','MANUAL13'),(29,'','MANUAL14'),(29,'','MANUAL15'),(29,'','MANUAL16'),(29,'','MANUAL17'),(29,'','MANUAL18'),(29,'','MANUAL19'),(29,'','MANUAL20'),(30,'1. 끓는 물에 배춧잎을 데친다.','MANUAL01'),(30,'2. 당근, 호박, 표고버섯, 양파는\n입자있게 다진다.','MANUAL02'),(30,'3. 돼지고기를 썰어 불린 쌀, 다진 야채와\n함께 밥을 짓는다.','MANUAL03'),(30,'4. 데친 배춧잎에 지어놓은 밥을 올려\n돌돌만다.','MANUAL04'),(30,'5. 말아 놓은 배춧잎을 부추로 묶는다.','MANUAL05'),(30,'6. 찜통에 김이 오르면 ?번을 넣고 약 5분\n정도 찐다.','MANUAL06'),(30,'','MANUAL07'),(30,'','MANUAL08'),(30,'','MANUAL09'),(30,'','MANUAL10'),(30,'','MANUAL11'),(30,'','MANUAL12'),(30,'','MANUAL13'),(30,'','MANUAL14'),(30,'','MANUAL15'),(30,'','MANUAL16'),(30,'','MANUAL17'),(30,'','MANUAL18'),(30,'','MANUAL19'),(30,'','MANUAL20');
/*!40000 ALTER TABLE `recipe_manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_manual_img`
--

DROP TABLE IF EXISTS `recipe_manual_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_manual_img` (
  `recipe_recipeno` int NOT NULL,
  `manual_img` varchar(255) DEFAULT NULL,
  `manual_img_key` varchar(255) NOT NULL,
  PRIMARY KEY (`recipe_recipeno`,`manual_img_key`),
  CONSTRAINT `FK5mwgtautkatrxh92m377smlgc` FOREIGN KEY (`recipe_recipeno`) REFERENCES `recipe` (`recipeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_manual_img`
--

LOCK TABLES `recipe_manual_img` WRITE;
/*!40000 ALTER TABLE `recipe_manual_img` DISABLE KEYS */;
INSERT INTO `recipe_manual_img` VALUES (1,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00028_1.png','MANUAL_IMG01'),(1,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00028_2.png','MANUAL_IMG02'),(1,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00028_3.png','MANUAL_IMG03'),(1,'','MANUAL_IMG04'),(1,'','MANUAL_IMG05'),(1,'','MANUAL_IMG06'),(1,'','MANUAL_IMG07'),(1,'','MANUAL_IMG08'),(1,'','MANUAL_IMG09'),(1,'','MANUAL_IMG10'),(1,'','MANUAL_IMG11'),(1,'','MANUAL_IMG12'),(1,'','MANUAL_IMG13'),(1,'','MANUAL_IMG14'),(1,'','MANUAL_IMG15'),(1,'','MANUAL_IMG16'),(1,'','MANUAL_IMG17'),(1,'','MANUAL_IMG18'),(1,'','MANUAL_IMG19'),(1,'','MANUAL_IMG20'),(2,'http://www.foodsafetykorea.go.kr/uploadimg/20230206/20230206054820_1675673300714.jpg','MANUAL_IMG01'),(2,'http://www.foodsafetykorea.go.kr/uploadimg/20230206/20230206054834_1675673314720.jpg','MANUAL_IMG02'),(2,'http://www.foodsafetykorea.go.kr/uploadimg/20230206/20230206054908_1675673348152.jpg','MANUAL_IMG03'),(2,'','MANUAL_IMG04'),(2,'','MANUAL_IMG05'),(2,'','MANUAL_IMG06'),(2,'','MANUAL_IMG07'),(2,'','MANUAL_IMG08'),(2,'','MANUAL_IMG09'),(2,'','MANUAL_IMG10'),(2,'','MANUAL_IMG11'),(2,'','MANUAL_IMG12'),(2,'','MANUAL_IMG13'),(2,'','MANUAL_IMG14'),(2,'','MANUAL_IMG15'),(2,'','MANUAL_IMG16'),(2,'','MANUAL_IMG17'),(2,'','MANUAL_IMG18'),(2,'','MANUAL_IMG19'),(2,'','MANUAL_IMG20'),(3,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00031_1.png','MANUAL_IMG01'),(3,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00031_4.png','MANUAL_IMG02'),(3,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00031_5.png','MANUAL_IMG03'),(3,'','MANUAL_IMG04'),(3,'','MANUAL_IMG05'),(3,'','MANUAL_IMG06'),(3,'','MANUAL_IMG07'),(3,'','MANUAL_IMG08'),(3,'','MANUAL_IMG09'),(3,'','MANUAL_IMG10'),(3,'','MANUAL_IMG11'),(3,'','MANUAL_IMG12'),(3,'','MANUAL_IMG13'),(3,'','MANUAL_IMG14'),(3,'','MANUAL_IMG15'),(3,'','MANUAL_IMG16'),(3,'','MANUAL_IMG17'),(3,'','MANUAL_IMG18'),(3,'','MANUAL_IMG19'),(3,'','MANUAL_IMG20'),(4,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00032_1.png','MANUAL_IMG01'),(4,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00032_2.png','MANUAL_IMG02'),(4,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00032_3.png','MANUAL_IMG03'),(4,'','MANUAL_IMG04'),(4,'','MANUAL_IMG05'),(4,'','MANUAL_IMG06'),(4,'','MANUAL_IMG07'),(4,'','MANUAL_IMG08'),(4,'','MANUAL_IMG09'),(4,'','MANUAL_IMG10'),(4,'','MANUAL_IMG11'),(4,'','MANUAL_IMG12'),(4,'','MANUAL_IMG13'),(4,'','MANUAL_IMG14'),(4,'','MANUAL_IMG15'),(4,'','MANUAL_IMG16'),(4,'','MANUAL_IMG17'),(4,'','MANUAL_IMG18'),(4,'','MANUAL_IMG19'),(4,'','MANUAL_IMG20'),(5,'','MANUAL_IMG01'),(5,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00033_2.png','MANUAL_IMG02'),(5,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00033_3.png','MANUAL_IMG03'),(5,'','MANUAL_IMG04'),(5,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00033_5.png','MANUAL_IMG05'),(5,'','MANUAL_IMG06'),(5,'','MANUAL_IMG07'),(5,'','MANUAL_IMG08'),(5,'','MANUAL_IMG09'),(5,'','MANUAL_IMG10'),(5,'','MANUAL_IMG11'),(5,'','MANUAL_IMG12'),(5,'','MANUAL_IMG13'),(5,'','MANUAL_IMG14'),(5,'','MANUAL_IMG15'),(5,'','MANUAL_IMG16'),(5,'','MANUAL_IMG17'),(5,'','MANUAL_IMG18'),(5,'','MANUAL_IMG19'),(5,'','MANUAL_IMG20'),(6,'','MANUAL_IMG01'),(6,'','MANUAL_IMG02'),(6,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00036_3.png','MANUAL_IMG03'),(6,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00036_4.png','MANUAL_IMG04'),(6,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00036_5.png','MANUAL_IMG05'),(6,'','MANUAL_IMG06'),(6,'','MANUAL_IMG07'),(6,'','MANUAL_IMG08'),(6,'','MANUAL_IMG09'),(6,'','MANUAL_IMG10'),(6,'','MANUAL_IMG11'),(6,'','MANUAL_IMG12'),(6,'','MANUAL_IMG13'),(6,'','MANUAL_IMG14'),(6,'','MANUAL_IMG15'),(6,'','MANUAL_IMG16'),(6,'','MANUAL_IMG17'),(6,'','MANUAL_IMG18'),(6,'','MANUAL_IMG19'),(6,'','MANUAL_IMG20'),(7,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00037_2.png','MANUAL_IMG01'),(7,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00037_4.png','MANUAL_IMG02'),(7,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00037_6.png','MANUAL_IMG03'),(7,'','MANUAL_IMG04'),(7,'','MANUAL_IMG05'),(7,'','MANUAL_IMG06'),(7,'','MANUAL_IMG07'),(7,'','MANUAL_IMG08'),(7,'','MANUAL_IMG09'),(7,'','MANUAL_IMG10'),(7,'','MANUAL_IMG11'),(7,'','MANUAL_IMG12'),(7,'','MANUAL_IMG13'),(7,'','MANUAL_IMG14'),(7,'','MANUAL_IMG15'),(7,'','MANUAL_IMG16'),(7,'','MANUAL_IMG17'),(7,'','MANUAL_IMG18'),(7,'','MANUAL_IMG19'),(7,'','MANUAL_IMG20'),(8,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00038_1.png','MANUAL_IMG01'),(8,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00038_2.png','MANUAL_IMG02'),(8,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00038_4.png','MANUAL_IMG03'),(8,'','MANUAL_IMG04'),(8,'','MANUAL_IMG05'),(8,'','MANUAL_IMG06'),(8,'','MANUAL_IMG07'),(8,'','MANUAL_IMG08'),(8,'','MANUAL_IMG09'),(8,'','MANUAL_IMG10'),(8,'','MANUAL_IMG11'),(8,'','MANUAL_IMG12'),(8,'','MANUAL_IMG13'),(8,'','MANUAL_IMG14'),(8,'','MANUAL_IMG15'),(8,'','MANUAL_IMG16'),(8,'','MANUAL_IMG17'),(8,'','MANUAL_IMG18'),(8,'','MANUAL_IMG19'),(8,'','MANUAL_IMG20'),(9,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00095_2.png','MANUAL_IMG01'),(9,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00095_3.png','MANUAL_IMG02'),(9,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00095_4.png','MANUAL_IMG03'),(9,'','MANUAL_IMG04'),(9,'','MANUAL_IMG05'),(9,'','MANUAL_IMG06'),(9,'','MANUAL_IMG07'),(9,'','MANUAL_IMG08'),(9,'','MANUAL_IMG09'),(9,'','MANUAL_IMG10'),(9,'','MANUAL_IMG11'),(9,'','MANUAL_IMG12'),(9,'','MANUAL_IMG13'),(9,'','MANUAL_IMG14'),(9,'','MANUAL_IMG15'),(9,'','MANUAL_IMG16'),(9,'','MANUAL_IMG17'),(9,'','MANUAL_IMG18'),(9,'','MANUAL_IMG19'),(9,'','MANUAL_IMG20'),(10,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00087_1.png','MANUAL_IMG01'),(10,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00087_2.png','MANUAL_IMG02'),(10,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00087_4.png','MANUAL_IMG03'),(10,'','MANUAL_IMG04'),(10,'','MANUAL_IMG05'),(10,'','MANUAL_IMG06'),(10,'','MANUAL_IMG07'),(10,'','MANUAL_IMG08'),(10,'','MANUAL_IMG09'),(10,'','MANUAL_IMG10'),(10,'','MANUAL_IMG11'),(10,'','MANUAL_IMG12'),(10,'','MANUAL_IMG13'),(10,'','MANUAL_IMG14'),(10,'','MANUAL_IMG15'),(10,'','MANUAL_IMG16'),(10,'','MANUAL_IMG17'),(10,'','MANUAL_IMG18'),(10,'','MANUAL_IMG19'),(10,'','MANUAL_IMG20'),(11,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00089_1.png','MANUAL_IMG01'),(11,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00089_2.png','MANUAL_IMG02'),(11,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00089_5.png','MANUAL_IMG03'),(11,'','MANUAL_IMG04'),(11,'','MANUAL_IMG05'),(11,'','MANUAL_IMG06'),(11,'','MANUAL_IMG07'),(11,'','MANUAL_IMG08'),(11,'','MANUAL_IMG09'),(11,'','MANUAL_IMG10'),(11,'','MANUAL_IMG11'),(11,'','MANUAL_IMG12'),(11,'','MANUAL_IMG13'),(11,'','MANUAL_IMG14'),(11,'','MANUAL_IMG15'),(11,'','MANUAL_IMG16'),(11,'','MANUAL_IMG17'),(11,'','MANUAL_IMG18'),(11,'','MANUAL_IMG19'),(11,'','MANUAL_IMG20'),(12,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00091_1.png','MANUAL_IMG01'),(12,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00091_2.png','MANUAL_IMG02'),(12,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00091_5.png','MANUAL_IMG03'),(12,'','MANUAL_IMG04'),(12,'','MANUAL_IMG05'),(12,'','MANUAL_IMG06'),(12,'','MANUAL_IMG07'),(12,'','MANUAL_IMG08'),(12,'','MANUAL_IMG09'),(12,'','MANUAL_IMG10'),(12,'','MANUAL_IMG11'),(12,'','MANUAL_IMG12'),(12,'','MANUAL_IMG13'),(12,'','MANUAL_IMG14'),(12,'','MANUAL_IMG15'),(12,'','MANUAL_IMG16'),(12,'','MANUAL_IMG17'),(12,'','MANUAL_IMG18'),(12,'','MANUAL_IMG19'),(12,'','MANUAL_IMG20'),(13,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00093_1.png','MANUAL_IMG01'),(13,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00093_2.png','MANUAL_IMG02'),(13,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00093_3.png','MANUAL_IMG03'),(13,'','MANUAL_IMG04'),(13,'','MANUAL_IMG05'),(13,'','MANUAL_IMG06'),(13,'','MANUAL_IMG07'),(13,'','MANUAL_IMG08'),(13,'','MANUAL_IMG09'),(13,'','MANUAL_IMG10'),(13,'','MANUAL_IMG11'),(13,'','MANUAL_IMG12'),(13,'','MANUAL_IMG13'),(13,'','MANUAL_IMG14'),(13,'','MANUAL_IMG15'),(13,'','MANUAL_IMG16'),(13,'','MANUAL_IMG17'),(13,'','MANUAL_IMG18'),(13,'','MANUAL_IMG19'),(13,'','MANUAL_IMG20'),(14,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00094_1.png','MANUAL_IMG01'),(14,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00094_4.png','MANUAL_IMG02'),(14,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00094_5.png','MANUAL_IMG03'),(14,'','MANUAL_IMG04'),(14,'','MANUAL_IMG05'),(14,'','MANUAL_IMG06'),(14,'','MANUAL_IMG07'),(14,'','MANUAL_IMG08'),(14,'','MANUAL_IMG09'),(14,'','MANUAL_IMG10'),(14,'','MANUAL_IMG11'),(14,'','MANUAL_IMG12'),(14,'','MANUAL_IMG13'),(14,'','MANUAL_IMG14'),(14,'','MANUAL_IMG15'),(14,'','MANUAL_IMG16'),(14,'','MANUAL_IMG17'),(14,'','MANUAL_IMG18'),(14,'','MANUAL_IMG19'),(14,'','MANUAL_IMG20'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_1.jpg','MANUAL_IMG01'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_2.jpg','MANUAL_IMG02'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_3.jpg','MANUAL_IMG03'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_4.jpg','MANUAL_IMG04'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_5.jpg','MANUAL_IMG05'),(15,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00108_6.jpg','MANUAL_IMG06'),(15,'','MANUAL_IMG07'),(15,'','MANUAL_IMG08'),(15,'','MANUAL_IMG09'),(15,'','MANUAL_IMG10'),(15,'','MANUAL_IMG11'),(15,'','MANUAL_IMG12'),(15,'','MANUAL_IMG13'),(15,'','MANUAL_IMG14'),(15,'','MANUAL_IMG15'),(15,'','MANUAL_IMG16'),(15,'','MANUAL_IMG17'),(15,'','MANUAL_IMG18'),(15,'','MANUAL_IMG19'),(15,'','MANUAL_IMG20'),(16,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00111_1.png','MANUAL_IMG01'),(16,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00111_2.png','MANUAL_IMG02'),(16,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00111_3.png','MANUAL_IMG03'),(16,'','MANUAL_IMG04'),(16,'','MANUAL_IMG05'),(16,'','MANUAL_IMG06'),(16,'','MANUAL_IMG07'),(16,'','MANUAL_IMG08'),(16,'','MANUAL_IMG09'),(16,'','MANUAL_IMG10'),(16,'','MANUAL_IMG11'),(16,'','MANUAL_IMG12'),(16,'','MANUAL_IMG13'),(16,'','MANUAL_IMG14'),(16,'','MANUAL_IMG15'),(16,'','MANUAL_IMG16'),(16,'','MANUAL_IMG17'),(16,'','MANUAL_IMG18'),(16,'','MANUAL_IMG19'),(16,'','MANUAL_IMG20'),(17,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00113_1.png','MANUAL_IMG01'),(17,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00113_4.png','MANUAL_IMG02'),(17,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00113_6.png','MANUAL_IMG03'),(17,'','MANUAL_IMG04'),(17,'','MANUAL_IMG05'),(17,'','MANUAL_IMG06'),(17,'','MANUAL_IMG07'),(17,'','MANUAL_IMG08'),(17,'','MANUAL_IMG09'),(17,'','MANUAL_IMG10'),(17,'','MANUAL_IMG11'),(17,'','MANUAL_IMG12'),(17,'','MANUAL_IMG13'),(17,'','MANUAL_IMG14'),(17,'','MANUAL_IMG15'),(17,'','MANUAL_IMG16'),(17,'','MANUAL_IMG17'),(17,'','MANUAL_IMG18'),(17,'','MANUAL_IMG19'),(17,'','MANUAL_IMG20'),(18,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00114_1.png','MANUAL_IMG01'),(18,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00114_3.png','MANUAL_IMG02'),(18,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00114_4.png','MANUAL_IMG03'),(18,'','MANUAL_IMG04'),(18,'','MANUAL_IMG05'),(18,'','MANUAL_IMG06'),(18,'','MANUAL_IMG07'),(18,'','MANUAL_IMG08'),(18,'','MANUAL_IMG09'),(18,'','MANUAL_IMG10'),(18,'','MANUAL_IMG11'),(18,'','MANUAL_IMG12'),(18,'','MANUAL_IMG13'),(18,'','MANUAL_IMG14'),(18,'','MANUAL_IMG15'),(18,'','MANUAL_IMG16'),(18,'','MANUAL_IMG17'),(18,'','MANUAL_IMG18'),(18,'','MANUAL_IMG19'),(18,'','MANUAL_IMG20'),(19,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00131_1.png','MANUAL_IMG01'),(19,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00131_4.png','MANUAL_IMG02'),(19,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00131_5.png','MANUAL_IMG03'),(19,'','MANUAL_IMG04'),(19,'','MANUAL_IMG05'),(19,'','MANUAL_IMG06'),(19,'','MANUAL_IMG07'),(19,'','MANUAL_IMG08'),(19,'','MANUAL_IMG09'),(19,'','MANUAL_IMG10'),(19,'','MANUAL_IMG11'),(19,'','MANUAL_IMG12'),(19,'','MANUAL_IMG13'),(19,'','MANUAL_IMG14'),(19,'','MANUAL_IMG15'),(19,'','MANUAL_IMG16'),(19,'','MANUAL_IMG17'),(19,'','MANUAL_IMG18'),(19,'','MANUAL_IMG19'),(19,'','MANUAL_IMG20'),(20,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00137_1.png','MANUAL_IMG01'),(20,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00137_2.png','MANUAL_IMG02'),(20,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00137_3.png','MANUAL_IMG03'),(20,'','MANUAL_IMG04'),(20,'','MANUAL_IMG05'),(20,'','MANUAL_IMG06'),(20,'','MANUAL_IMG07'),(20,'','MANUAL_IMG08'),(20,'','MANUAL_IMG09'),(20,'','MANUAL_IMG10'),(20,'','MANUAL_IMG11'),(20,'','MANUAL_IMG12'),(20,'','MANUAL_IMG13'),(20,'','MANUAL_IMG14'),(20,'','MANUAL_IMG15'),(20,'','MANUAL_IMG16'),(20,'','MANUAL_IMG17'),(20,'','MANUAL_IMG18'),(20,'','MANUAL_IMG19'),(20,'','MANUAL_IMG20'),(21,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00138_1.png','MANUAL_IMG01'),(21,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00138_2.png','MANUAL_IMG02'),(21,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00138_3.png','MANUAL_IMG03'),(21,'','MANUAL_IMG04'),(21,'','MANUAL_IMG05'),(21,'','MANUAL_IMG06'),(21,'','MANUAL_IMG07'),(21,'','MANUAL_IMG08'),(21,'','MANUAL_IMG09'),(21,'','MANUAL_IMG10'),(21,'','MANUAL_IMG11'),(21,'','MANUAL_IMG12'),(21,'','MANUAL_IMG13'),(21,'','MANUAL_IMG14'),(21,'','MANUAL_IMG15'),(21,'','MANUAL_IMG16'),(21,'','MANUAL_IMG17'),(21,'','MANUAL_IMG18'),(21,'','MANUAL_IMG19'),(21,'','MANUAL_IMG20'),(22,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00181_4.png','MANUAL_IMG01'),(22,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00181_5.png','MANUAL_IMG02'),(22,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00181_6.png','MANUAL_IMG03'),(22,'','MANUAL_IMG04'),(22,'','MANUAL_IMG05'),(22,'','MANUAL_IMG06'),(22,'','MANUAL_IMG07'),(22,'','MANUAL_IMG08'),(22,'','MANUAL_IMG09'),(22,'','MANUAL_IMG10'),(22,'','MANUAL_IMG11'),(22,'','MANUAL_IMG12'),(22,'','MANUAL_IMG13'),(22,'','MANUAL_IMG14'),(22,'','MANUAL_IMG15'),(22,'','MANUAL_IMG16'),(22,'','MANUAL_IMG17'),(22,'','MANUAL_IMG18'),(22,'','MANUAL_IMG19'),(22,'','MANUAL_IMG20'),(23,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00074_1.png','MANUAL_IMG01'),(23,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00074_4.png','MANUAL_IMG02'),(23,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00074_5.png','MANUAL_IMG03'),(23,'','MANUAL_IMG04'),(23,'','MANUAL_IMG05'),(23,'','MANUAL_IMG06'),(23,'','MANUAL_IMG07'),(23,'','MANUAL_IMG08'),(23,'','MANUAL_IMG09'),(23,'','MANUAL_IMG10'),(23,'','MANUAL_IMG11'),(23,'','MANUAL_IMG12'),(23,'','MANUAL_IMG13'),(23,'','MANUAL_IMG14'),(23,'','MANUAL_IMG15'),(23,'','MANUAL_IMG16'),(23,'','MANUAL_IMG17'),(23,'','MANUAL_IMG18'),(23,'','MANUAL_IMG19'),(23,'','MANUAL_IMG20'),(24,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00159_1.png','MANUAL_IMG01'),(24,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00159_3.png','MANUAL_IMG02'),(24,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00159_4.png','MANUAL_IMG03'),(24,'','MANUAL_IMG04'),(24,'','MANUAL_IMG05'),(24,'','MANUAL_IMG06'),(24,'','MANUAL_IMG07'),(24,'','MANUAL_IMG08'),(24,'','MANUAL_IMG09'),(24,'','MANUAL_IMG10'),(24,'','MANUAL_IMG11'),(24,'','MANUAL_IMG12'),(24,'','MANUAL_IMG13'),(24,'','MANUAL_IMG14'),(24,'','MANUAL_IMG15'),(24,'','MANUAL_IMG16'),(24,'','MANUAL_IMG17'),(24,'','MANUAL_IMG18'),(24,'','MANUAL_IMG19'),(24,'','MANUAL_IMG20'),(25,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00161_1.png','MANUAL_IMG01'),(25,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00161_3.png','MANUAL_IMG02'),(25,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00161_4.png','MANUAL_IMG03'),(25,'','MANUAL_IMG04'),(25,'','MANUAL_IMG05'),(25,'','MANUAL_IMG06'),(25,'','MANUAL_IMG07'),(25,'','MANUAL_IMG08'),(25,'','MANUAL_IMG09'),(25,'','MANUAL_IMG10'),(25,'','MANUAL_IMG11'),(25,'','MANUAL_IMG12'),(25,'','MANUAL_IMG13'),(25,'','MANUAL_IMG14'),(25,'','MANUAL_IMG15'),(25,'','MANUAL_IMG16'),(25,'','MANUAL_IMG17'),(25,'','MANUAL_IMG18'),(25,'','MANUAL_IMG19'),(25,'','MANUAL_IMG20'),(26,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00162_1.png','MANUAL_IMG01'),(26,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00162_3.png','MANUAL_IMG02'),(26,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00162_5.png','MANUAL_IMG03'),(26,'','MANUAL_IMG04'),(26,'','MANUAL_IMG05'),(26,'','MANUAL_IMG06'),(26,'','MANUAL_IMG07'),(26,'','MANUAL_IMG08'),(26,'','MANUAL_IMG09'),(26,'','MANUAL_IMG10'),(26,'','MANUAL_IMG11'),(26,'','MANUAL_IMG12'),(26,'','MANUAL_IMG13'),(26,'','MANUAL_IMG14'),(26,'','MANUAL_IMG15'),(26,'','MANUAL_IMG16'),(26,'','MANUAL_IMG17'),(26,'','MANUAL_IMG18'),(26,'','MANUAL_IMG19'),(26,'','MANUAL_IMG20'),(27,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00193_1.png','MANUAL_IMG01'),(27,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00193_2.png','MANUAL_IMG02'),(27,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00193_3.png','MANUAL_IMG03'),(27,'','MANUAL_IMG04'),(27,'','MANUAL_IMG05'),(27,'','MANUAL_IMG06'),(27,'','MANUAL_IMG07'),(27,'','MANUAL_IMG08'),(27,'','MANUAL_IMG09'),(27,'','MANUAL_IMG10'),(27,'','MANUAL_IMG11'),(27,'','MANUAL_IMG12'),(27,'','MANUAL_IMG13'),(27,'','MANUAL_IMG14'),(27,'','MANUAL_IMG15'),(27,'','MANUAL_IMG16'),(27,'','MANUAL_IMG17'),(27,'','MANUAL_IMG18'),(27,'','MANUAL_IMG19'),(27,'','MANUAL_IMG20'),(28,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00201_1.png','MANUAL_IMG01'),(28,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00201_2.png','MANUAL_IMG02'),(28,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00201_4.png','MANUAL_IMG03'),(28,'','MANUAL_IMG04'),(28,'','MANUAL_IMG05'),(28,'','MANUAL_IMG06'),(28,'','MANUAL_IMG07'),(28,'','MANUAL_IMG08'),(28,'','MANUAL_IMG09'),(28,'','MANUAL_IMG10'),(28,'','MANUAL_IMG11'),(28,'','MANUAL_IMG12'),(28,'','MANUAL_IMG13'),(28,'','MANUAL_IMG14'),(28,'','MANUAL_IMG15'),(28,'','MANUAL_IMG16'),(28,'','MANUAL_IMG17'),(28,'','MANUAL_IMG18'),(28,'','MANUAL_IMG19'),(28,'','MANUAL_IMG20'),(29,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00202_1.png','MANUAL_IMG01'),(29,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00202_2.png','MANUAL_IMG02'),(29,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00202_5.png','MANUAL_IMG03'),(29,'','MANUAL_IMG04'),(29,'','MANUAL_IMG05'),(29,'','MANUAL_IMG06'),(29,'','MANUAL_IMG07'),(29,'','MANUAL_IMG08'),(29,'','MANUAL_IMG09'),(29,'','MANUAL_IMG10'),(29,'','MANUAL_IMG11'),(29,'','MANUAL_IMG12'),(29,'','MANUAL_IMG13'),(29,'','MANUAL_IMG14'),(29,'','MANUAL_IMG15'),(29,'','MANUAL_IMG16'),(29,'','MANUAL_IMG17'),(29,'','MANUAL_IMG18'),(29,'','MANUAL_IMG19'),(29,'','MANUAL_IMG20'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_1.png','MANUAL_IMG01'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_2.png','MANUAL_IMG02'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_3.png','MANUAL_IMG03'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_4.png','MANUAL_IMG04'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_5.png','MANUAL_IMG05'),(30,'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00636_6.png','MANUAL_IMG06'),(30,'','MANUAL_IMG07'),(30,'','MANUAL_IMG08'),(30,'','MANUAL_IMG09'),(30,'','MANUAL_IMG10'),(30,'','MANUAL_IMG11'),(30,'','MANUAL_IMG12'),(30,'','MANUAL_IMG13'),(30,'','MANUAL_IMG14'),(30,'','MANUAL_IMG15'),(30,'','MANUAL_IMG16'),(30,'','MANUAL_IMG17'),(30,'','MANUAL_IMG18'),(30,'','MANUAL_IMG19'),(30,'','MANUAL_IMG20');
/*!40000 ALTER TABLE `recipe_manual_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeCmt`
--

DROP TABLE IF EXISTS `recipeCmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeCmt` (
  `cmtno` int NOT NULL AUTO_INCREMENT,
  `rno` int DEFAULT NULL,
  `comment` text,
  `nickname` varchar(10) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmtno`),
  CONSTRAINT `recipecmt_ibfk_1` FOREIGN KEY (`cmtno`) REFERENCES `recipe` (`recipeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeCmt`
--

LOCK TABLES `recipeCmt` WRITE;
/*!40000 ALTER TABLE `recipeCmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeCmt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03 20:05:25
