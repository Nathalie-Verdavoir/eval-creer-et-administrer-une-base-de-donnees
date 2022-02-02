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


