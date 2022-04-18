const con = require("../db_config/db");

async function getAllStudentsToManyClubs() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT M.numero_Et, M.nom,group_concat( C.nom) AS Club, group_concat(R.libelle_res) AS Position" +
            " FROM affecter AS A INNER JOIN membres AS M ON A.numero_Et = M.numero_Et INNER JOIN responsabilite AS R " +
            " ON R.Id_responsabilite = A.Id_responsabilite INNER JOIN club AS C ON C.id_club = A.id_club"+
            " GROUP BY numero_Et"+
            " HAVING COUNT(A.numero_Et) > 1;"

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

module.exports = getAllStudentsToManyClubs;
