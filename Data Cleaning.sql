--- Replacing numbers in Gender to attributes (0 = Male, 1 = Female)

UPDATE dbo.eCommerce_customer_sales
SET Gender = 
	CASE
		WHEN Gender = '0' then 'Male'
		WHEN Gender = '1' then 'Female'
	END;

--- Replacing numbers in Pay_Method to attributes (0 = Digital Wallets, 1 = Card, 2 = Paypal, 3 = Other)

UPDATE dbo.eCommerce_customer_sales
SET Pay_Method = 
	CASE
		WHEN Pay_Method = '0' then 'Digital Wallets'
		WHEN Pay_Method = '1' then 'Card'
		WHEN Pay_Method = '2' then 'Paypal'
		WHEN Pay_Method = '3' then 'Other'
	END;


--- Replacing numbers in Browser to their attributes

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

--- Converting Purchase_DATE format to YYYY-MM-DD format

UPDATE dbo.eCommerce_customer_sales
SET Purchase_DATE = CAST(CONVERT(DATETIME, Purchase_DATE, 3) AS DATE);

--- Adding a Season column

ALTER TABLE dbo.eCommerce_customer_sales
ADD Season VARCHAR(20);

UPDATE dbo.eCommerce_customer_sales
SET Season =
    CASE 
        WHEN MONTH(Purchase_DATE) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(Purchase_DATE) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(Purchase_DATE) IN (9, 10, 11) THEN 'Autumn'
        ELSE 'Winter'
    END;

--- Adding an Age_Group column

ALTER TABLE dbo.eCommerce_customer_sales
ADD Age_Group varchar(20);

UPDATE dbo.eCommerce_customer_sales
SET Age_Group =
    CASE  
		WHEN Age < 18 Then 'Teenagers'
		WHEN Age BETWEEN 18 AND 24 THEN 'Young Adult'
		WHEN Age BETWEEN 25 AND 39 THEN 'Adult'
		WHEN Age BETWEEN 40 AND 59 THEN 'Middle-Aged'
		ELSE 'Senior'
	END; 
