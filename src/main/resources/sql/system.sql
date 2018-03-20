-- MySQL dump 10.13  Distrib 5.5.40, for Win64 (x86)
--
-- Host: 127.0.0.1    Database: system
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `menu_sort` int(11) DEFAULT NULL,
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `icon` varchar(128) DEFAULT NULL COMMENT '资源icon',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` varchar(10) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `percode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'权限',NULL,' ','',NULL,0,'0/',NULL,'1',NULL),(2,'系统管理',3,'menu','/systemManage','larry-xitongshezhi1',1,'0/1/','1','1','permissionManage:'),(3,'模块一',1,'menu','/infoManage','larry-lanmuguanli1',1,'0/1/','1','1','infoManage:'),(4,'模块二',2,'menu','/report','larry-lanmuguanli1',1,'0/1/','1','1','port:'),(5,'菜单权限管理',3,'menu','/menu','larry-neirong',2,'0/1/2/','2','1',''),(6,'角色权限分配',1,'menu','/userRole','larry-yonghuliebiao',2,'0/1/2/','2','1','rolePermission:'),(7,'发布公告',4,'menu','/notice','larry-neirongguanli',2,'0/1/2/','2','1',''),(8,'添加',NULL,'permission','','',6,'0/1/2/6/','3','1','rolePermission:add'),(9,'修改',NULL,'permission','','',6,'0/1/2/6/','3','1','rolePermission:update'),(11,'用户角色分配',2,'menu','/roleDistribute','larry-quanxianguanli',2,'0/1/2/','2','1','userRole:'),(12,'状态设置',NULL,'permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:available'),(13,'模块二内容',2,'menu','/moduleThree','larry-neirongguanli',4,'0/1/4/','2','1','moduleThree:'),(14,'角色修改',NULL,'permission',NULL,NULL,11,'0/1/2/11/','3','1','userRole:update'),(15,'删除',NULL,'permission',NULL,NULL,7,'0/1/2/7/','3','1','notice:delete'),(16,'添加',NULL,'permission',NULL,NULL,17,'0/1/3/17/','3','1','moduleOne:add'),(17,'模块一内容',2,'menu','/moduleOne','larry-gereninfo',3,'0/1/3/','2','1','moduleOne:'),(18,'删除',NULL,'permission',NULL,NULL,17,'0/1/3/17/','3','1','moduleOne:delete'),(19,'修改',NULL,'permission',NULL,NULL,17,'0/1/3/17/','3','1','moduleOne:update'),(20,'删除',NULL,'permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:delete'),(23,'权限配置',NULL,'permission',NULL,NULL,6,'0/1/2/6/','3','1','rolePermission:setting');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `available` varchar(10) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'管理员','true'),(2,'行政管理','true'),(3,'学生','true'),(17,'学院领导','true'),(18,'社区辅导员','true'),(19,'职业导师','true'),(20,'助理管理员','true'),(21,'教师','true');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_role_id` int(11) NOT NULL COMMENT '角色id',
  `sys_permission_id` bigint(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (9,1,2),(10,1,3),(12,1,5),(28,1,11),(55,1,6),(56,1,22),(69,1,15),(70,1,16),(71,1,17),(72,1,18),(75,1,21),(76,1,4),(82,2,5),(84,2,15),(91,1,12),(92,1,13),(93,1,14),(94,1,23),(95,1,24),(96,1,25),(97,1,19),(98,1,20),(100,1,26),(101,1,27),(102,1,28),(103,1,29),(104,1,30),(105,1,31),(106,1,32),(107,1,33),(108,1,34),(109,1,35),(110,1,36),(111,1,37),(112,1,38),(113,1,39),(114,1,40),(115,1,41),(116,1,42),(117,1,43),(119,1,45),(121,1,47),(122,1,49),(123,1,48),(124,1,50),(126,1,52),(127,1,53),(131,3,15),(133,1,57),(134,1,58),(135,1,59),(136,1,56),(139,1,51),(140,3,60),(141,1,61),(142,1,62),(143,4,12),(148,4,15),(150,4,18),(163,2,48),(166,3,63),(167,3,64),(168,1,65),(169,1,67),(170,1,66),(171,1,68),(172,1,69),(173,1,70),(174,6,12),(175,6,13),(176,6,66),(177,6,14),(178,6,58),(179,6,59),(180,6,49),(181,6,68),(182,6,50),(183,6,61),(184,6,69),(185,6,51),(186,6,62),(187,6,70),(188,6,65),(189,6,67),(191,4,48),(206,14,15),(227,14,12),(228,14,13),(229,14,14),(230,14,58),(231,14,59),(232,14,49),(233,14,50),(234,14,61),(235,14,51),(236,14,62),(237,14,65),(238,14,2),(239,14,11),(240,14,6),(241,14,57),(242,14,47),(243,14,26),(244,14,48),(245,14,16),(246,14,27),(247,14,17),(248,14,18),(249,14,19),(250,14,52),(251,14,20),(252,14,31),(253,14,53),(254,14,21),(255,9,12),(259,2,12),(260,2,59),(266,2,21),(267,3,71),(268,9,58),(270,9,50),(271,9,51),(272,9,15),(274,9,48),(275,9,18),(279,2,49),(283,2,47),(284,2,18),(285,4,50),(286,4,51),(287,4,47),(289,9,47),(290,4,58),(291,1,72),(292,1,73),(293,1,74),(294,1,77),(295,1,78),(296,1,75),(297,1,76),(299,11,12),(300,11,50),(301,11,51),(302,11,15),(303,11,47),(304,11,78),(305,11,48),(306,11,18),(307,4,79),(308,4,79),(321,1,80),(322,1,81),(323,1,82),(324,1,83),(325,1,84),(326,1,85),(327,1,86),(328,1,87),(329,1,88),(330,19,12),(331,19,14),(332,19,58),(333,19,59),(334,19,50),(335,19,51),(336,19,15),(337,19,47),(338,19,78),(339,19,48),(340,19,79),(341,19,80),(342,19,81),(343,19,82),(344,19,85),(345,19,18),(346,19,72),(347,19,74),(348,17,12),(349,17,14),(350,17,58),(351,17,59),(352,17,49),(353,17,50),(354,17,62),(355,17,15),(356,17,47),(357,17,78),(358,17,48),(359,17,18),(360,17,72),(361,17,74),(362,18,12),(363,18,58),(364,18,50),(365,18,61),(366,18,15),(367,18,47),(368,18,78),(369,18,48),(370,18,83),(371,18,84),(372,18,86),(373,18,87),(374,18,18),(375,18,72),(376,18,74),(377,20,12),(378,20,13),(379,20,14),(380,20,58),(381,20,59),(382,20,49),(383,20,50),(384,20,51),(385,20,62),(386,20,65),(387,20,15),(388,20,47),(389,20,77),(390,20,78),(391,20,75),(392,20,76),(393,20,48),(394,20,18),(395,20,72),(396,20,74),(397,20,21),(398,2,78),(399,2,72),(400,2,74),(401,21,12),(402,21,58),(403,21,49),(404,21,50),(405,21,15),(406,21,47),(407,21,78),(408,21,48),(409,21,18),(410,21,72),(411,21,74),(412,20,52),(413,1,120),(414,1,79),(415,1,121),(416,20,121),(417,20,79),(418,20,80),(419,20,81),(420,20,82),(421,20,83),(422,20,84),(423,20,85),(424,20,86),(425,20,87),(426,1,71),(427,19,49),(428,1,89),(429,1,122),(430,1,44),(431,1,46),(432,1,7),(433,1,8),(434,1,9);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '1',
  `name` varchar(20) DEFAULT NULL,
  `staff` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('admin','admin',1,1,'管理员 ','管理员'),('test','test',3,1,'测试账号','测试'),('74040301','064710',2,1,'付宏科','行政主管'),('76120140','250459',17,1,'王晓华','学院领导'),('79070159','141617',17,1,'薛晓明','学院领导'),('84041023','12101X',17,1,'高鹏','学院领导'),('80091316','154028',17,1,'段家菊','学院领导'),('85020484','210842',2,1,'张潇','行政主管'),('89031731','24133X',18,1,'单勃','社区辅导员'),('90091578','214819',18,1,'吴亚伟','社区辅导员'),('76060501','080026',20,1,'张晓楠','行政主管'),('90081580','265843',19,1,'赵慧娟','职业导师'),('84080689','100024',19,1,'聂新磊','职业导师'),('82031710','253189',21,1,'贠聿薇','专职教师'),('81110374','273515',20,1,'马珍珂','行政主管'),('88051657','313824',21,1,'李萌','专职教师'),('84121667','125176',19,1,'王洪泉','职业导师'),('84050220','133964',20,1,'谢颖妮','行政主管'),('85021585','276744',19,1,'靳燕英','职业导师'),('87061581','230512',19,1,'李康','职业导师'),('88080597','07211X',19,1,'陈明','职业导师'),('90111664','100429',19,1,'童乐','职业导师'),('105010000104','311610',3,1,'吕俊杰','学生');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 21:50:11
