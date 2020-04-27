var express = require("express");
var app = express();
var connection = require('tedious').Connection;
var request = require('tedious').Request;

app.get('/', function (req, res) {
    //set up the connection information
    var config = {
        authentication: {
            type: "default",
            options: {  
                userName: "sa", //change this
                password: "Yukon900" //change this
            }
        },
        server: 'sqldemo10-svc',  //change this
        options: {
            database: 'DemoData'
        }
    };

    var conn = new connection(config);

    conn.on('connect', function(err) {
        if (err) {
            console.log(err);
        } else {
            sqlreq = new request("SELECT * FROM Products FOR JSON AUTO", function(err, rowCount) {
                if (err) {
                    console.log(err);
                }
            });

            sqlreq.on('row', function(columns) { 
                columns.forEach(function(column) {  
                    if (column.value === null) {  
                        console.log('NULL');
                    } else {  
                        res.send(column.value);
                    }  
                });
            });

            conn.execSql(sqlreq); 
        }
    });
})  

var server = app.listen(8080, function () {
    console.log("Listening on port %s...", server.address().port);
});