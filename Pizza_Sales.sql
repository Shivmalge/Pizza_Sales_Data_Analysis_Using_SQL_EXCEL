select * from pizza_sales;

--1.Find total price of all orders in dataset
SELECT SUM(total_price) as Total_Revenue from pizza_sales;

--2.Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Average_Order_Value from pizza_sales;

--3.Total Pizza Sold
SELECT SUM(quantity) As Total_Pizza_Sold from pizza_sales;

--4.Total Orders
SELECT COUNT(DISTINCT order_id) As Total_Orders from pizza_sales;

--5.Average Pizza Per Order
SELECT CAST(CAST(SUM(quantity) As DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))as 
Average_Pizza_Order from pizza_sales

--6.Daily trend for Orders 
SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales 
GROUP BY DATENAME(DW,order_date)

--7.Hourly trend for Orders
SELECT DATEPART(HOUR,order_time) As order_hours, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

--8.
select pizza_category,sum(total_price) as total_price, ((SUM(total_price) * 100) /
(select sum(total_price) from pizza_sales where DATEPART(QUARTER,order_date) = 1)) as percentage
from pizza_sales
where DATEPART(QUARTER,order_date) = 1
group by pizza_category


--8.Average Pizzas Sold as Per Pizzas Size
select pizza_size,sum(total_price) as total_price, CAST(((SUM(total_price) * 100) /
(select sum(total_price) from pizza_sales) as DECIMAL(10,2)) as percentage
from pizza_sales
group by pizza_size

--9.Pizzas Sold as per Pizza Category
select pizza_category, sum(quantity) as total_pizza_sold 
from pizza_sales
group by pizza_category

--10.Top 5 best Seller Pizzas
select top 5 pizza_name, sum(quantity) as total_pizzas_sold 
from pizza_sales
group by pizza_name
order by total_pizzas_sold desc

--11.Bottom 5 Worst Seller Pizzas
select top 5 pizza_name, sum(quantity) as total_pizzas_sold 
from pizza_sales
group by pizza_name
order by total_pizzas_sold 