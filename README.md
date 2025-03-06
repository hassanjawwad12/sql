# SQL
An Introduction to Databases and Queries

# What is SQL
* Programming Language for communicating with data in databases. 
* It lets us quickly access , organize and analyze large amounts of data with dirrect commands known as queries. 

# Database 
* Several tables makes up a databases
* In a relational databases the tables have connection based on any shared data
* A table name should be `clear` , use `underscore` instead of spaces, `singular` and should be `lowercased`. 
* Rows are `records` and columns are `fields`.
* Two fields in a table should not have the same name and neither name of the table. 
* A unique identifier distinguishes a record from others in the same table.

# Storage and Data-Types
* Data is stored on server hardisk
* Datatype depends on the information stored in a column
* We also have to see the operations which can be made between two values
* `INT` can hold values from `negative two billion` to `positive 2 billion` 
* `FLOAT` can hold values upto `38 digits`
* `VARCHAR` is used for strings
* `DATE`    used to store date 
* `TIMESTAMP` used to store time  `YYYY-MM-DD HH:MM:SS`
* `BLOB` binary large object

# Schema 
* A schema shows a database design such as what tables are included , any relationship between its tables and what type each field can hold

# Aggregation 
Aggregation functions in SQL are used to perform calculations on a set of values and return a single value. Here are examples of queries using each of the aggregation functions you mentioned: `COUNT()`, `SUM()`, `AVG()`, `MAX()`, and `MIN()`
Aggregation functions are often used with the `GROUP BY` clause to group results by a specific column.
The `HAVING` clause is used to filter results after aggregation.

# View 
* Creates a virtual table based on a query.
* The point of creating a view is to simplify complex queries, enhance security, and provide a reusable and consistent way to access data. 