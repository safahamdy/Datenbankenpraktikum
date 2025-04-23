-- Query result:
-- Output the number of customers and the average account balance of all customers who are in the 'BUILDING' market segment.

-- Result schema:
-- [AMOUNT | AVERAGE]


SELECT COUNT(DISTINCT NAME) AS AMOUNT,
AVG (ACCTBAL) AS AVERAGE FROM CUSTOMER
WHERE MKTSEGMENT ='BUILDING'

