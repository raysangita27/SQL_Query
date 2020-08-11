/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/

SELECT MAX(Salary) AS SecondHighestSalary  FROM Employee WHERE
Salary < (SELECT MAX(Salary)  FROM Employee )

/********************* uing CTE **************************/

WITH CTE_SALARY
AS
(
    SELECT Id, Salary, DeNSE_RANK() OVER (ORDER BY Salary DESC) AS SALARY_RANK FROM Employee 
),

SELECT Salary AS SecondHighestSalary  FROM CTE_SALARY WHERE SALARY_RANK = 2
