#Hans Vos
#1003181
#Homework 6 Due Oct 3

-- 1. Write a SQL query that displays the sum of the QuantityOnHand column from the inventory table where the SKU is 100100 or 100200. Use a column alias of TanksInStock for the aggregate column.
SELECT SUM(QuantityOnHand) AS TanksInStock
FROM inventory
WHERE SKU = 100100 OR SKU = 100200;

-- 2. Write a SQL query that displays the number of the rows in the retail_order table. Use a column alias of NumberOfOrders for the aggregate column.
SELECT COUNT(*) AS NumberOfOrders
FROM retail_order;

-- 3. Write a SQL query that displays the number of rows in the catalog_sku_2015 table where CatalogPage is not null. Use a column alias of ItemsInCatalog for the aggregate column.
SELECT COUNT(*) AS ItemsInCatalog
FROM catalog_sku_2015
WHERE CatalogPage IS NOT NULL;

-- 4. Write a SQL query that displays the number of rows of the inventory table where QuantityOnHand is greater than or equal to 500. Use a column alias of WellStocked for the aggregate column.
SELECT COUNT(*) AS WellStocked
FROM inventory
WHERE QuantityOnHand >= 500;

-- 5. Write a SQL query that displays the average of the OrderTotal column from the retail_order table. Use a column alias of AverageOrderAmount for the aggregate column.
SELECT AVG(OrderTotal) AS AverageOrderAmount
FROM retail_order;

-- 6. Write a SQL query that displays the min and max of the OrderTotal column in the retail_order table. Use a column alias of SmallestOrderAmount for the min and LargestOrderAmount for the max.
SELECT	MIN(OrderTotal) AS SmallestOrderAmount,
		MAX(OrderTotal) AS LargestOrderAmount
FROM	retail_order;

-- 7. Write a SQL query that displays the TransactionID column and the difference between the SalesPrice and AcquistionPrice columns from the trans table. Use a column alias of ProfitAmount for the calculated column. Remove rows where the difference between the SalesPrice and AcquistionPrice is NULL.
SELECT TransactionID, SalesPrice, AcquistionPrice, (AcquistionPrice - SalesPrice) AS ProfitAmount
FROM trans
REMOVE WHERE ProfitAmount IS NULL;

