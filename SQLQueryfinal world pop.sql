SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo';
EXEC sp_rename 'world_population$', 'world_population';
select* from world_population
USE [PortfolioProject2];
GO
EXEC sp_rename 'world_population.[Density (per sqkm)]', 'Density_per_sqkm', 'COLUMN';

--Population Growth Over Time

SELECT Country_Code, 
       [Country/Territory], 
       [2022_Population], 
       [1970_Population], 
       ([2022_Population] - [1970_Population]) AS Population_Growth,
       (([2022_Population] - [1970_Population]) * 100.0 / [1970_Population]) AS Growth_Percentage
FROM world_population
ORDER BY Growth_Percentage DESC;


--Top 10 Most Populated Countries in 2022

SELECT TOP 10 Country_Code, 
               [Country/Territory], 
               [2022_Population], 
               Continent
FROM world_population
ORDER BY [2022_Population] DESC;

--Average Population Density by Continent

SELECT Continent, 
       AVG(Density_per_sqkm) AS Avg_Density_per_sqkm
FROM world_population
GROUP BY Continent
ORDER BY Avg_Density_per_sqkm DESC;


--Top 10 Countries with Highest Population Growth Rate

SELECT TOP 10 Country_Code, 
               [Country/Territory], 
               Growth_Rate
FROM world_population
ORDER BY Growth_Rate DESC;


--World Population Distribution by Continent

SELECT Continent, 
       SUM([2022_Population]) AS Total_Population, 
       (SUM([2022_Population]) * 100.0 / (SELECT SUM([2022_Population]) FROM world_population)) AS Population_Percentage
FROM world_population
GROUP BY Continent
ORDER BY Total_Population DESC;


--Historical Comparison: Countries with Declining Population

SELECT Country_Code, 
       [Country/Territory], 
       [2022_Population], 
       [2000_Population], 
       ([2000_Population] - [2022_Population]) AS Population_Decline
FROM world_population
WHERE [2022_Population] < [2000_Population]
ORDER BY Population_Decline DESC;


--Population Percentage of Each Country Relative to World Population

SELECT Country_Code, 
       [Country/Territory], 
       [2022_Population], 
       World_Population_Percentage
FROM world_population
ORDER BY World_Population_Percentage DESC;


--Most Densely Populated Countries

SELECT TOP 10 Country_Code, 
               [Country/Territory], 
               Density_per_sqkm
FROM world_population
ORDER BY Density_per_sqkm DESC;

--Most Densely Populated Countries with land area over 100,000 square km

SELECT TOP 10 
       Country_Code, 
       [Country/Territory], 
       Density_per_sqkm, 
       [Area(sqkm)], 
       [2022_Population]
FROM world_population
WHERE [Area(sqkm)] > 100000
ORDER BY Density_per_sqkm DESC;

