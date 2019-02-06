-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.34-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for server_3
CREATE DATABASE IF NOT EXISTS `server_3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `server_3`;

-- Dumping structure for table server_3.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.addon_account: ~22 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
	(1, 'society_ambulance', 'EMS', 1),
	(3, 'society_banker', 'Bankier', 1),
	(4, 'bank_savings', 'Oszczednosci', 0),
	(7, 'caution', 'Uwaga', 0),
	(8, 'society_avocat', 'Adwokat', 1),
	(9, 'society_mecano', 'Mechanik', 1),
	(10, 'society_motodealer', 'Sprzedawca Motocykli', 1),
	(11, 'society_police', 'LSPD', 1),
	(12, 'property_black_money', 'Posiadlosc za brudna kase', 0),
	(13, 'society_realestateagent', 'Agent nieruchomosci', 1),
	(14, 'society_taxi', 'Taksi', 1),
	(17, 'society_unicorn', 'Unicorn', 1),
	(18, 'society_aircraftdealer', 'Airliner', 1),
	(19, 'society_boatdealer', 'Marina', 1),
	(21, 'society_vigne', 'Winegrower', 1),
	(22, 'society_carthief', 'Car Thief', 1),
	(23, 'society_journaliste', 'journaliste', 1),
	(24, 'society_biker', 'Biker', 1),
	(25, 'society_biker', 'Biker', 1),
	(26, 'society_cartel', 'cartel', 1),
	(27, 'society_gang', 'gang', 1),
	(28, 'society_mafia', 'Mafia', 1),
	(29, 'society_state', 'State', 1),
	(30, 'society_cardealer', 'Sprzedawca Aut', 1),
	(31, 'society_cardealer2', 'Sprzedawca Aut 2', 1),
	(32, 'society_parking', 'Parking Enforcement', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table server_3.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.addon_account_data: ~818 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 50000, NULL),
	(2, 'society_banker', 50000, NULL),
	(3, 'society_avocat', 50000, NULL),
	(4, 'society_mecano', 99997539670, NULL),
	(5, 'society_motodealer', 6010, NULL),
	(6, 'society_police', 21450, NULL),
	(7, 'society_realestateagent', 50000, NULL),
	(8, 'society_taxi', 50677, NULL),
	(283, 'society_unicorn', 50000, NULL),
	(419, 'society_aircraftdealer', 50000, NULL),
	(420, 'society_boatdealer', 50000, NULL),
	(424, 'society_vigne', 350660, NULL),
	(425, 'society_carthief', 50000, NULL),
	(1782, 'society_journaliste', 0, NULL),
	(1792, 'society_biker', 0, NULL),
	(1793, 'society_cartel', 0, NULL),
	(1794, 'society_gang', 0, NULL),
	(1795, 'society_mafia', 0, NULL),
	(1796, 'society_state', 0, NULL),
	(1806, 'society_cardealer', 0, NULL),
	(1810, 'society_cardealer2', 0, NULL),
	(1811, 'society_parking', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table server_3.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.addon_inventory: ~17 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
	(1, 'society_avocat', 'Adwokat', 1),
	(2, 'society_mecano', 'Mechanik', 1),
	(3, 'society_motodealer', 'Sprzedawca Motocykli', 1),
	(4, 'society_police', 'LSPD', 1),
	(5, 'property', 'Mieszkania', 0),
	(6, 'society_taxi', 'Taxi', 1),
	(11, 'society_unicorn', 'Unicorn', 1),
	(12, 'society_unicorn_fridge', 'Unicorn (frigo)', 1),
	(13, 'society_aircraftdealer', 'Airliner', 1),
	(14, 'society_boatdealer', 'Marina', 1),
	(16, 'society_vigne', 'Winegrower', 1),
	(17, 'society_carthief', 'Car Thief', 1),
	(18, 'society_journaliste', 'journaliste', 1),
	(19, 'society_biker', 'Biker', 1),
	(20, 'society_biker', 'Biker', 1),
	(21, 'society_cartel', 'Cartel', 1),
	(22, 'society_gang', 'Gang', 1),
	(23, 'society_mafia', 'Mafia', 1),
	(24, 'society_state', 'State', 1),
	(25, 'society_cardealer', 'Concesionnaire', 1),
	(26, 'society_cardealer2', 'Sprzedawca Aut 2', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table server_3.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.addon_inventory_items: ~72 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
	(4, 'society_vigne', 'vine', 0, NULL),
	(5, 'society_vigne', 'grand_cru', 0, NULL),
	(6, 'society_police', 'vine', 0, NULL),
	(7, 'society_vigne', 'jus_raisin', 0, NULL),
	(8, 'society_mecano', 'fixkit', 0, NULL),
	(9, 'society_vigne', 'raisin', 100, NULL),
	(10, 'society_police', 'coke', 0, NULL),
	(11, 'society_mecano', 'blowpipe', 0, NULL),
	(12, 'society_vigne', 'lighter', 0, NULL),
	(13, 'society_vigne', 'bread', 0, NULL),
	(14, 'society_taxi', 'wood', 0, NULL),
	(15, 'society_taxi', 'cutted_wood', 0, NULL),
	(16, 'society_taxi', 'alive_chicken', 0, NULL),
	(17, 'society_police', 'grand_cru', 38, NULL),
	(18, 'society_mecano', 'fixtool', 0, NULL),
	(23, 'society_mecano', 'carokit', 0, NULL),
	(25, 'society_taxi', 'weed', 0, NULL),
	(26, 'society_vigne', 'wrap', 0, NULL),
	(27, 'society_vigne', 'water', 0, NULL),
	(28, 'society_police', 'weed', 0, NULL),
	(29, 'society_vigne', 'weed', 0, NULL),
	(30, 'society_vigne', 'alive_chicken', 0, NULL),
	(31, 'society_mecano', 'weed', 0, NULL),
	(32, 'society_taxi', 'coke', 0, NULL),
	(33, 'society_police', 'weed_pooch', 0, NULL),
	(34, 'society_police', 'coke_pooch', 0, NULL),
	(35, 'society_police', 'meth', 0, NULL),
	(36, 'society_motodealer', 'cocacola', 0, NULL),
	(58, 'society_unicorn', 'grand_cru', 0, NULL),
	(59, 'society_unicorn', 'vodka', 0, NULL),
	(60, 'society_unicorn', 'whisky', 0, NULL),
	(61, 'society_unicorn_fridge', 'grand_cru', 0, NULL),
	(62, 'society_unicorn_fridge', 'vodka', 0, NULL),
	(63, 'society_unicorn_fridge', 'whisky', 0, NULL),
	(64, 'society_unicorn_fridge', 'wine', 0, NULL),
	(65, 'society_unicorn_fridge', 'beer', 0, NULL),
	(66, 'society_unicorn_fridge', 'tequila', 0, NULL),
	(67, 'society_unicorn_fridge', 'cigarett', 0, NULL),
	(68, 'society_unicorn', 'blackberry', 0, NULL),
	(69, 'society_vigne', 'sandwich', 0, NULL),
	(70, 'society_unicorn_fridge', 'cupcake', 0, NULL),
	(71, 'society_unicorn_fridge', 'cocacola', 0, NULL),
	(72, 'society_unicorn_fridge', 'hamburger', 0, NULL),
	(73, 'society_unicorn_fridge', 'sandwich', 0, NULL),
	(74, 'society_unicorn_fridge', 'redbull', 0, NULL),
	(75, 'society_unicorn_fridge', 'milk', 0, NULL),
	(76, 'society_unicorn_fridge', 'icetea', 0, NULL),
	(77, 'society_unicorn_fridge', 'schabowy', 0, NULL),
	(78, 'society_unicorn_fridge', 'wrap', 0, NULL),
	(79, 'society_unicorn_fridge', 'pizza', 0, NULL),
	(80, 'society_unicorn_fridge', 'kebab', 0, NULL),
	(81, 'society_unicorn_fridge', 'barszcz', 0, NULL),
	(82, 'society_unicorn_fridge', 'lighter', 0, NULL),
	(83, 'society_unicorn_fridge', 'spaghetti', 0, NULL),
	(84, 'society_unicorn_fridge', 'cisowianka', 0, NULL),
	(85, 'society_unicorn_fridge', 'water', 0, NULL),
	(86, 'society_unicorn_fridge', 'ice', 0, NULL),
	(87, 'society_unicorn_fridge', 'menthe', 0, NULL),
	(89, 'society_police', 'blackberry', 3, NULL),
	(90, 'society_police', 'key', 0, NULL),
	(91, 'society_police', 'handcuffs', 0, NULL),
	(92, 'society_unicorn_fridge', 'rhum', 0, NULL),
	(93, 'society_unicorn', 'raisin', 0, NULL),
	(94, 'society_unicorn', 'vine', 0, NULL),
	(96, 'society_police', 'drill', 0, NULL),
	(98, 'society_police', 'blowpipe', 1, NULL);
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table server_3.aircraftdealer_aircrafts
CREATE TABLE IF NOT EXISTS `aircraftdealer_aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.aircraftdealer_aircrafts: ~0 rows (approximately)
/*!40000 ALTER TABLE `aircraftdealer_aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraftdealer_aircrafts` ENABLE KEYS */;

-- Dumping structure for table server_3.aircrafts
CREATE TABLE IF NOT EXISTS `aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.aircrafts: ~21 rows (approximately)
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`) VALUES
	('Alpha Z1', 'alphaz1', 1595000, 'plane'),
	('Besra', 'besra', 1150000, 'plane'),
	('Cuban 800', 'cuban800', 240000, 'plane'),
	('Dodo', 'dodo', 500000, 'plane'),
	('Duster', 'duster', 275000, 'plane'),
	('Frogger', 'frogger', 1300000, 'heli'),
	('Howard NX25', 'howard', 975000, 'plane'),
	('Luxor', 'luxor', 1625000, 'plane'),
	('Luxor Deluxe ', 'luxor2', 10000000, 'plane'),
	('Mammatus', 'mammatus', 300000, 'plane'),
	('Maverick', 'maverick', 780000, 'heli'),
	('Nimbus', 'nimbus', 1900000, 'plane'),
	('Shamal', 'shamal', 1150000, 'plane'),
	('Mallard', 'stunt', 250000, 'plane'),
	('SuperVolito', 'supervolito', 2113000, 'heli'),
	('SuperVolito Carbon', 'supervolito2', 3330000, 'heli'),
	('Swift', 'swift', 1500000, 'heli'),
	('Swift Deluxe', 'swift2', 5150000, 'heli'),
	('Velum', 'velum2', 1323350, 'plane'),
	('Vestra', 'vestra', 950000, 'plane'),
	('Volatus', 'volatus', 2295000, 'heli');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;

-- Dumping structure for table server_3.aircraft_categories
CREATE TABLE IF NOT EXISTS `aircraft_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.aircraft_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `aircraft_categories` DISABLE KEYS */;
INSERT INTO `aircraft_categories` (`id`, `name`, `label`) VALUES
	(1, 'plane', 'Samoloty'),
	(2, 'heli', 'Helikoptery');
/*!40000 ALTER TABLE `aircraft_categories` ENABLE KEYS */;

-- Dumping structure for table server_3.aplikacje
CREATE TABLE IF NOT EXISTS `aplikacje` (
  `id` int(11) NOT NULL,
  `ooc_imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `ooc_data` date NOT NULL,
  `steam` text COLLATE utf8_polish_ci NOT NULL,
  `discord` text COLLATE utf8_polish_ci NOT NULL,
  `ic_imie` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `id_wiek` int(11) NOT NULL,
  `ic_history` text COLLATE utf8_polish_ci NOT NULL,
  `ic_s1` text COLLATE utf8_polish_ci NOT NULL,
  `ic_s2` text COLLATE utf8_polish_ci NOT NULL,
  `ic_akcja` text COLLATE utf8_polish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Dumping data for table server_3.aplikacje: ~0 rows (approximately)
/*!40000 ALTER TABLE `aplikacje` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplikacje` ENABLE KEYS */;

