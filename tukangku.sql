/*
SQLyog Community v12.2.6 (64 bit)
MySQL - 5.6.25 : Database - tukangku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tukangku` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tukangku`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `USERNAME_ADMIN` varchar(200) NOT NULL,
  `PASSWORD_ADMIN` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`USERNAME_ADMIN`,`PASSWORD_ADMIN`) values 
('admin','admin');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `ID_CUSTOMER` int(11) NOT NULL,
  `NAMA_CUSTOMER` varchar(200) NOT NULL,
  `NO_TLP_CUSTOMER` int(11) NOT NULL,
  `DEPOSITO` varchar(100) DEFAULT NULL,
  `BBM_CUSTOMER` varchar(9) DEFAULT NULL,
  `EMAIL_CUSTOMER` varchar(100) NOT NULL,
  `ALAMAT_CUSTOMER` varchar(1024) NOT NULL,
  `PASSWORD_CUSTOMER` varchar(200) DEFAULT NULL,
  `waktu daftar` date DEFAULT NULL,
  PRIMARY KEY (`ID_CUSTOMER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`ID_CUSTOMER`,`NAMA_CUSTOMER`,`NO_TLP_CUSTOMER`,`DEPOSITO`,`BBM_CUSTOMER`,`EMAIL_CUSTOMER`,`ALAMAT_CUSTOMER`,`PASSWORD_CUSTOMER`,`waktu daftar`) values 
(1,'user',1,'1','1','1','1','user',NULL);

/*Table structure for table `detail_rating` */

DROP TABLE IF EXISTS `detail_rating`;

CREATE TABLE `detail_rating` (
  `ID_RATING` int(11) DEFAULT NULL,
  `ID_JASA` int(11) DEFAULT NULL,
  `ID_KATEGORI` int(11) DEFAULT NULL,
  `ID_DETAIL_RATING` varchar(100) DEFAULT NULL,
  KEY `FK_RELATIONSHIP_10` (`ID_RATING`),
  KEY `FK_RELATIONSHIP_11` (`ID_JASA`),
  KEY `FK_RELATIONSHIP_12` (`ID_KATEGORI`),
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`ID_RATING`) REFERENCES `rating` (`ID_RATING`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`ID_KATEGORI`) REFERENCES `kategori` (`ID_KATEGORI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_rating` */

/*Table structure for table `favorit` */

DROP TABLE IF EXISTS `favorit`;

CREATE TABLE `favorit` (
  `ID_FAVORIT` char(10) NOT NULL,
  `ID_KATEGORI` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_FAVORIT`),
  KEY `FK_RELATIONSHIP_8` (`ID_CUSTOMER`),
  KEY `FK_RELATIONSHIP_9` (`ID_KATEGORI`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`ID_KATEGORI`) REFERENCES `kategori` (`ID_KATEGORI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `favorit` */

/*Table structure for table `jasa` */

DROP TABLE IF EXISTS `jasa`;

CREATE TABLE `jasa` (
  `ID_JASA` int(11) NOT NULL,
  `NAMA_JASA` varchar(200) DEFAULT NULL,
  `NO_TLP_JASA` int(11) DEFAULT NULL,
  `BBM_JASA` varchar(9) DEFAULT NULL,
  `EMAIL_JASA` varchar(100) DEFAULT NULL,
  `ALAMAT_KAB_JASA` varchar(200) DEFAULT NULL,
  `ALAMAT_KEC_JASA` varchar(200) DEFAULT NULL,
  `INFO` varchar(100) DEFAULT NULL,
  `PASSWORD_JASA` varchar(200) DEFAULT NULL,
  `KOORDINAT_LONGITUDE` varchar(100) DEFAULT NULL,
  `FOTO` varchar(500) DEFAULT NULL,
  `KOORDINAT_LATITUDE` varchar(100) DEFAULT NULL,
  `WAKTU_DAFTAR` varchar(100) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `pengalaman` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID_JASA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jasa` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `ID_KATEGORI` int(11) NOT NULL,
  `NAMA_KATEGORI` varchar(100) DEFAULT NULL,
  `JENIS_JASA` varchar(100) DEFAULT NULL,
  `PENGALAMAN_JASA` varchar(1024) DEFAULT NULL,
  `VALIDASI` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID_KATEGORI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

/*Table structure for table `login_customer` */

DROP TABLE IF EXISTS `login_customer`;

CREATE TABLE `login_customer` (
  `ID_LOGIN_CUSTOMER` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  `TERAKHIR_LOGIN_CUSTOMER` date NOT NULL,
  PRIMARY KEY (`ID_LOGIN_CUSTOMER`),
  KEY `FK_RELATIONSHIP_4` (`ID_CUSTOMER`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_customer` */

/*Table structure for table `login_jasa` */

DROP TABLE IF EXISTS `login_jasa`;

CREATE TABLE `login_jasa` (
  `ID_LOGIN_JASA` int(11) NOT NULL,
  `ID_JASA` int(11) DEFAULT NULL,
  `TERAKHIR_LOGIN_JASA` date DEFAULT NULL,
  PRIMARY KEY (`ID_LOGIN_JASA`),
  KEY `FK_RELATIONSHIP_3` (`ID_JASA`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_JASA`) REFERENCES `jasa` (`ID_JASA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_jasa` */

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `ID_RATING` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  `RATING_PER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RATING`),
  KEY `FK_RELATIONSHIP_7` (`ID_CUSTOMER`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
