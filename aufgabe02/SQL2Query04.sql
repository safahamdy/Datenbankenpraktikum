
-- For all brands and manufacturers , output the items that are in the lowest 1,5%
-- of the brand's price range (closed interval).
-- The price range is the interval between the cheapest and most expensive item.
-- Arrange the results in ascending order by manufacturer and brand, and then in descending order by name.
--
-- Result scheme:
-- [MFGR (↑1) | BRAND (↑2) | NAME (↓3)]

SELECT PART.MFGR,
       PART.BRAND,
       PART.NAME
FROM PART,
     (SELECT BRAND,
             MFGR,
             MIN(RETAILPRICE) AS MinPrice,
             MAX(RETAILPRICE) AS MaxPrice
      FROM PART
      GROUP BY BRAND, MFGR) AS PriceRange
WHERE PART.BRAND = PriceRange.BRAND
  AND PART.MFGR = PriceRange.MFGR
  AND PART.RETAILPRICE <= (PriceRange.MinPrice + 0.015 * (PriceRange.MaxPrice - PriceRange.MinPrice))
ORDER BY PART.MFGR ASC, PART.BRAND ASC, PART.NAME DESC;
