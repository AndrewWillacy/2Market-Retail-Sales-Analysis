-- Which advertising method is the most effective by marital status --

SELECT
md."Marital_Status",
--Adding up the sum of each ad and finding the highest number--
--Boolean (true/false) converted to integer 1/0)--

CASE
  WHEN GREATEST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Bulkmail_ad"::INT) THEN 'Bulkmail'
  WHEN GREATEST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT::INT), SUM("Brochure_ad"::INT)) = SUM("Twitter_ad"::INT) THEN 'Twitter'
  WHEN GREATEST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Instagram_ad"::INT) THEN 'Instagram'
  WHEN GREATEST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Facebook_ad"::INT) THEN 'Facebook'
  WHEN GREATEST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Brochure_ad"::INT) THEN 'Brochure'
END AS "Most_Popular_ad_method",

--Adding up the sum of each ad and finding the lowst number--
--Boolean (true/false) converted to integer 1/0)--

CASE
  WHEN LEAST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Bulkmail_ad"::INT) THEN 'Bulkmail'
  WHEN LEAST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Twitter_ad"::INT) THEN 'Twitter'
  WHEN LEAST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Instagram_ad"::INT) THEN 'Instagram'
  WHEN LEAST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT), SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT),
   SUM("Brochure_ad"::INT)) = SUM("Facebook_ad"::INT) THEN 'Facebook'
  WHEN LEAST(SUM("Bulkmail_ad"::INT), SUM("Twitter_ad"::INT),
   SUM("Instagram_ad"::INT), SUM("Facebook_ad"::INT), SUM("Brochure_ad"::INT)) = SUM("Brochure_ad"::INT) THEN 'Brochure'
END AS "Least_Popular_ad_method"

FROM "Marketing_Data" md
INNER JOIN "ad_data" ad
ON md."ID" = ad."ID"
GROUP BY
md."Marital_Status"
ORDER BY md."Marital_Status";

-- This script identifies which advertising method works the best by maritial --
-- status. It uses the JOIN function to create an inner join on the "ad.data" --
-- and "marketing_data" tables by the "ID" field. Links demographics with marketing --
-- responses. The "ad_data" table contains columns for each advertsing type, with --
-- the fields being BOOLAN (True/False). These are converted to integers (::INT) --
-- 1=True, 0=False. The total rsponmses for each boolan within the advertising methods --
-- is totalled. The highest count in each advertising method by marital status --
-- is the most popular, and the lowest count the least popular. --
-- This can then be used to advise the business on the most effective advertising --
-- method, dependent on marital status rather than using the same method for each --
-- customer, which woiuld be less effective and more costly. --
-- Future improvements included adding in response rates to each advetising method --
