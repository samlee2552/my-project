/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.1.46-MariaDB : Database - mp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `mp`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(10) unsigned NOT NULL,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayStatus` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`memberId`,`regDate`,`updateDate`,`delDate`,`delStatus`,`displayStatus`,`title`,`body`) values 
(1,1,'2020-09-14 13:34:27','2020-09-14 13:34:27',NULL,0,1,'제목1','내용1'),
(2,1,'2020-09-14 13:34:27','2020-09-14 13:34:27',NULL,0,1,'제목2','내용2'),
(3,1,'2020-09-14 13:34:28','2020-09-14 13:34:28',NULL,0,1,'제목3','내용3');

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relTypeCode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `originFileName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fileExt` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `typeCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `type2Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `fileSize` int(10) unsigned NOT NULL,
  `fileExtTypeCode` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `fileExtType2Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `fileNo` tinyint(2) unsigned NOT NULL,
  `body` longblob,
  PRIMARY KEY (`id`),
  KEY `relId` (`relId`,`relTypeCode`,`typeCode`,`type2Code`,`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `file` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `authStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loginId` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `loginPw` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `cellphoneNo` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`delDate`,`delStatus`,`authStatus`,`loginId`,`loginPw`,`name`,`nickname`,`email`,`cellphoneNo`) values 
(1,'2020-09-14 13:34:31','2020-09-14 13:34:31',NULL,0,0,'admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','관리자','관리자','admin@admin.com','01012341234'),
(2,'2020-09-14 21:49:27','2020-09-14 21:57:54',NULL,0,1,'saml2l','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','이상범','쌤리','samlee2552@gmail.com','01098939933');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberId` int(10) unsigned NOT NULL,
  `relTypeCode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relId` (`relId`,`relTypeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reply` */

insert  into `reply`(`id`,`memberId`,`relTypeCode`,`relId`,`regDate`,`updateDate`,`delDate`,`delStatus`,`displayStatus`,`body`) values 
(1,1,'article',1,'2020-09-14 13:34:36','2020-09-14 13:34:36',NULL,0,1,'내용1'),
(2,2,'article',3,'2020-09-15 09:05:39',NULL,NULL,0,1,'321312'),
(3,2,'article',3,'2020-09-15 09:05:40',NULL,NULL,0,1,'123421342');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
