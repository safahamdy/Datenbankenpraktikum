-- Query result:
-- Find orders that were placed between January 1st, 1995 and
-- December 31st, 1997 (closed interval) and for which at least 2 line items
-- were delivered later than promised.
-- For each order priority output how many orders were affected.
-- Arrange the result in descending order by amount.
--
-- Result schema:
-- [ORDERPRIORITY| AMOUNT (↓)]

SELECT PRIORITY,
       COUNT(ORDERKEY) AS AMOUNT

FROM (SELECT ORDERS.ORDERKEY,
             ORDERS.ORDERPRIORITY AS PRIORITY,
             COUNT(*) AS LateItem
         FROM LINEITEM
        JOIN ORDERS ON ORDERS.ORDERKEY = LINEITEM.ORDERKEY
         WHERE ORDERS.ORDERDATE BETWEEN DATE '1995-01-01' AND DATE '1997-12-31'
        AND LINEITEM.RECEIPTDATE > LINEITEM.COMMITDATE
         GROUP BY ORDERS.ORDERKEY, ORDERS.ORDERPRIORITY)
WHERE LateItem >= 2
GROUP BY PRIORITY
ORDER BY AMOUNT DESC;