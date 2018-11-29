#Hans Vos
#1003181
#Due 17
#Homework 8

-- 1.Write an SQL statement to show the SKU, SKU_Description, WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a subquery.
SELECT SKU, SKU_Description, WarehouseID
FROM inventory
WHERE WarehouseID IN (SELECT WarehouseID
					  FROM warehouse
                      WHERE Manager = 'Lucille Smith');
                      
-- 2.Write an SQL statement to show the Manager, WarehouseCity, WarehouseState for all warehouses with SKU 101100 in stock. Use a subquery.
SELECT Manager, WarehouseCity, WarehouseState
FROM warehouse
WHERE WarehouseID IN (SELECT WarehouseID
					     FROM inventory
                         WHERE SKU = 101100 AND QuantityOnHand > 0);
       
-- 3.Write an SQL statement to show the Department and Buyer for all SKUs that are on a retail sales order (Hint: order_item table). Eliminate repeat rows.
SELECT DISTINCT Department, Buyer
FROM sku_data
WHERE SKU IN (SELECT SKU
			  FROM order_item);
              
-- 4.Write an SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a subquery.
-- Use the vrg database.
SELECT WarehouseID, AVG(QuantityOnHand)
FROM inventory
WHERE WarehouseID IN (SELECT WarehouseID
					  FROM warehouse
                      WHERE Manager = 'Lucille Smith');

-- 5. Write a SQL function that has one parameter of type NUMERIC(8, 2) and returns CHAR(18). Use one of the logical statement we discussed in class to implement a function that does the following:
DELIMITER //
CREATE FUNCTION simpleFunc(SalesPrice NUMERIC(8,2))
RETURNS CHAR(18)
READS SQL DATA
DETERMINISTIC
BEGIN
	CASE 
		WHEN SalesPrice <= 500 THEN RETURN 'Small Ticket Item';
		WHEN SalesPrice <= 10000 THEN RETURN  'Medium Ticket Item';
		WHEN SalesPrice >= 10000 THEN RETURN 'Big Ticket Item';
		ELSE RETURN 'For Sale';
    END CASE;
END//
DELIMITER ;
-- return 'Small Ticket Item' if the parameter is less than or equal to  500
-- return 'Medium Ticket Item' if the parameter is less than 10000 and greater than 500
-- return 'Big Ticket Item' if the parameter is greater than or equal to 10000
-- return 'For Sale' if none of the conditions above are true

-- 6.Write a SQL statement to display the TransactionID, SalesPrice, and a call to the function you just wrote with SalesPrice as the argument. Use the trans table.  Display the results in descending order of SalesPrice.
SELECT TransactionID, SalesPrice, simpleFunc(SalesPrice)
FROM trans
ORDER BY SalesPrice DESC;



