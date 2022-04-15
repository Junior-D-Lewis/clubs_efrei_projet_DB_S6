use clubs_efrei;

/*Add data to Type_Club*/
INSERT INTO `type_club` (`libelle_Type`) 
VALUES ('culturel'), ('technique'), ('sportif'), ('entrepreneurial');

/*Add data to Type_Evenement*/
INSERT INTO `type_evenement` (`libelle_Type`)
VALUES('formation'),('workshop') , ('soirée'), ('bootcamp'), ('hackathon');

/*Add data to responsabilite*/
INSERT INTO `responsabilite` (`libelle_res`)
VALUES('president'),('secretaire général'),('vice-président'),('tresorier'),('membre');

/*Add data to Membres*/
INSERT INTO `membres` (`numero_Et`, `nom`, `genre`, `classe`, `niveau`, `date_naissance`)
VALUES ('20211058','Junior Lewis','M','B009',3,'2000-01-01'),
('20211059','Jean Toscanelli','M','A404',4,'2000-01-01'),
('20211060','Mathieu Roger','M','B009',1,'2000-01-01'),
('20211061','Andre Abel','M','C001',2,'2000-01-01'),
('20211062','Laurine Miss','F','A404',3,'2000-01-01'),
('20211063','Laure Ndagleu','F','COO1',5,'2000-01-01'),
('20211064','Hinata Hyuga','F','E105',3,'2000-01-01'),
('20211065','Naruto Uzumaki','M','F005',4,'2000-01-01'),
('20211066','Sasuke Uchiwa','M','A314',2,'2000-01-01'),
('20211067','Kushina Uzumaki','F','D002',1,'2000-01-01'),
('20211068','Monkey D Luffy','M','BOO9',5,'2000-01-01'),
('20211069','Théophile Dal','M','E005',3,'2000-01-01'),
('20211070','Lisa Marine','F','C004',3,'2000-01-01'),
('20211071','Brendaline Flore','F','B001',5,'2000-01-01'),
('20211072','Cabrel Tayo','M','B001',5,'2000-01-01'),
('20211073','Jin Jerkey','M','B104',4,'2000-01-01'),
('20211074','Victoire Salmon','F','C004',2,'2000-01-01'),
('20211075','Elodie Bouisset','F','A101',1,'2000-01-01'),
('20211076','Rachelle Emmet','F','E105',1,'2000-01-01'),
('20211077','Anoushka Serouis','F','B003',3,'2000-01-01'),
('20211078','Edouard Erwin','M','C001',1,'2000-01-01'),
('20211079','Kaneki Ken','M','B009',1,'2000-01-01');

/*Add data to Calendrier */
INSERT INTO `calendrier` (`libelle_cal`)
VALUES('janvier'),('février'),('mars'),('avril'),('mai'),('juin'),
('juillet'),('août'),('septembre'),('octobre'),('novembre'),('décembre');

/* Add data to Club*/
INSERT INTO `club` ( `nom`, `description`, `date_de_creation`, `id_Type`)
VALUES('Efrei Basket',"Club de basket de l'Efrei",'2020-01-01','3'),
('Efrei Foot',"Club de foot de l'école Efrei",'2020-01-01','3'),
('EfreiStyle',"Club de danse de l'école Efrei",'2020-01-01','3'),
('EfreiKa',"Club regroupant  des different etudiant  de l'école Efrei",'2020-01-01','1'),
('efreipop',"club de regroupement des fan de kpop",'2020-01-03','2'),
('efreimode',"club de couture et de mode",'2020-01-01','2'),
('efreiotaku',"club regroupent les fan de manga et de culture japonaise",'2020-01-01','3'),
('efreirubbi',"club regroupent les joueurs de rubbie",'2020-01-01','2'),
('efreiart',"club regroupent tout les artistes en art de dessin et de  peinture",'2020-01-01','3'),
('efreiufc',"club regroupement de des amoreux des arcs martiaux",'2020-01-01','2');

