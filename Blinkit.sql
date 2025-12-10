Use Blinnkit

Select * From [BlinkIT ]

Select COUNT(*) As Count_Data From [BlinkIT ]

Select SUM(Total_Sales) As Total_Sales From [BlinkIT ]

Select AVG(Rating) As Average_Rating  From [BlinkIT ]

Select MAX(Total_Sales) As MAX From [BlinkIT ]

Select MIN(Total_Sales) From [BlinkIT ]

Select * From [BlinkIT ] Where Total_Sales>200

Select * From [BlinkIT ] Where Total_Sales<200

Select * From [BlinkIT ] Where Item_Weight Is Null

Select * From [BlinkIT ] Where Item_Weight Is Not Null

Select * From [BlinkIT ] Where Item_Fat_Content='Regular' 

Select * From [BlinkIT ] Where Outlet_Establishment_Year=2000

Select * From [BlinkIT ] Where Outlet_Location_Type='Tier 1'

Select Item_Fat_Content,COUNT(*) As Count_Item_Fat_Content From [BlinkIT ] Group by Item_Fat_Content 

Select Outlet_Size,COUNT(*) As Count_Outlet_Size From [BlinkIT ] Group by Outlet_Size

Select Item_Identifier,SUM(Total_Sales) As Item_Identifier_Wise_Sales From [BlinkIT ] Group by Item_Identifier 

Select Item_Identifier,COUNT(*) As Item_Identifier From [BlinkIT ] Group by Item_Identifier

Select Item_Type,AVG(Rating) As Average_Rating  From [BlinkIT ] Group by Item_Type

Select Item_Fat_Content,MAX(Total_Sales) As Max_sales From [BlinkIT ] Group by Item_Fat_Content  

Select * From [BlinkIT ] Where Total_Sales=(Select MAX(Total_Sales) From [BlinkIT ])

Select CAST(SUM(Total_Sales)/ 1000000 As Decimal(10,2)) As Total_Sales_Millions From [BlinkIT ]

Select * From [BlinkIT ] Where Total_Sales>100