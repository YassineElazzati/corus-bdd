-- =====================================================================
-- 1BDD3 - Base de donnees BIBLIOTHEQUE - Jeu de donnees (mock)
-- Cible : PostgreSQL. Cree le schema + ~230 lignes.
-- Rejouable : les tables sont d'abord supprimees (DROP ... CASCADE).
-- =====================================================================

DROP TABLE IF EXISTS emprunt CASCADE;
DROP TABLE IF EXISTS ecrire CASCADE;
DROP TABLE IF EXISTS livre CASCADE;
DROP TABLE IF EXISTS adherent CASCADE;
DROP TABLE IF EXISTS auteur CASCADE;
DROP TABLE IF EXISTS editeur CASCADE;

-- ------------------------- SCHEMA (MLD -> MPD) -------------------------
CREATE TABLE editeur (
    id_editeur   SERIAL PRIMARY KEY,
    nom          VARCHAR(100) NOT NULL,
    ville        VARCHAR(80),
    pays         VARCHAR(60)
);

CREATE TABLE auteur (
    id_auteur       SERIAL PRIMARY KEY,
    nom             VARCHAR(80)  NOT NULL,
    prenom          VARCHAR(80),
    nationalite     VARCHAR(60),
    annee_naissance INT
);

CREATE TABLE livre (
    id_livre          SERIAL PRIMARY KEY,
    titre             VARCHAR(200) NOT NULL,
    isbn              VARCHAR(20)  UNIQUE,
    annee_publication INT,
    genre             VARCHAR(50),
    nb_pages          INT,
    id_editeur        INT REFERENCES editeur(id_editeur)
);

CREATE TABLE ecrire (
    id_livre  INT NOT NULL REFERENCES livre(id_livre),
    id_auteur INT NOT NULL REFERENCES auteur(id_auteur),
    PRIMARY KEY (id_livre, id_auteur)
);

CREATE TABLE adherent (
    id_adherent      SERIAL PRIMARY KEY,
    nom              VARCHAR(80) NOT NULL,
    prenom           VARCHAR(80) NOT NULL,
    email            VARCHAR(150) UNIQUE,
    ville            VARCHAR(80),
    date_inscription DATE
);

CREATE TABLE emprunt (
    id_emprunt         SERIAL PRIMARY KEY,
    date_emprunt       DATE NOT NULL,
    date_retour_prevue DATE,
    date_retour_reelle DATE,
    id_livre           INT NOT NULL REFERENCES livre(id_livre),
    id_adherent        INT NOT NULL REFERENCES adherent(id_adherent)
);

-- ------------------------- EDITEURS -------------------------
INSERT INTO editeur (nom, ville, pays) VALUES
('Gallimard','Paris','France'),
('Flammarion','Paris','France'),
('Le Seuil','Paris','France'),
('Actes Sud','Arles','France'),
('Albin Michel','Paris','France'),
('Le Livre de Poche','Paris','France'),
('Penguin Books','Londres','Royaume-Uni'),
('Minuit','Paris','France');

-- ------------------------- AUTEURS -------------------------
INSERT INTO auteur (nom, prenom, nationalite, annee_naissance) VALUES
('Hugo','Victor','Francaise',1802),
('Zola','Emile','Francaise',1840),
('Camus','Albert','Francaise',1913),
('Proust','Marcel','Francaise',1871),
('Flaubert','Gustave','Francaise',1821),
('Duras','Marguerite','Francaise',1914),
('Ernaux','Annie','Francaise',1940),
('Nothomb','Amelie','Belge',1966),
('Orwell','George','Britannique',1903),
('Woolf','Virginia','Britannique',1882),
('Austen','Jane','Britannique',1775),
('Tolkien','J.R.R.','Britannique',1892),
('Rowling','J.K.','Britannique',1965),
('King','Stephen','Americaine',1947),
('Hemingway','Ernest','Americaine',1899),
('Morrison','Toni','Americaine',1931),
('Marquez','Gabriel Garcia','Colombienne',1927),
('Borges','Jorge Luis','Argentine',1899),
('Dostoievski','Fedor','Russe',1821),
('Tolstoi','Leon','Russe',1828),
('Kafka','Franz','Autrichienne',1883),
('Murakami','Haruki','Japonaise',1949),
('Calvino','Italo','Italienne',1923),
('Eco','Umberto','Italienne',1932),
('Saramago','Jose','Portugaise',1922);

