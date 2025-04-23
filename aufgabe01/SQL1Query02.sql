-- Query result:
-- Output all market segment of customers excluding duplicates in ascending alphabetical order.

-- Result schema:
-- [MKTSEGMENT (↑)]


SELECT DISTINCT CUSTOMER.MKTSEGMENT FROM CUSTOMER ORDER BY MKTSEGMENT ASC