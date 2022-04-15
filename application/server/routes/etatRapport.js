const con = require("../db_config/db");

async function getAllEtatRapports() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT id_club, nom, group_concat(Id_Rapport) AS Rapports, group_concat(etat) AS Etats" +
            " FROM rapport NATURAL JOIN club" +
            " GROUP BY id_club;"

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

module.exports = getAllEtatRapports;
