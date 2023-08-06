-- Create table in SQL and import data from CSV dataset
CREATE TABLE super.marketing (
	id int PRIMARY KEY,
    year_birth int,
    age int,
    education varchar(255),
    marital_status varchar(255),
    income int NULL,
    kidhome int,
    teenhome int,
    dt_customer date,
    recency int,
    MntWines int,
    MntFruits int,
    MntMeatProducts int,
	MntFishProducts int,
    MntSweetProducts int,
    MntGoldProds int,
    NumDealsPurchases int,
    NumWebPurchases int,
    NumCatalogPurchases int,
    NumStorePurchases int,
    NumWebVisitsMonth int,
    Response int,
    Complain int
);

-- Background Info:
-- 1. How many total customers are there? 2240 total customers
SELECT COUNT(DISTINCT id) FROM super.marketing;
-- 2. How many customers accepted the offer in the last campaign? 334, or 15% of the total customer group
SELECT DISTINCT COUNT(*) FROM super.marketing WHERE response = 1;
-- 3. How many customers did not accept the offer in the last campaign? 1906, or 85% of the total customer group
SELECT COUNT(*) FROM super.marketing WHERE response = 0;


-- Question 1: Is there an age difference between customers who accepted the offer, and customers who did not? 
-- Step 1: Calculate the average age of customers.
-- Step 1a: Calculate average age of all customers: 54.19
SELECT AVG(age) FROM super.marketing;
-- Step 1b: Calculate average age of customers who accepted the offer: 53.58
SELECT AVG(age) FROM super.marketing WHERE response = 1;
-- Step 1c: Calculate average age of customers who did not accept the offer: 54.30
SELECT AVG(age) FROM super.marketing WHERE response = 0;


-- Step 2: Create age ranges to categorize customers. Query the number of customers in each age range.
-- Step 2a: Query the number of customers in each age range.
select case
    when age between 0 and 19 then ' 0-19'
    when age between 20 and 29 then '20-29'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    when age between 60 and 69 then '60-69'
    else '70+' 
    end as agerange,
    count(1) as 'Count'
  from super.marketing 
  group by agerange
  order by agerange;
  -- Step 2b: Query the number of customers in each age range who accepted the offer.
select case
    when age between 0 and 19 then ' 0-19'
    when age between 20 and 29 then '20-29'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    when age between 60 and 69 then '60-69'
    else '70+' 
    end as agerange,
    count(1) as 'Count'
  from super.marketing 
  where response='1'
  group by agerange
  order by agerange;
  -- Step 2c: Query the number of customers in each age range who did not accept the offer.
select case
    when age between 0 and 19 then ' 0-19'
    when age between 20 and 29 then '20-29'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    when age between 50 and 59 then '50-59'
    when age between 60 and 69 then '60-69'
    else '70+' 
    end as agerange,
    count(1) as 'Count'
  from super.marketing 
  where response='0'
  group by agerange
  order by agerange;
-- Answer: According to the averages, there is almost no variation in age between customers who accepted the offer (average age of 53.58) and customers who did not accept the offer (average age of 54.30). However, the age range data shows us that the 30-39 and 70+ age groups are slightly more likely to accept the offer. As noted above, the campaign acceptance rate across the entire customer group is 15%. The percentage of customers in the 30-39 age group who accepted the offer (17.67%) and the percentage of customers in the 70+ age group who accepted the offer (15.99%) are both slightly above that average 15% rate. 30% of customers in the 20-29 age range also accepted the offer, but this is less significant given there are only 10 customers in that age range. 


-- Question 2: Is there a difference in marital status between customers who accepted the offer, and customers who did not?
-- Step 1: Query the number of customers with each marital status.
SELECT marital_status, COUNT(*) FROM super.marketing GROUP BY marital_status;
-- Step 2: Query the number of customers with each marital status, in the group of customers who accepted the offer. 
SELECT marital_status, COUNT(*) FROM super.marketing WHERE response = 1 GROUP BY marital_status;
-- Step 3: Query the number of customers with each marital status, in the group of customers who did not accept the offer. 
SELECT marital_status, COUNT(*) FROM super.marketing WHERE response = 0 GROUP BY marital_status;
-- Answer: There does not seem to be any significant correlation between marital status and whether or not a customer accepts the offer. In the group of customers that accepted the offer, the most represented groups are single (32%) and married (29%). In comparison, in the group of customers who did not accept the offer, 19% are single and 40% are married. This illustrates that: if you are single, you are slightly more likely to accept the offer; and if you are married, you are slightly less likely to accept the offer.


-- Question 3: Is there a difference in income between customers who accepted the offer, and customers who did not?
-- Step 1: Calculate the average income of customers.
-- Step 1a: Calculate average income of all customers: $52,247
SELECT AVG(income) FROM super.marketing;
-- Step 1b: Calculate the average income of all customers who accepted the offer: $60,209
SELECT AVG(income) FROM super.marketing WHERE response=1;
-- Step 1c: Calculate the average income of all customers who did not accept the offer: $50,839
SELECT AVG(income) FROM super.marketing WHERE response=0;


