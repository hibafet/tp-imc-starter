-- Création de la base de données `imc_db` avec l'interclassement utf8mb4_general_ci
CREATE DATABASE IF NOT EXISTS `imc_db`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

-- Sélection de la base de données `imc_db`
USE `imc_db`;

-- Création de la table `personnes` (id, nom, prenom)
CREATE TABLE `personnes` (
  `id`     INT NOT NULL AUTO_INCREMENT,
  `nom`    VARCHAR(50) NOT NULL,
  `prenom` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Création de la table `mesures` avec le moteur InnoDB
CREATE TABLE `mesures` (
  `id`          INT NOT NULL AUTO_INCREMENT,
  `personne_id` INT NOT NULL,
  `poids`       DECIMAL(5,1) NOT NULL,
  `taille`      DECIMAL(3,2) NOT NULL,
  `imc`         DECIMAL(4,1) NOT NULL,
  `categorie`   VARCHAR(20) NOT NULL,
  `date_mesure` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Clé étrangère mesures.personne_id -> personnes(id) avec ON DELETE CASCADE
ALTER TABLE `mesures`
  ADD CONSTRAINT `fk_mesures_personnes`
  FOREIGN KEY (`personne_id`) REFERENCES `personnes` (`id`)
  ON DELETE CASCADE;

-- Insertion des 3 personnes
INSERT INTO `personnes` (`nom`, `prenom`) VALUES
  ('Ben Salah', 'Amine'),
  ('Trabelsi',  'Sana'),
  ('Gharbi',    'Youssef');

-- Insertion des 5 mesures
INSERT INTO `mesures` (`personne_id`, `poids`, `taille`, `imc`, `categorie`) VALUES
  (1, 72.5, 1.75, 23.7, 'Normal'),
  (1, 80.0, 1.75, 26.1, 'Surpoids'),
  (2, 52.0, 1.68, 18.4, 'Sous-poids'),
  (2, 58.0, 1.68, 20.5, 'Normal'),
  (3, 95.0, 1.72, 32.1, 'Obésité');
