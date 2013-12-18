/**
 * Module Dependencies
 */
var utils = require('../../lib/utils');
var crypto = require('crypto');

module.exports = {
  table: 'users',

  find: function (condition, cb) {
    var query = 'SELECT * FROM ?? WHERE ?';
    var data = [this.table, condition];
    utils.exec(query, data, cb);
  },

  findById: function (id, cb) {
    var query = 'SELECT * FROM ?? WHERE id = ?';
    var data = [this.table, id];
    var connection = utils.getDBConnection();
    utils.exec(query, data, cb);
  },

  /**
   * Create new user record to database
   */
  save: function (user, cb) {
    user.salt = this.makeSalt();
    user.password = this.encryptPassword(user.password, user.salt);
    var query = 'INSERT INTO users SET ?';
    utils.exec(query, user, cb);
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
