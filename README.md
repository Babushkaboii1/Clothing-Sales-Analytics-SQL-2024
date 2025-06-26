-- Clothing Sales Data Analysis Queries
-- Dataset table name: clothing_sales

-- 1. Total Sales (Gross Revenue)
SELECT 
  SUM(Total) AS Total_Sales
FROM clothing_sales;

-- 2. Net Revenue (After Refunds)
SELECT 
  SUM(Net_Revenue) AS Net_Revenue
FROM clothing_sales;

-- 3. Refund Rate (Percentage of refunded orders)
SELECT 
  ROUND(100 * SUM(CASE WHEN `Refund (Y/N)` = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Refund_Rate_Percentage
FROM clothing_sales;

-- 4. Monthly Sales Trend (Gross Sales and Net Revenue)
SELECT
  DATE_FORMAT(`Date`, '%Y-%m') AS Month,
  SUM(Total) AS Gross_Sales,
  SUM(Net_Revenue) AS Net_Revenue
FROM clothing_sales
GROUP BY Month
ORDER BY Month;

-- 5. Top Selling Products (by units sold)
SELECT
  Product,
  SUM(Quantity) AS Total_Units_Sold,
  SUM(Net_Revenue) AS Total_Net_Revenue
FROM clothing_sales
GROUP BY Product
ORDER BY Total_Units_Sold DESC;

-- 6. Customer Region Performance (Sales by Region)
SELECT
  `Customer Region`,
  SUM(Total) AS Total_Sales,
  SUM(Net_Revenue) AS Net_Revenue
FROM clothing_sales
GROUP BY `Customer Region`
ORDER BY Net_Revenue DESC;
