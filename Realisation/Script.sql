CREATE DATABASE BlogEnlign;
USE BlogEnlign;
CREATE TABLE Utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(200)
);
ALTER TABLE Utilisateur COMMENT = 'Table des utilisateurs';

CREATE TABLE Categorie( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50)
);
CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR (100) NOT NULL,
    datePub DATE,
    contenu TEXT NOT NULL,
    statut ENUM('publié','brouillon') NOT NULL,
    idUser INT NOT NULL,
    idCategorie INT NOT NULL,
    FOREIGN KEY (idUser) REFERENCES Utilisateur(id),
    FOREIGN KEY (idCategorie) REFERENCES Categorie(id)
);
CREATE TABLE Commentaire (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contenu TEXT NOT NULL,
  date_commentaire DATE,
  idUser INT NOT NULL,
  idArticle INT,
  FOREIGN KEY (idUser) REFERENCES Utilisateur(id),
  FOREIGN KEY (idArticle) REFERENCES Article(id)
);