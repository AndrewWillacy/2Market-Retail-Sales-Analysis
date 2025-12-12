-- Which advertising method is the most effective by country --

SELECT
md."Country",

-- Most Effective Ad Method--
CASE
  WHEN GREATEST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Bulkmail_ad"::INT * md."Count_success") THEN 'Bulkmail'
   
  WHEN GREATEST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Twitter_ad"::INT * md."Count_success") THEN 'Twitter'
  WHEN GREATEST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Instagram_ad"::INT * md."Count_success") THEN 'Instagram'
  WHEN GREATEST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Facebook_ad"::INT * md."Count_success") THEN 'Facebook'
  WHEN GREATEST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Brochure_ad"::INT * md."Count_success") THEN 'Brochure'
  ELSE 'None'
END AS "Most_Effective_Ad_Method",

-- Least Effective Ad Method
CASE
  WHEN LEAST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Bulkmail_ad"::INT * md."Count_success") THEN 'Bulkmail'
  WHEN LEAST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
  ) = SUM(ad."Twitter_ad"::INT * md."Count_success") THEN 'Twitter'
  WHEN LEAST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Instagram_ad"::INT * md."Count_success") THEN 'Instagram'
  WHEN LEAST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Facebook_ad"::INT * md."Count_success") THEN 'Facebook'
  WHEN LEAST(
   SUM(ad."Bulkmail_ad"::INT * md."Count_success"),
   SUM(ad."Twitter_ad"::INT * md."Count_success"),
   SUM(ad."Instagram_ad"::INT * md."Count_success"),
   SUM(ad."Facebook_ad"::INT * md."Count_success"),
   SUM(ad."Brochure_ad"::INT * md."Count_success")
   ) = SUM(ad."Brochure_ad"::INT * md."Count_success") THEN 'Brochure'
  ELSE 'None'
END AS "Least_Effective_Ad_Method"

FROM "Marketing_Data" md
INNER JOIN "ad_data" ad ON md."ID" = ad."ID"
GROUP BY md."Country"
ORDER BY md."Country";

-- This script determines which advertising channel drives the most successful --
-- purchases per country. It incoporates alliases (shorthand to name tables) and --
-- uses an INNER JOIN to join the two tables using "ID" as the primary key. --
-- The script calculates how many customers are exposed to each advertising method --
-- and ended up converting. Boolan coverted to INT. 1=True, 0=fales. It uses  --
-- the GREATEST statement to find the highest effectiveness value. The top value -- 
-- for each advertising method is compared and the higest will be the most effective. --
-- This is multiplied by the "Count_Success" (how many successful purchases customers --
-- made. This only counts purchases where a customer responded to an add (conversion) --
-- Similarly with the least effective method only using the LEAST statement to --
-- find the lowest value. The results are then grouped (GROUPBY) by country --
-- This then gives the most and least successful advertising methods. Useful --
-- for budgeting --