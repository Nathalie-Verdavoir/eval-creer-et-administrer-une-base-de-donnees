/* supprime la base de données existante*/
DROP DATABASE `mon_cine`;


/* crée la base de données */
CREATE DATABASE IF NOT EXISTS mon_cine CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;


/* utiliser la base */
USE mon_cine;


/*-----------TABLE TOUS LES FILMS------------------------------------------------------------------------------*/
/* crée la table films */
CREATE TABLE films
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titre VARCHAR(100),
    realisateur VARCHAR(100),
    duree TIME,
    montant_total_des_billets_vendus DECIMAL(10,2) NOT NULL DEFAULT 0
) ENGINE = InnoDB;

/* insert les données dans la table films */
INSERT INTO films (titre,realisateur,duree)
 VALUES
('In the Navy', 'Tannie Samsin', '01:56'),
('Shoppen ', 'Carey Matej', '01:21'),
('Babe, The', 'Pattie Cotherill', '01:19'),
('Chamber of Death (Chambre des morts, La)', 'Eryn Earp', '01:34'),
('StarStruck', 'Berrie Gallier', '01:39'),
('Goodbye Girl, The', 'Winne Southall', '01:01'),
('Swimming to Cambodia', 'Stormie Yard', '01:16'),
('Deterrence', 'Ezmeralda Emmison', '01:39'),
('Long Gray Line, The', 'Marquita Dobrowolski', '01:37'),
('Crackers', 'Cord Stokey', '01:09'),
('La petite reine', 'Klarika Ouchterlony', '02:29'),
('Dead or Alive: Final', 'Vikki Breffit', '01:00'),
('Mother and Child', 'Vinnie Jonsson', '02:39'),
('Blow-Out (La grande bouffe)', 'Lonna Iacobini', '02:07'),
('To.get.her', 'Jodie Dennerley', '01:50'),
('Helvetica', 'Olag Emnoney', '01:12'),
('Dear Brigitte', 'Bernita Mandell', '01:00'),
('Crazy Kind of Love', 'Cobb Budding', '01:25'),
('Raze', 'Loretta Arrighi', '01:27'),
('RV', 'Jodi Dorgon', '01:40');


/*-----------TABLE TOUTES LES EMPLOYES------------------------------------------------------------------------------*/
/* crée la table des employes avec leurs droits */
CREATE TABLE employes
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30) NOT NULL,
    date_de_naissance DATE,
    role VARCHAR(10) NOT NULL,
    password VARCHAR(60) NOT NULL,
    adresse VARCHAR(100),
    telephone VARCHAR(14),
    mail VARCHAR(40)
) ENGINE = InnoDB;

/* insert les employés avec leur role */
INSERT INTO employes (nom, prenom, date_de_naissance, adresse, telephone, mail, role, password)
 VALUES
 ('Doe', 'John', '801203', '15 rue Alfred Tarantino', '01.23.45.76.98', 'admin@cinema.fr', 'admin', '$2y$10$o8za0K8NDjBKP9ZJ/LHpBetB5JagFpQ3EUYyBAwFh8y03O6gH/UyW'),
 ('Dupontel', 'Michel', '920214', '21 rue Quentin Lynch', '01.12.45.76.98', 'paris@cinema.fr', 'vendeur', '$2y$10$E3HgXokKT6xrhfY1t.7Xf.zeJm.usQre1mw01cJBo5cTUs87Dc7ze'),
 ('Gabin', 'Julien', '850331', '21 rue Quentin Tarantino', '03.12.45.76.98', 'lille@cinema.fr', 'vendeur', '$2y$10$vDNMDO4YjRAN8IeQm3q.k.ZuNf/U8uwHh4mqDKD1wCYT4IOFFjF3W'),
 ('Monroe', 'Marie', '011120', '4 rue David Kubrik', '04.12.35.76.98', 'marseille@cinema.fr', 'vendeur', '$2y$10$wavr2j.udShBC2sByNn6dOQlm4Rcxn7QqMsuo6ojh6BaP04F/M5q2'),
 ('Signoret', 'Simon', '990227', '3 rue Stanley Kubrik', '05.12.34.76.98', 'toulouse@cinema.fr', 'vendeur', '$2y$10$4lwN7YyIWyi95KJ/ehnShOlZ70OfPZiSA/jq9It4vtaf1xooUE.LO');

