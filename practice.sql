SELECT	WarehouseID, SKU, QuantityOnHand
FROM	inventory
WHERE	SKU = 201000 AND QuantityOnHand > 0;

SELECT	WarehouseID, SKU, QuantityOnHand
FROM	inventory
WHERE	SKU = 100100 OR SKU = 100200;

SELECT	*
FROM	warehouse
WHERE	WarehouseID = 100 or WarehouseID = 500;

SELECT		*
FROM		inventory
WHERE		QuantityOnHand BETWEEN 300 AND 500
ORDER BY	QuantityOnHand;



SELECT *
FROM order_item
WHERE ExtendedPrice BETWEEN 100 AND 200
ORDER BY ExtendedPrice;

SELECT * 
FROM artist
WHERE Nationality = 'United States' and DateOfBirth <= 1900;

SELECT *
FROM trans
WHERE DateAcquired BETWEEN '2014-01-01' AND '2014-12-31';
