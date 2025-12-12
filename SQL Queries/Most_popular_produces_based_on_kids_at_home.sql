-- Which products are most popular based on kids or teens at home --
SELECT 
  CASE
  --Setting up two arguments, kids or teens at home & kids or teens not at home--
  --if kidhome or teenhome>0 then put the totals into 'kids or teens'--
  WHEN "Kidhome" > 0 OR "Teenhome" > 0 THEN 'Kids or Teens'
  --if kidhome or teenhome=0 then put totals into 'No kids or teens'--
 ELSE 'No Kids or Teens'
END AS "Kids or teens",
--Adding up the totals of each product group--
SUM("Alcohol") AS "Alcohol",
SUM("Chocolate") AS "Chocolate",
SUM("Commodities") AS "Commodities",
SUM("Fish") AS "Fish",
SUM("Meat") AS "Meat",
SUM("Vegetables") AS "Vegetables"
FROM
--Using the 'Marketing_Data' table--
public."Marketing_Data"
--Grouping the results by either 'kids at home' or 'no kids at home' by using the CASE function--
GROUP BY
  CASE
 WHEN "Kidhome" > 0 OR "Teenhome" > 0 THEN 'Kids or Teens'
  ELSE 'No Kids or Teens'
END
ORDER BY
"Kids or teens";

-- This script sets up two arguements 'kids or teens at home' and 'kids or teens --
-- not at home'. It then calculates total revenue for each product category and --
-- matches this with kid at home or not --
-- It uses the CASE clause to determine kids at home or not --