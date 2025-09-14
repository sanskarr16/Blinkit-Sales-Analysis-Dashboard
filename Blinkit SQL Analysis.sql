select * from blinkit_data

select cast(sum(Total_Sales)/1000000 as Decimal(10,2)) as Total_Sales_Millions
from blinkit_data 

select CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES 
FROM blinkit_data

select count(*) as No_of_Items from blinkit_data

select cast(sum(Total_Sales)/1000000 as Decimal(10,2)) as Total_Sales_Millions
from blinkit_data 
where Item_Fat_Content = 'Low Fat'

select cast(AVG(Rating) as DECIMAL(10,2)) as Avg_Rating 
from blinkit_data 

select Item_Fat_Content, 
     concat(cast(sum(Total_Sales)/1000 as DECIMAL(10,2)),'K') as Total_Sales_thousands,
	 CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
	 count(*) as No_of_Items,
	 cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating
from blinkit_data
group by Item_Fat_Content
order by Total_Sales_thousands desc

select Top 5 Item_Type, 
     cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales,
	 CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
	 count(*) as No_of_Items,
	 cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating
from blinkit_data
group by Item_Type
order by Total_Sales asc

select Outlet_Location_Type, Item_Fat_Content,
     cast(sum(Total_Sales)/1000 as DECIMAL(10,2)) as Total_Sales,
	 CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
	 count(*) as No_of_Items,
	 cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating
from blinkit_data
group by Outlet_Location_Type,Item_Fat_Content
order by Total_Sales desc

select Outlet_Location_Type,
       ISNULL([Low Fat],0) as Low_Fat,
	   ISNULL([Regular],0) as Regular
from
(
Select Outlet_Location_Type, Item_Fat_Content,
cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales
from blinkit_data
group by Outlet_Location_Type, Item_Fat_Content
) as SourceTable
pivot
(
SUM(Total_Sales)
for Item_Fat_Content IN ([Low Fat], [Regular])
) as PivotTable 
order by Outlet_Location_Type

select Outlet_Establishment_Year, 
     cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales,
	 CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
	 count(*) as No_of_Items,
	 cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc

select 
Outlet_Size,
cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales,
cast((sum(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage
from blinkit_data
Group by Outlet_Size
order by Total_Sales DESC;

select 
Outlet_Location_Type,
cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
count(*) as No_of_Items,
cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating,
cast((sum(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage
from blinkit_data
Group by Outlet_Location_Type
order by Total_Sales DESC;

select 
Outlet_Type,
cast(sum(Total_Sales) as DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) as DECIMAL(10,2)) as AVG_SALES,
count(*) as No_of_Items,
cast(avg(Rating) as DECIMAL(10,2)) AS Avg_Rating,
cast((sum(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage
from blinkit_data
Group by Outlet_Type
order by Total_Sales DESC;