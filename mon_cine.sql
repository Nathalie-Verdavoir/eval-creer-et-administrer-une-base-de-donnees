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


/*-----------TABLE TOUS LES CINEMAS------------------------------------------------------------------------------*/
/* crée la table cinemas avec colonnes id, ville, nb_salles */
CREATE TABLE cinemas
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ville VARCHAR(30),
    nb_salles INT,
    adresse VARCHAR(100),
    telephone VARCHAR(14),
    mail VARCHAR(40),
    responsable_id INT DEFAULT 1,
   CONSTRAINT `erreur_responsable`
    FOREIGN KEY (responsable_id) REFERENCES employes(id)
    ON DELETE SET NULL
    ON UPDATE RESTRICT
) ENGINE = InnoDB;

/* insert les données dans la table cinémas */
INSERT INTO cinemas (ville, nb_salles, adresse, telephone, mail, responsable_id)
 VALUES
 ('PARIS', '7', '8 rue Alfred Hitchcock', '01.23.45.67.89', 'paris@cinema.fr', 2),
 ('LILLE', '6', '7 rue Quentin Tarantino', '03.12.45.67.89', 'lille@cinema.fr', 3),
 ('MARSEILLE', '3', '4 rue David Lynch', '04.12.35.67.89', 'marseille@cinema.fr', 4),
 ('TOULOUSE', '2', '3 rue Stanley Kubrik', '05.12.34.67.89', 'toulouse@cinema.fr', 5);


 /*-----------TABLE TOUTES LES SALLES------------------------------------------------------------------------------*/
/* crée la table pour un cinéma en fonction de son nombre de salle */
CREATE TABLE salles
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numero_de_salle INT,
    nb_total_de_places INT,
    cinema_id INT NOT NULL,
  CONSTRAINT `erreur_salle_sans_cinema`
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
) ENGINE = InnoDB;

/* insert les données dans la table SALLES */
INSERT INTO salles (numero_de_salle, nb_total_de_places, cinema_id)
 VALUES
 (1, 250, 1),
 (2, 240, 1),
 (3, 140, 1),
 (4, 140, 1),
 (5, 140, 1),
 (6, 120, 1),
 (7, 120, 1),
 (1, 250, 2),
 (2, 220, 2),
 (3, 210, 2),
 (4, 120, 2),
 (5, 120, 2),
 (6, 120, 2),
 (1, 250, 3),
 (2, 220, 3),
 (3, 110, 3),
 (1, 150, 4),
 (2, 120, 4);

/* exemples d'insertion qui créent une erreur */
/*
INSERT INTO salles (numéro_de_salle, nb_total_de_places, cinema_id)
 VALUES
 (1, 250,18); -- le cinema d'id 18 n'existe pas dans les exemples et renvoie une erreur

INSERT INTO salles (numéro_de_salle, nb_total_de_places)
 VALUES
 (1, 250); -- une salle non attachée à un cinema renvoie une erreur

*/

/*-----------TABLE TOUS LES TARIFS------------------------------------------------------------------------------*/
/* crée la table des tarifs */
CREATE TABLE tarifs
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100),
    montant DECIMAL(18, 2)
) ENGINE = InnoDB;

/* insert les données dans la table TARIFS */
INSERT INTO tarifs (nom, montant)
 VALUES
 ('Plein Tarif',9.20),
 ('Étudiant', 7.60),
 ('Moins de 14 ans', 5.90);



 /*-----------TABLE des SEANCES------------------------------------------------------------------------------*/
