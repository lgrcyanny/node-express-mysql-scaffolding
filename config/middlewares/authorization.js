
/*
 *  Generic require login routing middleware
 */

exports.requiresSignin = function (req, res, next) {
  if (!req.isAuthenticated()) {
    req.session.returnTo = req.originalUrl;
    return res.redirect('/signin');
  }
  next();
}
