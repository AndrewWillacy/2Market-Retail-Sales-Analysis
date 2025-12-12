-- Calculate the total spend per product by country --

SELECT SUM("Alcohol") AS "Alcohol",
       SUM("Chocolate") AS "Chocolate",
       SUM("Commodities") AS "Commodities",
       SUM("Fish") AS "Fish",
       SUM("Meat") AS "Meat",
       SUM("Vegetables") AS "Vegetables",
   "Country"
   FROM public."Marketing_Data"
      GROUP BY "Country"
      ORDER BY "Country";

-- This script selects the "Country" & each product type column from the table, --
-- "Markering_Data" -- 
-- It adds up each total for each product type and puts into groups by country -- 
-- using GROUPBY. It then displays the results by "Country" in alphabetical order --
