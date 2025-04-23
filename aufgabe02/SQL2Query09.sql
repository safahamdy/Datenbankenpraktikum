-- Query result:
-- For each customer, calculate how many of their orders contained only
-- items from local suppliers.
-- Local supplier means that the supplier is located in the same country as the customer.
-- Return all customers who had at least one such local order.
-- Arrange the results in ascending order by region, country and descending by customer name.
--
-- Result scheme:
-- [CUSTOMER (↓3) | AMOUNT | NATION (↑2) | REGION (↑1)]

SELECT C.NAME AS CUSTOMER,
       COUNT(LO.ORDERKEY) AS AMOUNT,
       N.NAME AS NATION,
       R.NAME AS REGION
FROM CUSTOMER C
         JOIN (
    SELECT O.CUSTKEY,
           O.ORDERKEY
    FROM ORDERS O
             JOIN LINEITEM L ON O.ORDERKEY = L.ORDERKEY
             JOIN SUPPLIER S ON L.SUPPKEY = S.SUPPKEY
             JOIN CUSTOMER C ON O.CUSTKEY = C.CUSTKEY
    GROUP BY O.CUSTKEY, O.ORDERKEY
    HAVING COUNT(DISTINCT L.SUPPKEY) = COUNT(DISTINCT CASE WHEN S.NATIONKEY = C.NATIONKEY THEN L.SUPPKEY END)
) AS LO ON C.CUSTKEY = LO.CUSTKEY
         JOIN NATION N ON C.NATIONKEY = N.NATIONKEY
         JOIN REGION R ON N.REGIONKEY = R.REGIONKEY
GROUP BY C.CUSTKEY, C.NAME, N.NAME, R.NAME
HAVING COUNT(LO.ORDERKEY) > 0
ORDER BY REGION ASC, NATION ASC, CUSTOMER DESC;
