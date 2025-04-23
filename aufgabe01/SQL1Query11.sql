-- Query result:
-- Output the total volume (sum over price in lineitems)
-- of all customers who are in market segment 'AUTOMOBILE'
-- or 'MACHINERY'.
-- Group the output based on customer's key and name.
-- Arrange the result in ascending order by total volume.

-- Result schema:
-- [NAME | TOTAL_VOLUME (↑)]


SELECT CUSTOMER.NAME AS NAME
     , SUM(LINEITEM.EXTENDEDPRICE) AS TOTAL_VOLUME
FROM CUSTOMER
    JOIN ORDERS ON CUSTOMER.CUSTKEY=ORDERS.CUSTKEY
    JOIN LINEITEM ON ORDERS.ORDERKEY = LINEITEM.ORDERKEY
    WHERE MKTSEGMENT = 'AUTOMOBILE' OR MKTSEGMENT = 'MACHINERY'
    GROUP BY CUSTOMER.CUSTKEY, CUSTOMER.NAME
    ORDER BY TOTAL_VOLUME ASC
