const con = require("../db_config/db");

async function getAllEvenements() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT  E.Id_evenement, E.nom, E.date_debut, CO.Id_Comite_Organisation, E.budget,  D.montant as Montant_depenses, group_concat(M.nom) AS Membres_Comite"+
            " From evenement as E natural join comite_Organisation as CO, depenses as D, membres AS M, constituer AS C"+
            " Where CO.code_depense = D.code_depense and CO.Id_Comite_Organisation = C.Id_Comite_Organisation"+
            " and C.numero_Et = M.numero_Et and E.date_debut between '2021-01-01' and '2022-01-01' "+
            " group by E.Id_evenement;"

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

module.exports = getAllEvenements;
