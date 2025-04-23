-- Query result:
-- Output the customer numbers of all customers who come from Germany,
-- are not in market segment 'FURNITURE'
-- and whose average order price is greater than 190500.
-- Each customer number should only be output once.
-- Arrange the result in descending order.

-- Result schema:
-- [CUSTOMER (↓)]


SELECT CUSTOMER.CUSTKEY AS CUSTOMER
FROM CUSTOMER
JOIN NATION ON CUSTOMER.NATIONKEY = NATION.NATIONKEY
JOIN ORDERS ON CUSTOMER.CUSTKEY = ORDERS.CUSTKEY
WHERE NATION.NAME='GERMANY'
  AND CUSTOMER.MKTSEGMENT!= 'FURNITURE'
GROUP BY CUSTOMER.CUSTKEY
HAVING AVG(ORDERS.TOTALPRICE) > 190500
ORDER BY CUSTOMER DESC





