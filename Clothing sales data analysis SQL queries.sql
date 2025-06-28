-- Total Net Revenue
SELECT SUM(`Net Revenue`) AS total_net_revenue
FROM `sales_data`;

-- Monthly Sales Trend
SELECT MONTH(`Date`) AS `Month`, SUM(`Net Revenue`) AS `Monthly_Revenue`
FROM `sales_data`
GROUP BY MONTH(`Date`)
ORDER BY `Month`;

-- Top-Selling Products
SELECT `Product`, SUM(`Net Revenue`) AS `Revenue`
FROM `sales_data`
GROUP BY `Product`
ORDER BY `Revenue` DESC;

-- Refund Rate
SELECT `Refund (Y/N)`, COUNT(*) AS `Order_Count`,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `sales_data`), 2) AS `Percentage`
FROM `sales_data`
GROUP BY `Refund (Y/N)`;

-- Revenue by Customer Region
SELECT `Customer Region`, SUM(`Net Revenue`) AS `Revenue`
FROM `sales_data`
GROUP BY `Customer Region`
ORDER BY `Revenue` DESC;

