# Ref- Q6) Find the least expensive product from each category and print the table with category id, name, and price of the product

-- Select the least expensive product from each category
SELECT 
    cat.CAT_ID, cat.CAT_NAME, MIN(t3.Min_Price) AS Min_Price
FROM
    category AS cat
        INNER JOIN
    (SELECT 
        p.CAT_ID, p.PRO_NAME, t2.*
    FROM
        product AS p
    INNER JOIN (SELECT 
        pro_id, MIN(supp_price) AS Min_Price
    FROM
        supplier_pricing
    GROUP BY pro_id) AS t2 ON t2.PRO_ID = p.PRO_ID) AS t3 ON t3.CAT_ID = cat.CAT_ID
GROUP BY t3.CAT_ID;