/*Add data to Evenement*/
INSERT INTO `evenement` (`nom`, `date_debut`, `date_fin`, `heure_debut`, `heure_fin`, `Id_Type`, `budget`)
VALUES ('Soliweeks', '2022-04-03', '2022-04-20', '10:30:00', '16:00:00', 1, 5000),
('Visite de Microsoft', '2020-01-03', '2022-05-01', '08:30:00', '13:00:00', 2, 3800),
('Formation React Js', '2021-03-03', '2022-04-04', '10:30:00', '15:00:00', 3, 7000),
('Mastercamp', '2021-05-03', '2022-06-03', '09:30:00', '17:00:00', 4, 2000),
('Blue nigth', '2019-06-03', '2023-07-15', '11:30:00', '18:00:00', 5, 100),
('First day', '2022-07-03', '2022-07-17', '12:30:00', '19:00:00', 3, 600),
('Remise de diplome', '2021-08-03', '2022-10-28', '11:30:00', '13:00:00', 2, 5700),
('Soutenance', '2020-09-03', '2022-05-30', '10:30:00', '14:00:00', 5, 860),
('Acceuil', '2021-10-03', '2022-04-26', '08:30:00', '12:00:00', 1, 950),
('JPO', '2020-11-03', '2022-06-21', '09:30:00', '15:00:00', 5, 110),
('Hallowin', '2021-12-03', '2022-07-17', '15:30:00', '14:00:00', 3, 11700),
('Bitmake', '2021-03-03', '2022-06-24', '13:30:00', '13:00:00', 2, 3250),
('Journée internationnale', '2018-04-03', '2022-08-25', '11:30:00', '12:00:00', 1, 3000);


 /*add data to  Affectation_Entrees_Argent*/
INSERT INTO Affectation_Entrees_Argent( `montant`)
 VALUES(3500),(4000),(4500),(5000),(5500),(6000),
(6500),(7000),(7500),(8000),(8500),(9000),(9500),(10000);

/* add data to Tache*/
INSERT INTO `taches` ( `description_taches`, `numero_Et`) 
VALUES ('Acceuillir les L3 Afrique', '20211058'),
('Visite du Musé du Louvre', '20211059'),
('Visite de Microsoft', '20211060'),
('Election du BDE', '20211061'),
('Achat des équipement de basket', '20211062'),
('Gestion du stock de PC', '20211063'),
('Collecte des données pour Horizon', '20211064'),
('Conception du SI des Associations', '20211065'),
('Organisation de la formation JAVA', '20211066'),
('Cours de soutiens Python', '20211067'),
('Remise a niveau en VHDL', '20211068'),
('Orientation vers les majeurs', '20211069'),
('Aide a la redaction des CV', '20211070'),
('Guide pour les alternances', '20211071'),
('Organisation des rendonnées', '20211072');

/* add data to Sanctions */
INSERT INTO `sanctions` ( `libelle_sanction`)
VALUES ('Avertissement'),
('Mise en prison'),
('Ambargo'),
('Bannissement temporaire'),
('Bannissement permanent'),
('Bannissement de la ville'),
('Amende'),
('Disolution'),
('Discipation');

/* add data to Provenance */
INSERT INTO `provenance` ( `libelle`)
VALUES ('Efrei'),('Ecole'),('Club'),('Association'),('Banque'),('Entreprise'),('Mairie'),('Partenaire');

/* add data to depenses */
INSERT INTO `depenses` ( `montant`, `Id_Taches`)
VALUES (3500, 1),(4000, 2),(4500, 3),(5000, 4),(5500, 5),(6000, 6),(6500, 7),(7000, 8),
(7500, 9),(8000, 10),(8500, 11),(9000, 12),(9500, 13),(10000, 14);

/* add data to Récompenses*/
INSERT INTO `recompenses` ( `libelle`, `Id_Provenance`)
VALUES ("Subvention de l'Ecole", 1),('Subvention du Club', 2),
("Subvention de l'Association", 3),('Subvention de la Banque', 4),
("Subvention de l'Entreprise", 5),('Subvention de la Mairie', 6),
("Subvention de l'Autre", 7),('Bourse du Partenaire', 8),
("Bourse de l'Entreprise", 5),('Bourse de la Mairie', 6);

