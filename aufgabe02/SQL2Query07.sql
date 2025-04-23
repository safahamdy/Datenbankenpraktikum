-- Query result:
-- Determine the brand(s) offered by most suppliers.
-- Arrange the result in ascending order by brand.
--
-- Result scheme:
-- [Marke (↑)]

SELECT PART.BRAND AS BRAND
FROM PART
         JOIN PARTSUPP ON PART.PARTKEY = PARTSUPP.PARTKEY
GROUP BY PART.BRAND
HAVING COUNT(DISTINCT PARTSUPP.SUPPKEY) = (
    SELECT MAX(SupplierCount)
    FROM (
             SELECT COUNT(DISTINCT PARTSUPP.SUPPKEY) AS SupplierCount
             FROM PART
                      JOIN PARTSUPP ON PART.PARTKEY = PARTSUPP.PARTKEY
             GROUP BY PART.BRAND
         ) AS SupplierCounts
)
ORDER BY BRAND ASC;
