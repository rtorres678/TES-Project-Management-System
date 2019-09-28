var express = require('express');
var router = express.Router();
var con = require('../connection')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET Hello World page. */
router.get('/helloworld', function (req, res) {
    con.connect(function (err) {
        if (err) throw err;
        con.query("SHOW DATABASES", function (err, result, fields) {
            if (err) throw err;
            //res.render('db_list', { db_list: result });
            console.log(result[0].Database)
            res.render('helloworld', {title: 'Hello', testVar: result})
        });
    });
});

/* GET New User page. */
router.get('/newuser', function (req, res) {
    res.render('newuser', { title: 'Add New User' });
});

module.exports = router;
