-- Query result:
-- Output all the manufacturer (MFGR) in decending alphabetical order.
-- Result schema:
-- [MFGR(↓)]


SELECT MFGR FROM PART ORDER BY MFGR DESC


SELECT *
FROM LINEITEM, ORDERS
WHERE LINEITEM.ORDERKEY = ORDERS.ORDERKEY
  AND CLERK = 'Clerk#000000124'
  AND TOTALPRICE BETWEEN 1000 AND 5000;

