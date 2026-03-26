-- What is the total revenue generated during the analysis period?
SELECT
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM online_retail_2010_2011;

-- How many total customer orders were placed during the analysis period?
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011;

-- How many unique customers made purchases?
SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail_2010_2011;

-- How many total products (items) were sold?
SELECT
    SUM(Quantity) AS Total_Items_Sold
FROM online_retail_2010_2011;

-- What is the average order value (AOV)?
SELECT
    SUM(Quantity * UnitPrice) /
    COUNT(DISTINCT InvoiceNo) AS Average_Order_Value
FROM online_retail_2010_2011;

-- What is the average number of items purchased per order?
SELECT
    SUM(Quantity) /
    COUNT(DISTINCT InvoiceNo) AS Average_Items_Per_Order
FROM online_retail_2010_2011;

-- What is the average selling price per item?
SELECT
    AVG(UnitPrice) AS Average_Selling_Price
FROM online_retail_2010_2011;

-- How many orders were cancelled?
SELECT
    COUNT(DISTINCT InvoiceNo) AS Cancelled_Orders
FROM online_retail_2010_2011
WHERE InvoiceNo LIKE 'C%';

-- What is the monthly revenue trend during the analysis period?
SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    MONTH(InvoiceDate) AS Sales_Month,
    SUM(Quantity * UnitPrice) AS Monthly_Revenue
FROM online_retail_2010_2011
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Sales_Year, Sales_Month;

-- Which month generated the highest revenue?
SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    MONTH(InvoiceDate) AS Sales_Month,
    SUM(Quantity * UnitPrice) AS Revenue
FROM online_retail_2010_2011
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Revenue DESC
LIMIT 1;

-- How many customer orders were placed each month?
SELECT
    YEAR(InvoiceDate) AS Sales_Year,
    MONTH(InvoiceDate) AS Sales_Month,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Sales_Year, Sales_Month;

-- Which day of the week receives the highest number of customer orders?
SELECT
    DAYNAME(InvoiceDate) AS Day_Name,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011
GROUP BY DAYNAME(InvoiceDate)
ORDER BY Total_Orders DESC;

-- Which hour of the day records the highest sales activity?
SELECT
    HOUR(InvoiceDate) AS Sales_Hour,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011
GROUP BY HOUR(InvoiceDate)
ORDER BY Total_Orders DESC;

-- Which quarter generated the highest revenue?
SELECT
    QUARTER(InvoiceDate) AS Sales_Quarter,
    SUM(Quantity * UnitPrice) AS Revenue
FROM online_retail_2010_2011
GROUP BY QUARTER(InvoiceDate)
ORDER BY Revenue DESC;

-- Which are the Top 10 best-selling products based on quantity sold?
SELECT
    StockCode,
    Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM online_retail_2010_2011
WHERE Quantity > 0
GROUP BY StockCode, Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Which are the Top 10 highest revenue-generating products?
SELECT
    StockCode,
    Description,
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM online_retail_2010_2011
WHERE Quantity > 0
GROUP BY StockCode, Description
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Which products were returned most frequently?
SELECT
    StockCode,
    Description,
    COUNT(*) AS Return_Count
FROM online_retail_2010_2011
WHERE Quantity < 0
GROUP BY StockCode, Description
ORDER BY Return_Count DESC
LIMIT 10;
-- Who are the Top 10 customers based on total revenue?
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM online_retail_2010_2011
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Which customers placed the highest number of orders?
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 10;
-- Which countries generated the highest revenue?
SELECT
    Country,
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM online_retail_2010_2011
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Which countries placed the highest number of orders?
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail_2010_2011
GROUP BY Country
ORDER BY Total_Orders DESC;

-- Which countries have the largest customer base?
SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail_2010_2011
GROUP BY Country
ORDER BY Total_Customers DESC;

-- What percentage of total orders were cancelled?
SELECT
COUNT(DISTINCT CASE WHEN InvoiceNo LIKE 'C%' THEN InvoiceNo END) * 100.0 /
COUNT(DISTINCT InvoiceNo) AS Cancellation_Percentage
FROM online_retail_2010_2011;