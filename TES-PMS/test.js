var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "dev",
    password: "password"
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
    /*con.query("CREATE DATABASE mydb1", function (err, result) {
        if (err) throw err;
        console.log("Database created");
    });*/
    con.query("SHOW DATABASES;", function (err, result) {
        if (err) throw err;
        console.log(result);
    });
});