/* crée la table de toutes les seances */
CREATE TABLE seances
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    horaire DATETIME NOT NULL,
    film_id INT NOT NULL,
    salle_id INT NOT NULL,
    nb_places_disponibles INT,
  CONSTRAINT `erreur_film_id`
    FOREIGN KEY (film_id) REFERENCES films(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `erreur_salle_id`
    FOREIGN KEY (salle_id) REFERENCES salles(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
) ENGINE = InnoDB;

/* fonction pour générer le nb_places_disponibles en prenant le nb_de_place de la salle */
DELIMITER $$

CREATE FUNCTION Get_nb_total_de_places ( salle_id INT)
RETURNS INT

BEGIN
  SELECT nb_total_de_places into @nb_total_de_places FROM mon_cine.salles WHERE id=salle_id;
  RETURN  @nb_total_de_places;
END;
$$
DELIMITER ;


/* insert les données dans la table seances */
INSERT INTO seances (horaire,film_id,salle_id,nb_places_disponibles)
 VALUES
    ('2022-12-01 20:30:00',1,1,Get_nb_total_de_places( salle_id)),
    ('2022-12-02 20:30:00',2,2,Get_nb_total_de_places( salle_id)),
    ('2022-12-03 20:30:00',3,3,Get_nb_total_de_places( salle_id)),
    ('2022-12-04 20:30:00',4,4,Get_nb_total_de_places( salle_id)),
    ('2022-12-05 20:30:00',5,5,Get_nb_total_de_places( salle_id)),
    ('2022-12-06 20:30:00',6,6,Get_nb_total_de_places( salle_id));


 /*-----------TABLE des BILLETS------------------------------------------------------------------------------------*/
/* crée la table de tous les BILLETS VENDUS */

CREATE TABLE billets
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seance_id INT NOT NULL,
    nb_de_tarif_1 INT NOT NULL DEFAULT 0,
    nb_de_tarif_2 INT NOT NULL DEFAULT 0,
    nb_de_tarif_3 INT NOT NULL DEFAULT 0,
  CONSTRAINT `erreur_seance`
    FOREIGN KEY (seance_id) REFERENCES seances(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
) ENGINE = InnoDB;

/* PROCEDURE pour générer un achat de billets */
DELIMITER $$

CREATE PROCEDURE Acheter_des_billets ( billet_seance_id INT, billet_nb_de_tarif_1 INT, billet_nb_de_tarif_2 INT , billet_nb_de_tarif_3 INT)

BEGIN
     /* ON VERIFIE SI L'ACHAT EST POSSIBLE/ SI IL RESTE ASSEZ DE PLACES DANS LA SEANCE */
    IF (SELECT nb_places_disponibles from seances WHERE id=billet_seance_id) >= billet_nb_de_tarif_1 + billet_nb_de_tarif_2 + billet_nb_de_tarif_3
     THEN
            /* ON AJOUTE L'ACHAT A LA TABLE BILLET */
            INSERT INTO billets (seance_id,nb_de_tarif_1,nb_de_tarif_2,nb_de_tarif_3)
                     VALUES
                        (billet_seance_id,billet_nb_de_tarif_1,billet_nb_de_tarif_2,billet_nb_de_tarif_3);

            /* ON MET A JOUR LE NOMBRE DE PLACES DISPONIBLES POUR CETTE SEANCE */
            UPDATE seances SET nb_places_disponibles =
                                nb_places_disponibles - billet_nb_de_tarif_1 - billet_nb_de_tarif_2 - billet_nb_de_tarif_3
                WHERE id=billet_seance_id;

            /* ON MET A JOUR LE NOMBRE DE PLACES VENDUES POUR CE FILM */
            UPDATE films SET montant_total_des_billets_vendus =
                            montant_total_des_billets_vendus + billet_nb_de_tarif_1*(select montant FROM tarifs WHERE id=1) + billet_nb_de_tarif_2*(select montant FROM tarifs WHERE id=2) + billet_nb_de_tarif_3*(select montant FROM tarifs WHERE id=3)
                  WHERE id=(select film_id FROM seances WHERE id=billet_seance_id);

    END IF;
END;
$$
DELIMITER ;


CALL Acheter_des_billets( 1, 3, 1 , 0);
CALL Acheter_des_billets( 2, 3, 1 , 1);
CALL Acheter_des_billets( 3, 2, 1 , 0);
CALL Acheter_des_billets( 4, 1, 0 , 0);
CALL Acheter_des_billets( 5, 0, 1 , 0);
CALL Acheter_des_billets( 6, 0, 0 , 1);

