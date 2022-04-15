const mysql = require('mysql2');
var con = mysql.createConnection({
    host: "localhost",
    database: "clubs",
    user: "root",
    port: "3306",
    password: "TL2k20"
  });
  
module.exports = con;