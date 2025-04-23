-- Query result:
-- Find customers from America (with customer number, name, phone number and their nation)
-- and "loss" they generated from returned items.
-- Only list the top 10 customers who generated the most loss.

-- Note 1: Return status 'R' means returned.
-- Note 2: The loss here refers to the return of these items, i.e.
-- lineitem's price (excluding tax, discount, or amount).

-- Result schema:
-- [CUSTKEY | NATION | NAME | PHONE | LOSS (↓)]


SELECT CUSTOMER.CUSTKEY,
       NATION.NAME AS NATION,
       CUSTOMER.NAME,
       CUSTOMER.PHONE,
       SUM(LINEITEM.EXTENDEDPRICE ) AS LOSS
FROM CUSTOMER
JOIN NATION ON CUSTOMER.NATIONKEY = NATION.NATIONKEY
JOIN REGION ON NATION.REGIONKEY = REGION.REGIONKEY
JOIN ORDERS ON CUSTOMER.CUSTKEY = ORDERS.CUSTKEY
JOIN LINEITEM ON ORDERS.ORDERKEY = LINEITEM.ORDERKEY
WHERE REGION.NAME= 'AMERICA' AND LINEITEM.RETURNFLAG= 'R'
GROUP BY CUSTOMER.CUSTKEY, NATION.NAME, CUSTOMER.NAME, CUSTOMER.PHONE
ORDER BY LOSS DESC
FETCH FIRST 10 ROWS ONLY






