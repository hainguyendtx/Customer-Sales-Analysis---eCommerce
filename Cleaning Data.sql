--- Checking for null values

SELECT *
FROM dbo.eCommerce_customer_sales
WHERE
	Customer_id is NULL
	OR Age is NULL
	OR Gender is NULL
	OR Revenue_Total is NULL
	OR N_Purchases is NULL
	OR Purchase_DATE is NULL
	OR Purchase_VALUE is NULL
	OR Pay_Method is NULL
	OR Time_Spent is NULL
	OR Browser is NULL
	OR Newsletter is NULL
	OR Voucher is NULL

--- Checking for duplicates

SELECT *
FROM dbo.eCommerce_customer_sales
GROUP BY Customer_id, Age, Gender, Revenue_Total, N_Purchases, Purchase_DATE, Purchase_VALUE, Pay_Method, Time_Spent, Browser, Newsletter, Voucher
HAVING COUNT(*) > 1;

--- Replacing numbers in Pay_Method to their name (0 = Digital Wallets, 1 = Card, 2 = Paypal, 3 = Other)

UPDATE dbo.eCommerce_customer_sales
SET Pay_Method = 
	CASE
		WHEN Pay_Method = '0' then 'Digital Wallets'
		WHEN Pay_Method = '1' then 'Card'
		WHEN Pay_Method = '2' then 'Paypal'
		WHEN Pay_Method = '3' then 'Other'
	END;


--- Replacing numbers in Browser to their name

UPDATE dbo.eCommerce_customer_sales
SET Browser =
	CASE
		WHEN Browser = '0' then 'Chrome'
		WHEN Browser = '1' then 'Safari'
		WHEN Browser = '2' then 'Edge'
		WHEN Browser = '3' then 'Other'
	END;

--- Replacing numbers in Newsletter to Non-Subscriber or Subscribers

UPDATE dbo.eCommerce_customer_sales
SET Newsletter =
	CASE
		WHEN Newsletter = '0' then 'Non-Subscriber'
		WHEN Newsletter = '1' then 'Subscriber'
	END;
		
--- Replacing numbers in Voucher to Not Used or Used

UPDATE dbo.eCommerce_customer_sales
SET Voucher =
	CASE
		WHEN Voucher = '0' then 'Not Used'
		WHEN Voucher = '1' then 'Used'
	END;

--- Converting Time_Spent to time format by adding new column with new formatting

ALTER TABLE dbo.eCommerce_customer_sales
ADD Time_Spent_Converted TIME;

UPDATE dbo.eCommerce_customer_sales
SET Time_Spent_Converted = CONVERT(TIME, DATEADD(SECOND, Time_Spent, '00:00:00'));

