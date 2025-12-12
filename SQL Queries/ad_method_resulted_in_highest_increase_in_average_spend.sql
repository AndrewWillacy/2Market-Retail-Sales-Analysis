-- Which advertising method resulted in the highest increase in average spend --

-- Adding a new column "Media" to the "ad_data" table --
ALTER TABLE public."ad_data"
ADD COLUMN "Media" VARCHAR(30);

-- Select everything from the "ad_data" table
SELECT * FROM public."ad_data";

-- Set Media as Bulkmail if "Bulkmail_ad"=1 --
UPDATE public."ad_data"
SET "Media" = 'BulkMail'
  WHERE "Bulkmail_ad"::int = 1;
  
--set Media as Twitter if "Twitter_ad"=1--
UPDATE public."ad_data"
SET "Media" = 'Twitter'
  WHERE "Twitter_ad"::int = 1;
  
--set Media as Instagram if "Instagram_ad"=1--
UPDATE public."ad_data"
SET "Media" = 'Instagram'
  WHERE "Instagram_ad"::int = 1;
  
--set Media as Facebook if "Facebook_ad"=1--
UPDATE public."ad_data"
SET "Media" = 'Facebook'
  WHERE "Facebook_ad"::int = 1;
  
--set Media as Brochure if "Brochure_ad"=1--
UPDATE public."ad_data"
SET "Media" = 'Brochure'
  WHERE "Brochure_ad"::int = 1;
  
--if "Media" = Null then set to'None'--
UPDATE public."ad_data"
SET "Media" = 'None'
  WHERE "Brochure_ad"::int=0 AND "Twitter_ad"::int=0 AND "Instagram_ad"::int=0
   AND "Facebook_ad"::int=0 AND "Brochure_ad"::int=0;
--select all media ads where customers were exposed to at least one--
--This doesn't take into account those customers who were exposed to multiple ad--
--it takes the last one checked as the media--

SELECT "Media" AS "Media_type",
  COUNT("ID") AS "Total_Customers",
   ROUND(AVG("Age"),0) AS "Avg_Age",
   ROUND(AVG("Income_($)"),2) AS "Avg_Income",
   ROUND(AVG("Total_Spend"),2) AS "Avg_Spend",
   ROUND(AVG("Alcohol"),2) AS "Avg_Alcohol",
   ROUND(AVG("Vegetables"),2) AS "Avg_veg",
   ROUND(AVG("Meat"),2) AS "Avg_Meat",
   ROUND(AVG("Fish"),2) AS "Avg Fish",
   ROUND(AVG("Chocolate"),2) AS "Avg Chocolate",
   ROUND(AVG("Commodities"),2) AS "Avg Commodities"
FROM public."Marketing_Data"
INNER JOIN public."ad_data" USING("ID")
GROUP BY "Media_type"
ORDER BY "Avg_Spend" DESC;

-- This script calculates which advertising method resulted in the highest increase --
-- in average spend. It follows on from the previous script. A new column "media"  --
-- is added to the "ad_data" table which will be populated with an advertising -- 
-- channel label per customer. UPDATE is used to populate the "Media" column with --
-- the advertising type a customer was exposed to. --
-- The two tables are joined using "ID" and then gouped by "media" --
-- The average spend in each advertising type is calculated and the results grouped --
-- by media (advertsing type) --