const con = require("../db_config/db");

async function getOneFaineant(nom_club) {
    console.log("ok je suis dans getOneFaineant " + nom_club + " son type est " + typeof nom_club);
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT * FROM faineant WHERE nom_club LIKE '%" + nom_club +"%';" ;
           console.log(query)

            con.query(query, (err, results) => {
                if (err) reject(new Error(err.message));
                resolve(results);
            })
        });
        //console.log(response)
        return response;
    } catch (error) {
        console.log(error);
    }
}

module.exports = getOneFaineant;
