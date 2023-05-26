/*
184. Department Highest Salary
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.
*/

-- Write your MySQL query statement below
SELECT d.name AS department, sub.name AS Employee, sub.salary AS Salary
FROM(
  SELECT *, RANK()OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rk
  FROM Employee
    ) AS sub  
LEFT JOIN Department AS d
ON sub.departmentId = d.id 
WHERE rk = 1

-- By comparing salary can also solve this
SELECT d.name AS Department, sub.name AS Employee, sub.salary AS Salary
FROM
    (SELECT *, MAX(salary)OVER(PARTITION BY departmentId) AS max_salary
    FROM Employee
    ) AS sub
LEFT JOIN Department as d
ON sub.departmentId = d.id
Where sub.salary=sub.max_salary