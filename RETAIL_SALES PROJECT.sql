-- SQL Retail sales Analysis
CREATE  DATABASE sql_project_p2;
use sql_project_p2;

-- create table
CREATE TABLE retail_sales
(transactions_id int,
sale_date date,
sale_time time,	
customer_id	int,
gender varchar(15),
age	int,
category varchar(15),	
quantiy	int,
price_per_unit float,	
cogs float,
total_sale float
);
drop table retail_sales;
select * from retailsales;
show tables;

select* from retailsales;

select count(*) from retailsales;

-- data cleaning

select * from retailsales 
where transactions_id is null;

select * from retailsales
where sale_time is null;

select * from retailsales
where sale_date is null;

select * from retailsales
where 
sale_date is null
or 
sale_time is null
or
customer_id is null	
or
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

DELETE FROM retailsales
where 
sale_date is null
or 
sale_time is null
or
customer_id is null	
or
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- data Exploration

-- How many sales we have
select count(*) as total_sale
from retailsales;

-- How many customers we have 
select count(customer_id) as total_sale
from retailsales;

-- How many uniuque customers we have
select count(distinct customer_id) as total_sale
from retailsales;

select count(distinct category) as total_sale
from retailsales;

select distinct category
from retailsales;

-- data Analysis & business key probles & answers
use sql_project_p2;
select * from retailsales;

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the '
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000 Beauty' category.

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

--  Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select *
from retailsales
where sale_date = '2022-11-05';
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select* from retailsales;

SELECT
    category,
    SUM(quantiy) AS total_quantity
FROM
    retailsales
WHERE
    category = 'clothing'
    AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND quantiy >= 4
GROUP BY
    category;
    
    --  Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
    select category,
    sum(total_sale)as net_sale,
    count(*) as total_orders
    from retailsales
    group by 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
avg(age) as avg_age
 from retailsales
where category = 'beauty';
-- round function
select
round(avg(age),2) as avg_age
from retailsales
where category = 'beauty'; 

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000 
select *from retailsales
where total_sale >1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select
category,
gender,
count(*) as total_trans
from retailsales
group by category,gender
order by 1;
use retailsales;
-- Q.8  Write a SQL query to find the top 5 customers based on the highest total sales 
select * from retailsales;
select
	customer_id,
    sum(total_sale)as total_sales
from retailsales
group by 1 
order by 2 desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select
category,
Count(distinct customer_id) as unique_customer
from retailsales
group by category;

 -- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
 with hourly_sale
 as
 (
 select*,
 case
 when extract(Hour from sale_time)<12 then 'Morning'
 when extract(Hour from sale_time) Between 12 and 17 then 'afternoon'
 Else 'evening'
 end as shift
 from retailsales
 )
 select shift, count(*)as total_orders
 from hourly_sale
 group by shift;
 
 -- end of project

