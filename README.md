# eCommerce Store

Sales analysis on an eCommerce Store

By Hai Nguyen 

# Background
In today's ever-evolving business landscape, understanding customer behavior through sales data analysis is paramount. Our case study delves into this realm, following the journey of an eCommerce store. Faced with intense competition and changing market dynamics, our client embarked on a data-driven transformation.

Throughout the study, we highlight how our client utilized advanced analytics to uncover hidden patterns and optimize sales strategies. By segmenting customers and identifying high-value segments, they not only enhanced marketing effectiveness but also fostered deeper customer connections, ultimately driving bottom-line results. Join us as we explore the transformative impact of customer sales analysis, showcasing how data-driven decisions propelled our client to sustained success in today's dynamic business landscape.

# Key Stakeholders
•	Owners/Founders: Those who have invested capital and resources to establish and operate the eCommerce business

•	Marketing and Advertising Agencies: These partners are critical for devising and executing effective marketing campaigns aimed at increasing sales and revenue.

•	Payment Service Providers: Ensuring smooth and secure payment processing is essential for minimizing cart abandonment and maximizing revenue conversion.

•  Customers: Understanding customer behavior and preferences is crucial for driving revenue growth. Customers are key stakeholders as their purchasing decisions directly impact revenue generation.

•  Sales Team: Play a pivotal role in driving revenue and maintaining customer relationships, and the executive leadership, who oversee strategic decision-making and set the overall direction of the organization.

# Ask
Business task: Implement a comprehensive sales and marketing strategy to increase revenue and drive sales growth, and to unlock sales insights that are not visible before for sales team for decision support. 

Analysis question: The three question below will guide the future marketing program.

1.	Which demographic segment (age group or gender) contributes the most to overall revenue, and how does their purchasing behavior differ from other segments?
2. How do seasonal fluctuations affect revenue generation across demographic segments, and what implications do they have for marketing and sales strategies?
3.	What impact do different payment methods have on revenue generation, and how can this information be leveraged to optimize the checkout experience?

# Preparation

### Data Sources 

Data used is publicly available on Kaggle - [(Online Shop Customer Sales Data)](https://www.kaggle.com/datasets/onlineretailshop/online-shop-customer-sales-data/data)

The datasets are appropriate and can be used to answer business questions. The data has been made available by Kaggle's user Jonas Ungermans. The datasets provided can offer valuable insights into customer demographics and behavior. They serve as a rich resource for exploring various aspects of customer profiles and their actions. 

### Data Organization

All information provided are within one csv. File has information about each sales with column for Customer_id, Age, Gender (0 = Male, 1 = Female), Revenue_Total, N_Purchases (Total Purchases by Customer), Purchase_DATE, Purchase_VALUE, Pay_Method (0 = Digital Wallet, 1 = Card, 2 = Paypal, 3 = Other), Time_Spent (Seconds), Browser (0 = Chrome, 1 = Safari, 2 = Edge, 3 = Other), Newsletter (0 = Not Subscribed, 1 = Subscribed), Voucher (0 = Not Used, 1 = Used). The dataset includes columns where numerical codes have been utilized to represent certain attributes. Explanations are provided within parentheses to clarify their actual meanings.

# Process

SSMS is being used to clean and update datasets. Tableau will be used for visualization.

### Data Exploration
Query - [Data Exploration](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/blob/main/Data%20Exploration.sql)  
Prior to cleaning data, we will explore our data sets.   

Observations:  
1. Table below shows all column names and data types. The __Customer_id__ column is the primary key.  

   ![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/a2e19bcf-30de-435b-9c96-773e53399fb9)

    - __Time_Spent__ and __Purchase_DATE__ needs to be converted to their proper format. 

2. Following table shows number of __null values__ in for each column.  
   
   ![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/0df30cda-0c05-48db-8649-b3afafeb0d36)

   - No null values for this data set.

3. Checking for duplicates by using __Customer_id__ column.    

   ![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/e6c8dc48-34bc-4c3d-9aca-8c2c45e4ca90)

   ![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/5f975e57-1173-470b-be06-ceca93941c74)

   - There are no __duplicate__ rows for this data set.
  
4. __Customer_id__ column all has a length of 6, no need for cleaning
  
5. Column __Gender__, __Pay_Method__, __Browser__, __Newsletter__, __Voucher__, all has numerical representation for their attributes, need to replace with their attributes name.

   ![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/d9acbc93-62db-4b43-b06d-b87c7c2031a2)

   - Majority of data records are using Chrome browsers, aren't subscriber nor are they using voucher with twice as much females than there is male. 

### Data Cleaning
Query: [Data Cleaning](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/blob/main/Data%20Cleaning.sql)  
1. __Time_Spent__ column is used to convert into time format by adding a new column named __Time_Spent_Converted__.
2. __Purchase_DATE__ converted to YYYY-MM-DD format.
3. All numerical representation are replaced with their appropriate attributes named.
4. Added a new column called __Season__ by using __Purchase_DATE__ for seasonal analysis. (January-Feb = Winter, March-May = Spring, June-August = Summer, September-November = Autumn)
5. Added an Age_Group column for demographics analysis

![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/1f462e9d-9c86-42d0-be35-5e3ff397fd90)

## Analyze and Share

SQL Query: [Data Analysis](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/04.%20Data%20Analysis.sql)
Data Analysis done in MSSQL and visualization is done through Tableau. 

1. First we'll look at which demographic segment (age group and gender) contributes the most to overall revenue. 

![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/e65f5e59-24c7-4b85-9621-3d5cf4213724)

- Insights

   - Across all age groups, there are twice as many females as there are males. The clientele and revenue generation from clientele predominantly comprised of middle-aged adults (40-59). Following Middle-Aged adults, Adults aged 25-39 constitute the second-largest demographic. Young Adults (18-24) are also part of the customer base, ranking third in terms of revenue contribution. Seniors (60+) represent the fourth largest group, while Teenagers (16-18) make up a much smaller portion of the customer base.

2. Next, we'll look at how their purchasing behaviors to see the differences between demographics. 

![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/ceeb2da6-ce22-409d-88eb-9a9db4679c6c)

- Insights

   - The purchasing behaviors across different gender demographics show almost identical patterns, with minimal differences observed. Whether it pertains to the choice of payment method, web browser preferences, subscription status, or voucher usage, the distinctions are negligible. Notably, our customer base predominantly utilizes Chrome browsers, accounting for approximately 64% of users, followed by Safari, while other browsers like Edge are the least preferred with around 5% of users, with the rest using other browsers. In terms of payment methods, around 30% of customers opt for cards, with digital wallets and PayPal each constituting roughly 29% of transactions, while the remainder utilizes other payment methods.

3. For this part, we'll look revenue generation per season for each gender to analyze possible implications they have for marketing and sales strategies. 

![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/4aa44ba1-4cf3-4cfb-878a-fe46085cff90)

- Insights

   - There's minimal variance in revenue generation between each season, typically fluctuating only within a range of $1000 to $5000. However, a subtle trend emerges: revenue generation among males peaks during autumn and is the lowest during winter, while for females, the pattern is reversed, with highest revenue during winter and lowest during autumn. As for spring and summer, they're almost the same, only fluctuating within a range of $400 to $1000 for both gender.

4. Last, we'll look at revenue generation for each payment method to determine a possible ways to optimize the checkout process.

![image](https://github.com/hainguyendtx/Customer-Sales-Analysis---eCommerce/assets/157367308/105e74fa-d58f-4e5f-9a94-71084f1d5794) 

- Insights

   - 






