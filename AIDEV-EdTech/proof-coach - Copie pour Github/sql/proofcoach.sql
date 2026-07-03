CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    mot_de_passe VARCHAR(255),
    role ENUM('etudiant','enseignant','admin'),
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profils_etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    niveau VARCHAR(50),
    institution VARCHAR(150),
    FOREIGN KEY(utilisateur_id)
       REFERENCES utilisateurs(id)
);

CREATE TABLE exercices (
    id INT AUTO_INCREMENT PRIMARY KEY,

    titre VARCHAR(255),

    enonce TEXT,

    domaine VARCHAR(100),
    theme VARCHAR(100),

    niveau VARCHAR(50),

    difficulte INT,

    solution_modele TEXT,

    createur_id INT,

    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tentatives (
    id INT AUTO_INCREMENT PRIMARY KEY,

    exercice_id INT,
    etudiant_id INT,

    date_debut DATETIME,
    date_fin DATETIME,

    statut ENUM(
      'en_cours',
      'envoye',
      'corrige'
    ),

    score INT
);

CREATE TABLE demonstrations (
    id INT AUTO_INCREMENT PRIMARY KEY,

    tentative_id INT,

    contenu LONGTEXT,

    version INT DEFAULT 1,

    date_envoi DATETIME
);

CREATE TABLE analyses_ia (

id INT AUTO_INCREMENT PRIMARY KEY,

demonstration_id INT,

resume TEXT,

score_logique INT,

score_redaction INT,

niveau_confiance INT,

analyse_complete LONGTEXT,

date_analyse DATETIME

);

CREATE TABLE erreurs (

id INT AUTO_INCREMENT PRIMARY KEY,

analyse_id INT,

type_erreur VARCHAR(100),

description TEXT,

gravite ENUM(
'faible',
'moyenne',
'forte'
)

);

CREATE TABLE feedbacks (

id INT AUTO_INCREMENT PRIMARY KEY,

analyse_id INT,

niveau INT,

message TEXT

);

CREATE TABLE profils_cognitifs (

id INT AUTO_INCREMENT PRIMARY KEY,

etudiant_id INT,

erreur_frequente VARCHAR(255),

frequence INT,

recommandation TEXT

);
