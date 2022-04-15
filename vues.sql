/*
1. Créer une vue appelée « top_clubs » qui permet de donner la liste des clubs qui
respectent toujours leur budget (dont la dépense est inférieure au budget et aux
rentrées d’argent).
*/

CREATE VIEW top_clubs AS
	select nom, description, date_de_creation as Cree_le 
	from club natural join organiser 
	where organiser.Id_Evenement in (select E.Id_Evenement
	from comite_organisation as CO, evenement as E, depenses as D, affectation_entrees_argent as A
	where CO.Id_Evenement = E.Id_Evenement and CO.code_depense = D.code_depense 
	and CO.Id_Affectation_Entrees_Argent = A.Id_Affectation_Entrees_Argent
	and D.montant < E.budget and D.montant < A.montant);

/*
2. Créer une vue appelée « top_présidents » qui les présidents de clubs qui rédigent le
rapport d’activité dans les délais les plus courts.
*/

CREATE VIEW president AS
	SELECT DISTINCT(C.id_Club), C.nom, C.description, TC.libelle_Type as Type_Club, M.numero_Et, M.nom as President, M.classe, M.niveau 
	from affecter as A, club as C, type_club as TC, membres as M, responsabilite AS R
	where C.Id_Type = TC.Id_Type and C.id_Club = A.id_Club and A.numero_Et = M.numero_Et and  A.id_responsabilite = R.id_responsabilite and R.libelle_res = 'president'
	order by id_Club;

CREATE VIEW top_présidents AS
SELECT DISTINCT  nom, description, Type_Club, President, annee
FROM president NATURAL JOIN rapport 
WHERE DATEDIFF(annee,'2022-01-01')  < 10 ;


/*
3. Créer une vue appelée « aujourd’hui », qui donne la liste des évènements prévus
pour aujourd’hui, classés par horaire, et en indiquant le (ou les) clubs responsables.
*/

CREATE VIEW aujourd_hui AS
	select evenement.nom, group_concat(club.nom) as Club_Responsable, heure_debut
	from evenement natural join organiser natural join club
	where date_debut = current_date()
	group by  evenement.nom
	order by heure_debut;

/*
4. Créer une vue appelée « fainéant », qui donne le nom du membre du comité
d’organisation d’un club donné qui signe le rapport en dernier.
*/
CREATE VIEW faineant AS
    select distinct M.numero_Et, M.nom as nom_membre, S.date_signature, C.nom as nom_club
    from signer as S natural join membres as M, club as C, appartenir as A
    where M.numero_Et in (select numero_Et from constituer natural join comite_organisation) and
    A.id_club = C.id_club and A.numero_Et = M.numero_Et
    group by C.nom
    order by date_signature desc;

/*
5. Créer une vue appelée « trouble_fête », qui donne le nom du club ayant eu le plus
de sanctions.
*/

 CREATE VIEW trouble_fete AS
 	SELECT nom, COUNT(*) AS nombre_sanction 
 	FROM club C INNER JOIN  subir S ON C.id_club = S.id_club
 	GROUP BY nom
 	ORDER BY nombre_sanction DESC
 	LIMIT 0,1;
 

/*
6. Créer une vue appelée « vaut_mieux_acheter » qui donne les tâches de type
« location » les plus coûteuses.
*/

CREATE VIEW vaut_mieux_acheter AS
	SELECT description_taches,  montant 
	FROM 
	taches NATURAL JOIN depenses
	WHERE description_taches LIKE '%location%' AND montant = (SELECT MAX(montant) FROM depenses);

/*
7. Créer une vue appelée « teachers_pet » qui donne le nom du club ayant eu le plus
de récompenses de la part de l’administration.
*/

CREATE VIEW teachers_pet AS
	SELECT nom, P.libelle, COUNT(*) AS nombre_recompense 
	FROM club C INNER JOIN  gagner AS G ON C.id_club = G.id_club INNER JOIN recompenses AS R 
	ON G.Id_Recompenses = R.Id_Recompenses INNER JOIN provenance AS P on R.Id_Provenance = P.Id_Provenance
	WHERE P.libelle = 'administration'
	GROUP BY nom
	ORDER BY nombre_recompense DESC
	LIMIT 0,1;

/*
8. Créer une vue appelée « perf » qui donne, pour un club donné, la liste de tous ses
présidents classés par date, avec pour chacun les évènements qu’il a organisé,
l’argent qu’il a pu obtenir du sponsoring, le temps pris pour la rédaction du rapport,
et les récompenses et sanctions obtenues pendant son mandat.
*/

CREATE VIEW perf AS
	SELECT M.numero_Et, M.nom, C.nom AS Club, A.date_Debut, R.libelle_res AS POSTE
	FROM affecter AS A INNER JOIN club AS C ON C.id_club = A.id_club INNER JOIN membres AS M 
	ON A.numero_Et = M.numero_Et INNER JOIN responsabilite AS R ON A.Id_responsabilite = R.Id_responsabilite
	WHERE R.libelle_res = 'president'
	ORDER BY A.date_Debut DESC;