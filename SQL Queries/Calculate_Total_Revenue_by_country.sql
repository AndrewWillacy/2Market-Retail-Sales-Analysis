-- Calculate the Total spend per country --

SELECT "Country", SUM("Total_Spend") AS "Revenue"
   FROM public."Marketing_Data"
     GROUP BY "Country"
     ORDER BY "Revenue" DESC;

-- This script selects the "Country" & "Total Spend" columns from the table, --
-- renaming the "Total_Spend" column as "Revenue" in the results "Markering_Data" -- 
-- It adds up each row in the "Total_Spend" column by country using GROUPBY --
-- It then displays the results by "Revenue" descending order (Largest first) --
