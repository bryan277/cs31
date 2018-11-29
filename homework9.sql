#Hans Vos
#1003181
#Due 24
#Homework 9

-- 1.Write an SQL statement to show the SKU, SKU_Description, and WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use a JOIN ON syntax.
SELECT t1.sku, sku_description,
sd.warehouseid
FROM inventory AS t1 LEFT JOIN warehouse AS sd 
ON t1.WarehouseID=sd.warehouseID
WHERE sd.Manager LIKE 'Lucille Smith'
ORDER BY t1.sku, sd.warehouseID;

-- 2.Write a SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use a JOIN ON syntax.
SELECT t1.WarehouseID, AVG(t1.QuantityOnHand) 
FROM inventory as t1 JOIN warehouse as t2
WHERE t1.WarehouseID = t2.WarehouseID AND t2.Manager LIKE 'Lucille Smith';

-- 3.Write a SQL statement to show the SKU, SKU_Description, and WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax.
SELECT SKU, sku_description,
sd.warehouseid
FROM inventory AS t1
JOIN warehouse AS sd 
ON t1.WarehouseID=sd.warehouseID
WHERE sd.Manager LIKE 'Lucille Smith'
ORDER BY t1.sku, sd.warehouseID;

-- 4.Write a SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax.
SELECT t1.WarehouseID, AVG(t1.QuantityOnHand) 
FROM inventory as t1 INNER JOIN warehouse as t2
ON t1.WarehouseID = t2.WarehouseID
WHERE t2.Manager LIKE 'Lucille Smith';

-- 5.Write a SQL statement to show the Buyer, Department, and SUM of Quantity for all orders made in January 2015. 
-- You will need to use the sku_data, order_item, and retail_order tables. Group by the Buyer and Department. 
-- The results should be displayed in descending order by the SUM of the Quantity. Use the JOIN syntax of your choice. 
-- You may also combine a JOIN and subquery. HINT: You can use a modification of Query 2_57 in the Chapter_2_Queries.sql file on Canvas.
 SELECT Buyer, Department, SUM(SKU) AS Number_Of_SKU_Sold
FROM sku_data
WHERE SKU IN (SELECT SKU
              FROM order_item JOIN sku_data
              WHERE OrderNumber IN (SELECT OrderNumber
					                FROM retail_order
									WHERE OrderMonth = 'January'
                                        AND OrderYear = 2015))
GROUP BY Buyer, Department 
ORDER BY Number_Of_SKU_Sold desc;

