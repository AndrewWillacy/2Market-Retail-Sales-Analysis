
--Which products are most popular based on marital status--
SELECT
"Marital_Status",
CASE
--Adding the totals of each product category and finding the highest number--
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Alcohol") THEN 'Alcohol'
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Chocolate") THEN 'Chocolate'
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Commodities") THEN 'Commodities'
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Fish") THEN 'Fish'
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Meat") THEN 'Meat'
WHEN GREATEST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Vegetables") THEN 'Vegetables'
END AS "Most_Popular_Product",
CASE
--Adding the totals of each product category add finding the lowest number--
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Alcohol") THEN 'Alcohol'
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Chocolate") THEN 'Chocolate'
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Commodities") THEN 'Commodities'
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Fish") THEN 'Fish'
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Meat") THEN 'Meat'
WHEN LEAST(SUM("Alcohol"), SUM("Chocolate"), SUM("Commodities"), SUM("Fish"), SUM("Meat"), SUM("Vegetables")) = SUM("Vegetables") THEN 'Vegetables'
END AS "Least_Popular_Product"
FROM
public."Marketing_Data"
GROUP BY
"Marital_Status"
ORDER BY
"Marital_Status";

-- This script calculates the total revenue for each product category and returns -- 
-- the highest value and selects the product with the highest value by marital --
-- status using GROUPBY. --
-- The same is done for the lowest value in each product category --
