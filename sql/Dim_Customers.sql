
SELECT * FROM customers;
SELECT * FROM geography;


SELECT 
	c.CustomerID,
	c.Email,
	c.Gender,
	c.Age,
	g.Country,
	g.City
FROM customers AS c
LEFT JOIN
geography AS g
ON 
c.GeographyID = g.GeographyID;