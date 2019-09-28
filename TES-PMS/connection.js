var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "dev",
    password: "password"
});

module.exports = con;