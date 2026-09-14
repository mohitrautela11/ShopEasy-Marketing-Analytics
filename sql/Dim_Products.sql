

SELECT 
	ProductID,
	ProductName,
	Price,
	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN price BETWEEN 50 AND 205 THEN 'Medium'
		ELSE 'High'
	END AS Price_Category
FROM products;


