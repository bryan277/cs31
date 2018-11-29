LIKE - used in where for pattern matching
% matches one or more
- matches exactly one

NULL - an attribute value that has never been supplied

IS NULL
IS NOT NULL
<=> NULL

SELECT IFNULL(catalogPage, 'Not in printed catalog')
FROM catalog_sku_2015;
