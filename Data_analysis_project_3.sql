SELECT * FROM global_superstore.`global superstore_cleaned`;

-- Which products and categories generate the most profit?
SELECT
    category,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore.`global superstore_cleaned`
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Which regions have high sales but low profitability?
SELECT
    region,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM  global_superstore.`global superstore_cleaned`
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Which customer segments are most valuable?
SELECT
    segment,
    COUNT(order_id) AS Number_of_Orders,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND(AVG(sales), 2) AS Average_Order_Value
FROM global_superstore.`global superstore_cleaned`
GROUP BY segment
ORDER BY Total_Profit DESC;

-- Are discounts hurting profit?
SELECT
    discount,
    ROUND(AVG(profit), 2) AS Average_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*) AS Number_of_Orders
FROM global_superstore.`global superstore_cleaned`
GROUP BY Discount
ORDER BY Discount;

-- How does sales performance vary by month or season?
SELECT
    MONTH(order_date) AS Month_Number,
    MONTHNAME(order_date) AS Month_Name,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore.`global superstore_cleaned`
GROUP BY 
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY Month_Number;

-- Which customers generate the most revenue and profit?
SELECT
    Customer_Name,
    COUNT(order_iD) AS Number_of_Orders,
    ROUND(SUM(sales), 2) AS Total_Revenue,
    ROUND(SUM(profit), 2) AS Total_Profit,
    ROUND(AVG(sales), 2) AS Average_Order_Value
FROM global_superstore.`global superstore_cleaned`
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10;
