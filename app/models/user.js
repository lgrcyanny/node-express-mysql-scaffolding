/**
 * Module Dependencies
 */
var utils = require('../../lib/utils');
var crypto = require('crypto');

module.exports = {
  table: 'users',

  find: function (condition, cb) {
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    connection.query('SELECT * FROM ?? WHERE ?', [this.table, condition], function (err, res) {
      if (err) cb(err);
      cb(null, res);
    });
    utils.endDBConnection(connection);
  },

  findById: function (id, cb) {
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    connection.query('SELECT * FROM ?? WHERE id = ?', [this.table, id], function (err, res) {
      if (err) cb(err);
      cb(null, res[0]);
    });
    utils.endDBConnection(connection);
  },

  /**
   * Create new user record to database
   */
  save: function (user, cb) {
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    user.salt = this.makeSalt();
    user.password = this.encryptPassword(user.password, user.salt);
    var query = connection.query('INSERT INTO users SET ?', user, function (err, res) {
      if (err) {
        cb(err);
      }
      user.id = res.insertId;
      cb(null, res.insertId);
    });
    utils.endDBConnection(connection);
  },

  /**
   * Authenticate - check if the passwords are the same
   *
   * @param {String} plainText
   * @return {Boolean}
   * @api public
   */

  authenticate: function (plainText, user) {
    return this.encryptPassword(plainText, user.salt) === user.password;
  },

  /**
   * Make salt
   *
   * @return {String}
   * @api public
   */

  makeSalt: function () {
    return Math.round((new Date().valueOf() * Math.random())) + '';
  },

  /**
   * Encrypt password
   *
   * @param {String} password
   * @return {String}
   * @api public
   */

  encryptPassword: function (password, salt) {
    if (!password) return ''
    var encrypred
    try {
      encrypred = crypto.createHmac('sha1', salt).update(password).digest('hex')
      return encrypred
    } catch (err) {
      return ''
    }
  }
}
