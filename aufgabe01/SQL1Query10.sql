-- Query result:
-- Output the number of customers per nation.
-- Group output based on nation's name.
-- Arrange the result in ascending order of amount.

-- Result schema:
-- [NATION | AMOUNT (↑)]


SELECT NATION.NAME AS NATION,
       COUNT(CUSTOMER.CUSTKEY) AS AMOUNT
FROM CUSTOMER
         JOIN NATION ON CUSTOMER.NATIONKEY = NATION.NATIONKEY
GROUP BY NATION.NAME
ORDER BY AMOUNT ASC;

