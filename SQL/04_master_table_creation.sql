DROP TABLE IF EXISTS online_retail_master;

CREATE TABLE online_retail_master LIKE online_retail_2009_2010;

INSERT INTO online_retail_master
SELECT *
FROM online_retail_2009_2010;

INSERT INTO online_retail_master
SELECT *
FROM online_retail_2010_2011;


SELECT COUNT(*) AS Total_Transactions
FROM online_retail_master;

SELECT
MIN(InvoiceDate) AS First_Transaction,
MAX(InvoiceDate) AS Last_Transaction
FROM online_retail_master;

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail_master;

SELECT COUNT(DISTINCT StockCode) AS Total_Products
FROM online_retail_master;

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM online_retail_master;