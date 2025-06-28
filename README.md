# 🧵 Clothing Sales Data Analytics Project

This project showcases an end-to-end data analytics process using SQL, Excel, and Tableau to analyze fictional clothing sales data from 2024. It focuses on uncovering key business insights like revenue trends, refund behavior, and regional performance.

---

## 📁 Project Overview

**Tools Used:**  
- SQL (MySQL) – for data analysis  
- Excel – for data cleaning and prep  
- Tableau – for data visualization  

**Dataset:**  
A fictional dataset with 100+ sales records, including fields such as:
- `Order ID`
- `Date`
- `Product`
- `Category`
- `Quantity`
- `Price`
- `Total`
- `Refund (Y/N)`
- `Customer Region`
- `Net Revenue`

---

## 🧪 Business Questions Answered

1. What are the monthly net revenue trends?
2. Which products are top sellers?
3. What is the refund rate?
4. Which customer regions generate the most revenue?

## ✅ Project Questions & Answers

**1. What are the monthly net revenue trends?**  
Sales were strong at the beginning of the year and peaked in March, with total revenue reaching its highest point. This spike was driven by increased hoodie and jogger sales, possibly due to colder weather or promotional efforts.

**2. Which products are top sellers?**  
Hoodies generated the most revenue overall, showing they are a key product line. Joggers and T-Shirts also performed well. On the other hand, Hats and Sweaters had lower revenue, which could indicate lower demand or less marketing.

**3. What is the refund rate?**  
Out of 50+ orders, only 2 were refunded, resulting in a 4% refund rate. This is relatively low and suggests high customer satisfaction, good sizing accuracy, or few product defects.

**4. Which customer regions generate the most revenue?**  
New York and Texas were the most profitable regions, followed by California, Illinois, and Florida. These top regions likely reflect a mix of strong population centers and product-market fit. A marketing focus in 
these areas could further boost revenue.

---

## 💻 SQL Code Samples

```sql
-- Total Net Revenue
SELECT SUM(Net_Revenue) AS total_net_revenue FROM sales_data;

-- Monthly Sales Trend
SELECT MONTH(Date) AS Month, SUM(Net_Revenue) AS Monthly_Revenue
FROM sales_data
GROUP BY MONTH(Date)
ORDER BY Month;

-- Top-Selling Products
SELECT Product, SUM(Net_Revenue) AS Revenue
FROM sales_data
GROUP BY Product
ORDER BY Revenue DESC;

-- Refund Rate
SELECT Refund, COUNT(*) AS Order_Count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales_data), 2) AS Percentage
FROM sales_data
GROUP BY Refund;

-- Sales by Customer Region
SELECT Customer_Region, SUM(Net_Revenue) AS Revenue
FROM sales_data
GROUP BY Customer_Region
ORDER BY Revenue DESC;
