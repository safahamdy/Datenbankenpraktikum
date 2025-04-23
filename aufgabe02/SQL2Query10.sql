-- Query result:
-- For all suppliers from Canada, output the items for which the available supply value
-- is less than 3/1000 of the available supply value of all items from this supplier.
-- The available supply value of an item is the product of the available quantity and the supply cost.
-- Arrange the result in descending order by value and suppkey.
--
-- Result schema:
-- [SUPPKEY (↓2) | PARTKEY | PART_NAME| VALUE (↓1)]

SELECT SUPPLIER.SUPPKEY,
       PARTSUPP.PARTKEY,
       PART.NAME AS PART_NAME,
       (PARTSUPP.AVAILQTY * PARTSUPP.SUPPLYCOST) AS VALUE
FROM SUPPLIER
         JOIN NATION ON SUPPLIER.NATIONKEY = NATION.NATIONKEY
         JOIN PARTSUPP ON SUPPLIER.SUPPKEY = PARTSUPP.SUPPKEY
         JOIN PART  ON PARTSUPP.PARTKEY = PART.PARTKEY

         JOIN (SELECT SUPPLIER.SUPPKEY, SUM(PARTSUPP.AVAILQTY * PARTSUPP.SUPPLYCOST) AS TotalSupply
    FROM SUPPLIER
             JOIN NATION  ON SUPPLIER.NATIONKEY = NATION.NATIONKEY
             JOIN PARTSUPP  ON SUPPLIER.SUPPKEY = PARTSUPP.SUPPKEY
    WHERE NATION.NAME = 'CANADA'
    GROUP BY SUPPLIER.SUPPKEY
)
             AS S ON SUPPLIER.SUPPKEY = S.SUPPKEY
WHERE NATION.NAME = 'CANADA'
  AND (PARTSUPP.AVAILQTY * PARTSUPP.SUPPLYCOST) < (S.TotalSupply * 0.003)
ORDER BY VALUE DESC, SUPPLIER.SUPPKEY DESC;
