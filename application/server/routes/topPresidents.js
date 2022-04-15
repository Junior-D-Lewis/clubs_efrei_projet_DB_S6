const con = require("../db_config/db");

async function getAllTopPresident() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT * FROM top_présidents;"

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

module.exports = getAllTopPresident;
