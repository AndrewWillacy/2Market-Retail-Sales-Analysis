-- Which products are most popular in each country --

SELECT "Country",
  CASE
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Alcohol") THEN 'Alcohol'
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Chocolate") THEN 'Chocolate'
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Commodities") THEN 'Commodities'
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Fish") THEN 'Fish'
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Meat") THEN 'Meat'
    WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Vegetables") THEN 'Vegetables'
  END AS "Most_Popular_Product"
  
FROM
public."Marketing_Data"
GROUP BY "Country"
ORDER BY "Country";

-- This script adds up the total sales of each product category by country --
-- It calculates which product category has the highest sales from the --
-- "Marketing_Data" table. The CASE statement selects the appropriate product --
-- category and puts it in a column named "Most_Popular_Product" --
-- The results are then ordered by country in alphabetical order --
-- 