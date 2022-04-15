const con = require("../db_config/db");

async function getAllVautMieuxAcheter() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "select * from vaut_mieux_acheter;";

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

module.exports = getAllVautMieuxAcheter;
