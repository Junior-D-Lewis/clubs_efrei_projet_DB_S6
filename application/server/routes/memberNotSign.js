const con = require("../db_config/db");

async function getAllMember() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT Id_rapport, GROUP_CONCAT(nom) As Membres, GROUP_CONCAT(classe) AS Classe, GROUP_CONCAT(niveau) AS Niveau" +
            " FROM signer NATURAL JOIN membres NATURAL JOIN rapport" +
            " WHERE etat = 'Non signé'" +
            " GROUP BY Id_rapport;"

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

module.exports = getAllMember;
