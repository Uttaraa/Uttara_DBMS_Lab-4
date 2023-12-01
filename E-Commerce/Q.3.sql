# Ref- Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

-- Select relevant columns from order and customer tables
SELECT 
    o.ORD_ID,
    o.ORD_AMOUNT,
    o.ORD_DATE,
    c.CUS_ID,
    c.CUS_NAME,
    c.CUS_GENDER
FROM
    `order` AS o
        INNER JOIN
    customer AS c ON c.CUS_ID = o.CUS_ID
WHERE
    o.ORD_AMOUNT >= 3000;

-- Count the number of customers based on gender
SELECT 
    COUNT(*) AS No_Of_Customer, c.CUS_GENDER AS Gender
FROM
    `order` AS o
        INNER JOIN
    customer AS c ON c.CUS_ID = o.CUS_ID
WHERE
    o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;