/* add data to Rapport */
INSERT INTO `rapport` ( `rediger_Par`, `signe_Par`, `etat`, `annee`, `id_club`)
VALUES('20211058', '20211058', 'Signé', '2022-01-05', 1),
('20211059', '20211059', 'Non signé', '2022-03-05', 2),
('20211060', '20211060', 'Non signé', '2022-02-15', 3),
('20211061', '20211061', 'signé', '2022-01-09', 4),
('20211062', '20211062', 'signé', '2022-02-02', 5),
('20211063', '20211063', 'signé', '2022-03-14', 6),
('20211066', '20211066', 'Non signé', '2022-01-11', 9),
('20211067', '20211067', 'Non signé', '2022-02-13', 10),
('20211068', '20211068', 'signé', '2022-03-18', 4),
('20211069', '20211069', 'Non signé', '2022-04-03', 2),
('20211070', '20211070', 'signé', '2022-02-01', 3),
('20211071', '20211071', 'signé', '2022-01-25', 4),
('20211072', '20211072', 'Non signé', '2022-03-01', 5);

/* add data to Comite_Organisation*/
INSERT INTO `comite_organisation` ( `date_creation`, `date_dissolution`, `Id_Affectation_Entrees_Argent`, `Id_Calendrier`,`code_depense`, `Id_Evenement`)
VALUES('2020-06-10', '2022-01--10', 1, 7, 5, 1),
('2019-01-21', '2020-01--21', 12, 2, 2, 2),
('2019-02-13', '2020-01--13', 2, 3, 3, 3),
('2021-03-11', '2021-06--11', 3, 4, 4, 4),
('2020-04-26', '2021-01--26', 4, 5, 5, 5),
('2020-05-17', '2022-01--17', 5, 6, 3, 6),
('2020-06-10', '2022-01--10', 6, 7, 7, 7),
('2020-07-15', '2024-01--15', 7, 8, 8, 8),
('2020-08-29', '2024-01--29', 8, 9, 3, 9),
('2020-09-03', '2024-01--31', 11, 12, 7, 11);

/* add data to Appartenir*/

INSERT INTO `appartenir` ( `id_club`, `numero_Et`, `date_Adhesion`)
VALUES(1, '20211058', '2019-01-01'),(3, '20211058', '2022-01-01'),(6, '20211058', '2020-01-01'),
(2, '20211059', '2020-01-01'),(7, '20211059', '2020-01-01'),(1, '20211059', '2017-01-01'),(9, '20211059', '2021-01-01'),
(3, '20211060', '2020-01-01'),(8, '20211060', '2020-01-01'),(7, '20211060', '2017-01-01'),
(4, '20211061', '2020-01-01'),(9, '20211061', '2020-01-01'),(8, '20211061', '2017-01-01'),
(5, '20211062', '2021-01-01'),(10, '20211062', '2020-01-01'),(2, '20211062', '2017-01-01'),
(6, '20211063', '2021-01-01'),(1, '20211063', '2020-01-01'),(4, '20211063', '2017-01-01'),
(7, '20211064', '2021-01-01'),(2, '20211064', '2020-01-01'),(6, '20211064', '2017-01-01'),
(8, '20211065', '2018-01-01'),(3, '20211065', '2022-01-01'),(1, '20211065', '2017-01-01'),
(9, '20211066', '2018-01-01'),(4, '20211066', '2022-01-01'),(5, '20211066', '2020-01-01'),(6, '20211066', '2019-01-01'),
(10, '20211067', '2018-01-01'),(5, '20211067', '2022-01-01'),
(1, '20211068', '2018-01-01'),(6, '20211068', '2022-01-01'),
(2, '20211069', '2018-01-01'),(7, '20211069', '2022-01-01'),
(3, '20211070', '2018-01-01'),(8, '20211070', '2022-01-01'),
(4, '20211071', '2018-01-01'),(9, '20211071', '2022-01-01'),
(5, '20211072', '2020-01-01'),(10, '20211072', '2022-01-01'),(3, '20211072', '2020-01-01');

/* add data to Organiser */
INSERT INTO organiser(`id_club`,  `Id_Evenement`)
VALUES (1,1),(1,3),(3,2),(9,2),(10,5),(2,6),(4,7),(5,8),(6,9),(7,10),(8,11),(4,12),(7,13),(7,3);

