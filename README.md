# 🍕 Pizza Sales Data Analysis
##  Overview :
#### This project showcases an end-to-end sales data analysis for a pizza restaurant using SQL and Excel. The goal is to extract meaningful insights and key performance indicators (KPIs) from transactional data to support data-driven business decisions.
## 🔍 Key Highlights
- **🎯 Objectives:**
  ### The analysis aims to uncover:
    - **Sales patterns by time and category**
    - **Customer ordering behavior**
    - **High and low performing products**
    - **Opportunities for menu optimization and targeted promotions**
  
- **Tools Used:**
  - **SQL: Data cleaning, aggregation, and KPI calculations**
  - **Microsoft Excel: Visualization, dashboard creation, and trend analysis**
    
- **📁 Project Structure**
  - **Data/ – Sample anonymized raw sales data**
  - **SQL Queries/ – Contains all SQL scripts used for querying and KPI generation**
  - **Excel Dashboard/ – Interactive dashboards and charts visualizing the key insights**
 
- **KPIs Analyzed:**
  - **📈 Total Revenue**
    - SELECT SUM(total_price) As Total_Revenue from pizza_sales;
      ### ![image](https://github.com/user-attachments/assets/5fca5b76-2a6e-4ec8-bcbb-e2c58fbe7f9a)
  - **💰 Average Order Value (AOV)**
    - SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Average_Order_Value from pizza_sales;
      ### ![image](https://github.com/user-attachments/assets/2f021969-e458-464d-80ea-a4765ab6a2e0)
  - **🍕 Total Pizzas Sold**
    - SELECT SUM(quantity) As Total_Pizza_Sold from pizza_sales;
      ### ![image](https://github.com/user-attachments/assets/f7345589-1e6b-4a6a-ad0e-996ebb1d2314)
  - **🧾 Average Pizzas per Order**
    - SELECT CAST(CAST(SUM(quantity) As DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))as Average_Pizza_Order from pizza_sales
      ### ![image](https://github.com/user-attachments/assets/488e40f4-3fa8-4d01-bf6a-de5382828785)
  - **📅 Daily Trend of Total Orders**
    - SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) as Total_Orders from pizza_sales GROUP BY DATENAME(DW,order_date)
      ### ![image](https://github.com/user-attachments/assets/c55a09e8-7142-43ec-9f91-2c774eef238d)
  - **⏰ Hourly Trend of Total Orders**
    - SELECT DATEPART(HOUR,order_time) As order_hours, COUNT(DISTINCT order_id) as Total_orders from pizza_sales GROUP BY DATEPART(HOUR,order_time) ORDER BY DATEPART(HOUR,order_time)
      ### ![image](https://github.com/user-attachments/assets/0031cb1b-26aa-4d5b-af84-fc8e523a3510)
  - **📐 % of Sales by Pizza Size**
    - select pizza_size,sum(total_price) as total_price, CAST(((SUM(total_price) * 100) / (select sum(total_price) from pizza_sales)) as DECIMAL(10,2)) as percentage from pizza_sales
group by pizza_size
      ### ![image](https://github.com/user-attachments/assets/59bdef69-a4c8-46e5-af3f-090b0064e364)
  - **🍕 Total Pizzas Sold by Pizza Category (Classic, Veggie, etc.)**
    - SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold FROM pizza_sales WHERE MONTH(order_date) = 2 GROUP BY pizza_category ORDER BY Total_Quantity_Sold DESC
      ### ![image](https://github.com/user-attachments/assets/22498ef8-2328-494f-ae80-48a696baa07f)
  - **📊 % of Sales by Pizza Category**
    - SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_category
      ### ![image](https://github.com/user-attachments/assets/f9f15912-6afa-4248-b720-50811f0166b8)
  - **🏆 Top 5 Best Sellers by Total Pizzas Sold**
    - select top 5 pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales group by pizza_name order by total_pizzas_sold desc
      ### ![image](https://github.com/user-attachments/assets/7fa20531-c97d-4e39-aa26-e3a0e8b77bbc)
  - **📉 Bottom 5 Best Sellers by Total Pizzas Sold**
    - select top 5 pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales group by pizza_name order by total_pizzas_sold
      ### ![image](https://github.com/user-attachments/assets/6900f26b-5076-40f6-a662-09e98c914a27)


   