-- Step 2: Create income ranges to categorize customers. Query the number of customers in each age range.
-- Step 2a: Query the number of customers in each income range.
select case
    when income between 0 and 25000 then '0-25000'
    when income between 25000 and 50000 then '25000-50000'
    when income between 50000 and 75000 then '50000-75000'
    when income between 75000 and 100000 then '75000-100000'
    when income between 100000 and 125000 then '100000-125000'
    when income between 125000 and 150000 then '125000-150000'
    else 'more than 150000' 
    end as incomerange,
    count(1) as 'Count'
  from super.marketing 
  group by incomerange
  order by incomerange;
-- Step 2b: Query the number of customers in each income range who accepted the offer.
select case 
    when income between 0 and 25000 then '0-25000'
    when income between 25000 and 50000 then '25000-50000'
    when income between 50000 and 75000 then '50000-75000'
    when income between 75000 and 100000 then '75000-100000'
    when income between 100000 and 125000 then '100000-125000'
    when income between 125000 and 150000 then '125000-150000'
    else 'more than 150000' 
    end as incomerange,
    count(1) as 'Count'
  from super.marketing 
  where response=1
  group by incomerange
  order by incomerange;
-- Step 2c: Query the number of customers in each income range who did not accept the offer.
select case 
    when income between 0 and 25000 then '0-25000'
    when income between 25000 and 50000 then '25000-50000'
    when income between 50000 and 75000 then '50000-75000'
    when income between 75000 and 100000 then '75000-100000'
    when income between 100000 and 125000 then '100000-125000'
    when income between 125000 and 150000 then '125000-150000'
    else 'more than 150000' 
    end as incomerange,
    count(1) as 'Count'
  from super.marketing 
  where response=0
  group by incomerange
  order by incomerange;
-- Answer: On average, the customers who accept the offer have a higher average income ($60k a year) than the customers who did not accept the offer ($50k a year). In addition, the income ranges show us that only 11.5% of customers who make less than $75k accepted the offer, while 31.3% of customers who make more than $75k accepted the offer.


-- Question 4: Is there a difference in number of children between customers who accepted the offer, and customers who did not?
-- Step 1: Calculate the average number of kids and average number of teens for all customers. 
SELECT AVG(kidhome) FROM super.marketing; 
SELECT AVG (teenhome) FROM super.marketing;
-- Step 2: Calculate the average number of kids and average number of teens for all customers who accepted the offer.
SELECT AVG(kidhome) FROM super.marketing WHERE response=1; 
SELECT AVG (teenhome) FROM super.marketing WHERE response=1;
-- Step 3: Calculate the average number of kids and average number of teens for all customers who did not accept the offer.
SELECT AVG(kidhome) FROM super.marketing WHERE response=0; 
SELECT AVG (teenhome) FROM super.marketing WHERE response=0;
-- Answer: Customers who accept the offer are slightly less likely to have kids or teens at home, than customers who did not accept the offer.


-- Question 5: Is there a difference in which categories customers spend money in, between customers who accepted the offer and customers who did not?
-- Step 1: Calculate the average spend in each category for all customers.
SELECT AVG(MntWines), AVG(MntFruits), AVG(MntMeatProducts), AVG(MntFishPRoducts), AVG(MntGoldProds) FROM super.marketing;
-- Step 2: Calculate the average spend in each category for all customers who accepted the offer.
SELECT AVG(MntWines), AVG(MntFruits), AVG(MntMeatProducts), AVG(MntFishPRoducts), AVG(MntGoldProds) FROM super.marketing WHERE response=1;
-- Step 3: Calculate the average spend in each category for all customers who did not accept the offer.
SELECT AVG(MntWines), AVG(MntFruits), AVG(MntMeatProducts), AVG(MntFishPRoducts), AVG(MntGoldProds) FROM super.marketing WHERE response=0;
-- Answer: Customers who accepted the offer have an average, higher spend in every single category than customers who did not accept the offer. On average, customers who accepted the offer spent aknost double on wine and meat than the customers who did not accept the offer.


-- Question 6: Is there a difference in shopping behavior and frequency, between customers who accepted the offer and customres who did not?
-- Step 1: Calculate the average spend in each category for all customers.
SELECT AVG(NumDealsPurchases), AVG(NumWebPurchases), AVG(NumCatalogPurchases), AVG(NumStorePurchases) FROM super.marketing;
-- Step 2: Calculate the average spend in each category for customres who accepted the offer.
SELECT AVG(NumDealsPurchases), AVG(NumWebPurchases), AVG(NumCatalogPurchases), AVG(NumStorePurchases) FROM super.marketing WHERE response=1;
-- Step 3: Calculate the average spend in each category for customers who did not accept the offer.
SELECT AVG(NumDealsPurchases), AVG(NumWebPurchases), AVG(NumCatalogPurchases), AVG(NumStorePurchases) FROM super.marketing WHERE response=0;
-- Answer: Customers who accepted the offer, on average, make more purchases - via catalog, online, and in store. However, there is no difference in the average number of discount purchases each customer group made.