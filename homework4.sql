-- Hans Vos
-- CS 31
-- Homework 4
-- DUE Sep 19

-- 1. Write a SQL statement to display the WarehouseID, SKU, and QuantityOnHand columns of the inventory table with SKU equal to 201000 and QuantityOnHand greater than 0.
SELECT  WarehouseID, SKU, QuantityOnHand
FROM  inventory
WHERE	SKU = 201000 AND QuantityOnHand > 0;

-- 2.Write a SQL statement to display the WarehouseID, SKU, and QuantityOnHand columns of the inventory table with SKU equal to 100100 or 100200.
SELECT	WarehouseID, SKU, QuantityOnHand
FROM	inventory
WHERE	SKU = 100100 OR SKU = 100200;

-- 3.Write a SQL statement to display all columns from the warehouse table with WarehouseID equal to 100 or 500.
SELECT	*
FROM	warehouse
WHERE	WarehouseID = 100 or WarehouseID = 500;

-- 4.Write a SQL query that displays all columns from the inventory table with QuantityOnHand between 300 and 500, endpoints included. Order by QuantityOnHand. Use BETWEEN.
SELECT		*
FROM		inventory
WHERE		QuantityOnHand BETWEEN 300 AND 500
ORDER BY	QuantityOnHand;

-- 5.Write a SQL query that displays all columns from the inventory table with QuantityOnHand between 300 and 500, endpoints included. Order by QuantityOnHand. Don't use BETWEEN.
SELECT		*
FROM		inventory
WHERE		QuantityOnHand >= 300 AND QuantityOnHand <= 500
ORDER BY	QuantityOnHand;
-- 6. Write a SQL query that displays all columns from the artist table with Nationality of 'United States' and DateOfBirth before 1900.
SELECT *
FROM artist
WHERE Nationality = 'United States' and DateOfBirth <= 1900;
--
-- 7. Write a SQL query that displays all columns from the trans table with the DateAcquired in the year 2014.
SELECT *
FROM trans
WHERE DateAcquired BETWEEN '2014-01-01' AND '2014-12-31';