-- ------------------------- LIVRES -------------------------
INSERT INTO livre (titre, isbn, annee_publication, genre, nb_pages, id_editeur) VALUES
('Les Miserables','978-2-2070100000',1894,'Roman',849,5),
('Notre-Dame de Paris','978-2-2070100001',1928,'Classique',232,2),
('Germinal','978-2-2070100002',2005,'Roman',694,7),
('L''Assommoir','978-2-2070100003',1874,'Roman',185,4),
('La Bete humaine','978-2-2070100004',1925,'Drame',706,1),
('L''Etranger','978-2-2070100005',2009,'Classique',823,7),
('La Peste','978-2-2070100006',1922,'Science-fiction',693,5),
('La Chute','978-2-2070100007',1867,'Roman',804,7),
('Du cote de chez Swann','978-2-2070100008',1953,'Fantasy',249,4),
('Le Temps retrouve','978-2-2070100009',1952,'Roman',184,7),
('Madame Bovary','978-2-2070100010',1890,'Policier',442,5),
('L''Education sentimentale','978-2-2070100011',1877,'Science-fiction',639,2),
('L''Amant','978-2-2070100012',1962,'Roman',655,5),
('Un barrage contre le Pacifique','978-2-2070100013',1958,'Historique',286,2),
('La Place','978-2-2070100014',1877,'Classique',881,5),
('Les Annees','978-2-2070100015',1886,'Classique',193,7),
('Stupeur et tremblements','978-2-2070100016',1937,'Science-fiction',740,6),
('Hygiene de l''assassin','978-2-2070100017',1907,'Policier',453,4),
('1984','978-2-2070100018',1934,'Roman',713,3),
('La Ferme des animaux','978-2-2070100019',2002,'Classique',257,8),
('Mrs Dalloway','978-2-2070100020',1963,'Fantasy',745,4),
('La Promenade au phare','978-2-2070100021',1949,'Roman',324,1),
('Orgueil et prejuges','978-2-2070100022',1946,'Nouvelle',364,2),
('Emma','978-2-2070100023',1920,'Historique',825,6),
('Le Seigneur des anneaux','978-2-2070100024',1920,'Science-fiction',495,8),
('Le Hobbit','978-2-2070100025',1902,'Fantasy',232,4),
('Harry Potter a l''ecole des sorciers','978-2-2070100026',2009,'Drame',359,7),
('Harry Potter et la Chambre des secrets','978-2-2070100027',2015,'Nouvelle',460,4),
('Ca','978-2-2070100028',1901,'Drame',595,2),
('Shining','978-2-2070100029',1878,'Roman',246,3),
('Le Vieil Homme et la Mer','978-2-2070100030',1974,'Historique',155,7),
('Pour qui sonne le glas','978-2-2070100031',1963,'Historique',569,5),
('Beloved','978-2-2070100032',2007,'Roman',786,2),
('Le Chant de Salomon','978-2-2070100033',2003,'Fantasy',877,6),
('Cent ans de solitude','978-2-2070100034',1894,'Fantasy',535,3),
('L''Amour aux temps du cholera','978-2-2070100035',1982,'Roman',829,5),
('Fictions','978-2-2070100036',1994,'Roman',609,2),
('L''Aleph','978-2-2070100037',1942,'Drame',713,4),
('Crime et Chatiment','978-2-2070100038',1905,'Policier',870,3),
('Les Freres Karamazov','978-2-2070100039',2004,'Drame',90,6),
('Guerre et Paix','978-2-2070100040',1991,'Roman',204,6),
('Anna Karenine','978-2-2070100041',1944,'Classique',149,4),
('Le Proces','978-2-2070100042',2011,'Roman',177,8),
('La Metamorphose','978-2-2070100043',1883,'Drame',874,3),
('Kafka sur le rivage','978-2-2070100044',1898,'Science-fiction',652,3),
('1Q84','978-2-2070100045',1933,'Drame',711,7),
('Le Baron perche','978-2-2070100046',1920,'Drame',863,4),
('Si par une nuit d''hiver un voyageur','978-2-2070100047',1945,'Nouvelle',777,6),
('Le Nom de la rose','978-2-2070100048',1978,'Drame',552,2),
('L''Aveuglement','978-2-2070100049',1929,'Classique',155,6);

