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
