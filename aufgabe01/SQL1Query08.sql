-- Query result:
-- Output the amount, shipping instructions, shipping mode, return flag of all lineitems.
-- Group tuples based on shipping instructions, shipping mode, and return flag.
-- Only output results where the number is greater than 4999.
-- Arrange the result in descending order by amount.

-- Result schema:
-- [AMOUNT (↓)| SHIPINSTRUCT | SHIPMODE| RETURNFLAG]


SELECT COUNT(*) AS AMOUNT,
       SHIPINSTRUCT ,
       SHIPMODE,
       RETURNFLAG
     FROM LINEITEM
     GROUP BY SHIPINSTRUCT, SHIPMODE, RETURNFLAG
     HAVING COUNT(*) > 4999
     ORDER BY AMOUNT DESC
