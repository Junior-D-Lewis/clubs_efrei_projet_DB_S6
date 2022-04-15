DROP DATABASE IF EXISTS clubs_efrei;
create database clubs_efrei;
use clubs_efrei;
CREATE TABLE Type_Club(
   Id_Type INT auto_increment,
   libelle_Type VARCHAR(50),
   PRIMARY KEY(Id_Type)
) engine = InnoDB;

CREATE TABLE Membres(
   numero_Et VARCHAR(10),
   nom VARCHAR(50) NOT NULL,
   genre VARCHAR(10) NOT NULL,
   classe VARCHAR(10) NOT NULL,
   niveau INT NOT NULL,
   date_naissance DATE NOT NULL,
   PRIMARY KEY(numero_Et)
) engine = InnoDB;

CREATE TABLE responsabilite(
   Id_responsabilite  INT auto_increment,
   libelle_res VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_responsabilite)
) engine = InnoDB;

CREATE TABLE Type_Evenement(
   Id_Type  INT auto_increment,
   libelle_Type VARCHAR(50),
   PRIMARY KEY(Id_Type)
) engine = InnoDB;

CREATE TABLE Calendrier(
   Id_Calendrier  INT auto_increment,
   libelle_cal VARCHAR(20) NOT NULL,
   PRIMARY KEY(Id_Calendrier)
) engine = InnoDB;

CREATE TABLE Affectation_Entrees_Argent(
   Id_Affectation_Entrees_Argent  INT auto_increment,
   montant DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(Id_Affectation_Entrees_Argent)
) engine = InnoDB;

CREATE TABLE Taches(
   Id_Taches  INT auto_increment,
   description_taches VARCHAR(200),
   numero_Et VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Taches),
   FOREIGN KEY(numero_Et) REFERENCES Membres(numero_Et)
) engine = InnoDB;

CREATE TABLE Sanctions(
   Id_Sanctions  INT auto_increment,
   libelle_sanction VARCHAR(100) NOT NULL,
   PRIMARY KEY(Id_Sanctions)
) engine = InnoDB;

CREATE TABLE Provenance(
   Id_Provenance  INT auto_increment,
   libelle VARCHAR(50),
   PRIMARY KEY(Id_Provenance)
) engine = InnoDB;

CREATE TABLE Club(
   id_club  INT auto_increment,
   nom VARCHAR(50) NOT NULL,
   description VARCHAR(200) NOT NULL,
   date_de_creation DATE NOT NULL,
   Id_Type INT NOT NULL,
   PRIMARY KEY(id_club),
   FOREIGN KEY(Id_Type) REFERENCES Type_Club(Id_Type)
) engine = InnoDB;

CREATE TABLE Evenement(
   Id_Evenement  INT auto_increment,
   nom VARCHAR(50) NOT NULL,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   heure_debut TIME NOT NULL,
   heure_fin TIME NOT NULL,
   budget DECIMAL(15,2) NOT NULL,
   Id_Type INT NOT NULL, 
   PRIMARY KEY(Id_Evenement),
   FOREIGN KEY(Id_Type) REFERENCES Type_Evenement(Id_Type)
) engine = InnoDB;

CREATE TABLE depenses(
   code_depense INT auto_increment,
   montant DECIMAL(15,2) NOT NULL,
   Id_Taches INT NOT NULL,
   PRIMARY KEY(code_depense),
   FOREIGN KEY(Id_Taches) REFERENCES Taches(Id_Taches)
) engine = InnoDB;

CREATE TABLE Recompenses(
   Id_Recompenses  INT auto_increment,
   libelle VARCHAR(50) NOT NULL,
   Id_Provenance INT NOT NULL,
   PRIMARY KEY(Id_Recompenses),
   FOREIGN KEY(Id_Provenance) REFERENCES Provenance(Id_Provenance)
) engine = InnoDB;

