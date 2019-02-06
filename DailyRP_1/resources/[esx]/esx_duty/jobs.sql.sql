INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Policjant Poza Sluzba'),
  ('offambulance','Medyk Poza Sluzba')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Officer',0,'{}','{}'),
  ('offpolice',1,'sergeant','Sergeant',0,'{}','{}'),
  ('offpolice',2,'lieutenant','Lieutenant',0,'{}','{}'),
  ('offpolice',3,'boss','Sheriff',0,'{}','{}'),
  ('offpolice',4,'capitan','Major',0,'{}','{}'),
  ('offambulance',0,'ambulance','Stazysta',0,'{}','{}'),
  ('offambulance',1,'doctor','Lekarz',0,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chirurg',0,'{}','{}'),
  ('offambulance',3,'boss','Ordynator',0,'{}','{}')
;