# PaperBook Overview
 PaperBook is a Literature Management System, which is shipped with convenient literature upload, search, comment and greate communication functions for a private research group.<br>
 First step, we built the system based on Node.js + Express + MySQL<BR>
 Second step, migrate big data to HBase, make use of Hadoop to build a cloud research platform.

# Team Member
+ [Cyanny Liang](http://www.cyanny.com)
+ Thomas Zhang
+ Aaron Feng

## Install

**NOTE:** You need to have node.js, mongodb installed
1. Clone the project
```sh
  $ git clone https://github.com/lgrcyanny/PaperBook
  $ npm install
  $ cp config/config.disk.js config/config.js
```
2. Install mysql[http://dev.mysql.com/downloads/]

3. Start mysql service

4. Build the database
```sh
  $ mysql -u root -p
  > create database paperbook
  > quit
  $ mysql -u root -pyourpassword paperbook < paperbook.sql
```
5. Start Server
```sh
  $ npm start
```
4. Then visit [http://localhost:3000/](http://localhost:3000/)

## Related modules
[node-express-mongoose-demo](https://github.com/madhums/node-express-mongoose-demo)

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
  |__imager.js (imager config)
  |__express.js (express.js configs)
  |__middlewares/ (custom middlewares)
-public/
```

## Tests

```sh
$ npm test
```

## Comments
Originally, the project is built on mongodb, but our teacher said that we have to use mysql, which freaks us out.
The migration costs me 3 days, just simple signin/signup function. Different database is like different OS. Why teacher user command us to do so ? He wants us to compare rational database and non-rational database(HBase). By the way, even though I hate the migration, I learned a lot.

## License
(The MIT License)
