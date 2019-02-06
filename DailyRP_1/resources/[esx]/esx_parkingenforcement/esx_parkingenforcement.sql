INSERT INTO `essentialmode`.`jobs` (`name`, `label`, `whitelisted`) VALUES ('parking', 'Parking Enforcement', '1');

INSERT INTO `essentialmode`.`job_grades` (`job_name`, `name`, `label`, `salary`) VALUES ('parking', 'meter_maid', 'Meter Maid', '1500');
INSERT INTO `essentialmode`.`job_grades` (`job_name`, `grade`, `name`, `label`, `salary`) VALUES ('parking', '1', 'parking_enforcement', 'Parking Enforcement', '2000');
INSERT INTO `essentialmode`.`job_grades` (`job_name`, `grade`, `name`, `label`, `salary`) VALUES ('parking', '2', 'boss', 'CEO', '2500');

INSERT INTO `essentialmode`.`addon_account` (`name`, `label`, `shared`) VALUES ('society_parking', 'Parking Enforcement', '1');

INSERT INTO `essentialmode`.`addon_account_data` (`account_name`, `money`) VALUES ('society_parking', '0');