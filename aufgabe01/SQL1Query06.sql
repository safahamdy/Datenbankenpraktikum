-- Query result:
-- Output the amount, minimum, maximum and average price of all order lines.

-- Result schema:
-- [AMOUNT | MIN_PRICE | MAX_PRICE | AVG_PRICE]


SELECT COUNT(*) AS AMOUNT,
       MIN(EXTENDEDPRICE) AS MIN_PRICE,
       MAX(EXTENDEDPRICE) AS MAX_PRICE,
       AVG(EXTENDEDPRICE) AS AVG_PRICE
       FROM LINEITEM
