/*
180. Consecutive Numbers
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.
 

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.
*/

/* Write your MySQL query statement below */
SELECT DISTINCT num AS ConsecutiveNums
FROM
    (SELECT
    num,
    LAG(num, 1)OVER(ORDER BY id) AS app1,
    LAG(num, 2)OVER(ORDER BY id) AS app2
    FROM Logs) AS sub
WHERE num = app1 AND num = app2