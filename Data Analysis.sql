--- Revenue Total for demographics

SELECT Age_Group, Gender, SUM(Revenue_Total) as Revenue_Total
FROM dbo.eCommerce_customer_sales
GROUP BY Age_Group, Gender
ORDER BY Revenue_Total DESC

--- Most used payment method 

SELECT Pay_Method, COUNT(Pay_Method) as Total
FROM dbo.eCommerce_customer_sales
GROUP BY Pay_Method
ORDER BY Total DESC

--- Most used browser 

SELECT Browser, COUNT(Browser) as Total
FROM dbo.eCommerce_customer_sales
GROUP BY Browser
ORDER BY Total DESC

--- Average Number of Purchases By Gender (N_Purchases)

SELECT Gender, AVG(CAST(N_Purchases AS int)) as Average_Purchases
FROM dbo.eCommerce_customer_sales
GROUP BY Gender
ORDER BY Average_Purchases DESC;

--- Average time spent on website by gender

SELECT Gender, AVG(Time_Spent) as Average_Time_Spent
FROM dbo.eCommerce_customer_sales
GROUP BY Gender

--- Average Revenue Total for Subscriber vs Non-Subscriber

SELECT Newsletter, AVG(Revenue_Total) as Average_Revenue, COUNT(Newsletter) as Newsletter_Total
FROM dbo.eCommerce_customer_sales
GROUP BY Newsletter

--- Average Revenue Total for Voucher Used vs Not Used

SELECT Voucher, AVG(Revenue_Total) as Average_Revenue, COUNT(Voucher) as Voucher_Total, 
FROM dbo.eCommerce_customer_sales
GROUP BY Voucher

--- Average Revenue & Time_Spent & Number of Purchases by Gender/Newsletter/Voucher/

SELECT Gender, Newsletter, Voucher, AVG(Revenue_Total) as Average_Revenue, AVG(CAST(N_Purchases AS int)) as Average_Purchases, AVG(Time_Spent) as Average_Time_Spent
FROM dbo.eCommerce_customer_sales
GROUP BY  Gender, Newsletter, Voucher
ORDER BY Gender, Newsletter, Voucher

--- Revenue Total by Season/Gender

SELECT Season, Gender, SUM(Revenue_Total) as Revenue_Total
FROM dbo.eCommerce_customer_sales
GROUP By Season, Gender
ORDER BY Gender, Revenue_Total

--- Revenue Total by Payment Method & Gender

SELECT Pay_Method, Gender, SUM(Revenue_Total) as Revenue_Total
FROM dbo.eCommerce_customer_sales
GROUP By Pay_Method, Gender
ORDER BY Revenue_Total DESC