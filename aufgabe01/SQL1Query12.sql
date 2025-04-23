-- Query result:
-- Output the amount, region name, and shipping mode
-- of all lineitems excluding order lines in Canada.
-- Group the result based on region name and shipping mode.
-- Another tip: It is not necessary to use the Customer table, it is enough to go over the Suppliers.
-- Order the result in ascending order by amount.

-- Result schema:
-- [AMOUNT(↑) | NAME | SHIPMODE]


SELECT COUNT(*) AS AMOUNT,
       REGION.NAME AS NAME ,
       LINEITEM.SHIPMODE
       FROM LINEITEM
JOIN SUPPLIER ON LINEITEM.SUPPKEY = SUPPLIER.SUPPKEY
JOIN NATION ON SUPPLIER.NATIONKEY = NATION.NATIONKEY
JOIN REGION ON NATION.REGIONKEY= REGION.REGIONKEY
WHERE NATION.NAME !='CANADA'
GROUP BY REGION.NAME, LINEITEM.SHIPMODE
ORDER BY AMOUNT ASC




