-- Query result:
-- For each shipping mode, find the name of the supplier  whose line items
-- were most often shipped using this shipping mode.
-- Arrange the result in descending order by number and ascending order by name.
--
-- Result schema:
-- [SHIPMODE | NAME(↑2) | AMOUNT(↓1)]

SELECT S.SHIPMODE,
       S.NAME,
       S.AMOUNT
FROM (
         SELECT LINEITEM.SHIPMODE,
                SUPPLIER.NAME,
                COUNT(*) AS AMOUNT
         FROM LINEITEM
                  JOIN SUPPLIER ON LINEITEM.SUPPKEY = SUPPLIER.SUPPKEY
         GROUP BY LINEITEM.SHIPMODE, SUPPLIER.NAME
     ) AS S
         JOIN (
    SELECT SHIPMODE,
           MAX(AMOUNT) AS MaxAmount
    FROM (
             SELECT LINEITEM.SHIPMODE,
                    SUPPLIER.NAME,
                    COUNT(*) AS AMOUNT
             FROM LINEITEM
                      JOIN SUPPLIER ON LINEITEM.SUPPKEY = SUPPLIER.SUPPKEY
             GROUP BY LINEITEM.SHIPMODE, SUPPLIER.NAME
         ) AS SupplierShipModeCount
    GROUP BY SHIPMODE
) AS MSC ON S.SHIPMODE = MSC.SHIPMODE
    AND S.AMOUNT = MSC.MaxAmount
ORDER BY S.AMOUNT DESC, S.NAME ASC;
