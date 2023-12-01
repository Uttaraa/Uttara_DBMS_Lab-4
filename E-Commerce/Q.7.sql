# Ref- Q7) Display the Id and Name of the Product ordered after “2021-10-05”.

-- Display the Id and Name of the Product ordered after “2021-10-05”
SELECT 
    p.PRO_ID, p.PRO_NAME
FROM
    product AS p
        INNER JOIN
    (SELECT 
        o.*, sp.PRO_ID
    FROM
        `ORDER` AS o
    INNER JOIN supplier_pricing AS sp ON sp.PRICING_ID = o.pricing_id
        AND o.ord_date > '2021-10-05') AS q ON p.PRO_ID = q.PRO_ID