
var path = require('path');
var rootPath = path.normalize(__dirname + '/..');

module.exports = {
  development: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'paperbook'
    },
    root: rootPath,
    app: {
      name: 'paperbook'
    }
  },
  test: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'paperbook'
    },
    root: rootPath,
    app: {
      name: 'PaperBook'
    }
  },
  production: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'paperbook'
    },
    root: rootPath,
    app: {
      name: 'PaperBook'
    }
  }
}
