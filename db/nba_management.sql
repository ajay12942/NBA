-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 23, 2024 at 03:02 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nba_management`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `SearchAge`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAge` (IN `page` INT(11))   SELECT P_NAME,P_AGE,P_STATE FROM PLAYERS P WHERE P.P_AGE = page$$

DROP PROCEDURE IF EXISTS `SearchName`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchName` (IN `page` VARCHAR(30))   SELECT * FROM personal_details WHERE player_name = page$$

DROP PROCEDURE IF EXISTS `SearchNationality`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchNationality` (IN `page` VARCHAR(30))   SELECT * FROM personal_details WHERE personal_details.nationality=page$$

DROP PROCEDURE IF EXISTS `SearchOverallRating`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchOverallRating` (IN `page` INT(11))   SELECT * FROM personal_details WHERE personal_details.overall_rating = page$$

DROP PROCEDURE IF EXISTS `Searchplayerid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Searchplayerid` (IN `page` INT(11))   SELECT * FROM personal_details WHERE player_id = page$$

DROP PROCEDURE IF EXISTS `SearchPosition`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPosition` (IN `page` VARCHAR(11))   SELECT pd.player_name, pd.overall_rating, od.preferred_position, p.gk, p.df, p.cm, p.fr FROM personal_details pd, other_details od, position p WHERE od.preferred_position = page AND p.player_id = od.player_id AND p.player_id = pd.player_id GROUP BY pd.player_id$$

