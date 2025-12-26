CREATE DATABASE Projets;
USE Projets;
CREATE TABLE Employeur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role ENUM('chef de projet', 'développeur', 'testeur', 'autre') NOT NULL
);
ALTER TABLE Employeur COMMENT = 'Table des Employeur';

CREATE TABLE Projet( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50),
    description TEXT,
    dateDebut DATE,
    dateFin DATE,
    statut ENUM('en cours', 'terminé', 'annulé') NOT NULL DEFAULT 'en cours',
    idChefprojet INT NOT NULL,
    FOREIGN KEY (idChefprojet) REFERENCES Employeur(id)
);
CREATE TABLE Taches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    dateLimite DATE,
    etat ENUM('non commencée','en cours','terminée') NOT NULL DEFAULT 'non commencée',
    idEmploye INT NOT NULL,
    idProjet INT NOT NULL,
    FOREIGN KEY (idEmploye) REFERENCES Employeur(id),
    FOREIGN KEY (idProjet) REFERENCES Projet(id)
);
