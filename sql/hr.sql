/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.27 : Database - hr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hr` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hr`;

/*Table structure for table `bonus` */

DROP TABLE IF EXISTS `bonus`;

CREATE TABLE `bonus` (
  `bonId` int(11) NOT NULL AUTO_INCREMENT,
  `majorKindId` int(11) DEFAULT NULL,
  `majorKindName` varchar(60) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `majorName` varchar(60) DEFAULT NULL,
  `humanId` varchar(30) DEFAULT NULL,
  `humanName` varchar(60) DEFAULT NULL,
  `bonusItem` varchar(30) DEFAULT NULL,
  `bonusWorth` int(11) DEFAULT NULL,
  `bonusDegree` varchar(60) DEFAULT NULL,
  `remark` text,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`bonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `bonus` */

/*Table structure for table `configfilefirstkind` */

DROP TABLE IF EXISTS `configfilefirstkind`;

CREATE TABLE `configfilefirstkind` (
  `firstKindId` int(11) NOT NULL AUTO_INCREMENT,
  `firstKindName` varchar(100) DEFAULT NULL,
  `firstKindSalaryId` text,
  `firstKindSaleId` text,
  PRIMARY KEY (`firstKindId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `configfilefirstkind` */

insert  into `configfilefirstkind`(`firstKindId`,`firstKindName`,`firstKindSalaryId`,`firstKindSaleId`) values (1,'总部','2','1'),(3,'科讯科技','1','1');

/*Table structure for table `configfilesecondkind` */

DROP TABLE IF EXISTS `configfilesecondkind`;

CREATE TABLE `configfilesecondkind` (
  `secondKindId` int(11) NOT NULL AUTO_INCREMENT,
  `secondKindName` varchar(60) DEFAULT NULL,
  `firstKindId` int(11) DEFAULT NULL,
  `secondSalaryId` varchar(40) DEFAULT NULL,
  `secondSaleId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`secondKindId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `configfilesecondkind` */

insert  into `configfilesecondkind`(`secondKindId`,`secondKindName`,`firstKindId`,`secondSalaryId`,`secondSaleId`) values (1,'集团',1,NULL,NULL),(2,'分公司',1,NULL,NULL);

/*Table structure for table `configfilethirdkind` */

DROP TABLE IF EXISTS `configfilethirdkind`;

CREATE TABLE `configfilethirdkind` (
  `thirdKindId` int(11) NOT NULL AUTO_INCREMENT,
  `thirdKindName` varchar(60) DEFAULT NULL,
  `firstKindId` int(11) DEFAULT NULL,
  `secondKindId` int(11) DEFAULT NULL,
  `thirdKindSaleId` varchar(60) DEFAULT NULL,
  `thirdKindIsRetail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`thirdKindId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `configfilethirdkind` */

insert  into `configfilethirdkind`(`thirdKindId`,`thirdKindName`,`firstKindId`,`secondKindId`,`thirdKindSaleId`,`thirdKindIsRetail`) values (1,'华为',1,1,NULL,NULL),(3,'基金会',NULL,NULL,'1','是'),(6,'突然',1,1,'t454','是');

/*Table structure for table `configmajor` */

DROP TABLE IF EXISTS `configmajor`;

CREATE TABLE `configmajor` (
  `majorId` int(11) NOT NULL AUTO_INCREMENT,
  `majorName` varchar(60) DEFAULT NULL,
  `majorKindId` varchar(60) DEFAULT NULL,
  `testAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `configmajor` */

insert  into `configmajor`(`majorId`,`majorName`,`majorKindId`,`testAmount`) values (1,'程序员','1',1111),(2,'测试','2',222222),(7,'嗯嗯','1',NULL);

/*Table structure for table `configmajordesignation` */

DROP TABLE IF EXISTS `configmajordesignation`;

CREATE TABLE `configmajordesignation` (
  `cmdId` int(11) NOT NULL AUTO_INCREMENT,
  `cmdName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cmdId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `configmajordesignation` */

insert  into `configmajordesignation`(`cmdId`,`cmdName`) values (1,'职称1');

/*Table structure for table `configmajorkind` */

DROP TABLE IF EXISTS `configmajorkind`;

CREATE TABLE `configmajorkind` (
  `majorKindId` int(11) NOT NULL AUTO_INCREMENT,
  `majorKindName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`majorKindId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `configmajorkind` */

insert  into `configmajorkind`(`majorKindId`,`majorKindName`) values (1,'开发'),(2,'测试'),(5,'职位分类');

/*Table structure for table `configprimarykey` */

DROP TABLE IF EXISTS `configprimarykey`;

CREATE TABLE `configprimarykey` (
  `prkId` int(11) NOT NULL AUTO_INCREMENT,
  `primaryKeyTable` varchar(60) DEFAULT NULL,
  `primaryKey` varchar(60) DEFAULT NULL,
  `keyName` varchar(60) DEFAULT NULL,
  `primaryKeyStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`prkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configprimarykey` */

/*Table structure for table `configpublicchar` */

DROP TABLE IF EXISTS `configpublicchar`;

CREATE TABLE `configpublicchar` (
  `pbcId` int(11) NOT NULL AUTO_INCREMENT,
  `attributeKind` varchar(60) DEFAULT NULL,
  `attributeName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`pbcId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `configpublicchar` */

insert  into `configpublicchar`(`pbcId`,`attributeKind`,`attributeName`) values (1,'招聘类型','社会招聘'),(2,'招聘类型',' 校园招聘 '),(3,'宗教信仰','基督教'),(4,'宗教信仰','邪教'),(5,'宗教信仰','伊斯兰教'),(6,'政治面貌','中共党员'),(7,'政治面貌','中共预备党员'),(8,'政治面貌','共青团员'),(9,'政治面貌','民革党员'),(10,'政治面貌','民盟盟员'),(11,'政治面貌','民建会员'),(12,'政治面貌','民进会员'),(13,'政治面貌','农工党党员'),(14,'教育年限','九年义务教育'),(15,'教育年限','十二年寒窗苦读'),(16,'学历专业','计算机科学'),(17,'学历专业','平面设计'),(18,'民族','回族'),(19,'民族','汉族'),(20,'民族','瑶族'),(21,'民族','土家族'),(22,'国籍','中国'),(23,'国籍','美国'),(24,'国籍','加拿大'),(25,'国籍','英国'),(26,'职称','老板'),(27,'职称','BOSS'),(28,'学历','博士'),(29,'学历','研究生'),(30,'学历','本科'),(31,'学历','专科'),(32,'学历','中专'),(33,'特长','吹牛逼');

/*Table structure for table `configquestionfirstkind` */

DROP TABLE IF EXISTS `configquestionfirstkind`;

CREATE TABLE `configquestionfirstkind` (
  `firstKindId` int(11) NOT NULL AUTO_INCREMENT,
  `firstKindName` varchar(60) DEFAULT NULL,
  `firstkindStatus` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`firstKindId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configquestionfirstkind` */

/*Table structure for table `configquestionsecondkind` */

DROP TABLE IF EXISTS `configquestionsecondkind`;

CREATE TABLE `configquestionsecondkind` (
  `secondKindId` int(11) NOT NULL AUTO_INCREMENT,
  `secondKindName` varchar(60) DEFAULT NULL,
  `firstKindId` int(11) DEFAULT NULL,
  `secondKindStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`secondKindId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configquestionsecondkind` */

/*Table structure for table `engageanswer` */

DROP TABLE IF EXISTS `engageanswer`;

CREATE TABLE `engageanswer` (
  `ansId` int(11) NOT NULL AUTO_INCREMENT,
  `examNumber` varchar(30) DEFAULT NULL,
  `resumeId` int(11) DEFAULT NULL,
  `humanName` varchar(60) DEFAULT NULL,
  `humanIdcard` varchar(60) DEFAULT NULL,
  `majorId` varchar(60) DEFAULT NULL,
  `testTime` date DEFAULT NULL,
  `useTime` int(11) DEFAULT NULL,
  `totalPoint` int(11) DEFAULT NULL,
  PRIMARY KEY (`ansId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `engageanswer` */

/*Table structure for table `engageanswerdetails` */

DROP TABLE IF EXISTS `engageanswerdetails`;

CREATE TABLE `engageanswerdetails` (
  `andId` int(11) NOT NULL AUTO_INCREMENT,
  `ansId` int(11) DEFAULT NULL,
  `subjectId` varchar(30) DEFAULT NULL,
  `answer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`andId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `engageanswerdetails` */

/*Table structure for table `engageexam` */

DROP TABLE IF EXISTS `engageexam`;

CREATE TABLE `engageexam` (
  `examNumber` int(11) NOT NULL AUTO_INCREMENT,
  `majorId` int(11) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `limiteTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`examNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `engageexam` */

/*Table structure for table `engageexamdetails` */

DROP TABLE IF EXISTS `engageexamdetails`;

CREATE TABLE `engageexamdetails` (
  `exdId` int(11) NOT NULL AUTO_INCREMENT,
  `examNumber` varchar(30) DEFAULT NULL,
  `secondKindId` int(11) DEFAULT NULL,
  `questionAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`exdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `engageexamdetails` */

/*Table structure for table `engageinterview` */

DROP TABLE IF EXISTS `engageinterview`;

CREATE TABLE `engageinterview` (
  `einId` int(11) NOT NULL AUTO_INCREMENT,
  `humanName` varchar(60) DEFAULT NULL,
  `humanMajorId` int(2) DEFAULT NULL,
  `imageDegree` varchar(20) DEFAULT NULL,
  `nativeLanguageDegree` varchar(60) DEFAULT NULL,
  `foreignLanguageDegree` varchar(60) DEFAULT NULL,
  `responseSpeedDegree` varchar(20) DEFAULT NULL,
  `EQDegree` varchar(20) DEFAULT NULL,
  `IQDegree` varchar(20) DEFAULT NULL,
  `multiQualityDegree` varchar(20) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `registeTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `resumeId` int(10) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `interviewComment` text,
  `checkComment` text,
  `checkStatus` int(2) DEFAULT NULL,
  PRIMARY KEY (`einId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `engageinterview` */

insert  into `engageinterview`(`einId`,`humanName`,`humanMajorId`,`imageDegree`,`nativeLanguageDegree`,`foreignLanguageDegree`,`responseSpeedDegree`,`EQDegree`,`IQDegree`,`multiQualityDegree`,`register`,`checker`,`registeTime`,`checkTime`,`resumeId`,`result`,`interviewComment`,`checkComment`,`checkStatus`) values (8,'李冬',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-06','2019-08-06',16,NULL,'通过',NULL,3),(9,'李冬',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-06','2019-08-06',17,NULL,'31245',NULL,3),(10,'李冬',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-06','2019-08-06',18,NULL,'哟哦',NULL,3),(11,'李冬',2,'A','A','A','A','A','A','A','李冬','李冬','2019-08-10','2019-08-10',19,NULL,'好',NULL,3),(12,'李冬',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-10','2019-08-10',20,NULL,'12',NULL,3),(15,'李冬',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-15','2019-08-15',25,NULL,NULL,NULL,3),(16,'哈哈',1,'A','A','A','A','A','A','A','李冬','李冬','2019-08-15','2019-08-15',26,NULL,'哈哈',NULL,3);

/*Table structure for table `engagemajorrelease` */

DROP TABLE IF EXISTS `engagemajorrelease`;

CREATE TABLE `engagemajorrelease` (
  `mreId` int(11) NOT NULL AUTO_INCREMENT,
  `thirdKindId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `humanAmount` int(11) DEFAULT NULL,
  `engageType` varchar(60) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `changer` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `changeTime` date DEFAULT NULL,
  `majorDescribe` text,
  `engageRequired` text,
  PRIMARY KEY (`mreId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `engagemajorrelease` */

insert  into `engagemajorrelease`(`mreId`,`thirdKindId`,`majorId`,`humanAmount`,`engageType`,`deadline`,`register`,`changer`,`registTime`,`changeTime`,`majorDescribe`,`engageRequired`) values (2,1,1,1,'社会招聘','2019-08-19','李冬',NULL,'2019-08-02',NULL,'java,C#','java,C#'),(3,2,1,1,'社会招聘','2019-08-28','李冬',NULL,'2019-08-02',NULL,'没头发','有技术'),(4,1,1,12,'社会招聘','2019-08-27','李冬',NULL,'2019-08-03',NULL,'没要求','没要求'),(5,1,1,100,'校园招聘','2019-08-12','李冬',NULL,'2019-08-04',NULL,'做事认真10年java开发经验','本科学历'),(7,1,1,123,'社会招聘','2019-08-27','李冬',NULL,'2019-08-04',NULL,'123','2131232'),(8,1,1,100,'校园招聘','2019-08-20','李冬','李冬','2019-08-10','2019-08-10','12','12'),(9,1,1,10,'校园招聘','2019-08-29','李冬','李冬','2019-08-14','2019-08-14','哈哈','哈哈'),(10,1,1,10000,'社会招聘','2019-08-31','李冬','李冬','2019-08-15','2019-08-15','几个大号','阿喀琉斯的hi欧艾斯'),(11,1,1,1000,'社会招聘','2019-08-31','李冬',NULL,'2019-08-15',NULL,',将国际化','复印');

/*Table structure for table `engageresume` */

DROP TABLE IF EXISTS `engageresume`;

CREATE TABLE `engageresume` (
  `resId` int(11) NOT NULL AUTO_INCREMENT,
  `humanName` varchar(60) DEFAULT NULL,
  `engageType` varchar(30) DEFAULT NULL,
  `humanAddress` varchar(200) DEFAULT NULL,
  `humanPostcode` varchar(10) DEFAULT NULL,
  `humanMajorId` int(11) DEFAULT NULL,
  `humanTelephone` varchar(60) DEFAULT NULL,
  `humanHomephone` varchar(60) DEFAULT NULL,
  `humanMobilephone` varchar(60) DEFAULT NULL,
  `humanEmail` varchar(60) DEFAULT NULL,
  `humanHobby` varchar(200) DEFAULT NULL,
  `humanSpecility` varchar(200) DEFAULT NULL,
  `humanSex` varchar(2) DEFAULT NULL,
  `humanReligion` varchar(60) DEFAULT NULL,
  `humanParty` varchar(60) DEFAULT NULL,
  `humanNationality` varchar(60) DEFAULT NULL,
  `humanRace` varchar(60) DEFAULT NULL,
  `humanBirthday` date DEFAULT NULL,
  `humanAge` int(10) DEFAULT NULL,
  `humanEducatedDegree` varchar(60) DEFAULT NULL,
  `humanEducatedYears` varchar(100) DEFAULT NULL,
  `humanEducatedMajor` varchar(60) DEFAULT NULL,
  `humanCollege` varchar(60) DEFAULT NULL,
  `humanIdcard` varchar(60) DEFAULT NULL,
  `humanBirthplace` varchar(200) DEFAULT NULL,
  `demandSalaryStandard` int(10) DEFAULT NULL,
  `humanHistoryRecords` text,
  `remark` text,
  `recomandation` text,
  `humanPicture` varchar(60) DEFAULT NULL,
  `attachmentName` varchar(60) DEFAULT NULL,
  `checkStatus` int(2) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `interviewStatus` int(2) DEFAULT NULL,
  `interviewAmount` int(10) DEFAULT NULL,
  `totalPoints` int(10) DEFAULT NULL,
  `testAmount` int(10) DEFAULT NULL,
  `testChecker` varchar(60) DEFAULT NULL,
  `testCheckTime` date DEFAULT NULL,
  `passRegister` varchar(60) DEFAULT NULL,
  `passRegistTime` date DEFAULT NULL,
  `passChecker` varchar(60) DEFAULT NULL,
  `passCheckTime` date DEFAULT NULL,
  `passCheckStatus` int(2) DEFAULT NULL,
  `passCheckComment` varchar(60) DEFAULT NULL,
  `passPassComment` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`resId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `engageresume` */

insert  into `engageresume`(`resId`,`humanName`,`engageType`,`humanAddress`,`humanPostcode`,`humanMajorId`,`humanTelephone`,`humanHomephone`,`humanMobilephone`,`humanEmail`,`humanHobby`,`humanSpecility`,`humanSex`,`humanReligion`,`humanParty`,`humanNationality`,`humanRace`,`humanBirthday`,`humanAge`,`humanEducatedDegree`,`humanEducatedYears`,`humanEducatedMajor`,`humanCollege`,`humanIdcard`,`humanBirthplace`,`demandSalaryStandard`,`humanHistoryRecords`,`remark`,`recomandation`,`humanPicture`,`attachmentName`,`checkStatus`,`register`,`registTime`,`checker`,`checkTime`,`interviewStatus`,`interviewAmount`,`totalPoints`,`testAmount`,`testChecker`,`testCheckTime`,`passRegister`,`passRegistTime`,`passChecker`,`passCheckTime`,`passCheckStatus`,`passCheckComment`,`passPassComment`) values (16,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男','基督教','中共党员','中国','汉族','2019-08-27',18,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,10000,'1111',NULL,NULL,'/hr/images/resume/1565029362474timg (1).jpg',NULL,1,'李冬','2019-08-06','李冬','2019-08-06',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(17,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,18,NULL,'九年义务教育','计算机科学','华瑞','430524200111086332',NULL,10000,'十大',NULL,NULL,'/hr/images/resume/1565085095654timg.jpg',NULL,1,'李冬','2019-08-06','李冬','2019-08-06',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(18,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,18,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,2000,'如一日方面',NULL,NULL,'/hr/images/resume/1565085989945timg (2).jpg',NULL,1,'李冬','2019-08-06','李冬','2019-08-06',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(19,'李冬','社会招聘',NULL,NULL,2,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,14,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,1000,'如果发生的',NULL,NULL,'/hr/images/resume/1565348485485地球.jpg',NULL,1,'李冬','2019-08-09','李冬','2019-08-10',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(20,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,14,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,23,'问问群',NULL,NULL,'/hr/images/resume/1565421576314地球.jpg',NULL,1,'李冬','2019-08-10','李冬','2019-08-10',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(23,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,18,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,333,'1111',NULL,NULL,'/hr/images/resume/15658086971275bfce300f0b20.jpg',NULL,1,'李冬','2019-08-15','李冬','2019-08-15',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,12,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,20000,'奥术大师多',NULL,NULL,'/hr/images/resume/15658094128915bfce300f0b20.jpg',NULL,1,'李冬','2019-08-15','李冬','2019-08-15',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'李冬','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,12,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,20000,'常州大学',NULL,NULL,'/hr/images/resume/15658094808735bfce300f0b20.jpg',NULL,1,'李冬','2019-08-15','李冬','2019-08-15',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过'),(26,'哈哈','社会招聘',NULL,NULL,1,NULL,NULL,'18773902190',NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,12,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,20000,'公告',NULL,NULL,'/hr/images/resume/15658503048545adfdf1990a0a.jpg',NULL,1,'李冬','2019-08-15','李冬','2019-08-15',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过','通过');

/*Table structure for table `engagesubjects` */

DROP TABLE IF EXISTS `engagesubjects`;

CREATE TABLE `engagesubjects` (
  `subId` int(11) NOT NULL AUTO_INCREMENT,
  `secondKindId` int(11) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `derivation` varchar(60) DEFAULT NULL,
  `content` text,
  `keyA` text,
  `keyB` text,
  `keyC` text,
  `keyD` text,
  `keyE` text,
  `correctKey` varchar(60) DEFAULT NULL,
  `changer` varchar(60) DEFAULT NULL,
  `changeTime` date DEFAULT NULL,
  PRIMARY KEY (`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `engagesubjects` */

/*Table structure for table `humanfile` */

DROP TABLE IF EXISTS `humanfile`;

CREATE TABLE `humanfile` (
  `humanId` int(11) NOT NULL AUTO_INCREMENT COMMENT '档案编号',
  `firstKindId` int(11) DEFAULT NULL COMMENT '一级机构编号',
  `secondKindId` int(11) DEFAULT NULL,
  `thirdKindId` int(11) DEFAULT NULL,
  `humanName` varchar(60) DEFAULT NULL,
  `humanAddress` varchar(200) DEFAULT NULL,
  `humanPostcode` varchar(10) DEFAULT NULL,
  `humanProDesignation` varchar(60) DEFAULT NULL,
  `humanMajorId` int(11) DEFAULT NULL,
  `humanTelephone` varchar(20) DEFAULT NULL,
  `humanMobilephone` varchar(11) DEFAULT NULL,
  `humanBank` varchar(60) DEFAULT NULL,
  `humanAccount` varchar(30) DEFAULT NULL,
  `humanQq` varchar(60) DEFAULT NULL,
  `humanEmail` varchar(60) DEFAULT NULL,
  `humanHobby` varchar(11) DEFAULT NULL,
  `humanSpecility` varchar(60) DEFAULT NULL,
  `humanSex` varchar(2) DEFAULT NULL,
  `humanReligion` varchar(60) DEFAULT NULL,
  `humanParty` varchar(60) DEFAULT NULL,
  `humanNationality` varchar(60) DEFAULT NULL,
  `humanRace` varchar(60) DEFAULT NULL,
  `humanBirthday` date DEFAULT NULL,
  `humanBirthplace` varchar(200) DEFAULT NULL,
  `humanAge` int(11) DEFAULT NULL,
  `humanEducatedDegree` varchar(60) DEFAULT NULL,
  `humanEducatedYears` varchar(11) DEFAULT NULL,
  `humanEducatedMajor` varchar(60) DEFAULT NULL,
  `humanSocietySecurityId` varchar(30) DEFAULT NULL,
  `humanIdcard` varchar(20) DEFAULT NULL,
  `remark` text,
  `salaryStandardId` varchar(30) DEFAULT NULL,
  `salarySum` int(11) DEFAULT NULL,
  `demandSalaraySum` int(11) DEFAULT NULL,
  `paidSalarySum` int(11) DEFAULT NULL,
  `majorChangeAmount` int(11) DEFAULT NULL,
  `bonusAmount` int(11) DEFAULT NULL,
  `trainingAmount` int(11) DEFAULT NULL,
  `fileChangAmount` int(11) DEFAULT NULL,
  `humanHistroyRecords` text,
  `humanFamilyMembership` text,
  `humanPicture` varchar(255) DEFAULT NULL,
  `attachmentName` varchar(255) DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `changer` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `changeTime` date DEFAULT NULL,
  `lastlyChangeTime` date DEFAULT NULL,
  `deleteTime` date DEFAULT NULL,
  `recoveryTime` date DEFAULT NULL,
  `humanFileStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`humanId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `humanfile` */

insert  into `humanfile`(`humanId`,`firstKindId`,`secondKindId`,`thirdKindId`,`humanName`,`humanAddress`,`humanPostcode`,`humanProDesignation`,`humanMajorId`,`humanTelephone`,`humanMobilephone`,`humanBank`,`humanAccount`,`humanQq`,`humanEmail`,`humanHobby`,`humanSpecility`,`humanSex`,`humanReligion`,`humanParty`,`humanNationality`,`humanRace`,`humanBirthday`,`humanBirthplace`,`humanAge`,`humanEducatedDegree`,`humanEducatedYears`,`humanEducatedMajor`,`humanSocietySecurityId`,`humanIdcard`,`remark`,`salaryStandardId`,`salarySum`,`demandSalaraySum`,`paidSalarySum`,`majorChangeAmount`,`bonusAmount`,`trainingAmount`,`fileChangAmount`,`humanHistroyRecords`,`humanFamilyMembership`,`humanPicture`,`attachmentName`,`checkStatus`,`register`,`checker`,`changer`,`registTime`,`checkTime`,`changeTime`,`lastlyChangeTime`,`deleteTime`,`recoveryTime`,`humanFileStatus`) values (6,NULL,NULL,NULL,'李冬',NULL,NULL,'老板',2,'18773902190','18773902190',NULL,NULL,NULL,NULL,NULL,NULL,'男',NULL,NULL,'中国',NULL,NULL,NULL,14,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'请问',NULL,'/hr/images/resume/1565348485485地球.jpg',NULL,0,NULL,NULL,'lidong',NULL,NULL,'2019-08-10','2019-08-10',NULL,NULL,NULL),(7,NULL,NULL,NULL,'李冬',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/resume/1565421576314地球.jpg',NULL,1,NULL,'lidong',NULL,NULL,'2019-08-13',NULL,NULL,NULL,NULL,NULL),(8,1,1,1,'李冬',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,'0','男',NULL,NULL,'0','汉族',NULL,NULL,14,NULL,NULL,NULL,NULL,'430524200111086332',NULL,'1565202606640',1523,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/manpower/15656103354055adfdf1990a0a.jpg','15656103354055adfdf1990a0a',1,'lidong','lidong',NULL,'2019-08-12','2019-08-13',NULL,NULL,NULL,NULL,0),(9,1,1,1,'lidong',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,'0','男',NULL,NULL,'0','汉族',NULL,NULL,18,NULL,NULL,NULL,NULL,'430524200111086332',NULL,'1565202606644',20000,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/manpower/15657647098225bfce300f0b20.jpg','15657647098225bfce300f0b20',1,'lidong','lidong',NULL,'2019-08-14','2019-08-14',NULL,NULL,NULL,NULL,0),(11,1,2,2,'小龙',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,'0','男',NULL,NULL,'0','汉族',NULL,NULL,18,NULL,NULL,NULL,NULL,'430524200111086332',NULL,'1565764537545',1000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/manpower/15657829472885adfdf1582217.jpg','15657829472885adfdf1582217',1,'lidong','lidong',NULL,'2019-08-14','2019-08-14',NULL,NULL,NULL,NULL,0),(12,NULL,NULL,NULL,'李冬',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,12,NULL,'九年义务教育','计算机科学',NULL,'430524200111086332',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/resume/15658094808735bfce300f0b20.jpg',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,'哈哈',NULL,NULL,'老板',1,'13357266361','18773902190',NULL,NULL,NULL,NULL,NULL,NULL,'男',NULL,NULL,'美国',NULL,NULL,NULL,19,'研究生','九年义务教育','计算机科学',NULL,'430524200111086332',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'水电费水电费',NULL,'/hr/images/resume/15658503048545adfdf1990a0a.jpg',NULL,0,NULL,NULL,'lidong',NULL,NULL,'2019-08-15','2019-08-15',NULL,NULL,NULL),(14,1,1,1,'一',NULL,NULL,NULL,1,NULL,'18773902190',NULL,NULL,NULL,NULL,NULL,'0','男',NULL,NULL,'0','汉族',NULL,NULL,12,NULL,NULL,NULL,NULL,'430524200111086332',NULL,'1565764537545',1000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/hr/images/manpower/15658507949755bfce300f0b20.jpg','15658507949755bfce300f0b20',1,'lidong','lidong',NULL,'2019-08-15','2019-08-15',NULL,NULL,'2019-08-15','2019-08-15',0);

/*Table structure for table `humanfiledig` */

DROP TABLE IF EXISTS `humanfiledig`;

CREATE TABLE `humanfiledig` (
  `hfdId` int(11) NOT NULL AUTO_INCREMENT,
  `humanId` varchar(30) DEFAULT NULL,
  `thirdKindId` int(11) DEFAULT NULL,
  `humanName` varchar(60) DEFAULT NULL,
  `humanAddress` varchar(200) DEFAULT NULL,
  `humanPostcode` varchar(10) DEFAULT NULL,
  `humanProDesignation` varchar(60) DEFAULT NULL,
  `humanMajorId` int(11) DEFAULT NULL,
  `humanTelephone` varchar(20) DEFAULT NULL,
  `humanMobilephone` varchar(11) DEFAULT NULL,
  `humanBank` varchar(60) DEFAULT NULL,
  `humanAccount` varchar(30) DEFAULT NULL,
  `humanQq` varchar(60) DEFAULT NULL,
  `humanEmail` varchar(60) DEFAULT NULL,
  `humanHobby` varchar(60) DEFAULT NULL,
  `humanSpecility` varchar(60) DEFAULT NULL,
  `humanSex` varchar(2) DEFAULT NULL,
  `humanReligion` varchar(60) DEFAULT NULL,
  `humanParty` varchar(60) DEFAULT NULL,
  `humanNationality` varchar(60) DEFAULT NULL,
  `humanRace` varchar(60) DEFAULT NULL,
  `humanBirthday` date DEFAULT NULL,
  `humanBirthplace` varchar(200) DEFAULT NULL,
  `humanAge` int(10) DEFAULT NULL,
  `humanEducatedDegree` varchar(60) DEFAULT NULL,
  `humanEducatedYears` int(11) DEFAULT NULL,
  `humanEducatedMajor` varchar(60) DEFAULT NULL,
  `humanSocietySecurityId` varchar(30) DEFAULT NULL,
  `humanIdcard` varchar(20) DEFAULT NULL,
  `remark` text,
  `salaryStandardId` varchar(30) DEFAULT NULL,
  `salarySum` int(11) DEFAULT NULL,
  `demandSalaraySum` int(11) DEFAULT NULL,
  `paidSalarySum` int(11) DEFAULT NULL,
  `majorChangeAmount` int(11) DEFAULT NULL,
  `bonusAmount` int(11) DEFAULT NULL,
  `trainingAmount` int(11) DEFAULT NULL,
  `fileChangAmount` int(11) DEFAULT NULL,
  `humanHistroyRecords` text,
  `humanFamilyMembership` text,
  `humanPicture` varchar(255) DEFAULT NULL,
  `attachmentName` varchar(255) DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `changer` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `changeTime` date DEFAULT NULL,
  `lastlyChangeTime` date DEFAULT NULL,
  `deleteTime` date DEFAULT NULL,
  `recoveryTime` date DEFAULT NULL,
  `humanFileStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`hfdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `humanfiledig` */

/*Table structure for table `majorchange` */

DROP TABLE IF EXISTS `majorchange`;

CREATE TABLE `majorchange` (
  `mchId` int(11) NOT NULL AUTO_INCREMENT,
  `thirdKindId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `newThirdKindId` int(11) DEFAULT NULL,
  `newMajorId` int(11) DEFAULT NULL,
  `humanId` varchar(30) DEFAULT NULL,
  `salaryStandardId` varchar(30) DEFAULT NULL,
  `salarySum` int(11) DEFAULT NULL,
  `newSalaryStandardId` varchar(30) DEFAULT NULL,
  `newSalarySum` int(11) DEFAULT NULL,
  `changeReason` text,
  `checkReason` text,
  `checkStatus` int(11) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  PRIMARY KEY (`mchId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `majorchange` */

insert  into `majorchange`(`mchId`,`thirdKindId`,`majorId`,`newThirdKindId`,`newMajorId`,`humanId`,`salaryStandardId`,`salarySum`,`newSalaryStandardId`,`newSalarySum`,`changeReason`,`checkReason`,`checkStatus`,`register`,`checker`,`registTime`,`checkTime`) values (1,1,1,1,1,'5','1565202606640',NULL,'1565202606640',1523,'调动','5re5e5',1,'lidong',NULL,'2019-08-13','2019-08-14'),(2,1,1,1,1,'5','1565202606640',NULL,'1565202606644',20000,'让我去',NULL,0,'lidong',NULL,'2019-08-13',NULL),(3,NULL,NULL,1,1,'8',NULL,NULL,'1565202606644',20000,'啥事',NULL,0,'lidong',NULL,'2019-08-13',NULL),(4,1,1,1,1,'8','1565202606644',20000,'1565202606644',20000,'698',NULL,0,'lidong',NULL,'2019-08-13',NULL),(5,1,1,1,1,'8','1565202606644',20000,'1565202606640',1523,'87',NULL,0,'lidong',NULL,'2019-08-13',NULL),(6,NULL,NULL,1,1,'9',NULL,NULL,'1565202606644',20000,'342','23',1,'lidong',NULL,'2019-08-14','2019-08-14'),(7,1,1,1,1,'9','1565202606644',20000,'1565202606644',20000,'345',NULL,0,'lidong',NULL,'2019-08-14',NULL),(8,1,1,1,1,'9','1565202606644',20000,'1565202606644',20000,'123',NULL,0,'lidong',NULL,'2019-08-14',NULL),(9,NULL,NULL,1,1,'10',NULL,NULL,'1565202606644',20000,'123','12',1,'lidong',NULL,'2019-08-14','2019-08-14'),(10,NULL,NULL,2,2,'11',NULL,NULL,'1565202606644',20000,'小龙调动了','tongguo',1,'lidong',NULL,'2019-08-14','2019-08-14'),(11,2,2,2,1,'11','1565202606644',20000,'1565764537545',1000,'回家','TGV',1,'lidong',NULL,'2019-08-15','2019-08-15'),(12,NULL,NULL,1,1,'14','1565202606644',20000,'1565764537545',1000,'三生三世','灌灌灌灌',1,'lidong',NULL,'2019-08-15','2019-08-15');

/*Table structure for table `right` */

DROP TABLE IF EXISTS `right`;

CREATE TABLE `right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(100) DEFAULT NULL COMMENT '访问地址',
  `pid` varchar(100) DEFAULT NULL COMMENT '分权限编号',
  `button` int(11) DEFAULT '0' COMMENT '是否是里面的按钮',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `right` */

insert  into `right`(`id`,`name`,`url`,`pid`,`button`) values (1,'招聘管理',NULL,'0',0),(2,'人力资源档案管理',NULL,'0',0),(3,'薪酬标准管理',NULL,'0',0),(4,'薪酬发放管理',NULL,'0',0),(5,'调动管理',NULL,'0',0),(6,'客户化设置',NULL,'0',0),(7,'标准数据报表',NULL,'0',0),(8,'权限管理',NULL,'0',0),(9,'职位发布管理',NULL,'1',0),(10,'简历管理',NULL,'1',0),(11,'面试管理',NULL,'1',0),(12,'录用管理',NULL,'1',0),(13,'职位发布登记','/hr/engageMajorRelease/addPosition','9',0),(15,'职位发布查询','/hr/engageMajorRelease/positions','9',0),(16,'简历登记','/hr/engageResume/register','10',0),(17,'简历筛选','/hr/engageResume/resumeFilterList','10',0),(18,'有效简历查询','/hr/engageResume/effectiveResumeList','10',0),(19,'面试登记','/hr/engageInterview/recommendedInterviewList','11',0),(20,'面试结果筛选','/hr/engageInterview/interviewScreeningList','11',0),(21,'录用申请','/hr/engageInterview/employmentApplicationList','12',0),(22,'录用审批','/hr/engageInterview/employmentApprovalList','12',0),(23,'录用查询','/hr/engageInterview/findEmployList','12',0),(24,'人力资源档案登记','/hr/HumanFile/goConfigfilefirstkind','2',0),(26,'人力资源档案登记查询','/hr/HumanFile/findMoreTableHumanfile','2',0),(28,'人力资源档案删除管理',NULL,'2',0),(29,'人力资源档案删除','/hr/HumanFile/findMoreTableHumanfileYes','28',0),(30,'档案删除恢复','/hr/HumanFile/selectBydelete','28',0),(32,'薪酬标准登记','/hr/salarystandardController/registerSalary','3',0),(33,'薪酬标准登记复核','/hr/salarystandardController/findNoChange','3',0),(34,'薪酬标准查询','/hr/salarystandardController/compensationStandards','3',0),(35,'薪酬标准变更','/hr/salarystandardController/findAllSalary','3',0),(36,'薪酬发放登记','/hr/salaryGrant/payrollRegistrationList','4',0),(37,'薪酬发放登记审核	','/hr/salaryGrant/noCheck','4',0),(38,'薪酬发放查询','/hr/salaryGrant/reviewBy','4',0),(39,'调动登记','/hr/MajorChangeController/findMajorChangeControllerAll','5',0),(40,'调动审核','/hr/MajorChangeController/findByMajorChangeCheckStatusNo','5',0),(41,'调动查询','/hr/MajorChangeController/findByMajorChangeCheckStatusYes','5',0),(42,'人力资源档案管理设置',NULL,'6',0),(43,'薪酬管理设置',NULL,'6',0),(45,'I级机构设置 ','/hr/Configfilefirstkind/QueryAllConfigfilefirstkind','42',0),(46,'II级机构设置 ','/hr/Configfilesecondkind/findByFirstKindQueryAll','42',0),(47,'III级机构设置 ','/hr/Configfilethirdkind/configfilethirdkindQueryAll','42',0),(48,'职称设置','/hr/Configmajordesignation/configmajordesignationQueryAll','42',0),(49,'职位分类设置','/hr/Configmajorkind/configmajorkindQueryAll','42',0),(50,'职位设置','/hr/Configmajor/configmajorQueryAll','42',0),(51,'公共属性设置','/hr/Configpublicchar/configpubliccharQueryAll','42',0),(52,'薪酬项目设置','/hr/Salarystandarddetails/salarystandarddetailsAll','43',0),(55,'Excel标准数据报表','/hr/statement/exportExcel','7',0),(56,'Pdt标准数据报表','/hr/statement/exportPDF','7',0),(57,'Xml标准数据报表','/hr/statement/exportXML','7',0),(58,'用户管理','/hr/user/users','8',0),(59,'角色管理','/hr/role/roles','8',0),(60,'用户添加','/hr/user/useradd','58',1),(61,'用户修改','/hr/user/usermodify','58',1),(62,'用户删除','/hr/user/delUser','58',1),(64,'分配权限','/hr/role/allocationRight','59',1),(65,'查询拥有的权限','/hr/right/findHaveRights','59',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL,
  `roleDesc` text,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`roleDesc`) values (1,'超级管理员','拥有至高无上的权利'),(2,'高管','哈哈哈哈哈'),(3,'招聘经理','XXX');

/*Table structure for table `roleright` */

DROP TABLE IF EXISTS `roleright`;

CREATE TABLE `roleright` (
  `rolerightId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `rightId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rolerightId`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8;

/*Data for the table `roleright` */

insert  into `roleright`(`rolerightId`,`roleId`,`rightId`) values (2,2,2),(3,2,3),(4,2,4),(6,2,6),(28,2,28),(36,2,36),(37,2,37),(38,2,38),(42,2,42),(43,2,43),(67,1,8),(117,1,58),(118,1,59),(156,2,29),(157,2,30),(158,2,31),(159,2,32),(160,2,33),(161,2,34),(162,2,35),(187,2,48),(188,2,49),(189,2,50),(190,2,51),(191,2,52),(192,2,53),(193,2,46),(194,2,47),(196,2,5),(197,2,7),(198,2,8),(214,2,24),(215,2,25),(216,2,26),(217,2,27),(218,2,39),(219,2,40),(220,2,41),(221,2,44),(222,2,45),(223,2,54),(224,2,55),(225,2,56),(226,2,57),(227,2,58),(228,2,59),(234,2,0),(235,2,0),(252,2,0),(253,2,0),(254,2,16),(255,2,10),(256,2,0),(257,2,1),(258,2,9),(259,2,11),(260,2,12),(261,2,13),(262,2,14),(263,2,15),(264,2,17),(265,2,18),(266,2,19),(267,2,20),(268,2,21),(269,2,22),(270,2,23),(271,1,0),(272,1,0),(273,1,0),(280,1,14),(290,1,0),(300,1,0),(301,1,0),(305,1,0),(309,1,0),(313,1,0),(317,1,0),(328,1,0),(339,1,0),(350,1,0),(351,1,0),(367,1,0),(372,1,0),(378,1,0),(386,1,0),(387,1,0),(388,1,0),(404,1,0),(405,1,0),(415,1,0),(416,1,0),(426,1,0),(429,1,25),(431,1,27),(436,1,0),(442,1,0),(447,1,0),(452,1,0),(459,1,31),(460,1,0),(479,1,44),(488,1,53),(489,1,54),(490,1,0),(495,1,0),(496,1,60),(497,1,0),(500,1,0),(501,1,63),(502,1,64),(503,1,65),(504,1,66),(506,1,0),(507,1,61),(509,1,0),(510,1,0),(512,1,0),(514,1,0),(516,1,0),(517,1,0),(518,1,0),(520,1,0),(521,1,0),(523,1,0),(524,1,1),(525,1,2),(526,1,3),(527,1,4),(528,1,5),(529,1,6),(530,1,7),(531,1,9),(532,1,10),(533,1,11),(534,1,12),(535,1,13),(536,1,15),(537,1,16),(538,1,17),(539,1,18),(540,1,19),(541,1,20),(542,1,21),(543,1,22),(544,1,23),(545,1,24),(546,1,26),(547,1,28),(548,1,29),(549,1,30),(550,1,32),(551,1,33),(552,1,34),(553,1,35),(554,1,36),(555,1,37),(556,1,38),(557,1,39),(558,1,40),(559,1,41),(560,1,42),(561,1,43),(562,1,45),(563,1,46),(564,1,47),(565,1,48),(566,1,49),(567,1,50),(568,1,51),(569,1,52),(570,1,55),(571,1,56),(572,1,57),(573,3,0),(574,3,1),(575,3,9),(576,3,10),(577,3,11),(578,3,12),(579,3,13),(580,3,15),(581,3,16),(582,3,17),(583,3,18),(584,3,19),(585,3,20),(586,3,21),(587,3,22),(588,3,23),(589,1,0),(590,1,62);

/*Table structure for table `salarygrant` */

DROP TABLE IF EXISTS `salarygrant`;

CREATE TABLE `salarygrant` (
  `salaryGrantId` varchar(100) NOT NULL,
  `salaryStandardId` varchar(60) DEFAULT NULL,
  `secondKindId` int(11) DEFAULT NULL,
  `humanAmount` int(11) DEFAULT NULL,
  `salaryStandardSum` double DEFAULT NULL,
  `salaryPaidSum` double DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  `firstKindId` int(11) DEFAULT NULL,
  `thirdkindId` int(11) DEFAULT NULL,
  PRIMARY KEY (`salaryGrantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salarygrant` */

insert  into `salarygrant`(`salaryGrantId`,`salaryStandardId`,`secondKindId`,`humanAmount`,`salaryStandardSum`,`salaryPaidSum`,`register`,`registTime`,`checker`,`checkTime`,`checkStatus`,`firstKindId`,`thirdkindId`) values ('SG1565285331073',NULL,0,4,24569,20000,'李冬','2019-08-09','李冬','2019-08-09',1,1,0),('SG1565286088524',NULL,0,4,24569,21000,'李冬','2019-08-09','李冬','2019-08-09',1,1,0),('SG1565288698913',NULL,0,4,24569,31000,'李冬','2019-08-09','李冬','2019-08-09',1,1,0),('SG1565288855423',NULL,1,3,4569,239911,'李冬','2019-08-09','李冬','2019-08-09',1,0,0),('SG1565288950401',NULL,0,4,24569,34569.01,'李冬','2019-08-09','李冬','2019-08-10',1,1,0),('SG1565289227204',NULL,0,4,24569,2710000,'李冬','2019-08-09','李冬','2019-08-09',1,1,0),('SG1565420298006',NULL,0,4,24569,1340,'李冬','2019-08-10','李冬','2019-08-10',1,1,0),('SG1565420922189',NULL,0,4,24569,24573,'李冬','2019-08-10','李冬','2019-08-10',1,1,0),('SG1565607933363',NULL,0,1,1523,21523,'李冬','2019-08-12','李冬','2019-08-12',1,1,0),('SG1565764588537',NULL,0,2,31423,32005,'李冬','2019-08-14','李冬','2019-08-14',1,1,0),('SG1565809749406',NULL,0,5,91423,91622,'李冬','2019-08-15','李冬','2019-08-15',1,1,0),('SG1565850641843',NULL,0,4,52423,52622,'李冬','2019-08-15','李冬','2019-08-15',1,1,0);

/*Table structure for table `salarygrantdetails` */

DROP TABLE IF EXISTS `salarygrantdetails`;

CREATE TABLE `salarygrantdetails` (
  `grdId` int(11) NOT NULL AUTO_INCREMENT,
  `salaryGrantId` varchar(30) DEFAULT NULL,
  `humanId` varchar(30) DEFAULT NULL,
  `bounsSum` double DEFAULT NULL,
  `saleSum` double DEFAULT NULL,
  `deductSum` double DEFAULT NULL,
  `salaryStandardSum` double DEFAULT NULL,
  `salaryPaidSum` double DEFAULT NULL,
  PRIMARY KEY (`grdId`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `salarygrantdetails` */

insert  into `salarygrantdetails`(`grdId`,`salaryGrantId`,`humanId`,`bounsSum`,`saleSum`,`deductSum`,`salaryStandardSum`,`salaryPaidSum`) values (13,'SG1565285331073','1',10000,10000,0,1523,20000),(14,'SG1565285331073','2',0,0,0,1523,0),(15,'SG1565285331073','3',0,0,0,1523,0),(16,'SG1565285331073','4',0,0,0,20000,0),(17,'SG1565286088524','1',10000,10000,0,1523,20000),(18,'SG1565286088524','2',1000,0,0,1523,1000),(19,'SG1565286088524','3',0,0,0,1523,0),(20,'SG1565286088524','4',0,0,0,20000,0),(21,'SG1565288698913','1',1000,19000,0,1523,20000),(22,'SG1565288698913','2',0,1000,0,1523,1000),(23,'SG1565288698913','3',10000,0,0,1523,10000),(24,'SG1565288698913','4',0,0,0,20000,0),(25,'SG1565288855423','1',10000,20000,0,1523,30000),(26,'SG1565288855423','2',30000,80000,0,1523,110000),(27,'SG1565288855423','3',43345,56566,0,1523,99911),(28,'SG1565288950401','1',10000.01,0,0,1523,11523.01),(29,'SG1565288950401','2',0,0,0,1523,1523),(30,'SG1565288950401','3',0,0,0,1523,1523),(31,'SG1565288950401','4',0,0,0,20000,20000),(32,'SG1565289227204','1',1000000,0,100000,1523,900000),(33,'SG1565289227204','2',1000000,0,100000,1523,900000),(34,'SG1565289227204','3',1000000,0,100000,1523,900000),(35,'SG1565289227204','4',0,10000,0,20000,10000),(36,'SG1565420298006','1',123,213,1,1523,335),(37,'SG1565420298006','2',123,213,1,1523,335),(38,'SG1565420298006','3',123,213,1,1523,335),(39,'SG1565420298006','4',123,213,1,20000,335),(40,'SG1565420922189','1',1,0,0,1523,1524),(41,'SG1565420922189','2',1,0,0,1523,1524),(42,'SG1565420922189','3',1,0,0,1523,1524),(43,'SG1565420922189','4',1,0,0,20000,20001),(44,'SG1565607933363','5',10000,10000,0,1523,21523),(45,'SG1565764588537','5',123,123,0,20000,20246),(46,'SG1565764588537','8',123,213,0,11423,11759),(47,'SG1565809749406','5',100,100,1,20000,20199),(48,'SG1565809749406','8',0,0,0,11423,11423),(49,'SG1565809749406','9',0,0,0,20000,20000),(50,'SG1565809749406','10',0,0,0,20000,20000),(51,'SG1565809749406','11',0,0,0,20000,20000),(52,'SG1565850641843','8',100,100,1,11423,11622),(53,'SG1565850641843','9',0,0,0,20000,20000),(54,'SG1565850641843','10',0,0,0,20000,20000),(55,'SG1565850641843','11',0,0,0,1000,1000);

/*Table structure for table `salarystandard` */

DROP TABLE IF EXISTS `salarystandard`;

CREATE TABLE `salarystandard` (
  `standardId` varchar(100) NOT NULL,
  `standardName` varchar(60) DEFAULT NULL,
  `designer` varchar(11) NOT NULL,
  `register` varchar(70) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `changer` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `salarySum` double DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  `changeStatus` int(11) DEFAULT NULL,
  `checkComment` text,
  `remark` text,
  `changeTime` date DEFAULT NULL,
  PRIMARY KEY (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salarystandard` */

insert  into `salarystandard`(`standardId`,`standardName`,`designer`,`register`,`checker`,`changer`,`registTime`,`checkTime`,`salarySum`,`checkStatus`,`changeStatus`,`checkComment`,`remark`,`changeTime`) values ('1565202606640','程序员','李冬','李冬','李冬','李冬','2019-08-08','2019-08-08',11423,0,NULL,'通过','备注','2019-08-14'),('1565202606644','经理','李冬','李冬','李冬','李冬','2019-08-08','2019-08-08',20000,1,NULL,NULL,NULL,'2019-08-08'),('1565420272677','123','李冬','李冬','李冬',NULL,'2019-08-10','2019-08-10',123,1,NULL,'312','312',NULL),('1565764537545','标准1','李冬','李冬','李冬',NULL,'2019-08-14','2019-08-14',1000,1,NULL,'1221','12',NULL),('1565809604027','标准','李冬','李冬','李冬','李冬','2019-08-15','2019-08-15',31000,0,NULL,'可好看','吊扇灯','2019-08-15'),('1565850571187','标准','李冬','李冬','李冬',NULL,'2019-08-15','2019-08-15',11000,1,NULL,'sdf','机会sad',NULL);

/*Table structure for table `salarystandarddetails` */

DROP TABLE IF EXISTS `salarystandarddetails`;

CREATE TABLE `salarystandarddetails` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(60) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `standardId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `salarystandarddetails` */

insert  into `salarystandarddetails`(`itemId`,`itemName`,`salary`,`standardId`) values (1,'出差补助',123,'1565202606640'),(2,'交通补贴',100,'1565202606640'),(3,'住房补贴',100,'1565202606640'),(4,'基本工资',100,'1565202606640'),(5,'年终奖',10000,'1565202606640'),(6,'误餐补助',1000,'1565202606640'),(7,'项目',0,NULL),(8,'项目1',123,'1565420272677'),(9,'阿萨德',1000,'1565764537545'),(14,'薪酬项目1',1000,'1565809604027'),(15,'薪酬项目2',20000,'1565809604027'),(16,'薪酬项目3',10000,'1565809604027'),(18,'项目1',10000,'1565850571187'),(19,'项目2',1000,'1565850571187'),(20,'项目3',0,'1565850571187');

/*Table structure for table `training` */

DROP TABLE IF EXISTS `training`;

CREATE TABLE `training` (
  `traId` int(11) NOT NULL AUTO_INCREMENT,
  `majorKindId` int(11) DEFAULT NULL,
  `majorKindName` varchar(60) DEFAULT NULL,
  `majorId` int(60) DEFAULT NULL,
  `majorName` varchar(255) DEFAULT NULL,
  `humanId` varchar(30) DEFAULT NULL,
  `humanName` varchar(60) DEFAULT NULL,
  `trainingItem` varchar(30) DEFAULT NULL,
  `trainingTime` date DEFAULT NULL,
  `trainingHour` int(11) DEFAULT NULL,
  `trainingDegree` varchar(60) DEFAULT NULL,
  `register` varchar(60) DEFAULT NULL,
  `checker` varchar(60) DEFAULT NULL,
  `registTime` date DEFAULT NULL,
  `checkTime` date DEFAULT NULL,
  `checkStatus` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`traId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `training` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `uName` varchar(60) NOT NULL COMMENT '用户名称',
  `trueName` varchar(60) NOT NULL COMMENT '真实姓名',
  `uPassword` varchar(60) NOT NULL COMMENT '密码',
  `roleId` int(11) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`uId`,`uName`,`trueName`,`uPassword`,`roleId`) values (1,'lidong','李冬','123',1),(2,'admin','管理员','123',1),(9,'zhaoping','招聘经理','123',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
