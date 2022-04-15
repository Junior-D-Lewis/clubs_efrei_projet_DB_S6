const con = require("../db_config/db");
async function getAllClubs() {
    try {
        const response = await new Promise((resolve, reject) => {
            const query = "SELECT DISTINCT(C.id_Club), C.nom, C.description, TC.libelle_Type as Type_Club, M.numero_Et, M.nom as President,"+
            "M.classe, M.niveau from affecter as A, club as C, type_club as TC, membres as M, responsabilite AS R where C.Id_Type = TC.Id_Type"+
            " and C.id_Club = A.id_Club and A.numero_Et = M.numero_Et and  A.id_responsabilite = R.id_responsabilite and "+
            " C.id_Club = A.id_Club and A.numero_Et = M.numero_Et and  A.id_responsabilite = R.id_responsabilite and "+
            "R.libelle_res = 'president' order by id_Club;"

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

module.exports = getAllClubs;
