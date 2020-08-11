/*
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.
*/

WITH CTE_EMAIL
AS
(
   SELECT Email , ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID ) AS E_Rank 
    FROM Person
)
SELECT DISTINCT(EMAIL) FROM CTE_EMAIL WHERE E_Rank >1

/*************************WITHOUT CTE*************************/

SELECT Email FROM Person GROUP BY Email HAVING COUNT(Email) > 1;
