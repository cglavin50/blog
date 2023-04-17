+++
title = "Postgre SQL with JS"
date = "2023-04-16T18:05:45-04:00"
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++
As outlined in previous posts, PostgreSQL is a great option for storing and managing complex data types in SQL (including working with JSONS), with rich language support. Today I'm going to cover how to get a PostgreSQL DB up and running, and how to get it connected to your backend.

# PostgreSQL 101

Installation of postgresql (ps) follows your standard linux installation (ex `$ sudo apt-get install postgresql`). PS will create and run off the 'postgres' user, so you will need to switch to that account when you want to use the service. First, you need to start ps, with `$ sudo service postgresql start` (and you will run this to start, stop, and restart the service at any time). PS runs off roles, so the first stop is to create a user with the command `$ sudo -u postgres -c "creatuser user1"`. Then, create a corresponding database `$ sudo -u postgres -c "createdb user1db"`. Finally, we will connect to the PostgreSQL shell with `$ sudo -u postgre psql`, and grant our user permissions on the databse with `$ GRANT ALL PRIVILEGES ON DATABSE user1db TO user1;`. 
Some useful tips: from within the PostgreSQL shell (psql), you can run commands like '\l' to list all databases, '\c dbname' to connect to a database, and '\conninfo' to see what port a database is running on. Lastly, you can edit the postgreql.conf file to add configurations for features like remote connections, ex appending 'listen_addresses = '*'' to allow remote users to use your DB.

# Node-Postgres (pg)

If you are going to build an app, I'd recommend following their great [documentation](https://node-postgres.com/). However, here I'll provide a summary and how to get it up and running quickly. First, start with the classic install `npm i pg`, and if you work with TypeScript, `npm i @types/pg`. From there, make sure you have your imports `const { Client } = require('pg')` or `import { Client } from 'pg'`, and declare `const client = new Client()`, instantiating a PG Client object, which will provide you with all the basic needs to operate with your database. The API also defines 3 other objects, pg.Pool (groups of clients), pg.Result (returned from a query), and Cursor (used to effectively stream through large result sets). 
When you create your client object, you will need to define parameters such as user, password, host, port, database, etc. These values will all default to process variables, (ex user defaults to process.env.PGUSER or process.env.USER), so using this in tandem with the dotenv library works great. From there, all you need to do is call `client.connect()` and `client.query('SELECT * AS ...')`, and you will be up and running!
