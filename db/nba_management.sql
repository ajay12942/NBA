-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2024 at 10:49 AM
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

DROP PROCEDURE IF EXISTS `SearchAge1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAge1` (IN `page` INT(11))   SELECT P_NAME,P_AGE,P_STATE FROM PLAYERS P WHERE P.P_AGE = page$$

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
(1, 'mountain', 'Post guard'),
(2, 'sea', 'POWER FORWARD');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delete_logs`
--

INSERT INTO `delete_logs` (`id`, `action`, `time`) VALUES
(14, 'Deleted sucessfully in Players Table', '2024-02-24 03:54:20'),
(15, 'Deleted sucessfully in Players Table', '2024-02-24 03:54:20'),
(16, 'Deleted sucessfully in Players Table', '2024-02-24 03:54:20'),
(17, 'Deleted sucessfully in Players Table', '2024-02-25 12:18:38'),
(18, 'deleted the position values successfull', '2024-02-25 13:27:41'),
(19, 'deleted successfull from the table specific performance', '2024-02-25 14:15:35'),
(20, 'deleted successfull from the table general performance', '2024-02-25 14:35:55'),
(21, 'deleted successfull from the table club', '2024-02-25 14:36:27');

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
(2, 8, 8, 8, 7);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `insert_logs`
--

INSERT INTO `insert_logs` (`id`, `action`, `time`) VALUES
(6, 'inserted sucessfully in players table', '2024-02-23 15:36:18'),
(7, 'inserted sucessfully in players table', '2024-02-23 15:36:53'),
(8, 'inserted sucessfully in players table', '2024-02-23 15:37:12'),
(9, 'inserted into position successfull', '2024-02-23 15:37:31'),
(10, 'inserted into position successfull', '2024-02-23 15:37:44'),
(11, 'inserted into position successfull', '2024-02-23 15:38:03'),
(12, 'inserted successfull in specific performance', '2024-02-23 15:38:52'),
(13, 'inserted successfull in specific performance', '2024-02-23 15:39:11'),
(14, 'inserted successfull in specific performance', '2024-02-23 15:39:27'),
(15, 'inserted successfull in general performance', '2024-02-23 15:40:07'),
(16, 'inserted successfull in general performance', '2024-02-23 15:40:18'),
(17, 'inserted successfull in general performance', '2024-02-23 15:41:19'),
(18, 'inserted successfull in club', '2024-02-23 15:41:54'),
(19, 'inserted successfull in club', '2024-02-23 15:42:28'),
(20, 'inserted successfull in club', '2024-02-23 15:43:09'),
(21, 'inserted sucessfully in players table', '2024-02-25 12:12:44'),
(22, 'inserted sucessfully in players table', '2024-02-25 12:13:06'),
(23, 'inserted sucessfully in players table', '2024-02-25 12:26:17');

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
(1, 'AJAY', 25, 'KARNATAKA'),
(2, 'SRI', 22, 'TAMILNADU');

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
(3, 7, 7, 7, 7, 5);

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
(1, 8, 8, 8, 8, 8, 8),
(2, 8, 8, 8, 8, 7, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `update_logs`
--

INSERT INTO `update_logs` (`id`, `action`, `time`) VALUES
(1, 'UPDATED SUCESSFULLY IN PLAYERS', '2024-02-25 12:13:33'),
(2, 'UPDATED SUCESSFULLY IN PLAYERS', '2024-02-25 12:26:45'),
(3, 'update the position values successfull', '2024-02-25 13:27:28'),
(4, 'update the position values successfull', '2024-02-25 13:27:38'),
(5, 'update the position values successfull', '2024-02-25 14:12:58'),
(6, 'insertion is successfull in specific performance ', '2024-02-25 14:29:49'),
(7, 'insertion is successfull in general performance ', '2024-02-25 14:35:52'),
(8, 'insertion is successfull in club', '2024-02-25 14:36:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
