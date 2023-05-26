/*
183. Customers Who Never Order
Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key column for this table.
customerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write an SQL query to report all customers who never order anything.

Return the result table in any order.
*/

-- Write your MySQL query statement below
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders)

-- using join also can solve it
SELECT  c.Name AS Customers
FROM Customers AS c 
LEFT JOIN Orders AS o
ON c.id = o.CustomerId
WHERE o.id IS NULL