-- ------------------------- ECRIRE (livre <-> auteur) -------------------------
INSERT INTO ecrire (id_livre, id_auteur) VALUES
(1,1),
(1,18),
(2,1),
(3,2),
(4,2),
(4,21),
(5,3),
(6,3),
(7,4),
(8,4),
(8,8),
(9,5),
(10,5),
(11,6),
(12,6),
(13,7),
(14,7),
(15,8),
(16,8),
(17,9),
(18,9),
(18,22),
(19,10),
(20,10),
(21,11),
(22,11),
(23,12),
(24,12),
(25,13),
(26,13),
(27,14),
(28,7),
(28,14),
(29,15),
(30,15),
(31,16),
(32,16),
(33,17),
(34,17),
(35,18),
(36,18),
(37,19),
(38,18),
(38,19),
(39,20),
(40,20),
(41,21),
(42,21),
(43,16),
(43,22),
(44,22),
(45,23),
(46,23),
(47,1),
(47,24),
(48,24),
(49,25),
(50,25);

-- ------------------------- ADHERENTS -------------------------
INSERT INTO adherent (nom, prenom, email, ville, date_inscription) VALUES
('Martin','Lucas','lucas.martin@mail.fr','Lens','2023-07-21'),
('Bernard','Emma','emma.bernard@mail.fr','Lomme','2023-05-17'),
('Dubois','Nathan','nathan.dubois@mail.fr','Valenciennes','2024-09-17'),
('Thomas','Chloe','chloe.thomas@mail.fr','Villeneuve-d''Ascq','2021-11-14'),
('Robert','Hugo','hugo.robert@mail.fr','Villeneuve-d''Ascq','2022-08-31'),
('Petit','Lea','lea.petit@mail.fr','Wattrelos','2021-04-30'),
('Durand','Louis','louis.durand@mail.fr','Lille','2024-01-16'),
('Leroy','Manon','manon.leroy@mail.fr','Lille','2022-10-05'),
('Moreau','Jules','jules.moreau@mail.fr','Wattrelos','2021-04-13'),
('Simon','Camille','camille.simon@mail.fr','Lomme','2023-09-04'),
('Laurent','Adam','adam.laurent@mail.fr','Tourcoing','2023-12-24'),
('Lefebvre','Sarah','sarah.lefebvre@mail.fr','Lomme','2021-04-27'),
('Michel','Raphael','raphael.michel@mail.fr','Tourcoing','2021-06-14'),
('Garcia','Ines','ines.garcia@mail.fr','Wattrelos','2021-05-21'),
('David','Arthur','arthur.david@mail.fr','Villeneuve-d''Ascq','2021-05-20'),
('Bertrand','Jade','jade.bertrand@mail.fr','Roubaix','2023-04-07'),
('Roux','Paul','paul.roux@mail.fr','Villeneuve-d''Ascq','2024-03-12'),
('Vincent','Alice','alice.vincent@mail.fr','Wattrelos','2024-03-31'),
('Fournier','Tom','tom.fournier@mail.fr','Wattrelos','2021-03-23'),
('Morel','Zoe','zoe.morel@mail.fr','Douai','2021-06-17'),
('Girard','Enzo','enzo.girard@mail.fr','Wattrelos','2024-09-08'),
('Andre','Louna','louna.andre@mail.fr','Lomme','2024-03-03'),
('Lefevre','Gabriel','gabriel.lefevre@mail.fr','Lens','2022-10-10'),
('Mercier','Rose','rose.mercier@mail.fr','Arras','2022-02-23'),
('Dupont','Theo','theo.dupont@mail.fr','Lens','2022-05-04'),
('Lambert','Lina','lina.lambert@mail.fr','Tourcoing','2023-03-22'),
('Bonnet','Maxime','maxime.bonnet@mail.fr','Lens','2024-10-07'),
('Francois','Anna','anna.francois@mail.fr','Arras','2023-07-26'),
('Martinez','Noah','noah.martinez@mail.fr','Lille','2021-05-29'),
('Legrand','Eva','eva.legrand@mail.fr','Wattrelos','2023-07-28');

