const con = require("../db_config/db");

async function getAllFaineant() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT * FROM faineant" ;
           
            con.query(query, (err, results) => {
                if (err) reject(new Error(err.message));
                resolve(results);
            })
        });
        return response;
    } catch (error) {
        console.log(error);
    }
}

module.exports = getAllFaineant;
