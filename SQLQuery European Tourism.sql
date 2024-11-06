select * from tourdata$
SELECT TOP 10 *
FROM tourdata$;

--Total Tourist Destinations

SELECT COUNT(*) AS Total_Tourist_Destinations
FROM tourdata$;

-- Most popular tourist destinations

SELECT Destination, Approximate_Annual_Tourists
FROM tourdata$
ORDER BY Approximate_Annual_Tourists DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--Total tourists by Country

SELECT Country, SUM(Approximate_Annual_Tourists) AS Total_Tourists
FROM tourdata$
GROUP BY Country
ORDER BY Total_Tourists DESC;

--Average Tourists per Country

SELECT Country, AVG(Approximate_Annual_Tourists) AS Average_Tourists
FROM tourdata$
GROUP BY Country
ORDER BY Average_Tourists DESC;


--Best Time to Visit by Country

SELECT Country, Best_Time_to_Visit, COUNT(*) AS Destinations
FROM tourdata$
GROUP BY Country, Best_Time_to_Visit
ORDER BY Destinations DESC;

--Most Expensive Destinations Based on Cost of Living

SELECT Destination, Country, Cost_of_Living
FROM tourdata$
WHERE Cost_of_Living = 'Extremely high'
ORDER BY Approximate_Annual_Tourists DESC;


SELECT Destination, Country, Cost_of_Living
FROM tourdata$
WHERE Cost_of_Living = 'High'
ORDER BY Approximate_Annual_Tourists DESC;

