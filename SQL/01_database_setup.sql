CREATE DATABASE enterprise_ecommerce_db;
USE enterprise_ecommerce_db;
CREATE TABLE online_retail_2009_2010 (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT NULL,
    Country VARCHAR(100)
);
LOAD DATA LOCAL INFILE 'C:/Users/kowsh/Downloads/archive (5)/online_retail_09_10.csv'
INTO TABLE online_retail_2009_2010
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    @InvoiceDate,
    UnitPrice,
    @CustomerID,
    Country
)
SET
    InvoiceDate = STR_TO_DATE(@InvoiceDate, '%c/%e/%Y %k:%i'),
    CustomerID = NULLIF(@CustomerID,'');

SELECT * FROM ONLINE_RETAIL_2009_2010;

