/*
177. Nth Highest Salary
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null.

The query result format is in the following example.
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      /* Write your MySQL query statement below.*/
      SELECT IFNULL(
          (SELECT DISTINCT salary
          FROM
          (
              SELECT salary, DENSE_RANK()OVER(ORDER BY salary DESC) as rk
              FROM Employee
          ) AS sub
          WHERE rk = N),NULL
      ) AS getNthHighestSalary
  );
END