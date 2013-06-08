-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: onlinetutoring
-- ------------------------------------------------------
-- Server version	5.6.11-log

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_id` int(11) DEFAULT NULL,
  `pic_sn` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `questionId_idx` (`question_id`),
  KEY `authorId_idx` (`user_id`),
  CONSTRAINT `fk_ans_per_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ans_que_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (11,2,'haha','2013-05-26 19:21:06',12,NULL),(12,2,'评论一下','2013-05-26 19:21:32',13,NULL),(13,2,'沙发','2013-05-26 19:22:28',34,NULL),(14,6,'test','2013-05-26 23:40:23',12,NULL),(15,6,'测试图片','2013-05-26 23:42:34',12,NULL),(16,6,'测试图片2','2013-05-26 23:43:58',12,NULL),(17,6,'测试图片','2013-05-26 23:46:21',10,'YoT7ghJFVf.jpg'),(18,2,'尝试过出点金吗，不知道怎么样','2013-05-27 00:05:50',37,NULL),(19,3,'ls说的可以试试','2013-05-27 00:07:51',37,'b7tYy4ya7V.jpg'),(20,7,'2楼是傻逼吗？','2013-05-27 00:09:46',37,NULL),(21,6,'回复王翌潋:你会打dota吗？','2013-05-27 00:11:32',37,NULL),(22,6,'回复GaooGuangyu:恩，貌似很牛逼的样子。。。','2013-05-27 00:12:19',37,NULL),(23,6,'回复ChenYanjie:你试过吗？','2013-05-27 00:12:58',37,NULL),(24,6,'有人回答吗？','2013-05-28 21:24:56',38,NULL),(25,6,'dddd','2013-06-07 19:31:25',10,NULL),(26,6,'ssssss','2013-06-07 19:32:07',12,NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`),
  KEY `courseId_idx` (`course_id`),
  KEY `fk_app_stu_id_idx` (`student_id`),
  CONSTRAINT `fk_app_cou_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_stu_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (3,5),(4,5);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `eval_by_tutor_a` int(11) NOT NULL DEFAULT '0',
  `eval_by_tutor_b` int(11) NOT NULL DEFAULT '0',
  `eval_by_tutor_c` int(11) NOT NULL DEFAULT '0',
  `eval_by_stu_a` int(11) NOT NULL DEFAULT '0',
  `eval_by_stu_b` int(11) NOT NULL DEFAULT '0',
  `eval_by_stu_c` int(11) NOT NULL DEFAULT '0',
  `evaluation` varchar(1000) DEFAULT NULL,
  `flash_sn` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `flash_sn_UNIQUE` (`flash_sn`),
  KEY `fk_cou_sub_id_idx` (`subject_id`),
  KEY `fk_cou_stu_per_id_idx` (`student_id`),
  KEY `fk_cou_tut_per_id_idx` (`tutor_id`),
  CONSTRAINT `fk_cou_stu_per_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cou_sub_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cou_tut_per_id` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2013-06-08 14:30:00','2013-06-08 15:30:00',60,5,1,200,'解析几何','1节课解决基本概念问题',1,0,0,0,0,0,0,NULL,NULL,0),(2,'2013-05-29 18:24:00','2013-05-29 18:54:00',30,5,1,250,'力学','主要分析牛顿三定律',4,0,0,0,0,0,0,NULL,NULL,0),(3,'2013-06-08 17:00:00','2013-06-08 17:30:00',30,NULL,1,300,'定语从句','30分钟学会',3,0,0,0,0,0,0,NULL,NULL,0),(4,'2013-06-08 17:45:00','2013-06-08 18:15:00',30,NULL,1,250,'电路','注重电路图的设计',4,0,0,0,0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `id_a` int(11) NOT NULL,
  `id_b` int(11) NOT NULL,
  PRIMARY KEY (`id_a`,`id_b`),
  KEY `fk_fri_b_per_id_idx` (`id_b`),
  KEY `fk_fri_a_per_id_idx` (`id_a`),
  CONSTRAINT `fk_fri_a_per_id` FOREIGN KEY (`id_a`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fri_b_per_id` FOREIGN KEY (`id_b`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `toId_idx` (`receiver_id`),
  KEY `fromId_idx` (`sender_id`),
  CONSTRAINT `fk_mes_rec_per_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mes_sen_per_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `_idx` (`user_id`),
  CONSTRAINT `fk_not_per_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,3,8,1,'2013-05-31 19:18:16',0),(2,4,8,1,'2013-06-07 22:08:44',0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view` int(11) NOT NULL DEFAULT '0',
  `pic_sn` varchar(15) DEFAULT NULL,
  `attachment_sn` varchar(15) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `reply` int(11) NOT NULL DEFAULT '0',
  `attach_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `picSn_UNIQUE` (`pic_sn`),
  UNIQUE KEY `attachmentSn_UNIQUE` (`attachment_sn`),
  KEY `authorId_idx` (`user_id`),
  KEY `fk_que_sub_id_idx` (`subject_id`),
  CONSTRAINT `fk_que_per_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_que_sub_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (10,2,'一道高中化学题','一个半径为r的圆形油漆刷蘸满油漆在边长为a的等边三角形盒子内部沿着等边三角形的三条边刷一周油漆盒子的底部，并且始终保持与等边三角形的边相切','2013-05-25 21:23:04',0,NULL,NULL,5,0,NULL),(12,3,'发一个玩玩','测试测试测试','2013-05-26 00:24:47',0,NULL,NULL,2,0,NULL),(13,3,'有意思','哈哈哈哈','2013-05-26 00:25:09',0,NULL,NULL,4,0,NULL),(14,3,'可乐','可口可乐2元1罐','2013-05-26 00:25:53',0,NULL,NULL,5,0,NULL),(15,3,'好吧','第三方撒旦东方大厦发送到嘎斯刚发给发送到官方的三国杀的分公司的风格','2013-05-26 00:26:22',0,NULL,NULL,3,0,NULL),(16,3,'数据库','学的差啊。。。。','2013-05-26 00:27:05',0,NULL,NULL,4,0,NULL),(34,6,'我的新号','新号不要被删了','2013-05-26 19:16:48',0,NULL,NULL,1,0,NULL),(37,6,'求问一个dota问题','sf怎么出装打c最高效','2013-05-27 00:04:31',0,'mYEad0eXqy.jpg',NULL,4,0,NULL),(38,6,'我要发起话题','哈哈哈哈','2013-05-28 21:24:31',0,'6zaSCqm7dB.jpg','rBI4CAUj2z.txt',1,0,'数据库.txt');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialty` (
  `tutor_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`tutor_id`,`subject_id`),
  KEY `fk_spe_sub_id_idx` (`subject_id`),
  CONSTRAINT `fk_spe_sub_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_spe_tut_id` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personId_UNIQUE` (`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `fk_stu_per_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,2,0),(3,3,0),(4,4,0),(5,6,3),(6,7,6);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'数学'),(2,'语文'),(3,'英语'),(4,'物理'),(5,'化学');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personId_UNIQUE` (`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `fk_tut_per_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` VALUES (1,8,0,'我是同济大学的老师'),(2,9,0,'');
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `card_num` varchar(16) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `point` float DEFAULT '0',
  `head_pic_sn` varchar(15) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `cookie_sn` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Gao','Guangyu','py@gmail.com','1234567',NULL,NULL,NULL,'1',0,NULL,NULL,NULL),(3,'Chen','Yanjie','test@164.com','1234567',NULL,NULL,NULL,'1',0,NULL,NULL,NULL),(4,'Ha','ha','test2@163.com','1234567',NULL,NULL,NULL,'1',0,NULL,NULL,NULL),(6,'潘','岩','panyan@gmail.com','1234567','18801785239','1993-06-05',NULL,'1',0,'TX1WflAQEN.jpg','同济大学',NULL),(7,'王','翌潋','panyan@163.com','1234567',NULL,NULL,NULL,'1',0,NULL,NULL,NULL),(8,'Liu','Yan','hello@163.com','1234567','','2013-05-09',NULL,'2',0,'opRNfMShhl.jpg','',NULL),(9,'杜','庆峰','hello2@163.com','1234567','','2013-05-09',NULL,'2',0,NULL,'',NULL);
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

-- Dump completed on 2013-06-08 16:01:33
