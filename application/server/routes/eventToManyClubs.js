const con = require("../db_config/db");

async function getAllEventToManyClubs() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT DISTINCT E.Id_Evenement, E.nom, GROUP_CONCAT( M.nom) AS Responsable, GROUP_CONCAT(R.libelle_res)  As Poste, DATEDIFF( CO.date_dissolution, CO.date_creation) AS Durrée_Comite" +
            " FROM evenement AS E, comite_organisation AS CO, constituer AS C, membres AS M, responsabilite AS R" +
            " WHERE E.Id_Evenement IN ( SELECT Id_Evenement" +
            " FROM organiser" +
            " GROUP BY Id_Evenement" +
            " HAVING COUNT(Id_Evenement)>1" +
            " ORDER BY Id_Evenement) AND CO.Id_Evenement = E.Id_Evenement AND C.Id_Comite_Organisation = CO.Id_Comite_Organisation " +
            " AND C.numero_Et = M.numero_Et AND C.Id_responsabilite = R.Id_responsabilite AND NOT R.libelle_res = 'membre'" +
            " GROUP BY E.Id_Evenement;";

            console.log(query);

            con.query(query, (err, results) => {
                if (err) reject(new Error(err.message));
                resolve(results);
            })
        });
        // console.log(response);
        return response;
    } catch (error) {
        console.log(error);
    }
}

module.exports = getAllEventToManyClubs;
