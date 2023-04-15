+++
title = "PostgreSQL vs MySQL"
date = "2023-04-15T14:34:52-04:00"
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

# Intro to SQL

SQL -  Structured Query Language - is a programming langauges that runs relational databases (creating, as well as performing read/writes to the database). SQL stores data as in tables. Tables have columns (field), and rows (records/entries). With an easy to pick up syntax, SQL is a great way to build out a database where you want to be able to quickly access information about records, as well as perform operations/comparisons based on fields of different records. That said, there are 4 main "flavors" (or dialects) of SQL: PostgreSQL, SQLite, SQL Server (Microsoft), and MySQL, with MySQL being the most popular version.

## MySQL vs PostgreSQL

While they are syntactically similar, MySQL doesn't have all the subquery support that Postgres offer, such as not supporting LIMIT or ALL clauses in subqueries. Postgres is fully complaint with SQL-standards, so if you want to use all the commands the SQL has to offer, MySQL may limit you. While both dialects support a good amount of languages, Postgre beats out MySQL significantly in terms of range. One key note is that MySQL has no support for Python, so Python devs should elect for Postgre or SQLite. The last key difference here is speed. MySQL boasts blazing fast reads, however lacks great concurrency support (aside: if you are in a system where many users may be writing to the same critical resources at the same time, wrapping your statements in Transactions guarantee atomicity and consistency). Postgres performs better write operations, handles concurrency better, and has better support with larger, more complicated queries. Overall, a smaller-scale setting with just reads will perform best with MySQL, and more complicated settings will perform better with Postgres. They also run on fundamentally different architectures. MySQL runs on a single process, opening threads for each connection. Postgres will open a new system process for each client connection established, potentially putting a high memory-burden on the server. Postgres has one single storage engine, whereas MySQL has 16 different engines giving it strong performance with specialized use cases. Finally, Postgres is much more feature-rich. It offers JSON support (great when migrating from a NoSQL DB), and has a large variety of data types, combined with support for user-defined types. 

Overall, there are usecases for both. No version is better than the other, rather when constructing your system you should outline your usecase, as well as your infrastructure when deciding which to build with. Most smaller scale (below Enterprise-grade) projects will do just fine with hosting a MySQL server, giving fast reads at a low burden to the processor. If you want complex data-types, NoSQL support, and will have frequent, concurrent writes, Postgres will probably be the way to go.