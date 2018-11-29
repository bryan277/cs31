-- SQL DISTINCT KEYWORD
SELECT DISTINCT	Buyer, Department
FROM			SKU_DATA;

SELECT	Buyer, Department
FROM	SKU_DATA;

SELECT	*
FROM 	SKU_DATA
WHERE 	Department = 'Water Sports';
-- '100100','Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'
-- '100200','Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'
-- '101100','Dive Mask, Small Clear','Water Sports','Nancy Meyers'
-- '101200','Dive Mask, Med Clear','Water Sports','Nancy Meyers'

SELECT	*
FROM	CATALOG_SKU_2014
WHERE	DateOnWebSite = '01-JAN-2014';

SELECT	SKU_Description, Department
FROM 	SKU_DATA
WHERE 	Department = 'Climbing';
-- 'Light Fly Climbing Harness','Climbing'
-- 'Locking Carabiner, Oval','Climbing'

SELECT		*
FROM		ORDER_ITEM
ORDER BY	OrderNumber;
-- '1000','201000','1','300.00','300.00'
-- '1000','202000','1','130.00','130.00'
-- '2000','101100','4','50.00','200.00'
-- '2000','101200','2','50.00','100.00'
-- '3000','100200','1','300.00','300.00'
-- '3000','101100','2','50.00','100.00'
-- '3000','101200','1','50.00','50.00'

SELECT		*
FROM		ORDER_ITEM
ORDER BY	price;
-- '2000','101100','4','50.00','200.00'
-- '3000','101100','2','50.00','100.00'
-- '2000','101200','2','50.00','100.00'
-- '3000','101200','1','50.00','50.00'
-- '1000','202000','1','130.00','130.00'
-- '3000','100200','1','300.00','300.00'
-- '1000','201000','1','300.00','300.00'

-- SQL and operator
SELECT	*
FROM	SKU_DATA
WHERE	Department='Water Sports'
AND		Buyer='Nancy Meyers';
-- '101100','Dive Mask, Small Clear','Water Sports','Nancy Meyers'
-- '101200','Dive Mask, Med Clear','Water Sports','Nancy Meyers'

SELECT	*
FROM	SKU_DATA
WHERE	Department='Camping'
OR		Department='Climbing';
-- '201000','Half-dome Tent','Camping','Cindy Lo'
-- '202000','Half-dome Tent Vestibule','Camping','Cindy Lo'
-- '301000','Light Fly Climbing Harness','Climbing','Jerry Martin'
-- '302000','Locking Carabiner, Oval','Climbing','Jerry Martin'

SELECT	*
FROM	SKU_DATA
WHERE	Department='Water Sports'
and not	Buyer='Nancy Meyers';
-- '100100','Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'
-- '100200','Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'

SELECT	*
FROM	SKU_DATA
WHERE	Buyer IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');
-- '101100','Dive Mask, Small Clear','Water Sports','Nancy Meyers'
-- '101200','Dive Mask, Med Clear','Water Sports','Nancy Meyers'
-- '201000','Half-dome Tent','Camping','Cindy Lo'
-- '202000','Half-dome Tent Vestibule','Camping','Cindy Lo'
-- '301000','Light Fly Climbing Harness','Climbing','Jerry Martin'
-- '302000','Locking Carabiner, Oval','Climbing','Jerry Martin'

SELECT	*
FROM	SKU_DATA
WHERE	Buyer NOT IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');
-- '100100','Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'
-- '100200','Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'

SELECT		*
FROM		ORDER_ITEM
WHERE		ExtendedPrice >= 100
AND			ExtendedPrice <= 200
ORDER BY	ExtendedPrice;
-- '3000','101100','2','50.00','100.00'
-- '2000','101200','2','50.00','100.00'
-- '1000','202000','1','130.00','130.00'
-- '2000','101100','4','50.00','200.00'

SELECT		*
FROM		ORDER_ITEM
WHERE		ExtendedPrice BETWEEN 100 AND 200
ORDER BY	ExtendedPrice; 
-- '3000','101100','2','50.00','100.00'
-- '2000','101200','2','50.00','100.00'
-- '1000','202000','1','130.00','130.00'
-- '2000','101100','4','50.00','200.00'

SELECT		*
FROM		ORDER_ITEM
WHERE 		ExtendedPrice NOT BETWEEN 100 AND 200
ORDER BY 	ExtendedPrice;
-- '3000','101200','1','50.00','50.00'
-- '3000','100200','1','300.00','300.00'
-- '1000','201000','1','300.00','300.00'

