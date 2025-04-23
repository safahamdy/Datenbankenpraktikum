-- Query result::
-- Output the amount, minimum, maximum, average and total price of all lineitems.
-- Group the aggregations by the shipping mode and arrange the result in ascending alphabetical order by shipping mode.

-- Result schema:
-- [SHIPMODE (↑) | AMOUNT | MIN | MAX | AVG | TOTAL]


SELECT SHIPMODE,
    COUNT (*) AS AMOUNT,
       MIN(EXTENDEDPRICE) AS MIN,
       MAX(EXTENDEDPRICE) AS MAX,
       AVG(EXTENDEDPRICE) AS AVG,
       SUM(EXTENDEDPRICE) AS TOTAL
FROM LINEITEM
GROUP BY SHIPMODE ORDER BY SHIPMODE ASC
