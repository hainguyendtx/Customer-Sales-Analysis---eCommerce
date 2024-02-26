# eCommerce Store
How can an eCommerce store increase revenue?

By Hai Nguyen 

# Background
In today's ever-evolving business landscape, understanding customer behavior through sales data analysis is paramount. Our case study delves into this realm, following the journey of an eCommerce store. Faced with intense competition and changing market dynamics, our client embarked on a data-driven transformation.

Throughout the study, we highlight how our client utilized advanced analytics to uncover hidden patterns and optimize sales strategies. By segmenting customers and identifying high-value segments, they not only enhanced marketing effectiveness but also fostered deeper customer connections, ultimately driving bottom-line results. Join us as we explore the transformative impact of customer sales analysis, showcasing how data-driven decisions propelled our client to sustained success in today's dynamic business landscape.

# Key Stakeholders
•	Owners/Founders: Those who have invested capital and resources to establish and operate the eCommerce business

•	Marketing and Advertising Agencies: These partners are critical for devising and executing effective marketing campaigns aimed at increasing sales and revenue.

•	Payment Service Providers: Ensuring smooth and secure payment processing is essential for minimizing cart abandonment and maximizing revenue conversion.

• Customers: Understanding customer behavior and preferences is crucial for driving revenue growth. Customers are key stakeholders as their purchasing decisions directly impact revenue generation.

# Ask
Business task: Implement a comprehensive sales and marketing strategy to increase revenue and drive sales growth.

Analysis question: The three question below will guide the future marketing program.

1.	Which demographic segment (age group or gender) contributes the most to overall revenue, and how does their purchasing behavior differ from other segments?
2.	How do seasonal variations in purchasing behavior differ across demographic segments, and what are the implications for marketing and sales strategies?
3.	What impact do different payment methods have on conversion rates and revenue generation, and how can this information be leveraged to optimize the checkout experience?

# Preparation

### Data Sources 

Data used is publicly available on Kaggle - [(Online Shop Customer Sales Data)](https://www.kaggle.com/datasets/onlineretailshop/online-shop-customer-sales-data/data)

The datasets are appropriate and can be used to answer business questions. The data has been made available by Kaggle's user Jonas Ungermans. The datasets provided can offer valuable insights into customer demographics and behavior. They serve as a rich resource for exploring various aspects of customer profiles and their actions. 

### Data Organization

All information provided are within one csv. File has information about each sales with column for Customer_id, Age, Gender (0 = Male, 1 = Female), Revenue_Total, N_Purchases (Total Purchases by Customer), Purchase_DATE, Purchase_VALUE, Pay_Method (0 = Digital Wallet, 1 = Card, 2 = Paypal, 3 = Other), Time_Spent (Seconds), Browser (0 = Chrome, 1 = Safari, 2 = Edge, 3 = Other), Newsletter (0 = Not Subscribed, 1 = Subscribed), Voucher (0 = Not Used, 1 = Used). The dataset includes columns where numerical codes have been utilized to represent certain attributes. Explanations are provided within parentheses to clarify their actual meanings.

# Process

SSMS is being used to clean and update datasets. Tableau will be used for visualization.

### Data Cleaning

After exploring datasets, null values and duplicates identified and removed if there is any and is necessary to do so. Numerical codes were also replaced with their respective attributes. Lastly, a new column called Time_Spent_Conversion was added for conversion and proper formatting (00:00:00). [(Query)](https://github.com/hainguyendtx/Case-Study-Cyclistic-Bike-Share-How-Does-a-Bike-Share-Navigate-Speedy-Success/edit/main/Combining%20Data.sql)