CREATE TABLE Rapport(
   Id_Rapport  INT auto_increment,
   rediger_Par VARCHAR(10) NOT NULL,
   signe_Par VARCHAR(10),
   etat VARCHAR(20),
   annee DATE NOT NULL,
   id_club INT NOT NULL,
   PRIMARY KEY(Id_Rapport),
   FOREIGN KEY(id_club) REFERENCES Club(id_club)
) engine = InnoDB;

CREATE TABLE Comite_Organisation(
   Id_Comite_Organisation  INT auto_increment,
   date_creation DATE NOT NULL,
   date_dissolution DATE NOT NULL,
   Id_Affectation_Entrees_Argent INT NOT NULL,
   Id_Calendrier INT NOT NULL,
   code_depense INT NOT NULL,
   Id_Evenement INT NOT NULL,
   PRIMARY KEY(Id_Comite_Organisation),
   UNIQUE(Id_Evenement),
   FOREIGN KEY(Id_Affectation_Entrees_Argent) REFERENCES Affectation_Entrees_Argent(Id_Affectation_Entrees_Argent),
   FOREIGN KEY(Id_Calendrier) REFERENCES Calendrier(Id_Calendrier),
   FOREIGN KEY(code_depense) REFERENCES depenses(code_depense),
   FOREIGN KEY(Id_Evenement) REFERENCES Evenement(Id_Evenement)
) engine = InnoDB;

CREATE TABLE Appartenir(
   id_club INT,
   numero_Et VARCHAR(10),
   date_Adhesion DATE,
   PRIMARY KEY(id_club, numero_Et),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(numero_Et) REFERENCES Membres(numero_Et)
) engine = InnoDB;

CREATE TABLE Affecter(
   id_club INT,
   numero_Et VARCHAR(10),
   Id_responsabilite INT,
   date_Debut DATE,
   date_Fin DATE,
   PRIMARY KEY(id_club, numero_Et, Id_responsabilite),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(numero_Et) REFERENCES Membres(numero_Et),
   FOREIGN KEY(Id_responsabilite) REFERENCES responsabilite(Id_responsabilite)
) engine = InnoDB;

CREATE TABLE Constituer(
   numero_Et VARCHAR(10),
   Id_responsabilite INT,
   Id_Comite_Organisation INT,
   PRIMARY KEY(numero_Et, Id_responsabilite, Id_Comite_Organisation),
   FOREIGN KEY(numero_Et) REFERENCES Membres(numero_Et),
   FOREIGN KEY(Id_responsabilite) REFERENCES responsabilite(Id_responsabilite),
   FOREIGN KEY(Id_Comite_Organisation) REFERENCES Comite_Organisation(Id_Comite_Organisation)
) engine = InnoDB;

CREATE TABLE Subir(
   id_club INT,
   Id_Sanctions INT,
   date_Santence DATE NOT NULL,
   PRIMARY KEY(id_club, Id_Sanctions),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(Id_Sanctions) REFERENCES Sanctions(Id_Sanctions)
) engine = InnoDB;

CREATE TABLE Gagner(
   id_club INT,
   Id_Recompenses INT,
   date_gain DATE,
   PRIMARY KEY(id_club, Id_Recompenses),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(Id_Recompenses) REFERENCES Recompenses(Id_Recompenses)
) engine = InnoDB;

CREATE TABLE Signer(
   numero_Et VARCHAR(10),
   Id_Rapport INT,
   date_Signature DATE NOT NULL,
   PRIMARY KEY(numero_Et, Id_Rapport),
   FOREIGN KEY(numero_Et) REFERENCES Membres(numero_Et),
   FOREIGN KEY(Id_Rapport) REFERENCES Rapport(Id_Rapport)
) engine = InnoDB;

CREATE TABLE organiser(
   id_club INT,
   Id_Evenement INT,
   PRIMARY KEY(id_club, Id_Evenement),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(Id_Evenement) REFERENCES Evenement(Id_Evenement)
) engine = InnoDB;
