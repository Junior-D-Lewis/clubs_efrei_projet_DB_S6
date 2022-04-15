const con = require("../db_config/db");

async function getAllPerf(nom_club) {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT * FROM perf" ;
           
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

module.exports = getAllPerf;
