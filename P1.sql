create database sql_project_p1;
use sql_project_p1;
drop database sql_project_p1;

create table retail_salse(
transactions_id	INT primary key,
sale_date	date,
sale_time	time,
customer_id	int,
gender	varchar(15),
age	int,
category varchar(15),	
quantiy	int,
price_per_unit	float,
cogs	float,
total_sale float
)

select * from retail_salse;

select * from retail_salse
limit 10;

select count(*) from retail_salse;

-- Null value handling--

SELECT * FROM retail_salse
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_salse
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
    
-- explore data--
-- how many salse we have?--
SELECT COUNT(*) AS total_salse FROM retail_salse

-- unique customer --
select count(distinct customer_id) as total_sale from retail_salse

select distinct category from retail_salse

-- Business problems --

-- Q.1 salse data on date --
select * from retail_salse
where sale_date ='2022-11-05';


-- Q.2 category clothing more than 10 and on november 2011 --
select * from retail_salse
where category = 'Clothing'
and
date_format(sale_date , '%y-%m') = '2022-11'
and 
quantiy >3

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_salse
GROUP BY 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
avg(age) as avg_age
FROM retail_salse
where category ='Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_salse
WHERE total_sale >1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT category, gender,
count(*)
FROM retail_salse
GROUP BY category, gender
ORDER BY 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
       year,
       month,
    avg_sale
FROM 
(
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_salse
GROUP BY 1, 2
) as t1
WHERE rank = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
     customer_id,
     SUM(total_sale) as total_sales
FROM retail_salse
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_salse
GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_salse
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift


                                         -- The End --
                                         