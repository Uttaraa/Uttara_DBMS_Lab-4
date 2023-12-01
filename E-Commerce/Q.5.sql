# Ref- Q5) Display the Supplier details of who is supplying more than three product.

-- Select relevant columns from supplier for those supplying more than one product
SELECT 
    SUP.*
FROM
    supplier AS SUP
WHERE
    SUP.SUPP_ID IN (SELECT 
            SP.SUPP_ID
        FROM
            supplier_pricing AS SP
        GROUP BY SP.SUPP_ID
        HAVING COUNT(SP.SUPP_ID) > 1);