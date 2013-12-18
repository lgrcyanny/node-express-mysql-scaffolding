
var path = require('path');
var rootPath = path.normalize(__dirname + '/..');

module.exports = {
  development: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'scaffolding'
    },
    root: rootPath,
    app: {
      name: 'Node-Express-MySQL-Scaffolding'
    }
  },
  test: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'scaffolding'
    },
    root: rootPath,
    app: {
      name: 'Node-Express-MySQL-Scaffolding'
    }
  },
  production: {
    db: {
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'scaffolding'
    },
    root: rootPath,
    app: {
      name: 'Node-Express-MySQL-Scaffolding'
    }
  }
}
