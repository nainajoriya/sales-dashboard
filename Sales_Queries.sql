-- Create database

create database sales_db;
use sales_db;

-- Create Table

create table Sales(Order_ID varchar(20),
Date DATE,
Region varchar(20),
Category varchar(50),
Product varchar(50),
Quantity int,
Sales decimal(12,2),
Profit decimal(12,2));

-- Csv file load --- Schemas -> sales_db -> Tables -> Sales
-- csv select -- browse -> download -> use existing table ->Sales
-- column mapping check --> should be same csv columns and sql table columns

-- Check the data
select * from sales;

-- Total Sales
select sum(sales) as Total_Sales 
from Sales;  -- 17472220.00

-- Total Profit
select sum(Profit) as Total_Profit
from Sales;  -- 2870273.36

-- Total Quantity 
select sum(Quantity) as Total_Quantity
from Sales;  -- 2747

-- Region-wise Sales
select Region,sum(sales) as Total_Sales
from sales
group by Region;  -- > Sales ko region ke according groups me divide kro.

-- Highest Sales Region  
select Region,sum(Sales) as Total_Sales
from Sales
group by Region
order by Total_Sales desc;  -- > Arrange the total sales into highest to lowest order.

-- Category-wise Sales
select Category,sum(Sales) as Total_Sales
from sales
group by Category  -- > Same category ke records ko ek group me rakho.
order by Total_Sales desc;

-- Category-wise Profit  --> Har category ne kitna total profit generate kiya.
select Category, sum(Profit) as Total_Profit
from sales
group by Category
order by Total_Profit desc;

-- Region-wise Profit  --> Kaunsa region ka total profit kitna h.
select Region, sum(Profit) as Total_Profit
from sales
group by Region
order by Total_Profit desc;

-- Product-wise Sales  -- > Isse hum products ki sales compare kr sakte hai.
select Product,sum(sales) as Total_Sales
from sales
group by Product
order by Total_Sales desc;

-- Top 5 Products
select Product, sum(sales) as Total_Sales
from Sales 
group by Product
order by Total_Sales desc
limit 5;

-- Monthly Sales  -->  We can retrieve the month-wise sales from Date.
select Month(Date) as Month_Number, -- > Retrieve the month number from date.
sum(sales) as Total_Sales
from sales
group by month(Date)  -- > Grouped the orders of same month.
order by Month_Number;  -- > Arranged the order of month.

-- Profit Margin  -- > We can calculate the overall profit margin in SQL.
select sum(Profit)/sum(sales)* 100 as Profit_Margin
from sales;  -- > 16.427640  -- if Total Profit = 20,000
                             --    Total Sales = 100,000   then 20,000 / 100,000 * 100 = 20%







