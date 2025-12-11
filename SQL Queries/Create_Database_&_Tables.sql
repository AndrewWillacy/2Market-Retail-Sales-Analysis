-- Create the 2Market Database --

CREATE DATABASE "2Market";


-- Create table Marketing_Data --
CREATE TABLE "Marketing_Data" (
"ID" INTEGER PRIMARY KEY,
"Year_Birth" NUMERIC(4,0),
"Age" NUMERIC(3,0),
"Education" VARCHAR(20),
"Marital_Status" VARCHAR(20),
"Income_($)" NUMERIC(6,0),
"Kidhome" NUMERIC(1,0),
"Teenhome" NUMERIC(1,0),
"Dt_Customer" DATE,
"Recency" NUMERIC(2,0),
"Alcohol" NUMERIC(4,0),
"Vegetables" NUMERIC(4,0),
"Meat" NUMERIC(4,0),
"Fish" NUMERIC(4,0),
"Chocolate" NUMERIC(4,0),
"Commodities" NUMERIC(4,0),
"Total_Spend" NUMERIC(8,0),
"NumDeals" NUMERIC(2,0),
"NumWebBuy" NUMERIC(4,0),
"NumWalkinPur" NUMERIC(2,0),
"NumVisits" NUMERIC(2,0),
"Response" BOOLEAN,
"Complain" BOOLEAN,
"Country" VARCHAR(20),
"Count_success" NUMERIC(1,0)
);


-- Create the "ad_data" table --

CREATE TABLE "ad_data" (
"ID" INTEGER PRIMARY KEY,
"Bulkmail_ad" BOOLEAN,
"Twitter_ad" BOOLEAN,
"Instagram_ad" BOOLEAN,
"Facebook_ad" BOOLEAN,
"Brochure_ad" BOOLEAN);

-- Data is then imported into each table from csv files --