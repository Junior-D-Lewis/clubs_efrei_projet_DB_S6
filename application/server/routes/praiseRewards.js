const con = require("../db_config/db");

async function getAllPraiseRewards() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT DISTINCT R.libelle, GROUP_CONCAT(C.nom) AS Allouee_A, P.libelle AS Provient_De" +
            " FROM gagner AS G, recompenses AS R, club AS C, provenance AS P" +
            " WHERE G.Id_Recompenses = R.Id_Recompenses AND G.id_club = C.id_club AND R.Id_Provenance = P.Id_Provenance" +
            " GROUP BY R.libelle" +
            " ORDER BY R.libelle;"

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

module.exports = getAllPraiseRewards;
