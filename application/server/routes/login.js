const con = require("../db_config/db");

async function loginRouter(numero_Et){
    console.log("loginRouter");
    console.log(numero_Et);
        try{
            const response = await new Promise((resolve, reject) => {
                const query = "SELECT * FROM membres WHERE numero_Et= ?" ;
               
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

module.exports = loginRouter;