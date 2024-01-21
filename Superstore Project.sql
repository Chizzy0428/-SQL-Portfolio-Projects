show databases;
use superstore;
select * from superstore;
-- Checking for Unique Values in Some Columns
select distinct Ship_Mode from superstore; 
select distinct Category from superstore; 
select distinct Country from superstore; 
select distinct City from superstore; 
select distinct State from superstore; 
select distinct Region from superstore; 
select distinct Segment from superstore; 

-- Total Loss made
select sum(Profit) as Total_Loss from superstore where Profit < 0;
-- Total Profit made
select sum(Profit) as Total_Profit from superstore where Profit >0;

-- What Shipping Mode Brought in The Most Profit?
Create View Shipping_Mode as select Ship_Mode, sum(Sales) as Total_Sales, sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by Ship_Mode
order by Total_Profit desc;
-- What Year was the Most Profit Made?
Create View Profit_Year as select Order_Year, sum(Sales) as Total_Sales, sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by Order_Year
order by Total_Profit desc;
-- Which Category Brought In the Most Profit?
Create View Profit_Category as select Category, sum(Sales) as Total_Sales, sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by Category
order by Total_Profit desc;
-- Which Sub Category Brought In the Most Profit?
Create View Sub_Category_Profit as select Category, Sub_Category, sum(Sales) as Total_Sales, sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by Category, Sub_Category
order by Total_Profit desc;

-- Which State Brought In the Most Profit?
Create View Profit_State as select State, sum(Sales) as Total_Sales, sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by State
order by Total_Profit desc;

-- What Segment Brought In the Most Profit?
Create View Profit_Segment as select Segment, sum(Sales) as Total_Sales, 
sum(Discount) as Total_Discount, sum(Profit) as Total_Profit from superstore 
group by Segment
order by Total_Profit desc;

-- Which Customer Brought In the Most Profit?
Create View Best_Customer as SELECT * FROM superstore
WHERE Profit = (SELECT MAX(Profit) FROM superstore);

-- Which Customer Brought In the Most Loss?
Create View Worst_Customer as SELECT * FROM superstore
WHERE Profit = (SELECT MIN(Profit) FROM superstore);








