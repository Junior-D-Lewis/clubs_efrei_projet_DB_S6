use clubs_efrei;

/*
 1. Afficher la liste de tous les clubs de Efrei en précisant leur type, président et 
description. Les informations relatives au président doivent aussi être affichées, 
notamment son nom, classe et niveau et numéro étudiant.
 */

SELECT DISTINCT(C.id_Club), C.nom, C.description, TC.libelle_Type as Type_Club, M.numero_Et, M.nom as President, M.classe, M.niveau 
from affecter as A, club as C, type_club as TC, membres as M, responsabilite AS R
where C.Id_Type = TC.Id_Type and C.id_Club = A.id_Club and A.numero_Et = M.numero_Et and  A.id_responsabilite = R.id_responsabilite and R.libelle_res = 'president'
order by id_Club;

/*
2. Afficher la liste des évènements qui ont eu lieu l’année passée, avec leur comité 
d’organisation, budget alloué et dépenses
*/

SELECT  E.Id_evenement, E.nom, E.date_debut, CO.Id_Comite_Organisation, E.budget,  D.montant as Montant_depenses, group_concat(M.nom) AS Membres_Comite
From evenement as E natural join comite_Organisation as CO, depenses as D, membres AS M, constituer AS C
Where CO.code_depense = D.code_depense and CO.Id_Comite_Organisation = C.Id_Comite_Organisation
and C.numero_Et = M.numero_Et and E.date_debut between '2021-01-01' and '2022-01-01'
group by E.Id_evenement;

/*
3. Afficher l’état des rapports d’activité de chaque club.
*/

SELECT id_club, nom, group_concat(Id_Rapport) AS Rapports, group_concat(etat) AS Etats
FROM rapport NATURAL JOIN club
GROUP BY id_club;

/*
4. Pour les rapports en cours de signature, afficher la liste des membres qui n’ont pas 
encore signé.
*/

SELECT Id_rapport, GROUP_CONCAT(nom) As Membres, GROUP_CONCAT(classe) AS Classe, GROUP_CONCAT(niveau) AS Niveau
FROM signer NATURAL JOIN membres NATURAL JOIN rapport
WHERE etat = 'Non signé' 
GROUP BY Id_rapport;

/*
5. Afficher les étudiants qui participent à plus d’un seul club, en indiquant le nom du 
club et leur position au sein de celui-ci (s'ils n'ont pas de responsabilité, la position 
doit simplement mentionner membre).
*/

SELECT M.numero_Et, M.nom, group_concat( C.nom) AS Club, group_concat(R.libelle_res) AS Position
FROM affecter AS A INNER JOIN membres AS M ON A.numero_Et = M.numero_Et INNER JOIN responsabilite AS R 
ON R.Id_responsabilite = A.Id_responsabilite INNER JOIN club AS C ON C.id_club = A.id_club
GROUP BY numero_Et
HAVING COUNT(A.numero_Et) > 1;

/*
6. Afficher la liste des dix tâches les plus coûteuses, avec leurs prix, et responsable.
*/

SELECT T.description_taches, D.montant AS Prix, M.nom AS Responsable
FROM taches AS T, membres AS M, depenses AS D
WHERE T.Id_Taches = D.Id_Taches AND M.numero_Et = T.numero_Et
ORDER BY D.montant DESC
LIMIT 10;

/*
7. Donner les évènements communs à plusieurs clubs, avec la liste de leurs 
responsables, et leurs affectations.
*/

SELECT DISTINCT E.Id_Evenement, E.nom, GROUP_CONCAT( M.nom) AS Responsable, GROUP_CONCAT(R.libelle_res)  As Poste, DATEDIFF( CO.date_dissolution, CO.date_creation) AS Durrée_Comite
FROM evenement AS E, comite_organisation AS CO, constituer AS C, membres AS M, responsabilite AS R
WHERE E.Id_Evenement IN ( SELECT Id_Evenement
FROM organiser 
GROUP BY Id_Evenement
HAVING COUNT(Id_Evenement)>1
ORDER BY Id_Evenement ) AND CO.Id_Evenement = E.Id_Evenement AND C.Id_Comite_Organisation = CO.Id_Comite_Organisation 
AND C.numero_Et = M.numero_Et AND C.Id_responsabilite = R.Id_responsabilite AND NOT R.libelle_res = "membre"
GROUP BY E.Id_Evenement;

/*
8. Afficher la liste des récompenses allouées à chaque club, ainsi que leurs 
provenances.
*/

SELECT DISTINCT R.libelle, GROUP_CONCAT(C.nom) AS Allouee_A, P.libelle AS Provient_De
FROM gagner AS G, recompenses AS R, club AS C, provenance AS P
WHERE G.Id_Recompenses = R.Id_Recompenses AND G.id_club = C.id_club AND R.Id_Provenance = P.Id_Provenance
GROUP BY R.libelle
ORDER BY R.libelle;

/* liste des membres du club  de type donnée*/

select membres.numero_Et, membres.nom, club.nom 
FROM appartenir inner join membres on appartenir.numero_Et= membres.numero_Et, club inner join type_club
on type_club.Id_type = club.Id_type
where type_club.libelle_Type = 'sportif';
