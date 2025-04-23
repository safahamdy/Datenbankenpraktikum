-- Query result:
-- Output all suppliers who carry at least one item (part)
-- from the manufacturer “Manufacturer#2”
-- or the brand “Brand#52”.
-- Arrange the result in descending order by name.
--
-- Result schema:
-- [NAME (↓) | ADDRESS | PHONE]

SELECT SUPPLIER.NAME , SUPPLIER.ADDRESS, SUPPLIER.PHONE
FROM SUPPLIER
    WHERE EXISTS (
        SELECT 1
            FROM PARTSUPP
JOIN PART on PART.PARTKEY = PARTSUPP.PARTKEY
WHERE PART.MFGR= 'Manufacturer#2' OR PART.BRAND= 'Brand#52')
ORDER BY NAME DESC

