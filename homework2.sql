-- Hans Vos
-- CS 31
-- Homework 2

-- 1. Write an SQL statement to display the data for all columns from the retail_order table.
SELECT *
FROM retail_order;

-- 2. Write an SQL statement to display the data for 2 columns from the order_item table.
SELECT Price, ExtendedPrice
FROM order_item;


-- 3. Write an SQL statement to display the data for 2 columns from the catalog_sku_2014 table.
SELECT Department, CatalogPage
FROM catalog_sku_2014;

-- 4. Write an SQL statement to display the data for all columns from the catalog_sku_2015 table. Restrict the display to only 7 rows.
SELECT *
FROM catalog_sku_2015
LIMIT 7;

-- 5. Write an SQL statement to display the Buyer and Department columns from the sku_data table. Restrict the display to 2 rows and remove all duplicate rows.
SELECT Distinct Buyer, Department
FROM sku_data
LIMIT 2;

-- 6. Write an SQL statement to display the data for all columns from the artist table.
SELECT *
FROM artist;

-- 7. Write an SQL statement to display the data for all columns from the trans table. Restrict the display to only 10 rows.
SELECT *
FROM trans
LIMIT 10;
