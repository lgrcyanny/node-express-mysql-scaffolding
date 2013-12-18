var mysql = require('mysql');
var env = process.env.NODE_ENV || 'development'
var config = require('../config/config')[env]

module.exports = {
  getDBConnection: function () {
    return mysql.createConnection(config.db);
  },

  /**
   * This must be called before connection.query(...);
   */
  connectToDB: function (connection) {
    connection.connect(function(err) {
      if (err) {
        throw err;
      }
    });
  },

  /**
   * This must be called after connection.query(...)
   */
  endDBConnection: function (connection) {
    connection.end(function (err) {
      if (err) {
        throw err;
      }
    });
  },

  exec: function (query, data, cb) {
    var connection = this.getDBConnection();
    this.connectToDB(connection);
    connection.query(query, data, function(err, res) {
      if (err) {
        cb(err);
      }
      cb(null, res);
    });
    this.endDBConnection(connection);
  }
}
