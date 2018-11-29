#Hans Vos
#CS 31
#1003181
#Due Oct 10

-- 1.Write a SQL query to display the SKU and count of the rows where the QuantityOnHand is 0, grouped by SKU. Use the inventory table. Display the results in descending order of count.
SELECT SKU, Count(QuantityOnHand) AS NumLocationsOutOfStock
FROM inventory
WHERE QuantityOnHand IS NULL
GROUP BY SKU
ORDER BY Count(QuantityOnHand) DESC;

-- 2. Write a SQL query to display the OrderNumber and sum of the ExtendedPrice column, grouped by OrderNumber. Use the order_item table. Display the results in descending order of sum.
SELECT OrderNumber, SUM(ExtendedPrice) AS SubTotal
FROM order_item
GROUP BY OrderNumber
ORDER BY SUM(ExtendedPrice) DESC;

-- 3. Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand, grouped by WarehouseID. Use the inventory table. Name the sum TotalItemsOnHand and display the results in descending order of TotalItemsOnHand.
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM inventory
GROUP BY WarehouseID
ORDER BY SUM(QuantityOnHand) DESC;

-- 4. Write a SQL query to display the WarehouseID and sum of the QuantityOnHand column, grouped by WarehouseID. Use the inventory table. Omit all SKU items that have 3 or more items on hand from the sum, and name the sum TotalItemsOnHandLT3. Display the results in descending order of TotalItemsOnHandLT3.
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalIemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY SUM(QuantityOnHand) DESC;

-- 5. Write a SQL query to display the WarehouseID and sum of the QuantityOnHand column, grouped by WarehouseID. Use the inventory table. Omit all SKU items that have 3 or more items on hand from the sum, and name the sum TotalItemsOnHandLT3. Show the WarehouseID only for warehouses having fewer than 2 SKUs in their TotalItemsOnHandLT3. Display the results in descending order of TotalItemsOnHandLT3.
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand <= 3
GROUP BY WarehouseID
HAVING SUM (QuantityOnHand) < 2
ORDER BY TotalItemsOnHandLT3 DESC;


-- 6. Write a SQL query to display the WarehouseID, SKU, and QuantityOnHand columns from the inventory table. Use an IF statement to display a Status column that displays 'Out of Stock' if QuantityOnHand is 0 and 'In Stock' otherwise. Display the results in ascending order of SKU.
SELECT WarehouseID, SKU, QuantityOnHand , IF(QuantityOnHand <= 0, 'Out of Stock', 'In Stock') AS Status
FROM INVENTORY
ORDER BY SKU ASC;

-- 7. Write a SQL query to display the TransactionID and SalesPrice columns from the trans table. Use a CASE to display a Status column that displays a message based on the following criteria.
-- 'Small Ticket Item' if SalesPrice is less than or equal to  500
-- 'Medium Ticket item' if SalesPrice is less than 10000 and greater than 500
-- 'Big Ticket Item' if SalesPrice is greater than or equal to 10000
-- 'For Sale' if none of the conditions above are true
-- 	Display the results in descending order of SalesPrice.
SELECT TransactionID, SalesPrice, CASE 
	WHEN SalesPrice <= 500 THEN 'Small Ticket Item'
    WHEN SalesPrice <= 10000 THEN  'Medium Ticket Item'
    WHEN SalesPrice >= 10000 THEN 'Big Ticket Item'
    ELSE 'For Sale'
    END AS 'Statues'
FROM trans
ORDER BY SalesPrice Desc;
    
-- question to ask:
-- 1 housing
-- 2 finicial aid
-- 3 do i have enough gibill for a second 401 course
-- 4 






