USE `essentialmode`;

CREATE TABLE `zoneowners` (
	`label` VARCHAR(128) NOT NULL,
	`identifier` VARCHAR(255) NOT NULL,
	`cooldown` INT(10) NOT NULL,
	PRIMARY KEY (`label`)
);

CREATE TABLE `zoneaccess` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(128) NOT NULL,
	`identifier` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);