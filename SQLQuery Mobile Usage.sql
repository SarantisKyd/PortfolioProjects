
--Average Total App Usage Hours by Age Group
SELECT Age,
       ROUND(AVG(Total_App_Usage_Hours),2) AS Avg_Total_App_Usage_Hours
FROM mobile_usage
GROUP BY Age
ORDER BY Age;

--Total Daily Screen Time Hours by Gender

SELECT Gender,
       SUM(Daily_Screen_Time_Hours) AS Total_Daily_Screen_Time_Hours
FROM mobile_usage
GROUP BY Gender;


 --Average Number of Apps Used by Location

 SELECT Location,
       ROUND(AVG(Number_of_Apps_Used),2) AS Avg_Number_of_Apps_Used
FROM mobile_usage
GROUP BY Location
ORDER BY Avg_Number_of_Apps_Used DESC;


 --Total Social Media Usage Hours by Age

 SELECT Age,
       SUM(Social_Media_Usage_Hours) AS Total_Social_Media_Usage_Hours
FROM mobile_usage
GROUP BY Age
ORDER BY Age;


 --Productivity App Usage Analysis

 SELECT CASE 
            WHEN Productivity_App_Usage_Hours = 0 THEN 'No Usage'
            WHEN Productivity_App_Usage_Hours < 1 THEN 'Less than 1 hour'
            WHEN Productivity_App_Usage_Hours BETWEEN 1 AND 3 THEN '1-3 hours'
            ELSE 'More than 3 hours'
        END AS Productivity_Usage_Category,
        COUNT(*) AS User_Count
FROM mobile_usage
GROUP BY CASE 
            WHEN Productivity_App_Usage_Hours = 0 THEN 'No Usage'
            WHEN Productivity_App_Usage_Hours < 1 THEN 'Less than 1 hour'
            WHEN Productivity_App_Usage_Hours BETWEEN 1 AND 3 THEN '1-3 hours'
            ELSE 'More than 3 hours'
        END;


 --Gaming App Usage Hours vs Total App Usage Hours

 SELECT SUM(Gaming_App_Usage_Hours) AS Total_Gaming_App_Usage_Hours,
       SUM(Total_App_Usage_Hours) AS Total_App_Usage_Hours,
       (SUM(Gaming_App_Usage_Hours) * 100.0 / SUM(Total_App_Usage_Hours)) AS Percentage_Gaming_App_Usage
FROM mobile_usage;
