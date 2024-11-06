select* from amazon_books

--Top-Rated Books

SELECT TOP 10 Name, Author, User_Rating
FROM amazon_books
ORDER BY User_Rating DESC;



--Average Rating by Genre

SELECT Genre, ROUND(AVG(User_Rating),3)
AS Avg_Rating
FROM amazon_books
GROUP BY Genre
ORDER BY Avg_Rating DESC;

--Most Reviewed Books

SELECT Name, Author, Reviews
FROM amazon_books
ORDER BY Reviews DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--Average Price by Genre

SELECT Genre, ROUND(AVG(Price),3) AS Avg_Price
FROM amazon_books
GROUP BY Genre
ORDER BY Avg_Price DESC;


--Ratings Trend by Year

SELECT Year, ROUND(AVG(User_Rating), 3) AS Avg_Rating
FROM amazon_books
GROUP BY Year
ORDER BY Year;




