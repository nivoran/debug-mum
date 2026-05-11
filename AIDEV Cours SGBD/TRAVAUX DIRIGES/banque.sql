-- Création de la table Filiale
CREATE TABLE Filiale (
    code_filiale INT PRIMARY KEY,
    nom_filiale VARCHAR(100),
    ville VARCHAR(100)
);

-- Création de la table Client
CREATE TABLE Client (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(100),
    adresse VARCHAR(255),
    ville_client VARCHAR(100)
);

-- Création de la table Compte
CREATE TABLE Compte (
    num_compte VARCHAR(20) PRIMARY KEY,
    solde DECIMAL(15, 2),
    code_filiale INT,
    FOREIGN KEY (code_filiale) REFERENCES Filiale(code_filiale)
);

-- Création de la table Pret
CREATE TABLE Pret (
    num_pret VARCHAR(20) PRIMARY KEY,
    montant DECIMAL(15, 2),
    code_filiale INT,
    FOREIGN KEY (code_filiale) REFERENCES Filiale(code_filiale)
);

-- Table de liaison Client <-> Compte
CREATE TABLE Depositaire (
    id_client INT,
    num_compte VARCHAR(20),
    PRIMARY KEY (id_client, num_compte),
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (num_compte) REFERENCES Compte(num_compte)
);

-- Table de liaison Client <-> Pret
CREATE TABLE Emprunteur (
    id_client INT,
    num_pret VARCHAR(20),
    PRIMARY KEY (id_client, num_pret),
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (num_pret) REFERENCES Pret(num_pret)
);

INSERT INTO Filiale (code_filiale, nom_filiale, ville) VALUES
(1, 'Siège Central', 'Paris'),
(2, 'Agence Bellecour', 'Lyon'),
(3, 'Antenne Canebière', 'Marseille'),
(4, 'Filiale du Nord', 'Lille'),
(5, 'Agence de la Bourse', 'Bordeaux'),
(6, 'Rive Gauche', 'Toulouse'),
(7, 'Agence Grand Place', 'Bruxelles'),
(8, 'Espace Léman', 'Genève'),
(9, 'Côte d Azur', 'Nice'),
(10, 'Bretagne Finance', 'Rennes');

INSERT INTO Client (id_client, nom_client, adresse, ville_client) VALUES
(101, 'Martin Jean', '12 rue de la Paix', 'Paris'),
(102, 'Bernard Marie', '45 avenue Foch', 'Lyon'),
(103, 'Dubois Thomas', '8 rue Paradis', 'Marseille'),
(104, 'Thomas Alice', '112 boulevard Victor Hugo', 'Lille'),
(105, 'Robert Julien', '23 cours de l Intendance', 'Bordeaux'),
(106, 'Richard Sophie', '5 rue des Lois', 'Toulouse'),
(107, 'Petit Nicolas', '67 Grand Place', 'Bruxelles'),
(108, 'Durand Claire', '14 quai du Rhône', 'Genève'),
(109, 'Leroy Antoine', '3 rue de France', 'Nice'),
(110, 'Moreau Lucie', '2 rue de la Monnaie', 'Rennes');

INSERT INTO Compte (num_compte, solde, code_filiale) VALUES
('C001', 2500.50, 1),
('C002', 150.00, 2),
('C003', 12400.00, 3),
('C004', 50.75, 4),
('C005', 3100.20, 5),
('C006', 890.00, 6),
('C007', 45000.00, 7),
('C008', 210.00, 8),
('C009', 1300.00, 9),
('C010', 75.00, 10);

INSERT INTO Pret (num_pret, montant, code_filiale) VALUES
('P001', 150000, 1),
('P002', 5000, 2),
('P003', 25000, 3),
('P004', 300000, 4),
('P005', 1200, 5),
('P006', 45000, 6),
('P007', 8000, 7),
('P008', 120000, 8),
('P009', 2500, 9),
('P010', 18000, 10);

INSERT INTO Depositaire (id_client, num_compte) VALUES
(101, 'C001'),
(102, 'C002'),
(103, 'C003'),
(104, 'C004'),
(105, 'C005'),
(106, 'C006'),
(107, 'C007'),
(108, 'C008'),
(109, 'C009'),
(110, 'C010');

INSERT INTO Emprunteur (id_client, num_pret) VALUES
(101, 'P001'),
(102, 'P002'),
(103, 'P003'),
(104, 'P004'),
(105, 'P005'),
(106, 'P006'),
(107, 'P007'),
(108, 'P008'),
(109, 'P009'),
(110, 'P010');