/* add data to Affecter*/
INSERT INTO `affecter` ( `id_club`, `numero_Et`, `Id_responsabilite`, `date_Debut`, `date_Fin`)
VALUES(1, '20211058', 1, '2019-01-01', '2020-01-01'),(3, '20211058', 1, '2019-01-01', '2020-01-01'),
(2, '20211059', 2, '2020-01-01', '2021-01-01'),(3, '20211060', 1, '2020-01-01', '2021-01-01'),
(4, '20211061', 3, '2020-01-01', '2021-01-01'),(5, '20211062', 2, '2020-01-01', '2021-01-01'),
(6, '20211063', 4, '2020-01-01', '2021-01-01'),(7, '20211064', 3, '2020-01-01', '2021-01-01'),
(8, '20211065', 5, '2020-01-01', '2021-01-01'),(9, '20211066', 4, '2020-01-01', '2021-01-01'),
(10, '20211067', 5, '2020-01-01', '2021-01-01'),(1, '20211068', 5, '2020-01-01', '2021-01-01'),
(3, '20211068', 5, '2020-01-01', '2021-01-01'),(8, '20211061', 3, '2020-01-01', '2021-01-01');

/* add data to Constituer*/
INSERT INTO `constituer` ( `numero_Et`, `Id_responsabilite`, `Id_Comite_Organisation`)
VALUES('20211058', 1, 1),('20211059', 2, 2),('20211060', 1, 3),('20211061', 3, 4),
('20211062', 2, 5),('20211063', 4, 6),('20211064', 3, 7),('20211065', 5, 8),
('20211066', 4, 9),('20211067', 5, 10),('20211068', 5, 1),('20211069', 4, 2),
('20211070', 5, 3),('20211071', 5, 4),('20211072', 5, 5),
('20211066', 4, 4),('20211067', 5, 5),('20211068', 5, 5);

/* add data to Subir*/
INSERT INTO `subir` ( `id_club`, `Id_Sanctions`, `date_Santence`)
VALUES (1, 1, '2019-01-01'),(1, 5, '2020-01-01'),
(2, 2, '2020-01-01'),(2, 4, '2020-01-01'),
(3, 1, '2020-01-01'),(3, 5, '2020-01-01'),
(4, 3, '2020-01-01'),(4, 5, '2020-01-01'),
(5, 2, '2020-01-01'),(5, 5, '2020-01-01'),
(6, 4, '2020-01-01'),
(7, 3, '2020-01-01'),(7, 5, '2020-01-01'),
(8, 5, '2020-01-01'),
(9, 4, '2020-01-01'),
(10, 5, '2020-01-01');

/* add data to Gagner*/
INSERT INTO `gagner` ( `id_club`, `Id_Recompenses`, `date_gain`)
VALUES (1, 1, '2019-01-01'),(1, 3, '2020-01-01'),
(2, 5, '2020-01-01'),(2, 7, '2020-01-01'),
(3, 1, '2020-01-01'),(3, 5, '2020-01-01'),
(4, 3, '2020-01-01'),(4, 5, '2020-01-01'),
(5, 2, '2020-01-01'),(5, 5, '2020-01-01'),
(6, 4, '2020-01-01'),
(7, 3, '2020-01-01'),(7, 5, '2020-01-01'),
(8, 5, '2020-01-01'),
(9, 4, '2020-01-01'),
(10, 1, '2020-01-01');

/* add data to Signer*/
INSERT INTO `signer` ( `numero_Et`, `Id_Rapport`, `date_Signature`)
VALUES ('20211058', 1, '2022-01-19'),('20211059', 2, '2020-10-18'),('20211060', 1, '2020-05-20'),
('20211061', 3, '2021-09-11'),('20211062', 2, '2021-11-27'),('20211063', 4, '2022-03-30'),
('20211064', 3, '2022-01-01'),('20211065', 5, '2021-06-16'),('20211066', 4, '2022-02-21'),
('20211067', 5, '2022-04-08'),('20211068', 5, '2021-11-24'),('20211069', 4, '2021-12-28'),
('20211070', 5, '2022-04-01'),('20211071', 5, '2021-08-13'),('20211072', 5, '2021-10-18');