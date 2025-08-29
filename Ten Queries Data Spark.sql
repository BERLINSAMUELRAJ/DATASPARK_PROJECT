--1.-- Customer Demographics – Gender distribution -- 
SELECT Gender, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Gender;

--2.-- Customer Age Groups (using Birthday → Age) --
SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) < 20 THEN '<20'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 20 AND 30 THEN '20-30'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
        ELSE '50+' 
    END AS AgeGroup,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) < 20 THEN '<20'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 20 AND 30 THEN '20-30'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
        WHEN DATEDIFF(YEAR, Birthday, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
        ELSE '50+' 
    END;

--3.-- Total Sales Revenue per Country --
SELECT s.Country, SUM(sa.Quantity * p.[Unit Price USD]) AS Total_Revenue
FROM Sales sa
JOIN Stores s ON sa.StoreKey = s.StoreKey
JOIN Products p ON sa.ProductKey = p.ProductKey
GROUP BY s.Country
ORDER BY Total_Revenue DESC;

--4.-- Top 5 Best-Selling Products --
SELECT TOP 5 p.[Product Name], SUM(sa.Quantity) AS Total_Units_Sold
FROM Sales sa
JOIN Products p ON sa.ProductKey = p.ProductKey
GROUP BY p.[Product Name]
ORDER BY Total_Units_Sold DESC;

--5.-- Most Popular Product Categories --
SELECT p.Category, SUM(sa.Quantity) AS Total_Units_Sold
FROM Sales sa
JOIN Products p ON sa.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY Total_Units_Sold DESC;

--6.-- Customers with Most Orders --
SELECT c.Name, COUNT(sa.[Order Number]) AS Total_Orders
FROM Sales sa
JOIN Customers c ON sa.CustomerKey = c.CustomerKey
GROUP BY c.Name
ORDER BY Total_Orders DESC;

--7.-- Store Performance – Revenue by Store --
SELECT sa.StoreKey, SUM(sa.Quantity * p.[Unit Price USD]) AS Store_Revenue
FROM Sales sa
JOIN Products p ON sa.ProductKey = p.ProductKey
GROUP BY sa.StoreKey
ORDER BY Store_Revenue DESC;

--8.-- Average Delivery Time --
SELECT AVG(DATEDIFF(DAY, [Order Date], [Delivery Date])) AS Avg_Delivery_Days
FROM Sales;

--9.-- Revenue Adjusted for Exchange Rates (e.g., EUR, GBP etc.) --
SELECT sa.[Currency Code], SUM(sa.Quantity * p.[Unit Price USD] * er.Exchange) AS Revenue_in_Local_Currency
FROM Sales sa
JOIN Products p ON sa.ProductKey = p.ProductKey
JOIN Exchange_Rates er 
    ON sa.[Order Date] = er.Date 
   AND sa.[Currency Code] = er.Currency
GROUP BY sa.[Currency Code]
ORDER BY Revenue_in_Local_Currency DESC;

--10.-- Sales Trend by Month --
SELECT 
    FORMAT(sa.[Order Date], 'yyyy-MM') AS Month,
    SUM(sa.Quantity * p.[Unit Price USD]) AS Monthly_Revenue
FROM Sales sa
JOIN Products p ON sa.ProductKey = p.ProductKey
GROUP BY FORMAT(sa.[Order Date], 'yyyy-MM')
ORDER BY Month;
