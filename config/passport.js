var LocalStrategy = require('passport-local').Strategy;
var usermodel = require('../app/models/user.js');


module.exports = function (passport, config) {
  // serialize sessions
  passport.serializeUser(function(user, done) {
    done(null, user.id);
  });

  passport.deserializeUser(function(id, done) {
    usermodel.findById(id, function (err, results) {
      done(err, results[0]);
    });
  });

  // use local strategy
  passport.use(new LocalStrategy({
      usernameField: 'email',
      passwordField: 'password'
    },
    function(email, password, done) {
      usermodel.find({ email: email }, function (err, results) {
        if (err) { return done(err) }
        if (results.length !== 1) {
          return done(null, false, { message: 'Unknown user' })
        }
        var user = results[0];
        if (!usermodel.authenticate(password, user)) {
          console.log('invalid password');
          return done(null, false, { message: 'Invalid password' })
        }
        return done(null, user);
      });
    }
  ));
}
