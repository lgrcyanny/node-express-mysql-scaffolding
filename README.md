# Node Express MySQL Scaffolding Overview
There are many node scaffoldings based on Mongoddb, but MySQL is rare. This is a simple scaffolding built on express and mysql.

# Author
+ [Cyanny Liang](http://www.cyanny.com)

# Features
1. Register with fullname, email, passord, very simple
2. Login with [passport-local](https://npmjs.org/package/passport-local) strategy
3. Twitter Bootstrap Support
Note: I just want keep the scaffolding clean, no more complex function, and keep it flexible.

## Install

**NOTE:** You need to have node.js, mysql installed <BR>
1. Clone the project
```sh
  $ git clone https://github.com/lgrcyanny/node-express-mysql-scaffolding.git
  $ npm install
  $ cp config/config.disk.js config/config.js
```
Please config your MySQL in the `config.js`;

2. Install MySQL server[http://dev.mysql.com/downloads/]

3. Start MySQL service

4. Build the database
```sh
  $ mysql -u root -p
  > create database scaffolding
  > quit
  $ mysql -u root -pyourpassword scaffolding < scaffolding.sql
```
5. Start Server
```sh
  $ npm start
```
4. Then visit [http://localhost:3000/](http://localhost:3000/)

## Related modules
Thanks [node-express-mongoose-demo](https://github.com/madhums/node-express-mongoose-demo), it's a great scaffolding, but it still took me 2 days to migrate the mongodb based scaffolding to MySQL


## Directory structure
```
-app/
  |__controllers/
  |__models/
  |__mailer/
  |__views/
-config/
  |__routes.js
  |__config.js
  |__passport.js (auth config)
  |__express.js (express.js configs)
  |__middlewares/ (custom middlewares)
-public/
```

## Tests
Tests are not shipped now, I will write tests later.

```sh
$ npm test
```

## License
(The MIT License)
