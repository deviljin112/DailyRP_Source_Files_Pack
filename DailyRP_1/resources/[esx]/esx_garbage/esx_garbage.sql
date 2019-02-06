INSERT INTO `jobs` (`id`, `name`, `label`, `whitelisted`) VALUES
(NULL, 'eboueur', 'Smieciarz', 0);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(NULL, 'eboueur', 0, 'interim', 'Pracownik', 250, '{}', '{}');

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
(NULL, 'poubelle', 'Smieci', -1, 0, 1);
