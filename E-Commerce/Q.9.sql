# Ref- Q9) Create a stored procedure to display supplier id, name, rating and Type_of_supplier. 
# If rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”. 

DELIMITER $$

CREATE PROCEDURE `supplier_ratings` ()
BEGIN
	SELECT report.SUPP_ID, report.Average,
	CASE
		WHEN report.Average = 5 THEN 'Excellent Service'
		WHEN report.Average > 4 THEN 'Good Service'
		WHEN report.Average > 2 THEN 'Average Service'
		ELSE 'Poor Service'
	END AS Type_of_Service
	FROM
	(
		SELECT test2.supp_id, AVG(rat_ratstars) AS Average
		FROM
		(
			SELECT sp.SUPP_ID, t1.ord_id, t1.rat_ratstars
			FROM supplier_pricing AS sp
			INNER JOIN
			(
				SELECT o.PRICING_ID, rat.ORD_ID, rat.RAT_RATSTARS
				FROM `order` AS o
				INNER JOIN rating AS rat ON o.ORD_ID = rat.ORD_ID
			) AS t1 ON sp.PRICING_ID = t1.pricing_id
		) AS test2
		GROUP BY test2.SUPP_ID
	) AS report;
END$$

DELIMITER ;