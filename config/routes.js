/*!
 * Module dependencies.
 */

var async = require('async')

/**
 * Controllers
 */

var users = require('../app/controllers/users');
var auth = require('./middlewares/authorization');
var index= require('../app/controllers/index');


/**
 * Expose routes
 */

module.exports = function (app, passport) {

  // User routes
  app.get('/signin', users.showSignIn);
  app.get('/signup', users.showSignUp);
  app.get('/signout', users.signout);
  app.post('/users', users.create);
  app.post('/users/session',
    passport.authenticate('local', {
      failureRedirect: '/signin',
      failureFlash: 'Invalid email or password.'
    }), users.session);

  app.get('/users/:userId', users.showProfile);

  app.param('userId', users.user);
  app.get('/showtestuser', users.showtestuser);

  // home route
  app.get('/', index.index);

}