-- ------------------------- EMPRUNTS -------------------------
INSERT INTO emprunt (date_emprunt, date_retour_prevue, date_retour_reelle, id_livre, id_adherent) VALUES
('2024-02-07','2024-02-28','2024-02-26',37,4),
('2025-04-22','2025-05-13','2025-04-27',17,5),
('2024-05-25','2024-06-15','2024-06-14',16,12),
('2024-11-09','2024-11-30',NULL,46,10),
('2024-01-05','2024-01-26','2024-02-14',42,17),
('2024-12-05','2024-12-26','2024-12-12',20,30),
('2025-03-31','2025-04-21','2025-04-20',17,4),
('2024-05-24','2024-06-14','2024-06-18',10,9),
('2024-12-17','2025-01-07','2024-12-28',22,7),
('2024-05-08','2024-05-29',NULL,33,16),
('2024-11-20','2024-12-11','2024-12-01',4,3),
('2024-06-19','2024-07-10','2024-08-01',3,1),
('2025-01-14','2025-02-04','2025-02-08',17,6),
('2024-01-05','2024-01-26','2024-01-30',28,18),
('2024-01-19','2024-02-09',NULL,10,18),
('2024-03-16','2024-04-06','2024-03-20',38,18),
('2025-04-05','2025-04-26',NULL,20,12),
('2024-07-02','2024-07-23','2024-07-12',3,29),
('2024-06-30','2024-07-21','2024-08-20',43,4),
('2025-01-18','2025-02-08','2025-01-28',27,20),
('2025-02-19','2025-03-12','2025-03-07',11,26),
('2025-01-12','2025-02-02',NULL,2,6),
('2024-12-08','2024-12-29',NULL,27,26),
('2024-03-22','2024-04-12','2024-04-17',16,9),
('2024-01-20','2024-02-10',NULL,25,28),
('2025-02-22','2025-03-15',NULL,15,7),
('2025-02-24','2025-03-17','2025-03-26',23,10),
('2024-12-03','2024-12-24','2024-12-16',15,1),
('2024-02-05','2024-02-26',NULL,18,28),
('2024-11-24','2024-12-15','2024-12-18',18,12),
('2025-04-25','2025-05-16','2025-05-06',35,11),
('2025-05-07','2025-05-28',NULL,12,19),
('2024-11-01','2024-11-22','2024-11-14',3,4),
('2024-09-18','2024-10-09','2024-10-09',28,20),
('2024-01-23','2024-02-13','2024-02-15',13,9),
('2025-02-16','2025-03-09','2025-03-12',34,30),
('2024-08-08','2024-08-29','2024-09-01',13,12),
('2024-06-09','2024-06-30','2024-07-05',22,20),
('2024-06-02','2024-06-23','2024-06-26',47,29),
('2024-07-25','2024-08-15','2024-09-03',27,11),
('2024-08-03','2024-08-24','2024-09-07',9,7),
('2025-04-07','2025-04-28','2025-04-28',44,24),
('2024-10-07','2024-10-28',NULL,20,13),
('2024-04-17','2024-05-08','2024-05-08',20,10),
('2024-06-13','2024-07-04','2024-06-30',39,21),
('2024-09-18','2024-10-09','2024-09-26',44,7),
('2024-05-25','2024-06-15','2024-06-17',43,3),
('2024-02-17','2024-03-09',NULL,40,11),
('2024-12-10','2024-12-31','2024-12-19',49,8),
('2024-01-24','2024-02-14','2024-02-11',10,1),
('2025-01-28','2025-02-18','2025-02-13',40,28),
('2024-04-09','2024-04-30','2024-05-14',41,19),
('2024-05-04','2024-05-25','2024-05-29',32,13),
('2025-01-19','2025-02-09',NULL,1,29),
('2024-08-05','2024-08-26','2024-08-30',7,25),
('2024-01-26','2024-02-16','2024-02-01',34,15),
('2025-02-14','2025-03-07','2025-03-05',30,5),
('2024-06-11','2024-07-02',NULL,36,20),
('2025-02-21','2025-03-14','2025-04-01',29,20),
('2025-04-09','2025-04-30','2025-04-17',28,27);

-- Total lignes de donnees : 231