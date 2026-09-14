SELECT * FROM customer_journey
ORDER BY JourneyID;


WITH CleanRecords AS (  -- Creating CTE 
SELECT 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	UPPER(Stage) AS Stage,
	Action,
	Duration,
	AVG(Duration) OVER (
            PARTITION BY VisitDate
        ) AS avg_duration,
	ROW_NUMBER() OVER(
						PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action, Duration
						ORDER BY JourneyID) AS row_num
FROM customer_journey
)

SELECT 
	JourneyID,
	CustomerID,
	ProductID,
	FORMAT(CONVERT(DATE, VisitDate), 'dd-MM-yyyy') AS VisitDate,
	Stage,
	Action,
	COALESCE(Duration, avg_duration) AS Duration
FROM CleanRecords
WHERE row_num = 1;




