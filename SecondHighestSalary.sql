/*
176. Second Highest Salary
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the second highest salary from the Employee table. 
If there is no second highest salary, the query should report null.

The query result format is in the following example.
*/

/* Write your MySQL query statement below */
SELECT IFNULL(             /* IFNULL(NULL,ITEM) */
    (SELECT DISTINCT salary
    FROM 
    (SELECT 
        salary, 
        DENSE_RANK()OVER(ORDER BY salary DESC) AS rk
    FROM Employee) AS sub
    WHERE rk = 2), NULL) AS SecondHighestSalary

/*ANOTHER SPECIFIC SOLUTION */
SELECT                       /*the generation of this solution is worse than window function method */
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),   /*OFFSET: skips the offset rows before beginning to return the rows*/
    NULL) AS SecondHighestSalary