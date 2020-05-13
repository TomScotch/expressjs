var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'devpass',
  database : 'user'
});
connection.connect(function(err){
if(!err) {
    console.log("Database Connected");
} else {
    console.log("Database Connection Failed");
}
});
module.exports = connection;