SELECT	*
FROM 	SKU_DATA
WHERE	Buyer LIKE 'Pete%';
-- '100100','Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'
-- '100200','Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'

SELECT	*
FROM 	SKU_DATA
WHERE	SKU_Description LIKE '%Tent&';

SELECT	*
FROM	SKU_DATA
WHERE 	SKU LIKE '%2%';
-- '100200','Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'
-- '101200','Dive Mask, Med Clear','Water Sports','Nancy Meyers'
-- '201000','Half-dome Tent','Camping','Cindy Lo'
-- '202000','Half-dome Tent Vestibule','Camping','Cindy Lo'
-- '302000','Locking Carabiner, Oval','Climbing','Jerry Martin'

SELECT	*
FROM	CATALOG_SKU_2015
WHERE	CatalogPage IS NULL;
-- '20150007','203000','Half-dome Tent Vestibule - Wide','Camping',NULL,'2015-04-01'

SELECT	*
FROM	CATALOG_SKU_2015
WHERE	CatalogPage IS NOT NULL;
-- '20150001','100100','Std. Scuba Tank, Yellow','Water Sports','23','2015-01-01'
-- '20150002','100200','Std. Scuba Tank, Magenta','Water Sports','23','2015-01-01'
-- '20150003','101100','Dive Mask, Small Clear','Water Sports','27','2015-08-01'
-- '20150004','101200','Dive Mask, Med Clear','Water Sports','27','2015-01-01'
-- '20150005','201000','Half-dome Tent','Camping','45','2015-01-01'
-- '20150006','202000','Half-dome Tent Vestibule','Camping','45','2015-01-01'
-- '20150008','301000','Light Fly Climbing Harness','Climbing','76','2015-01-01'
-- '20150009','302000','Locking Carabiner, Oval','Climbing','78','2015-01-01'

SELECT	SUM(OrderTotal)
FROM	RETAIL_ORDER;
#No column name
#1235.00

SELECT SUM(OrderTotal) AS OrderSum
FROM 	RETAIL_ORDER;
-- OrderSum
-- 1235.00

SELECT	SUM(ExtendedPrice) AS OrderItemSum,
		AVG(ExtendedPrice) AS OrderItemAvg,
        MIN(ExtendedPrice) AS OrderItemMin,
        MAX(ExtendedPrice) AS OrderItemMax
FROM	ORDER_ITEM;
#OrderItemSum OrderItemAvg OrderItemMin OrderItemMax
#'1180.00',  '168.571429','50.00',     '300.00'

SELECT 	COUNT(*) AS NumberOfRows
FROM	ORDER_ITEM;
#NumberOfRows
#7

SELECT	COUNT(Department) AS DeptCount
FROM	SKU_DATA;
#DeptCount
#8

SELECT	COUNT(DISTINCT Department) AS DeptCount
FROM	SKU_DATA;
#DeptCount
#3

DESCRIBE RETAIL_ORDER;
-- 'OrderNumber','int(11)','NO','PRI',NULL,''
-- 'StoreNumber','int(11)','YES','',NULL,''
-- 'StoreZip','char(9)','YES','',NULL,''
-- 'OrderMonth','char(12)','NO','',NULL,''
-- 'OrderYear','int(11)','NO','',NULL,''
-- 'OrderTotal','decimal(9,2)','YES','',NULL,''

SELECT		OrderNumber, SKU, (Quantity * Price) AS EP
FROM		ORDER_ITEM
ORDER BY	OrderNumber, SKU;
#Order     SKU      EP 	
-- '1000','201000','300.00'
-- '1000','202000','130.00'
-- '2000','101100','200.00'
-- '2000','101200','100.00'
-- '3000','100200','300.00'
-- '3000','101100','100.00'
-- '3000','101200','50.00'

SELECT	SKU, SKU_Description,
		(Buyer + ' in ' +Department) AS Sponsor
FROM	ORDER_ITEM;


SELECT		*
FROM		RETAIL_ORDER JOIN ORDER_ITEM
ON			RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
WHERE 		OrderYear = '2014'
ORDER BY	RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;	
-- '1000','10','98110','December','2014','445.00','1000','201000','1','300.00','300.00'
-- '1000','10','98110','December','2014','445.00','1000','202000','1','130.00','130.00'
-- '2000','20','02335','December','2014','310.00','2000','101100','4','50.00','200.00'
-- '2000','20','02335','December','2014','310.00','2000','101200','2','50.00','100.00'














