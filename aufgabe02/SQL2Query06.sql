-- Query result:
-- Output the total account balances  and a number of all customers whose
-- account balance is more than 100.
-- Group them by a country (nation), and sort the results in descending order by its name.
--
-- Result schema:
-- [NAME (↓) | SUM | AMOUNT]

SELECT NATION.NAME AS NAME,
       SUM(CUSTOMER.ACCTBAL) AS SUM,
       COUNT(CUSTOMER.CUSTKEY) AS AMOUNT
FROM CUSTOMER
         JOIN NATION  ON CUSTOMER.NATIONKEY = NATION.NATIONKEY
WHERE CUSTOMER.ACCTBAL > 100
GROUP BY NATION.NAME
ORDER BY NATION.NAME DESC;