DROP PROCEDURE IF EXISTS `SearchTeam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTeam` (IN `page` VARCHAR(30))   SELECT pd.player_name,pd.overall_rating,pd.age,pd.nationality,od.club FROM personal_details pd,other_details od WHERE od.club = page AND pd.player_id = od.player_id ORDER BY pd.player_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `PLAYER_ID` int NOT NULL,
  `C_NAME` varchar(50) DEFAULT NULL,
  `PREFFERED_POS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`PLAYER_ID`, `C_NAME`, `PREFFERED_POS`) VALUES
(1, 'Punjab Steelers', 'Point Guard'),
(2, 'Chennai Slam', 'Power Forward'),
(3, 'Hyderabad Sky', 'Point Guard'),
(4, 'Mumbai Challengers', 'Shooting Guard'),
(5, 'Delhi Capitals', 'Small Forward'),
(6, 'Jaipur Regals', 'Shooting Guard'),
(7, 'Kolkata Tigers', 'Point Guard'),
(8, 'Bengaluru Beast', 'Power Forward'),
(9, 'Kerala Cobras', 'Small Forward'),
(10, 'Pune Peshwas', 'Point Guard'),
(11, 'Haryana Gold', 'Shooting Guard'),
(12, 'Goa Snipers', 'Small Forward'),
(13, 'Nagpur Royals', 'Power Forward'),
(14, 'Ahmedabad Wonders', 'Point Guard'),
(15, 'Assam Flyers', 'Shooting Guard');

--
-- Triggers `club`
--
DROP TRIGGER IF EXISTS `delete_trigger_club`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_club` AFTER DELETE ON `club` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES("deleted successfull from the table club",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_club`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_club` AFTER INSERT ON `club` FOR EACH ROW INSERT INTO	insert_logs VALUES(null,"inserted successfull in club",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_club`;
DELIMITER $$
CREATE TRIGGER `update_trigger_club` AFTER UPDATE ON `club` FOR EACH ROW INSERT INTO update_logs(action,time) VALUES("insertion is successfull in club",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `delete_logs`
--

DROP TABLE IF EXISTS `delete_logs`;
CREATE TABLE IF NOT EXISTS `delete_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delete_logs`
--

INSERT INTO `delete_logs` (`id`, `action`, `time`) VALUES
(1, 'Deleted sucessfully in Players Table', '2024-03-22 05:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `gp`
--

DROP TABLE IF EXISTS `gp`;
CREATE TABLE IF NOT EXISTS `gp` (
  `PLAYER_ID` int NOT NULL,
  `STRENGTH` int DEFAULT NULL,
  `POWER` int DEFAULT NULL,
  `ENDURANCE` int DEFAULT NULL,
  `CORDINATION` int DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gp`
--

INSERT INTO `gp` (`PLAYER_ID`, `STRENGTH`, `POWER`, `ENDURANCE`, `CORDINATION`) VALUES
(1, 8, 8, 8, 8),
(2, 8, 8, 8, 7),
(3, 8, 7, 8, 8),
(4, 8, 9, 7, 8),
(5, 8, 7, 9, 8),
(6, 8, 8, 8, 8),
(7, 9, 8, 7, 8),
(8, 7, 8, 9, 7),
(9, 8, 8, 7, 8),
(10, 8, 7, 8, 8),
(11, 7, 8, 8, 8),
(12, 8, 7, 8, 8),
(13, 7, 8, 8, 8),
(14, 8, 7, 8, 8),
(15, 8, 8, 7, 8),
(16, 8, 9, 8, 9);

--
-- Triggers `gp`
--
DROP TRIGGER IF EXISTS `GP_AVG_INSERT`;
DELIMITER $$
CREATE TRIGGER `GP_AVG_INSERT` AFTER INSERT ON `gp` FOR EACH ROW BEGIN
    DECLARE gp_avg FLOAT;
    SET gp_avg = (NEW.STRENGTH + NEW.POWER + NEW.ENDURANCE + NEW.CORDINATION) / 4;
    INSERT INTO PERFORMANCE (PLAYER_ID, GP_AVG) VALUES (NEW.PLAYER_ID, gp_avg)
    ON DUPLICATE KEY UPDATE GP_AVG = gp_avg;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_trigger_gp`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_gp` AFTER DELETE ON `gp` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES("deleted successfull from the table general performance",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_gp`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_gp` AFTER INSERT ON `gp` FOR EACH ROW INSERT INTO	insert_logs VALUES(null,"inserted successfull in general performance",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_gp`;
DELIMITER $$
CREATE TRIGGER `update_trigger_gp` AFTER UPDATE ON `gp` FOR EACH ROW INSERT INTO update_logs(action,time) VALUES("insertion is successfull in general performance ",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `insert_logs`
--

DROP TABLE IF EXISTS `insert_logs`;
CREATE TABLE IF NOT EXISTS `insert_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `insert_logs`
--

INSERT INTO `insert_logs` (`id`, `action`, `time`) VALUES
(1, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(2, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(3, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(4, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(5, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(6, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(7, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(8, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(9, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(10, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(11, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(12, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(13, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(14, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(15, 'inserted sucessfully in players table', '2024-03-22 04:18:07'),
(16, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(17, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(18, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(19, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(20, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(21, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(22, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(23, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(24, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(25, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(26, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(27, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(28, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(29, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(30, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(31, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(32, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(33, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(34, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(35, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(36, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(37, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(38, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(39, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(40, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(41, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(42, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(43, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(44, 'inserted sucessfully in performance table', '2024-03-22 04:19:15'),
(45, 'inserted successfull in general performance', '2024-03-22 04:19:15'),
(46, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(47, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(48, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(49, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(50, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(51, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(52, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(53, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(54, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(55, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(56, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(57, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(58, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(59, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(60, 'inserted successfull in specific performance', '2024-03-22 04:19:46'),
(61, 'inserted into position successfull', '2024-03-22 04:22:47'),
(62, 'inserted into position successfull', '2024-03-22 04:22:47'),
(63, 'inserted into position successfull', '2024-03-22 04:22:47'),
(64, 'inserted into position successfull', '2024-03-22 04:22:47'),
(65, 'inserted into position successfull', '2024-03-22 04:22:47'),
(66, 'inserted into position successfull', '2024-03-22 04:22:47'),
(67, 'inserted into position successfull', '2024-03-22 04:22:47'),
(68, 'inserted into position successfull', '2024-03-22 04:22:47'),
(69, 'inserted into position successfull', '2024-03-22 04:22:47'),
(70, 'inserted into position successfull', '2024-03-22 04:22:47'),
(71, 'inserted into position successfull', '2024-03-22 04:22:47'),
(72, 'inserted into position successfull', '2024-03-22 04:22:47'),
(73, 'inserted into position successfull', '2024-03-22 04:22:47'),
(74, 'inserted into position successfull', '2024-03-22 04:22:47'),
(75, 'inserted into position successfull', '2024-03-22 04:22:47'),
(76, 'inserted successfull in club', '2024-03-22 04:23:22'),
(77, 'inserted successfull in club', '2024-03-22 04:23:22'),
(78, 'inserted successfull in club', '2024-03-22 04:23:22'),
(79, 'inserted successfull in club', '2024-03-22 04:23:22'),
(80, 'inserted successfull in club', '2024-03-22 04:23:22'),
(81, 'inserted successfull in club', '2024-03-22 04:23:22'),
(82, 'inserted successfull in club', '2024-03-22 04:23:22'),
(83, 'inserted successfull in club', '2024-03-22 04:23:22'),
(84, 'inserted successfull in club', '2024-03-22 04:23:22'),
(85, 'inserted successfull in club', '2024-03-22 04:23:22'),
(86, 'inserted successfull in club', '2024-03-22 04:23:22'),
(87, 'inserted successfull in club', '2024-03-22 04:23:22'),
(88, 'inserted successfull in club', '2024-03-22 04:23:22'),
(89, 'inserted successfull in club', '2024-03-22 04:23:22'),
(90, 'inserted successfull in club', '2024-03-22 04:23:22'),
(91, 'inserted sucessfully in players table', '2024-03-22 05:06:42'),
(92, 'inserted sucessfully in performance table', '2024-03-22 05:07:19'),
(93, 'inserted successfull in general performance', '2024-03-22 05:07:19'),
(94, 'inserted sucessfully in players table', '2024-03-22 05:11:27'),
(95, 'inserted sucessfully in performance table', '2024-03-22 05:12:32'),
(96, 'inserted successfull in general performance', '2024-03-22 05:12:32'),
(97, 'inserted successfull in specific performance', '2024-03-22 05:13:56'),
(98, 'inserted sucessfully in players table', '2024-03-23 14:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
CREATE TABLE IF NOT EXISTS `performance` (
  `PLAYER_ID` int NOT NULL,
  `SP_AVG` float DEFAULT NULL,
  `GP_AVG` float DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`PLAYER_ID`, `SP_AVG`, `GP_AVG`) VALUES
(1, 8, 8),
(2, 7.33333, 7.75),
(3, 7.16667, 7.75),
(4, 7.5, 8),
(5, 7.66667, 8),
(6, 7.33333, 8),
(7, 7.5, 8),
(8, 7.33333, 7.75),
(9, 7.5, 7.75),
(10, 7.5, 7.75),
(11, 7.5, 7.75),
(12, 7.33333, 7.75),
(13, 7.5, 7.75),
(14, 7.5, 7.75),
(15, 7.33333, 7.75),
(16, 7, 8.5);

--
-- Triggers `performance`
--
DROP TRIGGER IF EXISTS `delete_trigger_per`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_per` AFTER DELETE ON `performance` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES("Deleted sucessfully in performance table",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_per`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_per` AFTER INSERT ON `performance` FOR EACH ROW INSERT INTO insert_logs VALUES(null,"inserted sucessfully in performance table",NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_per`;
DELIMITER $$
CREATE TRIGGER `update_trigger_per` AFTER UPDATE ON `performance` FOR EACH ROW INSERT INTO update_logs (action,time) VALUES ("AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE",NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `PLAYER_ID` int NOT NULL,
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_AGE` int DEFAULT NULL,
  `P_STATE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`PLAYER_ID`, `P_NAME`, `P_AGE`, `P_STATE`) VALUES
(1, 'Rahul', 25, 'Maharashtra'),
(2, 'Priya', 23, 'Tamil Nadu'),
(3, 'Rohan', 27, 'Uttar Pradesh'),
(4, 'Nisha', 21, 'Kerala'),
(5, 'Vikram', 28, 'Karnataka'),
(6, 'Aarti', 24, 'Gujarat'),
(7, 'Ajay', 26, 'Punjab'),
(8, 'Neha', 22, 'Madhya Pradesh'),
(9, 'Ankit', 29, 'Rajasthan'),
(10, 'Pooja', 20, 'Haryana'),
(11, 'Sunil', 30, 'West Bengal'),
(12, 'Kavita', 19, 'Odisha'),
(13, 'Manoj', 31, 'Bihar'),
(14, 'Ritu', 18, 'Assam'),
(15, 'Sanjay', 32, 'Telangana'),
(16, 'HARSHITH S GOWDA', 22, 'Karnataka'),
(17, 'ajay', 25, 'Karnataka');

--
-- Triggers `players`
--
DROP TRIGGER IF EXISTS `delete_trigger_players`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_players` AFTER DELETE ON `players` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES("Deleted sucessfully in Players Table",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_players`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_players` AFTER INSERT ON `players` FOR EACH ROW INSERT INTO insert_logs VALUES(null,"inserted sucessfully in players table",NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_players`;
DELIMITER $$
CREATE TRIGGER `update_trigger_players` AFTER UPDATE ON `players` FOR EACH ROW INSERT INTO update_logs (action,time) VALUES ("UPDATED SUCESSFULLY IN PLAYERS",NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `p_position`
--

DROP TABLE IF EXISTS `p_position`;
CREATE TABLE IF NOT EXISTS `p_position` (
  `PLAYER_ID` int NOT NULL,
  `POINT_GUARD` int DEFAULT NULL,
  `SHOOTING_GUARD` int DEFAULT NULL,
  `POST` int DEFAULT NULL,
  `SMALL_FORWARD` int DEFAULT NULL,
  `POWER_FORWARD` int DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `p_position`
--

INSERT INTO `p_position` (`PLAYER_ID`, `POINT_GUARD`, `SHOOTING_GUARD`, `POST`, `SMALL_FORWARD`, `POWER_FORWARD`) VALUES
(1, 9, 9, 9, 8, 9),
(2, 7, 7, 7, 7, 5),
(3, 8, 8, 8, 7, 8),
(4, 9, 7, 6, 8, 7),
(5, 8, 8, 7, 7, 8),
(6, 7, 8, 7, 6, 8),
(7, 9, 7, 8, 8, 7),
(8, 7, 7, 8, 7, 8),
(9, 8, 8, 7, 8, 7),
(10, 7, 7, 7, 8, 8),
(11, 8, 8, 8, 7, 7),
(12, 7, 8, 8, 8, 7),
(13, 8, 7, 7, 8, 7),
(14, 7, 8, 8, 8, 7),
(15, 8, 7, 8, 7, 7);

--
-- Triggers `p_position`
--
DROP TRIGGER IF EXISTS `delete_trigger_position`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_position` AFTER DELETE ON `p_position` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES ("deleted the position values successfull",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_position`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_position` AFTER INSERT ON `p_position` FOR EACH ROW INSERT INTO insert_logs VALUES(null,"inserted into position successfull",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_position`;
DELIMITER $$
CREATE TRIGGER `update_trigger_position` AFTER UPDATE ON `p_position` FOR EACH ROW INSERT INTO update_logs(action,time) VALUES("update the position values successfull",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sp`
--

DROP TABLE IF EXISTS `sp`;
CREATE TABLE IF NOT EXISTS `sp` (
  `PLAYER_ID` int NOT NULL,
  `DRIBBLING` int DEFAULT NULL,
  `PASSING` int DEFAULT NULL,
  `BTFW` int DEFAULT NULL,
  `INDIVIDUAL_DEFENCE` int DEFAULT NULL,
  `PSBH` int DEFAULT NULL,
  `SR` int DEFAULT NULL,
  PRIMARY KEY (`PLAYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp`
--

INSERT INTO `sp` (`PLAYER_ID`, `DRIBBLING`, `PASSING`, `BTFW`, `INDIVIDUAL_DEFENCE`, `PSBH`, `SR`) VALUES
(1, 8, 7, 8, 9, 8, 8),
(2, 7, 8, 6, 7, 8, 8),
(3, 8, 7, 7, 8, 6, 7),
(4, 6, 8, 9, 7, 7, 8),
(5, 8, 6, 7, 9, 8, 8),
(6, 7, 7, 8, 6, 9, 7),
(7, 9, 6, 7, 8, 7, 8),
(8, 7, 9, 8, 7, 6, 7),
(9, 8, 7, 6, 9, 7, 8),
(10, 6, 8, 7, 7, 9, 8),
(11, 7, 6, 9, 8, 7, 8),
(12, 8, 7, 6, 9, 7, 7),
(13, 6, 8, 7, 7, 9, 8),
(14, 7, 6, 9, 8, 7, 8),
(15, 8, 7, 6, 9, 7, 7),
(16, 8, 9, 7, 6, 5, 7);

--
-- Triggers `sp`
--
DROP TRIGGER IF EXISTS `SP_AVG_INSERT`;
DELIMITER $$
CREATE TRIGGER `SP_AVG_INSERT` AFTER INSERT ON `sp` FOR EACH ROW BEGIN
    DECLARE sp_avg FLOAT;
    SET sp_avg = (NEW.DRIBBLING + NEW.PASSING + NEW.BTFW + NEW.INDIVIDUAL_DEFENCE + NEW.PSBH + NEW.SR) / 6;
    INSERT INTO PERFORMANCE (PLAYER_ID, SP_AVG) VALUES (NEW.PLAYER_ID, sp_avg)
    ON DUPLICATE KEY UPDATE SP_AVG = sp_avg;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_trigger_sp`;
DELIMITER $$
CREATE TRIGGER `delete_trigger_sp` AFTER DELETE ON `sp` FOR EACH ROW INSERT INTO delete_logs(action,time) VALUES("deleted successfull from the table specific performance",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_sp`;
DELIMITER $$
CREATE TRIGGER `insert_trigger_sp` AFTER INSERT ON `sp` FOR EACH ROW INSERT INTO	insert_logs VALUES(null,"inserted successfull in specific performance",now())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_sp`;
DELIMITER $$
CREATE TRIGGER `update_trigger_sp` AFTER UPDATE ON `sp` FOR EACH ROW INSERT INTO update_logs(action,time) VALUES("insertion is successfull in specific performance ",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

DROP TABLE IF EXISTS `update_logs`;
CREATE TABLE IF NOT EXISTS `update_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `update_logs`
--

INSERT INTO `update_logs` (`id`, `action`, `time`) VALUES
(1, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(2, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(3, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(4, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(5, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(6, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(7, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(8, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(9, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(10, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(11, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(12, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(13, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(14, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(15, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 04:19:46'),
(16, 'AUTO UPDATED SUCESSFULLY IN PERFORMANCE TABLE', '2024-03-22 05:13:56');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE;

--
-- Constraints for table `gp`
--
ALTER TABLE `gp`
  ADD CONSTRAINT `gp_ibfk_1` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE;

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `gp` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `sp` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `p_position`
--
ALTER TABLE `p_position`
  ADD CONSTRAINT `p_position_ibfk_1` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE;

--
-- Constraints for table `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `sp_ibfk_1` FOREIGN KEY (`PLAYER_ID`) REFERENCES `players` (`PLAYER_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