-- Dumping structure for table server_3.bans_logs
CREATE TABLE IF NOT EXISTS `bans_logs` (
  `id` int(11) NOT NULL,
  `steam` text NOT NULL,
  `odbanowal` text NOT NULL,
  `reason` text NOT NULL,
  `kiedy` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.bans_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `bans_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans_logs` ENABLE KEYS */;

-- Dumping structure for table server_3.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table server_3.boatdealer_boats
CREATE TABLE IF NOT EXISTS `boatdealer_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.boatdealer_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `boatdealer_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `boatdealer_boats` ENABLE KEYS */;

-- Dumping structure for table server_3.boats
CREATE TABLE IF NOT EXISTS `boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.boats: ~14 rows (approximately)
/*!40000 ALTER TABLE `boats` DISABLE KEYS */;
INSERT INTO `boats` (`name`, `model`, `price`, `category`) VALUES
	('Dinghy', 'dinghy', 2500, 'boat'),
	('Dinghy2 ', 'dinghy2', 2500, 'boat'),
	('Yacht Dinghy', 'dinghy4', 1500, 'boat'),
	('Jetmax', 'jetmax', 17500, 'boat'),
	('Voilier Marquis', 'marquis', 45500, 'boat'),
	('Seashark', 'seashark', 1500, 'boat'),
	('Seashark2', 'seashark2', 1500, 'boat'),
	('Yacht Seashark', 'seashark3', 1500, 'boat'),
	('Squalo', 'squalo', 12000, 'boat'),
	('Suntrap', 'suntrap', 1500, 'boat'),
	('Toro', 'toro', 15000, 'boat'),
	('Yacht Toro', 'toro2', 15000, 'boat'),
	('Tropic', 'tropic', 10000, 'boat'),
	('Yacht Tropic', 'tropic2', 10000, 'boat');
/*!40000 ALTER TABLE `boats` ENABLE KEYS */;

-- Dumping structure for table server_3.boat_categories
CREATE TABLE IF NOT EXISTS `boat_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.boat_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `boat_categories` DISABLE KEYS */;
INSERT INTO `boat_categories` (`id`, `name`, `label`) VALUES
	(1, 'boat', 'Lodzie');
/*!40000 ALTER TABLE `boat_categories` ENABLE KEYS */;

-- Dumping structure for table server_3.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table server_3.cardealer_vehicles2
CREATE TABLE IF NOT EXISTS `cardealer_vehicles2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.cardealer_vehicles2: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles2` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles2` ENABLE KEYS */;

-- Dumping structure for table server_3.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'f',
  `height` varchar(128) NOT NULL,
  `lastdigits` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.characters: ~8 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table server_3.city_doors
CREATE TABLE IF NOT EXISTS `city_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locked` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.city_doors: ~13 rows (approximately)
/*!40000 ALTER TABLE `city_doors` DISABLE KEYS */;
INSERT INTO `city_doors` (`id`, `locked`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(11, 0),
	(12, 0),
	(13, 0);
/*!40000 ALTER TABLE `city_doors` ENABLE KEYS */;

-- Dumping structure for table server_3.darkshops
CREATE TABLE IF NOT EXISTS `darkshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.darkshops: ~14 rows (approximately)
/*!40000 ALTER TABLE `darkshops` DISABLE KEYS */;
INSERT INTO `darkshops` (`id`, `name`, `item`, `price`) VALUES
	(1, 'Darks', 'Darknet', 100),
	(2, 'Darks', 'drill', 100),
	(3, 'Darks', 'blowpipe', 100),
	(4, 'Darks', 'bulletproof', 100),
	(5, 'Darks', 'clip', 100),
	(6, 'Darks', 'grip', 100),
	(7, 'Darks', 'silent', 100),
	(8, 'Darks', 'flashlight', 100),
	(9, 'Darks', 'scope', 100),
	(10, 'Darks', 'advanced_scope', 100),
	(11, 'Darks', 'extended_magazine', 100),
	(12, 'Darks', 'very_extended_magazine', 100),
	(13, 'Darks', 'yusuf', 100),
	(14, 'Darks', 'lowrider', 100);
/*!40000 ALTER TABLE `darkshops` ENABLE KEYS */;

-- Dumping structure for table server_3.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.datastore: ~18 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`id`, `name`, `label`, `shared`) VALUES
	(1, 'society_avocat', 'Adwokat', 1),
	(2, 'society_police', 'LSPD', 1),
	(3, 'property', 'Nieruchomosci', 0),
	(4, 'user_ears', 'Uszy', 0),
	(5, 'user_glasses', 'Okulary', 0),
	(6, 'user_helmet', 'Helm', 0),
	(7, 'user_mask', 'Maska', 0),
	(8, 'society_unicorn', 'Unicorn', 1),
	(9, 'society_taxi', 'Taxi', 1),
	(10, 'society_vigne', 'Winegrower', 1),
	(11, 'society_carthief', 'Car Thief', 1),
	(12, 'society_journaliste', 'journaliste', 1),
	(13, 'society_biker', 'Biker', 1),
	(14, 'society_biker', 'Biker', 1),
	(15, 'society_cartel', 'Cartel', 1),
	(16, 'society_gang', 'Gang', 1),
	(17, 'society_mafia', 'Mafia', 1),
	(18, 'society_state', 'State', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table server_3.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.datastore_data: ~1,560 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_avocat', NULL, '{}'),
	(2, 'society_police', NULL, '{}'),
	(689, 'society_taxi', NULL, '{}'),
	(690, 'society_vigne', NULL, '{}'),
	(691, 'society_carthief', NULL, '{}'),
	(692, 'society_unicorn', NULL, '{}'),
	(703, 'user_glasses', 'steam:110000113c538bd', '{}'),
	(704, 'property', 'steam:110000113c538bd', '{}'),
	(705, 'user_mask', 'steam:110000113c538bd', '{}'),
	(706, 'user_helmet', 'steam:110000113c538bd', '{}'),
	(707, 'user_ears', 'steam:110000113c538bd', '{}'),
	(708, 'user_glasses', 'steam:110000117b859f4', '{}'),
	(709, 'user_ears', 'steam:110000117b859f4', '{}'),
	(710, 'user_helmet', 'steam:110000117b859f4', '{}'),
	(711, 'user_mask', 'steam:110000117b859f4', '{}'),
	(712, 'property', 'steam:110000117b859f4', '{}'),
	(758, 'user_helmet', 'steam:1100001133f8ec3', '{}'),
	(759, 'user_glasses', 'steam:1100001133f8ec3', '{}'),
	(760, 'user_mask', 'steam:1100001133f8ec3', '{}'),
	(761, 'property', 'steam:1100001133f8ec3', '{}'),
	(762, 'user_ears', 'steam:1100001133f8ec3', '{}'),
	(793, 'user_mask', 'steam:110000132c24b3f', '{}'),
	(794, 'user_glasses', 'steam:110000132c24b3f', '{}'),
	(795, 'user_ears', 'steam:110000132c24b3f', '{}'),
	(796, 'property', 'steam:110000132c24b3f', '{}'),
	(797, 'user_helmet', 'steam:110000132c24b3f', '{}'),
	(803, 'property', 'steam:11000011502bbc4', '{}'),
	(804, 'user_ears', 'steam:11000011502bbc4', '{}'),
	(805, 'user_helmet', 'steam:11000011502bbc4', '{}'),
	(806, 'user_glasses', 'steam:11000011502bbc4', '{}'),
	(807, 'user_mask', 'steam:11000011502bbc4', '{}'),
	(808, 'user_glasses', 'steam:1100001147b8d16', '{}'),
	(809, 'user_mask', 'steam:1100001147b8d16', '{}'),
	(810, 'user_ears', 'steam:1100001147b8d16', '{}'),
	(811, 'property', 'steam:1100001147b8d16', '{}'),
	(812, 'user_helmet', 'steam:1100001147b8d16', '{}'),
	(853, 'property', 'steam:110000111cc978a', '{}'),
	(854, 'user_mask', 'steam:110000111cc978a', '{}'),
	(855, 'user_glasses', 'steam:110000111cc978a', '{}'),
	(856, 'user_ears', 'steam:110000111cc978a', '{}'),
	(857, 'user_helmet', 'steam:110000111cc978a', '{}'),
	(868, 'user_helmet', 'steam:110000131cb3092', '{}'),
	(869, 'user_mask', 'steam:110000131cb3092', '{}'),
	(870, 'user_glasses', 'steam:110000131cb3092', '{}'),
	(871, 'property', 'steam:110000131cb3092', '{}'),
	(872, 'user_ears', 'steam:110000131cb3092', '{}'),
	(883, 'user_mask', 'steam:110000113f3e1f0', '{}'),
	(884, 'user_ears', 'steam:110000113f3e1f0', '{}'),
	(885, 'user_helmet', 'steam:110000113f3e1f0', '{}'),
	(886, 'property', 'steam:110000113f3e1f0', '{}'),
	(887, 'user_glasses', 'steam:110000113f3e1f0', '{}'),
	(893, 'property', 'steam:110000116834007', '{}'),
	(894, 'user_mask', 'steam:110000116834007', '{}'),
	(895, 'user_helmet', 'steam:110000116834007', '{}'),
	(896, 'user_glasses', 'steam:110000116834007', '{}'),
	(897, 'user_ears', 'steam:110000116834007', '{}'),
	(898, 'user_helmet', 'steam:11000011adda9c1', '{}'),
	(899, 'user_ears', 'steam:11000011adda9c1', '{}'),
	(900, 'user_mask', 'steam:11000011adda9c1', '{}'),
	(901, 'user_glasses', 'steam:11000011adda9c1', '{}'),
	(902, 'property', 'steam:11000011adda9c1', '{}'),
	(928, 'user_glasses', 'steam:110000119e32eb3', '{}'),
	(929, 'property', 'steam:110000119e32eb3', '{}'),
	(930, 'user_ears', 'steam:110000119e32eb3', '{}'),
	(931, 'user_mask', 'steam:110000119e32eb3', '{}'),
	(932, 'user_helmet', 'steam:110000119e32eb3', '{}'),
	(968, 'user_mask', 'steam:1100001128f8a4b', '{}'),
	(969, 'user_ears', 'steam:1100001128f8a4b', '{}'),
	(970, 'user_helmet', 'steam:1100001128f8a4b', '{}'),
	(971, 'property', 'steam:1100001128f8a4b', '{}'),
	(972, 'user_glasses', 'steam:1100001128f8a4b', '{}'),
	(973, 'user_glasses', 'steam:110000117b95539', '{}'),
	(974, 'user_mask', 'steam:110000117b95539', '{}'),
	(975, 'user_ears', 'steam:110000117b95539', '{}'),
	(976, 'user_helmet', 'steam:110000117b95539', '{}'),
	(977, 'property', 'steam:110000117b95539', '{}'),
	(978, 'user_ears', 'steam:110000111d11f0f', '{}'),
	(979, 'user_helmet', 'steam:110000111d11f0f', '{}'),
	(980, 'property', 'steam:110000111d11f0f', '{}'),
	(981, 'user_glasses', 'steam:110000111d11f0f', '{}'),
	(982, 'user_mask', 'steam:110000111d11f0f', '{}'),
	(983, 'user_mask', 'steam:1100001160114e9', '{}'),
	(984, 'user_helmet', 'steam:1100001160114e9', '{}'),
	(985, 'property', 'steam:1100001160114e9', '{}'),
	(986, 'user_glasses', 'steam:1100001160114e9', '{}'),
	(987, 'user_ears', 'steam:1100001160114e9', '{}'),
	(993, 'user_ears', 'steam:11000011816ccb9', '{}'),
	(994, 'user_glasses', 'steam:11000011816ccb9', '{}'),
	(995, 'user_mask', 'steam:11000011816ccb9', '{}'),
	(996, 'property', 'steam:11000011816ccb9', '{}'),
	(997, 'user_helmet', 'steam:11000011816ccb9', '{}'),
	(1003, 'property', 'steam:110000113d0569a', '{}'),
	(1004, 'user_ears', 'steam:110000113d0569a', '{}'),
	(1005, 'user_glasses', 'steam:110000113d0569a', '{}'),
	(1006, 'user_helmet', 'steam:110000113d0569a', '{}'),
	(1007, 'user_mask', 'steam:110000113d0569a', '{}'),
	(1028, 'user_ears', 'steam:1100001164e4971', '{}'),
	(1029, 'property', 'steam:1100001164e4971', '{}'),
	(1030, 'user_glasses', 'steam:1100001164e4971', '{}'),
	(1031, 'user_helmet', 'steam:1100001164e4971', '{}'),
	(1032, 'user_mask', 'steam:1100001164e4971', '{}'),
	(1048, 'user_glasses', 'steam:11000013228f705', '{}'),
	(1049, 'user_helmet', 'steam:11000013228f705', '{}'),
	(1050, 'property', 'steam:11000013228f705', '{}'),
	(1051, 'user_ears', 'steam:11000013228f705', '{}'),
	(1052, 'user_mask', 'steam:11000013228f705', '{}'),
	(1053, 'user_ears', 'steam:1100001181df06a', '{}'),
	(1054, 'user_glasses', 'steam:1100001181df06a', '{}'),
	(1055, 'property', 'steam:1100001181df06a', '{}'),
	(1056, 'user_helmet', 'steam:1100001181df06a', '{}'),
	(1057, 'user_mask', 'steam:1100001181df06a', '{}'),
	(1062, 'user_helmet', 'steam:110000111b8feda', '{}'),
	(1148, 'property', 'steam:1100001128b12a7', '{}'),
	(1149, 'user_helmet', 'steam:1100001128b12a7', '{}'),
	(1150, 'user_ears', 'steam:1100001128b12a7', '{}'),
	(1151, 'user_glasses', 'steam:1100001128b12a7', '{}'),
	(1152, 'user_mask', 'steam:1100001128b12a7', '{}'),
	(1153, 'user_glasses', 'steam:11000011a1ac499', '{}'),
	(1154, 'property', 'steam:11000011a1ac499', '{}'),
	(1155, 'user_mask', 'steam:11000011a1ac499', '{}'),
	(1156, 'user_ears', 'steam:11000011a1ac499', '{}'),
	(1157, 'user_helmet', 'steam:11000011a1ac499', '{}'),
	(1158, 'user_mask', 'steam:11000011a69f8da', '{}'),
	(1159, 'user_ears', 'steam:11000011a69f8da', '{}'),
	(1160, 'user_helmet', 'steam:11000011a69f8da', '{}'),
	(1161, 'property', 'steam:11000011a69f8da', '{}'),
	(1162, 'user_glasses', 'steam:11000011a69f8da', '{}'),
	(1178, 'user_helmet', 'steam:1100001180e43ba', '{}'),
	(1179, 'property', 'steam:1100001180e43ba', '{}'),
	(1180, 'user_mask', 'steam:1100001180e43ba', '{}'),
	(1181, 'user_glasses', 'steam:1100001180e43ba', '{}'),
	(1182, 'user_ears', 'steam:1100001180e43ba', '{}'),
	(1183, 'user_helmet', 'steam:1100001188ec9f4', '{}'),
	(1184, 'user_ears', 'steam:1100001188ec9f4', '{}'),
	(1185, 'user_glasses', 'steam:1100001188ec9f4', '{}'),
	(1186, 'property', 'steam:1100001188ec9f4', '{}'),
	(1187, 'user_mask', 'steam:1100001188ec9f4', '{}'),
	(1188, 'user_helmet', 'steam:1100001134e258a', '{}'),
	(1189, 'user_ears', 'steam:1100001134e258a', '{}'),
	(1190, 'user_mask', 'steam:1100001134e258a', '{}'),
	(1191, 'property', 'steam:1100001134e258a', '{}'),
	(1192, 'user_glasses', 'steam:1100001134e258a', '{}'),
	(1198, 'user_ears', 'steam:110000131d29ec4', '{}'),
	(1199, 'user_helmet', 'steam:110000131d29ec4', '{}'),
	(1200, 'user_mask', 'steam:110000131d29ec4', '{}'),
	(1201, 'property', 'steam:110000131d29ec4', '{}'),
	(1202, 'user_glasses', 'steam:110000131d29ec4', '{}'),
	(1258, 'user_ears', 'steam:11000011c82dd6c', '{}'),
	(1259, 'property', 'steam:11000011c82dd6c', '{}'),
	(1260, 'user_helmet', 'steam:11000011c82dd6c', '{}'),
	(1261, 'user_glasses', 'steam:11000011c82dd6c', '{}'),
	(1262, 'user_mask', 'steam:11000011c82dd6c', '{}'),
	(1278, 'user_helmet', 'steam:11000011802ab5b', '{}'),
	(1279, 'user_mask', 'steam:11000011802ab5b', '{"hasMask":true,"skin":{"mask_1":28,"mask_2":0}}'),
	(1280, 'user_ears', 'steam:11000011802ab5b', '{}'),
	(1281, 'user_glasses', 'steam:11000011802ab5b', '{}'),
	(1282, 'property', 'steam:11000011802ab5b', '{"dressing":[{"skin":{"lipstick_1":0,"shoes_2":0,"bracelets_2":0,"ears_1":11,"makeup_4":0,"tshirt_2":0,"sun_2":0,"eyebrows_3":6,"lipstick_3":0,"age_2":0,"glasses_2":0,"moles_2":0,"torso_1":48,"blush_1":7,"decals_1":0,"sex":0,"blemishes_2":0,"arms_2":0,"complexion_2":0,"blemishes_1":0,"hair_2":0,"beard_1":16,"chest_3":0,"skin":0,"watches_1":0,"face":4,"eyebrows_4":3,"beard_3":0,"bodyb_2":1,"chain_2":0,"lipstick_2":0,"ears_2":2,"arms":1,"chest_2":0,"age_1":0,"bags_1":0,"hair_color_1":0,"beard_2":10,"complexion_1":6,"bproof_2":0,"sun_1":0,"bags_2":0,"chest_1":1,"tshirt_1":15,"bodyb_1":0,"decals_2":0,"pants_2":0,"watches_2":0,"eyebrows_2":10,"bracelets_1":1,"glasses_1":0,"helmet_2":0,"chain_1":0,"makeup_2":0,"moles_1":0,"hair_1":2,"eye_color":18,"mask_1":0,"shoes_1":12,"makeup_1":0,"helmet_1":-1,"lipstick_4":0,"blush_2":0,"eyebrows_1":2,"torso_2":0,"hair_color_2":0,"beard_4":0,"makeup_3":0,"mask_2":0,"blush_3":0,"bproof_1":0,"pants_1":30},"label":"lotnik"},{"skin":{"lipstick_1":0,"bags_2":0,"bracelets_2":0,"ears_1":11,"makeup_4":0,"blush_2":0,"sun_2":0,"eyebrows_3":6,"helmet_2":0,"age_2":0,"glasses_2":0,"moles_2":0,"torso_1":10,"blush_1":7,"decals_1":0,"sex":0,"blemishes_2":0,"arms_2":0,"complexion_2":0,"torso_2":0,"hair_2":0,"beard_1":16,"chest_3":0,"skin":0,"watches_1":0,"face":4,"eyebrows_4":3,"beard_3":0,"bodyb_2":1,"chain_2":0,"lipstick_2":0,"ears_2":2,"arms":1,"chest_2":0,"age_1":0,"bags_1":0,"hair_color_1":0,"beard_2":10,"shoes_2":0,"tshirt_1":4,"bproof_2":0,"bodyb_1":0,"chest_1":1,"pants_2":0,"sun_1":0,"decals_2":0,"moles_1":0,"blemishes_1":0,"eyebrows_2":10,"eye_color":18,"tshirt_2":2,"watches_2":0,"chain_1":1,"makeup_2":0,"hair_color_2":0,"hair_1":2,"mask_2":0,"mask_1":0,"shoes_1":10,"helmet_1":-1,"lipstick_4":0,"makeup_1":0,"beard_4":0,"eyebrows_1":2,"glasses_1":0,"bracelets_1":1,"makeup_3":0,"complexion_1":6,"lipstick_3":0,"blush_3":0,"bproof_1":0,"pants_1":10},"label":"ubiór mafii"},{"skin":{"lipstick_1":0,"shoes_2":0,"bracelets_2":0,"ears_1":11,"helmet_1":-1,"makeup_1":0,"sun_2":0,"eyebrows_3":6,"lipstick_3":0,"age_2":0,"glasses_2":0,"moles_2":0,"torso_1":10,"blush_1":7,"decals_1":0,"sex":0,"blemishes_2":0,"arms_2":0,"complexion_2":0,"torso_2":0,"hair_2":0,"beard_1":16,"chest_3":0,"tshirt_1":4,"watches_1":0,"face":4,"eyebrows_4":3,"beard_3":0,"bodyb_2":1,"chain_2":0,"lipstick_2":0,"ears_2":2,"arms":17,"chest_2":0,"age_1":0,"bags_1":0,"hair_color_1":0,"beard_2":10,"sun_1":0,"hair_1":2,"makeup_4":0,"blush_2":0,"glasses_1":0,"chest_1":1,"skin":0,"decals_2":0,"pants_1":10,"pants_2":0,"eyebrows_2":10,"bodyb_1":0,"bags_2":0,"makeup_3":0,"chain_1":1,"makeup_2":0,"moles_1":0,"watches_2":0,"hair_color_2":0,"mask_1":28,"shoes_1":10,"beard_4":0,"lipstick_4":0,"tshirt_2":2,"bproof_2":0,"helmet_2":0,"mask_2":0,"bracelets_1":1,"complexion_1":6,"blemishes_1":0,"eye_color":18,"blush_3":0,"bproof_1":0,"eyebrows_1":2},"label":"mafijka"}]}'),
	(1283, 'property', 'steam:110000132f94910', '{}'),
	(1284, 'user_glasses', 'steam:110000132f94910', '{}'),
	(1285, 'user_ears', 'steam:110000132f94910', '{}'),
	(1286, 'user_helmet', 'steam:110000132f94910', '{}'),
	(1287, 'user_mask', 'steam:110000132f94910', '{}'),
	(1383, 'property', 'steam:1100001136927c8', '{}'),
	(1384, 'user_mask', 'steam:1100001136927c8', '{}'),
	(1385, 'user_ears', 'steam:1100001136927c8', '{}'),
	(1386, 'user_glasses', 'steam:1100001136927c8', '{}'),
	(1387, 'user_helmet', 'steam:1100001136927c8', '{}'),
	(1408, 'user_helmet', 'steam:110000114b5d160', '{}'),
	(1409, 'user_mask', 'steam:110000114b5d160', '{}'),
	(1410, 'property', 'steam:110000114b5d160', '{}'),
	(1411, 'user_ears', 'steam:110000114b5d160', '{}'),
	(1412, 'user_glasses', 'steam:110000114b5d160', '{}'),
	(1428, 'user_glasses', 'steam:11000011c94c366', '{}'),
	(1429, 'user_mask', 'steam:11000011c94c366', '{}'),
	(1430, 'user_helmet', 'steam:11000011c94c366', '{}'),
	(1431, 'user_ears', 'steam:11000011c94c366', '{}'),
	(1432, 'property', 'steam:11000011c94c366', '{}'),
	(1473, 'user_mask', 'steam:11000011abf0418', '{}'),
	(1474, 'property', 'steam:11000011abf0418', '{}'),
	(1475, 'user_glasses', 'steam:11000011abf0418', '{}'),
	(1476, 'user_helmet', 'steam:11000011abf0418', '{}'),
	(1477, 'user_ears', 'steam:11000011abf0418', '{}'),
	(1503, 'user_ears', 'steam:110000113519269', '{}'),
	(1504, 'user_mask', 'steam:110000113519269', '{}'),
	(1505, 'user_helmet', 'steam:110000113519269', '{}'),
	(1506, 'property', 'steam:110000113519269', '{}'),
	(1507, 'user_glasses', 'steam:110000113519269', '{}'),
	(1571, 'user_ears', 'steam:1100001132ba702', '{}'),
	(1572, 'user_mask', 'steam:1100001132ba702', '{}'),
	(1573, 'user_glasses', 'steam:1100001132ba702', '{}'),
	(1574, 'user_helmet', 'steam:1100001132ba702', '{}'),
	(1575, 'property', 'steam:1100001132ba702', '{}'),
	(1611, 'user_ears', 'steam:110000111ba5c5a', '{}'),
	(1612, 'user_glasses', 'steam:110000111ba5c5a', '{}'),
	(1613, 'property', 'steam:110000111ba5c5a', '{}'),
	(1614, 'user_helmet', 'steam:110000111ba5c5a', '{}'),
	(1615, 'user_mask', 'steam:110000111ba5c5a', '{}'),
	(1666, 'user_helmet', 'steam:110000119e48f06', '{}'),
	(1667, 'user_glasses', 'steam:110000119e48f06', '{}'),
	(1668, 'user_mask', 'steam:110000119e48f06', '{}'),
	(1669, 'property', 'steam:110000119e48f06', '{}'),
	(1670, 'user_ears', 'steam:110000119e48f06', '{}'),
	(1681, 'property', 'steam:1100001346b5cb2', '{}'),
	(1682, 'user_ears', 'steam:1100001346b5cb2', '{}'),
	(1683, 'user_mask', 'steam:1100001346b5cb2', '{}'),
	(1684, 'user_glasses', 'steam:1100001346b5cb2', '{}'),
	(1685, 'user_helmet', 'steam:1100001346b5cb2', '{}'),
	(1691, 'user_helmet', 'steam:1100001124b2c16', '{}'),
	(1692, 'user_glasses', 'steam:1100001124b2c16', '{}'),
	(1693, 'user_ears', 'steam:1100001124b2c16', '{}'),
	(1694, 'property', 'steam:1100001124b2c16', '{}'),
	(1695, 'user_mask', 'steam:1100001124b2c16', '{}'),
	(1696, 'user_mask', 'steam:110000114c56741', '{}'),
	(1697, 'user_ears', 'steam:110000114c56741', '{}'),
	(1698, 'user_glasses', 'steam:110000114c56741', '{}'),
	(1699, 'property', 'steam:110000114c56741', '{"dressing":[{"label":"elegancki","skin":{"shoes_2":2,"decals_2":0,"age_2":0,"lipstick_2":0,"bproof_2":0,"beard_4":0,"blemishes_2":0,"eye_color":0,"bproof_1":0,"bags_1":0,"eyebrows_4":0,"decals_1":0,"mask_1":0,"chest_1":0,"age_1":0,"lipstick_1":0,"watches_2":0,"sun_2":0,"bodyb_1":0,"blush_3":0,"chain_1":22,"sex":0,"ears_1":0,"glasses_2":0,"hair_2":0,"beard_3":1,"bracelets_1":5,"shoes_1":1,"makeup_2":0,"mask_2":0,"beard_1":11,"beard_2":10,"makeup_4":0,"hair_color_1":15,"makeup_3":0,"makeup_1":0,"pants_1":24,"ears_2":0,"lipstick_3":0,"skin":2,"arms_2":0,"pants_2":0,"bags_2":0,"hair_1":3,"glasses_1":0,"arms":26,"face":0,"helmet_2":0,"tshirt_2":0,"torso_1":11,"blemishes_1":0,"lipstick_4":0,"blush_1":0,"chest_2":0,"eyebrows_1":2,"sun_1":0,"blush_2":0,"tshirt_1":6,"helmet_1":-1,"complexion_2":0,"chain_2":14,"moles_1":0,"bracelets_2":0,"bodyb_2":0,"chest_3":0,"torso_2":0,"moles_2":0,"eyebrows_3":0,"complexion_1":0,"eyebrows_2":10,"hair_color_2":0,"watches_1":1}}]}'),
	(1700, 'user_helmet', 'steam:110000114c56741', '{}'),
	(1726, 'property', 'steam:110000111e4084c', '{}'),
	(1727, 'user_mask', 'steam:110000111e4084c', '{}'),
	(1728, 'user_helmet', 'steam:110000111e4084c', '{}'),
	(1729, 'user_ears', 'steam:110000111e4084c', '{}'),
	(1730, 'user_glasses', 'steam:110000111e4084c', '{}'),
	(1756, 'user_glasses', 'steam:1100001322fd1d2', '{}'),
	(1757, 'user_mask', 'steam:1100001322fd1d2', '{}'),
	(1758, 'user_ears', 'steam:1100001322fd1d2', '{}'),
	(1759, 'property', 'steam:1100001322fd1d2', '{}'),
	(1760, 'user_helmet', 'steam:1100001322fd1d2', '{}'),
	(1776, 'user_ears', 'steam:110000115eef648', '{}'),
	(1777, 'user_helmet', 'steam:110000115eef648', '{}'),
	(1778, 'user_mask', 'steam:110000115eef648', '{}'),
	(1779, 'property', 'steam:110000115eef648', '{}'),
	(1780, 'user_glasses', 'steam:110000115eef648', '{}'),
	(1801, 'user_mask', 'steam:110000117c329c0', '{}'),
	(1802, 'property', 'steam:110000117c329c0', '{}'),
	(1803, 'user_glasses', 'steam:110000117c329c0', '{}'),
	(1804, 'user_helmet', 'steam:110000117c329c0', '{}'),
	(1805, 'user_ears', 'steam:110000117c329c0', '{}'),
	(1811, 'user_ears', 'steam:11000011636f9f9', '{}'),
	(1812, 'user_helmet', 'steam:11000011636f9f9', '{}'),
	(1813, 'user_glasses', 'steam:11000011636f9f9', '{}'),
	(1814, 'property', 'steam:11000011636f9f9', '{}'),
	(1815, 'user_mask', 'steam:11000011636f9f9', '{}'),
	(1821, 'user_helmet', 'steam:11000011b0af15a', '{}'),
	(1822, 'user_glasses', 'steam:11000011b0af15a', '{}'),
	(1823, 'user_ears', 'steam:11000011b0af15a', '{}'),
	(1824, 'user_mask', 'steam:11000011b0af15a', '{}'),
	(1825, 'property', 'steam:11000011b0af15a', '{}'),
	(1841, 'user_ears', 'steam:1100001155411e1', '{}'),
	(1842, 'user_helmet', 'steam:1100001155411e1', '{}'),
	(1843, 'property', 'steam:1100001155411e1', '{}'),
	(1844, 'user_glasses', 'steam:1100001155411e1', '{}'),
	(1845, 'user_mask', 'steam:1100001155411e1', '{}'),
	(1856, 'user_helmet', 'steam:1100001129fd07b', '{}'),
	(1857, 'property', 'steam:1100001129fd07b', '{}'),
	(1858, 'user_mask', 'steam:1100001129fd07b', '{}'),
	(1859, 'user_glasses', 'steam:1100001129fd07b', '{}'),
	(1860, 'user_ears', 'steam:1100001129fd07b', '{}'),
	(1861, 'user_mask', 'steam:110000115f5ef48', '{}'),
	(1862, 'user_helmet', 'steam:110000115f5ef48', '{}'),
	(1863, 'property', 'steam:110000115f5ef48', '{}'),
	(1864, 'user_ears', 'steam:110000115f5ef48', '{}'),
	(1865, 'user_glasses', 'steam:110000115f5ef48', '{}'),
	(1871, 'user_ears', 'steam:11000013481c4b0', '{}'),
	(1872, 'property', 'steam:11000013481c4b0', '{}'),
	(1873, 'user_mask', 'steam:11000013481c4b0', '{}'),
	(1874, 'user_helmet', 'steam:11000013481c4b0', '{}'),
	(1875, 'user_glasses', 'steam:11000013481c4b0', '{}'),
	(1881, 'user_mask', 'steam:110000119da340a', '{}'),
	(1882, 'user_helmet', 'steam:110000119da340a', '{}'),
	(1883, 'user_glasses', 'steam:110000119da340a', '{}'),
	(1884, 'user_ears', 'steam:110000119da340a', '{}'),
	(1885, 'property', 'steam:110000119da340a', '{}'),
	(1911, 'user_mask', 'steam:1100001130f5fc0', '{}'),
	(1912, 'user_helmet', 'steam:1100001130f5fc0', '{}'),
	(1913, 'user_glasses', 'steam:1100001130f5fc0', '{}'),
	(1914, 'user_ears', 'steam:1100001130f5fc0', '{}'),
	(1915, 'property', 'steam:1100001130f5fc0', '{}'),
	(1951, 'property', 'steam:110000118ecf4aa', '{}'),
	(1952, 'user_helmet', 'steam:110000118ecf4aa', '{}'),
	(1953, 'user_ears', 'steam:110000118ecf4aa', '{}'),
	(1954, 'user_mask', 'steam:110000118ecf4aa', '{}'),
	(1955, 'user_glasses', 'steam:110000118ecf4aa', '{}'),
	(2021, 'user_glasses', 'steam:1100001187b0709', '{}'),
	(2022, 'user_helmet', 'steam:1100001187b0709', '{}'),
	(2023, 'property', 'steam:1100001187b0709', '{}'),
	(2024, 'user_mask', 'steam:1100001187b0709', '{}'),
	(2025, 'user_ears', 'steam:1100001187b0709', '{}'),
	(2036, 'property', 'steam:110000112f404d6', '{}'),
	(2037, 'user_mask', 'steam:110000112f404d6', '{}'),
	(2038, 'user_glasses', 'steam:110000112f404d6', '{}'),
	(2039, 'user_helmet', 'steam:110000112f404d6', '{}'),
	(2040, 'user_ears', 'steam:110000112f404d6', '{}'),
	(2066, 'user_helmet', 'steam:110000118953d5d', '{}'),
	(2067, 'user_glasses', 'steam:110000118953d5d', '{}'),
	(2068, 'user_mask', 'steam:110000118953d5d', '{}'),
	(2069, 'property', 'steam:110000118953d5d', '{}'),
	(2070, 'user_ears', 'steam:110000118953d5d', '{}'),
	(2071, 'property', 'steam:110000117d3baf6', '{}'),
	(2072, 'user_ears', 'steam:110000117d3baf6', '{}'),
	(2073, 'user_glasses', 'steam:110000117d3baf6', '{}'),
	(2074, 'user_helmet', 'steam:110000117d3baf6', '{}'),
	(2075, 'user_mask', 'steam:110000117d3baf6', '{}'),
	(2106, 'user_mask', 'steam:110000133793825', '{}'),
	(2107, 'user_ears', 'steam:110000133793825', '{}'),
	(2108, 'user_helmet', 'steam:110000133793825', '{}'),
	(2109, 'property', 'steam:110000133793825', '{}'),
	(2110, 'user_glasses', 'steam:110000133793825', '{}'),
	(2176, 'user_glasses', 'steam:110000119b34d60', '{}'),
	(2177, 'user_ears', 'steam:110000119b34d60', '{}'),
	(2178, 'user_mask', 'steam:110000119b34d60', '{}'),
	(2179, 'property', 'steam:110000119b34d60', '{}'),
	(2180, 'user_helmet', 'steam:110000119b34d60', '{}'),
	(2201, 'user_mask', 'steam:11000011354afb4', '{}'),
	(2202, 'user_ears', 'steam:11000011354afb4', '{}'),
	(2203, 'user_glasses', 'steam:11000011354afb4', '{}'),
	(2204, 'user_helmet', 'steam:11000011354afb4', '{}'),
	(2205, 'property', 'steam:11000011354afb4', '{}'),
	(2236, 'user_helmet', 'steam:1100001158b65ae', '{}'),
	(2237, 'property', 'steam:1100001158b65ae', '{}'),
	(2238, 'user_glasses', 'steam:1100001158b65ae', '{}'),
	(2239, 'user_ears', 'steam:1100001158b65ae', '{}'),
	(2240, 'user_mask', 'steam:1100001158b65ae', '{}'),
	(2276, 'property', 'steam:1100001128bea3d', '{}'),
	(2277, 'user_helmet', 'steam:1100001128bea3d', '{}'),
	(2278, 'user_glasses', 'steam:1100001128bea3d', '{}'),
	(2279, 'user_ears', 'steam:1100001128bea3d', '{}'),
	(2280, 'user_mask', 'steam:1100001128bea3d', '{}'),
	(2296, 'user_mask', 'steam:110000116f7d576', '{}'),
	(2297, 'user_glasses', 'steam:110000116f7d576', '{}'),
	(2298, 'property', 'steam:110000116f7d576', '{}'),
	(2299, 'user_helmet', 'steam:110000116f7d576', '{}'),
	(2300, 'user_ears', 'steam:110000116f7d576', '{}'),
	(2301, 'user_mask', 'steam:110000112f354e2', '{}'),
	(2302, 'user_ears', 'steam:110000112f354e2', '{}'),
	(2303, 'property', 'steam:110000112f354e2', '{}'),
	(2304, 'user_glasses', 'steam:110000112f354e2', '{}'),
	(2305, 'user_helmet', 'steam:110000112f354e2', '{}'),
	(2336, 'user_helmet', 'steam:1100001139a12ef', '{}'),
	(2337, 'user_mask', 'steam:1100001139a12ef', '{}'),
	(2338, 'property', 'steam:1100001139a12ef', '{}'),
	(2339, 'user_glasses', 'steam:1100001139a12ef', '{}'),
	(2340, 'user_ears', 'steam:1100001139a12ef', '{}'),
	(2341, 'user_helmet', 'steam:110000119c2997e', '{}'),
	(2342, 'user_glasses', 'steam:110000119c2997e', '{}'),
	(2343, 'user_ears', 'steam:110000119c2997e', '{}'),
	(2344, 'property', 'steam:110000119c2997e', '{}'),
	(2345, 'user_mask', 'steam:110000119c2997e', '{}'),
	(2366, 'property', 'steam:1100001124ab5d1', '{}'),
	(2367, 'user_mask', 'steam:1100001124ab5d1', '{}'),
	(2368, 'user_helmet', 'steam:1100001124ab5d1', '{}'),
	(2369, 'user_ears', 'steam:1100001124ab5d1', '{}'),
	(2370, 'user_glasses', 'steam:1100001124ab5d1', '{}'),
	(2376, 'property', 'steam:1100001179b5768', '{}'),
	(2377, 'user_helmet', 'steam:1100001179b5768', '{}'),
	(2378, 'user_ears', 'steam:1100001179b5768', '{}'),
	(2379, 'user_mask', 'steam:1100001179b5768', '{}'),
	(2380, 'user_glasses', 'steam:1100001179b5768', '{}'),
	(2431, 'user_glasses', 'steam:110000113cd1024', '{}'),
	(2432, 'user_ears', 'steam:110000113cd1024', '{}'),
	(2433, 'property', 'steam:110000113cd1024', '{}'),
	(2434, 'user_mask', 'steam:110000113cd1024', '{}'),
	(2435, 'user_helmet', 'steam:110000113cd1024', '{}'),
	(2446, 'user_glasses', 'steam:110000112df5d26', '{}'),
	(2447, 'user_mask', 'steam:110000112df5d26', '{}'),
	(2448, 'user_ears', 'steam:110000112df5d26', '{}'),
	(2449, 'property', 'steam:110000112df5d26', '{}'),
	(2450, 'user_helmet', 'steam:110000112df5d26', '{}'),
	(2451, 'property', 'steam:110000117a9f414', '{}'),
	(2452, 'user_ears', 'steam:110000117a9f414', '{}'),
	(2453, 'user_helmet', 'steam:110000117a9f414', '{}'),
	(2454, 'user_mask', 'steam:110000117a9f414', '{}'),
	(2455, 'user_glasses', 'steam:110000117a9f414', '{}'),
	(2456, 'property', 'steam:11000011c5934aa', '{}'),
	(2457, 'user_glasses', 'steam:11000011c5934aa', '{}'),
	(2458, 'user_mask', 'steam:11000011c5934aa', '{}'),
	(2459, 'user_helmet', 'steam:11000011c5934aa', '{}'),
	(2460, 'user_ears', 'steam:11000011c5934aa', '{}'),
	(2486, 'user_mask', 'steam:11000011506a7a3', '{}'),
	(2487, 'user_helmet', 'steam:11000011506a7a3', '{}'),
	(2488, 'user_ears', 'steam:11000011506a7a3', '{}'),
	(2489, 'user_glasses', 'steam:11000011506a7a3', '{}'),
	(2490, 'property', 'steam:11000011506a7a3', '{"dressing":[{"label":"kk","skin":{"complexion_2":0,"chain_2":0,"makeup_3":0,"sun_1":0,"torso_2":0,"lipstick_3":0,"lipstick_1":0,"age_1":0,"arms_2":0,"bracelets_1":-1,"pants_2":0,"eyebrows_3":0,"chest_3":0,"lipstick_2":0,"bracelets_2":0,"chain_1":0,"hair_2":0,"arms":0,"watches_2":0,"bodyb_1":0,"eyebrows_1":3,"beard_3":1,"lipstick_4":0,"blemishes_2":0,"chest_2":0,"moles_1":0,"bodyb_2":0,"moles_2":0,"blush_2":0,"bproof_1":0,"mask_1":111,"ears_1":-1,"makeup_1":0,"face":44,"helmet_1":-1,"decals_2":0,"eyebrows_4":0,"tshirt_2":0,"ears_2":0,"tshirt_1":8,"watches_1":0,"blush_3":0,"pants_1":4,"glasses_1":5,"sex":0,"mask_2":14,"makeup_2":0,"eyebrows_2":3,"blemishes_1":0,"beard_1":1,"sun_2":0,"makeup_4":0,"bags_1":0,"bags_2":0,"hair_color_2":7,"hair_1":39,"age_2":0,"torso_1":130,"bproof_2":0,"blush_1":0,"hair_color_1":9,"skin":26,"chest_1":0,"complexion_1":0,"shoes_2":7,"decals_1":0,"glasses_2":3,"beard_2":4,"helmet_2":0,"shoes_1":1,"eye_color":2,"beard_4":0}},{"label":"czarny","skin":{"complexion_2":0,"chain_2":0,"makeup_3":0,"sun_1":0,"torso_2":0,"lipstick_3":0,"lipstick_1":0,"age_1":0,"arms_2":0,"bracelets_1":-1,"pants_2":0,"eyebrows_3":0,"chest_3":0,"lipstick_2":0,"bracelets_2":0,"chain_1":0,"hair_2":0,"arms":14,"watches_2":0,"bodyb_1":0,"eyebrows_1":3,"beard_3":1,"lipstick_4":0,"blemishes_2":0,"chest_2":0,"moles_1":0,"bodyb_2":0,"moles_2":0,"blush_2":0,"bproof_1":0,"mask_1":56,"ears_1":-1,"makeup_1":0,"face":44,"helmet_1":-1,"decals_2":0,"eyebrows_4":0,"tshirt_2":0,"ears_2":0,"tshirt_1":11,"watches_1":0,"blush_3":0,"pants_1":26,"glasses_1":5,"chest_1":0,"mask_2":2,"bproof_2":0,"hair_color_1":9,"blemishes_1":0,"beard_1":1,"sun_2":0,"makeup_4":0,"bags_1":0,"bags_2":0,"hair_color_2":7,"hair_1":39,"age_2":0,"torso_1":62,"makeup_2":0,"blush_1":0,"skin":26,"eyebrows_2":3,"helmet_2":0,"sex":0,"shoes_2":2,"decals_1":1,"glasses_2":3,"beard_2":4,"eye_color":2,"shoes_1":9,"complexion_1":0,"beard_4":0}}]}'),
	(2496, 'user_mask', 'steam:11000011d19c13c', '{}'),
	(2497, 'user_helmet', 'steam:11000011d19c13c', '{}'),
	(2498, 'property', 'steam:11000011d19c13c', '{}'),
	(2499, 'user_ears', 'steam:11000011d19c13c', '{}'),
	(2500, 'user_glasses', 'steam:11000011d19c13c', '{}'),
	(2501, 'user_mask', 'steam:1100001153021eb', '{}'),
	(2502, 'user_glasses', 'steam:1100001153021eb', '{}'),
	(2503, 'property', 'steam:1100001153021eb', '{}'),
	(2504, 'user_helmet', 'steam:1100001153021eb', '{}'),
	(2505, 'user_ears', 'steam:1100001153021eb', '{}'),
	(2526, 'user_ears', 'steam:11000011a9b20a8', '{}'),
	(2527, 'user_mask', 'steam:11000011a9b20a8', '{}'),
	(2528, 'property', 'steam:11000011a9b20a8', '{}'),
	(2529, 'user_helmet', 'steam:11000011a9b20a8', '{}'),
	(2530, 'user_glasses', 'steam:11000011a9b20a8', '{}'),
	(2541, 'user_glasses', 'steam:110000115038024', '{}'),
	(2542, 'user_mask', 'steam:110000115038024', '{}'),
	(2543, 'user_helmet', 'steam:110000115038024', '{}'),
	(2544, 'user_ears', 'steam:110000115038024', '{}'),
	(2545, 'property', 'steam:110000115038024', '{}'),
	(2556, 'user_ears', 'steam:110000134c7769b', '{}'),
	(2557, 'user_mask', 'steam:110000134c7769b', '{}'),
	(2558, 'property', 'steam:110000134c7769b', '{}'),
	(2559, 'user_helmet', 'steam:110000134c7769b', '{}'),
	(2560, 'user_glasses', 'steam:110000134c7769b', '{}'),
	(2576, 'user_mask', 'steam:11000011acb1d45', '{}'),
	(2577, 'user_helmet', 'steam:11000011acb1d45', '{}'),
	(2578, 'user_glasses', 'steam:11000011acb1d45', '{}'),
	(2579, 'property', 'steam:11000011acb1d45', '{}'),
	(2580, 'user_ears', 'steam:11000011acb1d45', '{}'),
	(2581, 'user_helmet', 'steam:110000117b20c8c', '{}'),
	(2582, 'user_mask', 'steam:110000117b20c8c', '{}'),
	(2583, 'user_ears', 'steam:110000117b20c8c', '{}'),
	(2584, 'property', 'steam:110000117b20c8c', '{}'),
	(2585, 'user_glasses', 'steam:110000117b20c8c', '{}'),
	(2591, 'user_ears', 'steam:110000112505da8', '{}'),
	(2592, 'user_glasses', 'steam:110000112505da8', '{}'),
	(2593, 'property', 'steam:110000112505da8', '{}'),
	(2594, 'user_helmet', 'steam:110000112505da8', '{}'),
	(2595, 'user_mask', 'steam:110000112505da8', '{}'),
	(2616, 'user_helmet', 'steam:110000132807b06', '{}'),
	(2617, 'user_glasses', 'steam:110000132807b06', '{}'),
	(2618, 'user_ears', 'steam:110000132807b06', '{}'),
	(2619, 'property', 'steam:110000132807b06', '{}'),
	(2620, 'user_mask', 'steam:110000132807b06', '{}'),
	(2641, 'user_ears', 'steam:11000011a5f6437', '{}'),
	(2642, 'user_helmet', 'steam:11000011a5f6437', '{}'),
	(2643, 'user_glasses', 'steam:11000011a5f6437', '{}'),
	(2644, 'user_mask', 'steam:11000011a5f6437', '{}'),
	(2645, 'property', 'steam:11000011a5f6437', '{}'),
	(2696, 'user_ears', 'steam:110000117954699', '{}'),
	(2697, 'user_mask', 'steam:110000117954699', '{}'),
	(2698, 'user_helmet', 'steam:110000117954699', '{}'),
	(2699, 'user_glasses', 'steam:110000117954699', '{}'),
	(2700, 'property', 'steam:110000117954699', '{}'),
	(2701, 'user_helmet', 'steam:110000111bbefe1', '{}'),
	(2702, 'user_glasses', 'steam:110000111bbefe1', '{}'),
	(2703, 'property', 'steam:110000111bbefe1', '{}'),
	(2704, 'user_ears', 'steam:110000111bbefe1', '{}'),
	(2705, 'user_mask', 'steam:110000111bbefe1', '{}'),
	(2726, 'user_mask', 'steam:11000011621e8b7', '{}'),
	(2727, 'user_glasses', 'steam:11000011621e8b7', '{}'),
	(2728, 'user_helmet', 'steam:11000011621e8b7', '{}'),
	(2729, 'user_ears', 'steam:11000011621e8b7', '{}'),
	(2730, 'property', 'steam:11000011621e8b7', '{}'),
	(2731, 'user_ears', 'steam:1100001330b4b64', '{}'),
	(2732, 'property', 'steam:1100001330b4b64', '{}'),
	(2733, 'user_mask', 'steam:1100001330b4b64', '{}'),
	(2734, 'user_helmet', 'steam:1100001330b4b64', '{}'),
	(2735, 'user_glasses', 'steam:1100001330b4b64', '{}'),
	(2741, 'user_helmet', 'steam:110000116108a1a', '{}'),
	(2742, 'user_glasses', 'steam:110000116108a1a', '{}'),
	(2743, 'user_ears', 'steam:110000116108a1a', '{}'),
	(2744, 'property', 'steam:110000116108a1a', '{}'),
	(2745, 'user_mask', 'steam:110000116108a1a', '{}'),
	(2761, 'property', 'steam:110000111e19578', '{}'),
	(2762, 'user_ears', 'steam:110000111e19578', '{}'),
	(2763, 'user_mask', 'steam:110000111e19578', '{}'),
	(2764, 'user_helmet', 'steam:110000111e19578', '{}'),
	(2765, 'user_glasses', 'steam:110000111e19578', '{}'),
	(2766, 'user_ears', 'steam:11000011570b2ee', '{}'),
	(2767, 'user_glasses', 'steam:11000011570b2ee', '{}'),
	(2768, 'property', 'steam:11000011570b2ee', '{}'),
	(2769, 'user_mask', 'steam:11000011570b2ee', '{}'),
	(2770, 'user_helmet', 'steam:11000011570b2ee', '{}'),
	(2781, 'property', 'steam:11000011b205782', '{}'),
	(2782, 'user_helmet', 'steam:11000011b205782', '{}'),
	(2783, 'user_mask', 'steam:11000011b205782', '{}'),
	(2784, 'user_ears', 'steam:11000011b205782', '{}'),
	(2785, 'user_glasses', 'steam:11000011b205782', '{}'),
	(2811, 'user_glasses', 'steam:1100001147c61ef', '{}'),
	(2812, 'user_helmet', 'steam:1100001147c61ef', '{}'),
	(2813, 'user_ears', 'steam:1100001147c61ef', '{}'),
	(2814, 'user_mask', 'steam:1100001147c61ef', '{}'),
	(2815, 'property', 'steam:1100001147c61ef', '{}'),
	(2821, 'user_mask', 'steam:110000116d75ad8', '{}'),
	(2822, 'property', 'steam:110000116d75ad8', '{}'),
	(2823, 'user_glasses', 'steam:110000116d75ad8', '{}'),
	(2824, 'user_helmet', 'steam:110000116d75ad8', '{}'),
	(2825, 'user_ears', 'steam:110000116d75ad8', '{}'),
	(2831, 'user_mask', 'steam:1100001172bc1c3', '{}'),
	(2832, 'user_helmet', 'steam:1100001172bc1c3', '{}'),
	(2833, 'user_ears', 'steam:1100001172bc1c3', '{}'),
	(2834, 'property', 'steam:1100001172bc1c3', '{}'),
	(2835, 'user_glasses', 'steam:1100001172bc1c3', '{}'),
	(2851, 'user_glasses', 'steam:1100001132a4a12', '{}'),
	(2852, 'property', 'steam:1100001132a4a12', '{}'),
	(2853, 'user_ears', 'steam:1100001132a4a12', '{}'),
	(2854, 'user_mask', 'steam:1100001132a4a12', '{}'),
	(2855, 'user_helmet', 'steam:1100001132a4a12', '{}'),
	(2861, 'user_helmet', 'steam:110000112b5841d', '{}'),
	(2862, 'property', 'steam:110000112b5841d', '{}'),
	(2863, 'user_glasses', 'steam:110000112b5841d', '{}'),
	(2864, 'user_ears', 'steam:110000112b5841d', '{}'),
	(2865, 'user_mask', 'steam:110000112b5841d', '{}'),
	(2891, 'user_mask', 'steam:110000113546f47', '{}'),
	(2892, 'user_glasses', 'steam:110000113546f47', '{}'),
	(2893, 'property', 'steam:110000113546f47', '{}'),
	(2894, 'user_ears', 'steam:110000113546f47', '{}'),
	(2895, 'user_helmet', 'steam:110000113546f47', '{}'),
	(2896, 'user_glasses', 'steam:1100001172461d8', '{}'),
	(2897, 'user_helmet', 'steam:1100001172461d8', '{}'),
	(2898, 'user_ears', 'steam:1100001172461d8', '{}'),
	(2899, 'property', 'steam:1100001172461d8', '{}'),
	(2900, 'user_mask', 'steam:1100001172461d8', '{}'),
	(2901, 'user_ears', 'steam:11000011a9177b5', '{}'),
	(2902, 'user_mask', 'steam:11000011a9177b5', '{}'),
	(2903, 'user_glasses', 'steam:11000011a9177b5', '{}'),
	(2904, 'user_helmet', 'steam:11000011a9177b5', '{}'),
	(2905, 'property', 'steam:11000011a9177b5', '{}'),
	(2911, 'user_mask', 'steam:11000011aaa76ac', '{}'),
	(2912, 'user_ears', 'steam:11000011aaa76ac', '{}'),
	(2913, 'user_glasses', 'steam:11000011aaa76ac', '{}'),
	(2914, 'property', 'steam:11000011aaa76ac', '{}'),
	(2915, 'user_helmet', 'steam:11000011aaa76ac', '{}'),
	(2981, 'user_mask', 'steam:110000115c8d425', '{}'),
	(2982, 'user_helmet', 'steam:110000115c8d425', '{}'),
	(2983, 'property', 'steam:110000115c8d425', '{}'),
	(2984, 'user_glasses', 'steam:110000115c8d425', '{}'),
	(2985, 'user_ears', 'steam:110000115c8d425', '{}'),
	(3031, 'user_helmet', 'steam:110000115bfef8d', '{}'),
	(3032, 'user_mask', 'steam:110000115bfef8d', '{}'),
	(3033, 'property', 'steam:110000115bfef8d', '{}'),
	(3034, 'user_ears', 'steam:110000115bfef8d', '{}'),
	(3035, 'user_glasses', 'steam:110000115bfef8d', '{}'),
	(3046, 'user_glasses', 'steam:110000115d4b52c', '{}'),
	(3047, 'user_helmet', 'steam:110000115d4b52c', '{}'),
	(3048, 'user_mask', 'steam:110000115d4b52c', '{}'),
	(3049, 'property', 'steam:110000115d4b52c', '{}'),
	(3050, 'user_ears', 'steam:110000115d4b52c', '{}'),
	(3056, 'user_mask', 'steam:11000013444025c', '{}'),
	(3057, 'user_helmet', 'steam:11000013444025c', '{}'),
	(3058, 'user_glasses', 'steam:11000013444025c', '{}'),
	(3059, 'property', 'steam:11000013444025c', '{}'),
	(3060, 'user_ears', 'steam:11000013444025c', '{}'),
	(3066, 'user_ears', 'steam:110000117a632ae', '{}'),
	(3067, 'user_glasses', 'steam:110000117a632ae', '{}'),
	(3068, 'property', 'steam:110000117a632ae', '{}'),
	(3069, 'user_helmet', 'steam:110000117a632ae', '{}'),
	(3070, 'user_mask', 'steam:110000117a632ae', '{}'),
	(3071, 'user_ears', 'steam:110000114f910c9', '{}'),
	(3072, 'user_helmet', 'steam:110000114f910c9', '{}'),
	(3073, 'user_mask', 'steam:110000114f910c9', '{}'),
	(3074, 'user_glasses', 'steam:110000114f910c9', '{}'),
	(3075, 'property', 'steam:110000114f910c9', '{}'),
	(3106, 'user_mask', 'steam:110000134aedace', '{}'),
	(3107, 'user_glasses', 'steam:110000134aedace', '{}'),
	(3108, 'user_ears', 'steam:110000134aedace', '{}'),
	(3109, 'user_helmet', 'steam:110000134aedace', '{}'),
	(3110, 'property', 'steam:110000134aedace', '{}'),
	(3116, 'user_mask', 'steam:110000132ef930c', '{}'),
	(3117, 'user_ears', 'steam:110000132ef930c', '{}'),
	(3118, 'user_glasses', 'steam:110000132ef930c', '{}'),
	(3119, 'user_helmet', 'steam:110000132ef930c', '{}'),
	(3120, 'property', 'steam:110000132ef930c', '{"dressing":[{"label":"git","skin":{"chest_3":0,"makeup_4":0,"hair_1":21,"arms_2":0,"eyebrows_2":0,"bags_2":0,"makeup_3":0,"skin":41,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":14,"decals_2":0,"lipstick_4":0,"chest_1":0,"beard_1":18,"blush_2":0,"arms":11,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":27,"mask_1":0,"face":44,"blemishes_1":0,"shoes_1":1,"torso_1":13,"pants_1":8,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":-1,"torso_2":0,"makeup_2":0,"beard_2":10,"chain_1":0,"glasses_1":18,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":0,"moles_1":0,"eyebrows_1":0,"makeup_1":0,"lipstick_2":0,"beard_3":26,"bodyb_2":0,"bags_1":0,"complexion_1":0,"glasses_2":1,"helmet_1":-1,"shoes_2":1,"tshirt_1":15,"bproof_2":0,"decals_1":0,"age_2":0,"sun_1":0,"ears_2":0,"eyebrows_4":0,"beard_4":38,"bracelets_2":0,"age_1":0,"eye_color":0,"watches_1":8,"helmet_2":0,"moles_2":0}},{"label":"SZARY MUDNUR","skin":{"chest_3":0,"makeup_4":0,"hair_1":21,"arms_2":0,"eyebrows_2":0,"bags_2":0,"makeup_3":0,"skin":41,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":1,"decals_2":0,"lipstick_4":0,"chest_1":0,"beard_1":18,"blush_2":0,"arms":41,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":27,"mask_1":0,"face":44,"blemishes_1":0,"eyebrows_1":0,"torso_1":55,"pants_1":25,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":2,"torso_2":0,"makeup_2":0,"beard_2":10,"chain_1":0,"glasses_1":18,"bracelets_1":-1,"bracelets_2":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":0,"moles_1":0,"ears_2":0,"makeup_1":0,"lipstick_2":0,"beard_4":38,"bodyb_2":0,"bags_1":0,"complexion_1":0,"shoes_1":25,"helmet_1":-1,"shoes_2":0,"tshirt_1":58,"beard_3":26,"glasses_2":1,"eyebrows_4":0,"decals_1":0,"blush_1":0,"sun_1":0,"bproof_2":0,"age_2":0,"age_1":0,"eye_color":0,"watches_1":8,"helmet_2":0,"moles_2":0}},{"label":"OP","skin":{"chest_3":0,"makeup_4":0,"hair_1":21,"arms_2":0,"eyebrows_2":0,"bags_2":0,"makeup_3":0,"skin":41,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":0,"decals_2":0,"ears_2":0,"chest_1":0,"beard_1":18,"blush_2":0,"arms":41,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":27,"mask_1":0,"face":44,"blemishes_1":0,"shoes_1":51,"torso_1":55,"pants_1":8,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":2,"torso_2":0,"makeup_2":0,"beard_2":10,"lipstick_2":0,"glasses_1":18,"bracelets_1":-1,"bracelets_2":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":0,"moles_1":0,"bproof_2":0,"makeup_1":0,"sun_1":0,"age_2":0,"bodyb_2":0,"bags_1":0,"complexion_1":0,"lipstick_4":0,"helmet_2":0,"shoes_2":0,"tshirt_1":58,"eyebrows_1":0,"beard_3":26,"glasses_2":1,"helmet_1":-1,"decals_1":0,"eyebrows_4":0,"blush_1":0,"chain_1":0,"age_1":0,"eye_color":0,"beard_4":38,"watches_1":10,"moles_2":0}},{"label":"OP SZARE","skin":{"chest_3":0,"makeup_4":0,"hair_1":21,"arms_2":0,"eyebrows_2":0,"bags_2":0,"makeup_3":0,"skin":41,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":1,"decals_2":0,"lipstick_4":0,"chest_1":0,"beard_1":18,"blush_2":0,"arms":41,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":27,"mask_1":0,"face":44,"blemishes_1":0,"shoes_1":51,"torso_1":55,"beard_3":26,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"age_2":0,"chest_2":0,"ears_1":2,"torso_2":0,"makeup_2":0,"beard_2":10,"chain_1":0,"sun_1":0,"bracelets_1":-1,"bracelets_2":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":0,"moles_1":0,"pants_1":25,"makeup_1":0,"watches_1":10,"complexion_2":0,"bodyb_2":0,"bags_1":0,"complexion_1":0,"eyebrows_1":0,"helmet_2":0,"shoes_2":0,"tshirt_1":58,"helmet_1":-1,"glasses_2":1,"decals_1":0,"eyebrows_4":0,"lipstick_2":0,"ears_2":0,"glasses_1":18,"blush_1":0,"age_1":0,"eye_color":0,"bproof_2":0,"beard_4":38,"moles_2":0}}]}'),
	(3126, 'user_helmet', 'steam:1100001334cfda5', '{}'),
	(3127, 'user_glasses', 'steam:1100001334cfda5', '{}'),
	(3128, 'property', 'steam:1100001334cfda5', '{}'),
	(3129, 'user_mask', 'steam:1100001334cfda5', '{}'),
	(3130, 'user_ears', 'steam:1100001334cfda5', '{}'),
	(3146, 'user_ears', 'steam:11000011ca8067c', '{}'),
	(3147, 'property', 'steam:11000011ca8067c', '{}'),
	(3148, 'user_helmet', 'steam:11000011ca8067c', '{}'),
	(3149, 'user_glasses', 'steam:11000011ca8067c', '{}'),
	(3150, 'user_mask', 'steam:11000011ca8067c', '{}'),
	(3151, 'user_glasses', 'steam:110000133eb514a', '{}'),
	(3152, 'user_mask', 'steam:110000133eb514a', '{}'),
	(3153, 'user_helmet', 'steam:110000133eb514a', '{}'),
	(3154, 'user_ears', 'steam:110000133eb514a', '{}'),
	(3155, 'property', 'steam:110000133eb514a', '{}'),
	(3176, 'user_glasses', 'steam:1100001130cd44e', '{}'),
	(3177, 'property', 'steam:1100001130cd44e', '{}'),
	(3178, 'user_helmet', 'steam:1100001130cd44e', '{}'),
	(3179, 'user_ears', 'steam:1100001130cd44e', '{}'),
	(3180, 'user_mask', 'steam:1100001130cd44e', '{}'),
	(3186, 'user_helmet', 'steam:11000011869848e', '{}'),
	(3187, 'property', 'steam:11000011869848e', '{}'),
	(3188, 'user_glasses', 'steam:11000011869848e', '{}'),
	(3189, 'user_ears', 'steam:11000011869848e', '{}'),
	(3190, 'user_mask', 'steam:11000011869848e', '{}'),
	(3196, 'user_ears', 'steam:11000011551f61f', '{}'),
	(3197, 'user_glasses', 'steam:11000011551f61f', '{}'),
	(3198, 'user_helmet', 'steam:11000011551f61f', '{}'),
	(3199, 'property', 'steam:11000011551f61f', '{}'),
	(3200, 'user_mask', 'steam:11000011551f61f', '{}'),
	(3211, 'user_ears', 'steam:11000011b3e81e7', '{}'),
	(3212, 'property', 'steam:11000011b3e81e7', '{}'),
	(3213, 'user_mask', 'steam:11000011b3e81e7', '{}'),
	(3214, 'user_helmet', 'steam:11000011b3e81e7', '{}'),
	(3215, 'user_glasses', 'steam:11000011b3e81e7', '{}'),
	(3216, 'user_mask', 'steam:110000114355737', '{}'),
	(3217, 'property', 'steam:110000114355737', '{"dressing":[{"label":"Codzienny","skin":{"chest_3":0,"makeup_4":0,"hair_1":33,"arms_2":0,"eyebrows_2":10,"bags_2":0,"makeup_3":0,"skin":5,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":0,"decals_2":0,"lipstick_4":0,"chest_1":10,"beard_1":5,"blush_2":0,"arms":26,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":14,"mask_1":0,"face":19,"blemishes_1":0,"shoes_1":12,"torso_1":13,"pants_1":13,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":2,"complexion_2":0,"chest_2":0,"ears_1":5,"torso_2":2,"makeup_2":0,"beard_2":10,"chain_1":12,"glasses_1":0,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":16,"moles_1":0,"ears_2":0,"makeup_1":0,"lipstick_2":0,"eyebrows_1":18,"bodyb_2":0,"bags_1":0,"complexion_1":0,"beard_3":16,"helmet_2":0,"shoes_2":6,"tshirt_1":15,"glasses_2":0,"bproof_2":0,"decals_1":0,"helmet_1":-1,"sun_1":0,"age_2":0,"eyebrows_4":0,"beard_4":0,"age_1":0,"eye_color":0,"bracelets_2":0,"watches_1":-1,"moles_2":0}},{"label":"Plaza","skin":{"chest_3":0,"makeup_4":0,"hair_1":33,"arms_2":0,"eyebrows_2":10,"bags_2":0,"makeup_3":0,"skin":5,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":2,"decals_2":0,"lipstick_4":0,"chest_1":10,"beard_1":5,"blush_2":0,"arms":15,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":14,"mask_1":0,"face":19,"blemishes_1":0,"shoes_1":16,"torso_1":15,"pants_1":16,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":2,"torso_2":0,"makeup_2":0,"beard_2":10,"chain_1":43,"glasses_1":5,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":16,"moles_1":0,"beard_3":16,"makeup_1":0,"lipstick_2":0,"eyebrows_1":18,"bodyb_2":0,"bags_1":0,"complexion_1":0,"glasses_2":0,"helmet_2":0,"shoes_2":1,"tshirt_1":15,"ears_2":0,"age_2":0,"decals_1":0,"helmet_1":-1,"sun_1":0,"eyebrows_4":0,"bproof_2":0,"beard_4":0,"age_1":0,"eye_color":0,"bracelets_2":0,"watches_1":-1,"moles_2":0}},{"label":"Mundur","skin":{"chest_3":0,"makeup_4":0,"hair_1":33,"arms_2":0,"eyebrows_2":10,"bags_2":0,"makeup_3":0,"skin":5,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":7,"decals_2":0,"lipstick_4":0,"chest_1":10,"beard_1":5,"blush_2":0,"arms":19,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":14,"mask_1":0,"face":19,"blemishes_1":0,"shoes_1":25,"torso_1":55,"pants_1":9,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":2,"torso_2":0,"makeup_2":0,"beard_2":10,"chain_1":0,"glasses_1":5,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":16,"moles_1":0,"beard_3":16,"makeup_1":0,"lipstick_2":0,"eyebrows_1":18,"bodyb_2":0,"bags_1":0,"complexion_1":0,"glasses_2":0,"helmet_2":0,"shoes_2":0,"tshirt_1":58,"bproof_2":0,"helmet_1":-1,"decals_1":0,"ears_2":0,"sun_1":0,"age_2":0,"eyebrows_4":0,"beard_4":0,"age_1":0,"eye_color":0,"bracelets_2":0,"watches_1":-1,"moles_2":0}},{"label":"Mudnur V2","skin":{"chest_3":0,"makeup_4":0,"hair_1":33,"arms_2":0,"eyebrows_2":10,"bags_2":0,"makeup_3":0,"skin":5,"hair_color_2":0,"mask_2":0,"lipstick_3":0,"pants_2":7,"decals_2":0,"lipstick_4":0,"chest_1":10,"beard_1":5,"blush_2":0,"arms":26,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":14,"mask_1":0,"face":19,"blemishes_1":0,"shoes_1":25,"torso_1":13,"beard_3":16,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":2,"torso_2":2,"makeup_2":0,"beard_2":10,"chain_1":0,"glasses_1":5,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":16,"moles_1":0,"pants_1":9,"makeup_1":0,"age_2":0,"lipstick_2":0,"bodyb_2":0,"bags_1":0,"complexion_1":0,"eyebrows_1":18,"helmet_2":3,"shoes_2":0,"tshirt_1":58,"glasses_2":0,"eyebrows_4":0,"decals_1":0,"bproof_2":0,"helmet_1":13,"sun_1":0,"ears_2":0,"bracelets_2":0,"age_1":0,"eye_color":0,"beard_4":0,"watches_1":-1,"moles_2":0}},{"label":"IAA ","skin":{"chest_3":0,"makeup_4":0,"hair_1":33,"arms_2":0,"eyebrows_2":10,"bags_2":0,"makeup_3":0,"skin":5,"hair_color_2":0,"mask_2":0,"glasses_2":1,"eyebrows_4":0,"decals_2":0,"lipstick_4":0,"chest_1":10,"beard_1":5,"blush_2":0,"arms":26,"lipstick_1":0,"sex":0,"bodyb_1":0,"tshirt_2":0,"bproof_1":0,"hair_color_1":14,"mask_1":0,"face":19,"blemishes_1":0,"shoes_1":12,"torso_1":13,"pants_1":13,"watches_2":0,"sun_2":0,"blush_3":0,"chain_2":0,"complexion_2":0,"chest_2":0,"ears_1":5,"torso_2":2,"makeup_2":0,"beard_2":10,"lipstick_2":0,"glasses_1":5,"bracelets_1":-1,"blush_1":0,"blemishes_2":0,"hair_2":0,"eyebrows_3":16,"moles_1":0,"lipstick_3":0,"makeup_1":0,"age_2":0,"sun_1":0,"bodyb_2":0,"bags_1":0,"complexion_1":0,"helmet_1":13,"helmet_2":3,"bproof_2":0,"tshirt_1":15,"eyebrows_1":18,"beard_3":16,"beard_4":0,"decals_1":0,"shoes_2":6,"ears_2":0,"chain_1":125,"bracelets_2":0,"age_1":0,"eye_color":0,"watches_1":-1,"pants_2":0,"moles_2":0}}]}'),
	(3218, 'user_helmet', 'steam:110000114355737', '{}'),
	(3219, 'user_glasses', 'steam:110000114355737', '{}'),
	(3220, 'user_ears', 'steam:110000114355737', '{}'),
	(3221, 'user_ears', 'steam:110000116dadea4', '{}'),
	(3222, 'property', 'steam:110000116dadea4', '{"dressing":[{"label":"Outfit 1","skin":{"complexion_2":0,"chain_2":0,"makeup_3":0,"sun_1":0,"torso_2":0,"lipstick_3":53,"lipstick_1":3,"age_1":0,"arms_2":0,"bracelets_1":-1,"pants_2":0,"eyebrows_3":10,"chest_3":0,"lipstick_2":10,"bracelets_2":0,"chain_1":0,"hair_2":0,"arms":4,"watches_2":0,"eye_color":0,"eyebrows_1":28,"beard_3":0,"lipstick_4":0,"blemishes_2":0,"helmet_2":0,"moles_1":0,"bodyb_2":0,"moles_2":0,"blush_2":0,"bproof_1":0,"mask_1":0,"ears_1":-1,"makeup_1":0,"face":45,"helmet_1":-1,"decals_2":0,"eyebrows_4":0,"bproof_2":0,"ears_2":0,"tshirt_1":2,"watches_1":-1,"blush_3":0,"pants_1":27,"glasses_1":5,"torso_1":118,"makeup_2":0,"skin":0,"bags_2":0,"blemishes_1":0,"beard_1":0,"sun_2":0,"makeup_4":0,"bags_1":0,"age_2":0,"hair_color_2":0,"hair_1":42,"chest_1":0,"hair_color_1":31,"tshirt_2":0,"blush_1":0,"eyebrows_2":10,"sex":1,"mask_2":0,"complexion_1":0,"shoes_2":1,"decals_1":0,"glasses_2":0,"bodyb_1":0,"beard_2":0,"shoes_1":3,"chest_2":0,"beard_4":0}}]}'),
	(3223, 'user_helmet', 'steam:110000116dadea4', '{}'),
	(3224, 'user_mask', 'steam:110000116dadea4', '{"hasMask":true,"skin":{"mask_1":99,"mask_2":2}}'),
	(3225, 'user_glasses', 'steam:110000116dadea4', '{}'),
	(3236, 'user_mask', 'steam:11000011635988b', '{}'),
	(3237, 'user_helmet', 'steam:11000011635988b', '{}'),
	(3238, 'user_glasses', 'steam:11000011635988b', '{}'),
	(3239, 'property', 'steam:11000011635988b', '{}'),
	(3240, 'user_ears', 'steam:11000011635988b', '{}'),
	(3246, 'society_journaliste', NULL, '{}'),
	(3257, 'society_biker', NULL, '{}'),
	(3258, 'society_cartel', NULL, '{}'),
	(3259, 'society_gang', NULL, '{}'),
	(3260, 'society_mafia', NULL, '{}'),
	(3261, 'society_state', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table server_3.ea_bans
CREATE TABLE IF NOT EXISTS `ea_bans` (
  `banid` int(11) NOT NULL AUTO_INCREMENT,
  `expire` double NOT NULL DEFAULT '10444633200',
  `identifier` text NOT NULL,
  `steam` text NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`banid`),
  UNIQUE KEY `banid` (`banid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.ea_bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `ea_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ea_bans` ENABLE KEYS */;

-- Dumping structure for table server_3.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.fine_types: ~48 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'do 10km/h', 50, 0),
	(2, '11 - 20 km/h', 75, 0),
	(3, '21 - 30 km/h', 150, 0),
	(4, '31 - 40 km/h', 250, 0),
	(5, '41 - 50 km/h', 350, 0),
	(6, '51 + km/h', 450, 0),
	(7, 'Utrudnianie ruchu innym kierowca', 125, 0),
	(8, 'Zwiekszanie predkosci podczas wyprzedania', 350, 0),
	(9, 'Nieustapienie pierwszenstwa (ruch)', 300, 1),
	(10, 'Wjezdzanie na pas miedzy jezdniami', 100, 1),
	(11, 'Utrudnianie ruchu poprzez brak sygnalizowania', 200, 1),
	(12, 'Utrudnianie ruchu poprzez bledne sygnalizowanie', 200, 1),
	(13, 'Nieustapienie pierwszenstwa (zmiana pasa)', 250, 1),
	(14, 'Niebezpieczne hamowanie', 200, 1),
	(15, 'Wyprzedzanie na przejazdach kolejowych itp', 300, 1),
	(16, 'Wyprzedzanie bez zachowania bezpiecznego odstepu', 300, 1),
	(17, 'Wyprzedzanie z niewlasciwej strony', 200, 1),
	(18, 'Wyprzedzanie pojazdu uprzywilejowanego', 300, 1),
	(19, 'Niekorzystanie z pasow bezpieczensta podczas jazdy', 100, 2),
	(20, 'Nieuzywanie kasku ochronnego (motory, motorowery itp)', 100, 2),
	(21, 'Korzystanie z telefonu podczas jazdy', 200, 2),
	(22, 'Nieuzywanie elementow odblaskowych ', 150, 2),
	(23, 'Brak oznaczen pojazdow do nauki jazdy', 300, 2),
	(24, 'na przejsciach dla pieszych', 50, 3),
	(25, 'w miejscach innych niz przejscia dla pieszych', 100, 3),
	(26, 'przebieganie przez jezdnie', 50, 3),
	(27, 'Chodzenie po torowisku', 50, 3),
	(28, 'naruszanie przepisow ruchu pieszych lub rowerow', 50, 3),
	(29, 'Przejachanie na czerwonym swietle', 300, 0),
	(30, 'Nie wylaczenie silnika podczas postoju', 200, 2),
	(31, 'Zle parkowanie', 300, 1),
	(32, 'Grzywna 1', 100, 4),
	(53, 'Grzywna 2', 200, 4),
	(54, 'Grzywna 3', 300, 4),
	(55, 'Grzywna 4', 400, 4),
	(56, 'Grzywna 5', 500, 4),
	(57, 'Grzywna 6', 600, 4),
	(58, 'Grzywna 7', 700, 4),
	(59, 'Grzywna 8', 800, 4),
	(60, 'Grzywna 9', 900, 4),
	(61, 'Grzywna 10', 1000, 4),
	(62, 'Grzywna 11', 1100, 4),
	(63, 'Grzywna 12', 1200, 4),
	(64, 'Grzywna 13', 1300, 4),
	(65, 'Grzywna 14', 1400, 4),
	(66, 'Grzywna 15', 1500, 4),
	(67, 'Grzywna 16', 2000, 4),
	(68, 'Grzywna 17', 3000, 4);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table server_3.fine_types_biker
CREATE TABLE IF NOT EXISTS `fine_types_biker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.fine_types_biker: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_biker` DISABLE KEYS */;
INSERT INTO `fine_types_biker` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_biker` ENABLE KEYS */;

-- Dumping structure for table server_3.fine_types_cartel
CREATE TABLE IF NOT EXISTS `fine_types_cartel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.fine_types_cartel: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_cartel` DISABLE KEYS */;
INSERT INTO `fine_types_cartel` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_cartel` ENABLE KEYS */;

-- Dumping structure for table server_3.fine_types_gang
CREATE TABLE IF NOT EXISTS `fine_types_gang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.fine_types_gang: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_gang` DISABLE KEYS */;
INSERT INTO `fine_types_gang` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_gang` ENABLE KEYS */;

-- Dumping structure for table server_3.fine_types_mafia
CREATE TABLE IF NOT EXISTS `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.fine_types_mafia: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_mafia` DISABLE KEYS */;
INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_mafia` ENABLE KEYS */;

-- Dumping structure for table server_3.hospital
CREATE TABLE IF NOT EXISTS `hospital` (
  `identifier` varchar(100) NOT NULL,
  `H_Time` int(10) NOT NULL,
  `H_Bed` varchar(5) NOT NULL,
  `Medic` varchar(100) NOT NULL,
  `Medic_ID` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.hospital: ~1 rows (approximately)
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;

-- Dumping structure for table server_3.impounded_vehicles
CREATE TABLE IF NOT EXISTS `impounded_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(12) DEFAULT NULL,
  `vehicle` text,
  `owner` varchar(250) DEFAULT NULL,
  `impounded_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.impounded_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `impounded_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `impounded_vehicles` ENABLE KEYS */;

-- Dumping structure for table server_3.items
CREATE TABLE IF NOT EXISTS `items` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.items: ~116 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ID`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	(1, 'alive_chicken', 'Kurczak', 100, 0, 1),
	(2, 'bandage', 'Bandaz', 10, 0, 1),
	(3, 'barszcz', 'Barszcz', 10, 0, 1),
	(4, 'beer', 'Piwo', 10, 0, 1),
	(5, 'blackberry', 'Telefon', 5, 0, 1),
	(6, 'blindfold', 'Maska', 1, 0, 1),
	(7, 'blowpipe', 'Palnik', 1, 0, 1),
	(8, 'bolcacahuetes', 'Miska orzeszkow ziemnych', 5, 0, 1),
	(9, 'bolchips', 'Miska z frytkami', 5, 0, 1),
	(10, 'bolnoixcajou', 'Miska orzeszkow nerkowca', 5, 0, 1),
	(11, 'bolpistache', 'Miska orzeszkow pistacjowych', 5, 0, 1),
	(12, 'bread', 'Chleb', 10, 0, 1),
	(13, 'bulletproof', 'Kamizelka Kuloodporna', 1, 0, 1),
	(14, 'carokit', 'Zestaw do Auta', 10, 0, 1),
	(15, 'carotool', 'Narzedzia do Auta', 10, 0, 1),
	(16, 'chocolate', 'Czekolada', 10, 0, 1),
	(17, 'cigarett', 'Papieros', 10, 0, 1),
	(18, 'cisowianka', 'Cisowianka', 10, 0, 1),
	(19, 'clothe', 'Ubrania', 100, 0, 1),
	(20, 'cocacola', 'Coca-Cola', 10, 0, 1),
	(21, 'coke', 'Kokaina', 500, 0, 1),
	(22, 'coke_pooch', 'Gram Kokainy', 100, 0, 1),
	(23, 'copper', 'Miedz', 100, 0, 1),
	(24, 'craking', 'Zestaw Hackerski', 1, 0, 1),
	(25, 'croquettes', 'Krokiety', 10, 0, 1),
	(26, 'cupcake', 'Ciasteczko', 10, 0, 1),
	(27, 'cutted_wood', 'Deski', 100, 0, 1),
	(28, 'diamond', 'Diament', 100, 0, 1),
	(29, 'donut', 'Paczek', 10, 0, 1),
	(30, 'drill', 'Wiertarka Termiczna', 1, 0, 1),
	(31, 'drpepper', 'Dr. Pepper', 10, 0, 1),
	(32, 'energy', 'Energy Drink', 10, 0, 1),
	(33, 'essence', 'Esencja', 100, 0, 1),
	(34, 'fabric', 'Tkanina', 100, 0, 1),
	(35, 'fish', 'Ryba', 100, 0, 1),
	(36, 'fixkit', 'Czesci Naprawcze', 100, 0, 1),
	(37, 'fixtool', 'Zestaw Napraczy', 10, 0, 1),
	(38, 'gazbottle', 'Kanister', 1, 0, 1),
	(39, 'gold', 'Zloto', 100, 0, 1),
	(40, 'golem', 'Golem', 5, 0, 1),
	(41, 'gps', 'GPS', 1, 0, 1),
	(42, 'grand_cru', 'Butelka Wina', 100, 0, 1),
	(43, 'grapperaisin', 'Kisc winogron', 5, 0, 1),
	(44, 'hamburger', 'Hamburger', 10, 0, 1),
	(46, 'ice', 'Lod', 5, 0, 1),
	(47, 'icetea', 'Ice-Tea', 10, 0, 1),
	(48, 'iron', 'Zelazo', 100, 0, 1),
	(49, 'jager', 'Jägermeister', 5, 0, 1),
	(50, 'jagerbomb', 'Jägerbomb', 5, 0, 1),
	(51, 'jagercerbere', 'Jäger Cerbère', 5, 0, 1),
	(52, 'journal', 'Dokumenty', 5, 0, 1),
	(53, 'jumelles', 'Lornetka', 1, 0, 1),
	(54, 'jus_raisin', 'Sok Winogronowy', 100, 0, 1),
	(55, 'jusfruit', 'Sok owocowy', 5, 0, 1),
	(56, 'kebab', 'Kebab', 10, 0, 1),
	(57, 'key', 'Kluczyki do Kajdanek', 5, 0, 1),
	(58, 'lighter', 'Zapalniczka', 1, 0, 1),
	(59, 'limonade', 'Lemoniada', 5, 0, 1),
	(60, 'martini', 'Martini blanc', 5, 0, 1),
	(61, 'medikit', 'Apteczka', 10, 0, 1),
	(62, 'menthe', 'Lisc miety', 10, 0, 1),
	(63, 'meth', 'Metamfetamina', 500, 0, 1),
	(64, 'meth_pooch', 'Gram Metamfetaminy', 100, 0, 1),
	(65, 'metreshooter', 'Miernik strzelanki', 5, 0, 1),
	(66, 'milk', 'Mleko', 10, 0, 1),
	(67, 'mixapero', 'Aperitif mix', 5, 0, 1),
	(68, 'mojito', 'Mojito', 5, 0, 1),
	(69, 'opium', 'Opium', 50, 0, 1),
	(70, 'opium_pooch', 'Gram Opium', 10, 0, 1),
	(71, 'oxygen_mask', 'Maska do plywania', 2, 0, 1),
	(72, 'packaged_chicken', 'Kubelek Skrzydelek', 100, 0, 1),
	(73, 'packaged_plank', 'Zestaw Desek', 100, 0, 1),
	(74, 'petrol', 'Paliwo', 100, 0, 1),
	(75, 'petrol_raffin', 'Barylka Benzyny', 100, 0, 1),
	(76, 'picnic', 'Zestaw piknikowy', 1, 0, 1),
	(77, 'pizza', 'Pizza', 10, 0, 1),
	(78, 'raisin', 'Winogrono', 100, 0, 1),
	(79, 'redbull', 'RedBull', 10, 0, 1),
	(80, 'redgull', 'Tiger Energy', 5, 0, 1),
	(81, 'rhum', 'Rum', 5, 0, 1),
	(82, 'rhumcoca', 'Rum-coca', 5, 0, 1),
	(83, 'rhumfruit', 'Rum-Sok owocowy', 5, 0, 1),
	(84, 'rose', 'Czerwona Roza', 2, 0, 1),
	(85, 'sandwich', 'Kanapka', 10, 0, 1),
	(86, 'saucisson', 'Kielbasa', 5, 0, 1),
	(87, 'schabowy', 'Schabowy', 10, 0, 1),
	(88, 'slaughtered_chicken', 'Zabity Kurczak', 100, 0, 1),
	(89, 'soda', 'Soda', 5, 0, 1),
	(90, 'spaghetti', 'Spadzetii', 10, 0, 1),
	(91, 'stone', 'Kamien', 10, 0, 1),
	(92, 'teqpaf', 'Teq\'paf', 5, 0, 1),
	(93, 'tequila', 'Tequila', 10, 0, 1),
	(94, 'umbrella', 'Parasolka', 2, 0, 1),
	(95, 'vine', 'Wino', 100, 0, 1),
	(96, 'vodka', 'Wodka', 10, 0, 1),
	(97, 'vodkaenergy', 'Wodka-RedBull', 5, 0, 1),
	(98, 'vodkafruit', 'Wodka-Sok owocowy', 5, 0, 1),
	(99, 'washed_stone', 'Oszlifowany Kamien', 10, 0, 1),
	(100, 'water', 'Woda', 10, 0, 1),
	(101, 'weed', 'Ziolo', 500, 0, 1),
	(102, 'weed_pooch', 'Gram Ziola', 100, 0, 1),
	(103, 'whisky', 'Whisky', 10, 0, 1),
	(104, 'whiskycoca', 'Whisky-coca', 5, 0, 1),
	(105, 'whool', 'Welna', 100, 0, 1),
	(106, 'wine', 'Wino', 100, 0, 1),
	(107, 'wood', 'Drewno', 100, 0, 1),
	(108, 'wrap', 'Wrap', 10, 0, 1),
	(109, 'xanax', 'Xanax', 100, 0, 1),
	(110, 'black_chip', 'DeepWeb', 1, 0, 1),
	(111, 'poubelle', 'Smieci', 30, 0, 1),
	(112, 'solo_key', 'Solo Key', 1, 0, 1),
	(113, 'multi_key', 'Multi Key', 1, 0, 1),
	(114, 'clip', 'Clip', 2, 0, 1),
	(117, 'gym_membership', 'Gym Membership', -1, 0, 1),
	(118, 'powerade', 'Powerade', -1, 0, 1),
	(119, 'sportlunch', 'Sportlunch', -1, 0, 1),
	(120, 'protein_shake', 'Protein Shake', -1, 0, 1),
	(127, 'grip', 'Grip', -1, 0, 1),
	(128, 'flashlight', 'Flashlight', -1, 0, 1),
	(129, 'silent', 'Silencer', -1, 0, 1),
	(130, 'scope', 'Scope', -1, 0, 1),
	(131, 'advanced_scope', 'Advanced Scope', -1, 0, 1),
	(132, 'extended_magazine', 'Extended Magazine', -1, 0, 1),
	(133, 'very_extended_magazine', 'Very Extended Magazine', -1, 0, 1),
	(134, 'yusuf', 'Luxury Skin', -1, 0, 1),
	(135, 'lowrider', 'Lowrider Skin', -1, 0, 1),
	(136, 'darknet', 'Dark Net', 1, 0, 1),
	(137, 'goldmedal', 'Rallin kultamitali', -1, 0, 1),
	(138, 'silvermedal', 'Rallin hopeamitali', -1, 0, 1),
	(139, 'bronzemedal', 'Rallin pronssimitali', -1, 0, 1),
	(140, 'wool', 'Welna', 100, 0, 1),
	(141, 'meat', 'Mieso', 100, 0, 1),
	(142, 'leather', 'Skora', 100, 0, 1),
	(143, 'bait', 'Przyneta', 200, 0, 1),
	(144, 'fish', 'Ryba', 200, 0, 1),
	(145, 'fishingrod', 'Wedka', 1, 0, 1),
	(146, 'rope', 'Lina', 1, 0, 1),
	(147, 'handcuffs', 'Kajdanki', 1, 0, 1),
	(148, 'phone', 'Telefon', 1, 0, 1),
	(149, 'lockpick', 'Wytrych', 3, 0, 1),
	(150, 'scratchoff', 'Zdrapka', -1, 0, 1),
	(151, 'scratchoff_used', 'Zuzyta Zdrapka', -1, 0, 1),
	(152, 'anti', 'Antybiotyk', -1, 0, 1),
	(153, 'nitro', 'Nitro', -1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table server_3.item_weight
CREATE TABLE IF NOT EXISTS `item_weight` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.item_weight: ~55 rows (approximately)
/*!40000 ALTER TABLE `item_weight` DISABLE KEYS */;
INSERT INTO `item_weight` (`id`, `item`, `weight`) VALUES
	(1, 'gazbottle', 2000),
	(2, 'fixtool', 1500),
	(3, 'carotool', 1000),
	(4, 'blowpipe', 1200),
	(5, 'fixkit', 1500),
	(6, 'carokit', 1000),
	(7, 'bread', 125),
	(8, 'water', 500),
	(9, 'alive_chicken', 1000),
	(10, 'slaughtered_chicken', 800),
	(11, 'packaged_chicken', 600),
	(12, 'fish', 300),
	(13, 'stone', 500),
	(14, 'washed_stone', 450),
	(15, 'copper', 400),
	(16, 'iron', 450),
	(17, 'gold', 350),
	(18, 'diamond', 480),
	(19, 'wood', 1000),
	(20, 'cutted_wood', 750),
	(21, 'packaged_plank', 550),
	(22, 'petrol', 600),
	(23, 'petrol_raffin', 500),
	(24, 'essence', 250),
	(25, 'whool', 300),
	(26, 'clothe', 200),
	(27, 'fabric', 220),
	(28, 'weed', 800),
	(29, 'weed_pooch', 650),
	(30, 'coke', 600),
	(31, 'coke_pooch', 500),
	(32, 'meth', 600),
	(33, 'meth_pooch', 500),
	(34, 'opium', 600),
	(35, 'opium_pooch', 500),
	(36, 'permis', 500),
	(37, 'bandage', 250),
	(38, 'medikit', 500),
	(39, 'lsd', 600),
	(40, 'lsd_pooch', 500),
	(41, 'codeine', 250),
	(42, 'essence', 250),
	(43, 'disolvant', 250),
	(44, 'phosphorerouge', 250),
	(45, 'heroine', 250),
	(46, 'iode', 250),
	(47, 'kroko_pooch', 500),
	(48, 'silencieux', 1000),
	(49, 'flashlight', 1000),
	(50, 'grip', 1000),
	(51, 'yusuf', 500),
	(52, 'vine', 500),
	(53, 'wine', 500),
	(54, 'jus_raisin', 500),
	(55, 'raisin', 500);
/*!40000 ALTER TABLE `item_weight` ENABLE KEYS */;

-- Dumping structure for table server_3.jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `isjailed` tinyint(1) DEFAULT NULL,
  `J_Time` datetime NOT NULL,
  `J_Cell` varchar(20) NOT NULL,
  `Jailer` varchar(100) NOT NULL,
  `Jailer_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jail: ~2 rows (approximately)
/*!40000 ALTER TABLE `jail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jail` ENABLE KEYS */;

-- Dumping structure for table server_3.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.jobs: ~34 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('aircraftdealer', 'Sprzedawca Lotniczy', 1),
	('ambulance', 'EMS', 1),
	('avocat', 'Adwokat', 1),
	('banker', 'Bankier', 1),
	('biker', 'Biker', 1),
	('boatdealer', 'Sprzedawca Lodzi', 1),
	('cardealer', 'Sprzedawca Aut', 1),
	('cartel', 'Cartel', 1),
	('eboueur', 'Smieciarz', 0),
	('fisherman', 'OLD DONT USE', 1),
	('fueler', 'Rafineria', 0),
	('gang', 'Gang', 1),
	('gopostal', 'OLD DONT USE', 1),
	('journaliste', 'Reporter', 1),
	('lumberjack', 'Drwal', 0),
	('mafia', 'Mafia', 1),
	('mecano', 'Mechanik', 1),
	('miner', 'Gornik', 0),
	('motodealer', 'Sprzedawca Motocykli', 1),
	('offambulance', 'Medyk Poza Sluzba', 1),
	('offpolice', 'Policjant Poza Sluzba', 1),
	('parking', 'Parking Enforcement', 1),
	('police', 'LSPD', 1),
	('poste', 'Poczta', 0),
	('rally', 'Rajd', 0),
	('realestateagent', 'Agencja Nieruchomosci', 1),
	('reporter', 'OLD DONT USE', 1),
	('slaughterer', 'Rzeznik', 0),
	('state', 'Etat', 1),
	('tailor', 'Krawiec', 0),
	('taxi', 'Taksowkarz', 1),
	('trucker', 'Tirowiec', 0),
	('unemployed', 'Bezrobotny', 0),
	('unicorn', 'Unicorn', 1),
	('vigne', 'Winnica', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table server_3.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.job_grades: ~101 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Leniwiec', 50, '{}', '{}'),
	(2, 'ambulance', 0, 'ambulance', 'Stazysta', 400, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(3, 'ambulance', 1, 'doctor', 'Lekarz', 500, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(4, 'ambulance', 2, 'chief_doctor', 'Lekarz Chirurg', 600, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(5, 'ambulance', 3, 'boss', 'Ordynator', 700, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(6, 'banker', 0, 'advisor', 'Konsultant', 10, '{}', '{}'),
	(7, 'banker', 1, 'banker', 'Bankier', 20, '{}', '{}'),
	(8, 'banker', 2, 'business_banker', 'Bankier Firmowy', 30, '{}', '{}'),
	(9, 'banker', 3, 'trader', 'Sprzedawca', 40, '{}', '{}'),
	(10, 'banker', 4, 'boss', 'Szef', 300, '{}', '{}'),
	(11, 'lumberjack', 0, 'interim', 'Rebacz', 100, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(12, 'fisherman', 0, 'interim', 'Moczy Kij', 100, '{}', '{}'),
	(13, 'fueler', 0, 'interim', 'Pracownik', 100, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(14, 'reporter', 0, 'employee', 'Reporter', 100, '{}', '{}'),
	(15, 'tailor', 0, 'interim', 'Pracownik', 100, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(16, 'miner', 0, 'interim', 'Operator', 100, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(17, 'slaughterer', 0, 'interim', 'Morderca', 100, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(83, 'avocat', 0, 'boss', 'Prawnik', 500, '{}', '{}'),
	(84, 'mecano', 0, 'recrue', 'Praktykant', 200, '{}', '{}'),
	(85, 'mecano', 1, 'novice', 'Blacharz', 300, '{}', '{}'),
	(86, 'mecano', 2, 'experimente', 'Lakiernik', 350, '{}', '{}'),
	(87, 'mecano', 3, 'chief', 'Kierownik', 400, '{}', '{}'),
	(88, 'mecano', 4, 'boss', 'Szef', 500, '{}', '{}'),
	(89, 'motodealer', 0, 'recruit', 'Praktykant', 200, '{}', '{}'),
	(90, 'motodealer', 1, 'novice', 'Doswiadczony', 300, '{}', '{}'),
	(91, 'motodealer', 2, 'experienced', 'Kieronik', 400, '{}', '{}'),
	(92, 'motodealer', 3, 'boss', 'Szef', 1999, '{}', '{}'),
	(97, 'realestateagent', 0, 'location', 'Stazysta', 200, '{}', '{}'),
	(98, 'realestateagent', 1, 'vendeur', 'Agent', 300, '{}', '{}'),
	(99, 'realestateagent', 2, 'gestion', 'Zastepca Prezesa', 400, '{}', '{}'),
	(100, 'realestateagent', 3, 'boss', 'Prezes', 500, '{}', '{}'),
	(101, 'taxi', 0, 'recrue', 'Swiezak', 200, '{}', '{}'),
	(102, 'taxi', 1, 'novice', 'Zlotowa', 300, '{}', '{}'),
	(103, 'taxi', 2, 'experimente', 'Taryfa', 400, '{}', '{}'),
	(104, 'taxi', 3, 'uber', 'Doswiadczony', 500, '{}', '{}'),
	(105, 'taxi', 4, 'boss', 'Szef', 600, '{}', '{}'),
	(106, 'trucker', 0, 'employee', 'Kierowca', 100, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(115, 'unicorn', 0, 'barman', 'Barman', 200, '{}', '{}'),
	(116, 'unicorn', 1, 'dancer', 'Tancerz', 300, '{}', '{}'),
	(117, 'unicorn', 2, 'viceboss', 'Manager', 400, '{}', '{}'),
	(118, 'unicorn', 3, 'boss', 'Szef', 500, '{}', '{}'),
	(119, 'aircraftdealer', 0, 'recruit', 'Praktykant', 0, '{}', '{}'),
	(120, 'aircraftdealer', 1, 'novice', 'Doswiadczony', 0, '{}', '{}'),
	(121, 'aircraftdealer', 2, 'experienced', 'Kierownik', 0, '{}', '{}'),
	(122, 'aircraftdealer', 3, 'boss', 'Szef', 0, '{}', '{}'),
	(123, 'boatdealer', 0, 'recruit', 'Praktykant', 0, '{}', '{}'),
	(124, 'boatdealer', 1, 'novice', 'Doswiadczony', 0, '{}', '{}'),
	(125, 'boatdealer', 2, 'experienced', 'Kierownik', 0, '{}', '{}'),
	(126, 'boatdealer', 3, 'boss', 'Szef', 0, '{}', '{}'),
	(127, 'vigne', 0, 'recrue', 'Zbieracz', 100, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(128, 'vigne', 1, 'novice', 'Smakosz', 300, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(129, 'vigne', 2, 'cdisenior', 'Tester Wina', 500, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(130, 'vigne', 3, 'boss', 'Szef', 600, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(131, 'offpolice', 0, 'recruit', 'kadet', 100, '{}', '{}'),
	(132, 'offpolice', 1, 'officer', 'Oficier', 100, '{}', '{}'),
	(133, 'offpolice', 2, 'sergeant', 'Kapitan', 100, '{}', '{}'),
	(134, 'offpolice', 3, 'lieutenant', 'Porucznik', 100, '{}', '{}'),
	(135, 'offpolice', 4, 'chef', 'Kapitan', 100, '{}', '{}'),
	(136, 'offpolice', 5, 'boss', 'Komendant', 100, '{}', '{}'),
	(137, 'offambulance', 0, 'ambulance', 'Stazysta', 100, '{}', '{}'),
	(138, 'offambulance', 1, 'doctor', 'Lekarz', 100, '{}', '{}'),
	(139, 'offambulance', 2, 'chief_doctor', 'Chirurg', 100, '{}', '{}'),
	(140, 'offambulance', 3, 'boss', 'Ordynator', 100, '{}', '{}'),
	(141, 'gopostal', 0, 'employee', 'Dostawca', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(142, 'police', 0, 'recruit', 'Kadet', 400, '{}', '{}'),
	(143, 'police', 1, 'officer', 'Oficier', 500, '{}', '{}'),
	(144, 'police', 2, 'sergeant', 'Sierżant', 600, '{}', '{}'),
	(145, 'police', 3, 'lieutenant', 'Porucznik', 700, '{}', '{}'),
	(146, 'police', 4, 'chef', 'Kapitan', 800, '{}', '{}'),
	(147, 'police', 5, 'boss', 'Komendant', 900, '{}', '{}'),
	(148, 'eboueur', 0, 'interim', 'Pracownik', 100, '{}', '{}'),
	(149, 'journaliste', 0, 'stagiaire', 'Stazysta', 250, '{}', '{}'),
	(150, 'journaliste', 1, 'reporter', 'Reporter', 350, '{}', '{}'),
	(151, 'journaliste', 2, 'investigator', 'Glowny Redaktor', 400, '{}', '{}'),
	(152, 'journaliste', 3, 'boss', 'Szef', 450, '{}', '{}'),
	(153, 'poste', 0, 'interim', 'Listonosz', 600, '{"helmet_2":7,"pants_1":15,"shoes_2":12,"shoes":35,"ears_1":-1,"shoes_1":1,"torso_1":22,"helmet_1":63,"tshirt_1":15,"torso_2":1}', ''),
	(154, 'biker', 0, 'soldato', 'Prospect', 1500, '{}', '{}'),
	(155, 'biker', 1, 'capo', 'Road Capitan', 1800, '{}', '{}'),
	(156, 'biker', 2, 'consigliere', 'SGT at Arms', 2100, '{}', '{}'),
	(157, 'biker', 3, 'boss', 'President', 2700, '{}', '{}'),
	(158, 'cartel', 0, 'soldato', 'La Asociacion', 1500, '{}', '{}'),
	(159, 'cartel', 1, 'capo', 'Oficial', 1800, '{}', '{}'),
	(160, 'cartel', 2, 'consigliere', 'Narcotraficantes', 2100, '{}', '{}'),
	(161, 'cartel', 3, 'boss', 'Corredor', 2700, '{}', '{}'),
	(162, 'gang', 0, 'soldato', 'Soulja', 1500, '{}', '{}'),
	(163, 'gang', 1, 'capo', 'Thug', 1800, '{}', '{}'),
	(164, 'gang', 2, 'consigliere', 'Street Soldier', 2100, '{}', '{}'),
	(165, 'gang', 3, 'boss', 'O.G.', 2700, '{}', '{}'),
	(166, 'mafia', 0, 'soldato', 'Soldato', 1500, '{}', '{}'),
	(167, 'mafia', 1, 'capo', 'Caporegime', 1800, '{}', '{}'),
	(168, 'mafia', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(169, 'mafia', 3, 'boss', 'Don Mafiozo', 2700, '{}', '{}'),
	(170, 'rally', 0, 'employee', 'Kierowca', 1000, '{"shoes_1":55,"lipstick_4":0,"age_1":10,"beard_2":10,"decals_1":12,"decals_2":0,"beard_3":0,"lipstick_2":0,"mask_2":0,"hair_color_2":0,"eyebrows_4":2,"makeup_3":0,"beard_4":0,"makeup_2":0,"ears_1":11,"tshirt_1":15,"torso_1":148,"ears_2":1,"shoes_2":3,"lipstick_1":0,"helmet_1":72,"age_2":4,"sex":0,"beard_1":10,"skin":0,"hair_color_1":2,"glasses_2":1,"hair_1":21,"bags_1":0,"tshirt_2":0,"eyebrows_1":17,"bproof_1":0,"eyebrows_2":10,"glasses_1":15,"pants_1":66,"hair_2":1,"mask_1":0,"makeup_1":0,"torso_2":4,"bags_2":0,"face":31,"chain_2":0,"helmet_2":5,"pants_2":2,"arms":1,"chain_1":0,"bproof_2":0,"lipstick_3":0,"eyebrows_3":3,"makeup_4":0}', '{"shoes_1":55,"lipstick_4":0,"age_1":10,"beard_2":10,"decals_1":12,"decals_2":0,"beard_3":0,"lipstick_2":0,"mask_2":0,"hair_color_2":0,"eyebrows_4":2,"makeup_3":0,"beard_4":0,"makeup_2":0,"ears_1":11,"tshirt_1":15,"torso_1":148,"ears_2":1,"shoes_2":3,"lipstick_1":0,"helmet_1":72,"age_2":4,"sex":0,"beard_1":10,"skin":0,"hair_color_1":2,"glasses_2":1,"hair_1":21,"bags_1":0,"tshirt_2":0,"eyebrows_1":17,"bproof_1":0,"eyebrows_2":10,"glasses_1":15,"pants_1":66,"hair_2":1,"mask_1":0,"makeup_1":0,"torso_2":4,"bags_2":0,"face":31,"chain_2":0,"helmet_2":5,"pants_2":2,"arms":1,"chain_1":0,"bproof_2":0,"lipstick_3":0,"eyebrows_3":3,"makeup_4":0}'),
	(171, 'state', 0, 'vicepresident', 'Rzecznik Rzadu', 10000, '{}', '{}'),
	(172, 'state', 1, 'president', 'Szef Departamentu', 10000, '{}', '{}'),
	(173, 'state', 2, 'gouvernment', 'Vice-Prezydent', 10000, '{}', '{}'),
	(174, 'state', 3, 'boss', 'Prezydent', 10000, '{}', '{}'),
	(175, 'cardealer', 0, 'recruit', 'Praktykant', 10, '{}', '{}'),
	(176, 'cardealer', 1, 'novice', 'Doswiadczony', 25, '{}', '{}'),
	(177, 'cardealer', 2, 'experienced', 'Kierownik', 40, '{}', '{}'),
	(178, 'cardealer', 3, 'boss', 'Szef', 0, '{}', '{}'),
	(179, 'parking', 0, 'meter_maid', 'Meter Maid', 1500, '', ''),
	(180, 'parking', 1, 'parking_enforcement', 'Parking Enforcement', 2000, '', ''),
	(181, 'parking', 2, 'boss', 'CEO', 2500, '', '');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_atm
CREATE TABLE IF NOT EXISTS `jsfour_atm` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_atm: ~3 rows (approximately)
/*!40000 ALTER TABLE `jsfour_atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_atm` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_cardetails
CREATE TABLE IF NOT EXISTS `jsfour_cardetails` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `incident` varchar(255) NOT NULL DEFAULT '{}',
  `inspected` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_cardetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_cardetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_cardetails` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_criminalrecord
CREATE TABLE IF NOT EXISTS `jsfour_criminalrecord` (
  `offense` varchar(160) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT '0',
  `identifier` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `warden` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`offense`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_criminalrecord: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_criminalrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_criminalrecord` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_criminaluserinfo
CREATE TABLE IF NOT EXISTS `jsfour_criminaluserinfo` (
  `identifier` varchar(160) NOT NULL,
  `aliases` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyecolor` varchar(255) DEFAULT NULL,
  `haircolor` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_criminaluserinfo: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_criminaluserinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_criminaluserinfo` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_dna
CREATE TABLE IF NOT EXISTS `jsfour_dna` (
  `pk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `killer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `weapon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'murder',
  `lastdigits` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `uploader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `datum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_dna: ~2 rows (approximately)
/*!40000 ALTER TABLE `jsfour_dna` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_dna` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_efterlysningar
CREATE TABLE IF NOT EXISTS `jsfour_efterlysningar` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `wanted` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `crime` varchar(255) DEFAULT NULL,
  `uploader` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `incident` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_efterlysningar: ~1 rows (approximately)
/*!40000 ALTER TABLE `jsfour_efterlysningar` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_efterlysningar` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_incidents
CREATE TABLE IF NOT EXISTS `jsfour_incidents` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `uploader` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_incidents: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_incidents` ENABLE KEYS */;

-- Dumping structure for table server_3.jsfour_logs
CREATE TABLE IF NOT EXISTS `jsfour_logs` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `remover` varchar(255) DEFAULT NULL,
  `wanted` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.jsfour_logs: ~4 rows (approximately)
/*!40000 ALTER TABLE `jsfour_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_logs` ENABLE KEYS */;

-- Dumping structure for table server_3.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.licenses: ~5 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Test Teoretyczny'),
	('drive', 'Licencja na Auto'),
	('drive_bike', 'Licencja na Motor'),
	('drive_truck', 'Licencja na Tiry'),
	('weapon', 'Licencja na bron');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table server_3.mapblips
CREATE TABLE IF NOT EXISTS `mapblips` (
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accesstosee` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.mapblips: ~0 rows (approximately)
/*!40000 ALTER TABLE `mapblips` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapblips` ENABLE KEYS */;

-- Dumping structure for table server_3.motodealer_motos
CREATE TABLE IF NOT EXISTS `motodealer_motos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.motodealer_motos: ~0 rows (approximately)
/*!40000 ALTER TABLE `motodealer_motos` DISABLE KEYS */;
/*!40000 ALTER TABLE `motodealer_motos` ENABLE KEYS */;

-- Dumping structure for table server_3.motos
CREATE TABLE IF NOT EXISTS `motos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.motos: ~48 rows (approximately)
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` (`id`, `name`, `model`, `price`, `category`) VALUES
	(169, 'Akuma', 'AKUMA', 80000, 'motorcycles'),
	(170, 'Avarus', 'avarus', 50000, 'motorcycles'),
	(171, 'Bagger', 'bagger', 30000, 'motorcycles'),
	(173, 'Bati 801RR', 'bati2', 200000, 'motorcycles'),
	(176, 'Carbon RS', 'carbonrs', 120000, 'motorcycles'),
	(178, 'Cliffhanger', 'cliffhanger', 35000, 'motorcycles'),
	(180, 'Daemon', 'daemon', 50000, 'motorcycles'),
	(181, 'Daemon High', 'daemon2', 70000, 'motorcycles'),
	(182, 'Defiler', 'defiler', 130000, 'motorcycles'),
	(183, 'Double T', 'double', 170000, 'motorcycles'),
	(188, 'Fixter (velo)', 'fixter', 4000, 'motorcycles'),
	(191, 'Hakuchou Sport', 'hakuchou2', 190000, 'motorcycles'),
	(193, 'Innovation', 'innovation', 40000, 'motorcycles'),
	(198, 'Ruffian', 'ruffian', 70000, 'motorcycles'),
	(199, 'Sanchez', 'sanchez', 55000, 'motorcycles'),
	(200, 'Sanchez Sport', 'sanchez2', 60000, 'motorcycles'),
	(201, 'Sanctus', 'sanctus', 180000, 'motorcycles'),
	(204, 'Shotaro Concept', 'shotaro', 400000, 'motorcycles'),
	(208, 'Vortex', 'vortex', 140000, 'motorcycles'),
	(209, 'Woflsbane', 'wolfsbane', 55000, 'motorcycles'),
	(210, 'Zombie', 'zombiea', 80000, 'motorcycles'),
	(211, 'Zombie Luxuary', 'zombieb', 90000, 'motorcycles'),
	(383, 'Bati 801', 'bati', 100000, 'motorcycles'),
	(385, 'BF400', 'bf400', 30000, 'motorcycles'),
	(386, 'BMX (velo)', 'bmx', 5000, 'motorcycles'),
	(388, 'Chimera', 'chimera', 110000, 'motorcycles'),
	(390, 'Cruiser (velo)', 'cruiser', 2000, 'motorcycles'),
	(395, 'Enduro', 'enduro', 30000, 'motorcycles'),
	(396, 'Esskey', 'esskey', 35000, 'motorcycles'),
	(397, 'Faggio', 'faggio', 10000, 'motorcycles'),
	(398, 'Vespa', 'faggio2', 11000, 'motorcycles'),
	(400, 'Gargoyle', 'gargoyle', 40000, 'motorcycles'),
	(401, 'Hakuchou', 'hakuchou', 180000, 'motorcycles'),
	(403, 'Hexer', 'hexer', 35000, 'motorcycles'),
	(405, 'Manchez', 'manchez', 50000, 'motorcycles'),
	(406, 'Nemesis', 'nemesis', 60000, 'motorcycles'),
	(407, 'Nightblade', 'nightblade', 140000, 'motorcycles'),
	(408, 'PCJ-600', 'pcj', 40000, 'motorcycles'),
	(413, 'Scorcher (velo)', 'scorcher', 7500, 'motorcycles'),
	(414, 'Sovereign', 'sovereign', 65000, 'motorcycles'),
	(416, 'Thrust', 'thrust', 105000, 'motorcycles'),
	(417, 'Tri bike (velo)', 'tribike3', 9000, 'motorcycles'),
	(418, 'Vader', 'vader', 55000, 'motorcycles'),
	(419, 'Blazer', 'blazer', 15000, 'motorcycles'),
	(420, 'Blazer 3', 'blazer3', 15000, 'motorcycles'),
	(421, 'Blazer 4', 'blazer4', 15000, 'motorcycles');
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;

-- Dumping structure for table server_3.motos_categories
CREATE TABLE IF NOT EXISTS `motos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.motos_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `motos_categories` DISABLE KEYS */;
INSERT INTO `motos_categories` (`id`, `name`, `label`) VALUES
	(22, 'motorcycles', 'Motocykle');
/*!40000 ALTER TABLE `motos_categories` ENABLE KEYS */;

-- Dumping structure for table server_3.multi_race
CREATE TABLE IF NOT EXISTS `multi_race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `race` int(11) NOT NULL,
  `nb_laps` int(11) NOT NULL,
  `nb_pers` int(11) NOT NULL,
  `ended` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.multi_race: ~0 rows (approximately)
/*!40000 ALTER TABLE `multi_race` DISABLE KEYS */;
/*!40000 ALTER TABLE `multi_race` ENABLE KEYS */;

-- Dumping structure for table server_3.owned_aircrafts
CREATE TABLE IF NOT EXISTS `owned_aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the aircraft',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.owned_aircrafts: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_aircrafts` ENABLE KEYS */;

-- Dumping structure for table server_3.owned_boats
CREATE TABLE IF NOT EXISTS `owned_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the boat',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.owned_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_boats` ENABLE KEYS */;

-- Dumping structure for table server_3.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table server_3.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the car',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.owned_vehicles: ~4 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table server_3.peage_flash
CREATE TABLE IF NOT EXISTS `peage_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(10) NOT NULL,
  `speed` int(11) NOT NULL,
  `modele` varchar(25) NOT NULL,
  `station` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.peage_flash: 0 rows
/*!40000 ALTER TABLE `peage_flash` DISABLE KEYS */;
/*!40000 ALTER TABLE `peage_flash` ENABLE KEYS */;

-- Dumping structure for table server_3.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.phone_app_chat: ~8 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table server_3.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.phone_calls: ~32 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table server_3.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.phone_messages: 1 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table server_3.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.phone_users_contacts: 1 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table server_3.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.properties: ~72 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table server_3.qalle_brottsregister
CREATE TABLE IF NOT EXISTS `qalle_brottsregister` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `crime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.qalle_brottsregister: ~0 rows (approximately)
/*!40000 ALTER TABLE `qalle_brottsregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `qalle_brottsregister` ENABLE KEYS */;

-- Dumping structure for table server_3.rally_times
CREATE TABLE IF NOT EXISTS `rally_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` int(10) NOT NULL,
  `driver` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `laptime` bigint(20) DEFAULT '99999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.rally_times: ~2 rows (approximately)
/*!40000 ALTER TABLE `rally_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `rally_times` ENABLE KEYS */;

-- Dumping structure for table server_3.record_multi
CREATE TABLE IF NOT EXISTS `record_multi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `race` int(11) NOT NULL,
  `record` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `nb_laps` int(11) NOT NULL,
  `multi_race_id` int(11) NOT NULL,
  `ended` tinyint(1) NOT NULL,
  `record_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.record_multi: ~0 rows (approximately)
/*!40000 ALTER TABLE `record_multi` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_multi` ENABLE KEYS */;

-- Dumping structure for table server_3.rented_aircrafts
CREATE TABLE IF NOT EXISTS `rented_aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.rented_aircrafts: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_aircrafts` ENABLE KEYS */;

-- Dumping structure for table server_3.rented_boats
CREATE TABLE IF NOT EXISTS `rented_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.rented_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_boats` ENABLE KEYS */;

-- Dumping structure for table server_3.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table server_3.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.shops: ~65 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 30),
	(2, 'TwentyFourSeven', 'water', 30),
	(3, 'RobsLiquor', 'bread', 30),
	(4, 'RobsLiquor', 'water', 30),
	(5, 'LTDgasoline', 'bread', 30),
	(6, 'LTDgasoline', 'water', 30),
	(7, 'Bar', 'wine', 100),
	(8, 'Bar', 'beer', 80),
	(9, 'Bar', 'vodka', 100),
	(10, 'TwentyFourSeven', 'chocolate', 50),
	(11, 'RobsLiquor', 'chocolate', 50),
	(12, 'LTDgasoline', 'chocolate', 50),
	(13, 'TwentyFourSeven', 'sandwich', 40),
	(14, 'RobsLiquor', 'sandwich', 40),
	(15, 'LTDgasoline', 'sandwich', 40),
	(16, 'TwentyFourSeven', 'hamburger', 50),
	(17, 'RobsLiquor', 'hamburger', 50),
	(18, 'LTDgasoline', 'hamburger', 50),
	(19, 'Bar', 'tequila', 100),
	(20, 'Bar', 'whisky', 120),
	(21, 'TwentyFourSeven', 'cupcake', 40),
	(22, 'RobsLiquor', 'cupcake', 40),
	(23, 'LTDgasoline', 'cupcake', 40),
	(24, 'TwentyFourSeven', 'cocacola', 50),
	(25, 'RobsLiquor', 'cocacola', 50),
	(26, 'LTDgasoline', 'cocacola', 50),
	(27, 'TwentyFourSeven', 'icetea', 50),
	(28, 'RobsLiquor', 'icetea', 50),
	(29, 'LTDgasoline', 'icetea', 50),
	(30, 'TwentyFourSeven', 'redbull', 60),
	(31, 'RobsLiquor', 'redbull', 60),
	(32, 'LTDgasoline', 'redbull', 60),
	(33, 'TwentyFourSeven', 'milk', 35),
	(34, 'RobsLiquor', 'milk', 35),
	(35, 'LTDgasoline', 'milk', 35),
	(48, 'TwentyFourSeven', 'cigarett', 10),
	(49, 'RobsLiquor', 'cigarett', 10),
	(50, 'LTDgasoline', 'cigarett', 10),
	(51, 'TwentyFourSeven', 'lighter', 30),
	(52, 'RobsLiquor', 'lighter', 30),
	(53, 'LTDgasoline', 'lighter', 30),
	(54, 'Bar', 'cigarett', 15),
	(55, 'Bar', 'lighter', 50),
	(57, 'Narzedzia', 'gps', 500),
	(58, 'Narzedzia', 'blackberry', 500),
	(60, 'Narzedzia', 'fixkit', 4000),
	(61, 'Restauracja', 'wrap', 50),
	(62, 'Restauracja', 'schabowy', 40),
	(63, 'Restauracja', 'barszcz', 50),
	(64, 'Restauracja', 'kebab', 50),
	(65, 'Restauracja', 'pizza', 50),
	(66, 'Restauracja', 'spaghetti', 50),
	(67, 'Restauracja', 'cisowianka', 30),
	(68, 'Narzedzia', 'drill', 10000),
	(69, 'TwentyFourSeven', 'bandage', 500),
	(70, 'Narzedzia', 'blowpipe', 1000),
	(73, 'Narzedzia', 'jumelles', 1000),
	(76, 'LTDgasoline', 'donut', 45),
	(81, 'LTDgasoline', 'redgull', 50),
	(84, 'TwentyFourSeven', 'donut', 45),
	(89, 'TwentyFourSeven', 'redgull', 50),
	(92, 'RobsLiquor', 'donut', 45),
	(93, 'Narzedzia', 'oxygen_mask', 2000),
	(97, 'RobsLiquor', 'redgull', 50),
	(98, 'Narzedzia', 'black_chip', 10000),
	(99, 'Narzedzia', 'phone', 100),
	(100, 'TwentyFourSeven', 'scratchoff', 5),
	(101, 'Narzedzia', 'fishingrod', 100);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table server_3.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table server_3.solo_race
CREATE TABLE IF NOT EXISTS `solo_race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `record` int(11) NOT NULL,
  `race` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `record_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.solo_race: ~0 rows (approximately)
/*!40000 ALTER TABLE `solo_race` DISABLE KEYS */;
/*!40000 ALTER TABLE `solo_race` ENABLE KEYS */;

-- Dumping structure for table server_3.times
CREATE TABLE IF NOT EXISTS `times` (
  `identifier` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `Seconds` int(10) NOT NULL,
  `Minutes` int(10) NOT NULL,
  `Hours` int(10) NOT NULL,
  `Days` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.times: ~0 rows (approximately)
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
/*!40000 ALTER TABLE `times` ENABLE KEYS */;

-- Dumping structure for table server_3.treasure
CREATE TABLE IF NOT EXISTS `treasure` (
  `identifier` varchar(50) NOT NULL,
  `treasurename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.treasure: ~0 rows (approximately)
/*!40000 ALTER TABLE `treasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasure` ENABLE KEYS */;

-- Dumping structure for table server_3.truck_inventory
CREATE TABLE IF NOT EXISTS `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `itemt` varchar(50) DEFAULT NULL,
  `owned` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.truck_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `truck_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_inventory` ENABLE KEYS */;

-- Dumping structure for table server_3.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `animal` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `isDead` bit(1) DEFAULT b'0',
  `tattoos` varchar(255) COLLATE utf8mb4_bin DEFAULT '{}',
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `vote` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.users: ~9 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table server_3.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.user_accounts: ~7 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table server_3.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.user_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumping structure for table server_3.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.user_inventory: ~1,212 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(130, 'steam:11000010b4bff4f', 'cutted_wood', 0),
	(131, 'steam:11000010b4bff4f', 'protein_shake', 0),
	(132, 'steam:11000010b4bff4f', 'copper', 0),
	(133, 'steam:11000010b4bff4f', 'meth', 0),
	(134, 'steam:11000010b4bff4f', 'solo_key', 0),
	(135, 'steam:11000010b4bff4f', 'vodka', 0),
	(136, 'steam:11000010b4bff4f', 'rhum', 0),
	(137, 'steam:11000010b4bff4f', 'meth_pooch', 0),
	(138, 'steam:11000010b4bff4f', 'hamburger', 0),
	(139, 'steam:11000010b4bff4f', 'weed_pooch', 95),
	(140, 'steam:11000010b4bff4f', 'picnic', 1),
	(141, 'steam:11000010b4bff4f', 'blindfold', 0),
	(142, 'steam:11000010b4bff4f', 'key', 0),
	(143, 'steam:11000010b4bff4f', 'whisky', 0),
	(144, 'steam:11000010b4bff4f', 'blackberry', 3),
	(145, 'steam:11000010b4bff4f', 'stone', 0),
	(146, 'steam:11000010b4bff4f', 'iron', 0),
	(147, 'steam:11000010b4bff4f', 'clip', 0),
	(148, 'steam:11000010b4bff4f', 'slaughtered_chicken', 0),
	(149, 'steam:11000010b4bff4f', 'scope', 0),
	(150, 'steam:11000010b4bff4f', 'carotool', 0),
	(151, 'steam:11000010b4bff4f', 'water', 0),
	(152, 'steam:11000010b4bff4f', 'carokit', 0),
	(153, 'steam:11000010b4bff4f', 'black_chip', 0),
	(154, 'steam:11000010b4bff4f', 'croquettes', 0),
	(155, 'steam:11000010b4bff4f', 'donut', 0),
	(156, 'steam:11000010b4bff4f', 'fabric', 0),
	(157, 'steam:11000010b4bff4f', 'fixkit', 0),
	(158, 'steam:11000010b4bff4f', 'flashlight', 0),
	(159, 'steam:11000010b4bff4f', 'lighter', 0),
	(160, 'steam:11000010b4bff4f', 'umbrella', 1),
	(161, 'steam:11000010b4bff4f', 'rhumcoca', 0),
	(162, 'steam:11000010b4bff4f', 'whiskycoca', 0),
	(163, 'steam:11000010b4bff4f', 'wrap', 0),
	(164, 'steam:11000010b4bff4f', 'fixtool', 0),
	(165, 'steam:11000010b4bff4f', 'beer', 0),
	(166, 'steam:11000010b4bff4f', 'martini', 0),
	(167, 'steam:11000010b4bff4f', 'mixapero', 0),
	(168, 'steam:11000010b4bff4f', 'golem', 0),
	(169, 'steam:11000010b4bff4f', 'milk', 0),
	(170, 'steam:11000010b4bff4f', 'opium', 0),
	(171, 'steam:11000010b4bff4f', 'ice', 0),
	(172, 'steam:11000010b4bff4f', 'teqpaf', 0),
	(173, 'steam:11000010b4bff4f', 'blowpipe', 0),
	(174, 'steam:11000010b4bff4f', 'rose', 2),
	(175, 'steam:11000010b4bff4f', 'darknet', 0),
	(176, 'steam:11000010b4bff4f', 'drpepper', 0),
	(177, 'steam:11000010b4bff4f', 'journal', 0),
	(178, 'steam:11000010b4bff4f', 'jumelles', 0),
	(179, 'steam:11000010b4bff4f', 'rhumfruit', 0),
	(180, 'steam:11000010b4bff4f', 'yusuf', 0),
	(181, 'steam:11000010b4bff4f', 'gym_membership', 0),
	(182, 'steam:11000010b4bff4f', 'redbull', 0),
	(183, 'steam:11000010b4bff4f', 'weed', 0),
	(184, 'steam:11000010b4bff4f', 'grand_cru', 0),
	(185, 'steam:11000010b4bff4f', 'grapperaisin', 0),
	(186, 'steam:11000010b4bff4f', 'bolchips', 0),
	(187, 'steam:11000010b4bff4f', 'wood', 0),
	(188, 'steam:11000010b4bff4f', 'icetea', 0),
	(189, 'steam:11000010b4bff4f', 'whool', 0),
	(190, 'steam:11000010b4bff4f', 'fish', 0),
	(191, 'steam:11000010b4bff4f', 'rope', 0),
	(192, 'steam:11000010b4bff4f', 'coke', 0),
	(193, 'steam:11000010b4bff4f', 'diamond', 0),
	(194, 'steam:11000010b4bff4f', 'medikit', 0),
	(195, 'steam:11000010b4bff4f', 'sportlunch', 0),
	(196, 'steam:11000010b4bff4f', 'kebab', 0),
	(197, 'steam:11000010b4bff4f', 'cocacola', 0),
	(198, 'steam:11000010b4bff4f', 'cisowianka', 0),
	(199, 'steam:11000010b4bff4f', 'jagerbomb', 0),
	(200, 'steam:11000010b4bff4f', 'gold', 0),
	(201, 'steam:11000010b4bff4f', 'bolnoixcajou', 0),
	(202, 'steam:11000010b4bff4f', 'multi_key', 0),
	(203, 'steam:11000010b4bff4f', 'metreshooter', 0),
	(204, 'steam:11000010b4bff4f', 'jusfruit', 0),
	(205, 'steam:11000010b4bff4f', 'menthe', 0),
	(206, 'steam:11000010b4bff4f', 'mojito', 0),
	(207, 'steam:11000010b4bff4f', 'gps', 1),
	(208, 'steam:11000010b4bff4f', 'alive_chicken', 0),
	(209, 'steam:11000010b4bff4f', 'silent', 0),
	(210, 'steam:11000010b4bff4f', 'petrol', 0),
	(211, 'steam:11000010b4bff4f', 'pizza', 0),
	(212, 'steam:11000010b4bff4f', 'lowrider', 0),
	(213, 'steam:11000010b4bff4f', 'saucisson', 0),
	(214, 'steam:11000010b4bff4f', 'bolpistache', 0),
	(215, 'steam:11000010b4bff4f', 'very_extended_magazine', 0),
	(216, 'steam:11000010b4bff4f', 'packaged_chicken', 0),
	(217, 'steam:11000010b4bff4f', 'barszcz', 0),
	(218, 'steam:11000010b4bff4f', 'clothe', 0),
	(219, 'steam:11000010b4bff4f', 'cigarett', 0),
	(220, 'steam:11000010b4bff4f', 'schabowy', 0),
	(221, 'steam:11000010b4bff4f', 'poubelle', 1),
	(222, 'steam:11000010b4bff4f', 'petrol_raffin', 0),
	(223, 'steam:11000010b4bff4f', 'extended_magazine', 0),
	(224, 'steam:11000010b4bff4f', 'grip', 0),
	(225, 'steam:11000010b4bff4f', 'jager', 0),
	(226, 'steam:11000010b4bff4f', 'packaged_plank', 0),
	(227, 'steam:11000010b4bff4f', 'advanced_scope', 0),
	(228, 'steam:11000010b4bff4f', 'xanax', 0),
	(229, 'steam:11000010b4bff4f', 'bandage', 0),
	(230, 'steam:11000010b4bff4f', 'vine', 0),
	(231, 'steam:11000010b4bff4f', 'powerade', 0),
	(232, 'steam:11000010b4bff4f', 'wine', 0),
	(233, 'steam:11000010b4bff4f', 'redgull', 0),
	(234, 'steam:11000010b4bff4f', 'bread', 0),
	(235, 'steam:11000010b4bff4f', 'craking', 0),
	(236, 'steam:11000010b4bff4f', 'drill', 0),
	(237, 'steam:11000010b4bff4f', 'chocolate', 0),
	(238, 'steam:11000010b4bff4f', 'coke_pooch', 0),
	(239, 'steam:11000010b4bff4f', 'oxygen_mask', 0),
	(240, 'steam:11000010b4bff4f', 'gazbottle', 0),
	(241, 'steam:11000010b4bff4f', 'washed_stone', 0),
	(242, 'steam:11000010b4bff4f', 'jus_raisin', 0),
	(243, 'steam:11000010b4bff4f', 'vodkafruit', 0),
	(244, 'steam:11000010b4bff4f', 'bolcacahuetes', 0),
	(245, 'steam:11000010b4bff4f', 'bulletproof', 0),
	(246, 'steam:11000010b4bff4f', 'vodkaenergy', 0),
	(247, 'steam:11000010b4bff4f', 'handcuffs', 0),
	(248, 'steam:11000010b4bff4f', 'sandwich', 0),
	(249, 'steam:11000010b4bff4f', 'essence', 0),
	(250, 'steam:11000010b4bff4f', 'spaghetti', 0),
	(251, 'steam:11000010b4bff4f', 'raisin', 0),
	(252, 'steam:11000010b4bff4f', 'cupcake', 0),
	(253, 'steam:11000010b4bff4f', 'jagercerbere', 0),
	(254, 'steam:11000010b4bff4f', 'soda', 0),
	(255, 'steam:11000010b4bff4f', 'tequila', 0),
	(256, 'steam:11000010b4bff4f', 'limonade', 0),
	(257, 'steam:11000010b4bff4f', 'energy', 0),
	(258, 'steam:11000010b4bff4f', 'opium_pooch', 0),
	(259, 'steam:110000104f7eba5', 'blowpipe', 0),
	(260, 'steam:110000104f7eba5', 'packaged_chicken', 0),
	(261, 'steam:110000104f7eba5', 'sportlunch', 0),
	(262, 'steam:110000104f7eba5', 'saucisson', 0),
	(263, 'steam:110000104f7eba5', 'menthe', 0),
	(264, 'steam:110000104f7eba5', 'meth', 0),
	(265, 'steam:110000104f7eba5', 'whool', 0),
	(266, 'steam:110000104f7eba5', 'tequila', 0),
	(267, 'steam:110000104f7eba5', 'clip', 0),
	(268, 'steam:110000104f7eba5', 'very_extended_magazine', 0),
	(269, 'steam:110000104f7eba5', 'gym_membership', 0),
	(270, 'steam:110000104f7eba5', 'redbull', 0),
	(271, 'steam:110000104f7eba5', 'key', 0),
	(272, 'steam:110000104f7eba5', 'craking', 0),
	(273, 'steam:110000104f7eba5', 'blackberry', 0),
	(274, 'steam:110000104f7eba5', 'limonade', 0),
	(275, 'steam:110000104f7eba5', 'rhumfruit', 0),
	(276, 'steam:110000104f7eba5', 'powerade', 0),
	(277, 'steam:110000104f7eba5', 'gps', 0),
	(278, 'steam:110000104f7eba5', 'washed_stone', 0),
	(279, 'steam:110000104f7eba5', 'black_chip', 0),
	(280, 'steam:110000104f7eba5', 'carotool', 0),
	(281, 'steam:110000104f7eba5', 'spaghetti', 0),
	(282, 'steam:110000104f7eba5', 'hamburger', 0),
	(283, 'steam:110000104f7eba5', 'scope', 0),
	(284, 'steam:110000104f7eba5', 'extended_magazine', 0),
	(285, 'steam:110000104f7eba5', 'martini', 0),
	(286, 'steam:110000104f7eba5', 'fish', 0),
	(287, 'steam:110000104f7eba5', 'rhumcoca', 0),
	(288, 'steam:110000104f7eba5', 'grip', 0),
	(289, 'steam:110000104f7eba5', 'weed_pooch', 0),
	(290, 'steam:110000104f7eba5', 'oxygen_mask', 0),
	(291, 'steam:110000104f7eba5', 'petrol_raffin', 0),
	(292, 'steam:110000104f7eba5', 'golem', 0),
	(293, 'steam:110000104f7eba5', 'whisky', 0),
	(294, 'steam:110000104f7eba5', 'essence', 0),
	(295, 'steam:110000104f7eba5', 'solo_key', 0),
	(296, 'steam:110000104f7eba5', 'grapperaisin', 0),
	(297, 'steam:110000104f7eba5', 'croquettes', 0),
	(298, 'steam:110000104f7eba5', 'jus_raisin', 0),
	(299, 'steam:110000104f7eba5', 'cisowianka', 0),
	(300, 'steam:110000104f7eba5', 'multi_key', 0),
	(301, 'steam:110000104f7eba5', 'wrap', 0),
	(302, 'steam:110000104f7eba5', 'journal', 0),
	(303, 'steam:110000104f7eba5', 'grand_cru', 0),
	(304, 'steam:110000104f7eba5', 'beer', 0),
	(305, 'steam:110000104f7eba5', 'slaughtered_chicken', 0),
	(306, 'steam:110000104f7eba5', 'vodkaenergy', 0),
	(307, 'steam:110000104f7eba5', 'cutted_wood', 0),
	(308, 'steam:110000104f7eba5', 'iron', 0),
	(309, 'steam:110000104f7eba5', 'raisin', 0),
	(310, 'steam:110000104f7eba5', 'teqpaf', 0),
	(311, 'steam:110000104f7eba5', 'stone', 0),
	(312, 'steam:110000104f7eba5', 'soda', 0),
	(313, 'steam:110000104f7eba5', 'blindfold', 0),
	(314, 'steam:110000104f7eba5', 'milk', 0),
	(315, 'steam:110000104f7eba5', 'fixtool', 0),
	(316, 'steam:110000104f7eba5', 'handcuffs', 0),
	(317, 'steam:110000104f7eba5', 'rose', 0),
	(318, 'steam:110000104f7eba5', 'alive_chicken', 0),
	(319, 'steam:110000104f7eba5', 'icetea', 0),
	(320, 'steam:110000104f7eba5', 'donut', 0),
	(321, 'steam:110000104f7eba5', 'whiskycoca', 0),
	(322, 'steam:110000104f7eba5', 'sandwich', 0),
	(323, 'steam:110000104f7eba5', 'cigarett', 0),
	(324, 'steam:110000104f7eba5', 'clothe', 0),
	(325, 'steam:110000104f7eba5', 'energy', 0),
	(326, 'steam:110000104f7eba5', 'vine', 0),
	(327, 'steam:110000104f7eba5', 'darknet', 0),
	(328, 'steam:110000104f7eba5', 'metreshooter', 0),
	(329, 'steam:110000104f7eba5', 'medikit', 0),
	(330, 'steam:110000104f7eba5', 'coke_pooch', 0),
	(331, 'steam:110000104f7eba5', 'fabric', 0),
	(332, 'steam:110000104f7eba5', 'jager', 0),
	(333, 'steam:110000104f7eba5', 'weed', 0),
	(334, 'steam:110000104f7eba5', 'schabowy', 0),
	(335, 'steam:110000104f7eba5', 'packaged_plank', 0),
	(336, 'steam:110000104f7eba5', 'meth_pooch', 0),
	(337, 'steam:110000104f7eba5', 'fixkit', 0),
	(338, 'steam:110000104f7eba5', 'jusfruit', 0),
	(339, 'steam:110000104f7eba5', 'chocolate', 0),
	(340, 'steam:110000104f7eba5', 'barszcz', 0),
	(341, 'steam:110000104f7eba5', 'kebab', 0),
	(342, 'steam:110000104f7eba5', 'bolpistache', 0),
	(343, 'steam:110000104f7eba5', 'lowrider', 0),
	(344, 'steam:110000104f7eba5', 'picnic', 0),
	(345, 'steam:110000104f7eba5', 'petrol', 0),
	(346, 'steam:110000104f7eba5', 'bulletproof', 0),
	(347, 'steam:110000104f7eba5', 'lighter', 0),
	(348, 'steam:110000104f7eba5', 'coke', 0),
	(349, 'steam:110000104f7eba5', 'pizza', 0),
	(350, 'steam:110000104f7eba5', 'xanax', 0),
	(351, 'steam:110000104f7eba5', 'vodkafruit', 0),
	(352, 'steam:110000104f7eba5', 'jumelles', 0),
	(353, 'steam:110000104f7eba5', 'jagercerbere', 0),
	(354, 'steam:110000104f7eba5', 'mojito', 0),
	(355, 'steam:110000104f7eba5', 'silent', 0),
	(356, 'steam:110000104f7eba5', 'wood', 0),
	(357, 'steam:110000104f7eba5', 'redgull', 0),
	(358, 'steam:110000104f7eba5', 'flashlight', 0),
	(359, 'steam:110000104f7eba5', 'umbrella', 0),
	(360, 'steam:110000104f7eba5', 'ice', 0),
	(361, 'steam:110000104f7eba5', 'drill', 0),
	(362, 'steam:110000104f7eba5', 'bolnoixcajou', 0),
	(363, 'steam:110000104f7eba5', 'copper', 0),
	(364, 'steam:110000104f7eba5', 'rope', 0),
	(365, 'steam:110000104f7eba5', 'protein_shake', 0),
	(366, 'steam:110000104f7eba5', 'opium', 0),
	(367, 'steam:110000104f7eba5', 'poubelle', 0),
	(368, 'steam:110000104f7eba5', 'diamond', 0),
	(369, 'steam:110000104f7eba5', 'opium_pooch', 0),
	(370, 'steam:110000104f7eba5', 'bandage', 0),
	(371, 'steam:110000104f7eba5', 'bread', 0),
	(372, 'steam:110000104f7eba5', 'carokit', 0),
	(373, 'steam:110000104f7eba5', 'bolchips', 0),
	(374, 'steam:110000104f7eba5', 'wine', 0),
	(375, 'steam:110000104f7eba5', 'jagerbomb', 0),
	(376, 'steam:110000104f7eba5', 'water', 0),
	(377, 'steam:110000104f7eba5', 'cupcake', 0),
	(378, 'steam:110000104f7eba5', 'advanced_scope', 0),
	(379, 'steam:110000104f7eba5', 'mixapero', 0),
	(380, 'steam:110000104f7eba5', 'bolcacahuetes', 0),
	(381, 'steam:110000104f7eba5', 'vodka', 0),
	(382, 'steam:110000104f7eba5', 'cocacola', 0),
	(383, 'steam:110000104f7eba5', 'rhum', 0),
	(384, 'steam:110000104f7eba5', 'gold', 0),
	(385, 'steam:110000104f7eba5', 'gazbottle', 0),
	(386, 'steam:110000104f7eba5', 'yusuf', 0),
	(387, 'steam:110000104f7eba5', 'drpepper', 0),
	(388, 'steam:11000010ad702f5', 'sportlunch', 0),
	(389, 'steam:11000010ad702f5', 'packaged_chicken', 0),
	(390, 'steam:11000010ad702f5', 'blowpipe', 0),
	(391, 'steam:11000010ad702f5', 'saucisson', 0),
	(392, 'steam:11000010ad702f5', 'menthe', 0),
	(393, 'steam:11000010ad702f5', 'meth', 0),
	(394, 'steam:11000010ad702f5', 'clip', 0),
	(395, 'steam:11000010ad702f5', 'whool', 0),
	(396, 'steam:11000010ad702f5', 'very_extended_magazine', 0),
	(397, 'steam:11000010ad702f5', 'tequila', 0),
	(398, 'steam:11000010ad702f5', 'redbull', 0),
	(399, 'steam:11000010ad702f5', 'gym_membership', 0),
	(400, 'steam:11000010ad702f5', 'key', 0),
	(401, 'steam:11000010ad702f5', 'craking', 0),
	(402, 'steam:11000010ad702f5', 'blackberry', 0),
	(403, 'steam:11000010ad702f5', 'limonade', 0),
	(404, 'steam:11000010ad702f5', 'rhumfruit', 0),
	(405, 'steam:11000010ad702f5', 'gps', 0),
	(406, 'steam:11000010ad702f5', 'powerade', 0),
	(407, 'steam:11000010ad702f5', 'washed_stone', 0),
	(408, 'steam:11000010ad702f5', 'black_chip', 0),
	(409, 'steam:11000010ad702f5', 'carotool', 0),
	(410, 'steam:11000010ad702f5', 'hamburger', 0),
	(411, 'steam:11000010ad702f5', 'scope', 0),
	(412, 'steam:11000010ad702f5', 'martini', 0),
	(413, 'steam:11000010ad702f5', 'spaghetti', 0),
	(414, 'steam:11000010ad702f5', 'rhumcoca', 0),
	(415, 'steam:11000010ad702f5', 'extended_magazine', 0),
	(416, 'steam:11000010ad702f5', 'fish', 0),
	(417, 'steam:11000010ad702f5', 'grip', 0),
	(418, 'steam:11000010ad702f5', 'weed_pooch', 0),
	(419, 'steam:11000010ad702f5', 'oxygen_mask', 0),
	(420, 'steam:11000010ad702f5', 'petrol_raffin', 0),
	(421, 'steam:11000010ad702f5', 'whisky', 0),
	(422, 'steam:11000010ad702f5', 'grapperaisin', 0),
	(423, 'steam:11000010ad702f5', 'essence', 0),
	(424, 'steam:11000010ad702f5', 'golem', 0),
	(425, 'steam:11000010ad702f5', 'solo_key', 0),
	(426, 'steam:11000010ad702f5', 'jus_raisin', 0),
	(427, 'steam:11000010ad702f5', 'croquettes', 0),
	(428, 'steam:11000010ad702f5', 'cisowianka', 0),
	(429, 'steam:11000010ad702f5', 'multi_key', 0),
	(430, 'steam:11000010ad702f5', 'wrap', 0),
	(431, 'steam:11000010ad702f5', 'journal', 0),
	(432, 'steam:11000010ad702f5', 'beer', 0),
	(433, 'steam:11000010ad702f5', 'grand_cru', 0),
	(434, 'steam:11000010ad702f5', 'vodkaenergy', 0),
	(435, 'steam:11000010ad702f5', 'slaughtered_chicken', 0),
	(436, 'steam:11000010ad702f5', 'cutted_wood', 0),
	(437, 'steam:11000010ad702f5', 'iron', 0),
	(438, 'steam:11000010ad702f5', 'teqpaf', 0),
	(439, 'steam:11000010ad702f5', 'stone', 0),
	(440, 'steam:11000010ad702f5', 'raisin', 0),
	(441, 'steam:11000010ad702f5', 'blindfold', 0),
	(442, 'steam:11000010ad702f5', 'soda', 0),
	(443, 'steam:11000010ad702f5', 'milk', 0),
	(444, 'steam:11000010ad702f5', 'fixtool', 0),
	(445, 'steam:11000010ad702f5', 'alive_chicken', 0),
	(446, 'steam:11000010ad702f5', 'handcuffs', 0),
	(447, 'steam:11000010ad702f5', 'rose', 0),
	(448, 'steam:11000010ad702f5', 'donut', 0),
	(449, 'steam:11000010ad702f5', 'icetea', 0),
	(450, 'steam:11000010ad702f5', 'clothe', 0),
	(451, 'steam:11000010ad702f5', 'sandwich', 0),
	(452, 'steam:11000010ad702f5', 'whiskycoca', 0),
	(453, 'steam:11000010ad702f5', 'cigarett', 0),
	(454, 'steam:11000010ad702f5', 'energy', 0),
	(455, 'steam:11000010ad702f5', 'vine', 0),
	(456, 'steam:11000010ad702f5', 'darknet', 0),
	(457, 'steam:11000010ad702f5', 'metreshooter', 0),
	(458, 'steam:11000010ad702f5', 'medikit', 0),
	(459, 'steam:11000010ad702f5', 'coke_pooch', 0),
	(460, 'steam:11000010ad702f5', 'jager', 0),
	(461, 'steam:11000010ad702f5', 'schabowy', 0),
	(462, 'steam:11000010ad702f5', 'fabric', 0),
	(463, 'steam:11000010ad702f5', 'packaged_plank', 0),
	(464, 'steam:11000010ad702f5', 'weed', 0),
	(465, 'steam:11000010ad702f5', 'fixkit', 0),
	(466, 'steam:11000010ad702f5', 'jusfruit', 0),
	(467, 'steam:11000010ad702f5', 'chocolate', 0),
	(468, 'steam:11000010ad702f5', 'meth_pooch', 0),
	(469, 'steam:11000010ad702f5', 'bolpistache', 0),
	(470, 'steam:11000010ad702f5', 'lowrider', 0),
	(471, 'steam:11000010ad702f5', 'kebab', 0),
	(472, 'steam:11000010ad702f5', 'barszcz', 0),
	(473, 'steam:11000010ad702f5', 'petrol', 0),
	(474, 'steam:11000010ad702f5', 'xanax', 0),
	(475, 'steam:11000010ad702f5', 'lighter', 0),
	(476, 'steam:11000010ad702f5', 'picnic', 0),
	(477, 'steam:11000010ad702f5', 'bulletproof', 0),
	(478, 'steam:11000010ad702f5', 'coke', 0),
	(479, 'steam:11000010ad702f5', 'silent', 0),
	(480, 'steam:11000010ad702f5', 'pizza', 0),
	(481, 'steam:11000010ad702f5', 'vodkafruit', 0),
	(482, 'steam:11000010ad702f5', 'jagercerbere', 0),
	(483, 'steam:11000010ad702f5', 'mojito', 0),
	(484, 'steam:11000010ad702f5', 'ice', 0),
	(485, 'steam:11000010ad702f5', 'redgull', 0),
	(486, 'steam:11000010ad702f5', 'flashlight', 0),
	(487, 'steam:11000010ad702f5', 'jumelles', 0),
	(488, 'steam:11000010ad702f5', 'wood', 0),
	(489, 'steam:11000010ad702f5', 'bolnoixcajou', 0),
	(490, 'steam:11000010ad702f5', 'copper', 0),
	(491, 'steam:11000010ad702f5', 'umbrella', 0),
	(492, 'steam:11000010ad702f5', 'rope', 0),
	(493, 'steam:11000010ad702f5', 'drill', 0),
	(494, 'steam:11000010ad702f5', 'opium_pooch', 0),
	(495, 'steam:11000010ad702f5', 'protein_shake', 0),
	(496, 'steam:11000010ad702f5', 'poubelle', 0),
	(497, 'steam:11000010ad702f5', 'diamond', 0),
	(498, 'steam:11000010ad702f5', 'opium', 0),
	(499, 'steam:11000010ad702f5', 'bolchips', 0),
	(500, 'steam:11000010ad702f5', 'bread', 95),
	(501, 'steam:11000010ad702f5', 'carokit', 0),
	(502, 'steam:11000010ad702f5', 'bandage', 0),
	(503, 'steam:11000010ad702f5', 'wine', 0),
	(504, 'steam:11000010ad702f5', 'jagerbomb', 0),
	(505, 'steam:11000010ad702f5', 'mixapero', 0),
	(506, 'steam:11000010ad702f5', 'advanced_scope', 0),
	(507, 'steam:11000010ad702f5', 'cupcake', 0),
	(508, 'steam:11000010ad702f5', 'water', 95),
	(509, 'steam:11000010ad702f5', 'bolcacahuetes', 0),
	(510, 'steam:11000010ad702f5', 'vodka', 0),
	(511, 'steam:11000010ad702f5', 'cocacola', 0),
	(512, 'steam:11000010ad702f5', 'gazbottle', 0),
	(513, 'steam:11000010ad702f5', 'rhum', 0),
	(514, 'steam:11000010ad702f5', 'gold', 0),
	(515, 'steam:11000010ad702f5', 'yusuf', 0),
	(516, 'steam:11000010ad702f5', 'drpepper', 0),
	(517, 'steam:110000103ca4989', 'silvermedal', 0),
	(518, 'steam:110000103ca4989', 'bronzemedal', 0),
	(519, 'steam:110000103ca4989', 'goldmedal', 0),
	(520, 'steam:11000010b4bff4f', 'silvermedal', 0),
	(521, 'steam:11000010b4bff4f', 'bronzemedal', 0),
	(522, 'steam:11000010b4bff4f', 'goldmedal', 2),
	(523, 'steam:1100001055472e4', 'opium', 0),
	(524, 'steam:1100001055472e4', 'vodka', 0),
	(525, 'steam:1100001055472e4', 'rhumfruit', 0),
	(526, 'steam:1100001055472e4', 'vodkafruit', 0),
	(527, 'steam:1100001055472e4', 'weed', 0),
	(528, 'steam:1100001055472e4', 'bolchips', 0),
	(529, 'steam:1100001055472e4', 'jumelles', 0),
	(530, 'steam:1100001055472e4', 'scope', 0),
	(531, 'steam:1100001055472e4', 'jagercerbere', 0),
	(532, 'steam:1100001055472e4', 'stone', 0),
	(533, 'steam:1100001055472e4', 'pizza', 0),
	(534, 'steam:1100001055472e4', 'craking', 0),
	(535, 'steam:1100001055472e4', 'limonade', 0),
	(536, 'steam:1100001055472e4', 'clip', 0),
	(537, 'steam:1100001055472e4', 'petrol', 0),
	(538, 'steam:1100001055472e4', 'water', 5),
	(539, 'steam:1100001055472e4', 'blowpipe', 0),
	(540, 'steam:1100001055472e4', 'vodkaenergy', 0),
	(541, 'steam:1100001055472e4', 'cocacola', 0),
	(542, 'steam:1100001055472e4', 'sportlunch', 0),
	(543, 'steam:1100001055472e4', 'multi_key', 0),
	(544, 'steam:1100001055472e4', 'whisky', 0),
	(545, 'steam:1100001055472e4', 'coke', 0),
	(546, 'steam:1100001055472e4', 'flashlight', 0),
	(547, 'steam:1100001055472e4', 'protein_shake', 0),
	(548, 'steam:1100001055472e4', 'key', 0),
	(549, 'steam:1100001055472e4', 'cigarett', 0),
	(550, 'steam:1100001055472e4', 'schabowy', 0),
	(551, 'steam:1100001055472e4', 'solo_key', 0),
	(552, 'steam:1100001055472e4', 'carokit', 0),
	(553, 'steam:1100001055472e4', 'gold', 0),
	(554, 'steam:1100001055472e4', 'blackberry', 1),
	(555, 'steam:1100001055472e4', 'bread', 4),
	(556, 'steam:1100001055472e4', 'kebab', 0),
	(557, 'steam:1100001055472e4', 'petrol_raffin', 0),
	(558, 'steam:1100001055472e4', 'chocolate', 0),
	(559, 'steam:1100001055472e4', 'extended_magazine', 0),
	(560, 'steam:1100001055472e4', 'darknet', 0),
	(561, 'steam:1100001055472e4', 'bolpistache', 0),
	(562, 'steam:1100001055472e4', 'meth', 0),
	(563, 'steam:1100001055472e4', 'jagerbomb', 0),
	(564, 'steam:1100001055472e4', 'grip', 0),
	(565, 'steam:1100001055472e4', 'essence', 0),
	(566, 'steam:1100001055472e4', 'powerade', 0),
	(567, 'steam:1100001055472e4', 'advanced_scope', 0),
	(568, 'steam:1100001055472e4', 'mixapero', 0),
	(569, 'steam:1100001055472e4', 'teqpaf', 0),
	(570, 'steam:1100001055472e4', 'alive_chicken', 0),
	(571, 'steam:1100001055472e4', 'barszcz', 0),
	(572, 'steam:1100001055472e4', 'mojito', 0),
	(573, 'steam:1100001055472e4', 'redgull', 0),
	(574, 'steam:1100001055472e4', 'ice', 0),
	(575, 'steam:1100001055472e4', 'milk', 0),
	(576, 'steam:1100001055472e4', 'packaged_chicken', 0),
	(577, 'steam:1100001055472e4', 'journal', 0),
	(578, 'steam:1100001055472e4', 'umbrella', 0),
	(579, 'steam:1100001055472e4', 'energy', 0),
	(580, 'steam:1100001055472e4', 'meth_pooch', 0),
	(581, 'steam:1100001055472e4', 'grand_cru', 0),
	(582, 'steam:1100001055472e4', 'gazbottle', 0),
	(583, 'steam:1100001055472e4', 'bandage', 0),
	(584, 'steam:1100001055472e4', 'gps', 1),
	(585, 'steam:1100001055472e4', 'tequila', 0),
	(586, 'steam:1100001055472e4', 'fabric', 0),
	(587, 'steam:1100001055472e4', 'diamond', 0),
	(588, 'steam:1100001055472e4', 'redbull', 0),
	(589, 'steam:1100001055472e4', 'vine', 0),
	(590, 'steam:1100001055472e4', 'cutted_wood', 0),
	(591, 'steam:1100001055472e4', 'raisin', 0),
	(592, 'steam:1100001055472e4', 'blindfold', 0),
	(593, 'steam:1100001055472e4', 'poubelle', 0),
	(594, 'steam:1100001055472e4', 'menthe', 0),
	(595, 'steam:1100001055472e4', 'jus_raisin', 0),
	(596, 'steam:1100001055472e4', 'jager', 0),
	(597, 'steam:1100001055472e4', 'carotool', 0),
	(598, 'steam:1100001055472e4', 'martini', 0),
	(599, 'steam:1100001055472e4', 'black_chip', 0),
	(600, 'steam:1100001055472e4', 'clothe', 0),
	(601, 'steam:1100001055472e4', 'rose', 0),
	(602, 'steam:1100001055472e4', 'bronzemedal', 0),
	(603, 'steam:1100001055472e4', 'grapperaisin', 0),
	(604, 'steam:1100001055472e4', 'silvermedal', 0),
	(605, 'steam:1100001055472e4', 'lowrider', 0),
	(606, 'steam:1100001055472e4', 'goldmedal', 0),
	(607, 'steam:1100001055472e4', 'yusuf', 0),
	(608, 'steam:1100001055472e4', 'packaged_plank', 0),
	(609, 'steam:1100001055472e4', 'very_extended_magazine', 0),
	(610, 'steam:1100001055472e4', 'bulletproof', 0),
	(611, 'steam:1100001055472e4', 'beer', 0),
	(612, 'steam:1100001055472e4', 'cupcake', 0),
	(613, 'steam:1100001055472e4', 'silent', 0),
	(614, 'steam:1100001055472e4', 'wood', 0),
	(615, 'steam:1100001055472e4', 'lighter', 0),
	(616, 'steam:1100001055472e4', 'coke_pooch', 0),
	(617, 'steam:1100001055472e4', 'washed_stone', 0),
	(618, 'steam:1100001055472e4', 'medikit', 0),
	(619, 'steam:1100001055472e4', 'slaughtered_chicken', 0),
	(620, 'steam:1100001055472e4', 'bolnoixcajou', 0),
	(621, 'steam:1100001055472e4', 'rhumcoca', 0),
	(622, 'steam:1100001055472e4', 'fixtool', 0),
	(623, 'steam:1100001055472e4', 'spaghetti', 0),
	(624, 'steam:1100001055472e4', 'opium_pooch', 0),
	(625, 'steam:1100001055472e4', 'icetea', 0),
	(626, 'steam:1100001055472e4', 'picnic', 0),
	(627, 'steam:1100001055472e4', 'weed_pooch', 0),
	(628, 'steam:1100001055472e4', 'saucisson', 0),
	(629, 'steam:1100001055472e4', 'xanax', 0),
	(630, 'steam:1100001055472e4', 'croquettes', 0),
	(631, 'steam:1100001055472e4', 'wrap', 0),
	(632, 'steam:1100001055472e4', 'wine', 0),
	(633, 'steam:1100001055472e4', 'rope', 1),
	(634, 'steam:1100001055472e4', 'fixkit', 0),
	(635, 'steam:1100001055472e4', 'hamburger', 0),
	(636, 'steam:1100001055472e4', 'whool', 0),
	(637, 'steam:1100001055472e4', 'metreshooter', 0),
	(638, 'steam:1100001055472e4', 'whiskycoca', 0),
	(639, 'steam:1100001055472e4', 'sandwich', 0),
	(640, 'steam:1100001055472e4', 'soda', 0),
	(641, 'steam:1100001055472e4', 'copper', 0),
	(642, 'steam:1100001055472e4', 'drill', 0),
	(643, 'steam:1100001055472e4', 'handcuffs', 1),
	(644, 'steam:1100001055472e4', 'gym_membership', 0),
	(645, 'steam:1100001055472e4', 'rhum', 0),
	(646, 'steam:1100001055472e4', 'iron', 0),
	(647, 'steam:1100001055472e4', 'drpepper', 0),
	(648, 'steam:1100001055472e4', 'fish', 0),
	(649, 'steam:1100001055472e4', 'bolcacahuetes', 0),
	(650, 'steam:1100001055472e4', 'cisowianka', 0),
	(651, 'steam:1100001055472e4', 'oxygen_mask', 0),
	(652, 'steam:1100001055472e4', 'golem', 0),
	(653, 'steam:1100001055472e4', 'jusfruit', 0),
	(654, 'steam:1100001055472e4', 'donut', 0),
	(655, 'steam:11000010ad702f5', 'goldmedal', 0),
	(656, 'steam:11000010ad702f5', 'silvermedal', 0),
	(657, 'steam:11000010ad702f5', 'bronzemedal', 0),
	(658, 'steam:110000105174271', 'lowrider', 0),
	(659, 'steam:110000105174271', 'bolpistache', 0),
	(660, 'steam:110000105174271', 'jus_raisin', 0),
	(661, 'steam:110000105174271', 'croquettes', 0),
	(662, 'steam:110000105174271', 'water', 0),
	(663, 'steam:110000105174271', 'raisin', 0),
	(664, 'steam:110000105174271', 'jagercerbere', 0),
	(665, 'steam:110000105174271', 'umbrella', 0),
	(666, 'steam:110000105174271', 'black_chip', 0),
	(667, 'steam:110000105174271', 'bread', 0),
	(668, 'steam:110000105174271', 'chocolate', 0),
	(669, 'steam:110000105174271', 'gps', 0),
	(670, 'steam:110000105174271', 'oxygen_mask', 0),
	(671, 'steam:110000105174271', 'hamburger', 0),
	(672, 'steam:110000105174271', 'drill', 0),
	(673, 'steam:110000105174271', 'golem', 0),
	(674, 'steam:110000105174271', 'silent', 0),
	(675, 'steam:110000105174271', 'craking', 0),
	(676, 'steam:110000105174271', 'whool', 0),
	(677, 'steam:110000105174271', 'picnic', 0),
	(678, 'steam:110000105174271', 'redbull', 0),
	(679, 'steam:110000105174271', 'goldmedal', 0),
	(680, 'steam:110000105174271', 'wood', 0),
	(681, 'steam:110000105174271', 'lighter', 0),
	(682, 'steam:110000105174271', 'beer', 0),
	(683, 'steam:110000105174271', 'mojito', 0),
	(684, 'steam:110000105174271', 'pizza', 0),
	(685, 'steam:110000105174271', 'slaughtered_chicken', 0),
	(686, 'steam:110000105174271', 'whisky', 0),
	(687, 'steam:110000105174271', 'coke_pooch', 0),
	(688, 'steam:110000105174271', 'gazbottle', 0),
	(689, 'steam:110000105174271', 'jager', 0),
	(690, 'steam:110000105174271', 'martini', 0),
	(691, 'steam:110000105174271', 'grand_cru', 0),
	(692, 'steam:110000105174271', 'bolcacahuetes', 0),
	(693, 'steam:110000105174271', 'coke', 0),
	(694, 'steam:110000105174271', 'clothe', 0),
	(695, 'steam:110000105174271', 'fish', 0),
	(696, 'steam:110000105174271', 'kebab', 0),
	(697, 'steam:110000105174271', 'key', 0),
	(698, 'steam:110000105174271', 'copper', 0),
	(699, 'steam:110000105174271', 'poubelle', 0),
	(700, 'steam:110000105174271', 'cutted_wood', 0),
	(701, 'steam:110000105174271', 'iron', 0),
	(702, 'steam:110000105174271', 'bulletproof', 0),
	(703, 'steam:110000105174271', 'milk', 0),
	(704, 'steam:110000105174271', 'handcuffs', 0),
	(705, 'steam:110000105174271', 'xanax', 0),
	(706, 'steam:110000105174271', 'cocacola', 0),
	(707, 'steam:110000105174271', 'protein_shake', 0),
	(708, 'steam:110000105174271', 'cisowianka', 0),
	(709, 'steam:110000105174271', 'mixapero', 0),
	(710, 'steam:110000105174271', 'weed_pooch', 0),
	(711, 'steam:110000105174271', 'drpepper', 0),
	(712, 'steam:110000105174271', 'stone', 0),
	(713, 'steam:110000105174271', 'jusfruit', 0),
	(714, 'steam:110000105174271', 'packaged_plank', 0),
	(715, 'steam:110000105174271', 'scope', 0),
	(716, 'steam:110000105174271', 'carokit', 0),
	(717, 'steam:110000105174271', 'gold', 0),
	(718, 'steam:110000105174271', 'packaged_chicken', 0),
	(719, 'steam:110000105174271', 'energy', 0),
	(720, 'steam:110000105174271', 'diamond', 0),
	(721, 'steam:110000105174271', 'vine', 0),
	(722, 'steam:110000105174271', 'bolnoixcajou', 0),
	(723, 'steam:110000105174271', 'meth_pooch', 0),
	(724, 'steam:110000105174271', 'wine', 0),
	(725, 'steam:110000105174271', 'essence', 0),
	(726, 'steam:110000105174271', 'soda', 0),
	(727, 'steam:110000105174271', 'extended_magazine', 0),
	(728, 'steam:110000105174271', 'tequila', 0),
	(729, 'steam:110000105174271', 'menthe', 0),
	(730, 'steam:110000105174271', 'rose', 0),
	(731, 'steam:110000105174271', 'fabric', 0),
	(732, 'steam:110000105174271', 'gym_membership', 0),
	(733, 'steam:110000105174271', 'rhumcoca', 0),
	(734, 'steam:110000105174271', 'barszcz', 0),
	(735, 'steam:110000105174271', 'vodka', 0),
	(736, 'steam:110000105174271', 'petrol_raffin', 0),
	(737, 'steam:110000105174271', 'blowpipe', 0),
	(738, 'steam:110000105174271', 'blindfold', 0),
	(739, 'steam:110000105174271', 'saucisson', 0),
	(740, 'steam:110000105174271', 'bronzemedal', 0),
	(741, 'steam:110000105174271', 'silvermedal', 0),
	(742, 'steam:110000105174271', 'metreshooter', 0),
	(743, 'steam:110000105174271', 'rhum', 0),
	(744, 'steam:110000105174271', 'darknet', 0),
	(745, 'steam:110000105174271', 'yusuf', 0),
	(746, 'steam:110000105174271', 'very_extended_magazine', 0),
	(747, 'steam:110000105174271', 'icetea', 0),
	(748, 'steam:110000105174271', 'sandwich', 0),
	(749, 'steam:110000105174271', 'flashlight', 0),
	(750, 'steam:110000105174271', 'bolchips', 0),
	(751, 'steam:110000105174271', 'schabowy', 0),
	(752, 'steam:110000105174271', 'grip', 0),
	(753, 'steam:110000105174271', 'cigarett', 0),
	(754, 'steam:110000105174271', 'whiskycoca', 0),
	(755, 'steam:110000105174271', 'solo_key', 0),
	(756, 'steam:110000105174271', 'medikit', 0),
	(757, 'steam:110000105174271', 'advanced_scope', 0),
	(758, 'steam:110000105174271', 'sportlunch', 0),
	(759, 'steam:110000105174271', 'clip', 0),
	(760, 'steam:110000105174271', 'multi_key', 0),
	(761, 'steam:110000105174271', 'vodkaenergy', 0),
	(762, 'steam:110000105174271', 'bandage', 0),
	(763, 'steam:110000105174271', 'jagerbomb', 0),
	(764, 'steam:110000105174271', 'blackberry', 0),
	(765, 'steam:110000105174271', 'grapperaisin', 0),
	(766, 'steam:110000105174271', 'teqpaf', 0),
	(767, 'steam:110000105174271', 'washed_stone', 0),
	(768, 'steam:110000105174271', 'meth', 0),
	(769, 'steam:110000105174271', 'vodkafruit', 0),
	(770, 'steam:110000105174271', 'weed', 0),
	(771, 'steam:110000105174271', 'wrap', 0),
	(772, 'steam:110000105174271', 'powerade', 0),
	(773, 'steam:110000105174271', 'rope', 0),
	(774, 'steam:110000105174271', 'fixtool', 0),
	(775, 'steam:110000105174271', 'cupcake', 0),
	(776, 'steam:110000105174271', 'fixkit', 0),
	(777, 'steam:110000105174271', 'spaghetti', 0),
	(778, 'steam:110000105174271', 'journal', 0),
	(779, 'steam:110000105174271', 'ice', 0),
	(780, 'steam:110000105174271', 'rhumfruit', 0),
	(781, 'steam:110000105174271', 'opium_pooch', 0),
	(782, 'steam:110000105174271', 'redgull', 0),
	(783, 'steam:110000105174271', 'limonade', 0),
	(784, 'steam:110000105174271', 'jumelles', 0),
	(785, 'steam:110000105174271', 'alive_chicken', 0),
	(786, 'steam:110000105174271', 'carotool', 0),
	(787, 'steam:110000105174271', 'opium', 0),
	(788, 'steam:110000105174271', 'petrol', 0),
	(789, 'steam:110000105174271', 'donut', 0),
	(790, 'steam:1100001027aa23d', 'flashlight', 0),
	(791, 'steam:1100001027aa23d', 'whool', 0),
	(792, 'steam:1100001027aa23d', 'whiskycoca', 0),
	(793, 'steam:1100001027aa23d', 'kebab', 0),
	(794, 'steam:1100001027aa23d', 'jager', 0),
	(795, 'steam:1100001027aa23d', 'mixapero', 0),
	(796, 'steam:1100001027aa23d', 'packaged_plank', 0),
	(797, 'steam:1100001027aa23d', 'weed_pooch', 0),
	(798, 'steam:1100001027aa23d', 'drill', 0),
	(799, 'steam:1100001027aa23d', 'schabowy', 0),
	(800, 'steam:1100001027aa23d', 'rhum', 0),
	(801, 'steam:1100001027aa23d', 'poubelle', 0),
	(802, 'steam:1100001027aa23d', 'gold', 0),
	(803, 'steam:1100001027aa23d', 'chocolate', 0),
	(804, 'steam:1100001027aa23d', 'donut', 0),
	(805, 'steam:1100001027aa23d', 'redbull', 0),
	(806, 'steam:1100001027aa23d', 'vodkaenergy', 0),
	(807, 'steam:1100001027aa23d', 'rhumfruit', 0),
	(808, 'steam:1100001027aa23d', 'vodkafruit', 0),
	(809, 'steam:1100001027aa23d', 'opium', 0),
	(810, 'steam:1100001027aa23d', 'saucisson', 0),
	(811, 'steam:1100001027aa23d', 'silvermedal', 0),
	(812, 'steam:1100001027aa23d', 'jusfruit', 0),
	(813, 'steam:1100001027aa23d', 'protein_shake', 0),
	(814, 'steam:1100001027aa23d', 'martini', 0),
	(815, 'steam:1100001027aa23d', 'vodka', 0),
	(816, 'steam:1100001027aa23d', 'bulletproof', 0),
	(817, 'steam:1100001027aa23d', 'milk', 0),
	(818, 'steam:1100001027aa23d', 'bandage', 0),
	(819, 'steam:1100001027aa23d', 'vine', 0),
	(820, 'steam:1100001027aa23d', 'cocacola', 0),
	(821, 'steam:1100001027aa23d', 'icetea', 0),
	(822, 'steam:1100001027aa23d', 'gps', 0),
	(823, 'steam:1100001027aa23d', 'cutted_wood', 0),
	(824, 'steam:1100001027aa23d', 'spaghetti', 0),
	(825, 'steam:1100001027aa23d', 'carokit', 0),
	(826, 'steam:1100001027aa23d', 'alive_chicken', 0),
	(827, 'steam:1100001027aa23d', 'gazbottle', 0),
	(828, 'steam:1100001027aa23d', 'ice', 0),
	(829, 'steam:1100001027aa23d', 'drpepper', 0),
	(830, 'steam:1100001027aa23d', 'mojito', 0),
	(831, 'steam:1100001027aa23d', 'beer', 0),
	(832, 'steam:1100001027aa23d', 'craking', 0),
	(833, 'steam:1100001027aa23d', 'essence', 0),
	(834, 'steam:1100001027aa23d', 'teqpaf', 0),
	(835, 'steam:1100001027aa23d', 'coke', 0),
	(836, 'steam:1100001027aa23d', 'limonade', 0),
	(837, 'steam:1100001027aa23d', 'medikit', 0),
	(838, 'steam:1100001027aa23d', 'carotool', 0),
	(839, 'steam:1100001027aa23d', 'grapperaisin', 0),
	(840, 'steam:1100001027aa23d', 'wood', 0),
	(841, 'steam:1100001027aa23d', 'copper', 0),
	(842, 'steam:1100001027aa23d', 'grip', 0),
	(843, 'steam:1100001027aa23d', 'sandwich', 0),
	(844, 'steam:1100001027aa23d', 'scope', 0),
	(845, 'steam:1100001027aa23d', 'metreshooter', 0),
	(846, 'steam:1100001027aa23d', 'darknet', 0),
	(847, 'steam:1100001027aa23d', 'handcuffs', 0),
	(848, 'steam:1100001027aa23d', 'weed', 0),
	(849, 'steam:1100001027aa23d', 'rope', 0),
	(850, 'steam:1100001027aa23d', 'lighter', 0),
	(851, 'steam:1100001027aa23d', 'jagercerbere', 0),
	(852, 'steam:1100001027aa23d', 'gym_membership', 0),
	(853, 'steam:1100001027aa23d', 'washed_stone', 0),
	(854, 'steam:1100001027aa23d', 'wrap', 0),
	(855, 'steam:1100001027aa23d', 'cupcake', 0),
	(856, 'steam:1100001027aa23d', 'blowpipe', 0),
	(857, 'steam:1100001027aa23d', 'croquettes', 0),
	(858, 'steam:1100001027aa23d', 'diamond', 0),
	(859, 'steam:1100001027aa23d', 'key', 0),
	(860, 'steam:1100001027aa23d', 'solo_key', 0),
	(861, 'steam:1100001027aa23d', 'umbrella', 0),
	(862, 'steam:1100001027aa23d', 'raisin', 0),
	(863, 'steam:1100001027aa23d', 'soda', 0),
	(864, 'steam:1100001027aa23d', 'silent', 0),
	(865, 'steam:1100001027aa23d', 'bolpistache', 0),
	(866, 'steam:1100001027aa23d', 'petrol', 0),
	(867, 'steam:1100001027aa23d', 'advanced_scope', 0),
	(868, 'steam:1100001027aa23d', 'opium_pooch', 0),
	(869, 'steam:1100001027aa23d', 'bronzemedal', 0),
	(870, 'steam:1100001027aa23d', 'fish', 0),
	(871, 'steam:1100001027aa23d', 'rose', 0),
	(872, 'steam:1100001027aa23d', 'goldmedal', 0),
	(873, 'steam:1100001027aa23d', 'fixkit', 0),
	(874, 'steam:1100001027aa23d', 'meth_pooch', 0),
	(875, 'steam:1100001027aa23d', 'yusuf', 0),
	(876, 'steam:1100001027aa23d', 'very_extended_magazine', 0),
	(877, 'steam:1100001027aa23d', 'packaged_chicken', 0),
	(878, 'steam:1100001027aa23d', 'extended_magazine', 0),
	(879, 'steam:1100001027aa23d', 'whisky', 0),
	(880, 'steam:1100001027aa23d', 'grand_cru', 0),
	(881, 'steam:1100001027aa23d', 'tequila', 0),
	(882, 'steam:1100001027aa23d', 'iron', 0),
	(883, 'steam:1100001027aa23d', 'coke_pooch', 0),
	(884, 'steam:1100001027aa23d', 'sportlunch', 0),
	(885, 'steam:1100001027aa23d', 'powerade', 0),
	(886, 'steam:1100001027aa23d', 'xanax', 0),
	(887, 'steam:1100001027aa23d', 'clip', 0),
	(888, 'steam:1100001027aa23d', 'hamburger', 0),
	(889, 'steam:1100001027aa23d', 'multi_key', 0),
	(890, 'steam:1100001027aa23d', 'fabric', 0),
	(891, 'steam:1100001027aa23d', 'fixtool', 0),
	(892, 'steam:1100001027aa23d', 'journal', 0),
	(893, 'steam:1100001027aa23d', 'black_chip', 0),
	(894, 'steam:1100001027aa23d', 'redgull', 0),
	(895, 'steam:1100001027aa23d', 'bolnoixcajou', 0),
	(896, 'steam:1100001027aa23d', 'bolcacahuetes', 0),
	(897, 'steam:1100001027aa23d', 'stone', 0),
	(898, 'steam:1100001027aa23d', 'wine', 0),
	(899, 'steam:1100001027aa23d', 'blackberry', 0),
	(900, 'steam:1100001027aa23d', 'water', 1),
	(901, 'steam:1100001027aa23d', 'bread', 0),
	(902, 'steam:1100001027aa23d', 'jumelles', 0),
	(903, 'steam:1100001027aa23d', 'menthe', 0),
	(904, 'steam:1100001027aa23d', 'jus_raisin', 0),
	(905, 'steam:1100001027aa23d', 'picnic', 0),
	(906, 'steam:1100001027aa23d', 'cigarett', 0),
	(907, 'steam:1100001027aa23d', 'slaughtered_chicken', 0),
	(908, 'steam:1100001027aa23d', 'blindfold', 0),
	(909, 'steam:1100001027aa23d', 'lowrider', 0),
	(910, 'steam:1100001027aa23d', 'golem', 0),
	(911, 'steam:1100001027aa23d', 'jagerbomb', 0),
	(912, 'steam:1100001027aa23d', 'bolchips', 0),
	(913, 'steam:1100001027aa23d', 'clothe', 0),
	(914, 'steam:1100001027aa23d', 'rhumcoca', 0),
	(915, 'steam:1100001027aa23d', 'cisowianka', 0),
	(916, 'steam:1100001027aa23d', 'barszcz', 0),
	(917, 'steam:1100001027aa23d', 'meth', 0),
	(918, 'steam:1100001027aa23d', 'pizza', 0),
	(919, 'steam:1100001027aa23d', 'oxygen_mask', 0),
	(920, 'steam:1100001027aa23d', 'energy', 0),
	(921, 'steam:1100001027aa23d', 'petrol_raffin', 0),
	(922, 'steam:110000103ca4989', 'wool', 0),
	(923, 'steam:11000010b4bff4f', 'wool', 0),
	(928, 'steam:11000010b4bff4f', 'bait', 0),
	(929, 'steam:11000010b4bff4f', 'meat', 0),
	(930, 'steam:11000010b4bff4f', 'leather', 0),
	(931, 'steam:11000010b4bff4f', 'fishingrod', 0),
	(933, 'steam:110000103ca4989', 'hamburger', 0),
	(934, 'steam:110000103ca4989', 'raisin', 0),
	(935, 'steam:110000103ca4989', 'yusuf', 0),
	(936, 'steam:110000103ca4989', 'tequila', 0),
	(937, 'steam:110000103ca4989', 'slaughtered_chicken', 0),
	(938, 'steam:110000103ca4989', 'whool', 0),
	(939, 'steam:110000103ca4989', 'cigarett', 0),
	(940, 'steam:110000103ca4989', 'flashlight', 0),
	(941, 'steam:110000103ca4989', 'vodkafruit', 0),
	(942, 'steam:110000103ca4989', 'carotool', 0),
	(943, 'steam:110000103ca4989', 'fabric', 0),
	(944, 'steam:110000103ca4989', 'cocacola', 0),
	(945, 'steam:110000103ca4989', 'kebab', 0),
	(946, 'steam:110000103ca4989', 'carokit', 0),
	(947, 'steam:110000103ca4989', 'whiskycoca', 0),
	(948, 'steam:110000103ca4989', 'petrol', 0),
	(949, 'steam:110000103ca4989', 'stone', 0),
	(950, 'steam:110000103ca4989', 'golem', 0),
	(951, 'steam:110000103ca4989', 'jus_raisin', 0),
	(952, 'steam:110000103ca4989', 'rhumfruit', 0),
	(953, 'steam:110000103ca4989', 'soda', 0),
	(954, 'steam:110000103ca4989', 'protein_shake', 0),
	(955, 'steam:110000103ca4989', 'saucisson', 0),
	(956, 'steam:110000103ca4989', 'grapperaisin', 0),
	(957, 'steam:110000103ca4989', 'vine', 0),
	(958, 'steam:110000103ca4989', 'meth', 0),
	(959, 'steam:110000103ca4989', 'blowpipe', 0),
	(960, 'steam:110000103ca4989', 'alive_chicken', 0),
	(961, 'steam:110000103ca4989', 'weed', 0),
	(962, 'steam:110000103ca4989', 'picnic', 0),
	(963, 'steam:110000103ca4989', 'essence', 0),
	(964, 'steam:110000103ca4989', 'cisowianka', 0),
	(965, 'steam:110000103ca4989', 'gazbottle', 0),
	(966, 'steam:110000103ca4989', 'rhumcoca', 0),
	(967, 'steam:110000103ca4989', 'craking', 0),
	(968, 'steam:110000103ca4989', 'gps', 1),
	(969, 'steam:110000103ca4989', 'mojito', 0),
	(970, 'steam:110000103ca4989', 'cupcake', 0),
	(971, 'steam:110000103ca4989', 'black_chip', 0),
	(972, 'steam:110000103ca4989', 'extended_magazine', 0),
	(973, 'steam:110000103ca4989', 'jusfruit', 0),
	(974, 'steam:110000103ca4989', 'bulletproof', 0),
	(975, 'steam:110000103ca4989', 'metreshooter', 0),
	(976, 'steam:110000103ca4989', 'redbull', 0),
	(977, 'steam:110000103ca4989', 'clothe', 0),
	(978, 'steam:110000103ca4989', 'fish', 1),
	(979, 'steam:110000103ca4989', 'silent', 0),
	(980, 'steam:110000103ca4989', 'xanax', 0),
	(981, 'steam:110000103ca4989', 'chocolate', 0),
	(982, 'steam:110000103ca4989', 'gold', 0),
	(983, 'steam:110000103ca4989', 'wood', 0),
	(984, 'steam:110000103ca4989', 'bolcacahuetes', 0),
	(985, 'steam:110000103ca4989', 'coke', 0),
	(986, 'steam:110000103ca4989', 'bolnoixcajou', 0),
	(987, 'steam:110000103ca4989', 'fixkit', 0),
	(988, 'steam:110000103ca4989', 'petrol_raffin', 0),
	(989, 'steam:110000103ca4989', 'opium', 0),
	(990, 'steam:110000103ca4989', 'phone', 1),
	(991, 'steam:110000103ca4989', 'bolpistache', 0),
	(992, 'steam:110000103ca4989', 'packaged_chicken', 0),
	(993, 'steam:110000103ca4989', 'menthe', 0),
	(994, 'steam:110000103ca4989', 'bandage', 0),
	(995, 'steam:110000103ca4989', 'jager', 0),
	(996, 'steam:110000103ca4989', 'very_extended_magazine', 0),
	(997, 'steam:110000103ca4989', 'coke_pooch', 0),
	(998, 'steam:110000103ca4989', 'bolchips', 0),
	(999, 'steam:110000103ca4989', 'opium_pooch', 0),
	(1000, 'steam:110000103ca4989', 'darknet', 0),
	(1001, 'steam:110000103ca4989', 'fishingrod', 1),
	(1002, 'steam:110000103ca4989', 'bait', 9),
	(1003, 'steam:110000103ca4989', 'leather', 0),
	(1004, 'steam:110000103ca4989', 'pizza', 0),
	(1005, 'steam:110000103ca4989', 'sportlunch', 0),
	(1006, 'steam:110000103ca4989', 'handcuffs', 1),
	(1007, 'steam:110000103ca4989', 'washed_stone', 0),
	(1008, 'steam:110000103ca4989', 'meat', 0),
	(1009, 'steam:110000103ca4989', 'copper', 0),
	(1010, 'steam:110000103ca4989', 'blindfold', 0),
	(1011, 'steam:110000103ca4989', 'vodkaenergy', 0),
	(1012, 'steam:110000103ca4989', 'icetea', 0),
	(1013, 'steam:110000103ca4989', 'jagerbomb', 0),
	(1014, 'steam:110000103ca4989', 'lowrider', 0),
	(1015, 'steam:110000103ca4989', 'weed_pooch', 0),
	(1016, 'steam:110000103ca4989', 'umbrella', 0),
	(1017, 'steam:110000103ca4989', 'cutted_wood', 0),
	(1018, 'steam:110000103ca4989', 'medikit', 0),
	(1019, 'steam:110000103ca4989', 'iron', 0),
	(1020, 'steam:110000103ca4989', 'advanced_scope', 0),
	(1021, 'steam:110000103ca4989', 'journal', 0),
	(1022, 'steam:110000103ca4989', 'scope', 0),
	(1023, 'steam:110000103ca4989', 'redgull', 0),
	(1024, 'steam:110000103ca4989', 'packaged_plank', 0),
	(1025, 'steam:110000103ca4989', 'rope', 1),
	(1026, 'steam:110000103ca4989', 'energy', 0),
	(1027, 'steam:110000103ca4989', 'bread', 4),
	(1028, 'steam:110000103ca4989', 'teqpaf', 0),
	(1029, 'steam:110000103ca4989', 'beer', 0),
	(1030, 'steam:110000103ca4989', 'grip', 0),
	(1031, 'steam:110000103ca4989', 'ice', 0),
	(1032, 'steam:110000103ca4989', 'blackberry', 0),
	(1033, 'steam:110000103ca4989', 'key', 0),
	(1034, 'steam:110000103ca4989', 'powerade', 0),
	(1035, 'steam:110000103ca4989', 'meth_pooch', 0),
	(1036, 'steam:110000103ca4989', 'limonade', 0),
	(1037, 'steam:110000103ca4989', 'vodka', 0),
	(1038, 'steam:110000103ca4989', 'rhum', 0),
	(1039, 'steam:110000103ca4989', 'jagercerbere', 0),
	(1040, 'steam:110000103ca4989', 'lighter', 0),
	(1041, 'steam:110000103ca4989', 'gym_membership', 0),
	(1042, 'steam:110000103ca4989', 'drpepper', 0),
	(1043, 'steam:110000103ca4989', 'clip', 0),
	(1044, 'steam:110000103ca4989', 'spaghetti', 0),
	(1045, 'steam:110000103ca4989', 'barszcz', 0),
	(1046, 'steam:110000103ca4989', 'martini', 0),
	(1047, 'steam:110000103ca4989', 'multi_key', 0),
	(1048, 'steam:110000103ca4989', 'mixapero', 0),
	(1049, 'steam:110000103ca4989', 'sandwich', 0),
	(1050, 'steam:110000103ca4989', 'drill', 0),
	(1051, 'steam:110000103ca4989', 'solo_key', 0),
	(1052, 'steam:110000103ca4989', 'diamond', 0),
	(1053, 'steam:110000103ca4989', 'poubelle', 0),
	(1054, 'steam:110000103ca4989', 'wrap', 0),
	(1055, 'steam:110000103ca4989', 'rose', 0),
	(1056, 'steam:110000103ca4989', 'croquettes', 0),
	(1057, 'steam:110000103ca4989', 'wine', 0),
	(1058, 'steam:110000103ca4989', 'whisky', 0),
	(1059, 'steam:110000103ca4989', 'water', 3),
	(1060, 'steam:110000103ca4989', 'donut', 0),
	(1061, 'steam:110000103ca4989', 'oxygen_mask', 0),
	(1062, 'steam:110000103ca4989', 'jumelles', 0),
	(1063, 'steam:110000103ca4989', 'schabowy', 0),
	(1064, 'steam:110000103ca4989', 'grand_cru', 0),
	(1065, 'steam:110000103ca4989', 'fixtool', 0),
	(1066, 'steam:110000103ca4989', 'milk', 0),
	(1067, 'steam:1100001055472e4', 'fishingrod', 0),
	(1068, 'steam:1100001055472e4', 'meat', 1),
	(1069, 'steam:1100001055472e4', 'leather', 3),
	(1070, 'steam:1100001055472e4', 'bait', 0),
	(1071, 'steam:1100001055472e4', 'wool', 0),
	(1072, 'steam:1100001055472e4', 'phone', 1),
	(1073, 'steam:11000010b4bff4f', 'phone', 1),
	(1074, 'steam:110000103ca4989', 'lockpick', 0),
	(1075, 'steam:110000103ca4989', 'scratchoff', 0),
	(1076, 'steam:110000103ca4989', 'anti', 19),
	(1077, 'steam:110000103ca4989', 'scratchoff_used', 0),
	(1078, 'steam:11000010b4bff4f', 'scratchoff_used', 0),
	(1079, 'steam:11000010b4bff4f', 'anti', 0),
	(1080, 'steam:11000010b4bff4f', 'lockpick', 0),
	(1081, 'steam:11000010b4bff4f', 'scratchoff', 0),
	(1082, 'steam:11000010cf9ce06', 'schabowy', 0),
	(1083, 'steam:11000010cf9ce06', 'bulletproof', 0),
	(1084, 'steam:11000010cf9ce06', 'lowrider', 0),
	(1085, 'steam:11000010cf9ce06', 'washed_stone', 0),
	(1086, 'steam:11000010cf9ce06', 'vine', 0),
	(1087, 'steam:11000010cf9ce06', 'mixapero', 0),
	(1088, 'steam:11000010cf9ce06', 'iron', 0),
	(1089, 'steam:11000010cf9ce06', 'advanced_scope', 0),
	(1090, 'steam:11000010cf9ce06', 'sportlunch', 0),
	(1091, 'steam:11000010cf9ce06', 'poubelle', 0),
	(1092, 'steam:11000010cf9ce06', 'handcuffs', 0),
	(1093, 'steam:11000010cf9ce06', 'key', 0),
	(1094, 'steam:11000010cf9ce06', 'martini', 0),
	(1095, 'steam:11000010cf9ce06', 'clothe', 0),
	(1096, 'steam:11000010cf9ce06', 'drill', 0),
	(1097, 'steam:11000010cf9ce06', 'grapperaisin', 0),
	(1098, 'steam:11000010cf9ce06', 'petrol', 0),
	(1099, 'steam:11000010cf9ce06', 'lighter', 0),
	(1100, 'steam:11000010cf9ce06', 'redgull', 0),
	(1101, 'steam:11000010cf9ce06', 'weed_pooch', 0),
	(1102, 'steam:11000010cf9ce06', 'sandwich', 0),
	(1103, 'steam:11000010cf9ce06', 'lockpick', 0),
	(1104, 'steam:11000010cf9ce06', 'cocacola', 0),
	(1105, 'steam:11000010cf9ce06', 'multi_key', 0),
	(1106, 'steam:11000010cf9ce06', 'coke', 0),
	(1107, 'steam:11000010cf9ce06', 'cutted_wood', 0),
	(1108, 'steam:11000010cf9ce06', 'jagercerbere', 0),
	(1109, 'steam:11000010cf9ce06', 'oxygen_mask', 0),
	(1110, 'steam:11000010cf9ce06', 'scratchoff_used', 0),
	(1111, 'steam:11000010cf9ce06', 'rope', 0),
	(1112, 'steam:11000010cf9ce06', 'rose', 0),
	(1113, 'steam:11000010cf9ce06', 'opium', 0),
	(1114, 'steam:11000010cf9ce06', 'fixtool', 0),
	(1115, 'steam:11000010cf9ce06', 'wrap', 0),
	(1116, 'steam:11000010cf9ce06', 'very_extended_magazine', 0),
	(1117, 'steam:11000010cf9ce06', 'vodkafruit', 0),
	(1118, 'steam:11000010cf9ce06', 'anti', 0),
	(1119, 'steam:11000010cf9ce06', 'bandage', 0),
	(1120, 'steam:11000010cf9ce06', 'blindfold', 0),
	(1121, 'steam:11000010cf9ce06', 'fabric', 0),
	(1122, 'steam:11000010cf9ce06', 'raisin', 0),
	(1123, 'steam:11000010cf9ce06', 'soda', 0),
	(1124, 'steam:11000010cf9ce06', 'bolnoixcajou', 0),
	(1125, 'steam:11000010cf9ce06', 'protein_shake', 0),
	(1126, 'steam:11000010cf9ce06', 'bolpistache', 0),
	(1127, 'steam:11000010cf9ce06', 'whool', 0),
	(1128, 'steam:11000010cf9ce06', 'redbull', 0),
	(1129, 'steam:11000010cf9ce06', 'gazbottle', 0),
	(1130, 'steam:11000010cf9ce06', 'copper', 0),
	(1131, 'steam:11000010cf9ce06', 'grand_cru', 0),
	(1132, 'steam:11000010cf9ce06', 'bread', 0),
	(1133, 'steam:11000010cf9ce06', 'diamond', 0),
	(1134, 'steam:11000010cf9ce06', 'coke_pooch', 0),
	(1135, 'steam:11000010cf9ce06', 'gym_membership', 0),
	(1136, 'steam:11000010cf9ce06', 'silvermedal', 0),
	(1137, 'steam:11000010cf9ce06', 'yusuf', 0),
	(1138, 'steam:11000010cf9ce06', 'saucisson', 0),
	(1139, 'steam:11000010cf9ce06', 'black_chip', 0),
	(1140, 'steam:11000010cf9ce06', 'weed', 0),
	(1141, 'steam:11000010cf9ce06', 'stone', 0),
	(1142, 'steam:11000010cf9ce06', 'fishingrod', 0),
	(1143, 'steam:11000010cf9ce06', 'silent', 0),
	(1144, 'steam:11000010cf9ce06', 'donut', 0),
	(1145, 'steam:11000010cf9ce06', 'milk', 0),
	(1146, 'steam:11000010cf9ce06', 'mojito', 0),
	(1147, 'steam:11000010cf9ce06', 'packaged_plank', 0),
	(1148, 'steam:11000010cf9ce06', 'jagerbomb', 0),
	(1149, 'steam:11000010cf9ce06', 'rhumfruit', 0),
	(1150, 'steam:11000010cf9ce06', 'menthe', 0),
	(1151, 'steam:11000010cf9ce06', 'spaghetti', 0),
	(1152, 'steam:11000010cf9ce06', 'fixkit', 0),
	(1153, 'steam:11000010cf9ce06', 'picnic', 0),
	(1154, 'steam:11000010cf9ce06', 'meth_pooch', 0),
	(1155, 'steam:11000010cf9ce06', 'goldmedal', 0),
	(1156, 'steam:11000010cf9ce06', 'cigarett', 0),
	(1157, 'steam:11000010cf9ce06', 'bolcacahuetes', 0),
	(1158, 'steam:11000010cf9ce06', 'essence', 0),
	(1159, 'steam:11000010cf9ce06', 'opium_pooch', 0),
	(1160, 'steam:11000010cf9ce06', 'petrol_raffin', 0),
	(1161, 'steam:11000010cf9ce06', 'chocolate', 0),
	(1162, 'steam:11000010cf9ce06', 'powerade', 0),
	(1163, 'steam:11000010cf9ce06', 'tequila', 0),
	(1164, 'steam:11000010cf9ce06', 'ice', 0),
	(1165, 'steam:11000010cf9ce06', 'rhumcoca', 0),
	(1166, 'steam:11000010cf9ce06', 'jager', 0),
	(1167, 'steam:11000010cf9ce06', 'metreshooter', 0),
	(1168, 'steam:11000010cf9ce06', 'limonade', 0),
	(1169, 'steam:11000010cf9ce06', 'craking', 0),
	(1170, 'steam:11000010cf9ce06', 'scratchoff', 0),
	(1171, 'steam:11000010cf9ce06', 'phone', 0),
	(1172, 'steam:11000010cf9ce06', 'drpepper', 0),
	(1173, 'steam:11000010cf9ce06', 'bait', 0),
	(1174, 'steam:11000010cf9ce06', 'energy', 0),
	(1175, 'steam:11000010cf9ce06', 'leather', 0),
	(1176, 'steam:11000010cf9ce06', 'blackberry', 0),
	(1177, 'steam:11000010cf9ce06', 'grip', 0),
	(1178, 'steam:11000010cf9ce06', 'medikit', 0),
	(1179, 'steam:11000010cf9ce06', 'blowpipe', 0),
	(1180, 'steam:11000010cf9ce06', 'wool', 0),
	(1181, 'steam:11000010cf9ce06', 'wood', 0),
	(1182, 'steam:11000010cf9ce06', 'jus_raisin', 0),
	(1183, 'steam:11000010cf9ce06', 'croquettes', 0),
	(1184, 'steam:11000010cf9ce06', 'meth', 0),
	(1185, 'steam:11000010cf9ce06', 'clip', 0),
	(1186, 'steam:11000010cf9ce06', 'gps', 0),
	(1187, 'steam:11000010cf9ce06', 'xanax', 0),
	(1188, 'steam:11000010cf9ce06', 'vodka', 0),
	(1189, 'steam:11000010cf9ce06', 'cisowianka', 0),
	(1190, 'steam:11000010cf9ce06', 'extended_magazine', 0),
	(1191, 'steam:11000010cf9ce06', 'carokit', 0),
	(1192, 'steam:11000010cf9ce06', 'fish', 0),
	(1193, 'steam:11000010cf9ce06', 'alive_chicken', 0),
	(1194, 'steam:11000010cf9ce06', 'flashlight', 0),
	(1195, 'steam:11000010cf9ce06', 'pizza', 0),
	(1196, 'steam:11000010cf9ce06', 'meat', 0),
	(1197, 'steam:11000010cf9ce06', 'scope', 0),
	(1198, 'steam:11000010cf9ce06', 'jumelles', 0),
	(1199, 'steam:11000010cf9ce06', 'gold', 0),
	(1200, 'steam:11000010cf9ce06', 'journal', 0),
	(1201, 'steam:11000010cf9ce06', 'solo_key', 0),
	(1202, 'steam:11000010cf9ce06', 'jusfruit', 0),
	(1203, 'steam:11000010cf9ce06', 'bronzemedal', 0),
	(1204, 'steam:11000010cf9ce06', 'hamburger', 0),
	(1205, 'steam:11000010cf9ce06', 'wine', 0),
	(1206, 'steam:11000010cf9ce06', 'whiskycoca', 0),
	(1207, 'steam:11000010cf9ce06', 'whisky', 0),
	(1208, 'steam:11000010cf9ce06', 'slaughtered_chicken', 0),
	(1209, 'steam:11000010cf9ce06', 'beer', 0),
	(1210, 'steam:11000010cf9ce06', 'barszcz', 0),
	(1211, 'steam:11000010cf9ce06', 'kebab', 0),
	(1212, 'steam:11000010cf9ce06', 'teqpaf', 0),
	(1213, 'steam:11000010cf9ce06', 'darknet', 0),
	(1214, 'steam:11000010cf9ce06', 'cupcake', 0),
	(1215, 'steam:11000010cf9ce06', 'vodkaenergy', 0),
	(1216, 'steam:11000010cf9ce06', 'rhum', 0),
	(1217, 'steam:11000010cf9ce06', 'umbrella', 0),
	(1218, 'steam:11000010cf9ce06', 'packaged_chicken', 0),
	(1219, 'steam:11000010cf9ce06', 'bolchips', 0),
	(1220, 'steam:11000010cf9ce06', 'icetea', 0),
	(1221, 'steam:11000010cf9ce06', 'golem', 0),
	(1222, 'steam:11000010cf9ce06', 'carotool', 0),
	(1223, 'steam:11000010cf9ce06', 'water', 0),
	(1224, 'steam:1100001055472e4', 'lockpick', 0),
	(1225, 'steam:1100001055472e4', 'scratchoff_used', 0),
	(1226, 'steam:1100001055472e4', 'scratchoff', 0),
	(1227, 'steam:1100001055472e4', 'anti', 0),
	(1228, 'steam:110000103ca4989', 'nitro', 0),
	(1229, 'steam:11000010b4bff4f', 'nitro', 0),
	(1230, 'steam:11000010478bf15', 'essence', 0),
	(1231, 'steam:11000010478bf15', 'anti', 0),
	(1232, 'steam:11000010478bf15', 'saucisson', 0),
	(1233, 'steam:11000010478bf15', 'vodka', 0),
	(1234, 'steam:11000010478bf15', 'craking', 0),
	(1235, 'steam:11000010478bf15', 'bolcacahuetes', 0),
	(1236, 'steam:11000010478bf15', 'pizza', 0),
	(1237, 'steam:11000010478bf15', 'whiskycoca', 0),
	(1238, 'steam:11000010478bf15', 'leather', 0),
	(1239, 'steam:11000010478bf15', 'redbull', 0),
	(1240, 'steam:11000010478bf15', 'blindfold', 0),
	(1241, 'steam:11000010478bf15', 'limonade', 0),
	(1242, 'steam:11000010478bf15', 'picnic', 0),
	(1243, 'steam:11000010478bf15', 'iron', 0),
	(1244, 'steam:11000010478bf15', 'petrol_raffin', 0),
	(1245, 'steam:11000010478bf15', 'medikit', 0),
	(1246, 'steam:11000010478bf15', 'schabowy', 0),
	(1247, 'steam:11000010478bf15', 'vine', 0),
	(1248, 'steam:11000010478bf15', 'wood', 0),
	(1249, 'steam:11000010478bf15', 'coke', 0),
	(1250, 'steam:11000010478bf15', 'martini', 0),
	(1251, 'steam:11000010478bf15', 'powerade', 0),
	(1252, 'steam:11000010478bf15', 'donut', 0),
	(1253, 'steam:11000010478bf15', 'wine', 0),
	(1254, 'steam:11000010478bf15', 'menthe', 0),
	(1255, 'steam:11000010478bf15', 'rope', 0),
	(1256, 'steam:11000010478bf15', 'milk', 0),
	(1257, 'steam:11000010478bf15', 'fabric', 0),
	(1258, 'steam:11000010478bf15', 'jagerbomb', 0),
	(1259, 'steam:11000010478bf15', 'clothe', 0),
	(1260, 'steam:11000010478bf15', 'gold', 0),
	(1261, 'steam:11000010478bf15', 'silvermedal', 0),
	(1262, 'steam:11000010478bf15', 'bolchips', 0),
	(1263, 'steam:11000010478bf15', 'lockpick', 0),
	(1264, 'steam:11000010478bf15', 'cigarett', 0),
	(1265, 'steam:11000010478bf15', 'opium_pooch', 0),
	(1266, 'steam:11000010478bf15', 'sandwich', 0),
	(1267, 'steam:11000010478bf15', 'copper', 0),
	(1268, 'steam:11000010478bf15', 'croquettes', 0),
	(1269, 'steam:11000010478bf15', 'fixkit', 0),
	(1270, 'steam:11000010478bf15', 'slaughtered_chicken', 0),
	(1271, 'steam:11000010478bf15', 'chocolate', 0),
	(1272, 'steam:11000010478bf15', 'bolpistache', 0),
	(1273, 'steam:11000010478bf15', 'whool', 0),
	(1274, 'steam:11000010478bf15', 'gym_membership', 0),
	(1275, 'steam:11000010478bf15', 'cutted_wood', 0),
	(1276, 'steam:11000010478bf15', 'grip', 0),
	(1277, 'steam:11000010478bf15', 'lowrider', 0),
	(1278, 'steam:11000010478bf15', 'jusfruit', 0),
	(1279, 'steam:11000010478bf15', 'bulletproof', 0),
	(1280, 'steam:11000010478bf15', 'gazbottle', 0),
	(1281, 'steam:11000010478bf15', 'coke_pooch', 0),
	(1282, 'steam:11000010478bf15', 'mojito', 0),
	(1283, 'steam:11000010478bf15', 'redgull', 0),
	(1284, 'steam:11000010478bf15', 'weed_pooch', 0),
	(1285, 'steam:11000010478bf15', 'hamburger', 0),
	(1286, 'steam:11000010478bf15', 'spaghetti', 0),
	(1287, 'steam:11000010478bf15', 'umbrella', 0),
	(1288, 'steam:11000010478bf15', 'petrol', 0),
	(1289, 'steam:11000010478bf15', 'yusuf', 0),
	(1290, 'steam:11000010478bf15', 'raisin', 0),
	(1291, 'steam:11000010478bf15', 'carotool', 0),
	(1292, 'steam:11000010478bf15', 'teqpaf', 0),
	(1293, 'steam:11000010478bf15', 'washed_stone', 0),
	(1294, 'steam:11000010478bf15', 'silent', 0),
	(1295, 'steam:11000010478bf15', 'key', 0),
	(1296, 'steam:11000010478bf15', 'scope', 0),
	(1297, 'steam:11000010478bf15', 'handcuffs', 0),
	(1298, 'steam:11000010478bf15', 'fish', 1),
	(1299, 'steam:11000010478bf15', 'meth', 0),
	(1300, 'steam:11000010478bf15', 'wrap', 0),
	(1301, 'steam:11000010478bf15', 'alive_chicken', 0),
	(1302, 'steam:11000010478bf15', 'carokit', 0),
	(1303, 'steam:11000010478bf15', 'multi_key', 0),
	(1304, 'steam:11000010478bf15', 'blackberry', 0),
	(1305, 'steam:11000010478bf15', 'cisowianka', 0),
	(1306, 'steam:11000010478bf15', 'packaged_chicken', 0),
	(1307, 'steam:11000010478bf15', 'poubelle', 0),
	(1308, 'steam:11000010478bf15', 'energy', 0),
	(1309, 'steam:11000010478bf15', 'scratchoff', 0),
	(1310, 'steam:11000010478bf15', 'metreshooter', 0),
	(1311, 'steam:11000010478bf15', 'jumelles', 0),
	(1312, 'steam:11000010478bf15', 'jagercerbere', 0),
	(1313, 'steam:11000010478bf15', 'nitro', 0),
	(1314, 'steam:11000010478bf15', 'blowpipe', 0),
	(1315, 'steam:11000010478bf15', 'scratchoff_used', 0),
	(1316, 'steam:11000010478bf15', 'bandage', 0),
	(1317, 'steam:11000010478bf15', 'opium', 0),
	(1318, 'steam:11000010478bf15', 'phone', 1),
	(1319, 'steam:11000010478bf15', 'jager', 0),
	(1320, 'steam:11000010478bf15', 'fishingrod', 1),
	(1321, 'steam:11000010478bf15', 'rhum', 0),
	(1322, 'steam:11000010478bf15', 'rhumfruit', 0),
	(1323, 'steam:11000010478bf15', 'bait', 7),
	(1324, 'steam:11000010478bf15', 'goldmedal', 0),
	(1325, 'steam:11000010478bf15', 'weed', 0),
	(1326, 'steam:11000010478bf15', 'wool', 0),
	(1327, 'steam:11000010478bf15', 'grapperaisin', 0),
	(1328, 'steam:11000010478bf15', 'ice', 0),
	(1329, 'steam:11000010478bf15', 'rose', 0),
	(1330, 'steam:11000010478bf15', 'beer', 0),
	(1331, 'steam:11000010478bf15', 'jus_raisin', 0),
	(1332, 'steam:11000010478bf15', 'meat', 0),
	(1333, 'steam:11000010478bf15', 'clip', 0),
	(1334, 'steam:11000010478bf15', 'drill', 0),
	(1335, 'steam:11000010478bf15', 'diamond', 0),
	(1336, 'steam:11000010478bf15', 'kebab', 0),
	(1337, 'steam:11000010478bf15', 'drpepper', 0),
	(1338, 'steam:11000010478bf15', 'golem', 0),
	(1339, 'steam:11000010478bf15', 'very_extended_magazine', 0),
	(1340, 'steam:11000010478bf15', 'meth_pooch', 0),
	(1341, 'steam:11000010478bf15', 'rhumcoca', 0),
	(1342, 'steam:11000010478bf15', 'packaged_plank', 0),
	(1343, 'steam:11000010478bf15', 'advanced_scope', 0),
	(1344, 'steam:11000010478bf15', 'lighter', 0),
	(1345, 'steam:11000010478bf15', 'flashlight', 0),
	(1346, 'steam:11000010478bf15', 'bread', 0),
	(1347, 'steam:11000010478bf15', 'journal', 0),
	(1348, 'steam:11000010478bf15', 'tequila', 0),
	(1349, 'steam:11000010478bf15', 'sportlunch', 0),
	(1350, 'steam:11000010478bf15', 'oxygen_mask', 0),
	(1351, 'steam:11000010478bf15', 'darknet', 0),
	(1352, 'steam:11000010478bf15', 'cocacola', 0),
	(1353, 'steam:11000010478bf15', 'icetea', 0),
	(1354, 'steam:11000010478bf15', 'extended_magazine', 0),
	(1355, 'steam:11000010478bf15', 'solo_key', 0),
	(1356, 'steam:11000010478bf15', 'black_chip', 0),
	(1357, 'steam:11000010478bf15', 'xanax', 0),
	(1358, 'steam:11000010478bf15', 'whisky', 0),
	(1359, 'steam:11000010478bf15', 'barszcz', 0),
	(1360, 'steam:11000010478bf15', 'fixtool', 0),
	(1361, 'steam:11000010478bf15', 'water', 0),
	(1362, 'steam:11000010478bf15', 'vodkafruit', 0),
	(1363, 'steam:11000010478bf15', 'vodkaenergy', 0),
	(1364, 'steam:11000010478bf15', 'cupcake', 0),
	(1365, 'steam:11000010478bf15', 'gps', 1),
	(1366, 'steam:11000010478bf15', 'stone', 0),
	(1367, 'steam:11000010478bf15', 'protein_shake', 0),
	(1368, 'steam:11000010478bf15', 'soda', 0),
	(1369, 'steam:11000010478bf15', 'bolnoixcajou', 0),
	(1370, 'steam:11000010478bf15', 'mixapero', 0),
	(1371, 'steam:11000010478bf15', 'bronzemedal', 0),
	(1372, 'steam:11000010478bf15', 'grand_cru', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table server_3.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table server_3.user_licenses: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table server_3.user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.user_parkings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for table server_3.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vehicles: ~156 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 450000, 'super'),
	('Alpha', 'alpha', 81000, 'sports'),
	('Ardent', 'ardent', 234000, 'sportsclassics'),
	('Autarch', 'autarch', 540000, 'super'),
	('Baller Sport', 'baller3', 72000, 'suvs'),
	('Baller Sport XL', 'baller4', 76500, 'suvs'),
	('Banshee', 'banshee', 162000, 'sports'),
	('Banshee 900R', 'banshee2', 198000, 'super'),
	('Bestia GTS', 'bestiagts', 162000, 'sports'),
	('Brawler', 'brawler', 54000, 'offroad'),
	('Btype', 'btype', 189000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 198000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 198000, 'sportsclassics'),
	('Buffalo', 'buffalo', 54000, 'sports'),
	('Buffalo S', 'buffalo2', 72000, 'sports'),
	('Bullet', 'bullet', 144000, 'super'),
	('Carbonizzare', 'carbonizzare', 162000, 'sports'),
	('Casco', 'casco', 270000, 'sportsclassics'),
	('Cheetah', 'cheetah', 405000, 'super'),
	('Cheetah 2', 'cheetah2', 234000, 'sportsclassics'),
	('Cognoscenti 55', 'cog55', 126000, 'sedans'),
	('Cognoscenti Cabrio', 'cogcabrio', 45000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 126000, 'sedans'),
	('Comet 2', 'comet2', 162000, 'sports'),
	('Comet 3', 'comet3', 180000, 'sports'),
	('Comet 4', 'comet4', 189000, 'sports'),
	('Comet 5', 'comet5', 450000, 'sports'),
	('Contender', 'contender', 108000, 'suvs'),
	('Coquette', 'coquette', 144000, 'sports'),
	('Coquette Classic', 'coquette2', 315000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 360000, 'muscle'),
	('Cyclone', 'cyclone', 432000, 'super'),
	('Dominator', 'dominator', 90000, 'muscle'),
	('Dubsta', 'dubsta', 108000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 126000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 162000, 'offroad'),
	('Elegy', 'elegy2', 99000, 'sports'),
	('Entity XF', 'entityxf', 288000, 'super'),
	('Exemplar', 'exemplar', 72000, 'coupes'),
	('F620', 'f620', 81000, 'coupes'),
	('Felon', 'felon', 54000, 'coupes'),
	('Felon GT', 'felon2', 63000, 'coupes'),
	('Feltzer', 'feltzer2', 108000, 'sports'),
	('Stirling GT', 'feltzer3', 270000, 'sportsclassics'),
	('FMJ', 'fmj', 540000, 'super'),
	('Fhantom', 'fq2', 54000, 'suvs'),
	('Fugitive', 'fugitive', 63000, 'sedans'),
	('Furore GT', 'furoregt', 153000, 'sports'),
	('Fusilade', 'fusilade', 72000, 'sports'),
	('Gauntlet', 'gauntlet', 76500, 'muscle'),
	('Gang Burrito', 'gburrito', 63000, 'vans'),
	('Burrito', 'gburrito2', 63000, 'vans'),
	('GP1', 'gp1', 252000, 'super'),
	('Grabger', 'granger', 72000, 'suvs'),
	('GT 500', 'gt500', 180000, 'sportsclassics'),
	('Guardian', 'guardian', 135000, 'offroad'),
	('Hermes', 'hermes', 180000, 'muscle'),
	('Hotknife', 'hotknife', 162000, 'muscle'),
	('Huntley S', 'huntley', 63000, 'suvs'),
	('Hustler', 'hustler', 200000, 'muscle'),
	('Infernus', 'infernus', 135000, 'super'),
	('Infernus 2', 'infernus2', 252000, 'sportsclassics'),
	('Itali GTB', 'italigtb', 495000, 'super'),
	('Jackal', 'jackal', 63000, 'coupes'),
	('JB 700', 'jb700', 450000, 'sportsclassics'),
	('Jester', 'jester', 207000, 'sports'),
	('Jester(Racecar)', 'jester2', 252000, 'sports'),
	('Kamacho', 'kamacho', 135000, 'offroad'),
	('Khamelion', 'khamelion', 225000, 'sports'),
	('Kuruma', 'kuruma', 126000, 'sports'),
	('RE-7B', 'le7b', 630000, 'super'),
	('Lynx', 'lynx', 189000, 'sports'),
	('Mamba', 'mamba', 360000, 'sportsclassics'),
	('Massacro', 'massacro', 171000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 180000, 'sports'),
	('Mesa', 'mesa', 63000, 'suvs'),
	('Mesa Trail', 'mesa3', 103500, 'suvs'),
	('Monroe', 'monroe', 162000, 'sportsclassics'),
	('Neon', 'neon', 450000, 'sports'),
	('Nero', 'nero', 585000, 'super'),
	('Nightshade', 'nightshade', 315000, 'muscle'),
	('9F', 'ninef', 108000, 'sports'),
	('9F Cabrio', 'ninef2', 117000, 'sports'),
	('Oracle', 'oracle', 36000, 'coupes'),
	('Oracle XS', 'oracle2', 45000, 'coupes'),
	('Osiris', 'osiris', 495000, 'super'),
	('Pariah', 'pariah', 270000, 'sports'),
	('Patriot', 'patriot', 126000, 'suvs'),
	('Penetrator', 'penetrator', 162000, 'super'),
	('Pfister', 'pfister811', 360000, 'super'),
	('X80 Proto', 'prototipo', 900000, 'super'),
	('raiden', 'raiden', 270000, 'sports'),
	('Rapid GT', 'rapidgt', 81000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 90000, 'sports'),
	('Rapid GT3', 'rapidgt3', 126000, 'sportsclassics'),
	('Reaper', 'reaper', 585000, 'super'),
	('Revolter', 'revolter', 270000, 'sports'),
	('riata', 'riata', 162000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Rumpo Trail', 'rumpo3', 81000, 'vans'),
	('Ruston', 'ruston', 108000, 'sports'),
	('Sadler', 'sadler', 72000, 'vans'),
	('Sandking XL', 'sandking', 72000, 'offroad'),
	('Sandking SWB', 'sandking2', 63000, 'offroad'),
	('Savestra', 'savestra', 90000, 'sportsclassics'),
	('SC 1', 'sc1', 540000, 'super'),
	('Schafter', 'schafter2', 108000, 'sedans'),
	('Schafter V12', 'schafter3', 108000, 'sports'),
	('Schafter', 'schafter4', 108000, 'sports'),
	('Schwarzer', 'schwarzer', 90000, 'sports'),
	('Sentinel', 'sentinel', 63000, 'coupes'),
	('Sentinel XS', 'sentinel2', 72000, 'coupes'),
	('Sentinel3', 'sentinel3', 90000, 'sports'),
	('Seven 70', 'seven70', 198000, 'sports'),
	('ETR1', 'sheava', 342000, 'super'),
	('Specter', 'specter', 189000, 'sports'),
	('Stinger', 'stinger', 207000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 207000, 'sportsclassics'),
	('Streiter', 'streiter', 108000, 'sports'),
	('Stretch', 'stretch', 153000, 'sedans'),
	('Stromberg', 'stromberg', 180000, 'sports'),
	('Sultan', 'sultan', 45000, 'sedans'),
	('Sultan RS', 'sultanrs', 99000, 'super'),
	('Super Diamond', 'superd', 144000, 'sedans'),
	('Surano', 'surano', 144000, 'sports'),
	('Surge', 'surge', 27000, 'sedans'),
	('T20', 't20', 558000, 'super'),
	('Tailgater', 'tailgater', 22500, 'sedans'),
	('Drift Tampa', 'tampa2', 207000, 'sports'),
	('Tempesta', 'tempesta', 553500, 'super'),
	('Torero', 'torero', 247500, 'sportsclassics'),
	('Tornado', 'tornado', 117000, 'sportsclassics'),
	('Tornado Convertible', 'tornado2', 126000, 'sportsclassics'),
	('Trophy Truck', 'trophytruck', 45000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 36000, 'offroad'),
	('Tropos', 'tropos', 270000, 'sports'),
	('Turismo 2', 'turismo2', 207000, 'sportsclassics'),
	('Turismo R', 'turismor', 432000, 'super'),
	('Tyrus', 'tyrus', 378000, 'super'),
	('Vacca', 'vacca', 540000, 'super'),
	('Vagner', 'vagner', 630000, 'super'),
	('Verlierer', 'verlierer2', 270000, 'sports'),
	('Viseris', 'viseris', 112500, 'sportsclassics'),
	('Visione', 'visione', 657000, 'super'),
	('Voltic', 'voltic', 270000, 'super'),
	('Windsor', 'windsor', 180000, 'coupes'),
	('Windsor Drop', 'windsor2', 198000, 'coupes'),
	('XA21', 'xa21', 540000, 'super'),
	('XLS', 'xls', 63000, 'suvs'),
	('Yosemite', 'yosemite', 90000, 'muscle'),
	('Z190', 'z190', 171000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1080000, 'super'),
	('Zion', 'zion', 63000, 'coupes'),
	('Zion Cabrio', 'zion2', 72000, 'coupes'),
	('Z-Type', 'ztype', 540000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table server_3.vehicles2
CREATE TABLE IF NOT EXISTS `vehicles2` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vehicles2: ~90 rows (approximately)
/*!40000 ALTER TABLE `vehicles2` DISABLE KEYS */;
INSERT INTO `vehicles2` (`name`, `model`, `price`, `category`) VALUES
	('Asea', 'asea', 13000, 'sedans'),
	('Asterope', 'asterope', 18000, 'sedans'),
	('Baller', 'baller', 35000, 'suvs'),
	('Baller 2', 'baller2', 50000, 'suvs'),
	('Bf Injection', 'bfinjection', 10000, 'offroad'),
	('Bifta', 'bifta', 30000, 'offroad'),
	('Bison', 'bison', 35000, 'vans'),
	('BeeJay XL', 'bjxl', 55000, 'suvs'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blista', 'blista', 20000, 'compacts'),
	('Bobcat XL', 'bobcatxl', 30000, 'vans'),
	('Bodhi', 'bodhi2', 15000, 'offroad'),
	('Brioso R/A', 'brioso', 25000, 'compacts'),
	('Buccaneer', 'buccaneer', 20000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 25000, 'muscle'),
	('Burrito', 'burrito3', 50000, 'vans'),
	('Camper Van', 'camper', 120000, 'vans'),
	('Cavalcade', 'cavalcade', 40000, 'suvs'),
	('Cavalcade 2', 'cavalcade2', 45000, 'suvs'),
	('Chino', 'chino', 25000, 'muscle'),
	('Chino Luxe', 'chino2', 30000, 'muscle'),
	('Dilettante', 'dilettante', 12000, 'compacts'),
	('DLoader', 'dloader', 15000, 'offroad'),
	('Dukes', 'dukes', 20000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Emperor', 'emperor', 10000, 'sedans'),
	('Emperor 2', 'emperor2', 5000, 'sedans'),
	('Faction', 'faction', 15000, 'muscle'),
	('Faction Rider', 'faction2', 20000, 'muscle'),
	('Faction XL', 'faction3', 25000, 'muscle'),
	('Futo', 'futo', 25000, 'sports'),
	('Glendale', 'glendale', 12000, 'sedans'),
	('Gresley', 'gresley', 45000, 'suvs'),
	('Habanero', 'habanero', 30000, 'suvs'),
	('Ingot', 'ingot', 14000, 'sedans'),
	('Intruder', 'intruder', 20000, 'sedans'),
	('Issi', 'issi2', 17000, 'compacts'),
	('Journey', 'journey', 10000, 'vans'),
	('Kalahari', 'kalahari', 12000, 'offroad'),
	('Landstalker', 'landstalker', 40000, 'suvs'),
	('Manana', 'manana', 30000, 'sportsclassics'),
	('Minivan', 'minivan', 30000, 'vans'),
	('Moonbeam', 'moonbeam', 35000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Omnis', 'omnis', 50000, 'sports'),
	('Panto', 'panto', 15000, 'compacts'),
	('Paradise', 'paradise', 50000, 'vans'),
	('Penumbra', 'penumbra', 50000, 'sports'),
	('Peyote', 'peyote', 40000, 'sportsclassics'),
	('Phoenix', 'phoenix', 45000, 'muscle'),
	('Picador', 'picador', 25000, 'muscle'),
	('Pigalle', 'pigalle', 60000, 'sportsclassics'),
	('Prairie', 'prairie', 13000, 'compacts'),
	('Premier', 'premier', 20000, 'sedans'),
	('Primo', 'primo', 18000, 'sedans'),
	('Primo Custom', 'primo2', 23000, 'sedans'),
	('Radius', 'radi', 50000, 'suvs'),
	('Rancher XL', 'rancherxl', 25000, 'suvs'),
	('Rebel', 'rebel', 12000, 'offroad'),
	('Rebel Clean', 'rebel2', 18000, 'offroad'),
	('Regina', 'regina', 14000, 'sedans'),
	('Rental Bus', 'rentalbus', 60000, 'vans'),
	('Retinue', 'retinue', 40000, 'sportsclassics'),
	('Rhapsody', 'rhapsody', 30000, 'compacts'),
	('Ruiner', 'ruiner', 18000, 'muscle'),
	('Rumpo', 'rumpo', 20000, 'vans'),
	('Rumpo 2', 'rumpo2', 20000, 'vans'),
	('Sabre Turbo', 'sabregt', 25000, 'muscle'),
	('Sabre GT', 'sabregt2', 30000, 'muscle'),
	('Scrap', 'scrap', 35000, 'vans'),
	('Seminole', 'seminole', 40000, 'suvs'),
	('Slam Van', 'slamvan', 25000, 'muscle'),
	('Slam Van 2', 'slamvan2', 25000, 'muscle'),
	('Slam Van 3', 'slamvan3', 25000, 'muscle'),
	('Speedo', 'speedo', 50000, 'vans'),
	('Stanier', 'stanier', 20000, 'sedans'),
	('Stratum', 'stratum', 14000, 'sedans'),
	('Surfer', 'surfer', 30000, 'vans'),
	('Surfer 2', 'surfer2', 15000, 'vans'),
	('Tampa', 'tampa', 18000, 'muscle'),
	('Tornado Rusty', 'tornado3', 5000, 'sportsclassics'),
	('Tornado Mariachi', 'tornado4', 6000, 'sportsclassics'),
	('Tornado', 'tornado6', 35000, 'sportsclassics'),
	('Vigero', 'vigero', 15000, 'muscle'),
	('Virgo', 'virgo', 15000, 'muscle'),
	('Virgo 3', 'virgo3', 10000, 'muscle'),
	('Voodoo', 'voodoo', 10000, 'muscle'),
	('Voodoo 2', 'voodoo2', 15000, 'muscle'),
	('Warrener', 'warrener', 16000, 'sedans'),
	('Washington', 'washington', 19000, 'sedans'),
	('Youga', 'youga', 20000, 'vans'),
	('Youga Luxuary', 'youga2', 32000, 'vans');
/*!40000 ALTER TABLE `vehicles2` ENABLE KEYS */;

-- Dumping structure for table server_3.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vehicle_categories: ~9 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('coupes', 'Coupés'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table server_3.vehicle_categories2
CREATE TABLE IF NOT EXISTS `vehicle_categories2` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vehicle_categories2: ~8 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories2` DISABLE KEYS */;
INSERT INTO `vehicle_categories2` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories2` ENABLE KEYS */;

-- Dumping structure for table server_3.vehicle_trunks
CREATE TABLE IF NOT EXISTS `vehicle_trunks` (
  `plate` varchar(25) NOT NULL,
  `content` varchar(685) NOT NULL,
  `junk` bit(1) DEFAULT b'1',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vehicle_trunks: ~1 rows (approximately)
/*!40000 ALTER TABLE `vehicle_trunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_trunks` ENABLE KEYS */;

-- Dumping structure for table server_3.vgn_lottery
CREATE TABLE IF NOT EXISTS `vgn_lottery` (
  `identifier` varchar(50) DEFAULT NULL,
  `numbers` varchar(255) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.vgn_lottery: ~0 rows (approximately)
/*!40000 ALTER TABLE `vgn_lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `vgn_lottery` ENABLE KEYS */;

-- Dumping structure for table server_3.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- Dumping data for table server_3.weashops: ~9 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT INTO `weashops` (`id`, `name`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 8000),
	(14, 'BlackWeashop', 'WEAPON_MICROSMG', 50000),
	(46, 'GunShop', 'WEAPON_VINTAGEPISTOL', 10000),
	(47, 'BlackWeashop', 'WEAPON_REVOLVER', 28000),
	(53, 'BlackWeashop', 'WEAPON_SWITCHBLADE', 2000),
	(55, 'GunShop', 'WEAPON_STUNGUN', 2000),
	(57, 'BlackWeashop', 'WEAPON_PISTOL', 22000),
	(61, 'GunShop', 'WEAPON_KNIFE', 500),
	(62, 'GunShop', 'WEAPON_BAT', 2000);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

-- Dumping structure for table server_3.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(70) NOT NULL,
  `last_connecion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ban_reason` text,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.whitelist: ~8 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

-- Dumping structure for table server_3.zoneaccess
CREATE TABLE IF NOT EXISTS `zoneaccess` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.zoneaccess: ~0 rows (approximately)
/*!40000 ALTER TABLE `zoneaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoneaccess` ENABLE KEYS */;

-- Dumping structure for table server_3.zoneowners
CREATE TABLE IF NOT EXISTS `zoneowners` (
  `label` varchar(128) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `cooldown` int(10) NOT NULL,
  PRIMARY KEY (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table server_3.zoneowners: ~0 rows (approximately)
/*!40000 ALTER TABLE `zoneowners` DISABLE KEYS */;
/*!40000 ALTER TABLE `zoneowners` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
