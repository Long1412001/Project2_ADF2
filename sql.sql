-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

-- Dumping structure for table test.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` char(50) NOT NULL DEFAULT '',
  `Password` char(50) NOT NULL DEFAULT '',
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `FK6` (`RoleID`) USING BTREE,
  CONSTRAINT `FK_admin_role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table test.admin: ~2 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`AdminID`, `UserName`, `Password`, `RoleID`) VALUES
	(1, 'Admin1', '123123', 1),
	(2, 'Admin2', '123456', 2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table test.book
CREATE TABLE IF NOT EXISTS `book` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `BookName` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `AuthorName` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int(20) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `FK_book_category` (`CategoryID`),
  CONSTRAINT `FK_book_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table test.book: ~13 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
REPLACE INTO `book` (`BookID`, `BookName`, `AuthorName`, `Price`, `Quantity`, `CategoryID`) VALUES
	(1, 'Việt Nam vận hội', 'Nguyễn Thế Anh', 199000, 5, 2),
	(2, 'Hà Nội 1967 - 1975', 'Thomas Billhardt', 224000, 5, 2),
	(3, 'Một số danh nhân văn hoá quân sự Việt Nam tiêu biể', 'Dương Xuân Đống', 71000, 5, 2),
	(4, 'Đại nam dật sự và sử ta so với sử tàu', 'Ứng Hoè Nguyễn Văn Tố', 108000, 5, 2),
	(5, 'Thoái thực ký văn', 'Trương Quốc Dụng', 276000, 5, 2),
	(6, 'Cuốn Theo Chiều Gió', 'Margaret Mtchell', 220000, 5, 1),
	(7, 'Vụ Án Mạng Ở Nhà Khách Núi Hakuba', 'Hagashi Keigo', 138000, 5, 1),
	(8, 'Ông già và biển cả', 'Ernest Hemingway', 45000, 5, 1),
	(9, 'Nhà Giả Kim', 'O Alquimista', 79000, 5, 1),
	(10, 'Mộ Đom Đóm', 'Akituki Nosaka', 96000, 5, 1),
	(11, 'ESSEMTIAL WORDS FOR THE TOEIC', 'Dr. Lin Lougheed', 190000, 5, 3),
	(12, 'TAKING THE TOEIC 2 ', 'Compass Publishing', 206000, 5, 3),
	(13, 'TOEIC UPGRADE', 'Peggy Anderson', 190000, 5, 3),
	(14, 'PASS THE TOEIC TEST', 'Miles Craven', 118000, 5, 3),
	(15, 'Cẩm Nang Cấu Trúc Tiếng Anh', 'Trang Anh ', 85000, 4, 3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table test.borrowbooks
CREATE TABLE IF NOT EXISTS `borrowbooks` (
  `BorrowBooksUD` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `Begin` date NOT NULL,
  `Date` date NOT NULL,
  `Finish` date DEFAULT NULL,
  PRIMARY KEY (`BorrowBooksUD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table test.borrowbooks: ~2 rows (approximately)
/*!40000 ALTER TABLE `borrowbooks` DISABLE KEYS */;
REPLACE INTO `borrowbooks` (`BorrowBooksUD`, `UserID`, `BookID`, `Begin`, `Date`, `Finish`) VALUES
	(1, 1, 1, '2021-08-11', '2021-09-11', '2021-09-09'),
	(2, 2, 4, '2021-09-23', '2021-10-23', '2021-09-29'),
	(3, 3, 15, '2021-10-11', '2021-11-11', NULL);
/*!40000 ALTER TABLE `borrowbooks` ENABLE KEYS */;

-- Dumping structure for table test.category
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `PunishMulty` float NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table test.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`CategoryID`, `CategoryName`, `PunishMulty`) VALUES
	(1, 'Văn Học', 1),
	(2, 'Lịch Sử', 2),
	(3, 'Tiếng Anh', 1.2);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table test.punish
CREATE TABLE IF NOT EXISTS `punish` (
  `PunishID` int(11) NOT NULL AUTO_INCREMENT,
  `Descrpition` char(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `Formular` float NOT NULL,
  PRIMARY KEY (`PunishID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table test.punish: ~4 rows (approximately)
/*!40000 ALTER TABLE `punish` DISABLE KEYS */;
REPLACE INTO `punish` (`PunishID`, `Descrpition`, `Formular`) VALUES
	(1, '<=10% hư hại', 0.3),
	(2, '10-40% hư hại', 0.4),
	(3, '40-70% hư hại', 0.7),
	(4, '>70% hư hại', 1);
/*!40000 ALTER TABLE `punish` ENABLE KEYS */;

-- Dumping structure for table test.punishment
CREATE TABLE IF NOT EXISTS `punishment` (
  `PunishmentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `PunishID` int(11) NOT NULL,
  `Total` double DEFAULT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`PunishmentID`),
  KEY `FK8` (`UserID`),
  KEY `FK9` (`BookID`),
  KEY `FK10` (`PunishID`),
  CONSTRAINT `FK10` FOREIGN KEY (`PunishID`) REFERENCES `punish` (`PunishID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK8` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK9` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table test.punishment: ~0 rows (approximately)
/*!40000 ALTER TABLE `punishment` DISABLE KEYS */;
REPLACE INTO `punishment` (`PunishmentID`, `UserID`, `BookID`, `PunishID`, `Total`, `Paid`) VALUES
	(1, 2, 8, 1, 17000, 0);
/*!40000 ALTER TABLE `punishment` ENABLE KEYS */;

-- Dumping structure for table test.role
CREATE TABLE IF NOT EXISTS `role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL DEFAULT '',
  `Description` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT '',
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Dumping data for table test.role: ~2 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
REPLACE INTO `role` (`RoleID`, `RoleName`, `Description`) VALUES
	(1, 'Librarian', ''),
	(2, 'Book Manager', '');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table test.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL DEFAULT '',
  `Birthday` date NOT NULL,
  `Address` char(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL DEFAULT '',
  `Phone` char(50) NOT NULL DEFAULT '',
  `NumberBook` int(11) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table test.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`UserID`, `Name`, `Birthday`, `Address`, `Phone`, `NumberBook`) VALUES
	(1, 'Vương Công Minh', '1998-10-19', 'Hà Nội', '0389712467', 0),
	(2, 'Ngô Thành Long', '1999-04-07', 'Hà Nội', '0389712579', 0),
	(3, 'Tạ Hồng Sơn', '1998-08-10', 'Hà Nội', '0389715894', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
