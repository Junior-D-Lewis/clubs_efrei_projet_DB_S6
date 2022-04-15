const con = require("../db_config/db");

async function getAllExpensiveStains(numero_Et){
    console.log("loginRouter");
    console.log(numero_Et);
        try{
            const response = await new Promise((resolve, reject) => {
                const query = "SELECT T.description_taches, D.montant AS Prix, M.nom AS Responsable" +
                " FROM taches AS T, membres AS M, depenses AS D" +
                " WHERE T.Id_Taches = D.Id_Taches AND M.numero_Et = T.numero_Et" +
                " ORDER BY D.montant DESC" +
                " LIMIT 10;" ;
               
                con.query(query, [numero_Et], (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });
            return response;
        }
        catch(err){
            console.log(err);
            res.status(500).send("Erreur serveur");
        }
}

module.exports = getAllExpensiveStains;
;