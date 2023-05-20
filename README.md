# sql-challenge
Module 9 Weekly Challenge

Hello,

Of the three different components of this challenge: data modeling, data engineering and data analysis, I found data modeling and engineering to be the most difficult. 

Creating the ERD was a good opportunity to put my understanding of primary and foreign keys to the test. I find primary keys to be more straight forward but struggle a bit with foreign keys. For example, for the tables Department Employees and Department Managers, both employee ID and department ID appear which would indicate a relationship. However, I thought it would be redundant to link the two tables because if you wanted to know who out of the employees was a manager and for what department you could solely use the Department Managers table and therefore wouldn't need the Department Employees table, so I didn't link them together through foreign keys. 

Additionally, I had created my ERD using DBD first but found in the actual creation of my tables in Postgres that I needed to rework some of my keys and relationships. I had also attempted to do my homework before our makeup class for information on ERD creation and wasn't aware that we could export the DBD code directly into Postgres and use it to create the tables. Instead, I wrote the table creation code myself. 

For a quick explainer of my repo, I have one main folder called EmployeeSQL. Inside I have the SQL file for the creation of my tables titled "schema" and a separate SQL file for the creation of my queries titled "queries." The folder also includes an image of my ERD.

Thanks! 

