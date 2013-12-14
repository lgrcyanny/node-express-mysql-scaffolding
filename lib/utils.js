var mysql = require('mysql');
var env = process.env.NODE_ENV || 'development'
var config = require('../config/config')[env]

module.exports = {
  getDBConnection: function () {
    return mysql.createConnection(config.db);
  },
  connectToDB: function (connection) {
    connection.connect(function(err) {
      if (err) {
        throw err;
      }
    });
  },
  endDBConnection: function (connection) {
    connection.end(function (err) {
      if (err) {
        throw err;
      }
    });
  }
}
