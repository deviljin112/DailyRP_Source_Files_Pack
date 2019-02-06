INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_state','State',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_state','State',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_state', 'State', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('state', 'Etat', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('state', 0, 'vicepresident', 'Vice-Président', 10000, '{}', '{}'),
('state', 1, 'president', 'Président', 18000, '{}', '{}'),
('state', 2, 'gouvernment', 'Gouvernement', 33000, '{}', '{}'),
('state', 3, 'boss', 'L\'état', 0, '{}', '{}');