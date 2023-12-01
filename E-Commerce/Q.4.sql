# Ref- Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2


-- Select relevant columns from order, customer, supplier_pricing, and product tables
SELECT 
    c.CUS_ID, c.CUS_NAME, o.ORD_ID, p.PRO_NAME
FROM
    `ORDER` AS o
        INNER JOIN
    customer AS c ON c.CUS_ID = o.CUS_ID
        INNER JOIN
    supplier_pricing AS sp ON o.PRICING_ID = sp.PRICING_ID
        INNER JOIN
    product AS p ON sp.PRO_ID = p.PRO_ID
WHERE
    c.CUS_ID = 2;