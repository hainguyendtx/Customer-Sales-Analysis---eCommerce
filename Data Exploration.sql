--- Checking data types of all columns

SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'eCommerce_customer_sales'

	--- Time_Spent needs conversion, will add new column
	--- Purchase_DATE needs conversion

--- Checking for null values

SELECT COUNT(*) - COUNT(Customer_id) Customer_id,
 COUNT(*) - COUNT(Age) Age,
 COUNT(*) - COUNT(Gender) Gender,
 COUNT(*) - COUNT(Revenue_Total) Revenue_Total,
 COUNT(*) - COUNT(N_Purchases) N_Purchase,
 COUNT(*) - COUNT(Purchase_DATE) Purchase_Date,
 COUNT(*) - COUNT(Purchase_VALUE) Purchase_Value,
 COUNT(*) - COUNT(Pay_Method)Pay_Method,
 COUNT(*) - COUNT(Time_Spent) Time_Spent,
 COUNT(*) - COUNT(Browser) Browser,
 COUNT(*) - COUNT(Newsletter) Newsletter,
 COUNT(*) - COUNT(Voucher) Voucher
FROM dbo.eCommerce_customer_sales;

--- Checking for duplicates

SELECT Customer_id as Duplicate
FROM dbo.eCommerce_customer_sales
GROUP BY Customer_id
HAVING COUNT(*) > 1;

--- Customer_id - all have length of 6 - no need to clean

SELECT LEN(Customer_id) AS Customer_id, COUNT(Customer_id) AS no_of_rows
FROM dbo.eCommerce_customer_sales
GROUP BY Customer_id;

--- Age - sample size for each age are relatively around the same 

SELECT DISTINCT Age, COUNT(Age) AS No_Of_Age
FROM dbo.eCommerce_customer_sales
GROUP BY Age;

--- Gender - need to replace numerical to their attributes name, twice as much female as there is male

SELECT DISTINCT Gender, COUNT(Gender) AS No_Of_Gender
FROM dbo.eCommerce_customer_sales
GROUP BY Gender;

--- Pay_Method - need to replace numerical to their attributes name

SELECT DISTINCT Pay_Method, Count(Pay_Method) AS No_Of_Pay_Method
FROM dbo.eCommerce_customer_sales
GROUP BY Pay_Method;

--- Browser -  need to replace numerical to their attributes name - majority are using Chrome browsers

SELECT DISTINCT Browser, Count(Browser) AS No_Of_Browser
FROM dbo.eCommerce_customer_sales
GROUP BY Browser;

--- Newsletter - need to replace numerical to their attributes name - majority aren't not subscriber

SELECT DISTINCT Newsletter, Count(Newsletter) AS No_Of_Subscribers
FROM dbo.eCommerce_customer_sales
GROUP BY Newsletter;

--- Voucher - need to replace numerical to their attributes name - majority aren't using Voucher

SELECT DISTINCT Voucher, Count(Voucher) AS No_Of_Voucher
FROM dbo.eCommerce_customer_sales
GROUP BY Voucher;

--- N_Purchases - number of amount purchases are relatively consistent

SELECT DISTINCT N_Purchases, Count(N_Purchases) AS No_Of_Purchases
FROM dbo.eCommerce_customer_sales
GROUP BY N_Purchases;

