-- Query result:
-- Consider all groups of orders that have
-- the same order date, the same clerk, and the same shipping priority.
-- From these groups, accept orders whose total price is
-- lower than the total price of another order in this group.
-- Return the customers associated with these orders (excluding duplicates).
-- Sort the result by name in descending order.

-- Result schema:
-- [NAME (↓)]


SELECT DISTINCT CUSTOMER.NAME
FROM ORDERS AS firstOrder
         JOIN ORDERS AS secondOrder
                  ON firstOrder.ORDERDATE = secondOrder.ORDERDATE
AND firstOrder.CLERK = secondOrder.CLERK AND firstOrder.SHIPPRIORITY = secondOrder.SHIPPRIORITY
                  AND firstOrder.TOTALPRICE < secondOrder.TOTALPRICE
         JOIN CUSTOMER ON firstOrder.CUSTKEY = CUSTOMER.CUSTKEY
ORDER BY CUSTOMER.NAME DESC


